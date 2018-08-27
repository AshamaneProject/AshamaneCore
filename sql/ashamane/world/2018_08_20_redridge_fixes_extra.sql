-- Partial Redridge fixup

UPDATE `quest_template`
SET `QuestType` = 0,
`Flags` = 65536,
`StartItem` = 0
WHERE `ID` = 26520;

DELETE FROM `quest_poi`
WHERE `QuestID` = 26520;

DELETE FROM `quest_poi_points`
WHERE `QuestID` = 26520;

DELETE FROM `quest_objectives`
WHERE `QuestID` = 26520;

DELETE FROM `quest_template_addon`
WHERE `ID` = 26520;

-- remove foreman oslow spawn and rock
DELETE FROM `creature`
WHERE `id`= 341;

DELETE FROM `creature`
WHERE `id`= 43196;

DELETE FROM `creature_addon`
WHERE `guid` = 185525;

-- fix quests not able to be taken
UPDATE `quest_template`
SET `AllowableRaces` = 18446744073709551615
WHERE `ID` IN (26567);

-- fix colonel troteman not giving quests
UPDATE `creature_template`
SET `npcflag` = 2
WHERE `entry` = 43221;

-- do not allow jorgenson quest without messner free
UPDATE `quest_template_addon`
SET `PrevQuestID` = 26587
WHERE `ID` = 26560;

-- allow different messner to give quest
UPDATE `creature_queststarter`
SET `id` = 43270
WHERE `quest` = 26560;

-- do not allow krakauer quest without jorgenson free
UPDATE `quest_template_addon`
SET `PrevQuestID` = 26560
WHERE `ID` = 26561;

-- allow different jorgenson to give quest
UPDATE `creature_queststarter`
SET `id` = 43272
WHERE `quest` = 26561;

-- reduce health of overlord barbarius
UPDATE creature
SET curhealth = 1400
WHERE guid = 185316;

-- make krakauer visible
UPDATE `creature_template_addon`
SET `auras` = ''
WHERE `entry` = 43274;

-- allow different krakauer to give quest
UPDATE `creature_queststarter`
SET `id` = 43274
WHERE `quest` = 26562;

-- do not allow danforth quest without krakauer free
UPDATE `quest_template_addon`
SET `PrevQuestID` = 26561
WHERE `ID` = 26562;

-- put danforth underwater
UPDATE `creature`
SET `position_z` = 131.136
WHERE `guid` = 185315;

-- allow danforth to stay underwater
UPDATE creature_template_addon
SET auras = '',
bytes1 = 1048576
WHERE entry = 43275;

-- delete danforth overspawn
DELETE FROM `creature`
WHERE `id` = 43302;

-- allow different danforth to give quest
UPDATE `creature_queststarter`
SET `id` = 43275
WHERE `quest` = 26563;

-- its never over should not be available before they drew first blood
UPDATE `quest_template_addon`
SET `PrevQuestID` = 26607
WHERE `ID` = 26616;

UPDATE creature_template
SET ScriptName = 'npc_keeshan_riverboat',
speed_walk = 3,
HoverHeight = 10,
InhabitType = 7
WHERE entry = 43450;

-- delete unwanted riverboat spawn
DELETE FROM creature
WHERE id = 43450;

DELETE FROM `spell_target_position` WHERE  (`ID`=81243 AND `EffectIndex`=0);
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `VerifiedBuild`) VALUES
(81243, 0, 1, -9300.98, -2363.67, 55.5838, 24015); -- Spell: Summon Keeshan's Riverboat Efffect: 28 (SPELL_EFFECT_SUMMON)

DELETE FROM `npc_spellclick_spells`
WHERE `npc_entry` = 43443;

INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(43443, 81243, 3, 0);

UPDATE `creature_template`
SET `npcflag` = 16777216
WHERE `entry` = 43443;

DELETE FROM `creature`
WHERE `guid` = 61907;

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
 VALUES
(61907, 43443, 0, 44, 69, 1, 0, 0, 0, 0, -9300.98, -2363.68, 55.66713, 3.804818, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015);

-- hack for its never over (just cannot get spell quest credit to work)
UPDATE `quest_template`
SET `QuestType` = 0,
`Flags` = 65536
WHERE `ID` = 26616;

DELETE FROM `quest_poi`
WHERE (`QuestID` = 26616 AND BlobIndex = 1);

UPDATE quest_poi
SET Flags = 1
WHERE (`QuestID` = 26616 AND BlobIndex = 0);

DELETE FROM `quest_objectives`
WHERE `QuestID` = 26616;

-- somebody spawned azoran in redridge as a joke
DELETE FROM creature
WHERE guid = 10643335;

UPDATE `creature_template`
SET `ScriptName` = 'npc_blackrock_tower'
WHERE `entry` = 43590;

UPDATE `creature_template`
SET `ScriptName` = 'npc_munitions_dump'
WHERE `entry` = 43589;

-- hack quest detonation
UPDATE `quest_template`
SET `QuestType` = 0,
`Flags` = 65536
WHERE `ID` = 26668;

-- reduce amount of soldiers due to problems spawning 200 creatures in phasing
UPDATE `quest_template`
SET `LogDescription` = 'Kill 10 Blackrock Soldiers'
WHERE `ID` = 26708;

UPDATE `quest_objectives`
SET `Amount` = 10
WHERE `QuestID` = 26708;

-- colonel troteman not in a mountain
UPDATE `quest_poi_points`
SET `X` = -9636,
`Y` = -3475
WHERE (`QuestID` = 26708 AND `Idx1` = 1);

UPDATE `quest_poi_points`
SET `X` = -9636,
`Y` = -3475
WHERE (`QuestID` = 26713 AND `Idx1` = 2);

UPDATE `quest_poi_points`
SET `X` = -9636,
`Y` = -3475
WHERE (`QuestID` = 26714 AND `Idx1` = 0);

-- Remove overspawns and add missing rares
DELETE FROM `creature` WHERE `guid` IN (61912,61877,5765,308248,5395,302487,118414,52891,185353);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(61912, 14272, 0, 0, 0, 1, 0, 0, 0, 0, -9553.5, -2388.502, 99.86586, 5.044002, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 24015), -- Snarlflare
(61877, 616, 0, 0, 0, 1, 0, 0, 0, 0, -9101.009, -2454.14, 120.4729, 5.413383, 3600, 6, 0, 0, 0, 1, 0, 0, 0, 24015), -- Chatter
(5765, 14270, 0, 0, 0, 1, 0, 0, 0, 0, -9236.906, -2448.561, 57.06998, 4.921828, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 24015), -- Squiddic
(308248, 14271, 0, 0, 0, 1, 0, 0, 0, 0, -9562.991, -2253.339, 85.65274, 5.462881, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 24015); -- Ribchaser
-- Rare fixups
UPDATE `creature` SET`spawntimesecs`=3600 WHERE `id` IN (14269,52146,14273,584);
UPDATE `creature_template` SET `ExperienceModifier`=7.5 WHERE `entry` IN (14269,52146,14273,584,616,14270,14271,947);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (428);

-- Vernon Hale Entry: 1678
UPDATE `creature` SET `spawndist`=2,`MovementType`=1,`position_x`=-9267.604,`position_y`=-2167.748,`position_z`=63.06792 WHERE `guid`=184907;

DELETE FROM `creature_template_addon` WHERE `entry`=43533;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (43533,0,25831,0,1,0, '');

-- Pathing for Erin Entry: 850
SET @NPC := 184772;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9216.157,-2147.64,64.35393,0,0,0,0,100,0),
(@PATH,2,-9216.157,-2147.64,64.35393,4.677482,60000,0,0,100,0),
(@PATH,3,-9216.725,-2154.311,64.84718,0,0,1,0,100,0),
(@PATH,4,-9221.725,-2155.061,64.34718,0,0,1,0,100,0),
(@PATH,5,-9231.475,-2154.811,64.84718,0,0,1,0,100,0),
(@PATH,6,-9236.975,-2156.061,64.84718,0,0,1,0,100,0),
(@PATH,7,-9237.975,-2149.061,64.84718,0,0,1,0,100,0),
(@PATH,8,-9248.725,-2147.811,64.34718,0,0,1,0,100,0),
(@PATH,9,-9256.475,-2137.311,64.34718,0,0,1,0,100,0),
(@PATH,10,-9251.725,-2119.311,66.09718,0,0,1,0,100,0),
(@PATH,11,-9253.975,-2112.311,66.59718,0,0,1,0,100,0),
(@PATH,12,-9263.293,-2104.982,66.34043,0,30000,1,0,100,0),
(@PATH,13,-9249.603,-2116.334,66.28384,0,0,0,0,100,0),
(@PATH,14,-9253.45,-2147.048,64.0928,0,0,0,0,100,0),
(@PATH,15,-9270.047,-2158.443,61.40715,0,0,0,0,100,0),
(@PATH,16,-9288.75,-2158.962,60.97298,0,0,0,0,100,0),
(@PATH,17,-9310.324,-2149.189,63.4833,0,30000,0,0,100,0),
(@PATH,18,-9278.817,-2159.886,59.22551,0,0,1,0,100,0),
(@PATH,19,-9258.45,-2146.429,64.08644,0,0,1,0,100,0),
(@PATH,20,-9247.437,-2116.01,66.36197,0,0,1,0,100,0),
(@PATH,21,-9239.378,-2088.349,75.52158,0,0,1,0,100,0),
(@PATH,22,-9219.389,-2090.297,81.70964,0,0,1,0,100,0),
(@PATH,23,-9196.93,-2092.504,87.82926,0,0,1,0,100,0),
(@PATH,24,-9174.333,-2109.712,88.95148,0,45000,1,0,100,0),
(@PATH,25,-9188.83,-2099.061,87.90267,0,0,1,0,100,0),
(@PATH,26,-9214.83,-2090.061,83.15267,0,0,1,0,100,0),
(@PATH,27,-9236.58,-2086.311,76.40267,0,0,1,0,100,0),
(@PATH,28,-9245.83,-2110.561,68.40267,0,0,1,0,100,0),
(@PATH,29,-9255.83,-2135.561,64.40267,0,0,1,0,100,0),
(@PATH,30,-9254.08,-2148.061,64.40267,0,0,1,0,100,0),
(@PATH,31,-9237.33,-2148.561,64.65267,0,0,1,0,100,0),
(@PATH,32,-9237.33,-2156.311,64.65267,0,0,1,0,100,0),
(@PATH,33,-9231.33,-2154.811,64.65267,0,0,1,0,100,0),
(@PATH,34,-9218.33,-2155.061,64.65267,0,0,1,0,100,0),
(@PATH,35,-9216.328,-2150.409,64.35387,0,0,0,0,100,0);

