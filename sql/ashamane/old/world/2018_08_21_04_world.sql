DELETE FROM `creature` WHERE id = 107544;
DELETE FROM pool_creature WHERE guid IN (SELECT guid FROM creature WHERE id = 107544);
UPDATE `creature_template` SET `InhabitType` = 1 WHERE (entry = 107544);
UPDATE `creature_template_addon` SET `bytes1` = 0, auras = '' WHERE (entry = 107544);
UPDATE `creature_addon` SET `bytes1` = 0, auras = '' WHERE (guid = 20533575);

insert into `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) values
('20533575','107544','1220','0','0','1','0','0','0','-1','0','0','4011.561523','2342.605713','359.910645','2.204376','7200','0','0','391199584','1','0','0','0','0','0','0','','22810');
