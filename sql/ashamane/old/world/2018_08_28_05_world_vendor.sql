DELETE FROM `npc_vendor` WHERE `entry` = 108468;
insert into `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `OverrideGoldCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`) values
('108468','0','136923','0','0','0','10000000000','1',NULL,'0','0','0'),
('108468','0','137570','0','0','0','20000000000','1',NULL,'0','0','0'),
('108468','18','138300','0','0','0','5000000000','1',NULL,'0','0','0'),
('108468','0','140309','0','0','0','2500000000','1',NULL,'0','0','0');

DELETE FROM `creature` WHERE `guid` = 210219136;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
("210219136", "108468", "1220", "0", "0", "1", "0", "0", "0", "-1", "0", "0", "-842.225", "4516.84", "735.267", "0.048563", "300", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "", "0");
