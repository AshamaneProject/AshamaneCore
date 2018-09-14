-- By LkArthas (RenegadosWow)

-- Quest 29109 Morshan Caravan Pick-Up
DELETE FROM gossip_menu_option WHERE MenuId=12744;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionText`, `OptionType`, `OptionNpcFlag`) VALUES ('12744', 'Im ready. Lets go', '1', '1');

-- Rocco Whipshank SAI
SET @ENTRY := 52220;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,52445,0,0,0,0,0,7,0,0,0,0,0,0,0,"Rocco Whipshank - On Gossip Hello - Quest Credit ''"),
(@ENTRY,0,1,0,62,0,100,0,12744,0,0,0,33,52303,0,0,0,0,0,7,0,0,0,0,0,0,0,"Rocco Whipshank - On Gossip Option 0 Selected - Quest Credit ''"),
(@ENTRY,0,2,0,62,0,100,0,12744,0,0,0,62,1,0,0,0,0,0,7,0,0,0,293.9,-2528.92,91.75,4.5378,"Rocco Whipshank - On Gossip Option 0 Selected - Teleport");

-- Quest 29111 Morshan Caravan Delivery
DELETE FROM gossip_menu_option WHERE MenuId=12754;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionText`, `OptionType`, `OptionNpcFlag`) VALUES ('12754', 'Im ready to ride', '1', '1');

-- Nagala Whipshank SAI
SET @ENTRY := 52207;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,52505,0,0,0,0,0,7,0,0,0,0,0,0,0,"Nagala Whipshank - On Gossip Hello - Quest Credit ''"),
(@ENTRY,0,1,0,62,0,100,0,12754,0,0,0,33,52326,0,0,0,0,0,7,0,0,0,0,0,0,0,"Nagala Whipshank - On Gossip Option 0 Selected - Quest Credit ''"),
(@ENTRY,0,2,0,62,0,100,0,12754,0,0,0,62,1,0,0,0,0,0,7,0,0,0,1230.64,-2257.82,92.36,5.3298,"Nagala Whipshank - On Gossip Option 0 Selected - Teleport");

-- Quest Crisis at Splintertree 13653
-- Gorka SAI
SET @ENTRY := 33421;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10342,0,0,0,12,33507,5,60000,0,0,0,1,0,0,0,0,0,0,0,"Gorka - On Gossip Option 0 Selected - Summon Creature 'Gorka'"),
(@ENTRY,0,1,0,62,0,100,0,10342,0,0,0,33,33507,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gorka - On Gossip Option 0 Selected - Quest Credit ''"),
(@ENTRY,0,2,0,62,0,100,0,10342,0,0,0,62,1,0,0,0,0,0,7,0,0,0,1230.64,-2257.82,92.36,5.3298,"Gorka - On Gossip Option 0 Selected - Teleport");

-- non blizzlike fix of Quest A Growing Problem (13988)
-- Jerrik Highmountain SAI
SET @ENTRY := 34626;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,34631,0,0,0,0,0,7,0,0,0,0,0,0,0,"");

-- fix of Quest Drag out of Them (13961)
UPDATE `quest_objectives` SET `ID`='264309', `QuestID`='13961', `Type`='0', `Order`='1', `StorageIndex`='1', `ObjectID`='34503', `Amount`='0', `Flags`='0', `Flags2`='0', `ProgressBarWeight`='0', `Description`='', `VerifiedBuild`='25996' WHERE (`ID`='264309');

-- Togrik SAI
SET @ENTRY := 34513;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,34503,0,0,0,0,0,7,0,0,0,0,0,0,0,"Togrik - On Gossip Hello - Quest Credit ");

-- fix of Quest By hook or by Crook (13963)
-- Captured Razormane SAI
SET @ENTRY := 34523;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10521,0,0,0,33,34529,0,0,0,0,0,7,0,0,0,0,0,0,0,"Npc - Event - Action (phase) (dungeon difficulty)");

UPDATE `creature_template` SET `ScriptName`='' WHERE (`entry`='34523');

-- fix quest 14068 Twapptor Twappin 
-- Kala'ma SAI
SET @ENTRY := 34828;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,14068,0,0,0,56,46851,5,0,0,0,0,7,0,0,0,0,0,0,0,"Kala'ma - On Quest '' Taken - Add Item '' 5 Times");

-- Fix The Stolen Silver (14067) 
DELETE FROM creature_loot_template WHERE Item=5061;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('3256', '5061', '0', '40', '0', '1', '0', '1', '1', NULL);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('3255', '5061', '0', '40', '0', '1', '0', '1', '1', NULL);


-- Quest 29112 Demon Seed
-- Balgor Whipshank SAI
SET @ENTRY := 52309;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,29112,0,0,0,56,68837,1,0,0,0,0,7,0,0,0,0,0,0,0,"Balgor Whipshank - On Quest '' Taken - Add Item '' 1 Time");

DELETE FROM creature_loot_template WHERE Item=68837;
INSERT INTO creature_loot_template (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('3380', '68837', '0', '60', '0', '1', '0', '1', '1', NULL);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES ('3379', '68837', '0', '60', '0', '1', '0', '1', '1', NULL);

