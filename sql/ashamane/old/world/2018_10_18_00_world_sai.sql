update `creature_template` set `scriptname` ="npc_multi_bot" where entry =42598;
-- Captured Demolitionist SAI
SET @ENTRY := 42645;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,1,0,1,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Data Set 0 1 - Run Script (No Repeat)"),
(@ENTRY,0,1,0,38,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Data Set 0 0 - Set Data 0 0");

-- Actionlist SAI
SET @ENTRY := 4264500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,85,79606,2,18,35,0,0,7,0,0,0,0,0,0,0,"Captured Demolitionist - On Script - Invoker Cast '<Spell not found!>'"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,114,10,0,0,0,0,0,1,0,0,0,0,5,0,0,"Captured Demolitionist - On Script"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Script - Despawn Instant");

INSERT IGNORE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (42491, 0, 0, 'It\'s been hard for our scouts to get information on what Crushcog is planning.', 12, 0, 100, 1, 0, 0, 43105, 0, 'Hinkles Fastblast to Captain Tread Sparknozzle');

-- Makeshift Cage SAI
SET @ENTRY := 204019;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,70,0,100,0,2,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Store Targetlist"),
(@ENTRY,1,1,2,61,0,100,0,2,0,0,0,100,1,0,0,0,0,0,19,42645,5,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Send Target 1"),
(@ENTRY,1,2,0,61,0,100,0,2,0,0,0,45,0,1,0,0,0,0,19,42645,5,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Set Data 0 1"),
(@ENTRY,1,3,1,70,0,100,0,2,0,0,0,33,42645,0,0,0,0,0,7,0,0,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Quest Credit ''");

-- Crushcog Sentry-Bot SAI
SET @ENTRY := 42291;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,84152,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - Within 0-8 Range - Cast '<Spell not found!>'"),
(@ENTRY,0,1,2,8,0,100,0,79781,0,0,0,33,42796,0,0,0,0,0,7,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - On Spellhit '<Spell not found!>' - Quest Credit ''"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - On Spellhit - Say Line 0"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - On Spellhit - Despawn Instant");
