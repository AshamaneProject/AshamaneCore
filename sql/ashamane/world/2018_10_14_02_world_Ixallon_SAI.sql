SET @ENTRY := 118930;
SET @ENTRYSCRIPT := 11893000;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRYSCRIPT AND `source_type`=9;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,0,0,100,0,10000,10000,12000,14000,80,@ENTRYSCRIPT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Ixallon the Soulbreaker - In Combat - Run Script."),
(@ENTRYSCRIPT,9,0,0,0,0,100,0,0,0,0,0,11,239635,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ixallon the Soulbreaker - On Script - Cast Felblast."),
(@ENTRYSCRIPT,9,1,0,0,0,100,0,1500,1500,0,0,215,239636,1,0,0,0,0,1,0,0,0,0,5,0,0,"Ixallon the Soulbreaker - On Script - Cast Offset Triggered Felblast on Forward Enemy.");
