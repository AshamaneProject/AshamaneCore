-- existing gameobject entry 204811, skipped.
DELETE FROM `gameobject` WHERE `guid`=350001;

-- Creature does not exist but has a record in `creature_addon`
DELETE FROM `creature_addon` WHERE `guid` IN (
802223, 802340, 802349, 802350, 802351, 803926, 804098, 804837, 804844, 804846, 10690087, 10690088, 10690089, 10690090, 10690091, 10690100, 10690101, 10690102, 
10690103, 10690104, 10690105, 10690106, 10690107, 10690108, 10690109, 10690110, 10690111, 10690112, 10690113, 10690114, 10690115, 10690116, 10690117, 10690118,
10690119, 10690190, 10690197, 10690198, 10690199, 10690200, 10690209, 10690210, 10690213, 10690218, 10690219, 10690221, 10690223, 10690224, 10690225, 10690227,
10690229, 10690231, 10690435, 10690462, 10690463, 10690497, 10690565, 10690568, 10690577, 10690579, 10690581, 10690582, 10690584, 10690585, 10690586, 10690587,
10690588, 10690589, 10690592, 10690593, 10690594, 10690602, 10690608, 10690610, 10690616, 10690617, 10690618, 10690619, 10690620, 10690621, 10690622, 10690623,
10690624, 10690625, 10690626, 10690627, 10690628, 10690629, 10690630, 10690631, 10690632, 10690633, 10690634, 10690635, 10690636, 10690637, 10690642, 10690643,
10690644, 10690645, 10690646, 10690647, 10690648, 10690649, 10690651, 10690652, 10690662, 10690664, 10690671, 10690672, 10690673, 10690674, 10690675, 10690676,
10690677, 10690678, 10690680, 10690683, 10690687, 10690694, 10690695, 10690997, 10691002, 10691156, 10691157, 10691158, 10691159, 10691160, 10691161, 10691162,
10691163, 10691164, 10691165, 10691166, 10691167, 10691168, 10691169, 10691170, 10691171, 10691172, 10691173, 10691174, 10691175, 10691180, 10691401, 10691402,
10691403, 10691404, 10691513, 10691514, 10691515, 10691516, 10691517, 10691518, 10691519, 10691520, 10691521, 10691522, 10691523, 10691524, 10691525, 10691526,
10691527, 10691528, 10691529, 10691530, 10691531, 10691532, 10691533, 10691534, 10691535, 10691536, 20556578, 20556620, 20556621, 20556630, 20556635, 20556637, 
20556641, 20556649);

-- Table `gameobject` has gameobject with invalid coordinates, skip
DELETE FROM `gameobject` WHERE `id` IN (242174, 247970, 247971, 247972, 247973, 248513, 248932, 250241, 250242, 250243, 251033, 251330, 251397, 251398, 251401, 251519,
251608, 251609, 251610, 251611, 251612, 251684, 251685, 251844, 251982, 251983, 251984, 251988, 252103, 252105, 252315, 252316, 252317, 252318, 252319, 252320, 252321,
252322, 252348, 252349, 252435, 253462, 253923, 253924, 253988, 253989, 254240, 254241, 254242, 254243, 255925, 255926, 255928, 256857, 256872, 256873, 256874, 256875,
256876, 256877, 256878, 256879, 256880, 256881, 256882, 256883, 256884, 256885, 256887, 256892, 256893, 256901, 256902, 256903, 258843, 258847, 260985, 266174, 266180,
256894, 266173, 256899, 256898, 253178, 266959, 251687, 251686, 251683, 266835, 266919, 251981, 266181, 266183, 266182, 266395, 253128, 258848, 255927, 254145, 243403,
254239, 254148, 254147, 251833, 251832, 265470, 265469, 259929, 254276, 254238, 254149);

