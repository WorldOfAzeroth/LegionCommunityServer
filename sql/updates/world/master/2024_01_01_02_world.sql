-- Update Template
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_sanitron_5000' WHERE `entry` = 46185;

UPDATE `creature` SET `StringId` = 'SanitronLeft' WHERE `guid` = 304775;
UPDATE `creature` SET `StringId` = 'SanitronMiddle' WHERE `guid` = 304772;
UPDATE `creature` SET `StringId` = 'SanitronRight' WHERE `guid` = 304773;

UPDATE `creature` SET `StringId` = 'DecontaminationStageOne' WHERE `guid` IN (304788, 304784);
UPDATE `creature` SET `StringId` = 'DecontaminationStageTwo' WHERE `guid` IN (304782, 304787);
UPDATE `creature` SET `StringId` = 'DecontaminationStageThree' WHERE `guid` IN (304783, 304793);

UPDATE `creature` SET `StringId` = 'SafeTechnicianSayText' WHERE `guid` = 304777;
UPDATE `creature` SET `ScriptName` = 'npc_safe_technician_sanitron', `StringId` = 'SafeTechnicianSanitron' WHERE `guid` = 304803;

-- Update Template Addon
UPDATE `creature_template_addon` SET `SheathState`=2 WHERE `entry`=45847; -- 45847 (S.A.F.E. Operative)
UPDATE `creature_template_addon` SET `visibilityDistanceType`=3 WHERE `entry`=46208; -- 46208 (Clean Cannon X-2)

-- Creature Difficulty
UPDATE `creature_template_difficulty` SET `SandboxScalingId`=74, `VerifiedBuild`=52607 WHERE (`Entry`=46391 AND `DifficultyID`=0); -- Crazed Leper Gnome

-- Creature Text
DELETE FROM `creature_text` WHERE `CreatureID` = 46185;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(46185, 0, 0, 'Commencing decontamination sequence... ', 12, 0, 100, 0, 0, 0, 46323, 0, 'Sanitron 500 to Player'),
(46185, 1, 0, 'Decontamination complete. Standby for delivery.', 12, 0, 100, 0, 0, 0, 46324, 0, 'Sanitron 500 to Player'),
(46185, 2, 0, 'Warning, system overload. Malfunction imminent!', 12, 0, 100, 0, 0, 0, 46325, 0, 'Sanitron 500 to Player');

-- Creature Movement
DELETE FROM `creature_template_movement` WHERE `CreatureID` = 46185;
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES
(46185, 0, 0, 1, 0, 0, 0, NULL);

-- Quest stuff
DELETE FROM `quest_request_items` WHERE `ID`=27635;
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES
(27635, 0, 1, 0, 0, 'I bet you\'re feeling better already.', 52607); -- Decontamination

-- Condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 46185 AND `SourceEntry` = 86106;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 46185, 86106, 0, 0, 47, 0, 27635, 8, 0, 0, 0, 0, '', 'Allow Spellclick if Quest 27635 is in progress');

-- SendEvent: 26534
SET @EVENTID := 26534;
DELETE FROM `event_script_names` WHERE `Id` = @EVENTID;
INSERT INTO `event_script_names` (`Id`, `ScriptName`) VALUES
(@EVENTID, 'SmartEventTrigger');

DELETE FROM `smart_scripts` WHERE `source_type` = 3 AND `entryOrGuid` = @EVENTID;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@EVENTID, 3, 0, 0, 87, 0, 100, 0, 0, 0, 0, 0, 28, 80653, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On SendEvent: 26534 - remove Aura "Irradiated" - to self');

-- Path for Sanitron 5000 (left)
SET @ENTRY := 46185;
SET @PATHOFFSET := 0;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

-- Path for Sanitron 5000 (middle)
SET @ENTRY := 46185;
SET @PATHOFFSET := 1;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

-- Path for Sanitron 5000 (right)
SET @ENTRY := 46185;
SET @PATHOFFSET := 2;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;
