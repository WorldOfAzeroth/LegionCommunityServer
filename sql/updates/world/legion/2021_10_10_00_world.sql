-- Author: Art1kwerg@Celestial-WoW / CWSturm

-- Remove obsolete items: Issue #356, Issue #364, Issue #366
DELETE FROM `npc_vendor` WHERE `item` IN (3372, 8925, 10648, 18256, 20824, 39501, 39502, 40411);
-- Vendor: Zargh
-- Update gossip
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `MenuId` = 4341 AND `OptionIndex` = 0;
DELETE FROM npc_vendor WHERE entry = 3489;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(3489,1,117,0,0,0,1, NULL,0,0,1),
(3489,2,3735,0,0,0,1, NULL,0,0,1),
(3489,3,2287,0,0,0,1, NULL,0,0,1),
(3489,4,3770,0,0,0,1, NULL,0,0,1),
(3489,5,3771,0,0,0,1, NULL,0,0,1),
(3489,6,4599,0,0,0,1, NULL,0,0,1),
(3489,7,8952,0,0,0,1, NULL,0,0,1);

-- Vendor Billibub Cogspinner
DELETE FROM npc_vendor WHERE entry = 5519;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(5519,1,59477,0,0,3392,1, NULL,0,0,1),
(5519,2,59478,0,0,3311,1, NULL,0,0,1),
(5519,3,59479,0,0,3311,1, NULL,0,0,1),
(5519,4,59480,0,0,3308,1, NULL,0,0,1),
(5519,5,59489,0,0,3310,1, NULL,0,0,1),
(5519,6,59491,0,0,3305,1, NULL,0,0,1),
(5519,7,59493,0,0,3307,1, NULL,0,0,1),
(5519,8,59496,0,0,3306,1, NULL,0,0,1),
(5519,9,68660,0,0,5962,1, NULL,0,0,1),
(5519,10,40533,0,0,0,1, NULL,0,0,1),
(5519,11,39684,0,0,0,1, NULL,0,0,1),
(5519,12,90146,0,0,0,1, NULL,0,0,1),
(5519,13,10647,0,0,0,1, NULL,0,0,1),
(5519,14,4389,1,600000,0,1, NULL,0,0,1),
(5519,15,4382,1,600000,0,1, NULL,0,0,1),
(5519,16,3466,0,0,0,1, NULL,0,0,1),
(5519,17,4400,0,0,0,1, NULL,0,0,1),
(5519,18,4371,2,600000,0,1, NULL,0,0,1),
(5519,19,4404,3,600000,0,1, NULL,0,0,1),
(5519,20,4364,4,600000,0,1, NULL,0,0,1),
(5519,21,4361,2,600000,0,1, NULL,0,0,1),
(5519,22,4399,0,0,0,1, NULL,0,0,1),
(5519,23,6219,0,0,0,1, NULL,0,0,1),
(5519,24,2880,0,0,0,1, NULL,0,0,1),
(5519,25,4357,4,600000,0,1, NULL,0,0,1),
(5519,26,2901,0,0,0,1, NULL,0,0,1),
(5519,27,5956,0,0,0,1, NULL,0,0,1),
(5519,28,39354,0,0,0,1, NULL,0,0,1);

-- Little Azimi
-- Update gossip
UPDATE gossip_menu_option SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `MenuId` = 8243 AND `OptionIndex` = 0;

DELETE FROM npc_vendor WHERE entry = 21145;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(21145,1,8766,0,0,0,1, NULL,0,0,1),
(21145,2,8953,0,0,0,1, NULL,0,0,1),
(21145,3,1645,0,0,0,1, NULL,0,0,1),
(21145,4,4602,0,0,0,1, NULL,0,0,1),
(21145,5,1708,0,0,0,1, NULL,0,0,1),
(21145,6,4539,0,0,0,1, NULL,0,0,1),
(21145,7,1205,0,0,0,1, NULL,0,0,1),
(21145,8,4538,0,0,0,1, NULL,0,0,1),
(21145,9,1179,0,0,0,1, NULL,0,0,1),
(21145,10,4537,0,0,0,1, NULL,0,0,1),
(21145,11,159,0,0,0,1, NULL,0,0,1),
(21145,12,4536,0,0,0,1, NULL,0,0,1);

