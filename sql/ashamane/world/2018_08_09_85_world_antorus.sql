UPDATE `creature_template` SET `rank`='3',`RangeAttackTime`='2000',`unit_class`='2',`unit_flags`='32832',`unit_flags2`='2048',`AIName`='SmartAI',`HoverHeight`='1.5' WHERE `entry`='125429';

DELETE FROM `smart_scripts` WHERE `entryorguid` = 125429 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) values
(125429,0,0,0,25,0,100,0,0,0,0,0,,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Paraxis Inquisitor - On Reset - Stop Moving'),
(125429,0,1,0,0,0,100,0,3000,3000,14000,14000,,11,249196,0,0,0,0,0,2,0,0,0,0,0,0,0,'Paraxis Inquisitor - In Combat - Cast Mind Blast on Victim'),
(125429,0,2,0,0,0,100,0,7000,7000,23500,25000,,11,249194,0,0,0,0,0,5,0,0,0,0,0,0,0,'Paraxis Inquisitor - In Combat - Cast Mind Blast on Random Hostile Target'),
(125429,0,3,0,0,0,100,0,11000,11000,32000,32000,,11,249126,0,0,0,0,0,5,0,0,0,0,0,0,0,'Paraxis Inquisitor - In Combat - Cast Mind Blast on Random Hostile Target'),
(125429,0,4,0,9,0,100,0,5,30,5000,5000,,11,249155,0,0,0,0,0,5,0,0,0,0,0,0,0,'Paraxis Inquisitor - At Range 30 Yards - Cast Torment');

DELETE FROM `gameobject_template` WHERE `entry` = 500000;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `RequiredLevel`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
('500000','43','29031','Paraxxius','Paraxxius','','0','10','-1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','SmartAI','','0');

DELETE FROM `creature` WHERE `guid` = 510119019 AND `id` = 125429;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
('510119019','125429','1712','8638','8681','245760','0','0','0','-1','0','0','-4157.04','-10680.5','776.316','5.41123','604800','0','0','11122130','500000','0','0','0','0','0','0','','0');

DELETE FROM `gameobject` WHERE `guid` = 510120089 AND `id` = 500000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`) values
('510120089','500000','1712','8638','8681','245760','0','0','0','-1','-4157.07','-10680.6','710.18','5.45129','-0','-0','-0.404056','0.914734','604800','0','1','1','','0');
