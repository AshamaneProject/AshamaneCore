DELETE FROM disables WHERE `sourceType` = 1 AND `entry` = 14474;
INSERT INTO `disables` (`sourceType`, `entry`) VALUES
(1, 14474);

UPDATE creature_template SET scriptname = "npc_zapnozzle" WHERE entry IN (36608);
UPDATE gameobject_template SET scriptname = "gob_goblin_escape_pod" WHERE entry = 195188;
UPDATE creature_template SET `unit_flags` = 514, `InhabitType` = 2, scriptname = "npc_goblin_espace_pod" WHERE entry IN (34748, 35649);
UPDATE creature SET MovementType = 1, spawndist = 20 WHERE id = 34763;
UPDATE creature_template SET scriptname = "npc_bomb_monkey" WHERE entry IN (34699);

DELETE FROM phase_area WHERE AreaId IN (4720);
INSERT INTO phase_area VALUE
(4720, 169, "Lost Isles default phase"),
(4720, 170, "Lost Isles - First Isles - Part 1"),
(4720, 171, "Lost Isles - First Isles - Part 2"),
(4720, 172, "Lost Isles - First Isles - Part 3"),
(4720, 179, "Lost Isles - First Isles - Part 4 Final"),

(4720, 180, "Lost Isles - Main Island - Part 1"),
(4720, 181, "Lost Isles - Main Island - Part 2"),
(4720, 182, "Lost Isles - Main Island - Part 3"),
(4720, 183, "Lost Isles - Main Island - Part 4"),
(4720, 184, "Lost Isles - Main Island - Part 5"),
(4720, 185, "Lost Isles - Main Island - Part 6");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceEntry` = 4720 AND SourceGroup <= 179;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`) VALUES
(26, 170, 4720, 0, 47, 14237, 1, 0),
(26, 171, 4720, 0, 47, 14237, 1, 1),

(26, 172, 4720, 0, 47, 14240, 1, 1),
(26, 172, 4720, 0, 47, 14326, 1, 0),

(26, 179, 4720, 0, 47, 14326, 1, 1),
(26, 179, 4720, 0, 47, 14245, 66, 1);

DELETE FROM `creature_text` WHERE `CreatureID` IN (36600, 36608);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(36600, 0, 0, 'That\'s $n?! Sorry, Doc, I thought $g he : she; was dead!', 12, 0, 100, 0, 0, 0, 36577, 'Geargrinder Gizmo to Player'),
(36600, 1, 0, 'Yeah, there\'s tons of people still trapped in the escape pods, boss. Oh, wait. I guess you\'re not the boss anymore. Anyways, they\'re all probably going to drown if you don\'t get them out.', 12, 0, 100, 1, 0, 0, 49824, 'Geargrinder Gizmo to Player'),
(36608, 0, 0, 'Gizmo, what are you doing just sitting there? Don\'t you recognize who that is laying next to you?!', 12, 0, 100, 396, 0, 0, 36543, 'Doc Zapnozzle to Player'),
(36608, 1, 0, 'That\'s $n! $G He\'s : She\'s; the whole reason we\'re still breathing and not crispy fried critters back on Kezan.', 12, 0, 100, 396, 0, 0, 36544, 'Doc Zapnozzle to Player'),
(36608, 2, 0, 'Stay back, I\'m going to resuscitate $g him : her;! I hope these wet jumper cables don\'t kill us all!', 12, 0, 100, 396, 0, 0, 36545, 'Doc Zapnozzle to Player'),
(36608, 3, 0, 'Come on! Clear!', 12, 0, 100, 396, 0, 0, 36546, 'Doc Zapnozzle to Player'),
(36608, 4, 0, 'That\'s all I\'ve got. It\'s up to $g him : her; now. You hear me, $n? Come on, snap out of it! Don\'t go into the Light!', 12, 0, 100, 396, 0, 0, 36547, 'Doc Zapnozzle to Player'),
(36608, 5, 0, 'You made the right choice. We all owe you a great deal, $n. Try not to get yourself killed out here.', 12, 0, 100, 396, 0, 0, 36548, 'Doc Zapnozzle to Player'),
(36608, 6, 0, 'There are more survivors to tend to. I\'ll see you on the shore.', 12, 0, 100, 397, 0, 0, 36549, 'Doc Zapnozzle to Player');

DELETE FROM `spell_area` WHERE `spell` IN (69010, 70661, 70678, 70680, 70681, 68212, 69303);
INSERT INTO `spell_area` (`spell`, `area`, `flags`, `quest_end`, `quest_end_status`) VALUES
(69010, 4721, 3, 14239, 64),
(70661, 4778, 3, 14021, 66),
(70661, 4780, 3, 14021, 66),
(70678, 4778, 3, 14021, 66),
(70678, 4780, 3, 14021, 66),
(70680, 4778, 3, 14021, 66),
(70680, 4780, 3, 14021, 66),
(70681, 4778, 3, 14021, 66),
(70681, 4780, 3, 14021, 66),
(68212, 4780, 2, 14303, 64),
(69303, 4782, 2, 14238, 64);

