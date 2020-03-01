update `creature_template` set KillCredit1 = 0 where entry = 1544;
update `creature_template` set KillCredit2 = 0 where entry = 1544;

-- Vile Fin Minor Oracle SAI
SET @ENTRY := 1544;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,2,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Say Line 0 (No Repeat)"),
(@ENTRY,0,3,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Out of Combat - Cast 'Lightning Shield'"),
(@ENTRY,0,4,0,16,0,100,0,12550,1,15000,30000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Friendly Unit Missing Buff 'Lightning Shield' - Cast 'Lightning Shield'"),
(@ENTRY,0,5,6,8,0,100,0,73108,0,0,0,85,73433,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Spellhit 'Murloc Leash' - Invoker Cast 'Summon Captured Vile Fin Minor Oracle'"),
(@ENTRY,0,6,0,61,0,100,0,73108,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Spellhit 'Murloc Leash' - Despawn Instant");


-- Captured Vile Fin Minor Oracle SAI
SET @ENTRY := 39078;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,29,0,0,0,0,0,0,23,5,0,0,0,0,0,0,"Captured Vile Fin Minor Oracle - On Just Summoned - Start Follow Owner Or Summoner"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,33,38923,0,0,0,0,0,23,5,0,0,0,0,0,0,"Captured Vile Fin Minor Oracle - On Just Summoned - Quest Credit ''"),
(@ENTRY,0,3,4,75,0,100,0,0,38925,5,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Vile Fin Minor Oracle - On Distance To Creature - Despawn Instant"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,33,38887,0,0,0,0,0,23,0,0,0,0,0,0,0,"Captured Vile Fin Minor Oracle - On Distance To Creature - Quest Credit ''");

-- Vile Fin Puddlejumper SAI
SET @ENTRY := 1543;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - Between 0-15% Health - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - On Aggro - Cast 'Leaping Rush' (No Repeat)"),
(@ENTRY,0,3,4,8,0,100,0,73108,0,0,0,85,73109,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - On Spellhit 'Murloc Leash' - Invoker Cast 'Summon Captured Vile Fin Puddlejumper'"),
(@ENTRY,0,4,0,61,0,100,0,73108,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - On Spellhit 'Murloc Leash' - Despawn Instant");

-- Captured Vile Fin Puddlejumper SAI
SET @ENTRY := 38923;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,29,0,0,0,0,0,0,23,5,0,0,0,0,0,0,"Captured Vile Fin Puddlejumper - On Just Summoned - Start Follow Owner Or Summoner"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,33,38923,0,0,0,0,0,23,5,0,0,0,0,0,0,"Captured Vile Fin Puddlejumper - On Just Summoned - Quest Credit ''"),
(@ENTRY,0,3,4,75,0,100,0,0,38925,5,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Vile Fin Puddlejumper - On Distance To Creature - Despawn Instant"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,33,38887,0,0,0,0,0,23,0,0,0,0,0,0,0,"Captured Vile Fin Puddlejumper - On Distance To Creature - Quest Credit ''");

-- Captured Scarlet Zealot SAI
SET @ENTRY := 1931;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,512,24977,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Quest '' Finished - Run Script"),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Respawn - Set Run Off");

-- Actionlist SAI
SET @ENTRY := 193100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,11,3287,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Cast 'Ghoul Form'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2249.06,1016.78,36.5258,2.31,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2248.63,1020.92,36.45,1.44,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,2251.73,1017.29,36.46,5,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,6,0,0,0,100,0,6000,6000,0,0,11,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Cast 'Suicide'");

-- Captured Mountaineer SAI
SET @ENTRY := 2211;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,512,24996,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Mountaineer - On quest reward - Start timed action list");

update `creature_template` set faction = 35 where entry = 38937;
update `creature_template` set faction = 68 where entry = 38999;

update `creature` set spawndist = 0 where guid = 194500;
update `creature` set spawndist = 0 where guid = 194498;
update `creature` set spawndist = 0 where guid = 194499;

-- Actionlist SAI
SET @ENTRY := 6618500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,3071.61,-563.24,126.718,0.647956,"Vengeful Forsaken - On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,0,0,0,0,0,0,19,39097,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,11,73308,2,0,0,0,0,19,1660,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Cast 'Lilian's Shadow Hop'"),
(@ENTRY,9,5,0,0,0,100,0,1000,1000,0,0,11,32711,2,0,0,0,0,19,1660,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Cast 'Shadow Nova'"),
(@ENTRY,9,6,0,0,0,100,0,500,500,0,0,51,0,0,0,0,0,0,19,1660,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Kill Target"),
(@ENTRY,9,7,0,0,0,100,0,2000,2000,0,0,11,73308,2,0,0,0,0,19,1665,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Cast 'Lilian's Shadow Hop'"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,11,32711,2,0,0,0,0,19,1665,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Cast 'Shadow Nova'"),
(@ENTRY,9,9,0,0,0,100,0,500,500,0,0,51,0,0,0,0,0,0,19,1665,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Kill Target"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,3071.61,-563.24,126.718,0.647956,"Vengeful Forsaken - On Script - Move To Position"),
(@ENTRY,9,11,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,3071.61,-563.24,126.718,0.647956,"Vengeful Forsaken - On Script - Set Orientation 0,647956"),
(@ENTRY,9,12,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 2"),
(@ENTRY,9,13,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,39097,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 1"),
(@ENTRY,9,14,0,0,0,100,0,3000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 3"),
(@ENTRY,9,15,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 4"),
(@ENTRY,9,16,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,19,39097,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 2"),
(@ENTRY,9,17,0,0,0,100,0,5000,5000,0,0,11,73308,2,0,0,0,0,19,39097,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Cast 'Lilian's Shadow Hop'"),
(@ENTRY,9,18,0,0,0,100,0,1000,1000,0,0,11,32711,2,0,0,0,0,19,39097,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Cast 'Shadow Nova'"),
(@ENTRY,9,19,0,0,0,100,0,500,500,0,0,51,0,0,0,0,0,0,19,39097,20,0,0,0,0,0,"Vengeful Forsaken - On Script - Kill Target"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,33,39098,0,0,0,0,0,23,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Quest Credit ''"),
(@ENTRY,9,21,0,0,0,100,0,7000,7000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Say Line 5"),
(@ENTRY,9,22,0,0,0,100,0,2000,2000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vengeful Forsaken - On Script - Despawn Instant");