-- Pathing for Rachel Entry: 849
SET @NPC := 184769;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9314.393,`position_y`=-2212.16,`position_z`=61.89775 WHERE `guid`=@NPC;
UPDATE `creature` SET `position_x`=-9314.393,`position_y`=-2212.16,`position_z`=61.89775 WHERE `guid`=334713;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9314.393,-2212.16,61.89775,0,0,1,0,100,0),
(@PATH,2,-9288.709,-2208.389,62.71504,0,0,1,0,100,0),
(@PATH,3,-9284.022,-2178.648,60.0108,0,0,1,0,100,0),
(@PATH,4,-9273.287,-2164.192,61.05413,0,0,1,0,100,0),
(@PATH,5,-9264.93,-2132.723,64.42447,0,0,1,0,100,0),
(@PATH,6,-9227.58,-2127.894,64.05843,0,0,1,0,100,0),
(@PATH,7,-9205.659,-2136.823,64.05843,0,0,1,0,100,0),
(@PATH,8,-9192.083,-2135.294,64.48763,0,0,1,0,100,0),
(@PATH,9,-9184.473,-2145.096,64.05843,0,0,1,0,100,0),
(@PATH,10,-9182.216,-2161.026,64.05843,0,0,1,0,100,0),
(@PATH,11,-9179.342,-2184.792,64.05842,0,0,1,0,100,0),
(@PATH,12,-9192.17,-2203.578,64.04914,0,0,1,0,100,0),
(@PATH,13,-9194.929,-2182.834,64.05842,0,0,1,0,100,0),
(@PATH,14,-9208.972,-2174.013,64.05842,0,0,1,0,100,0),
(@PATH,15,-9226.036,-2174.073,64.05842,0,0,1,0,100,0),
(@PATH,16,-9243.988,-2174.786,63.93879,0,0,1,0,100,0),
(@PATH,17,-9254.622,-2182.467,64.01193,0,0,1,0,100,0),
(@PATH,18,-9262.729,-2193.827,64.08961,0,0,1,0,100,0),
(@PATH,19,-9261.979,-2204.166,64.05842,0,0,1,0,100,0),
(@PATH,20,-9289.273,-2213.344,62.67256,0,0,1,0,100,0),
(@PATH,21,-9315.625,-2213.448,61.89775,0,0,1,0,100,0),
(@PATH,22,-9342.124,-2208.642,61.89775,0,0,1,0,100,0),
(@PATH,23,-9344.12,-2183.702,61.89775,0,0,1,0,100,0),
(@PATH,24,-9335.428,-2185.067,61.89775,0,0,1,0,100,0),
(@PATH,25,-9342.166,-2208.277,61.89775,0,0,1,0,100,0);
-- Set Formation/Group Combat Assistance
DELETE FROM `creature_formations` WHERE `leaderGUID`=@NPC;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,334713,2,360,2,0,0);

-- Pathing for Amy Davenport Entry: 777
SET @NPC := 184754;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9261.723,`position_y`=-2199.517,`position_z`=63.93879 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9261.723,-2199.517,63.93879,0,30000,0,0,100,0),
(@PATH,2,-9262.126,-2204.121,64.05842,0,0,0,0,100,0),
(@PATH,3,-9260.208,-2203.088,64.05842,0,0,0,0,100,0),
(@PATH,4,-9260.208,-2203.088,64.05842,3.333579,40000,0,0,100,0);

-- Pathing for Redridge Alpha Entry: 445
SET @NPC := 185108;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8989.48,`position_y`=-2259.67,`position_z`=138.7549 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8989.48,-2259.67,138.7549,0,0,0,0,100,0),
(@PATH,2,-8999.98,-2242.78,143.3781,0,0,0,0,100,0),
(@PATH,3,-9005.75,-2223.12,133.9867,0,0,0,0,100,0),
(@PATH,4,-9015.22,-2210.16,132.7043,0,0,0,0,100,0),
(@PATH,5,-9005.75,-2223.12,133.9867,0,0,0,0,100,0),
(@PATH,6,-8999.98,-2242.78,143.3781,0,0,0,0,100,0);

-- Pathing for Alma Jainrose Entry: 812
SET @NPC := 184760;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9237.784,`position_y`=-2041.65,`position_z`=78.16777 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9237.784,-2041.65,78.16777,0,40000,0,0,100,0),
(@PATH,2,-9235.044,-2035.057,78.16726,0,0,0,0,100,0),
(@PATH,3,-9234.279,-2033.733,78.1694,0,0,0,0,100,0),
(@PATH,4,-9234.279,-2033.733,78.1694,3.961897,45000,0,0,100,0);

-- Pathing for Guard Clarke Entry: 934
SET @NPC := 184853;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9344.355,`position_y`=-2206.349,`position_z`=61.89775 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9344.355,-2206.349,61.89775,0,0,0,0,100,0),
(@PATH,2,-9335.028,-2207.953,61.89775,0,0,0,0,100,0),
(@PATH,3,-9322.396,-2210.031,61.89775,0,0,0,0,100,0),
(@PATH,4,-9311.435,-2210.67,61.89775,0,0,0,0,100,0),
(@PATH,5,-9297.224,-2212.776,61.89775,0,0,0,0,100,0),
(@PATH,6,-9285.208,-2216.076,63.25996,0,0,0,0,100,0),
(@PATH,7,-9284.114,-2226.769,63.39107,0,0,0,0,100,0),
(@PATH,8,-9283.647,-2243.695,63.57106,0,0,0,0,100,0),
(@PATH,9,-9281.135,-2260.52,65.97218,0,0,0,0,100,0),
(@PATH,10,-9275.419,-2273.584,67.4109,0,0,0,0,100,0),
(@PATH,11,-9271.06,-2266.026,66.2466,0,0,0,0,100,0),
(@PATH,12,-9270.646,-2245.761,64.04616,0,0,0,0,100,0),
(@PATH,13,-9269.661,-2222.433,64.04756,0,0,0,0,100,0),
(@PATH,14,-9268.26,-2200.005,64.05788,0,0,0,0,100,0),
(@PATH,15,-9266.45,-2182.234,64.08961,0,0,0,0,100,0),
(@PATH,16,-9268.26,-2200.005,64.05788,0,0,0,0,100,0),
(@PATH,17,-9269.661,-2222.433,64.04756,0,0,0,0,100,0),
(@PATH,18,-9270.646,-2245.761,64.04616,0,0,0,0,100,0),
(@PATH,19,-9271.06,-2266.026,66.2466,0,0,0,0,100,0),
(@PATH,20,-9275.419,-2273.584,67.4109,0,0,0,0,100,0),
(@PATH,21,-9281.135,-2260.52,65.97218,0,0,0,0,100,0),
(@PATH,22,-9283.647,-2243.695,63.57106,0,0,0,0,100,0),
(@PATH,23,-9284.114,-2226.769,63.39107,0,0,0,0,100,0),
(@PATH,24,-9285.208,-2216.076,63.25996,0,0,0,0,100,0),
(@PATH,25,-9296.33,-2212.813,61.89775,0,0,0,0,100,0),
(@PATH,26,-9311.435,-2210.67,61.89775,0,0,0,0,100,0),
(@PATH,27,-9322.396,-2210.031,61.89775,0,0,0,0,100,0),
(@PATH,28,-9335.001,-2207.957,61.89775,0,0,0,0,100,0);

-- Pathing for Guard Adams Entry: 936
SET @NPC := 184855;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9212.636,`position_y`=-2174.064,`position_z`=64.05842 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9212.636,-2174.064,64.05842,0,0,0,0,100,0),
(@PATH,2,-9245.297,-2171.292,63.93879,0,0,0,0,100,0),
(@PATH,3,-9245.685,-2167.466,63.93879,0,30000,0,0,100,0),
(@PATH,4,-9253.704,-2167.139,64.05788,0,0,0,0,100,0),
(@PATH,5,-9254.052,-2135.928,63.93991,0,0,0,0,100,0),
(@PATH,6,-9246.497,-2115.215,66.55289,0,0,0,0,100,0),
(@PATH,7,-9243.474,-2098.984,72.62241,0,0,0,0,100,0),
(@PATH,8,-9239.848,-2075.51,75.75473,0,0,0,0,100,0),
(@PATH,9,-9234.389,-2072.974,76.53476,0,0,0,0,100,0),
(@PATH,10,-9234.089,-2083.617,76.79282,0,0,0,0,100,0),
(@PATH,11,-9220.588,-2089.068,81.41252,0,0,0,0,100,0),
(@PATH,12,-9206.651,-2088.978,86.12273,0,0,0,0,100,0),
(@PATH,13,-9189.044,-2094.362,87.86027,0,15000,0,0,100,0),
(@PATH,14,-9235.082,-2087.048,76.55405,0,0,0,0,100,0),
(@PATH,15,-9245.788,-2099.052,72.19589,0,0,0,0,100,0),
(@PATH,16,-9246.594,-2118.702,65.59097,0,0,0,0,100,0),
(@PATH,17,-9232.146,-2130.648,64.05843,0,0,0,0,100,0),
(@PATH,18,-9212.241,-2135.419,64.05843,0,0,0,0,100,0),
(@PATH,19,-9187.412,-2138.506,64.00642,0,0,0,0,100,0),
(@PATH,20,-9187.227,-2160.702,64.05843,0,0,0,0,100,0);