DELETE FROM spell_script_names WHERE scriptname IN ("spell_lost_isles_near_death", "spell_ctu_snapflash", "spell_ctu_bind_sight", "aura_infrared_orc_scout");
INSERT INTO spell_script_names VALUES
(69010, "spell_lost_isles_near_death"),
(68280, "spell_ctu_snapflash"),
(70641, "spell_ctu_bind_sight"),
(68338, "aura_infrared_orc_scout");

DELETE FROM creature WHERE guid = 280000018;
insert into `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
(280000018,28960,648,0,0,1,0,0,0,-1,0,0,551.205,3260.38,-1.15172,2.57184,300,0,0,26268,0,0,0,0,0,0,0,'',0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (69018, 70641, 68280, 68059);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`,`ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 1, 69018, 0, 31, 3, 28960),
(13, 1, 70641, 0, 31, 3, 23837),
(13, 1, 68280, 1, 31, 3, 37872),
(13, 1, 68280, 2, 31, 3, 37895),
(13, 1, 68280, 3, 31, 3, 37896),
(13, 1, 68280, 4, 31, 3, 37897),
(13, 1, 68059, 0, 31, 3, 35810);

UPDATE creature_template SET AIName = '', scriptname = "npc_foreman_dampwick" WHERE entry IN (35769);
UPDATE creature_template SET scriptname = "npc_frightened_miner_escort" WHERE entry IN (35813);
UPDATE `creature_template_addon` SET `bytes2` = 0, `auras` = '' WHERE `entry` = 35810;
DELETE FROM creature_addon WHERE guid IN (40000244, 40000245);
UPDATE `creature_template` SET `unit_flags` = 0, scriptname = '', unit_flags2 = 2048, unit_flags3 = 0 WHERE (entry = 35810);

DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 36600);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36600, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, '', 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Play Emote on Gossip'),
(36600, 0, 1, 0, 19, 0, 100, 0, 14001, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Say Text on Quest Add'),
(36600, 0, 2, 0, 19, 0, 100, 0, 14474, 0, 0, 0, '', 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Say Text on Quest Add');

UPDATE `gameobject_questitem` SET `VerifiedBuild`=27481 WHERE (`GameObjectEntry`=195201 AND `Idx`=0); -- Crate of Tools
DELETE FROM creature WHERE guid IN (40000011, 40000108, 40000298, 40000339, 40000351, 40000615, 40000712, 40000713, 40000720, 40000169, 40000269, 40000288);

DELETE FROM `creature_template_addon` WHERE `entry` = 35814;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(35814, 68065);

DELETE FROM `script_waypoint` WHERE entry IN (35813, 36585, 36143, 36178, 36505);
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
-- Miner
(35813, 1,  498.656, 2974.73,  7.58185,   0, ''),
(35813, 2,  513.852, 2973.64,  8.12042,   0, ''),
(35813, 3,  529.972, 2957.91,  6.77907,   0, ''),
(35813, 4,  558.182, 2933.34,  0.843215,  0, ''),
(35813, 5,  588.137, 2964.54, -2.433,     10000, 'Kaja\'mite 1'),
(35813, 6,  598.471, 2952.82, -5.86114,   0, ''),
(35813, 7,  576.819, 2916.44, -7.28581,   0, ''),
(35813, 8,  576.566, 2907.31, -7.1668,    10000, 'Kaja\'mite 2'),
(35813, 9,  573.927, 2904.92, -7.54599,   0, ''),
(35813, 10, 577.658, 2878.72, -8.62971,   0, ''),
(35813, 11, 608.599, 2857.32, -7.12896,   10000, 'Kaja\'mite 3'),
(35813, 12, 633.022, 2920.86, -0.868127,  0, ''),
(35813, 13, 665.740, 2948.91, -0.0379976, 10000, 'Kaja\'mite 4'),
(35813, 14, 640.430, 2932.24, 0.413035,   0, 'escape'),

-- Bastia
(36585, 1,  868.362, 2830.14, 105.524, 0, ''),
(36585, 2,  868.498, 2865.06, 101.143, 0, ''),
(36585, 3,  875.859, 2871.74, 100.686, 0, ''),
(36585, 4,  896.847, 2876.02, 99.81,   0, ''),
(36585, 5,  910.631, 2884.86, 99.9498, 0, ''),
(36585, 6,  919.198, 2903.35, 100.76,  0, ''),
(36585, 7,  940.969, 2918.34, 105.378, 0, ''),
(36585, 8,  951.992, 2945.99, 109.54,  0, ''),
(36585, 9,  1040.47, 2952.25, 110.763, 0, ''),
(36585, 10, 1049.41, 2977.52, 112.625, 0, ''),
(36585, 11, 1074.74, 2997.53, 117.164, 0, ''),
(36585, 12, 1074.47, 3022.87, 121.391, 0, ''),
(36585, 13, 1088.9,  3041.96, 123.211, 0, ''),
(36585, 14, 1087.73, 3061.2,  123.738, 0, ''),
(36585, 15, 1070.91, 3099.4,  125.23,  0, ''),
(36585, 16, 1047.68, 3119.57, 125.253, 0, ''),
(36585, 17, 1026.96, 3127.1,  124.978, 0, ''),
(36585, 18, 1023.41, 3168.93, 119.783, 0, ''),
(36585, 19, 1054.61, 3192.71, 114.612, 0, ''),
(36585, 20, 1062.09, 3224.9,  96.4815, 0, ''),
(36585, 21, 1078.86, 3240.03, 81.2089, 0, ''),

-- Gyrocoptere
(36143, 1, 671.514,  3468.13, 52.9430, 0, ''),
(36143, 2, 1040.012, 3759.19, 46.8878, 0, ''),
(36143, 3, 971.488,  3804.29, 15.0729, 0, ''),

-- Warchief Revenge cyclone
(36178, 1,  1048.99, 3860,    33.2749, 0, ''),
(36178, 2,  1101.95, 3812.89, 30.3696, 0, ''),
(36178, 3,  1067.27, 3740.67, 29.7548, 0, ''),
(36178, 4,  1019.16, 3777.24, 32.0205, 0, ''),
(36178, 5,  1022.4,  3865.68, 32.8839, 0, ''),
(36178, 6,  978.305, 3877.43, 29.1646, 0, ''),
(36178, 7,  878.821, 3827.45, 29.7215, 0, ''),
(36178, 8,  883.349, 3910.59, 26.0531, 0, ''),
(36178, 9,  949.782, 3933.79, 30.7593, 0, ''),
(36178, 10, 946.961, 3842.94, 34.7302, 0, ''),
(36178, 11, 954.366, 3766,    41.9682, 0, ''),
(36178, 12, 1009.65, 3791.36, 35.2096, 0, ''),
(36178, 13, 1021.12, 3834.18, 36.3348, 0, ''),

-- Sling Rocket
(36505, 1,  893.967, 2687.62, 179.202, 0, ''),
(36505, 2,  910.878, 2566.45, 145.732, 0, ''),
(36505, 3,  924.846, 2420.48, 48.9030, 0, ''),
(36505, 4,  930.617, 2385.13, 7.11655, 0, '');

UPDATE creature_template SET `unit_flags` = 131072, scriptname = "npc_lost_isles_weed" WHERE entry IN (35896, 35995, 35897);
UPDATE `creature_template` SET `unit_flags` = 514 WHERE entry IN (36578, 35893, 35894);
UPDATE creature_template SET scriptname = "npc_killag_sangrecroc" WHERE entry = 35917;
UPDATE creature_template SET scriptname = "" WHERE entry = 36578;
UPDATE creature_template SET scriptname = "npc_cliff_bastia" WHERE entry = 36585;

DELETE FROM creature WHERE guid IN (40000499, 40001279, 40001284, 4001322, 40001275, 40001288, 40001651, 40001320, 40000731, 40000549, 40000701, 40000734, 40000692, 40000553, 40000551, 40000618, 40000707, 40000501, 40000555, 40000496, 40000494, 40000541);
DELETE FROM creature WHERE guid IN (40000702, 40000730, 40000724, 40000733, 40000729, 40000708, 40000727, 40000704, 40000697, 40000503, 40000696, 40000502, 40000548, 40000700, 40000722, 40000495, 40000486, 40000552, 40000699, 40000641, 40000639, 40000629);
DELETE FROM creature WHERE guid IN (40001370, 40001369, 40001371, 40001419, 40001414, 40001408, 40001437);

-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (36464, 36104, 36117, 36578, 36115, 36104);

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE source_type = 0 AND entryorguid IN (-40001258, -40001259, -40001257, -40001268, -40001264, -40001261, -40001251);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-40001258, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(-40001259, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(-40001257, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(-40001268, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(-40001264, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(-40001261, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(-40001251, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 42, 0, 75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE creature_template SET scriptname = "npc_gyrocopterequest_giver" WHERE entry = 36127;
UPDATE creature_template SET scriptname = "npc_precious_cargo_gyrocopter" WHERE entry = 36143;
UPDATE creature_template SET scriptname = "npc_lost_isles_thrall_prisonner" WHERE entry = 36145;
UPDATE creature_template SET scriptname = "npc_lost_isles_thrall_top_boat" WHERE entry = 36161;
UPDATE creature_template SET scriptname = "npc_warchief_revenge_cyclone" WHERE entry = 36178;

UPDATE creature_template SET scriptname = "npc_sassy_rocket_sling" WHERE entry = 36425;
UPDATE creature_template SET scriptname = "npc_gallywix_sling_rocket" WHERE entry = 36513;
UPDATE gameobject_template SET scriptname = "gob_rocket_sling" WHERE entry = 196439;
UPDATE creature_template SET scriptname = "npc_sling_rocket" WHERE entry = 36505;

UPDATE creature_template SET InhabitType = 4 WHERE entry = 36177;
