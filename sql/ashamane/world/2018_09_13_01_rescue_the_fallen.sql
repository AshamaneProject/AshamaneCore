-- By LkArthas (RenegadosWow)

-- Rescue the Fallen improve quest
SET @WOUNDED_MORSHAN_DEFENDER := 33266;
SET @DINAH_GUID := (SELECT `guid` FROM `creature` WHERE `id`=33263);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WOUNDED_MORSHAN_DEFENDER;

DELETE FROM `creature_text` WHERE `CreatureID` IN (@WOUNDED_MORSHAN_DEFENDER);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@WOUNDED_MORSHAN_DEFENDER, 0, 0, 'Death to the Alliance', 12, 0, 100, 25, 0, 0, 'Wounded Mor\'shan Defender Says'),
(@WOUNDED_MORSHAN_DEFENDER, 0, 1, 'Many thanks $C', 12, 0, 100, 3, 0, 0, 'Wounded Mor\'shan Defender Says'),
(@WOUNDED_MORSHAN_DEFENDER, 0, 2, 'For the Horde!', 12, 0, 100, 15, 0, 0, 'Wounded Mor\'shan Defender Says');

DELETE FROM `creature_addon` WHERE `guid`=@DINAH_GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(@DINAH_GUID, 0, 0, 8, 0, 0, 0, 0, 0, '');

-- Waypoints --
DELETE FROM `waypoints` WHERE `entry` IN (@WOUNDED_MORSHAN_DEFENDER*10);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@WOUNDED_MORSHAN_DEFENDER*10, 0, 1314.44, -2231.27, 91.8572, 'Wounded WP'),
(@WOUNDED_MORSHAN_DEFENDER*10, 1, 1302.78, -2222.36, 91.681, 'Wounded WP 1'),
(@WOUNDED_MORSHAN_DEFENDER*10, 2, 1255.75, -2224.22, 92.3249, 'Wounded WP 2'),
(@WOUNDED_MORSHAN_DEFENDER*10, 3, 1219.97, -2245, 92.0576, 'Wounded WP 3');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `SourceGroup` IN (1) AND `SourceEntry` IN (@WOUNDED_MORSHAN_DEFENDER);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, @WOUNDED_MORSHAN_DEFENDER, 0, 0, 29, 1, 33263, 10, 0, 1, 0, 0, '', 'Script Not Run When Near Dinah');

-- Script --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@WOUNDED_MORSHAN_DEFENDER) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@WOUNDED_MORSHAN_DEFENDER*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@WOUNDED_MORSHAN_DEFENDER, 0, 0, 0, 8, 0, 100, 0, 62644, 0, 0, 0, 80, @WOUNDED_MORSHAN_DEFENDER*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wounded Mor\'shan Defender on SpellHit - Run Script'),
(@WOUNDED_MORSHAN_DEFENDER, 0, 1, 0, 40, 0, 100, 0, 3, @WOUNDED_MORSHAN_DEFENDER*10, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wounded Mor\'shan Defender on Wp Reached - Despawn'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Unit Field Bytes 8'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Set Field Bytes 3'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Set Field Bytes 7'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 3, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Orientation to Player'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script  - Say'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 5, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 33, @WOUNDED_MORSHAN_DEFENDER, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Script - Give Credit'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 6, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 1, @WOUNDED_MORSHAN_DEFENDER*10, 0, 0, 21000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script -  Wounded Mor\'shan Defender - Start WP');