-- Layna Karner
DELETE FROM npc_vendor WHERE entry = 52641;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(52641,1,66100,0,0,3314,1, NULL,0,0,1),
(52641,2,66101,0,0,3314,1, NULL,0,0,1),
(52641,3,66122,0,0,3314,1, NULL,0,0,1),
(52641,4,66123,0,0,3314,1, NULL,0,0,1),
(52641,5,66124,0,0,3314,1, NULL,0,0,1),
(52641,6,66130,0,0,3314,1, NULL,0,0,1),
(52641,7,66131,0,0,3314,1, NULL,0,0,1),
(52641,8,66132,0,0,3314,1, NULL,0,0,1),
(52641,9,18567,0,0,0,1, NULL,0,0,1),
(52641,10,3857,0,0,0,1, NULL,0,0,1),
(52641,11,3466,0,0,0,1, NULL,0,0,1),
(52641,12,2880,0,0,0,1, NULL,0,0,1),
(52641,13,2901,0,0,0,1, NULL,0,0,1),
(52641,14,5956,0,0,0,1, NULL,0,0,1),
(52641,15,12162,1,800000,0,1, NULL,0,0,1),
(52641,16,66103,0,0,3312,1, NULL,0,0,1),
(52641,17,66104,0,0,3313,1, NULL,0,0,1),
(52641,18,66105,0,0,3312,1, NULL,0,0,1),
(52641,19,66106,0,0,3313,1, NULL,0,0,1),
(52641,20,66107,0,0,3312,1, NULL,0,0,1),
(52641,21,66108,0,0,3313,1, NULL,0,0,1),
(52641,22,66109,0,0,3312,1, NULL,0,0,1),
(52641,23,66110,0,0,3313,1, NULL,0,0,1),
(52641,24,66111,0,0,3313,1, NULL,0,0,1),
(52641,25,66112,0,0,3313,1, NULL,0,0,1),
(52641,26,66113,0,0,3313,1, NULL,0,0,1),
(52641,27,66114,0,0,3313,1, NULL,0,0,1),
(52641,28,66115,0,0,3313,1, NULL,0,0,1),
(52641,29,66116,0,0,3313,1, NULL,0,0,1),
(52641,30,66117,0,0,3312,1, NULL,0,0,1),
(52641,31,66118,0,0,3312,1, NULL,0,0,1),
(52641,32,66119,0,0,3312,1, NULL,0,0,1),
(52641,33,66120,0,0,3313,1, NULL,0,0,1),
(52641,34,66121,0,0,3313,1, NULL,0,0,1),
(52641,35,66125,0,0,3312,1, NULL,0,0,1),
(52641,36,66126,0,0,3312,1, NULL,0,0,1),
(52641,37,66127,0,0,3312,1, NULL,0,0,1),
(52641,38,66128,0,0,3313,1, NULL,0,0,1),
(52641,39,66129,0,0,3313,1, NULL,0,0,1),
(52641,40,67603,0,0,3313,1, NULL,0,0,1),
(52641,41,67606,0,0,3314,1, NULL,0,0,1);

-- Narkk
-- update gossip
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `MenuId` = 11743 AND `OptionIndex` = 1;
DELETE FROM npc_vendor WHERE entry = 2663;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(2663,1,8495,0,0,0,1, NULL,0,0,1),
(2663,2,8496,0,0,0,1, NULL,0,0,1),
(2663,3,10728,1,900000,0,1, NULL,0,0,1);

-- Mrs. Gant
-- Update gossip
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `MenuId` = 12838 AND `OptionIndex` = 1;
-- Update trainer gossip
DELETE FROM `gossip_menu_option_trainer` WHERE MenuId = 12838;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (12838, 0, 136);

DELETE FROM `npc_vendor` WHERE entry = 54232;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(54232,1,2678,0,0,0,1, NULL,0,0,1),
(54232,2,30817,0,0,0,1, NULL,0,0,1),
(54232,3,159,0,0,0,1, NULL,0,0,1),
(54232,4,16767,1,600000,0,1, NULL,0,0,1),
(54232,5,21099,0,0,0,1, NULL,0,0,1),
(54232,6,21219,0,0,0,1, NULL,0,0,1);

