-- World Profession trainers. Closes Issues 80, 23, 15, 110, 2.
UPDATE `creature_template` SET `gossip_menu_id` = 500000 WHERE `creature_template`.`entry` in (47420, 47419, 47421, 47418, 47431);

-- Torenda, Food & Drink Vendor. ( Closes Issue #70)
DELETE FROM `npc_vendor` WHERE `entry` = 39031;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(39031, 1, 8766, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 2, 8952, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 3, 1645, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 4, 4599, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 5, 1708, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 6, 3771, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 7, 1205, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 8, 3770, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 9, 1179, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 10, 2287, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 11, 117, 0, 0, 0, 1, NULL, 0, 1, 0),
(39031, 12, 159, 0, 0, 0, 1, NULL, 0, 1, 0);

-- General Goods Vendor Gora'tin. ( Closes Issue #71 )
DELETE FROM `npc_vendor` WHERE `entry` = 39032;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(39032, 1, 4496, 0, 0, 0, 1, NULL, 0, 1, 0),
(39032, 2, 159, 0, 0, 0, 1, NULL, 0, 1, 0),
(39032, 3, 4540, 0, 0, 0, 1, NULL, 0, 1, 0);

-- Engineering Supplies Vendor Hugo Lentner. ( Closes Issue #126 )
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `gossip_menu_option`.`MenuId` = 698 AND `gossip_menu_option`.`OptionIndex` = 0;
DELETE FROM `npc_vendor` WHERE `entry` = 52637;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(52637, 1, 2901, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 2, 3466, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 3, 4357, 3, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 4, 4361, 1, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 5, 4363, 1, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 6, 4364, 4, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 7, 4371, 1, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 8, 4382, 1, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 9, 4389, 1, 9000, 0, 1, NULL, 0, 0, 0),
(52637, 10, 4399, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 11, 4400, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 12, 4404, 3, 10800, 0, 1, NULL, 0, 0, 0),
(52637, 13, 5956, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 14, 10647, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 15, 10648, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 16, 23799, 1, 43200, 0, 1, NULL, 0, 0, 0),
(52637, 17, 23811, 1, 43200, 0, 1, NULL, 0, 0, 0),
(52637, 18, 23815, 1, 43200, 0, 1, NULL, 0, 0, 0),
(52637, 19, 23816, 1, 43200, 0, 1, NULL, 0, 0, 0),
(52637, 20, 39684, 0, 0, 0, 1, NULL, 0, 0, 0),
(52637, 21, 40533, 0, 0, 0, 1, NULL, 0, 0, 0);

-- Innkeeper Kauth. ( Closes Issue #75)
DELETE FROM `gossip_menu_option` WHERE MenuId = 1294;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
-- Caregiver Chellan, Azure Watch Gossip fix. ( Closes Issue #54 )
(1294, 0, 0, 'Trick or Treat!', 10693, 1, 1, 0),
(1294, 2, 0, 'What can I do at an inn?', 4308, 1, 1, 26124),
(1294, 3, 5, 'Make this inn your home.', 2822, 8, 65536, 26124),
(1294, 4, 1, 'Let me browse your goods', 2823, 3, 128, 0);

-- Engineering Trainer Ockil ( Closes issue #125 )
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 8867;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8867, 0, 407);

-- Orgrimmar POI's and stuff
DELETE FROM `points_of_interest` WHERE ID = 10601;
INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`, `VerifiedBuild`) VALUES 
(10601, 1798.954, -4418.202, 7, 99, 0, 'Orgrimmar Battle Pet Trainer', 0);
DELETE FROM `gossip_menu` WHERE `MenuId` = 14951;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES (14951, 21138, 0);
