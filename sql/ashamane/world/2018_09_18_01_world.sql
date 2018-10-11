Delete from `creature_template_scaling` where `entry` = "14603";
INSERT INTO `creature_template_scaling` (`Entry`, `LevelScalingMin`, `LevelScalingMax`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `VerifiedBuild`) VALUES (14603, 35, 60, 0, 2, 26124);


DELETE FROM `spell_script_names` WHERE `spell_id`=74409;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74409, 'spell_seal_dream');

-- Shore Strider SAI
SET @ENTRY := 5359;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,12000,14000,11,79810,0,0,0,0,0,2,0,0,0,0,0,0,0,"Shore Strider - In Combat - Cast '<Spell not found!>'"),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,18000,23000,11,10987,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shore Strider - In Combat - Cast 'Geyser'"),
(@ENTRY,0,2,0,8,0,100,0,23359,0,0,0,36,14603,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shore Strider - On Spellhit 'Transmogrify!' - Update Template To 'Zapped Shore Strider'");

update `creature_template` set `KillCredit2` = "0" where `entry` = 11443;

-- Gordok Ogre-Mage SAI
SET @ENTRY := 11443;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3000,4500,11,34447,64,0,0,0,0,2,0,0,0,0,0,0,0,"Gordok Ogre-Mage - In Combat - Cast 'Arcane Missiles'"),
(@ENTRY,0,1,0,0,0,100,0,6000,9000,17000,20000,11,79868,1,0,0,0,0,2,0,0,0,0,0,0,0,"Gordok Ogre-Mage - In Combat - Cast 'Arcane Blast'"),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,34844,1,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Ogre-Mage - Between 0-30% Health - Cast 'Blink' (No Repeat)"),
(@ENTRY,0,3,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Ogre-Mage - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,4,0,8,0,100,0,74415,0,0,0,80,@ENTRY*100+00,1,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Ogre-Mage - On Spellhit 'Capture Gordok Soul' - Run Script");

-- Actionlist SAI
SET @ENTRY := 1144300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Ogre-Mage - On Script - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Ogre-Mage - On Script - Say Line 3"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,33,39845,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Ogre-Mage - On Script - Quest Credit ''"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Ogre-Mage - On Script - Despawn Instant");

-- Taerar SAI
SET @ENTRY := 39853;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,7,4,0,100,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,"Taerar - On Aggro - Say Line 2"),
(@ENTRY,0,1,0,0,0,100,0,6000,9000,17000,22000,11,74575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Taerar - In Combat - Cast 'Noxious Breath'"),
(@ENTRY,0,2,0,11,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Taerar - On Respawn - Run Script"),
(@ENTRY,0,3,4,2,0,100,1,0,80,0,0,15,25379,0,0,0,0,0,16,0,0,0,0,0,0,0,"Taerar - Between 0-80% Health - Quest Credit '' (No Repeat)"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,"Taerar - Between 0-0% Health - Say Line 3 (No Repeat)"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,308984,39407,0,0,0,0,0,"Taerar - Between 0-0% Health - Set Data 0 1 (No Repeat)"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Taerar - Between 0-0% Health - Despawn Instant (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 3985300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Taerar - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-4325,-259.69,140.51,1.79,"Taerar - On Script - Move To Position"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Taerar - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Taerar - On Script - Remove Flags Immune To Players & Immune To NPC's");

-- Ysondre SAI
SET @ENTRY := 39407;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,19,0,100,0,25379,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Ysondre - On Quest '' Taken - Run Script"),
(@ENTRY,0,1,0,0,0,100,0,0,0,2000,2000,11,43619,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ysondre - In Combat - Cast 'Wrath'"),
(@ENTRY,0,2,0,61,0,100,0,25379,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ysondre - On Quest '' Taken - Remove Npc Flags Gossip & Questgiver"),
(@ENTRY,0,3,0,38,0,100,0,0,1,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ysondre - On Data Set 0 1 - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,4,2,20,0,100,0,25379,0,0,0,75,74572,0,0,0,0,0,7,0,0,0,0,0,0,0,"Ysondre - On Quest '' Finished - Add Aura 'Ysondre's Blessing'");

-- Actionlist SAI
SET @ENTRY := 3940700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,500,500,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.72,"Ysondre - On Script - Set Orientation 1,72"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ysondre - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,12,39853,8,0,0,0,0,8,0,0,0,-4325.04,-259.693,140.515,1.79769,"Ysondre - On Script - Summon Creature 'Taerar'"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ysondre - On Script - Say Line 1");

update `quest_template_addon` set `SpecialFlags` = "2" where `id` = "25379";

DELETE FROM `creature_text` WHERE `CreatureID`=39853 AND `GroupID`=3 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (39853, 3, 0, 'My essence...will...persist...', 14, 0, 100, 0, 0, 0, 0, 0, 'Taerar');
DELETE FROM `creature_text` WHERE `CreatureID`=39853 AND `GroupID`=2 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (39853, 2, 0, 'Peace is but a fleeting dream! Let the NIGHTMARE reign!', 14, 0, 100, 0, 0, 0, 0, 0, 'Taerar');
DELETE FROM `creature_text` WHERE `CreatureID`=39853 AND `GroupID`=1 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (39853, 1, 0, 'Peace? PEACE?', 12, 0, 100, 0, 0, 0, 0, 0, 'Taerar');
DELETE FROM `creature_text` WHERE `CreatureID`=39853 AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (39853, 0, 0, 'I knew you\'d return, Ysondre...It was only a matter of time...', 14, 0, 100, 0, 0, 0, 0, 0, 'Taerar');
DELETE FROM `creature_text` WHERE `CreatureID`=39407 AND `GroupID`=1 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (39407, 1, 0, 'I\'ve returned only to end this, Taerar. This land will finally have peace.', 12, 0, 100, 0, 0, 0, 0, 0, 'Ysondre');
DELETE FROM `creature_text` WHERE `CreatureID`=39407 AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (39407, 0, 0, 'Come forth, Taerar! I stand before you!', 14, 0, 100, 0, 0, 0, 0, 0, 'Ysondre');

-- Shyn SAI
SET @ENTRY := 39898;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,11304,1,0,0,52,414,0,0,0,0,0,7,0,0,0,0,0,0,0,"Shyn - On Gossip Option 1 Selected - Activate Taxi Path 414"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,33,39897,0,0,0,0,0,7,0,0,0,0,0,0,0,"Shyn - On Gossip Option 0 Selected - Quest Credit ''");

DELETE FROM `gossip_menu_option` WHERE `MenuId`=11304 AND `OptionIndex`=0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES (11304, 0, 2, 'Show me where I can fly.', 12271, 4, 8192, 0);
DELETE FROM `gossip_menu_option` WHERE `MenuId`=11304 AND `OptionIndex`=1;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES (11304, 1, 0, 'Shym, I need to get to Westreach Summit', 0, 1, 1, 0);
