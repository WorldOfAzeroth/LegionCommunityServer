-- Trainers

-- Jewelcrafting Trainer Aleinia. Closes issue #78
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 8376;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8376, 0, 29);

-- First Aid Trainer Kanaria. Closes Issue #79
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 5856;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (5856, 0, 160);

-- Cooking Trainer Quarelestra and Sylann. Closes Issue #81, #82
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 5854;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (5854, 0, 136);

-- Tailoring Trainer Keelen Sheets. Closes Issue #83
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 8658;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8658, 0, 163);

-- Alchemy Trainer Camberon. Closes Issue #85
DELETE FROM `gossip_menu_option_trainer` WHERE MenuId = 8733;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8733,0 , 122);

-- Enchanting Trainer Sedana. Closes Issue #87
DELETE FROM `gossip_menu_option_trainer` WHERE MenuId = 8731;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8731, 0, 62);

-- Inscription Trainer Zantasia. Closes Issue #88
UPDATE `creature_template` SET `gossip_menu_id` = 9879, `npcflag` = 17 WHERE `creature_template`.`entry` = 30710;

-- Engineering Trainer Danwe. Closes Issue #89
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 8656;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8656, 0, 407);

-- Blacksmithing Trainer Bemarrin. Closes Issue #90
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 7494;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (7494, 0, 27);

-- Jewelcrafting Trainer Kalinda. Closes Issue #91
UPDATE `creature_template` SET `gossip_menu_id` = 9892 WHERE `creature_template`.`entry` = 19775;

-- Leatherworking Trainer Lynalis. Closes Issue #92
DELETE FROM `gossip_menu_option_trainer` WHERE MenuID = 8732;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8732, 0, 56);

-- Archaelogy Trainer Elynara. CLoses Issue #94
UPDATE `creature_template` SET `gossip_menu_id` = 12850 WHERE `creature_template`.`entry` = 47346;

-- Misc NPC's ( Vendors, Bankers etc... )

-- Silvermoon Bankers Ceera and Elana. Closes Issues #83, #84
DELETE FROM `gossip_menu_option` WHERE MenuId = 7812;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(7812, 0, 6, 'I would like to check my deposit box.', 0, 9, 131072, 0);

-- Guild Vendor Larissia. CLoses Issue #93
DELETE FROM `npc_vendor` WHERE entry = 51502;

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(51502, 1, 122260, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 2, 122261, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 3, 122262, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 4, 122266, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 5, 122245, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 6, 122246, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 7, 122247, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 8, 122248, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 9, 122249, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 10, 122250, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 11, 122263, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 12, 122251, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 13, 122252, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 14, 122253, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 15, 122254, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 16, 122255, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 17, 122256, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 18, 122264, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 19, 127011, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 20, 127012, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 21, 65498, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 22, 62800, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 23, 62799, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 24, 63125, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 25, 85666, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 26, 65360, 0, 0, 0, 1, NULL, 0, 0, 25881),
(51502, 27, 63206, 0, 0, 0, 1, NULL, 0, 0, 25881);

