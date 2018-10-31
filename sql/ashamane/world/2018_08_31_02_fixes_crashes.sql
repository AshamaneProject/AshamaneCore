-- Table `creature` has creature (GUID: 280000079) has unsupported difficulty 1 for map (Id: 1669).
UPDATE `creature` SET `spawnDifficulties`=0 WHERE `map`=1669;

-- Table `creature` has creature (GUID: 10678768) that is not spawned in any difficulty, skipped.
UPDATE `creature` SET `spawnDifficulties`='14,15,16,17' WHERE `guid`=10678768;

-- Table `creature` has creature (GUID: 10954585) has unsupported difficulty 0,1,2 for map (Id: 671).
UPDATE `creature` SET `spawnDifficulties`='3,4,5,6' WHERE `guid`=10954585;

-- Table `gameobject` has gameobject (GUID: 17583) has unsupported difficulty 2 for map (Id: 43).
-- Table `gameobject` has gameobject (GUID: 17501) has unsupported difficulty 2 for map (Id: 48).
UPDATE `gameobject` SET `spawnDifficulties`=1 WHERE `map` IN (43, 48);

-- Table `gameobject` has gameobject (GUID: 17122) has unsupported difficulty 6 for map (Id: 36).
UPDATE `gameobject` SET `spawnDifficulties`='1,2' WHERE `map`=36;

-- SmartAIMgr::LoadSmartAIFromDB: Creature entry (315) is not using SmartAI, skipped loading.
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=315;
