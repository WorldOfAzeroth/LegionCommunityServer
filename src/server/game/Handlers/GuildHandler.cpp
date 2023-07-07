/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
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
#include "AchievementPackets.h"
#include "Common.h"
#include "GameTime.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "GuildPackets.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Opcodes.h"
#include "Player.h"
#include "World.h"
#include "WorldPacket.h"

void WorldSession::HandleGuildQueryOpcode(WorldPackets::Guild::QueryGuildInfo& query)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_QUERY [{}]: Guild: {} Target: {}",
        GetPlayerInfo(), query.GuildGuid.ToString(), query.PlayerGuid.ToString());

    if (Guild* guild = sGuildMgr->GetGuildByGuid(query.GuildGuid))
    {
        guild->SendQueryResponse(this);
        return;
    }

    WorldPackets::Guild::QueryGuildInfoResponse response;
    response.GuildGuid = query.GuildGuid;
    SendPacket(response.Write());

    TC_LOG_DEBUG("guild", "SMSG_GUILD_QUERY_RESPONSE [{}]", GetPlayerInfo());
}

void WorldSession::HandleGuildInviteByName(WorldPackets::Guild::GuildInviteByName& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_INVITE [{}]: Invited: {}", GetPlayerInfo(), packet.Name);
    if (normalizePlayerName(packet.Name))
        if (Guild* guild = GetPlayer()->GetGuild())
            guild->HandleInviteMember(this, packet.Name);
}

void WorldSession::HandleGuildOfficerRemoveMember(WorldPackets::Guild::GuildOfficerRemoveMember& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_REMOVE [{}]: Target: {}", GetPlayerInfo(), packet.Removee.ToString());

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleRemoveMember(this, packet.Removee);
}

void WorldSession::HandleGuildAcceptInvite(WorldPackets::Guild::AcceptGuildInvite& /*invite*/)
{
    if (!GetPlayer()->GetGuildId())
        if (Guild* guild = sGuildMgr->GetGuildById(GetPlayer()->GetGuildIdInvited()))
            guild->HandleAcceptMember(this);
}

void WorldSession::HandleGuildDeclineInvitation(WorldPackets::Guild::GuildDeclineInvitation& /*decline*/)
{
    if (GetPlayer()->GetGuildId())
        return;

    GetPlayer()->SetGuildIdInvited(UI64LIT(0));
    GetPlayer()->SetInGuild(UI64LIT(0));
}

void WorldSession::HandleGuildGetRoster(WorldPackets::Guild::GuildGetRoster& /*packet*/)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleRoster(this);
    else
        Guild::SendCommandResult(this, GUILD_COMMAND_GET_ROSTER, ERR_GUILD_PLAYER_NOT_IN_GUILD);
}

void WorldSession::HandleGuildPromoteMember(WorldPackets::Guild::GuildPromoteMember& promote)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_PROMOTE [{}]: Target: {}", GetPlayerInfo(), promote.Promotee.ToString());

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleUpdateMemberRank(this, promote.Promotee, false);
}

void WorldSession::HandleGuildDemoteMember(WorldPackets::Guild::GuildDemoteMember& demote)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_DEMOTE [{}]: Target: {}", GetPlayerInfo(), demote.Demotee.ToString());

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleUpdateMemberRank(this, demote.Demotee, true);
}

void WorldSession::HandleGuildAssignRank(WorldPackets::Guild::GuildAssignMemberRank& packet)
{
    ObjectGuid setterGuid = GetPlayer()->GetGUID();

    TC_LOG_DEBUG("guild", "CMSG_GUILD_ASSIGN_MEMBER_RANK [{}]: Target: {} Rank: {}, Issuer: {}",
        GetPlayerInfo(), packet.Member.ToString(), packet.RankOrder, setterGuid.ToString());

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetMemberRank(this, packet.Member, setterGuid, GuildRankOrder(packet.RankOrder));
}

void WorldSession::HandleGuildLeave(WorldPackets::Guild::GuildLeave& /*leave*/)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleLeaveMember(this);
}

void WorldSession::HandleGuildDelete(WorldPackets::Guild::GuildDelete& /*packet*/)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleDelete(this);
}

void WorldSession::HandleGuildUpdateMotdText(WorldPackets::Guild::GuildUpdateMotdText& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_UPDATE_MOTD_TEXT [{}]: MOTD: {}", GetPlayerInfo(), packet.MotdText);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetMOTD(this, packet.MotdText);
}

