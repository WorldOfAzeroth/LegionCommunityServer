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

#include "ItemPacketsCommon.h"
#include "Item.h"
#include "Player.h"

bool WorldPackets::Item::ItemBonuses::operator==(ItemBonuses const& r) const
{
    if (Context != r.Context)
        return false;

    if (BonusListIDs.size() != r.BonusListIDs.size())
        return false;

    return std::is_permutation(BonusListIDs.begin(), BonusListIDs.end(), r.BonusListIDs.begin());
}

void WorldPackets::Item::ItemInstance::Initialize(::Item const* item)
{
    ItemID               = item->GetEntry();
    RandomPropertiesSeed = item->GetItemSuffixFactor();
    RandomPropertiesID   = item->GetItemRandomPropertyId();
    std::vector<int32> const& bonusListIds = item->GetBonuses();
    if (!bonusListIds.empty())
    {
        ItemBonus.emplace();
        ItemBonus->BonusListIDs.insert(ItemBonus->BonusListIDs.end(), bonusListIds.begin(), bonusListIds.end());
        ItemBonus->Context = item->GetContext();
    }

    if (uint32 mask = item->GetUInt32Value(ITEM_FIELD_MODIFIERS_MASK))
    {
        Modifications.emplace();

        for (size_t i = 0; mask != 0; mask >>= 1, ++i)
            if ((mask & 1) != 0)
                Modifications->Insert(i, item->GetModifier(ItemModifier(i)));
    }
}

void WorldPackets::Item::ItemInstance::Initialize(::ItemDynamicFieldGems const* gem)
{
    ItemID = gem->ItemId;

    ItemBonuses bonus;
    bonus.Context = ItemContext(gem->Context);
    for (int16 bonusListId : gem->BonusListIDs)
        if (bonusListId)
            bonus.BonusListIDs.push_back(bonusListId);

    if (bonus.Context != ItemContext::NONE || !bonus.BonusListIDs.empty())
        ItemBonus = bonus;
}

void WorldPackets::Item::ItemInstance::Initialize(::LootItem const& lootItem)
{
    ItemID = lootItem.itemid;

    if (!lootItem.BonusListIDs.empty() || lootItem.randomBonusListId)
    {
        ItemBonus.emplace();
        ItemBonus->BonusListIDs = lootItem.BonusListIDs;
        ItemBonus->Context = lootItem.context;
        if (lootItem.randomBonusListId)
            ItemBonus->BonusListIDs.push_back(lootItem.randomBonusListId);
    }
    if (lootItem.upgradeId)
    {
        Modifications.emplace();
        Modifications->Insert(ITEM_MODIFIER_UPGRADE_ID, lootItem.upgradeId);
    }
}

void WorldPackets::Item::ItemInstance::Initialize(::VoidStorageItem const* voidItem)
{
    ItemID = voidItem->ItemEntry;
    RandomPropertiesSeed = voidItem->ItemSuffixFactor;

    if (voidItem->ItemUpgradeId)
        Modifications->Insert(ITEM_MODIFIER_UPGRADE_ID, voidItem->ItemUpgradeId);

    if (voidItem->FixedScalingLevel)
        Modifications->Insert(ITEM_MODIFIER_TIMEWALKER_LEVEL, voidItem->FixedScalingLevel);

    if (voidItem->ArtifactKnowledgeLevel)
        Modifications->Insert(ITEM_MODIFIER_ARTIFACT_KNOWLEDGE_LEVEL, voidItem->ArtifactKnowledgeLevel);

    if (!voidItem->BonusListIDs.empty())
    {
        ItemBonus.emplace();
        ItemBonus->Context = voidItem->Context;
        ItemBonus->BonusListIDs = voidItem->BonusListIDs;
    }
}

bool WorldPackets::Item::ItemInstance::operator==(ItemInstance const& r) const
{
    if (ItemID != r.ItemID || RandomPropertiesID != r.RandomPropertiesID || RandomPropertiesSeed != r.RandomPropertiesSeed)
        return false;

    if (ItemBonus.has_value() != r.ItemBonus.has_value() || Modifications.has_value() != r.Modifications.has_value())
        return false;

    if (Modifications.has_value() && *Modifications != *r.Modifications)
        return false;

    if (ItemBonus.has_value() && *ItemBonus != *r.ItemBonus)
        return false;

    return true;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::Item::ItemBonuses const& ItemBonuses)
{
    data << uint8(ItemBonuses.Context);
    data << uint32(ItemBonuses.BonusListIDs.size());
    for (uint32 bonusID : ItemBonuses.BonusListIDs)
        data << uint32(bonusID);

    return data;
}

ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::Item::ItemBonuses& ItemBonuses)
{
    uint32 bonusListIdSize;

    ItemBonuses.Context = data.read<ItemContext>();
    data >> bonusListIdSize;

    for (uint32 i = 0u; i < bonusListIdSize; ++i)
    {
        uint32 bonusId;
        data >> bonusId;
        ItemBonuses.BonusListIDs.push_back(bonusId);
    }

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::Item::ItemInstance const& itemInstance)
{
    data << int32(itemInstance.ItemID);
    data << int32(itemInstance.RandomPropertiesSeed);
    data << int32(itemInstance.RandomPropertiesID);

    data.WriteBit(itemInstance.ItemBonus.has_value());
    data.WriteBit(itemInstance.Modifications.has_value());
    data.FlushBits();

    if (itemInstance.ItemBonus)
        data << *itemInstance.ItemBonus;

    if (itemInstance.Modifications)
        data << *itemInstance.Modifications;

    return data;
}

ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::Item::ItemInstance& itemInstance)
{
    data >> itemInstance.ItemID;
    data >> itemInstance.RandomPropertiesSeed;
    data >> itemInstance.RandomPropertiesID;

    bool hasItemBonus = data.ReadBit();
    bool hasModifications = data.ReadBit();
    data.ResetBitPos();

    if (hasItemBonus)
    {
        itemInstance.ItemBonus.emplace();
        data >> *itemInstance.ItemBonus;
    }

    if (hasModifications)
    {
        itemInstance.Modifications.emplace();
        data >> *itemInstance.Modifications;
    }

    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::Item::ItemEnchantData const& itemEnchantData)
{
    data << int32(itemEnchantData.ID);
    data << uint32(itemEnchantData.Expiration);
    data << int32(itemEnchantData.Charges);
    data << uint8(itemEnchantData.Slot);
    return data;
}

ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::Item::ItemGemData const& itemGemData)
{
    data << uint8(itemGemData.Slot);
    data << itemGemData.Item;
    return data;
}

ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::Item::ItemGemData& itemGemData)
{
    data >> itemGemData.Slot;
    data >> itemGemData.Item;
    return data;
}

ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::Item::InvUpdate& invUpdate)
{
    invUpdate.Items.resize(data.ReadBits(2));
    data.ResetBitPos();
    for (WorldPackets::Item::InvUpdate::InvItem& item : invUpdate.Items)
    {
        data >> item.ContainerSlot;
        data >> item.Slot;
    }

    return data;
}