-- Gordo
-- Update gossip
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `MenuId` = 11159 AND `OptionIndex` = 0;
-- Update npc flags
UPDATE `creature_template` SET `npcflag` = 4227 WHERE `creature_template`.`entry` = 10666;
DELETE FROM `npc_vendor` WHERE `entry` = 10666;  
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES
(10666,1,4604,0,0,0,1, NULL,0,0,1),
(10666,2,4605,0,0,0,1, NULL,0,0,1),
(10666,3,4606,0,0,0,1, NULL,0,0,1),
(10666,4,4607,0,0,0,1, NULL,0,0,1),
(10666,5,4608,0,0,0,1, NULL,0,0,1),
(10666,6,8948,0,0,0,1, NULL,0,0,1);

-- Gordon Wendham
-- Update gossip
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `MenuId` = 4283 AND `OptionIndex` = 0;
DELETE FROM `npc_vendor` WHERE `entry` = 4556;  
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES
(4556,1,1194,0,0,0,1, NULL,0,0,1),
(4556,2,2130,0,0,0,1, NULL,0,0,1),
(4556,3,2131,0,0,0,1, NULL,0,0,1),
(4556,4,2132,0,0,0,1, NULL,0,0,1),
(4556,5,2134,0,0,0,1, NULL,0,0,1),
(4556,6,2139,0,0,0,1, NULL,0,0,1),
(4556,7,2479,0,0,0,1, NULL,0,0,1),
(4556,8,2480,0,0,0,1, NULL,0,0,1),
(4556,9,2488,0,0,0,1, NULL,0,0,1),
(4556,10,2490,0,0,0,1, NULL,0,0,1),
(4556,11,2491,0,0,0,1, NULL,0,0,1),
(4556,12,2493,0,0,0,1, NULL,0,0,1),
(4556,13,2494,0,0,0,1, NULL,0,0,1),
(4556,14,2495,0,0,0,1, NULL,0,0,1),
(4556,15,2489,0,0,0,1, NULL,0,0,1),
(4556,16,2492,0,0,0,1, NULL,0,0,1);

-- Kramlod Farsight
DELETE FROM npc_vendor WHERE entry = 44040;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(44040,1,2504,0,0,0,1, NULL,0,0,1),
(44040,2,2505,0,0,0,1, NULL,0,0,1),
(44040,3,2506,0,0,0,1, NULL,0,0,1),
(44040,4,2509,0,0,0,1, NULL,0,0,1),
(44040,5,2511,0,0,0,1, NULL,0,0,1),
(44040,6,2507,0,0,0,1, NULL,0,0,1),
(44040,7,3023,0,0,0,1, NULL,0,0,1),
(44040,8,3026,0,0,0,1, NULL,0,0,1),
(44040,9,3024,0,0,0,1, NULL,0,0,1),
(44040,10,3027,0,0,0,1, NULL,0,0,1),
(44040,11,3025,0,0,0,1, NULL,0,0,1);

-- William Saldean
-- Update gossip
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 10408;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (10408, 1, 133);
DELETE FROM npc_vendor WHERE entry = 33996;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(33996,1,8950,0,0,0,1, NULL,0,0,1),
(33996,2,4601,0,0,0,1, NULL,0,0,1),
(33996,3,4544,0,0,0,1, NULL,0,0,1),
(33996,4,4542,0,0,0,1, NULL,0,0,1),
(33996,5,4541,0,0,0,1, NULL,0,0,1),
(33996,6,4540,0,0,0,1, NULL,0,0,1),
(33996,7,11109,0,0,0,1, NULL,0,0,1);

-- NPC Areyn ( removed from game, patch 7.0.3, this is all but a peacekeepers lie, she will never be obsolete!)
DELETE FROM `creature` WHERE `id` = 12805;

-- Lieutenant Karter
DELETE FROM npc_vendor WHERE entry = 12783;
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost, type, BonusListIDs, PlayerConditionID, IgnoreFiltering, VerifiedBuild) VALUES
(12783,1,29465,0,0,5976,1, NULL,0,0,1),
(12783,2,29467,0,0,5976,1, NULL,0,0,1),
(12783,3,29468,0,0,5976,1, NULL,0,0,1),
(12783,4,29471,0,0,5976,1, NULL,0,0,1),
(12783,5,35906,0,0,5976,1, NULL,0,0,1);
