-- Creature Template
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'boss_telash_greywing' WHERE `entry` = 186737;
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 197204;

DELETE FROM `creature` WHERE `guid` IN (9001901, 9001911, 9001917);
DELETE FROM `creature_addon` WHERE `guid` IN (9001901, 9001911, 9001917);

-- Creature Summon Group
DELETE FROM `creature_summon_groups` WHERE `summonerId` = 186737 AND `entry` = 197204;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`, `Comment`) VALUES
(186737, 0, 0, 197204, -5294.22, 1066.75, 339.632, 0, 8, 0, 'Telash Greywing - Group 0 - Vault Rune'),
(186737, 0, 0, 197204, -5358.12, 1103.33, 339.632, 0, 8, 0, 'Telash Greywing - Group 0 - Vault Rune'),
(186737, 0, 0, 197204, -5358.71, 1030.15, 339.632, 0, 8, 0, 'Telash Greywing - Group 0 - Vault Rune');

-- Creature Movement
DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (197204, 197643);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES
(197204, 0, 0, 1, 1, 0, 0, NULL),
(197643, 2, 0, 1, 1, 0, 0, NULL);



UPDATE `areatrigger_create_properties` SET `ScriptName` = 'at_telash_greywing_vault_rune' WHERE `Id` = 26586 AND `AreaTriggerId` = 30743;

-- Conversation
DELETE FROM `conversation_template` WHERE `Id` = 19967;
INSERT INTO `conversation_template` (`Id`, `FirstLineID`, `TextureKitId`, `VerifiedBuild`) VALUES
(19967, 51144, 0, 46879);

DELETE FROM `conversation_actors` WHERE `Idx`=0 AND `ConversationId` = 19967;
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `ConversationActorGuid`, `Idx`, `CreatureId`, `CreatureDisplayInfoId`, `NoActorObject`, `ActivePlayerObject`, `VerifiedBuild`) VALUES
(19967, 88079, 9001910, 0, 186737, 0, 0, 0, 46879); -- Full: 0x203CC93A60B65C400042AB0000090F76 Creature/0 R3890/S17067 Map: 2515 (The Azure Vault) Entry: 186737 (Telash Greywing) Low: 593782

DELETE FROM `conversation_line_template` WHERE `Id` = 51144;
INSERT INTO `conversation_line_template` (`Id`, `UiCameraID`, `ActorIdx`, `Flags`, `VerifiedBuild`) VALUES
(51144, 0, 0, 1, 46879);

-- Jump charge params
DELETE FROM `jump_charge_params` WHERE `id` IN (713, 714);
INSERT INTO `jump_charge_params` (`id`, `speed`, `treatSpeedAsMoveTimeSeconds`, `jumpGravity`, `spellVisualId`, `progressCurveId`, `parabolicCurveId`) VALUES
(713, 1.001, 1, 39.9201, NULL, NULL, NULL),
(714, 1.001, 1, 39.9201, NULL, NULL, NULL);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (389453, 386781, 386881, 387928, 390209, 388008);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(389453, 'spell_telash_ice_power_periodic'),
(386781, 'spell_telash_frost_bomb_cast'),
(386881, 'spell_telash_frost_bomb_aura'),
(387928, 'spell_telash_absolute_zero_cast'),
(390209, 'spell_telash_activate_vault_rune'),
(388008, 'spell_telash_absolute_zero_damage');

-- Creature Text
DELETE FROM `creature_text` WHERE `CreatureID` = 186737;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(186737, 0, 0, 'Did she send you? Enough!', 14, 0, 100, 0, 0, 208091, 229436, 0, 'Telash Greywing'),
(186737, 1, 0, 'Freeze!', 14, 0, 100, 0, 0, 208088, 229443, 0, 'Telash Greywing'),
(186737, 1, 1, 'Ice cold!', 14, 0, 100, 0, 0, 208089, 229444, 0, 'Telash Greywing'),
(186737, 2, 0, 'Her secrets will be mine!', 14, 0, 100, 0, 0, 208086, 229441, 0, 'Telash Greywing to Player'),
(186737, 3, 0, 'Now you will pay!', 14, 0, 100, 0, 0, 208087, 229445, 0, 'Telash Greywing'),
(186737, 4, 0, 'Telash Greywing begins casting |cFFFF0000|Hspell:388008|h[Absolute Zero]|h|r!', 41, 0, 100, 0, 0, 208087, 0, 0, 'Telash Greywing'),
(186737, 5, 0, 'She... lies...', 14, 0, 100, 0, 0, 208092, 229440, 0, 'Telash Greywing to Player');

-- Conditions
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 13 AND `SourceGroup` = 1 AND `SourceEntry` = 390209) OR (`SourceTypeOrReferenceId` = 13 AND `SourceGroup` = 1 AND `SourceEntry` = 388008) OR (`SourceTypeOrReferenceId` = 13 AND `SourceGroup` = 2 AND `SourceEntry` = 388008);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 390209, 0, 0, 31, 0, 3, 197204, 0, 0, 0, 0, '', 'Spell 390209 can only hit Vault Rune'),
(13, 1, 388008, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Spell 388008 can only hit Player'),
(13, 2, 388008, 0, 0, 31, 0, 3, 197204, 0, 0, 0, 0, '', 'Spell 388008 can only hit Vault Rune');