-- GameObject does not exist but has a record in `gameobject_addon`
DELETE FROM `gameobject_addon` WHERE `guid` IN (301027, 10690318, 10690302, 10690227, 10690225, 10690319, 10690301, 10690300, 10690299, 10690298, 10690297, 10690296, 
10690295, 10690294, 10690293, 10690292, 10690291, 10690290, 10690289, 10690288, 10690287, 10690286, 10690285, 10690284, 10690283, 10690282, 10690281, 10690280,
10690279, 10690278, 10690277, 10690276, 10690275, 10690274, 10690273, 10690272, 10690271, 10690270, 10690269, 10690268, 10690267, 10690266, 10690265, 10690264,
10690263, 10690262, 10690261, 10690260, 10690259, 10690258, 10690257, 10690256, 10690255, 10690254, 10690253, 10690252, 10690251, 10690250, 10690248, 10690247, 
10690246, 10690243, 10690242, 10690241, 10690239, 10690238, 10690237, 10690235, 10690230, 10690229, 10690228, 10690224, 10690223, 10690222, 10690221, 10690220,
10690219, 10690218, 10690217, 10690216, 10690215, 10690214, 10690213, 10690212, 10690211, 10690210, 10690209, 10690208, 10690207, 10690206, 20375131, 20375132,
10690205, 10690204, 10690203, 10690202, 10690201, 10690200, 10690199, 10690198, 10690197, 10690196, 10690195, 10690194, 10690193, 10690192, 10690191, 10690190,
10690189, 10690188, 10690187, 10690186, 10690185, 10690184, 10690183, 10690182, 10690181, 10690180, 10690179, 10690178, 10690177, 10690176, 10690175, 10690174,
10690173, 10690172, 10690171, 10690170, 10690169, 10690168, 10690167, 10690165, 10690163, 10690162, 10690161, 10690160, 10690159, 10690155, 10690154, 10690150,
10690149, 10690148, 10690147, 10690146, 10690145, 10690144, 20375135, 20405484, 20405532, 20367423, 20367918, 20373874, 20375157, 20375141, 20374984, 20375160,
10690143, 10690142, 10690140, 10690139, 10690138, 10690137, 10690136, 10690135, 10690134, 10690133, 10690130, 10690129, 10690128, 10690127, 10690126, 10690125,
10690124, 10690123, 10690122, 10690121, 10690120, 10690119, 21002121, 21002122, 10690118, 10690117, 10690116, 10690115, 10690114, 10690113, 10690112, 10690111,
10690110, 10690109, 10690108, 10690107, 10690106, 10690105, 10690104, 10690103, 10690102, 10690101, 10690100, 10690099, 21002126, 10690098, 10690097, 10690096,
10690095, 10690094, 10690093, 10690092, 10690091, 10690090, 10690089, 10690088, 10690087, 10690086, 10690085, 10690084, 10690083, 10690082, 10690081, 10690079,
10690077, 10690073, 10690072, 10690071, 10690070, 10690069, 10690068, 10690067, 10690066, 10690065, 10690064, 10690063, 10690062, 10690061, 10690060, 10690058,
10690057, 10690056, 10690055, 10690054, 10690053, 10690052, 10690051, 10690050, 10690049, 10690048, 10690047, 10690046, 10690045, 10690044, 10690043, 10690042,
10690041, 10690040, 10690038, 10690037, 10690036, 10690035, 10690034, 10690033, 10690032, 10690031, 10690030, 10690029, 10690028, 10690027, 10690026, 10690023,
10690022, 10690021, 10690020, 10690019, 10690018, 10690017, 10690016, 10690014, 10690013, 10690012, 10690011, 10690010, 10690008, 10690006, 10690005, 10690004,
10690003, 10690002, 10690001, 10690000, 20375104, 20375105, 20365511, 20366300, 20366352, 20375144, 20367374, 20367375, 20367386, 20367391, 20367392, 20367401,
20367383, 20367384, 20367385); 

-- Table `creature_queststarter` has creature entry (107997) for quest 40745, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
UPDATE `creature_template` SET `npcflag`=npcflag|2 WHERE `entry` IN (620, 35118, 35229, 35463, 35627, 35830, 36479, 38611, 43749, 107997);

-- Table `npc_trainer` contains entries for a creature template (ID: 35807) without any trainer flag, ignoring
UPDATE `creature_template` SET `npcflag`=npcflag|48 WHERE `entry`=35807;

