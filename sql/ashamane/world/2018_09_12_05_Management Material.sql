-- Management Material Quest Fix
SET @DEMORALIZED_PEON := 33440;
SET @LUMBER_BUNNY := 33446;
SET @LUMBER_BUNNY_GUID := 220241;

UPDATE `creature_template` SET `gossip_menu_id`=10338, `unit_flags2`=2048, `AIName`='SmartAI', `HealthModifier`=0.2 WHERE `entry`=@DEMORALIZED_PEON;
UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`=128 WHERE `entry`=@LUMBER_BUNNY;

DELETE FROM `gameobject` WHERE `id`=194349;

DELETE FROM `gossip_menu` WHERE `MenuId`=10338 AND `TextId`=14346;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES 
(10338, 14346);

DELETE FROM `creature` WHERE `id`=@LUMBER_BUNNY;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneID`, `areaID`, `spawnMask`, `PhaseID`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`) VALUES 
(@LUMBER_BUNNY_GUID, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1506.03, -2364.38, 100.198, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+1, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1531.28, -2297.66, 93.3395, 0.0684896, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+2, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1531.72, -2446.33, 106.879, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+3, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1553.85, -2569.51, 119.824, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+4, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1522.18, -2418.08, 102.375, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+5, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1615.29, -2413.29, 105.761, 2.26223, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+6, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1491.39, -2426.09, 106.155, 3.52008, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+7, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1596.3, -2545.22, 101.884, 1.92257, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+8, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1639.38, -2505.22, 99.5731, 3.36476, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+9, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1458.06, -2353.08, 93.6563, 1.5081, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+10, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1500.11, -2331.52, 92.803, 5.51833, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+11, @LUMBER_BUNNY, 1, 331, 3177, 1, 169, 0, 0, 1647.46, -2451.19, 105.511, 0.334694, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+12, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1527.38, -2326.34, 96.7904, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+13, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1431.32, -2330.15, 97.5667, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+14, @LUMBER_BUNNY, 1, 331, 2457, 1, 169, 0, 0, 1403.19, -2400.49, 117.056, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+15, @LUMBER_BUNNY, 1, 331, 432, 169, 1, 0, 0, 1678.64, -2477.87, 99.955, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+16, @LUMBER_BUNNY, 1, 331, 3177, 169, 1, 0, 0, 1494.93, -2452.63, 112.25, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+17, @LUMBER_BUNNY, 1, 331, 3177, 169, 1, 0, 0, 1591.47, -2405.19, 105.35, 5.91731, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+18, @LUMBER_BUNNY, 1, 331, 3177, 169, 1, 0, 0, 1536.81, -2381.21, 100.524, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+19, @LUMBER_BUNNY, 1, 331, 2457, 169, 1, 0, 0, 1458.95, -2402.65, 107.11, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@LUMBER_BUNNY_GUID+20, @LUMBER_BUNNY, 1, 331, 2457, 169, 1, 0, 0, 1459.11, -2402.06, 105.274, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0);

-- Texts --
DELETE FROM `creature_text` WHERE `CreatureID` IN (@DEMORALIZED_PEON);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@DEMORALIZED_PEON, 0, 1, 'You stay close, $c. And don\'t let elfs near me!', 12, 0, 0, 0, 0, 0, 'Demoralized Peon 1'),
(@DEMORALIZED_PEON, 0, 2, 'You keep a lookout, $c! The elfs are everywhere!', 12, 0, 0, 0, 0, 0, 'Demoralized Peon 2'),
(@DEMORALIZED_PEON, 0, 3, 'Hmm. You don\'t look very tough... but okay.', 12, 0, 0, 0, 0, 0, 'Demoralized Peon 3'),
(@DEMORALIZED_PEON, 1, 4, 'I have bad feeling about this....', 12, 0, 0, 0, 0, 0, 'Demoralized Peon 4'),
(@DEMORALIZED_PEON, 1, 5, 'I\'m trusting you... Don\'t let me die!', 12, 0, 0, 0, 0, 0, 'Demoralized Peon 5'),
(@DEMORALIZED_PEON, 2, 6, 'There you go, $c.', 12, 0, 0, 0, 0, 0, 'Demoralized Peon 6');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `SourceGroup` IN (1) AND `SourceEntry` IN (@LUMBER_BUNNY);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, @LUMBER_BUNNY, 0, 0, 29, 1, @DEMORALIZED_PEON, 5, 0, 0, 0, 0, '', 'Script Run When Near Demoralized Peon');

-- Script --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@DEMORALIZED_PEON,@LUMBER_BUNNY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@DEMORALIZED_PEON*100,@LUMBER_BUNNY*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@DEMORALIZED_PEON, 0, 0, 1, 62, 0, 100, 0, 10338, 0, 0, 0, 1, 0, 3000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - On Gossip Option Selected - Say Line 0'),
(@DEMORALIZED_PEON, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Set Emote State 0'),
(@DEMORALIZED_PEON, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Close Gossip'),
(@DEMORALIZED_PEON, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Remove Npc Flag Gossip'),
(@DEMORALIZED_PEON, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 19, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Remove Immunity Flag'),
(@DEMORALIZED_PEON, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Set Orientation to Invoker'),
(@DEMORALIZED_PEON, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Store Target Invoker'),
(@DEMORALIZED_PEON, 0, 7, 8, 52, 0, 100, 0, 0, @DEMORALIZED_PEON, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - On Text Over - Set Walk'),
(@DEMORALIZED_PEON, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 19, @LUMBER_BUNNY, 30, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Follow Closest \'Peon Lumber Bunny\''),
(@DEMORALIZED_PEON, 0, 9, 10, 34, 0, 100, 1, 14, 0, 0, 0, 1, 1, 0, 4000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - On Movement Inform - Say Line 1'),
(@DEMORALIZED_PEON, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 17, 234, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Set Emote State 234'),
(@DEMORALIZED_PEON, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @DEMORALIZED_PEON*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Link - Start Script\''),
(@DEMORALIZED_PEON, 0, 13, 0, 6, 0, 100, 0, 0, 0, 0, 0, 41, 2500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - On Death - Despawn Self'),
(@LUMBER_BUNNY, 0, 0, 0, 60, 0, 40, 1, 1, 2, 0, 0, 80, @LUMBER_BUNNY*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lumber Bunny - On Near Peon - Run Script'),
(@LUMBER_BUNNY, 0, 1, 0, 38, 0, 100, 0, 1, 1, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lumber Bunny - On Data Set 1 1 - Reset'),
(@LUMBER_BUNNY*100, 9, 2, 0, 0, 0, 100, 0, 2000, 2500, 0, 0, 11, 63052, 0, 0, 0, 0, 0, 19, @DEMORALIZED_PEON, 5, 0, 0, 0, 0, 0, 'Lumber Bunny - On Text Over - Cast Summon Ashenvale Stalker'),
(@DEMORALIZED_PEON*100, 9, 0, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Update - Set Emote State 0'),
(@DEMORALIZED_PEON*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 63043, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Update - Summon Gameobject \'Freshly Cut Wood\''),
(@DEMORALIZED_PEON*100, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Update - Say Line 2'),
(@DEMORALIZED_PEON*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Update - Set Orientation to Invoker'),
(@DEMORALIZED_PEON*100, 9, 4, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @LUMBER_BUNNY, 30, 0, 0, 0, 0, 0, 'Demoralized Peon - Update - Despawn Self'),
(@DEMORALIZED_PEON*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Demoralized Peon - Update - Despawn Self');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (10338);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 10338, 0, 0, 0, 9, 0, 13640, 0, 0, 0, 0, 0, '', 'Gossip Only Shows if Quest Taken');