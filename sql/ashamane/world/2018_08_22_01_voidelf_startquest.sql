-- Alleria Windrunner SAI
SET @ALLERIA_WINRUNNER := 131345;
SET @MAGISTER_UMBRIC := 132382;
SET @QUEST_FOR_THE_ALLIANCE := 49788;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ALLERIA_WINRUNNER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ALLERIA_WINRUNNER AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ALLERIA_WINRUNNER*100+00 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ALLERIA_WINRUNNER,0,0,0,19,0,100,1,@QUEST_FOR_THE_ALLIANCE,0,0,0,80,@ALLERIA_WINRUNNER*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Alleria Windrunner - On Quest 'For the Alliance' Taken - Run Script (No Repeat)"),
(@ALLERIA_WINRUNNER*100+00,9,0,0,0,0,100,1,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alleria Windrunner - On Script - Say Line 0 (No Repeat)"),
(@ALLERIA_WINRUNNER*100+00,9,1,0,0,0,100,1,8000,8000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alleria Windrunner - On Script - Say Line 1 (No Repeat)"),
(@ALLERIA_WINRUNNER*100+00,9,2,0,0,0,100,1,8000,8000,0,0,1,0,0,0,0,0,0,19,@MAGISTER_UMBRIC,30,0,0,0,0,0,"Alleria Windrunner - On Script - Magister Umbric Say Line 0 (No Repeat)"),
(@ALLERIA_WINRUNNER*100+00,9,3,0,0,0,100,1,11000,11000,0,0,1,1,0,0,0,0,0,19,@MAGISTER_UMBRIC,20,0,0,0,0,0,"Alleria Windrunner - On Script - Magister Umbric Say Line 1 (No Repeat)"),
(@ALLERIA_WINRUNNER*100+00,9,4,0,0,0,100,1,8000,8000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alleria Windrunner - On Script - Say Line 2 (No Repeat)"),
(@ALLERIA_WINRUNNER*100+00,9,5,0,0,0,100,1,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alleria Windrunner - On Script - Reset All Scripts (No Repeat)");