-- Table `(game_event_)npc_vendor` has data for creature template (Entry: 92185) without vendor flag, ignore
UPDATE `creature_template` SET `npcflag`=npcflag|128 WHERE `entry`=92185;

-- Table 'reference_loot_template' Entry 34373 does not exist but it is used by Reference
DELETE FROM `creature_loot_template` WHERE `Reference` IN (25000, 25001, 25002, 25004, 25019, 25020, 25025, 25026, 34069, 34070, 34071, 34072, 34073, 34074, 34075, 34076, 34077, 35003, 43000, 43006, 43015, 90069, 90077, 190069, 263148, 263149, 263148, 263150, 263151, 263152, 263153, 263154);

-- Table `(game_event_)npc_vendor` has `maxcount` (1) for item 22729 of vendor (Entry: 133127) but `incrtime`=0, ignore
UPDATE `npc_vendor` SET `incrtime`=3600 WHERE `entry`=133127 AND `item` IN (4404, 4371, 4357, 4364, 18647, 22729);

-- Table `(game_event_)npc_vendor` has `maxcount` (1) for item 10314 of vendor (Entry: 133239) but `incrtime`=0, ignore
UPDATE `npc_vendor` SET `incrtime`=3600 WHERE `entry`=133239 AND `item` IN (5772, 6270, 10314, 10317);

-- Table `(game_event_)npc_vendor` for Vendor (Entry: 133114) have in item list non-existed item (160298, type 1), ignore
DELETE FROM `npc_vendor` WHERE `entry`=133114 AND `slot`=5;

-- Table `(game_event_)npc_vendor` for Vendor (Entry: 133127) have in item list non-existed item (160298, type 1), ignore
DELETE FROM `npc_vendor` WHERE `entry`=133127 AND `slot`=178;

-- Table `(game_event_)npc_vendor` has Item (Entry: 67526) with invalid PlayerConditionId (12237) for vendor (50305), ignore
UPDATE `npc_vendor` SET `PlayerConditionID`=0 WHERE `entry` IN (50305, 50307);

-- Table `gossip_menu_option` for MenuId 21709, OptionIndex 0 has non-existing or incompatible OptionBroadcastTextID 137935, ignoring.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (13105, 13713, 13714, 14510, 18575, 19769, 19867, 19907, 20728, 20746, 20974, 20985, 20989, 21004, 21013, 21049, 
21058, 21059, 21059, 21067, 21072, 21075, 21144, 21163, 21208, 21208, 21208, 21208, 21238, 21238, 21238, 21239, 21240, 21241, 21242, 21243, 21244, 21245, 21247, 21253,  
21291, 21312, 21315, 21323, 21380, 21380, 21380, 21380, 21380, 21423, 21451, 21454, 21456, 21457, 21462, 21505, 21519, 21709);

-- Table gossip_menu: ID 22142 is using non-existing TextId 31631
DELETE FROM `gossip_menu` WHERE `TextId` IN (14604, 14957, 14999, 31631, 31694, 31695, 31708, 31811, 31832, 31906, 31923, 32063, 32064, 32104, 32156, 32158, 32160,
32179, 32946, 33055, 32231, 32321, 32232, 32233, 32234, 32235, 32236, 32237, 32238, 32239, 32247, 32255, 32313, 32256, 32380, 32383, 32400, 32405, 32748, 32429, 32430,
32431, 32436, 32451, 32453, 32555, 32671, 32672, 32673, 32691, 32692, 32721, 32738, 32772, 32773, 32778, 32787, 32798, 32832, 32926, 33005, 32983, 32996, 32944, 33045,
33043, 33066, 33061, 33064, 33062, 33063, 31640, 33056, 33168, 33170, 33171, 33194);

-- Table `criteria_data` contains data for non-existing criteria (Entry: 6133). Ignored.
DELETE FROM `criteria_data` WHERE `criteria_id` IN (6084, 6133, 6180, 10066, 10067);

