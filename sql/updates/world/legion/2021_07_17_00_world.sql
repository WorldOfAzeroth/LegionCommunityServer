-- Misc fixes

-- Darkspear Headhunter direction fix. ( Closes issue #57 )
UPDATE creature_template SET gossip_menu_id = 1951 WHERE creature_template.entry = 45015;

-- Trainer fixes

-- Cooking Trainer Zamja. Closes Issue #58
DELETE FROM `world`.gossip_menu WHERE MenuId = 3399;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 3399;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 3399;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (3399, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(3399, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (3399, 0, 136);
UPDATE `world`.creature_template SET gossip_menu_id = 3399 WHERE entry = 3399;

-- Leatherworking Trainer Karolek. Closes Issue #59
DELETE FROM `world`.gossip_menu WHERE MenuId = 3365;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 3365;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 3365;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (3365, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(3365, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (3365, 0, 56);
UPDATE `world`.creature_template SET gossip_menu_id = 3365 WHERE entry = 3365;

-- Fishing Trainer Lumak Closes. Issue #60
DELETE FROM `world`.gossip_menu WHERE MenuId = 3332;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 3332;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 3332;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (3332, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(3332, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (3332, 0, 10);
UPDATE `world`.creature_template SET gossip_menu_id = 3332 WHERE entry = 3332;

-- Blacksmithing Trainer Saru Steelfury. Closes Issue #61
DELETE FROM `world`.gossip_menu WHERE MenuId = 3355;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 3355;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 3355;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (3355, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(3355, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (3355, 0, 27);
UPDATE `world`.creature_template SET gossip_menu_id = 3355 WHERE entry = 3355;

-- Blacksmithing Trainer Kelgruk Bloodaxe. Closes Issue #63
DELETE FROM `world`.gossip_menu WHERE MenuId = 7231;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 7231;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 7231;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (7231, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(7231, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (7231, 0, 37);
UPDATE `world`.creature_template SET gossip_menu_id = 7231 WHERE entry = 7231;

-- Engineering Trainer Roxxik. Closes Issue #64
DELETE FROM `world`.gossip_menu WHERE MenuId = 11017;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 11017;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 11017;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (11017, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(11017, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (11017, 0, 407);
UPDATE `world`.creature_template SET gossip_menu_id = 11017 WHERE entry = 11017;

-- Tailoring Trainer Magar. Closes Issue #65
DELETE FROM `world`.gossip_menu WHERE MenuId = 3363;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 3363;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 3363;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (3363, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(3363, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (3363, 0, 163);
UPDATE `world`.creature_template SET gossip_menu_id = 3363 WHERE entry = 3363;

-- Tailoring Trainer Hiwahi Three-Feathers. Closes Issue #67
DELETE FROM `world`.gossip_menu WHERE MenuId = 44783;
DELETE FROM `world`.gossip_menu_option WHERE MenuId = 44783;
DELETE FROM `world`.gossip_menu_option_trainer WHERE MenuId = 44783;

INSERT INTO `world`.gossip_menu (MenuId, TextId, VerifiedBuild) VALUES (44783, 7015, 0);
INSERT INTO `world`.gossip_menu_option (MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcFlag, VerifiedBuild) VALUES 
(44783, 0, 3, 'Train me!', 3266, 5, 16, 0);
INSERT INTO `world`.gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId) VALUES (44783, 0, 163);
UPDATE `world`.creature_template SET gossip_menu_id = 44783 WHERE entry = 44783;

-- Fishing Trainer and Supply Vendor Old Umbehto. Closes Issue #68
DELETE FROM `world`.`gossip_menu_option_trainer` WHERE MenuId = 12443;
INSERT INTO `world`.`gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (12443, 0, 10);
UPDATE `world`.`gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `gossip_menu_option`.`MenuId` = 12443 AND `gossip_menu_option`.`OptionIndex` = 1;

-- Vendor fixes
-- Bow and Rifle vendor Kaja. Closes Issue #66
UPDATE `world`.`gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `gossip_menu_option`.`MenuId` = 12056 AND `gossip_menu_option`.`OptionIndex` = 0;

-- Weapon Merchant Urtharo. Closes Issue #69
UPDATE `world`.`gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 4224 WHERE `gossip_menu_option`.`MenuId` = 1624 AND `gossip_menu_option`.`OptionIndex` = 0;

-- Engineering Supplies Vendor Sovik. Closes Issue #77
UPDATE `world`.`gossip_menu_option` SET `OptionType` = 3, `OptionNpcFlag` = 128 WHERE `gossip_menu_option`.`MenuId` = 980 AND `gossip_menu_option`.`OptionIndex` = 0;