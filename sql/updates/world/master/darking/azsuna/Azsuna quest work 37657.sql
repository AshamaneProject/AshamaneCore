DELETE FROM `quest_objectives` WHERE `ID`=277332;
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES (277332, 37657, 0, 1, 1, 89287, 1, 1, 0, 0, 'Deal with Queen Kraklaa', 25996);
DELETE FROM `creature` WHERE `guid`=20506395;

Eye See You
UPDATE `creature_template` SET  `AIName`="SmartAI" WHERE `entry`= 107242;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=107242 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(107242, 0, 0, 0, 10, 0, 100, 512, 1, 10, 2000, 2000, '', 33, 107242, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "");

UPDATE `creature_template` SET  `AIName`="SmartAI" WHERE `entry`= 107243;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=107243 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(107243, 0, 0, 0, 10, 0, 100, 512, 1, 10, 2000, 2000, '', 33, 107243, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "");

UPDATE `creature_template` SET  `AIName`="SmartAI" WHERE `entry`= 107241;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=107241 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(107241, 0, 0, 0, 10, 0, 100, 512, 1, 10, 2000, 2000, '', 33, 107241, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "");