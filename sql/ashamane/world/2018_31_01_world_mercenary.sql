UPDATE `creature_template` SET `npcflag` = 1, `gossip_menu_id` = 18860, `AIName` = 'SmartAI' WHERE entry IN (98219, 114665);
UPDATE `creature_template` SET `npcflag` = 1, `gossip_menu_id` = 18861, `AIName` = 'SmartAI' WHERE entry IN (98148, 114663);

DELETE FROM `creature` WHERE `guid` = 210219205;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(210219205,114663,1502,0,0,1,0,0,0,-1,0,0,-821.423,4408.65,716.385,2.93193,300,0,0,10751229,0,0,0,0,0,0,0,'',0);

DELETE FROM `npc_text` WHERE `ID` IN (27613, 27614);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES
(27613, 1, 1),
(27614, 1, 1);

DELETE FROM `gossip_menu` WHERE `MenuId` IN (18860, 18861);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
(18860, 27613, 27481),
(18861, 27614, 0); 

DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (18860, 18861) AND `OptionIndex`=0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES
(18860, 0, 0, 'I will fight alongside the Alliance in battlegrounds, for now.', 100693, 1, 1, 27481),
(18861, 0, 0, 'I will fight alongside the Horde in battlegrounds, for now.', 99976, 1, 1, 0);

DELETE FROM `smart_scripts` WHERE source_type = 0 AND entryorguid IN (98148, 98219, 114663, 114665);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(98148,  0, 0, 0, 62, 0, 100, 0, 18861, 0, 0, 0, 85, 193472, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(98148,  0, 1, 0, 62, 0, 100, 0, 18861, 0, 0, 0, 72, 0,      0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),

(98219,  0, 0, 0, 62, 0, 100, 0, 18860, 0, 0, 0, 85, 193475, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(98219,  0, 1, 0, 62, 0, 100, 0, 18860, 0, 0, 0, 72, 0,      0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),

(114663, 0, 0, 0, 62, 0, 100, 0, 18861, 0, 0, 0, 85, 193472, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(114663, 0, 1, 0, 62, 0, 100, 0, 18861, 0, 0, 0, 72, 0,      0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),

(114665, 0, 0, 0, 62, 0, 100, 0, 18860, 0, 0, 0, 85, 193475, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(114665, 0, 1, 0, 62, 0, 100, 0, 18860, 0, 0, 0, 72, 0,      0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');
