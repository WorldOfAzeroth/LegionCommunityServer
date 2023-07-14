ALTER TABLE `creature_template` ADD COLUMN `WidgetSetID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CreatureDifficultyID`;
ALTER TABLE `creature_template` ADD COLUMN `WidgetSetUnitConditionID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `WidgetSetID`;