-- Table 'reference_loot_template' Entry 300008 isn't reference id and not referenced from loot, and thus useless.
DELETE FROM `reference_loot_template` WHERE `entry` IN (31091, 31099, 45636, 263148, 263149, 263148, 263150, 263151, 263152, 263153, 263154, 300001, 300002, 300003, 300004, 300005, 300006, 300007, 300008);

-- AreaTrigger (ID: 3523100) does not exist in `AreaTrigger.dbc`.
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (314, 373, 983, 1489, 2200, 2763, 3691, 5555, 5559, 6022, 7214, 7455, 7625, 7630, 9677, 11353, 11420, 12802, 35231, 151582, 3523100);

-- `pool_gameobject` has a non existing gameobject spawn (GUID: 35187) defined for pool id (2012), skipped.
DELETE FROM `pool_gameobject` WHERE `pool_entry`=2012;

-- Creature (Entry: 142154) has non-existing faction template (2958). This can lead to crashes, set to faction 35.
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=142154;

-- Creature does not have any existing display id in Modelid1/Modelid2/Modelid3/Modelid4.
DELETE FROM `creature_template` WHERE `entry` IN (140146, 132599, 142154, 132603, 141767, 140462, 141903, 132602, 141845, 141997, 141706, 132601, 117473, 141826, 141804, 144173, 143208, 132604, 132600);

-- Table `creature_template` lists creature (ID: 140210) with invalid `HealthScalingExpansion` 7. Ignored and set to 0.
UPDATE `creature_template` SET `HealthScalingExpansion`=0 WHERE `entry` IN (135201, 135202, 137762, 140210, 140462, 141707, 141119);

-- Creature template (CreatureID: 141706) does not exist but has a record in `creature_equip_template`
DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (141706, 141767, 141804, 141826, 141845, 142154);

-- Creature template (Entry: 141845) does not exist but has a record in `creature_template_addon`
DELETE FROM `creature_template_addon` WHERE `entry` IN (140462, 141804, 141767, 141826, 141706, 142154, 141845);

-- Creature template (Entry: 117473) does not exist but has a record in `creature_template_scaling`
DELETE FROM `creature_template_scaling` WHERE `entry` IN (132599, 132600, 132604, 132603, 132602, 132601, 141804, 141826, 142154, 141767, 141706, 141845, 143208, 141997, 140146, 144173, 117473);

-- creature_formations table member guid 310334 incorrect (not exist)
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (138187, 138213, 310315, 310334);

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2545) for TrainerId and TrainerId 136, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2545 AND `TrainerId`=136;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2548) for TrainerId and TrainerId 136, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2548 AND `TrainerId`=136;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2503) for TrainerId and TrainerId 407, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2503 AND `TrainerId`=407;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2572) for TrainerId and TrainerId 91, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2572 AND `TrainerId`=91;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2537) for TrainerId and TrainerId 163, 880 ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2537 AND (`TrainerId`=163 OR `TrainerId`=880);

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2506) for TrainerId and TrainerId 407, 102 ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2506 AND (`TrainerId`=407 OR `TrainerId`=102);

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2569) for TrainerId and TrainerId 91, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2569 AND `TrainerId`=91;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2485) for TrainerId and TrainerId 59, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2485 AND `TrainerId`=59;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2514) for TrainerId and TrainerId 387, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2514 AND `TrainerId`=387;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2532) for TrainerId and TrainerId 103, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2532 AND `TrainerId`=103;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2539) for TrainerId and TrainerId 880, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2539 AND `TrainerId`=880;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2538) for TrainerId and TrainerId 880, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2538 AND `TrainerId`=880;

-- Table `trainer_spell` references non-existing skill (ReqSkillLine: 2540) for TrainerId and TrainerId 877, ignoring
DELETE FROM `trainer_spell` WHERE `ReqSkillLine`=2540 AND (`TrainerId`=877 OR `TrainerId`=880 OR `TrainerId`=163);

