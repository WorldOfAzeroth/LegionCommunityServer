-- Fixes issues 16, 18, 21, 22, 24, 25, 26, 27, 56

DELETE FROM `gossip_menu_option_trainer` WHERE MenuId in (4128, 4165, 4242, 4351, 4185, 5854, 4349, 2021);

INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES 
-- Bena Winterhoof, Thnderbluff alchemy trainer gossip fix. ( Closes issue #27 =)
(4128, 0, 122),
-- Teg Dawnstrider, Thunderbluff enchanting trainer fix. ( Closes issue #26 )
(4165, 0, 62),
-- Una, Thunderbluff leatherworking trainer fix. ( Closes issue #25)
(4242, 0, 56),
-- Tepa, Thunderbluff tailoring trainer fix. ( Closes issue #24 )
(4351, 0, 163),
-- Chaw Stronghide, Bloodhoof village leatherworking trainer fix. ( Closes issue #22 )
(4185, 0, 56),
-- Pyall Silentstride, Bloodhoof village cooking trainer fix. ( Closes issue #21 )
(5854, 0, 136),
-- Me'lynn, Darnassus tailoring trainer fix. ( Closes issue #18 )
(4349, 0, 163),
-- Zarrin, Teldrassil cooking trainer fix. ( Closes issue #16 )
(2021, 0, 136);

UPDATE `creature_template` SET `npcflag` = 17 WHERE `creature_template`.`entry` in (3011, 3004, 3069, 3067, 4159, 6286);
UPDATE `creature_template` SET `npcflag` = 19 WHERE `creature_template`.`entry` in (3009, 3007 );