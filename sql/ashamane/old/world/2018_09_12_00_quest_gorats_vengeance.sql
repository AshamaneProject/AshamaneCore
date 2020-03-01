-- Gorat's Vengeance Quest Fix
SET @GORAT_CORPSE := 33294;
SET @GORAT_SPIRIT := 33304;
SET @CAPTAIN_ELENDILAD := 33302;
SET @GORAT_TARGET_BUNNY := 33336;
SET @GORAT_TARGET_BUNNY_GUID := (SELECT `guid` FROM `creature` WHERE `id`=33336);

UPDATE `gameobject` SET `position_x`=1425.03, `position_y`=-1999.7, `position_z`=96.3145, `orientation`=3.0758 WHERE `id`=301003;
UPDATE `creature` SET `position_x`=1425.03, `position_y`=-1999.7, `position_z`=96.3145, `orientation`=3.0758 WHERE `id`=@GORAT_CORPSE;
DELETE FROM `creature` WHERE `id`=@CAPTAIN_ELENDILAD;

UPDATE `creature_template` SET `gossip_menu_id`=10328 WHERE `entry`=@GORAT_CORPSE;
DELETE FROM `gossip_menu` WHERE `MenuId`=10328 AND `TextId`=14338;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`) VALUES 
(10328, 14338);

DELETE FROM `spell_target_position` WHERE `ID`=62772;
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `VerifiedBuild`) VALUES 
(62772, 0, 1, 1424.95, -1999.65, 96.1, 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@GORAT_TARGET_BUNNY;
UPDATE `creature_template` SET `minlevel`=20, `maxlevel`=20, `speed_walk`=1.2, `faction`=85, `unit_flags`=768, `AIName`='SmartAI', `flags_extra`=66 WHERE `entry`=@GORAT_SPIRIT;
UPDATE `creature_template` SET `faction`=124, `unit_flags`=768, `AIName`='SmartAI' WHERE `entry`=@CAPTAIN_ELENDILAD;

DELETE FROM `creature_template_addon` WHERE `entry`=@GORAT_SPIRIT;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(@GORAT_SPIRIT, 0, 0, 7, 2, 0, 0, 0, 0, '75041');

DELETE FROM `creature_template_addon` WHERE `entry`=@GORAT_CORPSE;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES 
(@GORAT_CORPSE, 0, 0, 7, 257, 65, 0, 0, 0, '36725');

-- Conditions --
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13) AND `SourceGroup` IN (1) AND `SourceEntry` IN (62792);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 62792, 0, 0, 31, 0, 3, @GORAT_TARGET_BUNNY, 0, 0, 0, 0, '', 'Gorat\'s Bowshoot Only Hit\'s Gorat\'s Target Bunny');

-- Texts --
DELETE FROM `creature_text` WHERE `CreatureID` IN (@GORAT_SPIRIT,@CAPTAIN_ELENDILAD);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@GORAT_SPIRIT, 0, 0, 'Thank you, friend. I could not rest knowing that my mission had not been completed.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 1, 0, '...and that my mens\' sacrifice had not been avenged.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 2, 0, 'We must hurry, now. I sense that my time is short.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 3, 0, 'Follow me closely, and prepare for battle!', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 4, 0, 'Captain Elendilad conceals himself on the island ahead, cowardly issuing orders to his underlings.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 5, 0, 'He must fall!', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 6, 0, 'Show yourself, elf-coward! Face your death with honor!', 14, 0, 100, 0, 0, 0, 'Gorat Yells'),
(@CAPTAIN_ELENDILAD, 0, 0, 'How many times must I have you killed, orc?!', 14, 0, 100, 0, 0, 0, 'Captain Elendilad Yells'),
(@CAPTAIN_ELENDILAD, 1, 0, 'Curse you, $N vermin! This forest belongs to the Kaldorei...', 12, 0, 100, 0, 0, 0, 'Captain Elendilad Says on Death');

-- Waypoints --
DELETE FROM `waypoints` WHERE `entry`=@GORAT_SPIRIT*10;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@GORAT_SPIRIT*10, 1, 1432.58, -2016.19, 93.7049, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 2, 1443.27, -2027.89, 93.61, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 3, 1463.54, -2049.56, 93.1884, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 4, 1471.42, -2066.36, 92.7038, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 5, 1487.35, -2082.78, 93.5265, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 6, 1513.84, -2088.52, 91.0716, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 7, 1513.79, -2089.49, 90.6745, 'Spirit of Gorat');

-- Script --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTAIN_ELENDILAD,@GORAT_SPIRIT,@GORAT_TARGET_BUNNY)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTAIN_ELENDILAD*100,@GORAT_SPIRIT*100,@GORAT_SPIRIT*100+1)  AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CAPTAIN_ELENDILAD, 0, 0, 0, 9, 0, 100, 0, 0, 5, 13600, 14500, 11, 78828, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Bladestorm on Close'),
(@CAPTAIN_ELENDILAD, 0, 1, 0, 0, 0, 100, 0, 8000, 9000, 120000, 120000, 11, 78823, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Commanding Shout'),
(@CAPTAIN_ELENDILAD, 0, 2, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @CAPTAIN_ELENDILAD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Elendilad - On Just Summoned - Run Script'),
(@CAPTAIN_ELENDILAD, 0, 3, 4, 6, 0, 100, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Captain Elendilad - On Death - Say'),
(@CAPTAIN_ELENDILAD, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @GORAT_SPIRIT, 50, 0, 0, 0, 0, 0, 'Captain Elendilad - On Death - Set Data 1 1 On Gorat'),
(@CAPTAIN_ELENDILAD, 0, 5, 0, 1, 0, 100, 1, 40000, 50000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Elendilad - On OOC - Remove Flag'),
(@GORAT_SPIRIT, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @GORAT_SPIRIT*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Spirit - On just Summoned - Run Script'),
(@GORAT_SPIRIT, 0, 1, 0, 40, 0, 100, 1, 7, @GORAT_SPIRIT, 0, 0, 80, @GORAT_SPIRIT*100+1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Spirit - On Just Summoned - Run Script'),
(@GORAT_SPIRIT, 0, 2, 0, 38, 0, 100, 0, 1, 1, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Spirit - On Data Set 1 1 - Reset Script'),
(@GORAT_TARGET_BUNNY, 0, 0, 0, 8, 0, 100, 0, 62792, 0, 0, 0, 12, @CAPTAIN_ELENDILAD, 2, 120000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Target Bunny - On Just Summoned - Summon Captain Elendilad'),
(@CAPTAIN_ELENDILAD*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @GORAT_SPIRIT, 70, 0, 0, 0, 0, 0, 'Script - Set Orientation to Gorat'),
(@CAPTAIN_ELENDILAD*100, 9, 1, 0, 0, 0, 100, 0, 100, 100, 100, 100, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 0'),
(@CAPTAIN_ELENDILAD*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 97, 20, 15, 0, 0, 0, 0, 1, 0, 0, 0, 1513.87, -2090.45, 90.242, 0, 'Script - Jump to Position'),
(@CAPTAIN_ELENDILAD*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Flags'),
(@CAPTAIN_ELENDILAD*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Save Position'),
(@CAPTAIN_ELENDILAD*100, 9, 5, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Script - Attack Nearby Player'),
(@GORAT_SPIRIT*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Sleep State'),
(@GORAT_SPIRIT*100, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Orientation to Player'),
(@GORAT_SPIRIT*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 0'),
(@GORAT_SPIRIT*100, 9, 3, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 1'),
(@GORAT_SPIRIT*100, 9, 4, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 2'),
(@GORAT_SPIRIT*100, 9, 5, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 53, 0, @GORAT_SPIRIT, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Walk WP'),
(@GORAT_SPIRIT*100, 9, 6, 0, 0, 0, 100, 0, 100, 100, 0, 0, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 3'),
(@GORAT_SPIRIT*100, 9, 7, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 4'),
(@GORAT_SPIRIT*100, 9, 8, 0, 0, 0, 100, 0, 6500, 6500, 0, 0, 1, 5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 5'),
(@GORAT_SPIRIT*100+1, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 6, 1, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Script - Yell 6'),
(@GORAT_SPIRIT*100+1, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 11, 62792, 4, 0, 0, 0, 0, 10, @GORAT_TARGET_BUNNY_GUID, @GORAT_TARGET_BUNNY, 0, 0, 0, 0, 0, 'Script - Cast Bowshoot to Gorat\'s Target Bunny');
