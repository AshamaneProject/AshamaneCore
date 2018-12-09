DELETE FROM `areatrigger_template` WHERE `Id` IN (17135);
INSERT INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `ScriptName`, `VerifiedBuild`) VALUES
(17135, 4, 4, 2.5, 2.5, 20, 20, 0.3, 0.3, 'at_creeping_rot', 27481);

DELETE FROM `creature_summon_groups` WHERE summonerID = 1841 AND summonerType = 2;
INSERT INTO `creature_summon_groups` VALUES
(1841, 2, 1, 144306, 1024.94, 1050.99, 33.4707, 0.8341,  8, 0),
(1841, 2, 1, 144306, 1025.44, 1066.86, 33.3309, 5.471, 	 8, 0),
(1841, 2, 1, 144306, 1040.15, 1066.87, 33.4068, 3.99352, 8, 0),
(1841, 2, 1, 144306, 1041.1,  1051.63, 33.536,  2.44391, 8, 0);

DELETE FROM creature WHERE id = 144306;
