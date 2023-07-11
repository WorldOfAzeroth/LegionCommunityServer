-- From Neros Stash, rework by Sturm.
-- Quest: 27635 Decontamination

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE entry in (46185, 46165, 46320, 46208);
UPDATE `creature_template` SET `npcflag` = 16777216 AND `InhabitType` = 4 WHERE (entry = 46185);

-- 46185 Sanitron 500
-- Move the outer ones slightly to get out of the decontamination range.
UPDATE `creature` SET `position_x` = -5173.010, `position_y` = 735.55, `position_z` = 287.648 WHERE `creature`.`guid` = 304772;
UPDATE `creature` SET `position_x` = -5176.565, `position_y` = 735.55, `position_z` = 287.648 WHERE `creature`.`guid` = 304773;
UPDATE `creature` SET `position_x` = -5169.849, `position_y` = 735.55, `position_z` = 287.648 WHERE `creature`.`guid` = 304775;

-- Table smart_scripts
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 46185;

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 46185);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(46185, 0, 0, 1, 27, 0, 100, 512, 0, 0, 0, 0, '', 53, 0, 46185, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Passenger Boarded - Start Waypoint'),
(46185, 0, 1, 9, 61, 0, 100, 512, 0, 0, 0, 0, '', 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Passenger Boarded - Say Line 0'),
(46185, 0, 2, 3, 40, 0, 100, 512, 1, 46185, 0, 0, '', 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 1 Reached - Pause Waypoint'),
(46185, 0, 3, 0, 61, 0, 100, 512, 1, 46185, 0, 0, '', 45, 1, 1, 0, 0, 0, 0, 9, 46165, 1, 20, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 1 Reached - Set Data 1 1'),
(46185, 0, 4, 5, 40, 0, 100, 512, 2, 46185, 0, 0, '', 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 2 Reached - Pause Waypoint'),
(46185, 0, 5, 0, 61, 0, 100, 512, 2, 46185, 0, 0, '', 45, 1, 1, 0, 0, 0, 0, 9, 46208, 1, 20, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 2 Reached - Set Data 1 1'),
(46185, 0, 6, 7, 40, 0, 100, 512, 3, 46185, 0, 0, '', 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 3 Reached - Pause Waypoint'),
(46185, 0, 7, 8, 61, 0, 100, 512, 3, 46185, 0, 0, '', 45, 2, 2, 0, 0, 0, 0, 9, 46165, 1, 20, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 3 Reached - Set Data 2 2'),
(46185, 0, 8, 10, 61, 0, 100, 512, 3, 46185, 0, 0, '', 28, 80653, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 3 Reached - Remove Aura \'80653\''),
(46185, 0, 9, 0, 61, 0, 100, 512, 3, 46185, 0, 0, '', 11, 176908, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 3 Reached - Cast \'176908\''),
(46185, 0, 10, 0, 61, 0, 100, 512, 3, 46185, 0, 0, '', 80, 4618500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 3 Reached - Run Script'),
(46185, 0, 11, 12, 40, 0, 100, 512, 4, 46185, 0, 0, '', 54, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 4 Reached - Pause Waypoint'),
(46185, 0, 12, 0, 61, 0, 100, 512, 4, 46185, 0, 0, '', 80, 4618501, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 4 Reached - Run Script'),
(46185, 0, 14, 0, 40, 0, 100, 0, 2, 46185, 0, 0, '', 45, 0, 1, 0, 0, 0, 0, 10, 304781, 0, 0, 0, 0, 0, 0, 'Sanitron 500 - On Waypoint 2 Reached - Set Data 0 1');

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 4618500);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4618500, 9, 0, 0, 0, 0, 100, 0, 1500, 1500, 1500, 1500, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 1'),
(4618500, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 1500, 1500, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 2'),
(4618500, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 1500, 1500, 11, 88312, 4, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Cast \'88312\'');
-- WP4
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 4618501);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4618501, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 46230, 2, 10000, 0, 0, 0, 8, 0, 0, 0, -5184.87, 699.38, 288.08, 0, ' - Summon Creature \'S.A.F.E. Technician\''),
(4618501, 9, 1, 0, 0, 0, 100, 0, 300, 300, 300, 300, 51, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Kill Target'),
(4618501, 9, 2, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Despawn Instant');

-- Creature Text
DELETE FROM `creature_text` WHERE `CreatureID`=46185 AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (46185, 0, 0, 'Commencing decontamination sequence...', 12, 0, 100, 0, 0, 0, 46323, 0, 'Sanitron 500');
DELETE FROM `creature_text` WHERE `CreatureID`=46185 AND `GroupID`=1 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (46185, 1, 0, 'Decontamination complete. Standby for delivery.', 12, 0, 100, 0, 0, 0, 46324, 0, 'Sanitron 500');
DELETE FROM `creature_text` WHERE `CreatureID`=46185 AND `GroupID`=2 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (46185, 2, 0, 'Warning, system overload. Malfunction imminent!', 12, 0, 100, 0, 0, 0, 46325, 0, 'Sanitron 500');

-- Waypoints
DELETE FROM `waypoints` WHERE `entry`=46185 AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46185, 1, -5173.05, 724.966, 295.391, 'Sanitron 500 WP1');
DELETE FROM `waypoints` WHERE `entry`=46185 AND `pointid`=2;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46185, 2, -5173.86, 716.697, 288.976, 'Sanitron 500 WP2');
DELETE FROM `waypoints` WHERE `entry`=46185 AND `pointid`=3;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46185, 3, -5175.01, 704.428, 294.309, 'Sanitron 500 WP3');
DELETE FROM `waypoints` WHERE `entry`=46185 AND `pointid`=4;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46185, 4, -5175.331, 698.376, 288.100, 'Sanitron 500 WP4');

-- 46165 Decontamination Bunny ( Teslas above )

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 46165);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- first and second row teslas
(46165, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 86075, 4, 0, 0, 0, 0, 9, 46185, 1, 10, 0, 0, 0, 0, 'Decontamination Bunny - On Data Set 1 1 - Cast \'86075\''),
-- second and third row teslas
(46165, 0, 1, 0, 38, 0, 100, 0, 2, 2, 0, 0, 11, 86086, 4, 0, 0, 0, 0, 9, 46185, 1, 15, 0, 0, 0, 0, 'Decontamination Bunny - On Data Set 2 2 - Cast \'86086\'');

-- 46208 Clean Cannon X-2

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 46208);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(46208, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 3, 0, 27669, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Clean Cannon X-2 - On Respawn - Morph To Model 27669'),
(46208, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Clean Cannon X-2 - On Respawn - Set Orientation Home Position'),
(46208, 0, 2, 3, 38, 0, 100, 0, 1, 1, 0, 0, 11, 86080, 4, 0, 0, 0, 0, 9, 46185, 1, 13, 0, 0, 0, 0, 'Clean Cannon X-2 - On Data Set 1 1 - Cast \'86080\''),
(46208, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 86084, 4, 0, 0, 0, 0, 9, 46185, 1, 13, 0, 0, 0, 0, 'Clean Cannon X-2 - On Data Set 1 1 - Cast \'86084\'');

-- DELETING THE OLD STUFF
DELETE FROM `smart_scripts` WHERE entryorguid in (4623001, 462300);

-- SmartAI for the creature behind the console.
DELETE FROM `smart_scripts` WHERE (`entryorguid` = -304781) AND (`source_type` = 0) AND (`id` IN (0));
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-304781, 0, 0, 0, 38, 0, 100, 0, 0, 1, 0, 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'S.A.F.E. Technician - On Data Set 0 1 - Say Line 0');

-- Say Text for the creature behind the console.
DELETE FROM `creature_text` WHERE `CreatureID`=46230 AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (46230, 0, 0, 'Ugh! Not this again! I\'m asking for a new station next expedition...', 12, 0, 100, 1, 0, 0, 46342, 0, 'S.A.F.E. Technician');

-- At Sanitron 500 Waypoint 4 spawn a tech that will walk up to the exploded Sanitron and say a line
-- Creature Text
DELETE FROM `creature_text` WHERE `CreatureID`=46230 AND `GroupID`=1 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (46230, 1, 0, 'No, not the Sanitron... it was my pride and joy!', 12, 0, 100, 6, 0, 0, 46341, 0, 'S.A.F.E. Technician');

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 46230);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(46230, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, '', 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 25, -5176.61, 697.874, 288.084, 0.12, 'S.A.F.E. Technician - On Just Summoned - Move To Closest Creature \'Sanitron 500\''),
(46230, 0, 1, 2, 75, 0, 100, 1, 0, 46185, 2, 150, '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'S.A.F.E. Technician - On Distance To Creature - Say Line 0 (No Repeat)'),
(46230, 0, 2, 0, 61, 0, 100, 0, 0, 46185, 2, 150, '', 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'S.A.F.E. Technician - On Distance To Creature - Despawn In 5000 ms (No Repeat)');

--
--

-- 26318 Finishin The Job

-- 204042 Detonator
-- 204041 Powder Keg
-- 204047 Collapsing Boulders 200360

-- Editing the SmartAI script of [GameObject] ENTRY 204042 (name: Detonator)

-- Table gameobject_template
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 204042;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 1 AND entryorguid = 204042);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(204042, 1, 0, 1, 70, 0, 100, 0, 2, 0, 0, 0, 63, 1, 3000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Unused Action Type (63)'),
(204042, 1, 1, 2, 61, 0, 100, 0, 2, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235481, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 2, 3, 61, 0, 100, 0, 2, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235485, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235490, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235495, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 63, 2, 3000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Unused Action Type (63)'),
(204042, 1, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235482, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235483, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235484, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235486, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235487, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235488, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235489, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235491, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235492, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235493, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 16, 17, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235494, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235496, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 18, 19, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235497, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235498, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235499, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235500, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235501, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235502, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 24, 25, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 235503, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject'),
(204042, 1, 25, 0, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 14, 200360, 0, 0, 0, 0, 0, 0, 'Detonator - On Gameobject State Changed - Activate Gameobject');

--
--

-- 26364 Down with Crushcog!

-- 42860 razlo crushcog kill credit
-- 42849 High Tinker Mekkatorque
-- 42852 Mountaineer Stonegrind
-- 42839 Razlo Crushcog
-- 42294 Crushcog's Guardian

-- 58253 Orbital Targeting Device
-- 80101 Spell

-- Editing the SmartAI script of [Creature] ENTRY 42849 (name: High Tinker Mekkatorque)

-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 42849;

-- Table smart_scripts

DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 42849);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42849, 0, 0, 1, 62, 0, 100, 0, 11662, 0, 0, 0, '', 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High Tinker Mekkatorque - On Gossip Option 0 Selected - Close Gossip'),
(42849, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 80, 4284900, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'High Tinker Mekkatorque - On Gossip Option 0 Selected - Run Script'),
(42849, 0, 2, 3, 1, 0, 100, 0, 15000, 20000, 15000, 45000, '', 1, 5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'High Tinker Mekkatorque - Out of Combat - Say Line 5'),
(42849, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, '', 11, 80220, 4, 0, 0, 0, 0, 9, 42929, 0, 100, 0, 0, 0, 0, 'High Tinker Mekkatorque - Out of Combat - Cast \'80220\''),
(42849, 0, 4, 0, 38, 0, 100, 0, 2, 2, 0, 0, '', 80, 4284901, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'High Tinker Mekkatorque - On Data Set 2 2 - Run Script');


-- Editing the SmartAI script of [Timed Actionlist] 4284900

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 4284900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4284900, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Remove Npc Flags Gossip & Questgiver'),
(4284900, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 1500, 1500, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 0'),
(4284900, 9, 2, 0, 0, 0, 100, 0, 7000, 7000, 7000, 7000, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 1'),
(4284900, 9, 3, 0, 0, 0, 100, 0, 5500, 5500, 5500, 5500, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 2'),
(4284900, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 2000, 2000, 1, 0, 1, 0, 0, 0, 0, 9, 42852, 0, 15, 0, 0, 0, 0, ' - Say Line 0'),
(4284900, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 42852, 0, 15, 0, 0, 0, 0, ' - Set Data 1 1'),
(4284900, 9, 6, 0, 0, 0, 100, 0, 2000, 2000, 2000, 2000, 53, 0, 42849, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Start Waypoint'),
(4284900, 9, 7, 0, 0, 0, 100, 0, 25000, 25000, 25000, 25000, 1, 0, 1, 0, 0, 0, 0, 9, 42839, 0, 100, 0, 0, 0, 0, ' - Say Line 0'),
(4284900, 9, 8, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 1, 1, 1, 0, 0, 0, 0, 9, 42839, 0, 100, 0, 0, 0, 0, ' - Say Line 1'),
(4284900, 9, 9, 0, 0, 0, 100, 0, 8000, 8000, 8000, 8000, 1, 2, 1, 0, 0, 0, 0, 9, 42839, 0, 100, 0, 0, 0, 0, ' - Say Line 2');

-- Editing the SmartAI script of [Timed Actionlist] 4284901

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 4284901);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4284901, 9, 0, 0, 0, 0, 100, 0, 500, 500, 500, 500, 11, 79931, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Cast \'79931\''),
(4284901, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 1500, 1500, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 3'),
(4284901, 9, 2, 0, 0, 0, 100, 0, 7000, 7000, 7000, 7000, 1, 4, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Say Line 4'),
(4284901, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 7000, 7000, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ' - Despawn Instant');

-- Waypoints
DELETE FROM `waypoints` WHERE `entry`=42849;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(42849, 1, -5295.85, 135.21, 386.114, 'Mekkatorque WP'),
(42849, 2, -5267.78, 121.642, 393.49, 'Mekkatorque WP'),
(42849, 3, -5264.85, 120.969, 393.736, 'Mekkatorque WP');

-- Creature Text
DELETE FROM `creature_text` WHERE `CreatureID`=42849 AND `GroupID` BETWEEN 0 AND 8;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(42849, 0, 0, 'Mekgineer Thermaplugg refuses to acknowledge that his defeat is imminent! He has sent Razlo Crushcog to prevent us from rebuilding our beloved Gnomeregan!', 12, 0, 100, 5, 0, 20890, 42758, 0, 'High Tinker Mekkatorque'),
(42849, 1, 0, 'But $n has thwarted his plans at every turn, and the dwarves of Ironforge stand with us!', 12, 0, 100, 25, 0, 20891, 42759, 0, 'High Tinker Mekkatorque'),
 (42849, 2, 0, 'Let\'s send him crawling back to his master in defeat!', 12, 0, 100, 5, 0, 20892, 42760, 0, 'High Tinker Mekkatorque'),
 (42849, 3, 0, 'We\'ve done it! We\'re victorious!', 12, 0, 100, 5, 0, 20893, 42763, 0, 'High Tinker Mekkatorque'),
 (42849, 4, 0, 'With Crushcog defeated, Thermaplugg is sure to be quaking in his mechano-tank, and rightly so. You\'re next Thermaplugg. You\'re next!', 12, 0, 100, 5, 0, 20894, 42765, 0, 'High Tinker Mekkatorque'),
 (42849, 5, 0, 'Mekkatorque-Cannon!', 14, 0, 100, 0, 0, 0, 42829, 0, 'High Tinker Mekkatorque'),
 (42849, 6, 0, 'Mekkatorque-Ray!', 14, 0, 100, 0, 0, 0, 42832, 0, 'High Tinker Mekkatorque'),
 (42849, 7, 0, 'Mekkatorque-Missiles!', 14, 0, 100, 0, 0, 0, 42833, 0, 'High Tinker Mekkatorque'),
 (42849, 8, 0, 'Mekkatorque-Beam!', 14, 0, 100, 0, 0, 0, 42834, 0, 'High Tinker Mekkatorque');


-- Editing the SmartAI script of [Creature] ENTRY 42852 (name: Mountaineer Stonegrind)

-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 42852;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 42852);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42852, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 53, 0, 42852, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mountaineer Stonegrind - On Data Set 1 1 - Start Waypoint'),
(42852, 0, 1, 2, 38, 0, 100, 0, 2, 2, 0, 0, 1, 1, 3000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mountaineer Stonegrind - On Data Set 2 2 - Say Line 1'),
(42852, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 7000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mountaineer Stonegrind - On Data Set 2 2 - Despawn In 7000 ms');

-- Waypoints
DELETE FROM `waypoints` WHERE `entry`=42852;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(42852, 1, -5292.56, 140.199, 386.115, 'Stonegrind WP'),
(42852, 2, -5264.69, 129.356, 393.711, 'Stonegrind WP'),
(42852, 3, -5261.53, 127.506, 393.973, 'Stonegrind WP');

-- Creature Text
DELETE FROM `creature_text` WHERE `CreatureID`=42852 AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (42852, 0, 0, 'Aye, let\'s teach this addle-brained gnome a lesson!', 12, 0, 100, 25, 0, 0, 42767, 0, 'Mountaineer Stonegrind');
DELETE FROM `creature_text` WHERE `CreatureID`=42852 AND `GroupID`=1 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (42852, 1, 0, 'That\'ll teach you to mess with the might of Ironforge and Gnomeregan!', 12, 0, 100, 25, 0, 0, 42766, 0, 'Mountaineer Stonegrind');


-- Editing the SmartAI script of [Creature] ENTRY 42839 (name: Razlo Crushcog)

-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 42839;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 42839);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42839, 0, 0, 1, 8, 0, 100, 0, 80220, 0, 0, 0, 45, 2, 2, 0, 0, 0, 0, 9, 0, 0, 100, 0, 0, 0, 0, 'Razlo Crushcog - On Spellhit \'80220\' - Set Data 2 2'),
(42839, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Razlo Crushcog - On Spellhit \'80220\' - Kill Target');
