UPDATE `creature_template` SET `flags_extra` = 128, `ScriptName` = 'npc_thug' WHERE (entry = 42562);
UPDATE `creature_template` SET `InhabitType` = 4 WHERE (entry = 36505);
DELETE FROM creature WHERE id = 42387;

SET @CGUID := 10678110;

DELETE FROM `creature_template_addon` WHERE `entry` = 42405;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(42405,0,0,65536,1,0,0,0,0,'78284');

DELETE FROM `creature` WHERE guid BETWEEN @CGUID+0 AND @CGUID+5;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(@CGUID+0,'42386','0','40','109','0','169','0','0','0','-9851.22','1273.4','41.1944','2.58309','120','0','0','0','0','0','0','0','0','0','0','','0'),
(@CGUID+1,'42384','0','40','109','0','169','0','0','0','-9859.46','1279.47','41.0974','5.48033','120','0','0','0','0','0','0','0','0','0','0','','0'),
(@CGUID+2,'42384','0','40','109','0','169','0','0','0','-9861.16','1276.56','40.8378','0.122173','120','0','0','0','0','0','0','0','0','0','0','','0'),
(@CGUID+3,'42559','0','40','109','0','169','0','0','0','-9852.6','1274.11','41.0983','5.88176','120','0','0','0','0','0','0','0','0','0','0','','0'),
(@CGUID+4,'42559','0','40','109','0','169','0','0','0','-9859.66','1275.5','40.8624','2.37365','120','0','0','0','0','0','0','0','0','0','0','','0'),
(@CGUID+5,'42558','0','40','109','0','169','0','0','0','-9855.29','1275.56','40.9779','1.41372','120','0','0','0','0','0','0','0','0','0','0','','0');

DELETE FROM `creature_addon` WHERE guid BETWEEN @CGUID+0 AND @CGUID+5;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+0, 0, 0, 65536, 1, 431, 0, 0, 0, 79343),
(@CGUID+1, 0, 0, 65536, 1, 431, 0, 0, 0, 79343),
(@CGUID+2, 0, 0, 65536, 1, 431, 0, 0, 0, 79343),
(@CGUID+3, 0, 0, 65536, 1, 0,   0, 0, 0, 79343),
(@CGUID+4, 0, 0, 65536, 1, 0,   0, 0, 0, 79343),
(@CGUID+5, 0, 0, 65544, 1, 0,   0, 0, 0, 79343);

DELETE FROM `spell_area` WHERE `spell` IN (79229, 79346) AND `area` = 40;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `quest_start_status`, `quest_end_status`) VALUES
(79229, 40, 0,     26232, 0,  66),
(79346, 40, 26232, 0,     66, 0 );