-- Pathing for Dorin Songblade Entry: 956
SET @NPC := 184870;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9247.676,`position_y`=-2240.278,`position_z`=64.05842 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9247.676,-2240.278,64.05842,0,0,0,0,100,0),
(@PATH,2,-9247.676,-2240.278,64.05842,2.583087,42000,0,0,100,0),
(@PATH,3,-9250.197,-2244.496,64.05842,0,42000,0,0,100,0);

-- Make all other Blackrock Hunters random movement
UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `id`=4462 AND `MovementType`=0;

-- Pathing for Canyon Ettin Entry: 43094
SET @NPC := 185448;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9105.46,`position_y`=-2208.16,`position_z`=126.5163 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9105.46,-2208.16,126.5163,0,0,0,0,100,0),
(@PATH,2,-9134.289,-2211.389,121.312,0,0,0,0,100,0),
(@PATH,3,-9137.49,-2173.55,121.3245,0,0,0,0,100,0),
(@PATH,4,-9127.85,-2137.67,123.4426,0,0,0,0,100,0),
(@PATH,5,-9128.25,-2095.07,122.8061,0,0,0,0,100,0),
(@PATH,6,-9103.65,-2086.67,127.4204,0,0,0,0,100,0),
(@PATH,7,-9117.41,-2069.33,128.6535,0,0,0,0,100,0),
(@PATH,8,-9111.11,-2064.42,128.7022,0,0,0,0,100,0),
(@PATH,9,-9093.48,-2076.93,128.7146,0,0,0,0,100,0),
(@PATH,10,-9070.16,-2087.55,129.0393,0,0,0,0,100,0),
(@PATH,11,-9039.8,-2095.06,130.9568,0,0,0,0,100,0),
(@PATH,12,-9015.53,-2091.76,132.5085,0,0,0,0,100,0),
(@PATH,13,-9002.63,-2119.99,137.521,0,0,0,0,100,0),
(@PATH,14,-9002.05,-2138.25,143.4562,0,0,0,0,100,0),
(@PATH,15,-9001.05,-2160,133.3666,0,0,0,0,100,0),
(@PATH,16,-9009.8,-2185.88,136.2239,0,0,0,0,100,0),
(@PATH,17,-9041.53,-2193.89,131.472,0,0,0,0,100,0),
(@PATH,18,-9068.82,-2174.21,132.5518,0,0,0,0,100,0),
(@PATH,19,-9087,-2190.03,132.4278,0,0,0,0,100,0);

-- Pathing for Canyon Ettin Entry: 43094
SET @NPC := 185597;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8923.51,`position_y`=-2304.27,`position_z`=133.0706 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8923.51,-2304.27,133.0706,0,0,0,0,100,0),
(@PATH,2,-8931.27,-2331.67,132.8773,0,0,0,0,100,0),
(@PATH,3,-8962.34,-2333.7,132.5694,0,0,0,0,100,0),
(@PATH,4,-8982.57,-2351.04,132.5728,0,0,0,0,100,0),
(@PATH,5,-9000.23,-2379.13,132.4703,0,0,0,0,100,0),
(@PATH,6,-9017.43,-2401.64,130.3283,0,0,0,0,100,0),
(@PATH,7,-9021.813,-2423.211,131.7126,0,0,0,0,100,0),
(@PATH,8,-9050.23,-2437.75,128.3464,0,0,0,0,100,0),
(@PATH,9,-9062.48,-2407.44,127.3151,0,0,0,0,100,0),
(@PATH,10,-9094.87,-2388.64,124.0265,0,0,0,0,100,0),
(@PATH,11,-9112.47,-2360.19,121.6273,0,0,0,0,100,0),
(@PATH,12,-9111.24,-2354.57,122.5619,0,0,0,0,100,0),
(@PATH,13,-9095.8,-2382.87,123.9354,0,0,0,0,100,0),
(@PATH,14,-9061.45,-2399.56,128.0016,0,0,0,0,100,0),
(@PATH,15,-9018.48,-2392.57,130.7203,0,0,0,0,100,0),
(@PATH,16,-8992.11,-2368.29,132.5635,0,0,0,0,100,0),
(@PATH,17,-8964.82,-2329.2,132.5481,0,0,0,0,100,0),
(@PATH,18,-8956.58,-2292.35,132.5678,0,0,0,0,100,0),
(@PATH,19,-8926.41,-2279.25,132.7044,0,0,0,0,100,0),
(@PATH,20,-8905.42,-2245.47,133.3376,0,0,0,0,100,0),
(@PATH,21,-8881.15,-2266.83,133.1034,0,0,0,0,100,0),
(@PATH,22,-8895.5,-2281.12,133.7757,0,0,0,0,100,0),
(@PATH,23,-8915.54,-2283.71,132.3846,0,0,0,0,100,0);

-- Pathing for Ol' Gummers Entry: 43041
SET @NPC := 308246;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9426.26,`position_y`=-2522.74,`position_z`=51.0084 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9426.26,-2522.74,51.0084,0,0,0,0,100,0),
(@PATH,2,-9440.48,-2549.11,51.0084,0,0,0,0,100,0),
(@PATH,3,-9456.95,-2566.33,51.0084,0,0,0,0,100,0),
(@PATH,4,-9474.02,-2637.19,51.0084,0,0,0,0,100,0),
(@PATH,5,-9427.48,-2658.38,51.0084,0,0,0,0,100,0),
(@PATH,6,-9369.48,-2622.18,51.0084,0,0,0,0,100,0),
(@PATH,7,-9316.49,-2528.55,51.0084,0,0,0,0,100,0),
(@PATH,8,-9394.9,-2451.22,51.0084,0,0,0,0,100,0);

-- Pathing for Matthew Hooper Entry: 1680
SET @NPC := 184873;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9315.376,`position_y`=-2156.695,`position_z`=63.4833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9315.376,-2156.695,63.4833,0,45000,0,0,100,0),
(@PATH,2,-9308.336,-2140.875,63.4833,0,45000,0,0,100,0),
(@PATH,3,-9317.214,-2147.051,63.4833,0,0,0,0,100,0),
(@PATH,4,-9317.214,-2147.051,63.4833,2.897247,40000,0,0,100,0);