void WorldSession::HandleGuildSetMemberNote(WorldPackets::Guild::GuildSetMemberNote& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_SET_NOTE [{}]: Target: {}, Note: {}, Public: {}",
        GetPlayerInfo(), packet.NoteeGUID.ToString(), packet.Note, packet.IsPublic);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetMemberNote(this, packet.Note, packet.NoteeGUID, packet.IsPublic);
}

void WorldSession::HandleGuildGetRanks(WorldPackets::Guild::GuildGetRanks& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_GET_RANKS [{}]: Guild: {}",
        GetPlayerInfo(), packet.GuildGUID.ToString());

    if (Guild* guild = sGuildMgr->GetGuildByGuid(packet.GuildGUID))
        if (guild->IsMember(_player->GetGUID()))
            guild->SendGuildRankInfo(this);
}

void WorldSession::HandleGuildAddRank(WorldPackets::Guild::GuildAddRank& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_ADD_RANK [{}]: Rank: {}", GetPlayerInfo(), packet.Name);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleAddNewRank(this, packet.Name);
}

void WorldSession::HandleGuildDeleteRank(WorldPackets::Guild::GuildDeleteRank& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_DELETE_RANK [{}]: Rank: {}", GetPlayerInfo(), packet.RankOrder);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleRemoveRank(this, GuildRankOrder(packet.RankOrder));
}

void WorldSession::HandleGuildUpdateInfoText(WorldPackets::Guild::GuildUpdateInfoText& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_UPDATE_INFO_TEXT [{}]: {}", GetPlayerInfo(), packet.InfoText);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetInfo(this, packet.InfoText);
}

void WorldSession::HandleSaveGuildEmblem(WorldPackets::Guild::SaveGuildEmblem& packet)
{
    EmblemInfo emblemInfo;
    emblemInfo.ReadPacket(packet);

    TC_LOG_DEBUG("guild", "CMSG_SAVE_GUILD_EMBLEM [{}]: Guid: [{}] Style: {}, Color: {}, BorderStyle: {}, BorderColor: {}, BackgroundColor: {}"
        , GetPlayerInfo(), packet.Vendor.ToString(), emblemInfo.GetStyle()
        , emblemInfo.GetColor(), emblemInfo.GetBorderStyle()
        , emblemInfo.GetBorderColor(), emblemInfo.GetBackgroundColor());

    if (GetPlayer()->GetNPCIfCanInteractWith(packet.Vendor, UNIT_NPC_FLAG_TABARDDESIGNER, UNIT_NPC_FLAG_2_NONE))
    {
        // Remove fake death
        if (GetPlayer()->HasUnitState(UNIT_STATE_DIED))
            GetPlayer()->RemoveAurasByType(SPELL_AURA_FEIGN_DEATH);

        if (!emblemInfo.ValidateEmblemColors())
        {
            Guild::SendSaveEmblemResult(this, ERR_GUILDEMBLEM_INVALID_TABARD_COLORS);
            return;
        }

        if (Guild* guild = GetPlayer()->GetGuild())
            guild->HandleSetEmblem(this, emblemInfo);
        else
            Guild::SendSaveEmblemResult(this, ERR_GUILDEMBLEM_NOGUILD); // "You are not part of a guild!";
    }
    else
        Guild::SendSaveEmblemResult(this, ERR_GUILDEMBLEM_INVALIDVENDOR); // "That's not an emblem vendor!"
}

void WorldSession::HandleGuildEventLogQuery(WorldPackets::Guild::GuildEventLogQuery& /*packet*/)
{
    TC_LOG_DEBUG("guild", "MSG_GUILD_EVENT_LOG_QUERY [{}]", GetPlayerInfo());

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->SendEventLog(this);
}

void WorldSession::HandleGuildBankMoneyWithdrawn(WorldPackets::Guild::GuildBankRemainingWithdrawMoneyQuery& /*packet*/)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->SendMoneyInfo(this);
}

void WorldSession::HandleGuildPermissionsQuery(WorldPackets::Guild::GuildPermissionsQuery& /* packet */)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->SendPermissions(this);
}

// Called when clicking on Guild bank gameobject
void WorldSession::HandleGuildBankActivate(WorldPackets::Guild::GuildBankActivate& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_ACTIVATE [{}]: [{}] AllSlots: {}"
        , GetPlayerInfo(), packet.Banker.ToString(), packet.FullUpdate);

    GameObject const* const go = GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK);
    if (!go)
        return;

    Guild* const guild = GetPlayer()->GetGuild();
    if (!guild)
    {
        Guild::SendCommandResult(this, GUILD_COMMAND_VIEW_TAB, ERR_GUILD_PLAYER_NOT_IN_GUILD);
        return;
    }

    guild->SendBankList(this, 0, packet.FullUpdate);
}

