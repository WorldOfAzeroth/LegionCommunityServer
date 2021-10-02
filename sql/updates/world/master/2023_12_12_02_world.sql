SET @TRIGGER_SPAWN_ID := 50;
SET @TRIGGER_ID := 50;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=28 AND `SourceEntry`=1 AND `SourceGroup` BETWEEN @TRIGGER_ID+1 AND @TRIGGER_ID+3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(28, @TRIGGER_ID+2, 1, 0, 0, 47, 0, 34423, 8, 0, 0, 0, 0, '', 'Only trigger areatrigger when quest 34423 is taken'),
(28, @TRIGGER_ID+2, 1, 0, 0, 48, 0, 274409, 0, 0, 0, 0, 0, '', 'Only trigger areatrigger when has quest objective 274409 active'),

(28, @TRIGGER_ID+3, 1, 0, 0, 47, 0, 34423, 8, 0, 0, 0, 0, '', 'Only trigger areatrigger when quest 34423 is taken'),
(28, @TRIGGER_ID+3, 1, 0, 0, 48, 0, 273678, 0, 3, 1, 0, 0, '', 'Only trigger areatrigger when progress of quest objective 273678 not == 3');
