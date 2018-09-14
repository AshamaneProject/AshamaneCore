 -- Creature placement 1
DELETE FROM creature WHERE guid IN (280000088, 21005066, 280000089);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
('280000088','126898','1669','0','0','1','0','0','0','-1','0','0','5592.06','10122.5','-96.3351','3.17937','300','0','0','100099168','0','0','0','0','0','0','0','','0'),
('21005066','126419','1669','8574','9181','1','0','0','0','-1','0','0','1842.66','1134.41','505.273','1.74468','120','0','0','0','0','0','0','0','0','0','0','','25961'),
('280000089','126208','1669','0','0','1','0','0','0','-1','0','0','-2958.29','9066.69','-196.524','0.499031','300','0','0','67844992','0','0','0','0','0','0','0','','0');

-- Oeuf loot template 
DELETE FROM item_loot_template WHERE entry = 153191;
INSERT INTO item_loot_template (Entry, Item, Chance, MinCount, MaxCount) VALUES 
(153191, 44722, 36, 1, 1),
(153191, 153055, 26, 1, 1),
(153191, 153054, 21, 1, 1),
(153191, 152843, 5, 1, 1),
(153191, 152842, 5, 1, 1),
(153191, 152840, 4, 1, 1),
(153191, 152841, 3, 1, 1);
