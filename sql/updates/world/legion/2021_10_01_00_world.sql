-- Creature Texts
DELETE FROM `creature_text` WHERE `CreatureID` = 39157;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(39157, 0, 0, '%s yips in appreciation', 16, 0, 100, 0, 0, 0, 37760, 0,'Lost Bloodtalon Hatchling'),
(39157, 0, 1, '%s bounces up and down.', 16, 0, 20, 0, 0, 0, 37761, 0, 'Lost Bloodtalon Hatchling'),
(39157, 0, 2, '%s lets out a little screech.', 16, 0, 20, 0, 0, 0, 37762, 0, 'Lost Bloodtalon Hatchling'),
(39157, 0, 3, '%s waves its horn at you.', 16, 0, 20, 0, 0, 0, 37763, 0, 'Lost Bloodtalon Hatchling'),
(39157, 0, 4, '%s skips after you.', 16, 0, 20, 0, 0, 0, 37764, 0, 'Lost Bloodtalon Hatchling'),
(39157, 0, 5, '%s almost falls on his face in excitement.', 16, 0, 20, 0, 0, 0, 37765, 0, 'Lost Bloodtalon Hatchling'),
(39157, 0, 6, '%s taps his little claws on the ground as he runs ...', 16, 0, 20, 0, 0, 0, 37766, 0, 'Lost Bloodtalon Hatchling'),
(39157, 0, 7, '%s bobbles after you happily.', 16, 0, 20, 0, 0, 0, 37732, 0, 'Lost Bloodtalon Hatchling');


-- Lost Bloodtalon Hatchling
SET @ENTRY := 39157;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,70874,0,0,0,29,0,0,38003,24623,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Lost Bloodtalon Hatchling - On Spellhit '70874' - Start Follow Invoker"),
(@ENTRY,@SOURCETYPE,1,0,65,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Lost Bloodtalon Hatchling - On Follow Complete - Despawn Instant"),
(@ENTRY,@SOURCETYPE,2,0,8,0,20,1,70874,0,0,0,1,0,200,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Lost Bloodtalon Hatchling - On Spellhit '70874' - Say Line (No Repeat)"),
(@ENTRY,@SOURCETYPE,3,0,8,0,100,0,70874,0,0,0,33,39157,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Lost Bloodtalon Hatchling - On Spellhit '70783' - Give kill credit");