-- By LkArthas (RenegadosWow)

-- Our Tribe Imprisoned Quest Fix
SET @CAPTURED_BRAVE :=38345;
SET @GO_QUILBOAR_CAGE :=202112;

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@GO_QUILBOAR_CAGE;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (@CAPTURED_BRAVE);

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@CAPTURED_BRAVE;
UPDATE `creature_template_addon` SET `bytes1`=8 WHERE `entry`=@CAPTURED_BRAVE;

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@GO_QUILBOAR_CAGE) AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTURED_BRAVE) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTURED_BRAVE*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@GO_QUILBOAR_CAGE, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @CAPTURED_BRAVE, 5, 0, 0, 0, 0, 0, ''),
(@CAPTURED_BRAVE, 0, 0, 0, 38, 0, 100, 1, 1, 1, 0, 0, 80, @CAPTURED_BRAVE*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Brave - On Data Set 1 1 - Run Script'),
(@CAPTURED_BRAVE, 0, 1, 2, 34, 0, 100, 1, 8, 1, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Brave - On Movement Inform - Despawn 1sec'),
(@CAPTURED_BRAVE, 0, 2, 0, 61, 0, 100, 1, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Brave - On Linked - Set Active Off'),
(@CAPTURED_BRAVE*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Run'),
(@CAPTURED_BRAVE*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Field Bytes 8 (Kneel State)'),
(@CAPTURED_BRAVE*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Random Text 0'),
(@CAPTURED_BRAVE*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Active On'),
(@CAPTURED_BRAVE*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3033.70, -752.16, 52.25, 0, 'Script - Move to Position');

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (@CAPTURED_BRAVE);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(@CAPTURED_BRAVE, 0, 1, 'Thank the Earth Mother!', 12, 0, 100, 5, 10, 0, 38278, 'Captured Brave'),
(@CAPTURED_BRAVE, 0, 2, 'I can move again!', 12, 0, 100, 5, 10, 0, 38279, 'Captured Brave'),
(@CAPTURED_BRAVE, 0, 3, 'The quilboar will pay!', 12, 0, 100, 15, 10, 0, 38280, 'Captured Brave');

-- Feed of Evil ReWork
SET @FIRSTFOOD := 36727;
SET @SECONDFOOD := 37155;
SET @THIRDFOOD := 37156;
SET @BATTLEBOAR := 36696;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (@FIRSTFOOD,@SECONDFOOD,@THIRDFOOD);
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (@FIRSTFOOD,@SECONDFOOD,@THIRDFOOD,@BATTLEBOAR);

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `sourceEntry` IN (@BATTLEBOAR);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, @BATTLEBOAR, 0, 0, 29, 1, @FIRSTFOOD, 8, 0, 0, 0, 0, '', 'Script only Runs if Near Food'),
(22, 1, @BATTLEBOAR, 0, 0, 1, 1, 42345, 0, 0, 1, 0, 0, '', 'Script only Runs if Has Not Auras'),
(22, 1, @BATTLEBOAR, 0, 1, 29, 1, @SECONDFOOD, 8, 0, 0, 0, 0, '', 'Script only Runs if Near Food'),
(22, 1, @BATTLEBOAR, 0, 1, 1, 1, 42345, 0, 0, 1, 0, 0, '', 'Script only Runs if Has Not Auras'),
(22, 1, @BATTLEBOAR, 0, 2, 29, 1, @THIRDFOOD, 8, 0, 0, 0, 0, '', 'Script only Runs if Near Food'),
(22, 1, @BATTLEBOAR, 0, 2, 1, 1, 42345, 0, 0, 1, 0, 0, '', 'Script only Runs if Has Not Auras'),
(22, 2, @BATTLEBOAR, 0, 0, 36, 1, 0, 0, 0, 0, 0, 0, '', 'Script only runs if Boar is Alive');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13) AND `sourceEntry` IN (69228);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 7, 69228, 0, 0, 31, 0, 3, @FIRSTFOOD, 0, 0, 0, 0, '', 'Spell Targets only Food Dummy'),
(13, 7, 69228, 0, 1, 31, 0, 3, @SECONDFOOD, 0, 0, 0, 0, '', 'Spell Targets only Food Dummy'),
(13, 7, 69228, 0, 2, 31, 0, 3, @THIRDFOOD, 0, 0, 0, 0, '', 'Spell Targets only Food Dummy');

-- Script
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@FIRSTFOOD,@SECONDFOOD,@THIRDFOOD,@BATTLEBOAR)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@FIRSTFOOD*100,@BATTLEBOAR*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@FIRSTFOOD, 0, 0, 1, 8, 0, 100, 0, 69228, 0, 0, 0, 33, @FIRSTFOOD, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'First Trough - On Spellhit \'Throw Torch\' - Quest Credit \'Feed of Evil\''),
(@FIRSTFOOD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @FIRSTFOOD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'First Trough - Linked with Previous - Run Script'),
(@FIRSTFOOD, 0, 2, 0, 60, 0, 100, 0, 2500, 4500, 8000, 8500, 45, 3, 3, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'First Trough - On Update - Set Data 1 2 To Nearby Battleboars'),
(@SECONDFOOD, 0, 0, 1, 8, 0, 100, 0, 69228, 0, 0, 0, 33, @SECONDFOOD, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Second Trough - On Spellhit \'Throw Torch\' - Quest Credit \'Feed of Evil\''),
(@SECONDFOOD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @FIRSTFOOD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Second Trough - Linked with Previous - Run Script'),
(@SECONDFOOD, 0, 2, 0, 60, 0, 100, 0, 2500, 4500, 8000, 8500, 45, 3, 3, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Second Trough - On Update - Set Data 1 2 To Nearby Battleboars'),
(@THIRDFOOD, 0, 0, 1, 8, 0, 100, 0, 69228, 0, 0, 0, 33, @THIRDFOOD, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Third Trough - On Spellhit \'Throw Torch\' - Quest Credit \'Feed of Evil\''),
(@THIRDFOOD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @FIRSTFOOD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Third Trough - Linked with Previous - Run Script'),
(@THIRDFOOD, 0, 2, 0, 60, 0, 100, 0, 2500, 4500, 8000, 8500, 45, 3, 3, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Third Trough - On Update - Set Data 1 2 To Nearby Battleboars'),
(@FIRSTFOOD*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Script - Store Target'),
(@FIRSTFOOD*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 42345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Add Aura \'Cosmetic - Flame Patch\''),
(@FIRSTFOOD*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Script - Set Data 1 1 to Battleboars at 6yrds'),
(@FIRSTFOOD*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Script - Send Stored Target 1 to Battleboars at 6yrds'),
(@FIRSTFOOD*100, 9, 4, 0, 0, 0, 100, 0, 35000, 35000, 0, 0, 28, 42345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Aura \'Cosmetic - Flame Patch\''),
(@BATTLEBOAR, 0, 0, 0, 1, 0, 100, 0, 3000, 5000, 3000, 4500, 5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - On OOC 3-5 secs - play Eat emote'),
(@BATTLEBOAR, 0, 1, 2, 38, 0, 100, 0, 3, 3, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - On Data Set - Set Orientation to Food Dummy'),
(@BATTLEBOAR, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - Linked with Previous - Follow Food Dummy'),
(@BATTLEBOAR, 0, 3, 0, 0, 0, 100, 0, 0, 0, 20000, 20000, 11, 3385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - In Combat - Cast \'Boar Charge\''),
(@BATTLEBOAR, 0, 4, 0, 38, 0, 100, 1, 1, 1, 0, 0, 80, @BATTLEBOAR*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - On Data Set 1 1 - Run Script'),
(@BATTLEBOAR*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 42345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Add Aura Flame Patch'),
(@BATTLEBOAR*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Run'),
(@BATTLEBOAR*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Random Move'),
(@BATTLEBOAR*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 33554434, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Add Unitflags (Not Attackable, Not Selectable)'),
(@BATTLEBOAR*100, 9, 4, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Kill Self'),
(@BATTLEBOAR*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @BATTLEBOAR, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Script - Quest Credit \'The Battleboars\' To Stored Target'),
(@BATTLEBOAR*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Despawn');

-- Remove Random Movement to Thornguard
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=43599;

-- Improve Chief Squealer Thornmantle SAI
SET @CHIEF_THORNMANTLE := 36712;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_THORNMANTLE);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CHIEF_THORNMANTLE, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - Say Text on Aggro'),
(@CHIEF_THORNMANTLE, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 81691, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - In Combat - Cast \'Quillhorn\''),
(@CHIEF_THORNMANTLE, 0, 2, 0, 0, 0, 100, 0, 4000, 4000, 15000, 15000, 11, 81695, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - In Combat - Cast \'Torch Toss\''),
(@CHIEF_THORNMANTLE, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 69316, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - On Just Died - Cast \'Immolation\'');

-- Last Rites First Rites Quest Rework
SET @CHIEF_HAWKWIND := 2981;
SET @HARUUT := 3059;
SET @HELAKU := 37737;
SET @RAVENFEATHER := 37724;
SET @GART := 3060;
SET @LANKA := 3061;
SET @MEELA := 3062;
SET @OFFERING_BUNNY := 38438;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@OFFERING_BUNNY;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@CHIEF_HAWKWIND,@OFFERING_BUNNY);

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (@CHIEF_HAWKWIND);
INSERT INTO `creature_text` (`CreatureID`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(@CHIEF_HAWKWIND, 0, 0, 'Earth Mother, into your arms we give one of our own. She is Unaya Hawkwind, my mother, and Greatmother to us all; the wisest of our tribe.', 12, 0, 100, 1, 0, 0, 0, ''),
(@CHIEF_HAWKWIND, 1, 0, 'May her spirit fly to you swiftly; may the winds carry her gently, and the grass whisper her name.', 12, 0, 100, 1, 0, 0, 0, ''),
(@CHIEF_HAWKWIND, 2, 0, 'Watch over her as she has watched over us; let her look down on us with joy, through the eternal gaze of An\'she and Mu\'sha, until we too join her in death.', 12, 0, 100, 1, 0, 0, 0, ''),
(@CHIEF_HAWKWIND, 3, 0, 'For we are all born of you, and shall all return to you.', 12, 0, 100, 1, 0, 0, 0, '');

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_HAWKWIND,@OFFERING_BUNNY)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_HAWKWIND*100,@CHIEF_HAWKWIND*100+1,@CHIEF_HAWKWIND*100+2,@CHIEF_HAWKWIND*100+3,@CHIEF_HAWKWIND*100+4,@CHIEF_HAWKWIND*100+5,@CHIEF_HAWKWIND*100+6) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CHIEF_HAWKWIND, 0, 0, 0, 19, 0, 100, 1, 24861, 0, 0, 0, 80, @CHIEF_HAWKWIND*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Hawkwind - On Quest Accept - Run Script'),
(@OFFERING_BUNNY, 0, 1, 0, 60, 0, 100, 0, 5000, 6000, 16000, 19000, 87, @CHIEF_HAWKWIND*100+1, @CHIEF_HAWKWIND*100+2, @CHIEF_HAWKWIND*100+3, @CHIEF_HAWKWIND*100+4, @CHIEF_HAWKWIND*100+5, @CHIEF_HAWKWIND*100+6, 1, 0, 0, 0, 0, 0, 0, 0, 'Mulgore Offering Credit Bunny - On Update - Run Random Script'),
(@CHIEF_HAWKWIND*100, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 4, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 5, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 6, 0, 0, 0, 100, 1, 1500, 1500, 1500, 1500, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 0'),
(@CHIEF_HAWKWIND*100, 9, 7, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 1'),
(@CHIEF_HAWKWIND*100, 9, 8, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 2'),
(@CHIEF_HAWKWIND*100, 9, 9, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 3'),
(@CHIEF_HAWKWIND*100, 9, 10, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 11, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 12, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 13, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 14, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 15, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 16, 0, 0, 0, 100, 1, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Reset Script'),
(@CHIEF_HAWKWIND*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+3, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+4, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+5, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+6, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry');

-- Remove Deprecated Quests on Starting Zones
DELETE FROM `disables` WHERE `sourceType` IN (1) AND `entry` IN (14011,25143,26969,27027,24527,24760);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(1, 14011, 0, '', '', 'Deprecated quest: Primal Strike'),
(1, 25143, 0, '', '', 'Deprecated quest: Primal Strike'),
(1, 26969, 0, '', '', 'Deprecated quest: Primal Strike'),
(1, 27027, 0, '', '', 'Deprecated quest: Primal Strike'),
(1, 24760, 0, '', '', 'Deprecated quest: Primal Strike'),
(1, 24527, 0, '', '', 'Deprecated quest: Primal Strike');

-- Rite of Winds Quest Fix (Was drooping Players at the Mid Air)
SET @EAGLE_SPIRIT := 36790;

UPDATE `creature_template` SET `speed_run`=1.54286, `AIName`='SmartAI', `InhabitType`=4, `flags_extra`=536870912 WHERE `entry` IN (@EAGLE_SPIRIT);

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@EAGLE_SPIRIT) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@EAGLE_SPIRIT, 0, 0, 0, 54, 0, 100, 512, 0, 0, 0, 0, 69, 1, 0, 1, 0, 0, 0, 8, 0, 0, 0, -2339.72, -392.371, -7.63593, 0, 'Eagle Spirit - On Just Summoned - Start WP'),
(@EAGLE_SPIRIT, 0, 1, 0, 34, 0, 100, 512, 8, 1, 0, 0, 11, 68576, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eagle Spirit - On WP Reached - Cast Eject'),
(@EAGLE_SPIRIT, 0, 2, 0, 28, 0, 100, 512, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eagle Spirit - On Passenger Removed - Despawn');

-- Sniffed WPs
DELETE FROM `waypoints` WHERE `entry` IN (@EAGLE_SPIRIT);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@EAGLE_SPIRIT, 1, -2896.99, -69.4555, 220.748, 'Eagle Spirit WP 1'),
(@EAGLE_SPIRIT, 2, -2780.07, -99.4885, 194.584, 'Eagle Spirit WP 2'),
(@EAGLE_SPIRIT, 3, -2677.34, -127.748, 171.943, 'Eagle Spirit WP 3'),
(@EAGLE_SPIRIT, 4, -2648.53, -201.255, 152.172, 'Eagle Spirit WP 4'),
(@EAGLE_SPIRIT, 5, -2647.07, -287.295, 133.98, 'Eagle Spirit WP 5'),
(@EAGLE_SPIRIT, 6, -2601.28, -380.433, 111.562, 'Eagle Spirit WP 6'),
(@EAGLE_SPIRIT, 7, -2521.47, -423.088, 88.2252, 'Eagle Spirit WP 7'),
(@EAGLE_SPIRIT, 8, -2474.46, -424.12, 52.5356, 'Eagle Spirit WP 8'),
(@EAGLE_SPIRIT, 9, -2430.98, -425.075, 26.3883, 'Eagle Spirit WP 9'),
(@EAGLE_SPIRIT, 10, -2392.82, -423.415, 15.9748, 'Eagle Spirit WP 10'),
(@EAGLE_SPIRIT, 11, -2366.33, -418.975, 5.84979, 'Eagle Spirit WP 11'),
(@EAGLE_SPIRIT, 12, -2356.31, -415.553, 3.60444, 'Eagle Spirit WP 12'),
(@EAGLE_SPIRIT, 13, -2347.76, -408.92, -4.61385, 'Eagle Spirit WP 13'),
(@EAGLE_SPIRIT, 14, -2343.36, -401.535, -6.42369, 'Eagle Spirit WP 14');