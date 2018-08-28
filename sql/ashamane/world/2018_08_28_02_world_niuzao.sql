-- deplace mob
UPDATE `creature` SET `position_x` = '2229.096436' ,`position_y` = '4752.382324' ,`position_z` = '147.121063' ,`orientation` = '5.290862' WHERE `guid` = '10552712';

-- ajouter npc 1ere objectif
DELETE FROM `creature` WHERE `guid` = 210219199;
insert into `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
('210219199','63908','870','0','0','1','0','0','0','-1','0','1','2183.6','4688.65','155.052','3.78168','300','0','0','34506','0','0','1','0','0','0','0','','0');

-- ajoute le gossip au npc
UPDATE `creature_template` SET `npcflag` = '1', `gossip_menu_id` = '63908' WHERE `entry` = '63908';

-- ajoute un gossip
DELETE FROM `gossip_menu` WHERE `MenuId` = 63908;
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
('63908', '0', '0');

-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 63908;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) values
('63908','1','0','Bien ! je suis prêt !','0','1','3','0');

-- ajoute un choix gossip
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 63908;
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`, `BoxText`) VALUES ('63908', '1', 'frFR', 'Niuzao... nous devons le sauver !', NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 63908;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(63908, 0, 1, 0, 62, 0, 100, 0, 63908, 1, 0, 0, 85, 125131, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ban Bearheart - On Gossip Option 0 Selected - Invoker Cast \'125131\'');
