-- Zarrin, Dolanaar Cooking Trainer fix.
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 2021;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(2021, 0, 3, 'I\d like to train in cooking.', 4988, 5, 16, 0);

-- Karn Stonehoof, Thunderbluss blacksmith trainer fix.

DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 1017;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (1017, 0, 27);

-- NPC Aska Mistrunner, Thunderbluff Cooking Trainer fix

DELETE FROM `creature_default_trainer` WHERE CreatureId = 3026;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 3026;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 3026;

INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(3026, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (3026, 0, 136);

-- Razor Hill Grunt Directions
UPDATE `gossip_menu_option` SET `OptionType` = 1, `OptionNpcFlag` = 1 WHERE `MenuId` = 3285; 

-- Gossip Menus
DELETE FROM `gossip_menu` WHERE `MenuId` BETWEEN 3286 AND 3300;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES 
(3286, 74284, 0),
(3287, 74285, 0),
(3288, 74286, 0),
(3289, 74287, 0),
(3290, 74288, 0),
(3291, 0, 0),
(3292, 74289, 0),
(3293, 74290, 0),
(3294, 74291, 0),
(3295, 74292, 0),
(3296, 74293, 0),
(3297, 74294, 0),
(3298, 74295, 0),
(3299, 74296, 0);

-- Gossip Menu Options
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 3291;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(3291, 0, 0, 'Hunter Trainer', 0, 1, 1, 0),
(3291, 1, 0, 'Rogue Trainer', 0, 1, 1, 0),
(3291, 2, 0, 'Mage Trainer', 0, 1, 1, 0),
(3291, 3, 0, 'Priest Trainer', 0, 1, 1, 0),
(3291, 4, 0, 'Shaman Trainer', 0, 1, 1, 0),
(3291, 5, 0, 'Warlock Trainer', 0, 1, 1, 0),
(3291, 6, 0, 'Warrior Trainer', 0, 1, 1, 0),
(3291, 7, 0, 'Druid Trainer', 0, 1, 1, 0);

-- Gossip Menu Actions
DELETE FROM `gossip_menu_option_action` WHERE `MenuId` in (3285, 3291);
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES 
(3285, 5, 3286, 10664),
(3285, 2, 3287, 10665),
(3285, 1, 3288, 10666),
(3285, 3, 3289, 10667),
(3285, 0, 3290, 0),
(3285, 4, 3291, 0),
(3291, 0, 3292, 10668),
(3291, 1, 3293, 10669),
(3291, 2, 3294, 10670),
(3291, 3, 3295, 10671),
(3291, 4, 3296, 10672),
(3291, 5, 3297, 10673),
(3291, 6, 3298, 10674),
(3291, 7, 3299, 10675);

-- Direction POI's
DELETE FROM `points_of_interest` WHERE `ID` BETWEEN 10664 AND 10675;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`, `VerifiedBuild`) VALUES 
(10664, 328.525, -4761.255, 7, 99, 0, 'Profession Trainer Runda', 0),
(10665, 337.722, -4689.666, 7, 99, 0, 'Innkeeper Grosk', 0),
(10666, 271.037, -4767.864, 7, 99, 0, 'Windrider Master Burok', 0),
(10667, 331.143, -4713.136, 7, 99, 0, 'Stable Master Shoja´my', 0),
(10668, 275.338, -4704.000, 7, 99, 0, 'Hunter Trainer Thotar', 0),
(10669, 268.128, -4710.939, 7, 99, 0, 'Rogue Trainer Kaplak', 0),
(10670, 334.717, -4767.620, 7, 99, 0, "Mage Trainer Un'thuwa", 0),
(10671, 294.884, -4831.500, 7, 99, 0, 'Priest Trainer Taijin', 0),
(10672, 307.114, -4839.910, 7, 99, 0, 'Shaman Trainer Swart', 0),
(10673, 356.191, -4837.950, 7, 99, 0, 'Warlock Trainer Dhugru Gorelust', 0),
(10674, 311.351, -4827.790, 7, 99, 0, 'Warrior Trainer Tharsaw Jaggedscar', 0),
(10675, 342.061, -4771.399, 7, 99, 0, 'Druid Trainer Jabul', 0);

-- NPC Texts
DELETE FROM `npc_text` WHERE `ID` BETWEEN 74284 AND 74296;
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`, `VerifiedBuild`) VALUES 
(74284, 0, 0, 0, 0, 0, 0, 0, 0, 74284, 0, 0, 0, 0, 0, 0, 0, 0),
(74285, 0, 0, 0, 0, 0, 0, 0, 0, 78616, 0, 0, 0, 0, 0, 0, 0, 0),
(74286, 0, 0, 0, 0, 0, 0, 0, 0, 78615, 0, 0, 0, 0, 0, 0, 0, 0),
(74287, 0, 0, 0, 0, 0, 0, 0, 0, 78617, 0, 0, 0, 0, 0, 0, 0, 0),
(74288, 0, 0, 0, 0, 0, 0, 0, 0, 6587, 0, 0, 0, 0, 0, 0, 0, 0),
(74289, 0, 0, 0, 0, 0, 0, 0, 0, 6556, 0, 0, 0, 0, 0, 0, 0, 0),
(74290, 0, 0, 0, 0, 0, 0, 0, 0, 6563, 0, 0, 0, 0, 0, 0, 0, 0),
(74291, 0, 0, 0, 0, 0, 0, 0, 0, 78621, 0, 0, 0, 0, 0, 0, 0, 0),
(74292, 0, 0, 0, 0, 0, 0, 0, 0, 6561, 0, 0, 0, 0, 0, 0, 0, 0),
(74293, 0, 0, 0, 0, 0, 0, 0, 0, 6564, 0, 0, 0, 0, 0, 0, 0, 0),
(74294, 0, 0, 0, 0, 0, 0, 0, 0, 6566, 0, 0, 0, 0, 0, 0, 0, 0),
(74295, 0, 0, 0, 0, 0, 0, 0, 0, 6569, 0, 0, 0, 0, 0, 0, 0, 0),
(74296, 0, 0, 0, 0, 0, 0, 0, 0, 53015, 0, 0, 0, 0, 0, 0, 0, 0);