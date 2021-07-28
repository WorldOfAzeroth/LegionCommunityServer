-- Hippogryph Master Laando, Bloodmyst Isle. Closes Issue #114

UPDATE `gossip_menu_option` SET `OptionType` = 4, `OptionNpcFlag` = 8195 WHERE `gossip_menu_option`.`MenuId` = 7470 AND `gossip_menu_option`.`OptionIndex` = 0;

-- Quartermaster Kadu. Closes Issue #115
DELETE FROM `npc_vendor` WHERE `entry` = 50306;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(50306, 1, 67527, 0, 0, 0, 1, NULL, 0, 1, 0),
(50306, 2, 64889, 0, 0, 0, 1, null, 0, 1, 0),
(50306, 3, 64890, 0, 0, 0, 1, null, 0, 1, 0),
(50306, 4, 64891, 0, 0, 0, 1, null, 0, 1, 0),
(50306, 5, 45580, 0, 0, 0, 1, null, 0, 1, 0);

-- Herbalism Trainer Cemmorhan. Closes Issue #116
UPDATE `creature_template` SET `gossip_menu_id` = 7691, `npcflag` = 81 WHERE `creature_template`.`entry` = 16737;

-- Alchemy Trainer Lucc. Closes Issue #117
UPDATE `creature_template` SET `gossip_menu_id` = 4133, `npcflag` = 83 WHERE `creature_template`.`entry` = 16723;

-- Cooking Trainer Zarrin refix ( Issue #16 )

DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 6286;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(6286, 0, 136);
UPDATE `creature_template` SET `npcflag` = 17 WHERE `creature_template`.`entry` = 6286;

-- Engineering Trainer Tana Lentner. ( Closes Issue #119 )
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 8517;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (8517, 0, 407);

-- Inscription Trainer Feyden Darkin. ( Closes Issue #120 )
UPDATE `creature_template` SET `gossip_menu_id` = 9879, `npcflag` = 80 WHERE `creature_template`.`entry` = 30715;

-- Leatherworking Trainer Telonis. ( Closes Issue #121 )
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 4241;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (4241, 0, 56);

-- Skinning Trainer Eladriel. ( Closes Issue #122 )
UPDATE `creature_template` SET `gossip_menu_id` = 7842, `npcflag` = 80 WHERE `creature_template`.`entry` = 6292;

-- Tailoring Trainer Kil'hala. ( Closes Issue #123 )
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = 4270;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (4270, 0, 163);

-- Skinning Trainer Radnaal Maneweaver. ( Closes Issue #124 )
UPDATE `creature_template` SET `gossip_menu_id` = 7842, `npcflag` = 80 WHERE `creature_template`.`entry` = 6287;

-- Mining Supplies Vendor Rissa Halding. Closes Issue #118
DELETE FROM `npc_vendor` WHERE `entry` = 52643;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES 
(52643, 1, 30746, 0, 0, 0, 1, NULL, 0, 1, 0),
(52643, 2, 3857, 0, 0, 0, 1, NULL, 0, 1, 0),
(52643, 3, 3466, 0, 0, 0, 1, NULL, 0, 1, 0),
(52643, 4, 20815, 0, 0, 0, 1, NULL, 0, 1, 0),
(52643, 5, 2880, 0, 0, 0, 1, NULL, 0, 1, 0),
(52643, 6, 2901, 0, 0, 0, 1, NULL, 0, 1, 0);

-- Bloodfeather Matriarch fix ( fixes an error in previous commit)
UPDATE `creature_template` SET `npcflag` = 0 WHERE `creature_template`.`entry` = 2021;
DELETE FROM `gossip_menu_option_trainer` WHERE MenuId = 2021;