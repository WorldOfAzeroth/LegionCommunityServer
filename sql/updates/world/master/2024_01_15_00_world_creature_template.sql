

-- UNIT_FLAG_DISALLOWED = 0xFDFF3CBF
update creature_template set unit_flags=unit_flags & ~0xFDFF3CBF  where (unit_flags & 0xFDFF3CBF) != 0;

-- UNIT_FLAG2_DISALLOWED = 0xFBFC77DD
update creature_template set unit_flags2=unit_flags2 & ~0xFBFC77DD  where (unit_flags2 & 0xFBFC77DD) != 0;

-- CREATURE_FLAG_EXTRA_UNUSED | CREATURE_FLAG_EXTRA_DUNGEON_BOSS = 0x9FC00000
update creature_template set `flags_extra`=`flags_extra` & ~0x9FC00000  where (`flags_extra` & 0x9FC00000) != 0;

-- UNIT_FLAG_DISALLOWED = 0xFDFF3CBF
update creature set unit_flags=unit_flags & ~0xFDFF3CBF  where (unit_flags & 0xFDFF3CBF) != 0;


INSERT IGNORE INTO `page_text`(`ID`,`Text`,`NextPageID`,`PlayerConditionID`,`Flags`,`VerifiedBuild`)VALUES(7154,'...of sea, spirit and self...',0,0,0,22522);
INSERT IGNORE INTO `page_text`(`ID`,`Text`,`NextPageID`,`PlayerConditionID`,`Flags`,`VerifiedBuild`)VALUES(4546,'Ten thousand years ago, Emperor Shaohao, the Last Emperor of Pandaria, used the power of these sacred waters to spare Pandaria from the devastation of the Sundering that destroyed the rest of the world.',0,0,0,22522);
INSERT IGNORE INTO `page_text`(`ID`,`Text`,`NextPageID`,`PlayerConditionID`,`Flags`,`VerifiedBuild`)VALUES(4958,'ATTACK! $B$BPUT FIST IN FACE! $B$BCONTINUE THE ATTACKING!',0,0,0,22522);
INSERT IGNORE INTO `page_text`(`ID`,`Text`,`NextPageID`,`PlayerConditionID`,`Flags`,`VerifiedBuild`)VALUES(4874,'Huge boulders block the cave entrance.',0,0,0,22522);
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126337;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126338;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126339;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126340;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126341;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126345;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 151951;
UPDATE `gameobject_template` SET `data0` = 166879  WHERE `entry` = 181102;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 181105;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 181106;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 181165;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 183510;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 183511;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 126342;
UPDATE `gameobject_template` SET `data0` = 4  WHERE `entry` = 191300;
UPDATE `gameobject_template` SET `data0` = 42955  WHERE `entry` = 193061;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 193171;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 193169;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 193170;
UPDATE `gameobject_template` SET `data0` = 121852  WHERE `entry` = 205273;
UPDATE `gameobject_template` SET `data0` = 123071  WHERE `entry` = 205272;
UPDATE `gameobject_template` SET `data0` = 85040  WHERE `entry` = 207691;
UPDATE `gameobject_template` SET `data0` = 123073  WHERE `entry` = 209081;
UPDATE `gameobject_template` SET `data0` = 121857  WHERE `entry` = 209080;
UPDATE `gameobject_template` SET `data0` = 86855  WHERE `entry` = 206195;
UPDATE `gameobject_template` SET `data0` = 9175  WHERE `entry` = 207078;
UPDATE `gameobject_template` SET `data0` = 9175  WHERE `entry` = 207073;
UPDATE `gameobject_template` SET `data0` = 81349  WHERE `entry` = 204422;
UPDATE `gameobject_template` SET `data0` = 220485  WHERE `entry` = 208325;
UPDATE `gameobject_template` SET `data0` = 66238  WHERE `entry` = 205877;
UPDATE `gameobject_template` SET `data0` = 66238  WHERE `entry` = 205876;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 188597;
UPDATE `gameobject_template` SET `data0` = 57651  WHERE `entry` = 188598;
UPDATE `gameobject_template` SET `data0` = 215411  WHERE `entry` = 251521;
UPDATE `gameobject_template` SET `data0` = 173162  WHERE `entry` = 231620;
UPDATE `gameobject_template` SET `data0` = 58499  WHERE `entry` = 245623;
UPDATE `gameobject_template` SET `data0` = 85040  WHERE `entry` = 207690;
DELETE FROM `gameobject_template`  WHERE `entry` in (213867);
delete from gameobject where id in(213867);
delete from gameobject_template_addon where entry in(213867);
delete from gameobject_template_locale where entry in(213867);
delete from gameobject_loot_template where entry in(213867);