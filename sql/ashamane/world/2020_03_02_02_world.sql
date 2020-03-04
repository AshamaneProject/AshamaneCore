ALTER TABLE `creature` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `creature_equip_template` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `creature_model_info` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `creature_questitem` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `creature_template` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `creature_template_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `gameobject` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `gameobject_questitem` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `gameobject_template` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `gameobject_template_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `gossip_menu` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `gossip_menu_option` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `lfg_dungeon_template` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `npc_text` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `npc_vendor` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `page_text` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `page_text_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice`MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_locale` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_response` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_response_locale` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_response_reward` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_response_reward_currency` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_response_reward_faction` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `playerchoice_response_reward_item` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `points_of_interest` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `points_of_interest_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `quest_details` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_greeting` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_greeting_locale` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_objectives` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_objectives_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `quest_offer_reward` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_offer_reward_locale` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_poi` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `quest_poi_points` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `quest_request_items` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_request_items_locale` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `quest_template` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `quest_template_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `quest_visual_effect` MODIFY `VerifiedBuild` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `scenario_poi` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `scenario_poi_points` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `spell_target_position` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `trainer` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `trainer_locale` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `trainer_spell` MODIFY `VerifiedBuild` INT(11) NOT NULL DEFAULT '0';

SET @ENTRY := 49340;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,49340,0,0,0,33,49340,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orgus - On Gossip - Kill Credit"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"on Gossip- Despawn");

UPDATE `creature_template` SET `gossip_menu_id`='49340' WHERE `entry`='49340';
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 49340;
DELETE FROM `gossip_menu_option` WHERE `MenuId`=49340;
REPLACE INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId` ,`OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES('49340','0','0','Take Body...','0','1','1','33369');

UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` = 192625;


UPDATE `npc_text` SET `BroadcastTextID0`=38980 WHERE `ID`=15486;
DELETE FROM `gossip_menu` WHERE `MenuId`=11133 AND `TextId`=15486;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`)  VALUES (11133,15486,33369);
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 11133;
INSERT INTO `gossip_menu_option` (`MenuId`,`OptionIndex`,`OptionIcon`,`OptionText`,`OptionBroadcastTextId`,`OptionType`,`OptionNpcFlag`,`VerifiedBuild`)  VALUES (11133,0,0,'You''re not hideous, Lilian... you''re one of us.  Here, look in this mirror, see for yourself.',38981,1,1,33369);

