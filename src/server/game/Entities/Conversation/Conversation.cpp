/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Conversation.h"
#include "ConditionMgr.h"
#include "Containers.h"
#include "ConversationDataStore.h"
#include "Creature.h"
#include "DB2Stores.h"
#include "IteratorPair.h"
#include "Log.h"
#include "Map.h"
#include "PhasingHandler.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "UpdateData.h"

Conversation::Conversation() : WorldObject(false), _duration(0), _textureKitId(0)
{
    m_objectType |= TYPEMASK_CONVERSATION;
    m_objectTypeId = TYPEID_CONVERSATION;

    m_updateFlag = UPDATEFLAG_STATIONARY_POSITION;

    m_valuesCount = CONVERSATION_END;
    _dynamicValuesCount = CONVERSATION_DYNAMIC_END;
    _lastLineEndTimes.fill(Milliseconds::zero());
}

Conversation::~Conversation() = default;

void Conversation::AddToWorld()
{
    ///- Register the Conversation for guid lookup and for caster
    if (!IsInWorld())
    {
        GetMap()->GetObjectsStore().Insert<Conversation>(GetGUID(), this);
        WorldObject::AddToWorld();
    }
}

void Conversation::RemoveFromWorld()
{
    ///- Remove the Conversation from the accessor and from all lists of objects in world
    if (IsInWorld())
    {
        WorldObject::RemoveFromWorld();
        GetMap()->GetObjectsStore().Remove<Conversation>(GetGUID());
    }
}

void Conversation::Update(uint32 diff)
{
    if (GetDuration() > Milliseconds(diff)) {
        _duration -= Milliseconds(diff);
    } else {
        Remove(); // expired
        return;
    }
    WorldObject::Update(diff);
}

void Conversation::Remove()
{
    if (IsInWorld())
    {
        AddObjectToRemoveList(); // calls RemoveFromWorld
    }
}

Conversation* Conversation::CreateConversation(uint32 conversationEntry, Unit* creator, Position const& pos, ObjectGuid privateObjectOwner, SpellInfo const* spellInfo /*= nullptr*/, bool autoStart /*= true*/)
{
    ConversationTemplate const* conversationTemplate = sConversationDataStore->GetConversationTemplate(conversationEntry);
    if (!conversationTemplate)
        return nullptr;

    ObjectGuid::LowType lowGuid = creator->GetMap()->GenerateLowGuid<HighGuid::Conversation>();

    Conversation* conversation = new Conversation();
    conversation->Create(lowGuid, conversationEntry, creator->GetMap(), creator, pos, privateObjectOwner, spellInfo);
    if (autoStart && !conversation->Start())
    {
        delete conversation;
        return nullptr;
    }

    return conversation;
}

struct ConversationActorFillVisitor
{
    explicit ConversationActorFillVisitor(Conversation* conversation, Unit const* creator, Map const* map, ConversationActorTemplate const& actor)
        : _conversation(conversation), _creator(creator), _map(map), _actor(actor)
    {
    }

    void operator()(ConversationActorWorldObjectTemplate const& worldObject) const
    {
        Creature const* bestFit = nullptr;

        for (auto const& [_, creature] : Trinity::Containers::MapEqualRange(_map->GetCreatureBySpawnIdStore(), worldObject.SpawnId))
        {
            bestFit = creature;

            // If creature is in a personal phase then we pick that one specifically
            if (creature->GetPhaseShift().GetPersonalGuid() == _creator->GetGUID())
                break;
        }

        if (bestFit)
            _conversation->AddActor(_actor.Id, _actor.Index, bestFit->GetGUID());
    }

    void operator()(ConversationActorNoObjectTemplate const& noObject) const
    {
        _conversation->AddActor(_actor.Id, _actor.Index, ConversationActorType::WorldObject, noObject.CreatureId, noObject.CreatureDisplayInfoId);
    }

    void operator()([[maybe_unused]] ConversationActorActivePlayerTemplate const& activePlayer) const
    {
        _conversation->AddActor(_actor.Id, _actor.Index, ObjectGuid::Create<HighGuid::Player>(0xFFFFFFFFFFFFFFFF));
    }

    void operator()(ConversationActorTalkingHeadTemplate const& talkingHead) const
    {
        _conversation->AddActor(_actor.Id, _actor.Index, ConversationActorType::TalkingHead, talkingHead.CreatureId, talkingHead.CreatureDisplayInfoId);
    }

private:
    Conversation* _conversation;
    Unit const* _creator;
    ::Map const* _map;
    ConversationActorTemplate const& _actor;
};

