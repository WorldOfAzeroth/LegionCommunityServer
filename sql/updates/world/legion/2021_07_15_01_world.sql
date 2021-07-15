-- NPC Traugh, Crossroads Blacksmithing Trainer fix ( Closes Issue #33 )

DELETE FROM `world`.`creature_default_trainer` WHERE `CreatureId` = 3478;
DELETE FROM `world`.`gossip_menu_option_trainer` WHERE `MenuId` = 3478;
DELETE FROM `world`.`creature_template` WHERE `entry` = 3478;
DELETE FROM `world`.`gossip_menu_option` WHERE `MenuId` = 3478;

INSERT INTO `world`.`gossip_menu_option_trainer` (`MenuId`, `TrainerId`) VALUES (3478, 27);
INSERT INTO `world`.`gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES 
(3478, 0, 3, 'Train me.', 3266, 5, 17, 0);
INSERT INTO `world`.`creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_class`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(3478, 0, 0, 0, 0, 0, 3865, 0, 0, 0, 'Traugh', '', 'Blacksmithing Trainer', NULL, NULL, 3478, 31, 31, 0, 0, 0, 29, 17, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 512, 2048, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1.1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 2, '', 25549);