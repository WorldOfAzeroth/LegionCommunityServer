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

#ifndef ConversationDataStore_h__
#define ConversationDataStore_h__

#include "Define.h"
#include "ObjectGuid.h"
#include <variant>
#include <vector>

enum class ConversationActorType : uint32
{
    WorldObject = 0,
    TalkingHead = 1
};

struct ConversationActorWorldObjectTemplate
{
    ObjectGuid::LowType SpawnId = 0;
};

struct ConversationActorNoObjectTemplate
{
    uint32 CreatureId = 0;
    uint32 CreatureDisplayInfoId = 0;
};

struct ConversationActorActivePlayerTemplate
{
};

struct ConversationActorTalkingHeadTemplate
{
    uint32 CreatureId = 0;
    uint32 CreatureDisplayInfoId = 0;
};

struct ConversationActorTemplate
{
    int32 Id = 0;
    uint32 Index = 0;
    std::variant<ConversationActorWorldObjectTemplate,
                 ConversationActorNoObjectTemplate,
                 ConversationActorActivePlayerTemplate,
                 ConversationActorTalkingHeadTemplate> Data;
};

enum ConversationLineFlags
{
    CONVERSATION_LINE_FLAG_NOTIFY_STARTED = 0x1 // Client will send CMSG_CONVERSATION_LINE_STARTED when it runs this line
};

struct ConversationLineTemplate
{
    uint32 Id;          // Link to ConversationLine.db2
    uint32 UiCameraID;  // Link to UiCamera.db2
    uint8 ActorIdx;     // Index from conversation_actors
    uint8 Flags;
    uint8 ChatType;
};

struct ConversationTemplate
{
    uint32 Id;
    uint32 FirstLineId;     // Link to ConversationLine.db2
    uint32 TextureKitId;    // Background texture

    std::vector<ConversationActorTemplate> Actors;
    std::vector<ConversationLineTemplate const*> Lines;

    uint32 ScriptId;
};

struct ConversationLine {
    int32 ConversationLineID;
    uint32 StartTime;
    int32 UiCameraID;
    uint8 ActorIndex;
    uint8 Flags;
    uint8 ChatType;
};

struct ConversationActor {
    uint32 CreatureID;
    uint32 CreatureDisplayInfoID;
    ObjectGuid ActorGUID;
    int32 Id;
    uint32 Type;
    uint32 NoActorObject;
};

class TC_GAME_API ConversationDataStore
{
public:
    void LoadConversationTemplates();

    ConversationTemplate const* GetConversationTemplate(uint32 conversationId) const;
    ConversationLineTemplate const* GetConversationLineTemplate(uint32 conversationLineId) const;

    static ConversationDataStore* Instance();
};

#define sConversationDataStore ConversationDataStore::Instance()

#endif // ConversationDataStore_h__
