SET @OGUID := 3006013;

-- Gameobject templates

UPDATE `gameobject_template_addon` SET `faction`=35 WHERE `entry`=208142; -- Candy Bucket

-- Quests
DELETE FROM `quest_offer_reward` WHERE `ID`=28982;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(28982, 0, 0, 0, 0, 0, 0, 0, 0, 'Candy buckets like this are located in inns throughout the realms. Go ahead... take some!', 51886); -- Candy Bucket

DELETE FROM `gameobject_queststarter` WHERE `id`=208142;
INSERT INTO `gameobject_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES
(208142, 28982, 51886);

UPDATE `gameobject_questender` SET `VerifiedBuild`=51886 WHERE (`id`=208142 AND `quest`=28982);

DELETE FROM `game_event_gameobject_quest` WHERE `id`=208142;

-- Old gameobject spawns
DELETE FROM `gameobject` WHERE `guid` BETWEEN 231800 AND 231829;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN 231800 AND 231829;

-- Gameobject spawns
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+29;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 180406, 0, 5144, 5005, '0', 0, 0, -6144.44091796875, 4290.32666015625, -347.984771728515625, 1.605701684951782226, 0, 0, 0.719339370727539062, 0.694658815860748291, 120, 255, 1, 51886), -- G_Pumpkin_02 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+1, 180407, 0, 5144, 5005, '0', 0, 0, -6138.8125, 4306.08837890625, -347.75445556640625, 1.588248729705810546, 0, 0, 0.713250160217285156, 0.700909554958343505, 120, 255, 1, 51886), -- G_Pumpkin_03 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+2, 180411, 0, 5144, 5005, '0', 0, 0, -6107.95849609375, 4300.85595703125, -346.072479248046875, 1.256635904312133789, 0, 0, 0.587784767150878906, 0.809017360210418701, 120, 255, 1, 51886), -- G_Ghost_01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+3, 180415, 0, 5144, 5005, '0', 0, 0, -6145.1943359375, 4300.970703125, -344.564849853515625, 6.195919513702392578, 0, 0, -0.04361915588378906, 0.999048233032226562, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+4, 180415, 0, 5144, 5005, '0', 0, 0, -6143.15283203125, 4297.56005859375, -347.13958740234375, 0.15707901120185852, 0, 0, 0.078458786010742187, 0.996917366981506347, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+5, 180415, 0, 5144, 5005, '0', 0, 0, -6143.11279296875, 4297.22998046875, -347.1011962890625, 4.520402908325195312, 0, 0, -0.77162456512451171, 0.636078238487243652, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+6, 180415, 0, 5144, 5005, '0', 0, 0, -6104.96337890625, 4299.21728515625, -346.190338134765625, 4.101525306701660156, 0, 0, -0.88701057434082031, 0.461749136447906494, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+7, 180415, 0, 5144, 5005, '0', 0, 0, -6145.8818359375, 4293.13720703125, -345.156402587890625, 0.15707901120185852, 0, 0, 0.078458786010742187, 0.996917366981506347, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+8, 180415, 0, 5144, 5005, '0', 0, 0, -6106.67041015625, 4295.884765625, -348.025115966796875, 0.087265998125076293, 0, 0, 0.043619155883789062, 0.999048233032226562, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+9, 180415, 0, 5144, 5005, '0', 0, 0, -6104.8974609375, 4296.7568359375, -346.190338134765625, 3.403396368026733398, 0, 0, -0.99144458770751953, 0.130528271198272705, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+10, 180415, 0, 5144, 5005, '0', 0, 0, -6143.14599609375, 4301.703125, -342.964019775390625, 2.565631866455078125, 0, 0, 0.958819389343261718, 0.284016460180282592, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+11, 180415, 0, 5144, 5005, '0', 0, 0, -6144.8662109375, 4292.81689453125, -345.90850830078125, 3.490667104721069335, 0, 0, -0.98480701446533203, 0.173652306199073791, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+12, 180415, 0, 5144, 5005, '0', 0, 0, -6101.0869140625, 4294.24560546875, -345.081085205078125, 3.717553615570068359, 0, 0, -0.95881938934326171, 0.284016460180282592, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+13, 180415, 0, 5144, 5005, '0', 0, 0, -6108.283203125, 4297.7099609375, -344.280670166015625, 3.665196180343627929, 0, 0, -0.96592521667480468, 0.258821308612823486, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+14, 180415, 0, 5144, 5005, '0', 0, 0, -6101.4150390625, 4293.20751953125, -346.654449462890625, 3.682650327682495117, 0, 0, -0.96362972259521484, 0.26724100112915039, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+15, 180415, 0, 5144, 5005, '0', 0, 0, -6146.1943359375, 4300.265625, -343.88470458984375, 6.12610626220703125, 0, 0, -0.07845878601074218, 0.996917366981506347, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+16, 180415, 0, 5144, 5005, '0', 0, 0, -6146.97900390625, 4291.50341796875, -344.685333251953125, 0.15707901120185852, 0, 0, 0.078458786010742187, 0.996917366981506347, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+17, 180415, 0, 5144, 5005, '0', 0, 0, -6140.13037109375, 4304.68310546875, -347.604339599609375, 0.959929943084716796, 0, 0, 0.461748123168945312, 0.887011110782623291, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+18, 180415, 0, 5144, 5005, '0', 0, 0, -6140.5068359375, 4310.53466796875, -345.58282470703125, 4.729844093322753906, 0, 0, -0.70090866088867187, 0.713251054286956787, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+19, 180415, 0, 5144, 5005, '0', 0, 0, -6107.2900390625, 4297.236328125, -345.842681884765625, 3.281238555908203125, 0, 0, -0.99756336212158203, 0.069766148924827575, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+20, 180415, 0, 5144, 5005, '0', 0, 0, -6142.33349609375, 4301.017578125, -344.49517822265625, 1.343901276588439941, 0, 0, 0.622513771057128906, 0.78260880708694458, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+21, 180415, 0, 5144, 5005, '0', 0, 0, -6103.9931640625, 4296.009765625, -346.61578369140625, 3.717553615570068359, 0, 0, -0.95881938934326171, 0.284016460180282592, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+22, 180415, 0, 5144, 5005, '0', 0, 0, -6106.53466796875, 4299.64599609375, -346.190338134765625, 4.48549652099609375, 0, 0, -0.7826080322265625, 0.622514784336090087, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+23, 180415, 0, 5144, 5005, '0', 0, 0, -6139.6181640625, 4311.69091796875, -344.61572265625, 2.478367090225219726, 0, 0, 0.94551849365234375, 0.325568377971649169, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+24, 180415, 0, 5144, 5005, '0', 0, 0, -6102.23779296875, 4296.8212890625, -346.190338134765625, 2.303830623626708984, 0, 0, 0.913544654846191406, 0.406738430261611938, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+25, 180415, 0, 5144, 5005, '0', 0, 0, -6145.7412109375, 4290.7578125, -343.474945068359375, 1.989672422409057617, 0, 0, 0.838669776916503906, 0.544640243053436279, 120, 255, 1, 51886), -- CandleBlack01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+26, 180425, 0, 5144, 5005, '0', 0, 0, -6105.22412109375, 4293.994140625, -348.282012939453125, 3.961898565292358398, 0, 0, -0.91705989837646484, 0.398749500513076782, 120, 255, 1, 51886), -- SkullCandle01 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+27, 180523, 0, 5144, 5005, '0', 0, 0, -6116.1650390625, 4298.72412109375, -348.054351806640625, 0, 0, 0, 0, 1, 120, 255, 1, 51886), -- Apple Bob (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+28, 208078, 0, 5144, 5005, '0', 0, 0, -6108.40087890625, 4296.0927734375, -346.877838134765625, 0.034906249493360519, 0, 0, 0.017452239990234375, 0.999847710132598876, 120, 255, 1, 51886), -- G_Pumpkin_01 scale 0.5 (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1
(@OGUID+29, 208142, 0, 5144, 5005, '0', 0, 0, -6110.24853515625, 4295.8662109375, -348.335113525390625, 5.724681377410888671, 0, 0, -0.27563667297363281, 0.961261868476867675, 120, 255, 1, 51886); -- Candy Bucket (Area: Silver Tide Hollow - Difficulty: 0) CreateObject1

-- Event spawns
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=12 AND `guid` BETWEEN @OGUID+0 AND @OGUID+29;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9),
(12, @OGUID+10),
(12, @OGUID+11),
(12, @OGUID+12),
(12, @OGUID+13),
(12, @OGUID+14),
(12, @OGUID+15),
(12, @OGUID+16),
(12, @OGUID+17),
(12, @OGUID+18),
(12, @OGUID+19),
(12, @OGUID+20),
(12, @OGUID+21),
(12, @OGUID+22),
(12, @OGUID+23),
(12, @OGUID+24),
(12, @OGUID+25),
(12, @OGUID+26),
(12, @OGUID+27),
(12, @OGUID+28),
(12, @OGUID+29);
