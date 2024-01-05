-- 178368 | spell_warr_heroic_leap_jump

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_warr_heroic_leap_jump','spell_warr_fueled_by_violence');
-- INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (162052,  'spell_warr_rampage');
-- INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (184707,  'spell_warr_rampage');
-- INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (184709,  'spell_warr_rampage');
-- INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (201364,  'spell_warr_rampage');
-- INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (201363,  'spell_warr_rampage');


DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_warr_devastator';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
    (236279,'spell_warr_devastator');


DELETE FROM `spell_proc` WHERE `SpellId` IN (224324);
INSERT INTO `spell_proc` (`SpellId`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`SpellFamilyMask3`,`ProcFlags`,`SpellTypeMask`,`SpellPhaseMask`,`HitMask`,`AttributesMask`,`DisableEffectsMask`,`ProcsPerMinute`,`Chance`,`Cooldown`,`Charges`) VALUES
    (224324,0x00,4,0x00000000,0x00000200,0x00000000,0x00000000,0x0,0x0,0x1,0x0,0x0,0x0,0,0,0,0); -- Shield Slam!


DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_warr_victory_rush';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
    (34428,'spell_warr_victory_rush');


DELETE FROM `spell_script_names` WHERE `spell_id`= 2565;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
    (2565,'spell_warr_shield_block');