-- Pathing for Guard Ashlock Entry: 932
SET @NPC := 184857;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9281.391,`position_y`=-2286.225,`position_z`=67.7533 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '5301');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9281.391,-2286.225,67.7533,0,0,0,0,100,0),
(@PATH,2,-9326.391,-2282.725,71.5033,0,0,0,0,100,0),
(@PATH,3,-9365.141,-2279.975,71.5033,0,0,0,0,100,0),
(@PATH,4,-9401.141,-2268.725,68.0033,0,0,0,0,100,0),
(@PATH,5,-9406.141,-2265.225,67.7533,0,0,0,0,100,0),
(@PATH,6,-9411.66,-2264.84,67.44,0,120000,0,0,100,0),
(@PATH,7,-9412.391,-2266.225,67.5033,0,0,0,0,100,0),
(@PATH,8,-9412.891,-2274.725,67.7533,0,0,0,0,100,0),
(@PATH,9,-9364.891,-2279.725,71.5033,0,0,0,0,100,0),
(@PATH,10,-9330.391,-2282.725,71.7533,0,0,0,0,100,0),
(@PATH,11,-9291.391,-2285.975,67.7533,0,0,0,0,100,0),
(@PATH,12,-9282.12,-2287.61,67.5666,0,120000,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 178992;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9678.927,`position_y`=-2670.022,`position_z`=71.32499 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9678.927,-2670.022,71.32499,0,0,0,0,100,0),
(@PATH,2,-9673.069,-2655.88,71.32499,0,0,0,0,100,0),
(@PATH,3,-9658.927,-2650.022,71.32499,0,0,0,0,100,0),
(@PATH,4,-9644.784,-2655.88,71.32499,0,0,0,0,100,0),
(@PATH,5,-9638.927,-2670.022,71.32499,0,0,0,0,100,0),
(@PATH,6,-9644.784,-2684.164,71.32499,0,0,0,0,100,0),
(@PATH,7,-9658.927,-2690.022,71.32499,0,0,0,0,100,0),
(@PATH,8,-9673.069,-2684.164,71.32499,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 179232;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9638.366,`position_y`=-2770.991,`position_z`=68.06391 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9638.366,-2770.991,68.06391,0,0,0,0,100,0),
(@PATH,2,-9632.509,-2756.849,68.06391,0,0,0,0,100,0),
(@PATH,3,-9638.366,-2742.707,68.06391,0,0,0,0,100,0),
(@PATH,4,-9652.509,-2736.849,68.06391,0,0,0,0,100,0),
(@PATH,5,-9666.651,-2742.707,68.06391,0,0,0,0,100,0),
(@PATH,6,-9672.509,-2756.849,68.06391,0,0,0,0,100,0),
(@PATH,7,-9666.651,-2770.991,68.06391,0,0,0,0,100,0),
(@PATH,8,-9652.509,-2776.849,68.06391,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 179246;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9690.073,`position_y`=-2824.014,`position_z`=62.65337 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9690.073,-2824.014,62.65337,0,0,0,0,100,0),
(@PATH,2,-9684.216,-2838.156,62.65337,0,0,0,0,100,0),
(@PATH,3,-9670.073,-2844.014,62.65337,0,0,0,0,100,0),
(@PATH,4,-9655.931,-2838.156,62.65337,0,0,0,0,100,0),
(@PATH,5,-9650.073,-2824.014,62.65337,0,0,0,0,100,0),
(@PATH,6,-9655.931,-2809.872,62.65337,0,0,0,0,100,0),
(@PATH,7,-9670.073,-2804.014,62.65337,0,0,0,0,100,0),
(@PATH,8,-9684.216,-2809.872,62.65337,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 179342;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9653.257,`position_y`=-2869.118,`position_z`=61.9299 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9653.257,-2869.118,61.9299,0,0,0,0,100,0),
(@PATH,2,-9647.399,-2854.976,61.9299,0,0,0,0,100,0),
(@PATH,3,-9653.257,-2840.834,61.9299,0,0,0,0,100,0),
(@PATH,4,-9667.399,-2834.976,61.9299,0,0,0,0,100,0),
(@PATH,5,-9681.542,-2840.834,61.9299,0,0,0,0,100,0),
(@PATH,6,-9687.399,-2854.976,61.9299,0,0,0,0,100,0),
(@PATH,7,-9681.542,-2869.118,61.9299,0,0,0,0,100,0),
(@PATH,8,-9667.399,-2874.976,61.9299,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 180586;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9664.997,`position_y`=-2893.202,`position_z`=61.63003 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9664.997,-2893.202,61.63003,0,0,0,0,100,0),
(@PATH,2,-9679.14,-2899.06,61.63003,0,0,0,0,100,0),
(@PATH,3,-9693.282,-2893.202,61.63003,0,0,0,0,100,0),
(@PATH,4,-9699.14,-2879.06,61.63003,0,0,0,0,100,0),
(@PATH,5,-9693.282,-2864.918,61.63003,0,0,0,0,100,0),
(@PATH,6,-9679.14,-2859.06,61.63003,0,0,0,0,100,0),
(@PATH,7,-9664.997,-2864.918,61.63003,0,0,0,0,100,0),
(@PATH,8,-9659.14,-2879.06,61.63003,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184645;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9714.853,`position_y`=-2595.888,`position_z`=71.65476 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9714.853,-2595.888,71.65476,0,0,0,0,100,0),
(@PATH,2,-9708.995,-2581.746,71.65476,0,0,0,0,100,0),
(@PATH,3,-9694.853,-2575.888,71.65476,0,0,0,0,100,0),
(@PATH,4,-9680.71,-2581.746,71.65476,0,0,0,0,100,0),
(@PATH,5,-9674.853,-2595.888,71.65476,0,0,0,0,100,0),
(@PATH,6,-9680.71,-2610.031,71.65476,0,0,0,0,100,0),
(@PATH,7,-9694.853,-2615.888,71.65476,0,0,0,0,100,0),
(@PATH,8,-9708.995,-2610.031,71.65476,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184675;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9675.527,`position_y`=-2758.928,`position_z`=68.06391 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9675.527,-2758.928,68.06391,0,0,0,0,100,0),
(@PATH,2,-9669.601,-2766.983,68.06391,0,0,0,0,100,0),
(@PATH,3,-9666.651,-2770.991,68.06391,0,0,0,0,100,0),
(@PATH,4,-9652.509,-2776.849,68.06391,0,0,0,0,100,0),
(@PATH,5,-9638.366,-2770.991,68.06391,0,0,0,0,100,0),
(@PATH,6,-9632.509,-2756.849,68.06391,0,0,0,0,100,0),
(@PATH,7,-9638.366,-2742.707,68.06391,0,0,0,0,100,0),
(@PATH,8,-9652.509,-2736.849,68.06391,0,0,0,0,100,0),
(@PATH,9,-9666.651,-2742.707,68.06391,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184682;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9620.4,`position_y`=-1840.86,`position_z`=90.4727 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9620.4,-1840.86,90.4727,0,0,0,0,100,0),
(@PATH,2,-9611.39,-1844.27,87.7926,0,0,0,0,100,0),
(@PATH,3,-9596.9,-1890.13,89.5982,0,0,0,0,100,0),
(@PATH,4,-9619.67,-1925.26,90.7371,0,0,0,0,100,0),
(@PATH,5,-9679.37,-1888.64,102.639,0,0,0,0,100,0),
(@PATH,6,-9649.33,-1847.65,97.7783,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184684;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9744.78,`position_y`=-1830.7,`position_z`=72.0213 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9744.78,-1830.7,77.4657,0,0,0,0,100,0),
(@PATH,2,-9771.62,-1865.91,66.1324,0,0,0,0,100,0),
(@PATH,3,-9747.58,-1893.72,66.1324,0,0,0,0,100,0),
(@PATH,4,-9707.64,-1898.98,66.1324,0,0,0,0,100,0),
(@PATH,5,-9676.29,-1898.6,66.1324,0,0,0,0,100,0),
(@PATH,6,-9662.53,-1878.11,66.1324,0,0,0,0,100,0),
(@PATH,7,-9662.96,-1843.65,69.7713,0,0,0,0,100,0),
(@PATH,8,-9671,-1830.86,73.438,0,0,0,0,100,0),
(@PATH,9,-9682.88,-1819.66,77.4657,0,0,0,0,100,0),
(@PATH,10,-9710.54,-1827.32,72.0213,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184685;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9621.52,`position_y`=-1791.54,`position_z`=69.9771 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9621.52,-1791.54,69.9771,0,0,0,0,100,0),
(@PATH,2,-9601.88,-1780.03,69.9771,0,0,0,0,100,0),
(@PATH,3,-9661.64,-1765.11,69.9771,0,0,0,0,100,0),
(@PATH,4,-9674.95,-1776.48,69.9771,0,0,0,0,100,0),
(@PATH,5,-9661.68,-1789.29,69.9771,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184687;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9534.13,`position_y`=-1897.5,`position_z`=86.8128 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9534.13,-1897.5,86.8128,0,0,0,0,100,0),
(@PATH,2,-9540.21,-1920.24,84.3405,0,0,0,0,100,0),
(@PATH,3,-9508.93,-1920.25,84.3405,0,0,0,0,100,0),
(@PATH,4,-9499.94,-1896.07,86.8128,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184689;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9627.06,`position_y`=-1969.17,`position_z`=77.9558 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9627.06,-1969.17,77.9558,0,0,0,0,100,0),
(@PATH,2,-9678.99,-2012.63,84.428,0,0,0,0,100,0),
(@PATH,3,-9674.55,-2043.69,88.1502,0,0,0,0,100,0),
(@PATH,4,-9618.6,-2055.44,88.1502,0,0,0,0,100,0),
(@PATH,5,-9587.15,-2026.87,78.7057,0,0,0,0,100,0),
(@PATH,6,-9573.17,-1998.12,78.7057,0,0,0,0,100,0),
(@PATH,7,-9577.36,-1980.24,79.3725,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184691;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9503.79,`position_y`=-1976.59,`position_z`=93.7357 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9503.79,-1976.59,93.7357,0,0,0,0,100,0),
(@PATH,2,-9441.98,-1941.17,115.708,0,0,0,0,100,0),
(@PATH,3,-9445.79,-1921.2,98.0135,0,0,0,0,100,0),
(@PATH,4,-9487.04,-1925.15,98.0135,0,0,0,0,100,0),
(@PATH,5,-9517.51,-1943.82,88.9857,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184693;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9490.73,`position_y`=-2117.28,`position_z`=110.001 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9490.73,-2117.28,110.001,0,0,0,0,100,0),
(@PATH,2,-9487.84,-2085.75,109.723,0,0,0,0,100,0),
(@PATH,3,-9487.8,-2049.91,109.723,0,0,0,0,100,0),
(@PATH,4,-9500.49,-2015.05,100.89,0,0,0,0,100,0),
(@PATH,5,-9518.28,-1999.3,93.2232,0,0,0,0,100,0),
(@PATH,6,-9530.82,-2016.36,90.8372,0,0,0,0,100,0),
(@PATH,7,-9535.68,-2070.02,95.6984,0,0,0,0,100,0),
(@PATH,8,-9519.93,-2111.95,108.612,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184695;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9574.24,`position_y`=-2107.24,`position_z`=85.5298 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9574.24,-2107.24,85.5298,0,0,0,0,100,0),
(@PATH,2,-9542.99,-2103.38,112.733,0,0,0,0,100,0),
(@PATH,3,-9506.77,-2073.8,112.733,0,0,0,0,100,0),
(@PATH,4,-9500.77,-2058.63,106.919,0,0,0,0,100,0),
(@PATH,5,-9532.06,-2058.7,85.5298,0,0,0,0,100,0),
(@PATH,6,-9589.85,-2051.46,85.5298,0,0,0,0,100,0),
(@PATH,7,-9607.46,-2083.2,85.5298,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184704;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9042.471,`position_y`=-2521.2,`position_z`=138.1165 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9042.471,-2521.2,138.1165,0,0,0,0,100,0),
(@PATH,2,-9048.328,-2507.058,138.1165,0,0,0,0,100,0),
(@PATH,3,-9062.471,-2501.2,138.1165,0,0,0,0,100,0),
(@PATH,4,-9076.613,-2507.058,138.1165,0,0,0,0,100,0),
(@PATH,5,-9082.471,-2521.2,138.1165,0,0,0,0,100,0),
(@PATH,6,-9076.613,-2535.342,138.1165,0,0,0,0,100,0),
(@PATH,7,-9062.471,-2541.2,138.1165,0,0,0,0,100,0),
(@PATH,8,-9048.328,-2535.342,138.1165,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184734;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9112.056,`position_y`=-2553.654,`position_z`=125.0944 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9112.056,-2553.654,125.0944,0,0,0,0,100,0),
(@PATH,2,-9117.913,-2539.523,125.0944,0,0,0,0,100,0),
(@PATH,3,-9132.056,-2533.665,125.0944,0,0,0,0,100,0),
(@PATH,4,-9146.198,-2539.523,125.0944,0,0,0,0,100,0),
(@PATH,5,-9152.056,-2553.665,125.0944,0,0,0,0,100,0),
(@PATH,6,-9146.198,-2567.807,125.0944,0,0,0,0,100,0),
(@PATH,7,-9132.056,-2573.665,125.0944,0,0,0,0,100,0),
(@PATH,8,-9117.913,-2567.807,125.0944,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184735;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9065.914,`position_y`=-2602.353,`position_z`=136.5891 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9065.914,-2602.353,136.5891,0,0,0,0,100,0),
(@PATH,2,-9060.057,-2616.495,136.5891,0,0,0,0,100,0),
(@PATH,3,-9065.914,-2630.637,136.5891,0,0,0,0,100,0),
(@PATH,4,-9080.057,-2636.495,136.5891,0,0,0,0,100,0),
(@PATH,5,-9094.199,-2630.637,136.5891,0,0,0,0,100,0),
(@PATH,6,-9100.057,-2616.495,136.5891,0,0,0,0,100,0),
(@PATH,7,-9094.199,-2602.353,136.5891,0,0,0,0,100,0),
(@PATH,8,-9080.057,-2596.495,136.5891,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184736;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9096.249,`position_y`=-2630.119,`position_z`=129.3912 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9096.249,-2630.119,129.3912,0,0,0,0,100,0),
(@PATH,2,-9102.106,-2615.977,129.3912,0,0,0,0,100,0),
(@PATH,3,-9116.249,-2610.119,129.3912,0,0,0,0,100,0),
(@PATH,4,-9130.392,-2615.977,129.3912,0,0,0,0,100,0),
(@PATH,5,-9136.249,-2630.119,129.3912,0,0,0,0,100,0),
(@PATH,6,-9130.392,-2644.261,129.3912,0,0,0,0,100,0),
(@PATH,7,-9116.249,-2650.119,129.3912,0,0,0,0,100,0),
(@PATH,8,-9102.106,-2644.261,129.3912,0,0,0,0,100,0);

