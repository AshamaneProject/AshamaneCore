
SET @CGUID=1100002;
DELETE FROM creature WHERE guid = @CGUID+188;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+188, 133407, 1, 1637, 5332, 1, 0, 0, 0, 0, 1564.146, -4191.577, 53.76267, 5.407156, 120, 0, 0, 0, 0, 0, 0, 0, 0, 26972); -- 133407 (Area: 5332 - Difficulty: 0) (Auras: 262273 - 262273)

DELETE FROM `creature_questitem` WHERE (`CreatureEntry`=42859 AND `Idx`=0) OR (`CreatureEntry`=4728 AND `Idx`=0) OR (`CreatureEntry`=96265 AND `Idx`=0) OR (`CreatureEntry`=117250 AND `Idx`=0) OR (`CreatureEntry`=95075 AND `Idx`=2) OR (`CreatureEntry`=95075 AND `Idx`=1) OR (`CreatureEntry`=95075 AND `Idx`=0) OR (`CreatureEntry`=110496 AND `Idx`=0);
INSERT INTO `creature_questitem` (`CreatureEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(42859, 0, 57758, 26972), -- 42859
(4728, 0, 49030, 26972), -- 4728
(96265, 0, 129888, 26972), -- 96265
(117250, 0, 134107, 26972), -- 117250
(95075, 2, 134129, 26972), -- 95075
(95075, 1, 129901, 26972), -- 95075
(95075, 0, 129888, 26972), -- 95075
(110496, 0, 129894, 26972); -- 110496

 -- UPDATE SPAWN LOCATION IN PLAYERCREATEINFO --
 
UPDATE playercreateinfo SET map = 1220, zone = 7731, position_x = 4079.05, position_y = 4392.38, position_z = 670.625, orientation = 5.181551 WHERE race = 28; -- Official location from sniff

-- move a mob because hes sitting on the portal fix his phasing later 
UPDATE creature SET position_x = 4075.381348, position_y = 4415.838867, position_z = 667.827148 WHERE guid = 20515317;
 
-- Ambassador Blackguard SAI
SET @AMBASSADOR_BLACKGUARD := 133407;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@AMBASSADOR_BLACKGUARD;
DELETE FROM `smart_scripts` WHERE `entryorguid`= '-1100190' AND `event_param1`=49773;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-1100190,0,0,0,20,0,100,0,49773,0,0,0,206,6800,0,0,0,0,0,7,0,0,0,0,0,0,0,"Ambassador Blackguard - On Quest 'For the Horde' Return - conversation");


DELETE FROM `gameobject_template` WHERE `entry` IN (279282, 279294);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `RequiredLevel`, `VerifiedBuild`) VALUES
(279282, 22, 12807, 'Portal to Orgrimmar', '', '', '', 1, 259106, 0, 0, 1, 0, 55254, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26972), -- 279282
(279294, 22, 36533, 'Portal to Thunder Totem', '', '', '', 0.75, 259122, 0, 0, 0, 0, 55254, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26972); -- 279294


SET @OGUID=20000050;

DELETE FROM `gameobject` WHERE guid IN (@OGUID+47, @OGUID+48);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+47, 279282, 1220, 7731, 7999, 3, 0, 0, 4081.747, 4414.274, 667.8265, 0, 0, 0, 0, 1, 7200, 255, 1, 26972), -- 279282 (Area: 7999 - Difficulty: 0)
(@OGUID+48, 279294, 1, 1637, 5332, 1, 0, 0, 1595.684, -4203.519, 53.86691, 0, 0, 0, 0, 1, 120, 255, 1, 26972); -- 279294 (Area: 5332 - Difficulty: 0)

DELETE FROM creature_questender WHERE id = 133407 AND quest = 49773;
INSERT INTO creature_questender (`id`, `quest`)VALUES
(133407, 49773);

DELETE FROM creature_queststarter WHERE id = 93826 AND quest = 49773;
INSERT INTO creature_queststarter (`id`, `quest`)VALUES
(93826, 49773);

DELETE FROM `areatrigger_template` WHERE `Id` IN (12515, 13459, 10133, 12967);
INSERT INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `VerifiedBuild`) VALUES
(12515, 0, 2, 0.5, 2, 0, 0, 0, 0, 26972),
(13459, 4, 0, 3, 3, 3, 3, 0.3, 0.3, 26972),
(10133, 0, 0, 8, 8, 0, 0, 0, 0, 26972),
(12967, 4, 0, 3, 3, 0.5, 0.5, 0.3, 0.3, 26972);


DELETE FROM `conversation_actors` WHERE (`ConversationId`=6800 AND `ConversationActorId`=60124 AND `Idx`=0) OR (`ConversationId`=6483 AND `Idx`=1) OR (`ConversationId`=6483 AND `Idx`=0) OR (`ConversationId`=716 AND `Idx`=1) OR (`ConversationId`=716 AND `Idx`=0) OR (`ConversationId`=715 AND `Idx`=0) OR (`ConversationId`=715 AND `Idx`=1);
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `Idx`, `VerifiedBuild`) VALUES
(6800, 60124, 0, 26972),
(6483, 0, 1, 26972), -- Full: 0x202FD498805BA08000254F00004BA754 Creature/0 R3061/S9551 Map: 1220 Entry: 93826 Low: 4958036
(6483, 0, 0, 26972), -- Full: 0x0800040000000000FFFFFFFFFFFFFFFF Player/0 R1/S16777215 Map: 0 Low: 1099511627775
(716, 0, 1, 26972), -- Full: 0x202FD4988061638000254F0000465E41 Creature/0 R3061/S9551 Map: 1220 Entry: 99726 Low: 4611649
(716, 0, 0, 26972), -- Full: 0x202FD498806163C000254F0000465E35 Creature/0 R3061/S9551 Map: 1220 Entry: 99727 Low: 4611637
(715, 0, 0, 26972), -- Full: 0x202FD4988061568000254F0000C65E35 Creature/0 R3061/S9551 Map: 1220 Entry: 99674 Low: 13000245
(715, 0, 1, 26972); -- Full: 0x202FD4988061564000254F0000465E35 Creature/0 R3061/S9551 Map: 1220 Entry: 99673 Low: 4611637


DELETE FROM `conversation_actor_template` WHERE `Id`=60124;
INSERT INTO `conversation_actor_template` (`Id`, `CreatureId`, `CreatureModelId`, `VerifiedBuild`) VALUES
(60124, 126076, 81857, 26972);


DELETE FROM `conversation_line_template` WHERE `Id` IN (15516, 15515, 15514, 15512, 15511, 14668, 14667, 14666, 14665, 14664, 14680, 1702, 1701, 1700, 1699, 1698);
INSERT INTO `conversation_line_template` (`Id`, `StartTime`, `UiCameraID`, `ActorIdx`, `Unk`, `VerifiedBuild`) VALUES
(15516, 45902, 606, 0, 0, 26972),
(15515, 33950, 606, 0, 0, 26972),
(15514, 18638, 606, 0, 0, 26972),
(15512, 10427, 606, 0, 8250, 26972),
(15511, 0, 606, 0, 0, 26972),
(14668, 29944, 0, 1, 0, 26972),
(14667, 21012, 0, 1, 0, 26972),
(14666, 13619, 0, 1, 0, 26972),
(14665, 10778, 0, 1, 0, 26972),
(14664, 1000, 0, 1, 0, 26972),
(14680, 0, 0, 0, 0, 26972),
(1702, 4900, 165098707, 1, 0, 26972),
(1701, 0, 165098707, 0, 0, 26972),
(1700, 9300, 119, 0, 0, 26972),
(1699, 6700, 119, 1, 0, 26972),
(1698, 0, 119, 0, 0, 26972);


DELETE FROM `conversation_template` WHERE `Id` IN (6800, 6483, 716, 715);
INSERT INTO `conversation_template` (`Id`, `FirstLineID`, `LastLineEndTime`, `VerifiedBuild`) VALUES
(6800, 15511, 56960, 26972),
(6483, 14680, 39674, 26972),
(716, 1701, 8900, 26972),
(715, 1698, 11600, 26972);

DELETE FROM `quest_offer_reward` WHERE `ID` IN (50319 /*50319*/, 49773 /*49773*/);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(50319, 1, 0, 0, 0, 0, 0, 0, 0, 'So many tauren! I think I''ve seen more tauren since I got here than in my entire life in Highmountain.\n\nThey all ask to touch my antlers. It''s weird at first, but now I kind of like it.', 26972), -- 50319
(49773, 6, 0, 0, 0, 0, 0, 0, 0, 'Are you the new one? I''m supposed to welcome you. Here, take this letter.\n\n<Blackguard lets out an exasperated sigh.>', 26972); -- 49773


DELETE FROM `quest_poi` WHERE (`QuestID`=28532 AND `BlobIndex`=1 AND `Idx1`=3) OR (`QuestID`=28532 AND `BlobIndex`=0 AND `Idx1`=2) OR (`QuestID`=28532 AND `BlobIndex`=1 AND `Idx1`=1) OR (`QuestID`=28532 AND `BlobIndex`=0 AND `Idx1`=0) OR (`QuestID`=50319 AND `BlobIndex`=0 AND `Idx1`=2) OR (`QuestID`=50319 AND `BlobIndex`=0 AND `Idx1`=1) OR (`QuestID`=50319 AND `BlobIndex`=0 AND `Idx1`=0) OR (`QuestID`=49773 AND `BlobIndex`=0 AND `Idx1`=1) OR (`QuestID`=49773 AND `BlobIndex`=0 AND `Idx1`=0);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `WoDUnk1`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES
(28532, 1, 3, 32, 0, 0, 1, 321, 0, 0, 0, 0, 0, 0, 0, 26972), -- 28532
(28532, 0, 2, 32, 0, 0, 1, 321, 0, 0, 0, 0, 0, 0, 0, 26972), -- 28532
(28532, 1, 1, -1, 0, 0, 1, 81, 0, 0, 1, 0, 0, 0, 0, 26972), -- 28532
(28532, 0, 0, -1, 0, 0, 1, 43, 0, 0, 3, 0, 0, 0, 0, 26972), -- 28532
(50319, 0, 2, 32, 0, 0, 1, 321, 0, 0, 0, 0, 0, 1457285, 0, 26972), -- 50319
(50319, 0, 1, 0, 312180, 62888, 1, 321, 0, 0, 2, 0, 0, 0, 0, 26972), -- 50319
(50319, 0, 0, -1, 0, 0, 1, 321, 0, 0, 0, 0, 0, 1428897, 0, 26972), -- 50319
(49773, 0, 1, 32, 0, 0, 1220, 1024, 6, 0, 2, 0, 0, 0, 0, 26972), -- 49773
(49773, 0, 0, -1, 0, 0, 1, 321, 0, 0, 0, 0, 0, 1457285, 0, 26972); -- 49773

DELETE FROM `gossip_menu` WHERE (`MenuId`=22182 AND `TextId`=33984) OR (`MenuId`=19341 AND `TextId`=28496) OR (`MenuId`=19434 AND `TextId`=28684) OR (`MenuId`=19340 AND `TextId`=28494) OR (`MenuId`=10350 AND `TextId`=16706) OR (`MenuId`=83 AND `TextId`=580);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES
(22182, 33984), -- 133407
(19341, 28496), -- 103733
(19434, 28684), -- 103485
(19340, 28494), -- 103485
(10350, 16706), -- 99903
(83, 580); -- 6491

DELETE FROM `gossip_menu_option` WHERE (`MenuId`=19434 AND `OptionIndex`=0) OR (`MenuId`=19340 AND `OptionIndex`=1) OR (`MenuId`=10350 AND `OptionIndex`=1) OR (`MenuId`=10350 AND `OptionIndex`=0) OR (`MenuId`=83 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`) VALUES
(19434, 0, 0, 'I see.', 0),
(19340, 1, 0, 'Do you live here in Thunder Totem, Lessah?', 0),
(10350, 1, 1, 'Let me browse your goods.', 0),
(10350, 0, 3, 'Train me.', 0),
(83, 0, 4, 'Return me to life.', 0);

