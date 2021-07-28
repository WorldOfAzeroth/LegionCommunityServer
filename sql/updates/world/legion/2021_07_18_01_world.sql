-- Trainers

-- Herbalism Trainer Reyna Stonebranch. Closes Issue #95
UPDATE `creature_template` SET `gossip_menu_id` = 7691, `npcflag` = 81 WHERE `creature_template`.`entry` = 5137;

-- First Aid Trainer Nissa Firestone. Closes Issue #96
UPDATE `creature_template` SET `gossip_menu_id` = 5855 WHERE `creature_template`.`entry` = 5150;

-- Jewelcrafting Trainer Hanner Gembold. Closes Issue #97
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 9895;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (9895, '0', 29);
UPDATE `creature_template` SET `gossip_menu_id` = 9895, `npcflag` = 81 WHERE `creature_template`.`entry` = 52586;

-- Mining Trainer Geofram Bouldertoe. Closes Issue #98
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `creature_template`.`entry` = 4254;

-- Enchanting Trainer Alanna Raveneye. Closes Issue #99
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 4156;
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 4156 AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (4156, 0, 62);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(4156, 0, 3, 'Train me.', 3266, 5, 16, 0);

-- Mining Trainer Periale. Closes Issue #101
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `creature_template`.`entry` = 43431;

-- First Aid Trainer Anchorite Paetheus. Closes Issue #102
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `creature_template`.`entry` = 17424;

-- Riding Trainer Jartsam. Closes Issue #103
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 4019;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (4019, 0, 46);
UPDATE `creature_template` SET `npcflag` = 83 WHERE `creature_template`.`entry` = 4753;

-- Enchanting Trainer Taladan. Closes Issue #104
UPDATE `creature_template` SET `gossip_menu_id` = 4156, `npcflag` = 81 WHERE `creature_template`.`entry` = 4213;

-- Alchemy Trainer Ainethil. Closes Issue #105
UPDATE `creature_template` SET `gossip_menu_id` = 4133, `npcflag` = 83 WHERE `creature_template`.`entry` = 4160;

-- First Aid Trainer Angela Leifeld. Closes Issue #107
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `creature_template`.`entry` = 56796;

-- Jewelcrafting Trainer Farii. Closes Issue #108
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 8382;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8382, 0, 29);
UPDATE `creature_template` SET `npcflag` = '81' WHERE `creature_template`.`entry` = 19778;

-- Blacksmithing Trainer Taryel Firestrike. Closes Issue #109

UPDATE `creature_template` SET `gossip_menu_id` = 2744, `npcflag` = 81 WHERE `creature_template`.`entry` = 43429;

-- Blacksmithing Trainer Dwukk. Closes Issue #111
UPDATE `creature_template` SET `gossip_menu_id` = 2744, `npcflag` = 81 WHERE `creature_template`.`entry` = 3174;

-- Engineering Trainer Mudrak. Closes Issue #112
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuID` = 4142;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (4142, 0, 407);

-- Vendors

-- Enchanting Supply Vendor Draelan. Closes Issue #100
DELETE FROM `npc_vendor` WHERE `entry` = 44030;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(44030, 195, 4470, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 192, 6217, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 194, 10938, 2, 7200, 0, 1, NULL, 0, 0, 25881), 
(44030, 193, 10940, 3, 7200, 0, 1, NULL, 0, 0, 25881), 
(44030, 196, 11291, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 198, 20752, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 199, 20753, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 197, 20758, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 200, 22307, 0, 0, 0, 1, NULL, 0, 0, 25881), 
(44030, 191, 38682, 0, 0, 0, 1, NULL, 0, 0, 25881);

-- Jewelcrafting Supplies Vendor Tarien Silverdew. Closes Issue #106
DELETE FROM `npc_vendor` WHERE `entry`= 52644;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(52644, 0, 7337, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 7338, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 7339, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 7340, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 7341, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 7342, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 20815, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 20824, 0, 0, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 20854, 1, 9000, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 20856, 1, 9000, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 20975, 1, 9000, 0, 1, NULL, 0, 0, 0), 
(52644, 0, 21948, 1, 9000, 0, 1, NULL, 0, 0, 0);