-- Pathing for Dire Condor Entry: 428
SET @NPC := 184737;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9070.152,`position_y`=-2635.953,`position_z`=137.5065 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,50331648,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9070.152,-2635.953,137.5065,0,0,0,0,100,0),
(@PATH,2,-9064.295,-2650.095,137.5065,0,0,0,0,100,0),
(@PATH,3,-9070.152,-2664.237,137.5065,0,0,0,0,100,0),
(@PATH,4,-9084.295,-2670.095,137.5065,0,0,0,0,100,0),
(@PATH,5,-9098.438,-2664.237,137.5065,0,0,0,0,100,0),
(@PATH,6,-9104.295,-2650.095,137.5065,0,0,0,0,100,0),
(@PATH,7,-9098.438,-2635.953,137.5065,0,0,0,0,100,0),
(@PATH,8,-9084.295,-2630.095,137.5065,0,0,0,0,100,0);

-- Pathing for Madison Entry: 848
SET @NPC := 184768;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9248.165,`position_y`=-2025.89,`position_z`=77.20025 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9248.165,-2025.89,77.20025,0,0,1,0,100,0),
(@PATH,2,-9247.915,-2036.89,77.20025,0,0,1,0,100,0),
(@PATH,3,-9240.415,-2061.64,76.70025,0,0,1,0,100,0),
(@PATH,4,-9240.165,-2086.89,75.70025,0,0,1,0,100,0),
(@PATH,5,-9246.665,-2108.89,68.95025,0,0,1,0,100,0),
(@PATH,6,-9254.915,-2137.64,64.45025,0,0,1,0,100,0),
(@PATH,7,-9255.165,-2160.64,64.45025,0,0,1,0,100,0),
(@PATH,8,-9255.415,-2183.39,64.45025,0,0,1,0,100,0),
(@PATH,9,-9269.415,-2190.14,64.45025,0,0,1,0,100,0),
(@PATH,10,-9275.165,-2209.64,64.45025,0,0,1,0,100,0),
(@PATH,11,-9285.915,-2211.89,63.45025,0,0,1,0,100,0),
(@PATH,12,-9315.165,-2211.14,62.20025,0,0,1,0,100,0),
(@PATH,13,-9327.5,-2202.18,61.8977,0,120000,1,0,100,0),
(@PATH,14,-9326.415,-2202.39,62.20025,0,0,1,0,100,0),
(@PATH,15,-9314.165,-2207.39,62.20025,0,0,1,0,100,0),
(@PATH,16,-9288.915,-2208.89,62.95025,0,0,1,0,100,0),
(@PATH,17,-9282.415,-2174.89,60.45025,0,0,1,0,100,0),
(@PATH,18,-9274.665,-2157.14,60.70025,0,0,1,0,100,0),
(@PATH,19,-9264.665,-2132.64,64.95025,0,0,1,0,100,0),
(@PATH,20,-9249.165,-2115.14,66.95025,0,0,1,0,100,0),
(@PATH,21,-9241.665,-2087.64,75.45025,0,0,1,0,100,0),
(@PATH,22,-9239.165,-2059.89,76.95025,0,0,1,0,100,0),
(@PATH,23,-9247.415,-2048.14,77.20025,0,0,1,0,100,0),
(@PATH,24,-9248.665,-2030.39,77.20025,0,0,1,0,100,0),
(@PATH,25,-9248.33,-2023.6,77.0028,0,120000,1,0,100,0);
-- 0x203CA8000000D400005CC000002E0203 .go xyz -9327.5 -2202.18 61.8977


-- Snarlflare SAI
SET @ENTRY := 14272;
UPDATE `creature_template` SET `AIName`="SmartAI", `InhabitType`=4,`ExperienceModifier`=7.5 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,6000,10000,6000,10000,11,54293,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snarlflare - OOC - Cast 'Flame Breath'"),
(@ENTRY,0,1,0,0,0,100,0,4000,6000,8000,12000,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,"Snarlflare - Combat - Cast 'Flame Breath'");

UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `guid`=61912;

-- Marshal Marris SAI
SET @ENTRY := 382;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=-334923 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-334923,0,0,0,1,0,100,0,8000,8000,8000,8000,11,58952,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marshal Marris - OOC - Cast 'Drink Alcohol'");

-- Foreman Oslow text
DELETE FROM `creature_text` WHERE `CreatureID`=341;
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(341, 0, 0, 'Somebody... please... get... rock... off... me...', 12, 0, 100, 0, 0, 0, 43173, 'Foreman Oslow'),
(341, 0, 1, 'Hurts... Hurts so bad...', 12, 0, 100, 0, 0, 0, 43174, 'Foreman Oslow'),
(341, 0, 2, 'Please... kill... me...', 12, 0, 100, 0, 0, 0, 43175, 'Foreman Oslow'),
(341, 0, 3, 'I... just... wanted... to... build... the... damned... bridge...', 12, 0, 100, 0, 0, 0, 43176, 'Foreman Oslow');

-- Bridge Worker Alex text
DELETE FROM `creature_text` WHERE `CreatureID` IN (653,648,649,650,651,652);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(653, 0, 0, 'PUT YOUR BACKS INTO IT, BOYS!', 12, 0, 100, 0, 0, 0, 43181, 'Bridge Worker Alex'),
(653, 1, 0, 'HEAVE!', 12, 0, 100, 0, 0, 0, 43182, 'Bridge Worker Alex'),
(653, 2, 0, 'DAMN ROCK WON''T BUDGE!', 12, 0, 100, 0, 0, 0, 43184, 'Bridge Worker Alex'),
(653, 4, 0, 'PUSH HARDER!', 12, 0, 100, 0, 0, 0, 43185, 'Bridge Worker Alex'),
(653, 3, 0, 'We''ll get you out of there, Foreman, just HANG ON!', 12, 0, 100, 0, 0, 0, 43187, 'Bridge Worker Alex'),
(648, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0, 43183, 'Bridge Worker Trent'),
(649, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0, 43183, 'Bridge Worker Dimitri'),
(650, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0, 43183, 'Bridge Worker Jess'),
(651, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0, 43183, 'Bridge Worker Daniel'),
(652, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0, 43183, 'Bridge Worker Matthew'),
(652, 1, 0, 'I''M PUSHIN'' AS HARD AS I CAN! THING WEIGHS A TON!', 12, 0, 100, 0, 0, 0, 43186, 'Bridge Worker Matthew');

DELETE FROM `quest_template_addon` WHERE `NextQuestID`=26503;

-- Condition for source Quest accept condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry` IN (26365,28563) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 26365, 0, 0, 8, 0, 26503, 0, 0, 1, 0, 0, '', 'Show quest Hero''s Call: Redridge Mountains! if quest Still Assessing the Threat has not been rewarded.'),
(19, 0, 28563, 0, 0, 8, 0, 26503, 0, 0, 1, 0, 0, '', 'Show quest Hero''s Call: Redridge Mountains! if quest Still Assessing the Threat has not been rewarded.');

-- Nida SAI
SET @ENTRY := 8962;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,26508,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nida - On Quest Reward - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,8963,5,0,0,0,0,0,"Nida - Script - Target Say 0"), -- Effsee should say with player as target but can't in sai
(@ENTRY*100,9,1,0,0,0,100,0,2000,2000,0,0,1,0,1,0,0,0,0,7,0,0,0,0,0,0,0,"Nida - Script - Say 0"); -- Nida says with player as target
-- Text
DELETE FROM `creature_text` WHERE `CreatureID` IN (8962,8963);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(8962, 0, 0, 'I know how to speak kitty, and Effsee said thank you.', 12, 0, 100, 0, 0, 0, 4628, 'Nida'),
(8963, 0, 0, 'Meow!', 12, 0, 100, 0, 0, 0, 4627, 'Effsee');

-- Areatrigger SAI
SET @ENTRY := 6033;
DELETE FROM `areatrigger_scripts` WHERE `entry`=@ENTRY;
INSERT INTO `areatrigger_scripts` VALUES (@ENTRY,"SmartTrigger");
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,2,0,1,46,0,100,0,0,10000,10000,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Areatrigger - On Trigger - Store Invoker target"),
(@ENTRY,2,1,2,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,10,334562,43173,0,0,0,0,0,"Areatrigger - On Trigger - Store Invoker target"),
(@ENTRY,2,2,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,334562,43173,0,0,0,0,0,"Areatrigger - On Trigger - Set Data 1 1 for Redridge Garrison Watchman");
-- Redridge Garrison Watchman SAI
SET @ENTRY := 43173;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id` IN (2,3,4);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,3,38,0,100,0,1,1,10000,10000,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"S.A.F.E. Officer - On Data Set - Turn to Invoker"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,1,0,1,0,0,0,0,12,1,0,0,0,0,0,0,"S.A.F.E. Officer - On Data Set - Say 0 to target"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"S.A.F.E. Officer - On Data Set - Say 0 to target"),
(@ENTRY*100,9,0,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"S.A.F.E. Officer - Script - Reset Orientation");
-- Redridge Garrison Watchman Text
DELETE FROM `creature_text` WHERE `CreatureID`=@ENTRY;
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(@ENTRY, 0, 0, 'Hail, citizen. I would recommend that you speak with Watch Captain Parker. He''s currently at the top of this tower.', 12, 0, 100, 25, 0, 0, 43164, 'Redridge Garrison Watchman');