-- Table `trainer_spell` references non-existing spell (SpellId:) for TrainerId, ignoring
DELETE FROM `trainer_spell` WHERE `TrainerId`=387 AND `SpellId`=264495;
DELETE FROM `trainer_spell` WHERE `TrainerId`=390 AND `SpellId`=265856;
DELETE FROM `trainer_spell` WHERE `TrainerId`=103 AND `SpellId`=264578;
DELETE FROM `trainer_spell` WHERE `TrainerId`=102 AND `SpellId`=264478;
DELETE FROM `trainer_spell` WHERE `TrainerId`=136 AND `SpellId`=264639;
DELETE FROM `trainer_spell` WHERE `TrainerId`=91  AND `SpellId`=265844;
DELETE FROM `trainer_spell` WHERE `TrainerId`=424 AND `SpellId`=265820;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271657;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271659;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271661;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271665;
DELETE FROM `trainer_spell` WHERE `TrainerId`=388 AND `SpellId`=265820;
DELETE FROM `trainer_spell` WHERE `TrainerId`=59  AND `SpellId`=264212;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271673;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271663;
DELETE FROM `trainer_spell` WHERE `TrainerId`=10  AND `SpellId`=271617;
DELETE FROM `trainer_spell` WHERE `TrainerId`=163 AND `SpellId`=264623;
DELETE FROM `trainer_spell` WHERE `TrainerId`=163 AND `SpellId`=264617;
DELETE FROM `trainer_spell` WHERE `TrainerId`=91  AND `SpellId`=265838;
DELETE FROM `trainer_spell` WHERE `TrainerId`=136 AND `SpellId`=264633;
DELETE FROM `trainer_spell` WHERE `TrainerId`=407 AND `SpellId`=264484;
DELETE FROM `trainer_spell` WHERE `TrainerId`=407 AND `SpellId`=264478;

-- SmartWaypointMgr::LoadFromDB: Path entry 332660, unexpected point id 0, expected 1.
DELETE FROM `waypoints` WHERE `entry`=332660;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(332660, 1,	1314.44, -2231.27, 91.8572,	'Wounded WP 1'),
(332660, 2,	1302.78, -2222.36, 91.6810,	'Wounded WP 2'),
(332660, 3,	1255.75, -2224.22, 92.3249,	'Wounded WP 3'),
(332660, 4, 1219.97, -2245.00, 92.0576, 'Wounded WP 4'); 

-- creature_formations table member guid 310334 incorrect (not exist)
DELETE FROM `creature_formations` WHERE `memberGUID`=310334;

-- [Condition SourceType: 15 (Gossip Menu Option), SourceGroup: 21312, SourceEntry: 0] Not handled grouped condition.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceEntry`=5 AND `SourceGroup`=21058;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceEntry` IN (5, 6, 7) AND `SourceGroup`=21072;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceEntry`=0 AND `SourceGroup` IN (21312, 21253);

-- SmartAIMgr: Creature 3330400 Event 5 Action 53 uses non-existent WaypointPath id 33304, skipped.
UPDATE `smart_scripts` SET `action_param2`=333040 WHERE `entryorguid`=3330400 AND `id`=5;

-- SmartAIMgr::LoadSmartAIFromDB: Entry 39270 SourceType 0, Event 2, Link Event 3 not found or invalid.
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=39270 AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=39270 AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=39270 AND `id`=2;

-- SmartAIMgr::LoadSmartAIFromDB: Entry 39853 SourceType 0, Event 0, Link Event 7 not found or invalid.
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=39853 AND `id`=0;

-- SmartAIMgr::LoadSmartAIFromDB: Entry 106815 SourceType 0, Event 0, Link Event 1 not found or invalid.
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=106815 AND `id`=0;

-- SmartAIMgr: Entry 33336 SourceType 0 Event 0 Action 12 creature summon: There is a summon spell for creature entry 33302 (SpellId: 62814, effect: 0)
UPDATE `smart_scripts` SET `event_param1`=62814 WHERE `entryorguid`=33336;

-- SmartAIMgr: Entry 33421 SourceType 0 Event 0 Action 12 creature summon: There is a summon spell for creature entry 33507 (SpellId: 63155, effect: 0)
UPDATE `smart_scripts` SET `event_param1`=63155 WHERE `entryorguid`=33421 AND `action_type`=12;
