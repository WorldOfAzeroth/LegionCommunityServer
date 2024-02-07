-- free CGUID
-- '221146' - '218657';
-- '250000' - '223866';

SET @CGUID := 218311;
SET @OGUID := 253314;

-- Creature
DELETE FROM `creature` WHERE `guid`= 310791;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+346;



update `creature` set `phaseUseFlags` = 0 WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+346;
update  `creature` set npcflag = null WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+346 and npcflag = 0;
update  `creature` set unit_flags2 = null WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+346 and unit_flags2 = 0;
update  `creature` set unit_flags3 = null WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+346 and unit_flags3 = 0;



-- GameObjects
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+342;


UPDATE `gameobject` set `phaseUseFlags` = 0 WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+342;


-- Phasing
DELETE FROM `phase_area` WHERE `AreaId` = 4982 AND `PhaseId` IN (7553);

DELETE FROM  `phase_name` WHERE `ID` IN (4982);



DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (7553) AND `SourceEntry` = 4982);


update  world.creature_template set npcflag= 1|2 where entry in (4311, 107934);
update quest_template set StartItem = '132119' where id = 43926;

delete from creature_queststarter where id = 4311 and quest = 44281;
delete from creature_queststarter where id = 107934 and quest = 42782;


INSERT INTO `creature_queststarter` (`id`,`quest`) VALUES (4311,44281);
INSERT INTO `creature_queststarter` (`id`,`quest`) VALUES (107934,42782);

delete from `quest_template_addon` where id in(42782, 44281);
INSERT INTO `quest_template_addon`
(`ID`,
 `MaxLevel`,
 `AllowableClasses`,
 `SourceSpellID`,
 `PrevQuestID`,
 `NextQuestID`,
 `ExclusiveGroup`,
 `BreadcrumbForQuestId`,
 `RewardMailTemplateID`,
 `RewardMailDelay`,
 `RequiredSkillID`,
 `RequiredSkillPoints`,
 `RequiredMinRepFaction`,
 `RequiredMaxRepFaction`,
 `RequiredMinRepValue`,
 `RequiredMaxRepValue`,
 `ProvidedItemCount`,
 `SpecialFlags`,
 `ScriptName`)
VALUES
    (42782,0,0,0,40519,42740,0,0,0,0,0,0,0,0,0,0,0,0, ''),
    (44281,0,0,0,43926,0,0,0,0,0,0,0,0,0,0,0,0,0, '');



-- correct questchain/phasing for Horde (none Demon Hunters)
-- questline: 43926, 44281, 40518, 40522, 40760, 40607, 40605, 44663
-- deprecated: 44091
-- relevant zones: Orgrimmar (zoneID: 1637) and Durotar (zoneID: 14)
UPDATE quest_template_addon SET AllowableClasses = 1|2|4|8|16|32|64|128|256|512|1024 WHERE ID = 43926;
UPDATE quest_template SET RewardNextQuest = 44663 WHERE ID = 40605;

-- correct questchain/phasing for Horde Demon Hunters
-- questline: 40976, 40982, 40983, 41002, 44663
-- deprecated: 44091
UPDATE quest_template_addon SET AllowableClasses = 2048 WHERE ID = 40976;
UPDATE quest_template_addon SET NextQuestID = 44663 WHERE ID = 41002;
UPDATE quest_template SET RewardNextQuest = 44663 WHERE ID = 41002;

-- correct questchain/phasing for Alliance (none Demon Hunters)
-- questline: 40519, 42782, 42740, 40517, 40593, 44120, 44663
-- deprecated: 43635
UPDATE quest_template_addon SET AllowableClasses = 1|2|4|8|16|32|64|128|256|512|1024 WHERE ID = 40519;
UPDATE quest_template SET RewardNextQuest = 40593 WHERE ID = 40517;
UPDATE quest_template SET RewardNextQuest = 44663 WHERE ID = 44120;

-- correct questchain/phasing for Alliance Demon hunters
-- questline: 39691, 44471, 44463, 44473, 44663
-- deprecated: 43635
UPDATE quest_template_addon SET AllowableClasses = 2048 WHERE ID = 39691;
UPDATE quest_template_addon SET NextQuestID = 44663 WHERE ID = 44473;
UPDATE quest_template SET RewardNextQuest = 44663 WHERE ID = 44473;




-- Phasing
DELETE FROM `phase_area` WHERE `AreaId` = 4982 AND `PhaseId` IN (7554, 7553, 7425, 7531);


INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4982, 7554, 'Pre-Broken Shore Durotar Harbor'),
(4982, 7553, 'Pre-Broken Shore Durotar Harbor'),
(4982, 7425, 'Pre-Broken Shore Durotar Harbor'),
(4982, 7531, 'Pre-Broken Shore Durotar Harbor');

DELETE FROM  `phase_name` WHERE `ID` IN (7554, 13306);
INSERT INTO `phase_name` (`ID`,`Name`) VALUES
(7554, 'Pre-Broken Shore Durotar Habor'),
(7553, 'Pre-Broken Shore Durotar Habor'),
(7425, 'Pre-Broken Shore Durotar Habor'),
(7531, 'Pre-Broken Shore Durotar Habor');


DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (7554, 7553, 7425) AND `SourceEntry` = 4982);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`)
VALUES (26, 7554, 4982, 0, 0, 47, 0, 43926, 8 | 2 | 64, 0, 0,'Apply Phase 7554 if Quest 43926 is taken | completed | rewarded'),
       (26, 7553, 4982, 0, 0, 47, 0, 43926, 8 | 2 | 64, 0, 0,'Apply Phase 7553 if Quest 43926 is taken | completed | rewarded'),
       (26, 7554, 4982, 0, 0, 47, 0, 40518, 64, 0, 1, 'Apply Phase 7554 if Quest 40518 is not rewarded'),
       (26, 7553, 4982, 0, 0, 47, 0, 40518, 64, 0, 1, 'Apply Phase 7553 if Quest 40518 is not rewarded'),
       (26, 7425, 4982, 0, 0, 47, 0, 40522, 8 | 2 | 64, 0, 0,'Apply Phase 7425 if Quest 40519 is taken | completed | rewarded'),
       (26, 7425, 4982, 0, 0, 47, 0, 40976, 64, 0, 1, 'Apply Phase 7425 if Quest 40976 is not rewarded'),
       (26, 7531, 4982, 0, 0, 47, 0, 44663, 8 | 2 | 64, 0, 0,'Apply Phase 7531 if Quest 44663 is taken | completed | rewarded'),
       (26, 7531, 4982, 0, 0, 47, 0, 44663, 64, 0, 1, 'Apply Phase 7531 if Quest 44663 is not rewarded');
