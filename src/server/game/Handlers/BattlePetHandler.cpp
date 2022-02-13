/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
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

#include "WorldSession.h"
#include "BattlePetMgr.h"
#include "BattlePetPackets.h"
#include "Player.h"

void WorldSession::HandleBattlePetRequestJournal(WorldPackets::BattlePet::BattlePetRequestJournal& /*battlePetRequestJournal*/)
{
    GetBattlePetMgr()->SendJournal();
}

void WorldSession::HandleBattlePetRequestJournalLock(WorldPackets::BattlePet::BattlePetRequestJournalLock& /*battlePetRequestJournalLock*/)
{
    GetBattlePetMgr()->SendJournalLockStatus();

    if (GetBattlePetMgr()->HasJournalLock())
        GetBattlePetMgr()->SendJournal();
}

void WorldSession::HandleBattlePetSetBattleSlot(WorldPackets::BattlePet::BattlePetSetBattleSlot& battlePetSetBattleSlot)
{
    if (BattlePets::BattlePet* pet = GetBattlePetMgr()->GetPet(battlePetSetBattleSlot.PetGuid))
        if (WorldPackets::BattlePet::BattlePetSlot* slot = GetBattlePetMgr()->GetSlot(BattlePets::BattlePetSlot(battlePetSetBattleSlot.Slot)))
            slot->Pet = pet->PacketInfo;
}

void WorldSession::HandleBattlePetModifyName(WorldPackets::BattlePet::BattlePetModifyName& battlePetModifyName)
{
    GetBattlePetMgr()->ModifyName(battlePetModifyName.PetGuid, battlePetModifyName.Name, std::move(battlePetModifyName.DeclinedNames));
}

void WorldSession::HandleBattlePetDeletePet(WorldPackets::BattlePet::BattlePetDeletePet& battlePetDeletePet)
{
    GetBattlePetMgr()->RemovePet(battlePetDeletePet.PetGuid);
}

void WorldSession::HandleBattlePetSetFlags(WorldPackets::BattlePet::BattlePetSetFlags& battlePetSetFlags)
{
    if (!GetBattlePetMgr()->HasJournalLock())
        return;

    if (BattlePets::BattlePet* pet = GetBattlePetMgr()->GetPet(battlePetSetFlags.PetGuid))
    {
        if (battlePetSetFlags.ControlType == BattlePets::FLAGS_CONTROL_TYPE_APPLY)
            pet->PacketInfo.Flags |= battlePetSetFlags.Flags;
        else // FLAGS_CONTROL_TYPE_REMOVE
            pet->PacketInfo.Flags &= ~battlePetSetFlags.Flags;

        if (pet->SaveInfo != BattlePets::BATTLE_PET_NEW)
            pet->SaveInfo = BattlePets::BATTLE_PET_CHANGED;
    }
}

void WorldSession::HandleBattlePetClearFanfare(WorldPackets::BattlePet::BattlePetClearFanfare& battlePetClearFanfare)
{
    GetBattlePetMgr()->ClearFanfare(battlePetClearFanfare.PetGuid);
}

void WorldSession::HandleCageBattlePet(WorldPackets::BattlePet::CageBattlePet& cageBattlePet)
{
    GetBattlePetMgr()->CageBattlePet(cageBattlePet.PetGuid);
}

void WorldSession::HandleBattlePetSummon(WorldPackets::BattlePet::BattlePetSummon& battlePetSummon)
{
    if (_player->GetGuidValue(PLAYER_FIELD_SUMMONED_BATTLE_PET_ID) != battlePetSummon.PetGuid)
        GetBattlePetMgr()->SummonPet(battlePetSummon.PetGuid);
    else
        GetBattlePetMgr()->DismissPet();
}

void WorldSession::HandleBattlePetUpdateNotify(WorldPackets::BattlePet::BattlePetUpdateNotify& battlePetUpdateNotify)
{
    GetBattlePetMgr()->UpdateBattlePetData(battlePetUpdateNotify.PetGuid);
}