DELETE FROM `creature_text` WHERE `CreatureID` IN (43222,43247);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(43222, 0, 0, 'My spouse has gone missing! Please help!', 12, 7, 100, 22, 0, 0, 43745, 'Redridge Citizen'),
(43222, 0, 1, 'Townspeople are disappearing, Solomon. What are you going to do about it?', 12, 7, 100, 22, 0, 0, 43746, 'Redridge Citizen'),
(43222, 0, 2, 'It''s time to wake up, magistrate! These aren''t ordinary gnoll attacks!', 12, 7, 100, 25, 0, 0, 43747, 'Redridge Citizen'),
(43222, 0, 3, 'Where is the help that we requested from Stormwind?', 12, 7, 100, 4, 0, 0, 43748, 'Redridge Citizen'),
(43222, 0, 4, 'What are we paying our taxes for if your guards can''t even keep gnolls out?', 12, 7, 100, 53, 0, 0, 43749, 'Redridge Citizen'),
(43222, 0, 5, 'My children were kidnapped while they slept! I WANT ANSWERS, SOLOMON!', 12, 7, 100, 5, 0, 0, 43750, 'Redridge Citizen'),
(43222, 0, 6, 'You better do something quick or you''ll have a riot on your hands, Solomon!', 12, 7, 100, 53, 0, 0, 43751, 'Redridge Citizen'),
(43222, 0, 7, 'The gnolls have never been this aggressive. What''s going on, Solomon? Tell us!', 12, 7, 100, 25, 0, 0, 43752, 'Redridge Citizen'),
(43222, 0, 8, 'How long must we stand here before our pleas are heard?', 12, 7, 100, 53, 0, 0, 43753, 'Redridge Citizen'),
(43222, 0, 9, 'Get this damned line moving!', 12, 7, 100, 15, 0, 0, 43754, 'Redridge Citizen'),
(43222, 0, 10, 'You''re good for nothing, Solomon!', 12, 7, 100, 14, 0, 0, 43755, 'Redridge Citizen'),
(43222, 0, 11, 'You can forget about re-election, magistrate!', 12, 7, 100, 274, 0, 0, 43756, 'Redridge Citizen'),
(43222, 0, 12, 'No justice, no peace!', 12, 7, 100, 22, 0, 0, 43757, 'Redridge Citizen'),
(43222, 0, 13, 'If you don''t do something about these gnolls, we will!', 12, 7, 100, 25, 0, 0, 43758, 'Redridge Citizen'),
(43222, 0, 14, 'Please help me! I''m the last member of my family left. Everyone else has been kidnapped!', 12, 7, 100, 15, 0, 0, 43759, 'Redridge Citizen'),
(43222, 1, 0, 'Forget you, Solomon. I''ll find my family by myself.', 12, 7, 100, 14, 0, 0, 43760, 'Redridge Citizen'),
(43247, 0, 0, 'My spouse has gone missing! Please help!', 12, 7, 100, 22, 0, 0, 43745, 'Redridge Citizen'),
(43247, 0, 1, 'Townspeople are disappearing, Solomon. What are you going to do about it?', 12, 7, 100, 22, 0, 0, 43746, 'Redridge Citizen'),
(43247, 0, 2, 'It''s time to wake up, magistrate! These aren''t ordinary gnoll attacks!', 12, 7, 100, 25, 0, 0, 43747, 'Redridge Citizen'),
(43247, 0, 3, 'Where is the help that we requested from Stormwind?', 12, 7, 100, 4, 0, 0, 43748, 'Redridge Citizen'),
(43247, 0, 4, 'What are we paying our taxes for if your guards can''t even keep gnolls out?', 12, 7, 100, 53, 0, 0, 43749, 'Redridge Citizen'),
(43247, 0, 5, 'My children were kidnapped while they slept! I WANT ANSWERS, SOLOMON!', 12, 7, 100, 5, 0, 0, 43750, 'Redridge Citizen'),
(43247, 0, 6, 'You better do something quick or you''ll have a riot on your hands, Solomon!', 12, 7, 100, 53, 0, 0, 43751, 'Redridge Citizen'),
(43247, 0, 7, 'The gnolls have never been this aggressive. What''s going on, Solomon? Tell us!', 12, 7, 100, 25, 0, 0, 43752, 'Redridge Citizen'),
(43247, 0, 8, 'How long must we stand here before our pleas are heard?', 12, 7, 100, 53, 0, 0, 43753, 'Redridge Citizen'),
(43247, 0, 9, 'Get this damned line moving!', 12, 7, 100, 15, 0, 0, 43754, 'Redridge Citizen'),
(43247, 0, 10, 'You''re good for nothing, Solomon!', 12, 7, 100, 14, 0, 0, 43755, 'Redridge Citizen'),
(43247, 0, 11, 'You can forget about re-election, magistrate!', 12, 7, 100, 274, 0, 0, 43756, 'Redridge Citizen'),
(43247, 0, 12, 'No justice, no peace!', 12, 7, 100, 22, 0, 0, 43757, 'Redridge Citizen'),
(43247, 0, 13, 'If you don''t do something about these gnolls, we will!', 12, 7, 100, 25, 0, 0, 43758, 'Redridge Citizen'),
(43247, 0, 14, 'Please help me! I''m the last member of my family left. Everyone else has been kidnapped!', 12, 7, 100, 15, 0, 0, 43759, 'Redridge Citizen'),
(43247, 1, 0, 'Forget you, Solomon. I''ll find my family by myself.', 12, 7, 100, 14, 0, 0, 43760, 'Redridge Citizen');

-- Redridge Scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_big_earl' WHERE `entry`=43248;
UPDATE `creature_template` SET `ScriptName`='npc_dumpy_and_keeshan' WHERE `entry` IN (43249,43184);
UPDATE `creature_template` SET `ScriptName`='npc_redridge_citizen' WHERE `entry` IN (43222,43247);
UPDATE `creature_template` SET `ScriptName`='npc_bridge_worker_alex' WHERE `entry`=653;

-- Rohh the Silent Spawn Redridge Mountains
DELETE FROM `creature` WHERE `guid` IN (129590,5462);

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(129590, 947, 0, 0, 0, 1, 0, 0, 0, 0, -9124.02, -3233.616, 101.1988, 2.460914, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 24015);
DELETE FROM `creature_addon` WHERE `guid`=129590;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (129590,0,0,131072,1,0, '22766');

