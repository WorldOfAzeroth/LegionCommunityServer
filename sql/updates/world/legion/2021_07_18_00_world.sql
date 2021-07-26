DELETE FROM `creature_loot_template` WHERE Entry = 478 AND Item = 57122;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) 
VALUES (478, 57122, 0, 100, 1, 1, 0, 1, 1, 'Wanted: James Clark');
UPDATE `creature_template` SET `lootid` = 478 WHERE `creature_template`.`entry` = 13159;
UPDATE `quest_template` SET `ItemDrop1` = 57122, `ItemDropQuantity1` = 1 WHERE `quest_template`.`ID` = 26152;