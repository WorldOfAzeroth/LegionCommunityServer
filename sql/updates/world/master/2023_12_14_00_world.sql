SET @CGUID := 7000281;

SET @NPCTEXTID := 570038;

-- Creature
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+27;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `VerifiedBuild`) VALUES
(@CGUID+0, 142188, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1120.9617919921875, -598.6007080078125, 17.3649749755859375, 1.888452887535095214, 120, 0, 0, 88105, 2434, 0, NULL, NULL, NULL, NULL, 52393), -- Allison Weber (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+1, 123675, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1139.8021240234375, -596.279541015625, 20.63253593444824218, 2.210630416870117187, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52393), -- Patrick Markson (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+2, 124295, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1144.951416015625, -587.6961669921875, 20.63253593444824218, 3.106157779693603515, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52393), -- Miri Fiddlewizz (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+3, 123635, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1147.0260009765625, -575.52777099609375, 20.63253593444824218, 2.851507186889648437, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52393), -- Sara Bartlett (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+4, 124289, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1141.41845703125, -561.578125, 20.58385848999023437, 3.714325666427612304, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52393), -- "Risky" Liz Seminario (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+5, 142094, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1121.7274169921875, -569.99481201171875, 17.26128196716308593, 4.029656887054443359, 120, 0, 0, 88105, 2434, 0, NULL, NULL, NULL, NULL, 52393), -- Ninette Shoames (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+6, 142169, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1098.21533203125, -535.8125, 17.58002281188964843, 0.829916596412658691, 120, 0, 0, 88105, 100, 0, NULL, NULL, NULL, NULL, 52393), -- Phil Gresham (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+7, 142167, 1643, 8717, 8718, '0', 0, 0, 0, 1, 1078.4444580078125, -533.65277099609375, 18.76843833923339843, 0.595355510711669921, 120, 0, 0, 88105, 100, 0, NULL, NULL, NULL, NULL, 52393), -- Charisse Payton (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+8, 142174, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1076.520263671875, -532.2149658203125, 18.6913299560546875, 0.544851660728454589, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52393), -- Second Breakfast (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+9, 133325, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1126.6302490234375, -546.0242919921875, 17.63025474548339843, 2.633424282073974609, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52393), -- Drustvar Trader (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+10, 123642, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1140.215576171875, -577.1593017578125, 20.60213851928710937, 3.650803565979003906, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Boralus Citizen (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+11, 140313, 1643, 8717, 8718, '0', 0, 0, 0, 1, 1117.142333984375, -596.38543701171875, 17.41859817504882812, 5.368962764739990234, 120, 0, 0, 88105, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Harbor Guard Cadet (Area: Tradewinds Market - Difficulty: 0) CreateObject1 (Auras: )
(@CGUID+12, 124180, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1119.1483154296875, -554.1097412109375, 17.39908409118652343, 5.2512054443359375, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Matilda Clark (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+13, 124181, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1121.506103515625, -551.11175537109375, 18.89734077453613281, 5.230515480041503906, 120, 0, 0, 27, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Louisa (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+14, 143244, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1171.261474609375, -585.6085205078125, 31.59538841247558593, 2.70897531509399414, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Victor Esquivias (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+15, 125005, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1151.8724365234375, -598.67352294921875, 28.79858589172363281, 4.055289745330810546, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Kul Tiran Noble (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+16, 123642, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1152.9923095703125, -599.51715087890625, 28.77585029602050781, 3.845496654510498046, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Boralus Citizen (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+17, 143246, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1110.763916015625, -620.046875, 28.76919937133789062, 0.000001065264427779, 120, 0, 0, 88105, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Garrett Elmendorf (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+18, 142191, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1136.6597900390625, -625.8367919921875, 28.96091461181640625, 1.724317431449890136, 120, 0, 0, 88105, 100, 0, NULL, NULL, NULL, NULL, 52485), -- Ban Pearlpaw (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+19, 143263, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1134.6632080078125, -621.19964599609375, 28.77335739135742187, 0.246472358703613281, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Scott Trujillo (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+20, 123639, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1160.2725830078125, -618.84893798828125, 29.81410789489746093, 0.920259058475494384, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Harold Atkey (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+21, 142063, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1169.7916259765625, -550.5625, 29.293212890625, 4.095940589904785156, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Tezran (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+22, 149045, 1643, 8717, 8718, '0', 0, 0, 0, 1, 1171.282958984375, -552.34375, 29.29338264465332031, 3.93041086196899414, 120, 0, 0, 18948, 13179, 0, NULL, NULL, NULL, NULL, 52485), -- Thaumaturge Vashreen (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+23, 142068, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1173.515625, -555.41143798828125, 29.29338264465332031, 3.431156635284423828, 120, 0, 0, 14096, 5751, 0, NULL, NULL, NULL, NULL, 52485), -- Warpweaver Ezil (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+24, 142066, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1172.782958984375, -558.02606201171875, 29.293212890625, 3.047653436660766601, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485), -- Razzi the Shaper (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+25, 144383, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1163.7708740234375, -595.79339599609375, 28.96091461181640625, 2.837385177612304687, 120, 0, 0, 140960, 57510, 0, NULL, NULL, NULL, NULL, 52485), -- Chronicler Toopa (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+26, 154464, 1643, 8717, 8718, '0', 0, 0, 0, 0, 1154.5208740234375, -612.88543701171875, 28.96091461181640625, 2.581967115402221679, 120, 0, 0, 9869, 27105, 0, NULL, NULL, NULL, NULL, 52485), -- Earthen Guardian (Area: Tradewinds Market - Difficulty: 0) CreateObject1
(@CGUID+27, 141274, 1643, 8717, 8718, '0', 0, 0, 0, 1, 1136.4461669921875, -651.05035400390625, 29.0868377685546875, 5.763525962829589843, 120, 0, 0, 17621, 0, 0, NULL, NULL, NULL, NULL, 52485); -- Crenzo Sparkshatter (Area: Tradewinds Market - Difficulty: 0) CreateObject1 (Auras: 276158 - Goggle Cosmetic)

-- Template Addon
DELETE FROM `creature_template_addon` WHERE `entry` IN (142167, 142188, 142169, 142094, 143263, 123639, 141274);
INSERT INTO `creature_template_addon` (`entry`, `pathid`, `mount`, `StandState`, `AnimTier`, `VisFlags`, `SheathState`, `PvpFlags`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `visibilityDistanceType`, `auras`) VALUES
(142167, 0, 0, 0, 0, 0, 1, 1, 0, 15787, 0, 0, 0, ''), -- 142167 (Charisse Payton)
(142188, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, ''), -- 142188 (Allison Weber)
(142169, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, ''), -- 142169 (Phil Gresham)
(142094, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, ''), -- 142094 (Ninette Shoames)
(143263, 0, 0, 0, 0, 0, 1, 0, 0, 3228, 0, 0, 0, ''), -- 143263 (Scott Trujillo)
(123639, 0, 0, 0, 0, 0, 1, 0, 0, 16425, 0, 0, 0, ''), -- 123639 (Harold Atkey)
(141274, 0, 0, 0, 0, 0, 1, 0, 69, 0, 0, 0, 0, '276158'); -- 141274 (Crenzo Sparkshatter) - Goggle Cosmetic

-- Quest stuff
DELETE FROM `quest_details` WHERE `ID`=51144;
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`) VALUES
(51144, 1, 1, 0, 0, 0, 300, 0, 0, 52393); -- A Bundle of Furs

DELETE FROM `creature_queststarter` WHERE (`id`=124289 AND `quest`=51144);
INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES
(124289, 51144, 52393); -- A Bundle of Furs offered "Risky" Liz Seminario

-- Gossip Data
DELETE FROM `creature_template_gossip` WHERE (`CreatureID`=142066 AND `MenuID`=22976) OR (`CreatureID`=142068 AND `MenuID`=21043) OR (`CreatureID`=149045 AND `MenuID`=23745) OR (`CreatureID`=142063 AND `MenuID`=23120) OR (`CreatureID`=144383 AND `MenuID`=23971);
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(142066, 22976, 52485), -- Razzi the Shaper
(142068, 21043, 52485), -- Warpweaver Ezil
(149045, 23745, 52485), -- Thaumaturge Vashreen
(142063, 23120, 52485), -- Tezran
(144383, 23971, 52485); -- Chronicler Toopa

DELETE FROM `npc_text` WHERE `ID` BETWEEN @NPCTEXTID+0 AND @NPCTEXTID+0;
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(@NPCTEXTID+0, 1, 0, 0, 0, 0, 0, 0, 0, 160332, 0, 0, 0, 0, 0, 0, 0, 52485); -- 142063 (Tezran)

DELETE FROM `gossip_menu` WHERE (`MenuID`=23120 AND `TextID`=@NPCTEXTID+0);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`, `VerifiedBuild`) VALUES
(23120, @NPCTEXTID+0, 52485); -- 142063 (Tezran)

-- Vendor data
DELETE FROM `npc_vendor` WHERE (`entry`=142167 AND `item`=155812 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142167 AND `item`=155813 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142167 AND `item`=155814 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142167 AND `item`=155811 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=2438 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=2473 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=2143 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=2156 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=238 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=843 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=792 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142169 AND `item`=20921 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=2325 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=2604 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=2605 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=4340 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=4341 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=4342 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=6260 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=6261 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=10290 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=2324 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=159959 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=14341 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=38426 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=8343 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=4291 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=2321 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=2320 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=160059 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=183955 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=177062 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124289 AND `item`=7005 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160712 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160710 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160709 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160400 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160399 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160398 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=160705 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=2678 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=30817 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123635 AND `item`=159 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=163203 AND `ExtendedCost`=6426 AND `type`=1) OR (`entry`=124295 AND `item`=3857 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=18567 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=160298 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=3466 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=2880 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=5956 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=2901 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=6219 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=160502 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=163569 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=183952 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=124295 AND `item`=180733 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123675 AND `item`=3025 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123675 AND `item`=3024 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123675 AND `item`=3023 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123675 AND `item`=2511 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123675 AND `item`=2509 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123675 AND `item`=2510 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143244 AND `item`=163019 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143244 AND `item`=162026 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143244 AND `item`=163548 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143244 AND `item`=163098 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143244 AND `item`=159849 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143244 AND `item`=163018 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142188 AND `item`=159850 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142188 AND `item`=159849 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142188 AND `item`=160484 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142188 AND `item`=159848 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142188 AND `item`=163549 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142188 AND `item`=159845 AND `ExtendedCost`=0 AND `type`=1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `ExtendedCost`, `type`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES
(142167, 4, 155812, 0, 0, 1, 0, 0, 52393), -- Goldshire Farms Smoked Sausage
(142167, 3, 155813, 0, 0, 1, 0, 0, 52393), -- Rosco Fryer's Mostly-Meat Brat
(142167, 2, 155814, 0, 0, 1, 0, 0, 52393), -- Timmy Gene Sunrise Pork
(142167, 1, 155811, 0, 0, 1, 0, 0, 52393), -- Roland's Famous Frankfurter
(142169, 8, 2438, 0, 0, 1, 0, 0, 52393), -- Embroidered Boots
(142169, 7, 2473, 0, 0, 1, 0, 0, 52393), -- Reinforced Leather Boots
(142169, 6, 2143, 0, 0, 1, 0, 0, 52393), -- Cuirboulli Boots
(142169, 5, 2156, 0, 0, 1, 0, 0, 52393), -- Padded Boots
(142169, 4, 238, 0, 0, 1, 0, 0, 52393), -- Cured Leather Boots
(142169, 3, 843, 0, 0, 1, 0, 0, 52393), -- Tanned Leather Boots
(142169, 2, 792, 0, 0, 1, 0, 0, 52393), -- Knitted Sandals
(142169, 1, 20921, 0, 0, 1, 0, 0, 52393), -- Sun Cured Boots
(124289, 21, 2325, 0, 0, 1, 0, 0, 52393), -- Black Dye
(124289, 20, 2604, 0, 0, 1, 0, 0, 52393), -- Red Dye
(124289, 19, 2605, 0, 0, 1, 0, 0, 52393), -- Green Dye
(124289, 18, 4340, 0, 0, 1, 0, 0, 52393), -- Gray Dye
(124289, 17, 4341, 0, 0, 1, 0, 0, 52393), -- Yellow Dye
(124289, 16, 4342, 0, 0, 1, 0, 0, 52393), -- Purple Dye
(124289, 15, 6260, 0, 0, 1, 0, 0, 52393), -- Blue Dye
(124289, 14, 6261, 0, 0, 1, 0, 0, 52393), -- Orange Dye
(124289, 13, 10290, 0, 0, 1, 0, 0, 52393), -- Pink Dye
(124289, 12, 2324, 0, 0, 1, 0, 0, 52393), -- Bleach
(124289, 11, 159959, 0, 0, 1, 0, 0, 52393), -- Nylon Thread
(124289, 10, 14341, 0, 0, 1, 0, 0, 52393), -- Rune Thread
(124289, 9, 38426, 0, 0, 1, 0, 0, 52393), -- Eternium Thread
(124289, 8, 8343, 0, 0, 1, 0, 0, 52393), -- Heavy Silken Thread
(124289, 7, 4291, 0, 0, 1, 0, 0, 52393), -- Silken Thread
(124289, 6, 2321, 0, 0, 1, 0, 0, 52393), -- Fine Thread
(124289, 5, 2320, 0, 0, 1, 0, 0, 52393), -- Coarse Thread
(124289, 4, 160059, 0, 0, 1, 0, 0, 52393), -- Amber Tanning Oil
(124289, 3, 183955, 0, 0, 1, 0, 0, 52393), -- Curing Salt
(124289, 2, 177062, 0, 0, 1, 0, 0, 52393), -- Penumbra Thread
(124289, 1, 7005, 0, 0, 1, 0, 0, 52393), -- Skinning Knife
(123635, 10, 160712, 0, 0, 1, 0, 0, 52393), -- Powdered Sugar
(123635, 9, 160710, 0, 0, 1, 0, 0, 52393), -- Wild Berries
(123635, 8, 160709, 0, 0, 1, 0, 0, 52393), -- Fresh Potato
(123635, 7, 160400, 0, 0, 1, 0, 0, 52393), -- Foosaka
(123635, 6, 160399, 0, 0, 1, 0, 0, 52393), -- Wild Flour
(123635, 5, 160398, 0, 0, 1, 0, 0, 52393), -- Choral Honey
(123635, 4, 160705, 0, 0, 1, 0, 0, 52393), -- Major's Frothy Coffee
(123635, 3, 2678, 0, 0, 1, 0, 0, 52393), -- Mild Spices
(123635, 2, 30817, 0, 0, 1, 0, 0, 52393), -- Simple Flour
(123635, 1, 159, 0, 0, 1, 0, 0, 52393), -- Refreshing Spring Water
(124295, 13, 163203, 0, 6426, 1, 0, 0, 52393), -- Hypersensitive Azeritometer Sensor
(124295, 12, 3857, 0, 0, 1, 0, 0, 52393), -- Coal
(124295, 11, 18567, 0, 0, 1, 0, 0, 52393), -- Elemental Flux
(124295, 10, 160298, 0, 0, 1, 0, 0, 52393), -- Durable Flux
(124295, 9, 3466, 0, 0, 1, 0, 0, 52393), -- Strong Flux
(124295, 8, 2880, 0, 0, 1, 0, 0, 52393), -- Weak Flux
(124295, 7, 5956, 0, 0, 1, 0, 0, 52393), -- Blacksmith Hammer
(124295, 6, 2901, 0, 0, 1, 0, 0, 52393), -- Mining Pick
(124295, 5, 6219, 0, 0, 1, 0, 0, 52393), -- Arclight Spanner
(124295, 4, 160502, 0, 0, 1, 0, 0, 52393), -- Chemical Blasting Cap
(124295, 3, 163569, 0, 0, 1, 0, 0, 52393), -- Insulated Wiring
(124295, 2, 183952, 0, 0, 1, 0, 0, 52393), -- Machinist's Oil
(124295, 1, 180733, 0, 0, 1, 0, 0, 52393), -- Luminous Flux
(123675, 6, 3025, 0, 0, 1, 0, 0, 52393), -- BKP 42 "Ultra"
(123675, 5, 3024, 0, 0, 1, 0, 0, 52393), -- BKP 2700 "Enforcer"
(123675, 4, 3023, 0, 0, 1, 0, 0, 52393), -- Large Bore Blunderbuss
(123675, 3, 2511, 0, 0, 1, 0, 0, 52393), -- Hunter's Boomstick
(123675, 2, 2509, 0, 0, 1, 0, 0, 52393), -- Ornate Blunderbuss
(123675, 1, 2510, 0, 0, 1, 0, 0, 52393), -- Solid Blunderbuss
(143244, 6, 163019, 0, 0, 1, 0, 0, 52393), -- Drop Anchor Dunkel
(143244, 5, 162026, 0, 0, 1, 0, 0, 52393), -- Hook Point Porter
(143244, 4, 163548, 0, 0, 1, 0, 0, 52393), -- Kul Tiran Tripel
(143244, 3, 163098, 0, 0, 1, 0, 0, 52393), -- Tradewinds Kolsch
(143244, 2, 159849, 0, 0, 1, 0, 0, 52393), -- Hook Point Schnapps
(143244, 1, 163018, 0, 0, 1, 0, 0, 52393), -- Pontoon Pilsner
(142188, 6, 159850, 0, 0, 1, 0, 0, 52393), -- Bitter Darkroot Vodka
(142188, 5, 159849, 0, 0, 1, 0, 0, 52393), -- Hook Point Schnapps
(142188, 4, 160484, 0, 0, 1, 0, 0, 52393), -- "Aurora Borealis"
(142188, 3, 159848, 0, 0, 1, 0, 0, 52393), -- Blacktooth Bloodwine
(142188, 2, 163549, 0, 0, 1, 0, 0, 52393), -- Thornspeaker Moonshine
(142188, 1, 159845, 0, 0, 1, 0, 0, 52393); -- Brennadam Apple Brandy

DELETE FROM `npc_vendor` WHERE (`entry`=142094 AND `item`=64670 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=39505 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=20815 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=5956 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=6217 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=6256 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=85663 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=7005 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=2901 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=138293 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=90146 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=4470 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=38682 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=3371 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142094 AND `item`=39354 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=163054 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=163051 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=163053 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=163060 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=159848 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=163103 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=159868 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=143246 AND `item`=159867 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=81918 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=81917 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=82451 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=82450 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=104348 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=81414 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=142191 AND `item`=104343 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=160484 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=159850 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=159845 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=159849 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=159847 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=159846 AND `ExtendedCost`=0 AND `type`=1) OR (`entry`=123639 AND `item`=159848 AND `ExtendedCost`=0 AND `type`=1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `ExtendedCost`, `type`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES
(142094, 15, 64670, 0, 0, 1, 0, 0, 52485), -- Vanishing Powder
(142094, 14, 39505, 0, 0, 1, 0, 0, 52485), -- Virtuoso Inking Set
(142094, 13, 20815, 0, 0, 1, 0, 0, 52485), -- Jeweler's Toolset
(142094, 12, 5956, 0, 0, 1, 0, 0, 52485), -- Blacksmith Hammer
(142094, 11, 6217, 0, 0, 1, 0, 0, 52485), -- Copper Rod
(142094, 10, 6256, 0, 0, 1, 0, 0, 52485), -- Fishing Pole
(142094, 9, 85663, 0, 0, 1, 0, 0, 52485), -- Herbalist's Spade
(142094, 8, 7005, 0, 0, 1, 0, 0, 52485), -- Skinning Knife
(142094, 7, 2901, 0, 0, 1, 0, 0, 52485), -- Mining Pick
(142094, 6, 138293, 0, 0, 1, 0, 0, 52485), -- Explorer's Pack
(142094, 5, 90146, 0, 0, 1, 0, 0, 52485), -- Tinker's Kit
(142094, 4, 4470, 0, 0, 1, 0, 0, 52485), -- Simple Wood
(142094, 3, 38682, 0, 0, 1, 0, 0, 52485), -- Enchanting Vellum
(142094, 2, 3371, 0, 0, 1, 0, 0, 52485), -- Crystal Vial
(142094, 1, 39354, 0, 0, 1, 0, 0, 52485), -- Light Parchment
(143246, 8, 163054, 0, 0, 1, 0, 0, 52485), -- Stranglethorn Prickly Pear
(143246, 7, 163051, 0, 0, 1, 0, 0, 52485), -- Seafarer's Biscuit
(143246, 6, 163053, 0, 0, 1, 0, 0, 52485), -- Southsea Breadfruit
(143246, 5, 163060, 0, 0, 1, 0, 0, 52485), -- Fried Sweetbread
(143246, 4, 159848, 0, 0, 1, 0, 0, 52485), -- Blacktooth Bloodwine
(143246, 3, 163103, 0, 0, 1, 0, 0, 52485), -- Admiralty-Issued Grog
(143246, 2, 159868, 0, 0, 1, 0, 0, 52485), -- Free-Range Goat's Milk
(143246, 1, 159867, 0, 0, 1, 0, 0, 52485), -- Rockskip Mineral Water
(142191, 7, 81918, 0, 0, 1, 0, 0, 52485), -- Pickled Pig's Snout
(142191, 6, 81917, 0, 0, 1, 0, 0, 52485), -- Mutton Stew
(142191, 5, 82451, 0, 0, 1, 0, 0, 52485), -- Frybread
(142191, 4, 82450, 0, 0, 1, 0, 0, 52485), -- Cornmeal Biscuit
(142191, 3, 104348, 0, 0, 1, 0, 0, 52485), -- Timeless Tea
(142191, 2, 81414, 0, 0, 1, 0, 0, 52485), -- Pearl Milk Tea
(142191, 1, 104343, 0, 0, 1, 0, 0, 52485), -- Golden Dragon Noodles
(123639, 7, 160484, 0, 0, 1, 0, 0, 52485), -- "Aurora Borealis"
(123639, 6, 159850, 0, 0, 1, 0, 0, 52485), -- Bitter Darkroot Vodka
(123639, 5, 159845, 0, 0, 1, 0, 0, 52485), -- Brennadam Apple Brandy
(123639, 4, 159849, 0, 0, 1, 0, 0, 52485), -- Hook Point Schnapps
(123639, 3, 159847, 0, 0, 1, 0, 0, 52485), -- Mildenhall Mead
(123639, 2, 159846, 0, 0, 1, 0, 0, 52485), -- Whitegrove Pale Ale
(123639, 1, 159848, 0, 0, 1, 0, 0, 52485); -- Blacktooth Bloodwine

DELETE FROM `npc_vendor` WHERE (`entry`=142068 AND `item`=202308 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202307 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202306 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202305 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202304 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202303 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202301 AND `ExtendedCost`=7854 AND `type`=1) OR (`entry`=142068 AND `item`=202300 AND `ExtendedCost`=7854 AND `type`=1) OR (`entry`=142068 AND `item`=202298 AND `ExtendedCost`=7856 AND `type`=1) OR (`entry`=142068 AND `item`=202297 AND `ExtendedCost`=7854 AND `type`=1) OR (`entry`=142068 AND `item`=202296 AND `ExtendedCost`=7854 AND `type`=1) OR (`entry`=142068 AND `item`=202295 AND `ExtendedCost`=7854 AND `type`=1) OR (`entry`=142068 AND `item`=190888 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190858 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190830 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190803 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190697 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190686 AND `ExtendedCost`=7854 AND `type`=1) OR (`entry`=142068 AND `item`=190673 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190544 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190429 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190202 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190167 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=190064 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=189870 AND `ExtendedCost`=7855 AND `type`=1) OR (`entry`=142068 AND `item`=188249 AND `ExtendedCost`=7234 AND `type`=1) OR (`entry`=142068 AND `item`=188248 AND `ExtendedCost`=7234 AND `type`=1) OR (`entry`=142068 AND `item`=188244 AND `ExtendedCost`=7235 AND `type`=1) OR (`entry`=142068 AND `item`=188243 AND `ExtendedCost`=7235 AND `type`=1) OR (`entry`=142068 AND `item`=188237 AND `ExtendedCost`=7236 AND `type`=1) OR (`entry`=142068 AND `item`=188236 AND `ExtendedCost`=7236 AND `type`=1) OR (`entry`=142068 AND `item`=151116 AND `ExtendedCost`=6211 AND `type`=1) OR (`entry`=142068 AND `item`=151120 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=151119 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=151118 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=151117 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=157577 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=157576 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=157574 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=157573 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=164378 AND `ExtendedCost`=6444 AND `type`=1) OR (`entry`=142068 AND `item`=168061 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=168060 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=168059 AND `ExtendedCost`=6188 AND `type`=1) OR (`entry`=142068 AND `item`=168058 AND `ExtendedCost`=6188 AND `type`=1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `ExtendedCost`, `type`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) VALUES
(142068, 45, 202308, 0, 7856, 1, 0, 0, 52485), -- Alley Skulker's Bandana
(142068, 44, 202307, 0, 7856, 1, 0, 0, 52485), -- Well-Worn Tricorne
(142068, 43, 202306, 0, 7856, 1, 0, 0, 52485), -- Dread Captain's Chapeau
(142068, 42, 202305, 0, 7856, 1, 0, 0, 52485), -- Stevedore's Skullcap
(142068, 41, 202304, 0, 7856, 1, 0, 0, 52485), -- Green Beanie
(142068, 40, 202303, 0, 7856, 1, 0, 0, 52485), -- Crimson Beanie
(142068, 39, 202301, 0, 7854, 1, 0, 0, 52485), -- Focalized Mana Accelerator
(142068, 38, 202300, 0, 7854, 1, 0, 0, 52485), -- Zealot's Prayer Staff
(142068, 37, 202298, 0, 7856, 1, 0, 0, 52485), -- Trader's Bicorne
(142068, 36, 202297, 0, 7854, 1, 0, 0, 52485), -- Jade Arcus
(142068, 35, 202296, 0, 7854, 1, 0, 0, 52485), -- Deathmantle Ripper
(142068, 34, 202295, 0, 7854, 1, 0, 0, 52485), -- Anointed Crusader's Claymore
(142068, 33, 190888, 0, 7855, 1, 0, 0, 52485), -- Embrace of the Great Dark Beyond
(142068, 32, 190858, 0, 7855, 1, 0, 0, 52485), -- Girdle of Chilled Embers
(142068, 31, 190830, 0, 7855, 1, 0, 0, 52485), -- Mad Thief's Boots
(142068, 30, 190803, 0, 7855, 1, 0, 0, 52485), -- Lost Acolyte's Boots
(142068, 29, 190697, 0, 7855, 1, 0, 0, 52485), -- Boots of a Broken World
(142068, 28, 190686, 0, 7854, 1, 0, 0, 52485), -- Anetheron's Edge
(142068, 27, 190673, 0, 7855, 1, 0, 0, 52485), -- Waistguard of the Infernal Eye
(142068, 26, 190544, 0, 7855, 1, 0, 0, 52485), -- Ultramafic Girdle
(142068, 25, 190429, 0, 7855, 1, 0, 0, 52485), -- Clasp of Ursine Rage
(142068, 24, 190202, 0, 7855, 1, 0, 0, 52485), -- Scoundrel's Missing Boots
(142068, 23, 190167, 0, 7855, 1, 0, 0, 52485), -- Vault Stalker's Greaves
(142068, 22, 190064, 0, 7855, 1, 0, 0, 52485), -- Ymirjar Berserker's Girdle
(142068, 21, 189870, 0, 7855, 1, 0, 0, 52485), -- Arcanofire Wrap
(142068, 20, 188249, 0, 7234, 1, 0, 0, 52485), -- Freezing Footguards
(142068, 19, 188248, 0, 7234, 1, 0, 0, 52485), -- Searing Stompers
(142068, 18, 188244, 0, 7235, 1, 0, 0, 52485), -- Virulent Gravetreaders
(142068, 17, 188243, 0, 7235, 1, 0, 0, 52485), -- Shadow-Stitched Stalkers
(142068, 16, 188237, 0, 7236, 1, 0, 0, 52485), -- Conjuror's Slippers
(142068, 15, 188236, 0, 7236, 1, 0, 0, 52485), -- Patroller's Footwear
(142068, 14, 151116, 0, 6211, 1, 50225, 0, 52485), -- Fashionable Undershirt
(142068, 13, 151120, 0, 6188, 1, 0, 0, 52485), -- Ensemble: Righteous Battleplate
(142068, 12, 151119, 0, 6188, 1, 4617, 0, 52485), -- Ensemble: Der'izu Armor
(142068, 11, 151118, 0, 6188, 1, 17097, 0, 52485), -- Ensemble: Obsidian Prowler's Garb
(142068, 10, 151117, 0, 6188, 1, 4619, 0, 52485), -- Ensemble: Mana-Etched Regalia
(142068, 9, 157577, 0, 6188, 1, 0, 0, 52485), -- Ensemble: Goldspine Plate
(142068, 8, 157576, 0, 6188, 1, 4617, 0, 52485), -- Ensemble: Crimson Sentinel Garb
(142068, 7, 157574, 0, 6188, 1, 17097, 0, 52485), -- Ensemble: Tundraspite Armor
(142068, 6, 157573, 0, 6188, 1, 4619, 0, 52485), -- Ensemble: Mindwrack Raiment
(142068, 5, 164378, 0, 6444, 1, 0, 0, 52485), -- Letter from an Admirer
(142068, 4, 168061, 0, 6188, 1, 0, 0, 52485), -- Ensemble: Amaranthine Path Armor
(142068, 3, 168060, 0, 6188, 1, 4617, 0, 52485), -- Ensemble: Chainmail of the Timeless Hunt
(142068, 2, 168059, 0, 6188, 1, 17097, 0, 52485), -- Ensemble: Restless Dreambound Battlegear
(142068, 1, 168058, 0, 6188, 1, 4619, 0, 52485); -- Ensemble: Tranquil Spiritbind Regalia

-- Model data
UPDATE `creature_model_info` SET `VerifiedBuild`=52485 WHERE `DisplayID` IN (82026, 82025, 81291, 82024, 78482, 81166, 82693, 76552, 13069, 24052, 80893, 84069, 981, 32789, 27681, 87647, 87053, 77698, 87630, 87790, 87631, 88318, 79015, 88613, 88262, 76422, 77496, 80754, 87649, 93838, 87549, 81321, 87611, 82988, 84110, 87612, 87600, 77466, 80180, 88317, 78471, 81366, 84577, 87583, 87599, 85963, 33519, 80858, 85964, 84544, 87634, 87628, 77532, 38804, 87581, 87601, 88608, 88264, 88614, 81363, 77054, 78631, 39631, 80178, 77851, 88502, 86025, 80752, 88482, 87780, 81802, 76515, 61205, 88605, 87375, 80753, 82814, 81345, 88606, 80767, 87791, 87793, 87183, 87786, 78633, 81160, 84555, 88493, 88611, 82546, 25073, 77940, 61206, 87796, 85962, 84557, 88612, 87713, 85967, 11686, 76547, 77691, 87792, 87376, 77936, 87584, 88610, 88528, 79014, 88609, 87795, 86026, 84554, 86763, 87788, 87781, 88265, 78472, 84551, 82545, 88615, 84559, 88152, 87797, 87794, 88607, 87648, 32646);
UPDATE `creature_model_info` SET `BoundingRadius`=0.20493490993976593, `CombatReach`=1.799999952316284179, `VerifiedBuild`=52485 WHERE `DisplayID`=86443;
UPDATE `creature_model_info` SET `BoundingRadius`=1.91371309757232666, `CombatReach`=2.5, `VerifiedBuild`=52485 WHERE `DisplayID`=78928;
UPDATE `creature_model_info` SET `BoundingRadius`=0.610213160514831542, `CombatReach`=2.20000004768371582, `VerifiedBuild`=52485 WHERE `DisplayID`=74793;
UPDATE `creature_model_info` SET `BoundingRadius`=0.208000004291534423, `CombatReach`=1.5, `VerifiedBuild`=52485 WHERE `DisplayID`=86640;
UPDATE `creature_model_info` SET `BoundingRadius`=0.830890655517578125, `CombatReach`=1, `VerifiedBuild`=52485 WHERE `DisplayID`=81194;
UPDATE `creature_model_info` SET `BoundingRadius`=0.6987152099609375, `CombatReach`=1.5, `VerifiedBuild`=52485 WHERE `DisplayID`=87769;
UPDATE `creature_model_info` SET `BoundingRadius`=0.515084505081176757, `VerifiedBuild`=52485 WHERE `DisplayID`=52723;
UPDATE `creature_model_info` SET `BoundingRadius`=0.616391122341156005, `CombatReach`=2.20000004768371582, `VerifiedBuild`=52485 WHERE `DisplayID`=87564;
UPDATE `creature_model_info` SET `BoundingRadius`=2.666666507720947265, `VerifiedBuild`=52485 WHERE `DisplayID`=76046;

 -- Creature 123642 smart ai
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 123642;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryOrGuid` IN (-(@CGUID+10), -(@CGUID+11));
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(-(@CGUID+10), 0, 0, 0, '', 34, 0, 100, 0, 2, 3, 0, 0, 80, 12364200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 3 - Self: Start timed action list id #12364200 (update out of combat)'),
(-(@CGUID+10), 0, 1, 0, '', 34, 0, 100, 0, 2, 10, 0, 0, 80, 12364200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 10 - Self: Start timed action list id #12364200 (update out of combat)'),
(-(@CGUID+11), 0, 0, 0, '', 34, 0, 100, 0, 2, 4, 0, 0, 80, 14031301, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 4 - Self: Start timed action list id #14031301 (update out of combat)'),
(-(@CGUID+11), 0, 1, 0, '', 34, 0, 100, 0, 2, 6, 0, 0, 80, 14031301, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 6 - Self: Start timed action list id #14031301 (update out of combat)'),
(-(@CGUID+11), 0, 2, 0, '', 34, 0, 100, 0, 2, 15, 0, 0, 80, 14031301, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 15 - Self: Start timed action list id #14031301 (update out of combat)'),
(-(@CGUID+11), 0, 3, 0, '', 34, 0, 100, 0, 2, 15, 0, 0, 66, 0, 0, 0, 0, 0, 0, 10, (@CGUID+5), 142094, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 15 - Self: set Orientation to Ninette Shoames (SpawnID)'),
(-(@CGUID+11), 0, 4, 0, '', 34, 0, 100, 0, 2, 19, 0, 0, 80, 14031301, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On movement of type WAYPOINT_MOTION_TYPE inform, point 19 - Self: Start timed action list id #14031301 (update out of combat)');

 -- Creature 143263 smart ai
SET @ENTRY := 143263;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = @ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryOrGuid` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 0, 0, '', 60, 0, 100, 0, 2000, 6000, 6000, 8000, 5, 92, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Every 6 - 8 seconds (2 - 6s initially) - Self: Play emote 92');

-- Timed list 12364200 smart ai
SET @ENTRY := 12364200;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryOrGuid` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 9, 0, 0, '', 0, 0, 100, 0, 1000, 1000, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'After 1 seconds - Self: Play emote 1'),
(@ENTRY, 9, 1, 0, '', 0, 0, 100, 0, 2000, 2000, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'After 2 seconds - Self: Play emote 1'),
(@ENTRY, 9, 2, 0, '', 0, 0, 100, 0, 2000, 2000, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'After 2 seconds - Self: Play emote 1');

-- Timed list 14031301 smart ai
SET @ENTRY := 14031301;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryOrGuid` = @ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 9, 0, 0, '', 0, 0, 100, 0, 1000, 1000, 0, 0, 5, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'After 1 seconds - Self: Play emote 6'),
(@ENTRY, 9, 1, 0, '', 0, 0, 100, 0, 2000, 2000, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'After 2 seconds - Self: Play emote 1'),
(@ENTRY, 9, 2, 0, '', 0, 0, 100, 0, 2000, 2000, 0, 0, 5, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'After 2 seconds - Self: Play emote 1');

-- Waypoints for CGUID+10
SET @ENTRY := 123642;
SET @PATHOFFSET := 0;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

UPDATE `creature` SET `position_x`= 1131.306, `position_y`= -582.4011, `position_z`= 17.28486, `orientation`= 0, `wander_distance`= 0, `MovementType`= 2 WHERE `guid`= @CGUID+10;
DELETE FROM `creature_addon` WHERE `guid`= @CGUID+10;
INSERT INTO `creature_addon` (`guid`, `pathid`, `SheathState`) VALUES
(@CGUID+10, @PATH, 1);

-- Waypoints for CGUID+11
SET @ENTRY := 140313;
SET @PATHOFFSET := 1;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

UPDATE `creature` SET `position_x`= 1119.635, `position_y`= -591.6441, `position_z`= 17.26168, `orientation`= 0, `wander_distance`= 0, `MovementType`= 2 WHERE `guid`= @CGUID+11;
DELETE FROM `creature_addon` WHERE `guid`= @CGUID+11;
INSERT INTO `creature_addon` (`guid`, `pathid`, `SheathState`) VALUES
(@CGUID+11, @PATH, 0);

-- Waypoints for CGUID+12
DELETE FROM `creature_formations` WHERE `leaderGUID` = @CGUID+12;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@CGUID+12, @CGUID+12, 0, 0, 515, 0, 0),
(@CGUID+12, @CGUID+13, 3, 270, 515, 0, 17);

SET @ENTRY := 124180;
SET @PATHOFFSET := 0;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

UPDATE `creature` SET `position_x`= 1132.74, `position_y`= -570.5972, `position_z`= 17.26285, `orientation`= 0, `wander_distance`= 0, `MovementType`= 2 WHERE `guid`= @CGUID+12;
UPDATE `creature` SET `position_x`= 1132.74, `position_y`= -570.5972, `position_z`= 17.26285 WHERE `guid`= @CGUID+13;
DELETE FROM `creature_addon` WHERE `guid`= @CGUID+12;
INSERT INTO `creature_addon` (`guid`, `pathid`, `SheathState`) VALUES
(@CGUID+12, @PATH, 1);

-- Waypoints for CGUID+14
SET @ENTRY := 143244;
SET @PATHOFFSET := 0;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

UPDATE `creature` SET `position_x`= 1163.563, `position_y`= -586.507, `position_z`= 29.24529, `orientation`= 0, `wander_distance`= 0, `MovementType`= 2 WHERE `guid`= @CGUID+14;
DELETE FROM `creature_addon` WHERE `guid`= @CGUID+14;
INSERT INTO `creature_addon` (`guid`, `pathid`, `SheathState`) VALUES
(@CGUID+14, @PATH, 1);

-- Waypoints for CGUID+15
DELETE FROM `creature_formations` WHERE `leaderGUID` = @CGUID+15;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@CGUID+15, @CGUID+15, 0, 0, 515, 0, 0),
(@CGUID+15, @CGUID+16, 2, 270, 515, 24, 78);

SET @ENTRY := 125005;
SET @PATHOFFSET := 0;
SET @PATH := @ENTRY * 100 + @PATHOFFSET;

UPDATE `creature` SET `position_x`= 1148.431, `position_y`= -602.0775, `position_z`= 28.76035, `orientation`= 0, `wander_distance`= 0, `MovementType`= 2 WHERE `guid`= @CGUID+15;
UPDATE `creature` SET `position_x`= 1148.431, `position_y`= -602.0775, `position_z`= 28.76035 WHERE `guid`= @CGUID+16;
DELETE FROM `creature_addon` WHERE `guid`= @CGUID+15;
INSERT INTO `creature_addon` (`guid`, `pathid`, `SheathState`) VALUES
(@CGUID+15, @PATH, 1);
