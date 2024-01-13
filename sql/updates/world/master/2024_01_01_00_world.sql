
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_warr_heroic_leap_jump','spell_warr_fueled_by_violence',
                                                        'spell_warr_brutal_vitality', 'spell_warr_strategist',
                                                       'spell_warr_shield_charge','spell_warr_critical_thinking');


DELETE FROM `spell_script_names` WHERE `spell_id`= 2565;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
    (2565,'spell_warr_shield_block');


delete from serverside_spell where ID=196866;
delete from serverside_spell_effect where SpellID=196866;


update gameobject_template  set `data0`=0 where entry=73;
update gameobject_template  set `data0`=0 where entry=73;