void Conversation::Create(ObjectGuid::LowType lowGuid, uint32 conversationEntry, Map* map, Unit* creator, Position const& pos, ObjectGuid privateObjectOwner, SpellInfo const* /*spellInfo = nullptr*/)
{
    ConversationTemplate const* conversationTemplate = sConversationDataStore->GetConversationTemplate(conversationEntry);
    ASSERT(conversationTemplate);

    _creatorGuid = creator->GetGUID();
    SetPrivateObjectOwner(privateObjectOwner);

    SetMap(map);
    Relocate(pos);
    RelocateStationaryPosition(pos);

    Object::_Create(ObjectGuid::Create<HighGuid::Conversation>(GetMapId(), conversationEntry, lowGuid));
    PhasingHandler::InheritPhaseShift(this, creator);

    UpdatePositionData();
    SetZoneScript();

    SetEntry(conversationEntry);
    SetObjectScale(1.0f);

    _textureKitId = conversationTemplate->TextureKitId;

    for (ConversationActorTemplate const& actor : conversationTemplate->Actors)
        std::visit(ConversationActorFillVisitor(this, creator, map, actor), actor.Data);
    
    std::vector<UF::ConversationLine> lines;
    for (ConversationLineTemplate const* line : conversationTemplate->Lines)
    {
        if (!sConditionMgr->IsObjectMeetingNotGroupedConditions(CONDITION_SOURCE_TYPE_CONVERSATION_LINE, line->Id, creator))
            continue;

        lines.emplace_back();

        UF::ConversationLine& lineField = lines.back();
        lineField.ConversationLineID = line->Id;
        lineField.UiCameraID = line->UiCameraID;
        lineField.ActorIndex = line->ActorIdx;
        lineField.Flags = line->Flags;

        ConversationLineEntry const* convoLine = sConversationLineStore.LookupEntry(line->Id); // never null for conversationTemplate->Lines
        for (LocaleConstant locale = LOCALE_enUS; locale < TOTAL_LOCALES; locale = LocaleConstant(locale + 1))
        {
            if (locale == LOCALE_none)
                continue;

            _lineStartTimes[{ locale, line->Id }] = _lastLineEndTimes[locale];
            if (locale == DEFAULT_LOCALE)
                lineField.StartTime = _lastLineEndTimes[locale].count();

            _lastLineEndTimes[locale] += Milliseconds(convoLine->AdditionalDuration);
        }
        AddDynamicStructuredValue(CONVERSATION_DYNAMIC_FIELD_LINES, line);
    }

    _duration = Milliseconds(*std::max_element(_lastLineEndTimes.begin(), _lastLineEndTimes.end()));
    SetUInt32Value(CONVERSATION_LAST_LINE_END_TIME, _duration.count());

    // conversations are despawned 5-20s after LastLineEndTime
    _duration += 10s;

    sScriptMgr->OnConversationCreate(this, creator);

}

bool Conversation::Start()
{
    const DynamicFieldStructuredView<UF::ConversationLine> &view = GetDynamicStructuredValues<UF::ConversationLine>(
            CONVERSATION_DYNAMIC_FIELD_LINES);
    for (const auto &line : view) {
        UF::ConversationActor const* actor = GetDynamicStructuredValue<UF::ConversationActor>(CONVERSATION_DYNAMIC_FIELD_ACTORS, line.ActorIndex);
        if (!actor || (!actor->CreatureID && actor->ActorGUID.IsEmpty() && !actor->NoActorObject))
        {
            TC_LOG_ERROR("entities.conversation", "Failed to create conversation (Id: {}) due to missing actor (Idx: {}).", GetEntry(), line.ActorIndex);
            return false;
        }
    }

    if (!GetMap()->AddToMap(this))
        return false;

    return true;
}

void Conversation::AddActor(int32 actorId, uint32 actorIdx, ObjectGuid const& actorGuid)
{
    UF::ConversationActor actorField;
    actorField.ActorGUID = actorGuid;
    actorField.Id = actorId;
    actorField.Type = AsUnderlyingType(ConversationActorType::WorldObject);
    SetDynamicStructuredValue(CONVERSATION_DYNAMIC_FIELD_ACTORS, actorIdx, &actorField);
}

void Conversation::AddActor(int32 actorId, uint32 actorIdx, ConversationActorType type, uint32 creatureId, uint32 creatureDisplayInfoId)
{
    UF::ConversationActor actorField;
    actorField.CreatureID = creatureId;
    actorField.CreatureDisplayInfoID = creatureDisplayInfoId;
    actorField.ActorGUID = ObjectGuid::Empty;
    actorField.Id = actorId;
    actorField.Type = AsUnderlyingType(type);
    actorField.NoActorObject = type == ConversationActorType::WorldObject ? 1 : 0;
    SetDynamicStructuredValue(CONVERSATION_DYNAMIC_FIELD_ACTORS, actorIdx, &actorField);
}

Milliseconds const* Conversation::GetLineStartTime(LocaleConstant locale, int32 lineId) const
{
    return Trinity::Containers::MapGetValuePtr(_lineStartTimes, { locale, lineId });
}

Milliseconds Conversation::GetLastLineEndTime(LocaleConstant locale) const
{
    return _lastLineEndTimes[locale];
}

uint32 Conversation::GetScriptId() const
{
    return sConversationDataStore->GetConversationTemplate(GetEntry())->ScriptId;
}
