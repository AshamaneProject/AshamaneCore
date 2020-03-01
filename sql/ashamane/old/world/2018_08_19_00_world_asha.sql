DELETE FROM `creature` WHERE `guid`IN(262011, 261751, 262050); -- Remove extra spawns

DELETE FROM `creature_text` WHERE `CreatureID`=23616 AND `GroupID`=2;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(23616, 2, 0, '%s thanks you with a special dance.', 16, 0, 100, 0, 0, 0, 22070, 0, 'kyle EMOTE_DANCE');

UPDATE `creature_text` SET `Emote`=393, `Sound`=9036 WHERE `CreatureID`=23616 AND `GroupID`=0;
UPDATE `creature_text` SET `Emote`=35 WHERE `CreatureID`=23616 AND `GroupID`=1;

UPDATE `creature_template` SET `ScriptName`='npc_kyle_the_frenzied' WHERE `entry`=23616;

-- Pathing for Kyle the Frenzied Entry: 23616
SET @NPC := 261968;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2403.841,`position_y`=-448.0304,`position_z`=-9.07738 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2403.841,-448.0304,-9.07738,0,0,1,0,100,0),
(@PATH,2,-2386.752,-460.5137,-5.585166,0,0,1,0,100,0),
(@PATH,3,-2378.522,-467.4002,-5.314487,0,0,1,0,100,0),
(@PATH,4,-2361.616,-480.1408,-7.147027,0,0,1,0,100,0),
(@PATH,5,-2335.434,-490.0974,-8.591851,0,0,1,0,100,0),
(@PATH,6,-2308.815,-489.1855,-7.871078,0,0,1,0,100,0),
(@PATH,7,-2284.448,-485.8981,-7.973901,0,0,1,0,100,0),
(@PATH,8,-2259.05,-467.9584,-7.562227,0,0,1,0,100,0),
(@PATH,9,-2252.942,-440.6061,-9.29988,0,0,1,0,100,0),
(@PATH,10,-2258.004,-413.379,-9.299898,0,0,1,0,100,0),
(@PATH,11,-2257.311,-373.5098,-9.299898,0,0,1,0,100,0),
(@PATH,12,-2269.452,-369.2065,-9.299926,0,0,1,0,100,0),
(@PATH,13,-2283.273,-369.1807,-9.299926,0,0,1,0,100,0),
(@PATH,14,-2297.094,-369.1549,-9.299926,0,0,1,0,100,0),
(@PATH,15,-2311.132,-354.5954,-9.299926,0,0,1,0,100,0),
(@PATH,16,-2324.304,-357.0777,-8.924926,0,0,1,0,100,0),
(@PATH,17,-2334.885,-373.0743,-8.285136,0,0,1,0,100,0),
(@PATH,18,-2343.165,-384.8119,-7.866435,0,0,1,0,100,0),
(@PATH,19,-2347.638,-403.0411,-8.874202,0,0,1,0,100,0),
(@PATH,20,-2363.861,-418.0233,-9.446223,0,0,1,0,100,0),
(@PATH,21,-2379.811,-429.8705,-9.042975,0,0,1,0,100,0),
(@PATH,22,-2390.516,-437.4482,-8.217002,0,0,1,0,100,0),
(@PATH,23,-2409.169,-438.2284,-5.693007,0,0,1,0,100,0),
(@PATH,24,-2434.516,-444.885,-5.347585,0,0,1,0,100,0),
(@PATH,25,-2455.628,-459.0667,-7.100514,0,0,1,0,100,0),
(@PATH,26,-2435.336,-472.0183,-9.638076,0,0,1,0,100,0),
(@PATH,27,-2418.281,-460.9282,-9.181045,0,0,1,0,100,0);