-- Lilian Voss SAI
SET @ENTRY := 38910;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,1,100,0,11133,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Gossip Option 0 Selected - Run Script (Phase 1)"),
(@ENTRY,0,1,8,61,1,100,0,11133,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lilian Voss - On Gossip Option 0 Selected - Close Gossip (Phase 1)"),
(@ENTRY,0,2,3,62,2,100,0,11133,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Gossip Option 0 Selected - Run Script (Phase 2)"),
(@ENTRY,0,3,9,61,2,100,0,11133,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lilian Voss - On Gossip Option 0 Selected - Close Gossip (Phase 2)"),
(@ENTRY,0,4,0,25,0,100,0,0,0,0,0,17,431,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Reset - Set Emote State 431"),
(@ENTRY,0,5,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Reset - Set Event Phase 1"),
(@ENTRY,0,6,0,40,0,100,0,11,@ENTRY*100+00,0,0,17,431,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Waypoint 11 Reached - Set Emote State 431"),
(@ENTRY,0,7,0,40,0,100,0,11,@ENTRY*100+01,0,0,17,431,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Waypoint 11 Reached - Set Emote State 431"),
(@ENTRY,0,8,0,61,0,100,0,11133,0,0,0,85,73210,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lilian Voss - On Gossip Option 0 Selected - Invoker Cast 'Show Mirror' (Phase 1)"),
(@ENTRY,0,9,0,61,0,100,0,11133,0,0,0,85,73210,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lilian Voss - On Gossip Option 0 Selected - Invoker Cast 'Show Mirror' (Phase 1)");

-- Actionlist SAI
SET @ENTRY := 3891000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,26,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Set Emote State 26"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,2000,2000,33,38910,0,0,0,0,0,17,0,30,0,0,0,0,0,"Lilian Voss - On Script - Quest Credit 'The Truth of the Grave'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,53,1,3891000,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Start Waypoint"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Set Event Phase 2");

-- Actionlist SAI
SET @ENTRY := 3891001;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,26,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Set Emote State 26"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,2000,2000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,2000,2000,33,38910,0,0,0,0,0,17,0,30,0,0,0,0,0,"Lilian Voss - On Script - Quest Credit 'The Truth of the Grave'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,53,1,3891001,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Start Waypoint"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lilian Voss - On Script - Set Event Phase 1");

DELETE FROM `waypoints` WHERE entry=3891000;
INSERT INTO `waypoints`(entry, pointid, position_x, position_y, position_z) VALUES
(3891000, 1, 1857.42, 1561.47, 99.079),
(3891000, 2, 1864.89, 1574.94, 99.0361),
(3891000, 3, 1868.91, 1575.56, 97.5441),
(3891000, 4, 1875.28, 1574.12, 94.314),
(3891000, 5, 1875.91, 1572.36, 94.314),
(3891000, 6, 1873, 1570.42, 94.314),
(3891000, 7, 1868.25, 1568.28, 94.314),
(3891000, 8, 1864.41, 1567.87, 94.314),
(3891000, 9, 1861.8, 1563.51, 94.3124),
(3891000, 10, 1860.59, 1558.04, 94.782),
(3891000, 11, 1857.21, 1555.61, 94.7926);

DELETE FROM `waypoints` WHERE entry=3891001;
INSERT INTO `waypoints`(entry, pointid, position_x, position_y, position_z) VALUES
(3891001, 11, 1854.83, 1555.63, 99.07),
(3891001, 10, 1857.42, 1561.47, 99.079),
(3891001, 9, 1864.89, 1574.94, 99.0361),
(3891001, 8, 1868.91, 1575.56, 97.5441),
(3891001, 7, 1875.28, 1574.12, 94.314),
(3891001, 6, 1875.91, 1572.36, 94.314),
(3891001, 5, 1873, 1570.42, 94.314),
(3891001, 4, 1868.25, 1568.28, 94.314),
(3891001, 3, 1864.41, 1567.87, 94.314),
(3891001, 2, 1861.8, 1563.51, 94.3124),
(3891001, 1, 1860.59, 1558.04, 94.782);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=11133;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,11133,0,0,9,24961,0,0,0,'','Show gossip if player has Quest: the-truth-of-the-grave');
UPDATE `creature_template` SET `scale` = 3 WHERE `entry` = 1553;
UPDATE `creature_template` SET `scale` = 2.5 WHERE `entry` = 1512;
UPDATE `creature_template` SET `scale` = 2 WHERE `entry` = 1508;

-- Ever So Lonely 24974
-- Vile Fin Puddlejumper
SET @ENTRY := 1543;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Leaping Rush on Aggro'),
(@ENTRY,0,1,2,8,0,100,0,73108,0,5000,5000,33,38887,0,0,0,0,0,7,0,0,0,0,0,0,0,"Quest Kredit Kill Monster on Spell Hit"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,33,38923,0,0,0,0,0,7,0,0,0,0,0,0,0,'Quest Kredit Kill Monster on Spell Hit');

-- Vile Fin Minor Oracle
SET @ENTRY := 1544;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3000,3500,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Spawn'),
(@ENTRY,0,3,0,16,0,100,0,12550,1,15000,30000,11,12550,1,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Repeat'),
(@ENTRY,0,4,5,8,0,100,0,73108,0,5000,5000,33,38887,0,0,0,0,0,7,0,0,0,0,0,0,0,"Quest Kredit Kill Monster on Spell Hit"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,33,38923,0,0,0,0,0,7,0,0,0,0,0,0,0,'Quest Kredit Kill Monster on Spell Hit');
DELETE FROM `gameobject` WHERE `guid` = '103438'; 
DELETE FROM `creature_loot_template` WHERE `Item` = '2875'; 