// Called when opening guild bank tab only (first one)
void WorldSession::HandleGuildBankQueryTab(WorldPackets::Guild::GuildBankQueryTab& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_QUERY_TAB [{}]: {}, TabId: {}, ShowTabs: {}"
        , GetPlayerInfo(), packet.Banker.ToString(), packet.Tab, packet.FullUpdate);

    if (GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK))
        if (Guild* guild = GetPlayer()->GetGuild())
            guild->SendBankList(this, packet.Tab, packet.FullUpdate);
}

void WorldSession::HandleGuildBankDepositMoney(WorldPackets::Guild::GuildBankDepositMoney& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_DEPOSIT_MONEY [{}]: [{}], money: " UI64FMTD,
        GetPlayerInfo(), packet.Banker.ToString(), packet.Money);

    if (GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK))
        if (packet.Money && GetPlayer()->HasEnoughMoney(packet.Money))
            if (Guild* guild = GetPlayer()->GetGuild())
                guild->HandleMemberDepositMoney(this, packet.Money);
}

void WorldSession::HandleGuildBankWithdrawMoney(WorldPackets::Guild::GuildBankWithdrawMoney& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_WITHDRAW_MONEY [{}]: [{}], money: " UI64FMTD,
        GetPlayerInfo(), packet.Banker.ToString(), packet.Money);

    if (packet.Money && GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK))
        if (Guild* guild = GetPlayer()->GetGuild())
            guild->HandleMemberWithdrawMoney(this, packet.Money);
}

void WorldSession::HandleGuildBankSwapItems(WorldPackets::Guild::GuildBankSwapItems& packet)
{
    if (!GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK))
        return;

    Guild* guild = GetPlayer()->GetGuild();
    if (!guild)
        return;

    if (packet.BankOnly)
    {
        guild->SwapItems(GetPlayer(), packet.BankTab1, packet.BankSlot1, packet.BankTab, packet.BankSlot, packet.StackCount);
    }
    else
    {
        // Player <-> Bank
        // Allow to work with inventory only
        if (!Player::IsInventoryPos(packet.ContainerSlot, packet.ContainerItemSlot) && !packet.AutoStore)
            GetPlayer()->SendEquipError(EQUIP_ERR_INTERNAL_BAG_ERROR, NULL);
        else
            guild->SwapItemsWithInventory(GetPlayer(), packet.ToSlot != 0, packet.BankTab, packet.BankSlot, packet.ContainerSlot, packet.ContainerItemSlot, packet.StackCount);
    }
}

void WorldSession::HandleGuildBankBuyTab(WorldPackets::Guild::GuildBankBuyTab& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_BUY_TAB [{}]: [{}[, TabId: {}", GetPlayerInfo(), packet.Banker.ToString(), packet.BankTab);

    if (!packet.Banker || GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK))
        if (Guild* guild = GetPlayer()->GetGuild())
            guild->HandleBuyBankTab(this, packet.BankTab);
}

void WorldSession::HandleGuildBankUpdateTab(WorldPackets::Guild::GuildBankUpdateTab& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_UPDATE_TAB [{}]: [{}], TabId: {}, Name: {}, Icon: {}"
        , GetPlayerInfo(), packet.Banker.ToString(), packet.BankTab, packet.Name, packet.Icon);

    if (!packet.Name.empty() && !packet.Icon.empty())
        if (GetPlayer()->GetGameObjectIfCanInteractWith(packet.Banker, GAMEOBJECT_TYPE_GUILD_BANK))
            if (Guild* guild = GetPlayer()->GetGuild())
                guild->HandleSetBankTabInfo(this, packet.BankTab, packet.Name, packet.Icon);
}

void WorldSession::HandleGuildBankLogQuery(WorldPackets::Guild::GuildBankLogQuery& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_LOG_QUERY [{}]: TabId: {}", GetPlayerInfo(), packet.Tab);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->SendBankLog(this, packet.Tab);
}

void WorldSession::HandleGuildBankTextQuery(WorldPackets::Guild::GuildBankTextQuery& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_GUILD_BANK_QUERY_TEXT [{}]: TabId: {}", GetPlayerInfo(), packet.Tab);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->SendBankTabText(this, packet.Tab);
}

void WorldSession::HandleGuildBankSetTabText(WorldPackets::Guild::GuildBankSetTabText& packet)
{
    TC_LOG_DEBUG("guild", "CMSG_SET_GUILD_BANK_TEXT [{}]: TabId: {}, Text: {}", GetPlayerInfo(), packet.Tab, packet.TabText);

    if (Guild* guild = GetPlayer()->GetGuild())
        guild->SetBankTabText(packet.Tab, packet.TabText);
}

