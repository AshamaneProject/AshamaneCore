-- HORDE

-- echange npc début 2ieme quête
DELETE FROM `creature_queststarter` WHERE ( quest = 42987 );
INSERT INTO `creature_queststarter` (id, quest) VALUES ('10181', '42987');

-- echange npc fin 1ere quête
DELETE FROM `creature_questender` WHERE ( quest = 42985 );
INSERT INTO `creature_questender` (id, quest) VALUES ('10181', '42985');

-- Echange npc fin 2ieme quête
DELETE FROM `creature_questender` WHERE ( quest = 42987 );
INSERT INTO `creature_questender` (id, quest) VALUES ('10181', '42987');

-- suite de quête
UPDATE `quest_template_addon` SET PrevQuestID = '42985' WHERE ID = '42987';

-- fix auto_complete vers complete
UPDATE `quest_template` SET `QuestType` = '2' WHERE `ID` = '42987';

-- spawn Mob invisible
DELETE FROM `creature` WHERE ( guid = 280000009 AND id = 109518 );
insert into `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
(280000009,109518,0,0,0,1,0,0,0,-1,0,0,1290.89,319.171,-57.3211,1.28455,300,0,0,87,0,0,0,33554432,0,0,0,'',0);

-- smart_script
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 10181;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 10181);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(10181, 0, 0, 0, 19, 0, 100, 0, 42987, 0, 0, 0, 85, 218029, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Sylvanas Windrunner - On Quest Accepted - Invoker Cast \'218029\''),
(10181, 0, 1, 0, 19, 0, 100, 0, 42987, 0, 0, 0, 85, 218023, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Sylvanas Windrunner - On Quest Accepted - Invoker Cast \'218023\'');

-- lance le saut
DELETE FROM `conditions` WHERE ( `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 218036 );
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES ('13','2','218036','0','0','31','0','3','109518','0','0','0','0','',NULL);

-- lance la scene
DELETE FROM `scene_template` WHERE ( `SceneId` = 1343 AND `ScriptPackageID` = 1669 );
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`, `ScriptName`) VALUES ('1343', '16', '1669', 'SmartScene');

-- cast le spell 218086
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 1343 AND `action_param1` = 218086);
INSERT INTO `smart_scripts` (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(1343, 10, 0, 0, 81, 0, 100, 0, 0, 0, 0, 0, 85, 218086, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- Alliance

-- echange npc début 2ieme quête
DELETE FROM `creature_queststarter` WHERE ( quest = 42982 );
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES ('107574', '42982');

-- echange npc fin 1ere quête
DELETE FROM `creature_questender` WHERE ( quest = 42978 );
INSERT INTO `creature_questender` (`id`, `quest`) VALUES ('107574', '42978');

-- echange npc fin 2ieme quête
DELETE FROM `creature_questender` WHERE ( quest = 42982 );
INSERT INTO `creature_questender` (`id`, `quest`) VALUES ('107574', '42982');

-- fix auto_complete vers complete
UPDATE `quest_template` SET `QuestType` = '2' WHERE `ID` = '42982';

-- suite de quête
UPDATE `quest_template_addon` SET `PrevQuestID` = '42978' WHERE `ID` = '42982';

-- spawn Mob invisible
DELETE FROM `creature` WHERE ( guid = 280000012 AND id = 109518 );
insert into `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
(280000012,109518,0,0,0,1,0,0,0,-1,0,0,-8368.903320, 239.550934, 155.707855, 2.280104,300,0,0,87,0,0,0,33554432,0,0,0,'',0);

-- smart_script
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 107574;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 107574);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(107574, 0, 0, 0, 19, 0, 100, 0, 42982, 0, 0, 0, 85, 218029, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Anduin Wrynn - On Quest Accepted - Invoker Cast \'218029\''),
(107574, 0, 1, 0, 19, 0, 100, 0, 42982, 0, 0, 0, 85, 218023, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Anduin Wrynn - On Quest Accepted - Invoker Cast \'218023\'');