-- fix up drops
DELETE FROM `creature_loot_template`
WHERE `Entry` IN (615,4462,4463,7013,43340,43341,43496,43775,43787);

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','723','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','769','0','0.0235289','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','790','0','0.00346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','818','0','0.131485','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','856','0','0.0173007','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','858','0','1.9446','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','929','0','0.0152246','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1179','0','3.48574','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1206','0','0.0968838','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1210','0','0.360546','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1445','0','0.0193768','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1507','0','0.00484419','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1738','0','0.205532','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1739','0','0.184771','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1740','0','0.206224','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1742','0','0.2083','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1743','0','0.195152','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1744','0','0.205532','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1745','0','0.169547','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1750','0','0.00346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1753','0','0.00622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1764','0','0.239441','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1766','0','0.200688','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1767','0','0.223525','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1768','0','0.276119','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1769','0','0.253974','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1770','0','0.278887','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1787','0','0.249822','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1788','0','0.226293','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1789','0','0.26297','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1791','0','0.229753','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1792','0','0.242902','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1793','0','0.226293','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1794','0','0.280271','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1811','0','0.337017','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1812','0','0.379231','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1813','0','0.386151','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1814','0','0.359854','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1815','0','0.352242','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1816','0','0.34463','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','1817','0','0.356394','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2073','0','0.0435977','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2078','0','0.0352934','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2079','0','0.0927316','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2216','0','0.295496','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2217','0','0.217989','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2287','0','6.83792','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2295','0','0.0103804','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2407','0','0.00484419','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2408','0','0.00622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2409','0','0.0228369','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2455','0','1.03389','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2555','0','0.0076123','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2589','0','27.9316','0','1','0','1','3','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2592','0','27.5884','0','1','0','1','2','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2657','0','0.0221449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2764','0','0.385459','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2780','0','0.362622','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2781','0','0.334249','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2881','0','0.0117645','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2969','0','0.0325253','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2970','0','0.114184','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2973','0','0.0678187','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2974','0','0.107956','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2976','0','0.0304492','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2977','0','0.103112','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2978','0','0.0221449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2980','0','0.0131485','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2982','0','0.00830433','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2983','0','0.0892715','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2984','0','0.0532861','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2986','0','0.00622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2987','0','0.0332173','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2988','0','0.0186847','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','2992','0','0.0110724','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3036','0','0.0484419','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3040','0','0.0622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3184','0','0.0228369','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3195','0','0.0394455','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3196','0','0.0463658','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3205','0','0.0546701','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3211','0','0.0179927','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3376','0','0.253282','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3377','0','0.240133','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3394','0','0.00830433','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3610','0','0.00553622','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3645','0','0.077507','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3651','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3652','0','0.0076123','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3655','0','0.00622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','3770','0','0.05121','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4292','0','0.0152246','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4293','0','0.0145326','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4306','0','0.0588223','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4345','0','0.0124565','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4346','0','0.0159166','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4348','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4408','0','0.00692027','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4409','0','0.0124565','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4410','0','0.00346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4567','0','0.0961918','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4570','0','0.0442897','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4571','0','0.100344','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4575','0','0.0477499','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4695','0','0.0401376','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4697','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4699','0','0.0608984','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4701','0','0.105188','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','4865','0','0.0228369','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','5207','0','0.00899635','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','5212','0','0.0913476','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','5573','0','0.0186847','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','5574','0','0.0186847','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','5578','0','0.00346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6271','0','0.00692027','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6344','0','0.0131485','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6347','0','0.0179927','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6348','0','0.0166087','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6378','0','0.0941157','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6379','0','0.0608984','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6380','0','0.0539781','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6391','0','0.00346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6528','0','0.0359854','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6536','0','0.0152246','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6537','0','0.0332173','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6538','0','0.0110724','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6539','0','0.119721','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6540','0','0.0359854','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6541','0','0.113492','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6542','0','0.0325253','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6543','0','0.0332173','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6545','0','0.0359854','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6546','0','0.0692027','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6547','0','0.0705868','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6548','0','0.0830433','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6550','0','0.0235289','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6551','0','0.0567462','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6552','0','0.0159166','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6553','0','0.0546701','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6554','0','0.0608984','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6556','0','0.0276811','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6557','0','0.114184','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6558','0','0.026297','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6559','0','0.0422137','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6560','0','0.0429057','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6563','0','0.0110724','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6575','0','0.00484419','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6585','0','0.00622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','6716','0','0.0173007','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','7288','0','0.00553622','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','7554','0','0.0117645','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','7608','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9748','0','0.0117645','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9749','0','0.0207608','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9757','0','0.0449818','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9764','0','0.0076123','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9765','0','0.0221449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9775','0','0.0200688','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9776','0','0.0110724','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9777','0','0.0138405','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9778','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9779','0','0.0380615','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9780','0','0.00346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9783','0','0.00622824','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9784','0','0.026297','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9785','0','0.0643585','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9786','0','0.075431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9787','0','0.0124565','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9788','0','0.0325253','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9789','0','0.0235289','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','9790','0','0.00484419','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','14166','0','0.0435977','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','14167','0','0.0325253','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','14168','0','0.00484419','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','14173','0','0.0138405','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','14174','0','0.0200688','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15210','0','0.125949','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15222','0','0.0346014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15248','0','0.00968838','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15268','0','0.129409','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15269','0','0.0110724','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15926','0','0.0449818','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','15933','0','0.00553622','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','21524','0','0.00415216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('615','58952','0','55.0985','1','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','818','0','0.151265','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','856','0','0.0162516','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','858','0','2.4515','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1080','0','0.00750075','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1179','0','4.26668','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1206','0','0.151265','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1210','0','0.467547','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1414','0','0.00375038','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1415','0','0.0187519','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1431','0','0.00125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1468','0','0.00125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1499','0','0.00125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1512','0','0.00375038','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1738','0','0.263776','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1739','0','0.237524','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1740','0','0.256276','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1742','0','0.275028','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1743','0','0.283778','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1744','0','0.238774','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1745','0','0.231273','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1764','0','0.291279','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1766','0','0.332533','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1767','0','0.315031','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1768','0','0.348785','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1769','0','0.256276','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1770','0','0.326283','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1787','0','0.263776','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1788','0','0.290029','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1789','0','0.308781','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1791','0','0.317532','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1792','0','0.356286','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1793','0','0.30503','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1794','0','0.338784','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1811','0','0.657566','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1812','0','0.443794','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1813','0','0.506301','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1814','0','0.548805','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1815','0','0.442544','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1816','0','0.430043','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','1817','0','0.50255','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2078','0','0.108761','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2079','0','0.138764','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2216','0','0.341284','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2217','0','0.40004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2287','0','8.67212','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2407','0','0.0125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2409','0','0.0225023','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2455','0','1.28263','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2555','0','0.0112511','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2589','0','33.8771','0','1','0','1','3','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2592','0','35.1085','0','1','0','1','2','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2643','0','0.00125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2657','0','0.0275028','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2764','0','0.475047','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2780','0','0.470047','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2781','0','0.568807','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2881','0','0.0175018','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2968','0','0.00125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2969','0','0.0525053','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2970','0','0.0512551','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2973','0','0.110011','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2974','0','0.040004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2977','0','0.0262526','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2982','0','0.0387539','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2983','0','0.140014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2984','0','0.145014','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2985','0','0.00625063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2986','0','0.0337534','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2987','0','0.108761','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2988','0','0.0312531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2989','0','0.010001','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2991','0','0.0175018','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','2992','0','0.0225023','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3040','0','0.0875088','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3184','0','0.0425043','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3193','0','0.0137514','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3195','0','0.111261','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3196','0','0.120012','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3205','0','0.0950095','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3211','0','0.0287529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3299','0','0.00250025','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3301','0','0.0050005','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3376','0','0.29878','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3377','0','0.247525','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3394','0','0.00750075','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3610','0','0.010001','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3645','0','0.0862586','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3655','0','0.0212521','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','3770','0','0.0137514','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4292','0','0.0212521','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4294','0','0.00625063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4306','0','0.0175018','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4345','0','0.0237524','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4346','0','0.0187519','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4348','0','0.00625063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4349','0','0.00125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4408','0','0.010001','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4409','0','0.00875088','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4567','0','0.0550055','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4568','0','0.020002','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4571','0','0.117512','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4575','0','0.0462546','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4576','0','0.0112511','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4695','0','0.0987599','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4697','0','0.0212521','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4698','0','0.0137514','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4699','0','0.248775','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4700','0','0.0125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','4701','0','0.0650065','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','5114','0','0.0575057','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','5207','0','0.0312531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','5212','0','0.152515','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','5573','0','0.0212521','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','5574','0','0.0150015','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6271','0','0.00625063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6344','0','0.0312531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6347','0','0.030003','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6348','0','0.0312531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6375','0','0.00750075','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6378','0','0.158766','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6379','0','0.110011','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6380','0','0.0512551','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6528','0','0.0450045','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6536','0','0.0175018','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6538','0','0.0212521','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6539','0','0.0525053','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6540','0','0.141264','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6541','0','0.0437544','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6545','0','0.130013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6546','0','0.10001','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6547','0','0.0737574','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6548','0','0.0412541','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6551','0','0.125013','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6552','0','0.0575057','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6553','0','0.126263','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6554','0','0.070007','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6557','0','0.070007','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6559','0','0.0787579','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6560','0','0.0562556','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6562','0','0.0112511','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6563','0','0.0312531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6575','0','0.0337534','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6581','0','0.0112511','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6583','0','0.00750075','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6585','0','0.0387539','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','6716','0','0.0237524','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','7074','0','0.0325033','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','7288','0','0.0175018','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','7351','0','0.00375038','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','7554','0','0.010001','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','7608','0','0.020002','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9775','0','0.0650065','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9776','0','0.0287529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9777','0','0.0550055','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9778','0','0.0162516','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9779','0','0.0975097','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9780','0','0.0275028','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9783','0','0.0487549','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9784','0','0.0287529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9785','0','0.0937594','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9786','0','0.0637564','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9787','0','0.0250025','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9788','0','0.0775077','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9789','0','0.0437544','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','9790','0','0.0175018','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','10407','0','0.0162516','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','11038','0','0.00750075','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','11081','0','0.010001','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','14166','0','0.0625063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','14167','0','0.0450045','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','14168','0','0.0225023','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','14173','0','0.0350035','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','14174','0','0.0337534','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','15210','0','0.153765','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','15222','0','0.0487549','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','15248','0','0.030003','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','15268','0','0.040004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','15926','0','0.060006','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4462','62328','0','0.040004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','723','0','0.0200529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','769','0','0.0200529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','818','0','0.181813','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','856','0','0.0106949','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','858','0','2.59351','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','929','0','0.0187161','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1179','0','4.50122','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1206','0','0.16176','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1210','0','0.374322','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1738','0','0.213898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1739','0','0.243309','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1740','0','0.263362','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1742','0','0.295447','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1743','0','0.381006','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1744','0','0.255341','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1745','0','0.207214','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1764','0','0.316836','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1766','0','0.307478','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1767','0','0.306142','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1768','0','0.342237','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1769','0','0.258015','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1770','0','0.332879','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1787','0','0.279404','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1788','0','0.335553','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1789','0','0.31951','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1791','0','0.386353','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1792','0','0.338226','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1793','0','0.291436','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1794','0','0.360953','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1800','0','0.00668431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1811','0','0.447849','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1812','0','0.522713','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1813','0','0.485281','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1814','0','0.465228','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1815','0','0.454533','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1816','0','0.459881','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','1817','0','0.47726','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2073','0','0.117644','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2078','0','0.0427796','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2079','0','0.06818','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2216','0','0.29812','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2217','0','0.316836','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2287','0','8.81394','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2295','0','0.0200529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2406','0','0.00668431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2407','0','0.029411','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2409','0','0.00935804','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2455','0','1.29007','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2553','0','0.00802118','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2555','0','0.0133686','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2589','0','35.0017','0','1','0','1','3','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2592','0','35.4376','0','1','0','1','2','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2657','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2764','0','0.494639','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2780','0','0.497313','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2781','0','0.438491','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2881','0','0.0227267','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2969','0','0.0360953','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2970','0','0.207214','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2973','0','0.038769','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2974','0','0.181813','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2976','0','0.0574851','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2977','0','0.113633','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2978','0','0.0414427','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2980','0','0.0481271','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2983','0','0.0641694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2984','0','0.0441165','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2987','0','0.0467902','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','2988','0','0.0454533','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3036','0','0.0815486','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3040','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3195','0','0.0561482','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3196','0','0.0360953','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3205','0','0.0414427','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3211','0','0.0147055','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3376','0','0.312826','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3377','0','0.29812','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3379','0','0.00668431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3645','0','0.0708537','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3651','0','0.0213898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3652','0','0.0320847','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','3770','0','0.0534745','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4292','0','0.00802118','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4293','0','0.0200529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4306','0','0.0521376','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4345','0','0.029411','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4346','0','0.0106949','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4409','0','0.0213898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4567','0','0.18315','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4570','0','0.125665','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4571','0','0.0614957','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4575','0','0.0267373','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4695','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4699','0','0.0655063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','4701','0','0.189834','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','5212','0','0.0788749','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','5573','0','0.0187161','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','5574','0','0.0240635','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6342','0','0.00802118','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6344','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6347','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6348','0','0.0147055','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6375','0','0.00668431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6378','0','0.0721906','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6379','0','0.0427796','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6380','0','0.0561482','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6528','0','0.0187161','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6536','0','0.0120318','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6537','0','0.0735274','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6538','0','0.0106949','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6539','0','0.197856','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6540','0','0.0561482','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6541','0','0.263362','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6542','0','0.0802118','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6543','0','0.128339','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6545','0','0.0414427','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6546','0','0.0534745','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6547','0','0.0427796','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6548','0','0.159087','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6550','0','0.0949172','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6551','0','0.0240635','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6552','0','0.0254004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6553','0','0.0360953','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6554','0','0.0414427','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6556','0','0.0481271','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6557','0','0.176466','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6558','0','0.06818','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6559','0','0.0655063','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6560','0','0.0628325','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','6716','0','0.00935804','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','7288','0','0.00668431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','7554','0','0.00401059','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9748','0','0.0200529','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9749','0','0.0481271','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9757','0','0.0614957','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9764','0','0.0227267','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9765','0','0.0534745','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9775','0','0.0254004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9777','0','0.0561482','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9779','0','0.0668431','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9784','0','0.0213898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9785','0','0.0414427','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9786','0','0.149729','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9787','0','0.0133686','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9788','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','9789','0','0.0160424','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','10316','0','0.0441165','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','14166','0','0.0240635','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','14167','0','0.0334216','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','14174','0','0.0254004','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','15210','0','0.149729','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','15222','0','0.0494639','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','15268','0','0.18315','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','15926','0','0.0735274','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','15933','0','0.0213898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('4463','120953','0','0.00267373','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','818','0','0.584204','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','856','0','0.0411939','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','858','0','1.92488','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1179','0','3.39662','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1206','0','0.456877','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1210','0','1.27327','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1738','0','0.393214','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1739','0','0.314571','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1740','0','0.35202','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1742','0','0.430663','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1743','0','0.337041','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1744','0','0.340786','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1745','0','0.318316','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1764','0','0.378235','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1766','0','0.419429','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1767','0','0.494326','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1768','0','0.438153','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1769','0','0.55799','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1770','0','0.445643','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1787','0','0.426918','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1788','0','0.617908','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1789','0','0.602929','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1791','0','0.464367','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1792','0','0.53552','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1793','0','0.441898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1794','0','0.520541','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1811','0','0.614163','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1812','0','0.674082','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1813','0','0.704041','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1814','0','0.801408','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1815','0','0.771449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1816','0','0.591694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','1817','0','0.835112','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2078','0','0.314571','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2079','0','0.232184','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2216','0','0.445643','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2217','0','0.423173','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2287','0','6.56855','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2406','0','0.0299592','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2407','0','0.0112347','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2409','0','0.0561735','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2455','0','0.928735','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2555','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2589','0','19.6045','0','1','0','1','5','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2592','0','26.1993','0','1','0','1','4','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2657','0','0.0486837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2764','0','0.640377','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2780','0','0.778939','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2781','0','0.674082','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2881','0','0.0524286','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2969','0','0.0823877','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2970','0','0.101112','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2973','0','0.194735','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2974','0','0.0524286','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2977','0','0.116092','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2981','0','0.0187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2982','0','0.0449388','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2983','0','0.243418','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2984','0','0.250908','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2985','0','0.0037449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2986','0','0.0636633','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2987','0','0.284612','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2988','0','0.0337041','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2989','0','0.0187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2991','0','0.0187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','2992','0','0.0599184','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3040','0','0.153541','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3184','0','0.138561','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3193','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3195','0','0.35951','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3196','0','0.258398','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3205','0','0.265888','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3211','0','0.0524286','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3376','0','0.445643','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3377','0','0.445643','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3645','0','0.254653','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','3655','0','0.0486837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4292','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4345','0','0.0486837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4346','0','0.0599184','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4408','0','0.0262143','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4409','0','0.0524286','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4567','0','0.104857','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4568','0','0.108602','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4571','0','0.310827','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4575','0','0.0898775','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4576','0','0.0262143','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4695','0','0.340786','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4697','0','0.0486837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4698','0','0.0299592','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4699','0','0.367','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4700','0','0.037449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','4701','0','0.1835','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','5207','0','0.0861326','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','5212','0','0.262143','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','5573','0','0.101112','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','5574','0','0.0786429','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6344','0','0.0337041','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6348','0','0.0299592','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6378','0','0.243418','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6379','0','0.213459','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6380','0','0.119837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6528','0','0.149796','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6536','0','0.0599184','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6538','0','0.0636633','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6539','0','0.0973673','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6540','0','0.243418','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6541','0','0.0711531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6545','0','0.247163','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6546','0','0.119837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6547','0','0.1835','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6548','0','0.108602','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6551','0','0.17601','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6552','0','0.0936224','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6553','0','0.187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6554','0','0.187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6557','0','0.104857','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6559','0','0.146051','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6560','0','0.104857','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6561','0','0.0187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6562','0','0.0187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6563','0','0.0936224','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6564','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6575','0','0.0936224','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6581','0','0.0486837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6583','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6585','0','0.119837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','6716','0','0.0449388','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','7288','0','0.0262143','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','7554','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','7608','0','0.0224694','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9775','0','0.0524286','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9776','0','0.0936224','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9777','0','0.146051','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9778','0','0.037449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9779','0','0.35202','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9780','0','0.0711531','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9783','0','0.037449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9784','0','0.074898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9785','0','0.187245','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9786','0','0.0898775','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9787','0','0.074898','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9788','0','0.303337','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9789','0','0.0786429','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','9790','0','0.0486837','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','10407','0','0.037449','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','14166','0','0.153541','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','14167','0','0.116092','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','14168','0','0.112347','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','14173','0','0.0636633','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','14174','0','0.127327','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','15210','0','0.1835','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','15222','0','0.19848','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','15248','0','0.104857','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','15268','0','0.134816','0','1','0','1','1','');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES('7013','15926','0','0.116092','0','1','0','1','1','');

UPDATE `creature_template`
SET `lootid` = `entry`
WHERE `entry` IN
(615,4462,4463,7013);

-- fix up trainer wilma ranthal (6295)
DELETE FROM `npc_trainer`
WHERE `ID` = 6295;

INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','8613','10','0','0','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','8617','500','393','50','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','8618','5000','393','125','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','10768','50000','393','200','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','32678','100000','393','275','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','50305','350000','393','350','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','74522','500000','393','425','0','0');
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `Index`) VALUES('6295','102216','600000','393','500','0','0');

-- fix up Tharil'zun spawn
UPDATE creature
SET position_x = -9319.09,
position_y = -3025.25,
position_z = 130.996
WHERE guid = 375107;

-- fix up Gath'Ilzogg spawn
UPDATE creature
SET position_x = -9471.33,
position_y = -2970.83,
position_z = 126.827,
areaId = 0
WHERE guid = 375108;

-- missing spawns
DELETE FROM creature
WHERE guid IN (375100,375101,375104,375151,375152,375153,375154,375155,375156,375157,375158,375159,375160,375161);

DELETE FROM creature
WHERE guid IN (375162,375163,375164);

INSERT INTO `creature`
 (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
 VALUES
(375100, 436, 0, 44, 5325, 1, 0, 0, 0, 0, -9221.778, -3054.479, 100.4263, 4.78198, 120, 10, 0, 0, 0, 1, 0, 0, 0, 24015),
(375101, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9362.199, -3016.61, 136.7715, 5.912722, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375104, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9362.97, -3063.06, 164.6403, 0.2094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375151, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9385.44, -3057.84, 139.0983, 1.64061, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375152, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9382.58, -3070.72, 140.5583, 3.211406, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375153, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9408.18, -3060.87, 140.5583, 6.248279, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015), 
(375154, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9405.61, -3087.89, 139.6563, 1.623156, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375155, 436, 0, 44, 70, 1, 0, 0, 0, 0, -9422.28, -3030.401, 136.7041, 6.156182, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375156, 4464, 0, 44, 5325, 1, 0, 0, 0, 0, -9212.358, -2981.787, 99.7868, 1.349002, 120, 10, 0, 0, 0, 1, 0, 0, 0, 24015),
(375157, 4464, 0, 44, 5325, 1, 0, 0, 0, 0, -9255.83, -3024.38, 115.2133, 0.6806784, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375158, 4464, 0, 44, 5325, 1, 0, 0, 0, 0, -9184.64, -2931.53, 107.8983, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375159, 4464, 0, 44, 70, 1, 0, 0, 0, 0, -9291.47, -2983.71, 122.7743, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375160, 4464, 0, 44, 70, 1, 0, 0, 0, 0, -9269.941, -2936.006, 128.3788, 4.806437, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375161, 4464, 0, 44, 70, 1, 0, 0, 0, 0, -9306.655, -2935.511, 128.3888, 4.684593, 120, 10, 0, 0, 0, 1, 0, 0, 0, 24015),
(375162, 4464, 0, 44, 70, 1, 0, 0, 0, 0, -9262.539, -2910.709, 126.7976, 6.218696, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375163, 4464, 0, 44, 70, 1, 0, 0, 0, 0, -9317.43, -2973.58, 122.7913, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015),
(375164, 4464, 0, 44, 70, 1, 0, 0, 0, 0, -9306.104, -3035.471, 128.3289, 2.818776, 120, 0, 0, 0, 0, 0, 0, 0, 0, 24015);