DELETE FROM `gossip_menu_option_action` WHERE (`MenuId`=19340 AND `OptionIndex`=1) OR (`MenuId`=19434 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(19340, 1, 19434, 0),
(19434, 0, 19340, 0);

DELETE FROM `quest_poi_points` WHERE (`QuestID`=28532 AND `Idx1`=3 AND `Idx2`=0) OR (`QuestID`=28532 AND `Idx1`=2 AND `Idx2`=0) OR (`QuestID`=28532 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=28532 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=50319 AND `Idx1`=2 AND `Idx2`=0) OR (`QuestID`=50319 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=50319 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=49773 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=49773 AND `Idx1`=0 AND `Idx2`=0);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(28532, 3, 0, 1914, -4662, 26972), -- 28532
(28532, 2, 0, 1601, -4370, 26972), -- 28532
(28532, 1, 0, 2145, -1176, 26972), -- 28532
(28532, 0, 0, 4337, -1458, 26972), -- 28532
(50319, 2, 0, 1564, -4192, 26972), -- 50319
(50319, 1, 0, 1596, -4372, 26972), -- 50319
(50319, 0, 0, 1601, -4372, 26972), -- 50319
(49773, 1, 0, 4082, 4385, 26972), -- 49773
(49773, 0, 0, 1564, -4192, 26972); -- 49773


DELETE FROM `quest_details` WHERE `ID` IN (28532 /*28532*/, 50319 /*50319*/, 49773 /*49773*/);
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`) VALUES
(28532, 1, 1, 1, 0, 0, 0, 0, 0, 26972), -- 28532
(50319, 1, 15, 25, 0, 0, 3000, 6000, 0, 26972), -- 50319
(49773, 1, 1, 0, 0, 0, 0, 0, 0, 26972); -- 49773

DELETE FROM spell_target_position WHERE ID IN (259122);
INSERT INTO spell_target_position (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `VerifiedBuild`)VALUES
(259122, 0, 1220, 4079.05, 4392.38, 670.625, 26972); -- Portal to ThunderTotem

DELETE FROM `npc_text` WHERE `ID` IN (33984 /*33984*/, 28684 /*28684*/, 28494 /*28494*/, 28496 /*28496*/, 16706 /*16706*/, 580 /*580*/);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(33984, 1, 1, 1, 1, 1, 0, 0, 0, 147209, 147208, 147207, 147206, 147205, 0, 0, 0, 26972), -- 33984
(28684, 1, 0, 0, 0, 0, 0, 0, 0, 107616, 0, 0, 0, 0, 0, 0, 0, 26972), -- 28684
(28494, 1, 0, 0, 0, 0, 0, 0, 0, 106302, 0, 0, 0, 0, 0, 0, 0, 26972), -- 28494
(28496, 1, 0, 0, 0, 0, 0, 0, 0, 106313, 0, 0, 0, 0, 0, 0, 0, 26972), -- 28496
(16706, 1, 0, 0, 0, 0, 0, 0, 0, 45121, 0, 0, 0, 0, 0, 0, 0, 26972), -- 16706
(580, 100, 0, 0, 0, 0, 0, 0, 0, 2545, 0, 0, 0, 0, 0, 0, 0, 26972); -- 580

DELETE FROM `gameobject_questitem` WHERE (`GameObjectEntry`=203977 AND `Idx`=0) OR (`GameObjectEntry`=203969 AND `Idx`=0) OR (`GameObjectEntry`=203979 AND `Idx`=0);
INSERT INTO `gameobject_questitem` (`GameObjectEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES
(203977, 0, 57877, 26972), -- 203977
(203969, 0, 57766, 26972), -- 203969
(203979, 0, 57878, 26972); -- 203979

DELETE FROM `quest_objectives` WHERE `ID` IN (312180 /*312180*/, 259624 /*259624*/, 267187 /*267187*/, 267186 /*267186*/, 264756 /*264756*/, 265539 /*265539*/, 254390 /*254390*/, 254389 /*254389*/, 266900 /*266900*/, 266110 /*266110*/, 253201 /*253201*/, 253200 /*253200*/, 253199 /*253199*/, 265482 /*265482*/, 269049 /*269049*/, 289536 /*289536*/, 289535 /*289535*/, 289167 /*289167*/);
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(312180, 50319, 14, 0, 1, 62888, 1, 0, 0, 0, 'Warchief''s Command Board found', 26972), -- 312180
(259624, 8468, 1, 0, 0, 21781, 1, 0, 1, 0, '', 26972), -- 259624
(267187, 24974, 0, 1, 1, 38887, 1, 0, 0, 0, 'Vile Fin returned', 26972), -- 267187
(267186, 24974, 0, 0, 0, 38923, 1, 0, 0, 0, 'Vile Fin captured', 26972), -- 267186
(264756, 14438, 0, 0, 0, 42354, 15, 0, 0, 0, 'Palemane Gnolls', 26972), -- 264756
(265539, 25170, 1, 0, 0, 4888, 5, 0, 1, 0, '', 26972), -- 265539
(254390, 871, 0, 1, 1, 3265, 3, 0, 0, 0, '', 26972), -- 254390
(254389, 871, 0, 0, 0, 3267, 8, 0, 0, 0, '', 26972), -- 254389
(266900, 14129, 0, 0, 0, 35111, 1, 0, 0, 0, 'Runaway Shredder Captured', 26972), -- 266900
(266110, 26965, 0, 0, 0, 44629, 1, 0, 0, 0, 'Stand by for Warchief Garrosh Hellscream''s arrival', 26972), -- 266110
(253201, 28096, 0, 2, 2, 47442, 1, 0, 0, 0, 'Third Quest Dispensed', 26972), -- 253201
(253200, 28096, 0, 1, 1, 47443, 1, 0, 0, 0, 'Second Quest Dispensed', 26972), -- 253200
(253199, 28096, 0, 0, 0, 47444, 1, 0, 0, 0, 'First Quest Dispensed', 26972), -- 253199
(265482, 25236, 0, 0, 0, 39464, 8, 0, 0, 0, 'Drowned Thunder Lizard removed', 26972), -- 265482
(269049, 31813, 11, 0, 0, 66135, 1, 1, 0, 0, 'Defeat Dagra the Fierce', 26972), -- 269049
(289536, 46736, 4, 0, -1, 1342, 100, 0, 0, 0, '', 26972), -- 289536
(289535, 46735, 4, 0, -1, 1342, 100, 0, 0, 0, '', 26972), -- 289535
(289167, 46277, 4, 0, -1, 1342, 100, 0, 0, 0, '', 26972); -- 289167


SET @PHASE_169  = 172329;
SET @PHASE_170  = 59073;
SET @PHASE_171  = 59074;
SET @PHASE_172  = 59087;
SET @PHASE_173  = 54341;
SET @PHASE_175  = 57569;
SET @PHASE_176  = 74789;
SET @PHASE_177  = 74092;
SET @PHASE_179  = 67789;
SET @PHASE_180  = 68480;
SET @PHASE_181  = 68481;
SET @PHASE_182  = 68482;
SET @PHASE_183  = 68483;
SET @PHASE_184  = 69077;
SET @PHASE_185  = 69078;
SET @PHASE_186  = 69484;
SET @PHASE_187  = 69485;
SET @PHASE_188  = 69486;
SET @PHASE_189  = 70695;

SET @OGUID=20000050;
SET @CGUID=1100002;
UPDATE gameobject SET PhaseId = 175 WHERE guid = @OGUID+48;
UPDATE creature SET PhaseId = 175 WHERE guid = @CGUID+188;

 DELETE FROM spell_area WHERE (spell = @PHASE_175 AND racemask = 134217728) OR (spell = @PHASE_169 AND racemask = 134217728);
INSERT INTO spell_area (`spell`, `area`, `teamid`, `racemask`, `flags`) VALUES 
(@PHASE_175, 5332, 1, 134217728, 3),
(@PHASE_169, 5332, 1, 134217728, 3);