void WorldSession::HandleGuildSetRankPermissions(WorldPackets::Guild::GuildSetRankPermissions& packet)
{
    Guild* guild = GetPlayer()->GetGuild();
    if (!guild)
        return;

    std::array<GuildBankRightsAndSlots, GUILD_BANK_MAX_TABS> rightsAndSlots;
    for (uint8 tabId = 0; tabId < GUILD_BANK_MAX_TABS; ++tabId)
        rightsAndSlots[tabId] = GuildBankRightsAndSlots(tabId, uint8(packet.TabFlags[tabId]), uint32(packet.TabWithdrawItemLimit[tabId]));

    TC_LOG_DEBUG("guild", "CMSG_GUILD_SET_RANK_PERMISSIONS [%s]: Rank: %s (%u)", GetPlayerInfo().c_str(), packet.RankName.c_str(), packet.RankOrder);

    guild->HandleSetRankInfo(this, GuildRankId(packet.RankID), packet.RankName, packet.Flags, packet.WithdrawGoldLimit, rightsAndSlots);
}

void WorldSession::HandleGuildRequestPartyState(WorldPackets::Guild::RequestGuildPartyState& packet)
{
    if (Guild* guild = sGuildMgr->GetGuildByGuid(packet.GuildGUID))
        guild->HandleGuildPartyRequest(this);
}

void WorldSession::HandleGuildChallengeUpdateRequest(WorldPackets::Guild::GuildChallengeUpdateRequest& /*packet*/)
{
    if (Guild* guild = _player->GetGuild())
        guild->HandleGuildRequestChallengeUpdate(this);
}

void WorldSession::HandleDeclineGuildInvites(WorldPackets::Guild::DeclineGuildInvites& packet)
{
    if (packet.Allow)
        GetPlayer()->SetPlayerFlag(PLAYER_FLAGS_AUTO_DECLINE_GUILD);
    else
        GetPlayer()->RemovePlayerFlag(PLAYER_FLAGS_AUTO_DECLINE_GUILD);
}

void WorldSession::HandleRequestGuildRewardsList(WorldPackets::Guild::RequestGuildRewardsList& /*packet*/)
{
    if (sGuildMgr->GetGuildById(_player->GetGuildId()))
    {
        std::vector<GuildReward> const& rewards = sGuildMgr->GetGuildRewards();

        WorldPackets::Guild::GuildRewardList rewardList;
        rewardList.Version = GameTime::GetSystemTime();
        rewardList.RewardItems.reserve(rewards.size());

        for (uint32 i = 0; i < rewards.size(); i++)
        {
            WorldPackets::Guild::GuildRewardItem rewardItem;
            rewardItem.ItemID = rewards[i].ItemID;
            rewardItem.RaceMask = rewards[i].RaceMask;
            rewardItem.MinGuildLevel = 0;
            rewardItem.MinGuildRep = rewards[i].MinGuildRep;
            rewardItem.AchievementsRequired = rewards[i].AchievementsRequired;
            rewardItem.Cost = rewards[i].Cost;
            rewardList.RewardItems.push_back(rewardItem);
        }

        SendPacket(rewardList.Write());
    }
}

void WorldSession::HandleGuildQueryNews(WorldPackets::Guild::GuildQueryNews& newsQuery)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        if (guild->GetGUID() == newsQuery.GuildGUID)
            guild->SendNewsUpdate(this);
}

void WorldSession::HandleGuildNewsUpdateSticky(WorldPackets::Guild::GuildNewsUpdateSticky& packet)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleNewsSetSticky(this, packet.NewsID, packet.Sticky);
}

void WorldSession::HandleGuildReplaceGuildMaster(WorldPackets::Guild::GuildReplaceGuildMaster& /*replaceGuildMaster*/)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetNewGuildMaster(this, "", true);
}

void WorldSession::HandleGuildSetGuildMaster(WorldPackets::Guild::GuildSetGuildMaster& packet)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetNewGuildMaster(this, packet.NewMasterName, false);
}

void WorldSession::HandleGuildSetAchievementTracking(WorldPackets::Guild::GuildSetAchievementTracking& packet)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleSetAchievementTracking(this, packet.AchievementIDs.data(), packet.AchievementIDs.data() + packet.AchievementIDs.size());
}

void WorldSession::HandleGuildGetAchievementMembers(WorldPackets::Achievement::GuildGetAchievementMembers& getAchievementMembers)
{
    if (Guild* guild = GetPlayer()->GetGuild())
        guild->HandleGetAchievementMembers(this, uint32(getAchievementMembers.AchievementID));
}
