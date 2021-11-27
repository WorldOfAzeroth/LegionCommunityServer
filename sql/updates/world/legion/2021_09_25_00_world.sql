-- Add Way of the Mok'Nathal to spell scripts
DELETE FROM `spell_script_names` WHERE `spell_id`=201082 AND `ScriptName` = 'spell_hun_way_of_the_moknathal';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (201082, 'spell_hun_way_of_the_moknathal');

-- Add Moknathal script to Raptor Strike
DELETE FROM `spell_script_names` WHERE `spell_id`=186270 AND `ScriptName` = 'spell_hun_way_of_the_moknathal';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (186270, 'spell_hun_way_of_the_moknathal');
