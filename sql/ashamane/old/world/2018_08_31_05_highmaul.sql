DELETE FROM `areatrigger_template` WHERE `Id` IN (7113, 6387, 6644, 7939, 7355, 7354, 6750, 6784, 7913, 6987, 6583, 6630, 6957, 7665, 6695, 6734, 6733, 7882, 7881, 7338, 6701, 6867);
INSERT INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `VerifiedBuild`) VALUES
(7113, 0, 0, 4, 4, 0, 0, 0, 0, 27481),
(6387, 0, 0, 4, 4, 0, 0, 0, 0, 27481),
(6644, 0, 0, 2, 2, 0, 0, 0, 0, 27481),
(7939, 0, 4, 25, 25, 0, 0, 0, 0, 27481),
(7355, 4, 4, 22, 22, 100, 100, 50, 50, 27481),
(7354, 4, 4, 22, 22, 100, 100, 50, 50, 27481),
(6750, 4, 0, 10, 10, 10, 10, 0.3, 0.3, 27481),
(6784, 4, 4, 9, 9, 10, 10, 0.3, 0.3, 27481),
(7913, 4, 4, 3, 3, 10, 10, 0.3, 0.3, 27481),
(6987, 4, 2, 2, 2, 6, 6, 0.3, 0.3, 27481),
(6583, 3, 4, 0, 0, 0, 0, 0, 0, 27481),
(6630, 4, 0, 3, 3, 10, 10, 0.3, 0.3, 27481),
(6957, 1, 0, 2, 1.236, 1.5, 2, 1.236, 1.5, 27481),
(7665, 0, 0, 12, 12, 0, 0, 0, 0, 27481),
(6695, 1, 1, 6, 6, 6, 6, 6, 6, 27481),
(6734, 0, 26, 3, 3, 0, 0, 0, 0, 27481),
(6733, 0, 4, 15, 15, 0, 0, 0, 0, 27481),
(7882, 0, 26, 3, 3, 0, 0, 0, 0, 27481),
(7881, 0, 0, 3, 3, 0, 0, 0, 0, 27481),
(7338, 0, 4, 15, 15, 0, 0, 0, 0, 27481),
(6701, 0, 4, 10, 10, 0, 0, 0, 0, 27481),
(6867, 0, 0, 4, 4, 0, 0, 0, 0, 27481);

UPDATE `areatrigger_template` SET `VerifiedBuild`=27481 WHERE `Id`=9397;
UPDATE `areatrigger_template` SET `Type`=0, `Flags`=2, `Data0`=1, `Data1`=1, `Data2`=0, `Data3`=0, `Data4`=0, `Data5`=0, `VerifiedBuild`=27481 WHERE `Id`=6197;

DELETE FROM `areatrigger_template_polygon_vertices` WHERE (`AreaTriggerId`=6583 AND `Idx`=3) OR (`AreaTriggerId`=6583 AND `Idx`=2) OR (`AreaTriggerId`=6583 AND `Idx`=1) OR (`AreaTriggerId`=6583 AND `Idx`=0);
INSERT INTO `areatrigger_template_polygon_vertices` (`AreaTriggerId`, `Idx`, `VerticeX`, `VerticeY`, `VerticeTargetX`, `VerticeTargetY`, `VerifiedBuild`) VALUES
(6583, 3, 0, -3, null, null, 27481),
(6583, 2, 0, 3, null, null, 27481),
(6583, 1, 4, 7.5, null, null, 27481),
(6583, 0, 4, -7.5, null, null, 27481);


DELETE FROM `spell_areatrigger` WHERE (`AreaTriggerId`=6387) OR (`AreaTriggerId`=6644) OR (`AreaTriggerId`=7939) OR (`AreaTriggerId`=7355) OR (`AreaTriggerId`=7354) OR (`AreaTriggerId`=6750) OR (`AreaTriggerId`=6784) OR (`AreaTriggerId`=7913) OR (`AreaTriggerId`=6987) OR (`AreaTriggerId`=6197) OR (`AreaTriggerId`=6583) OR (`AreaTriggerId`=6630) OR (`AreaTriggerId`=6957) OR (`AreaTriggerId`=6695) OR (`AreaTriggerId`=6734) OR (`AreaTriggerId`=6733) OR (`AreaTriggerId`=7882) OR (`AreaTriggerId`=7881) OR (`AreaTriggerId`=7338) OR (`AreaTriggerId`=6701) OR (`AreaTriggerId`=6867);
INSERT INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES
(1885, 6387, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 156469
(2070, 6644, 611, 0, 0, 0, 0, 30000, 30000, 27481), -- SpellId : 158639
(3268 , 7939, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 174126
(2742 , 7355, 0, 0, 0, 0, 0, 0, 60000, 27481), -- SpellId : 166391
(2741 , 7354, 0, 0, 0, 0, 0, 0, 60000, 27481), -- SpellId : 143809
(2214, 6750, 0, 0, 0, 0, 0, 0, 4000, 27481), -- SpellId : 160369
(2248 , 6784, 0, 0, 0, 0, 0, 0, 20000, 27481), -- SpellId : 160720
(3238 , 7913, 0, 0, 0, 0, 0, 0, 15000, 27481), -- SpellId : 173616
(3224, 6987, 0, 1203, 0, 0, 0, 29474, 25000, 27481), -- SpellId : 162901
(3225, 6987, 0, 1203, 0, 0, 0, 29474, 25000, 27481), -- SpellId : 162901
(3226, 6987, 0, 1203, 0, 0, 0, 29474, 25000, 27481), -- SpellId : 162901
(3214, 6197, 0, 1195, 0, 0, 0, 28000, 25000, 27481), -- SpellId : 168374
(3217, 6197, 0, 1195, 0, 0, 0, 28000, 25000, 27481), -- SpellId : 168374
(3218, 6197, 0, 1195, 0, 0, 0, 28000, 25000, 27481), -- SpellId : 168374
(2006 , 6583, 0, 0, 0, 0, 0, 0, 6000, 27481), -- SpellId : 158134
(2054, 6630, 0, 0, 0, 0, 0, 0, 30000, 27481), -- SpellId : 158206
(2385, 6957, 0, 0, 0, 0, 0, 0, 20000, 27481), -- SpellId : 162371
(2142, 6695, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 159169
(2192, 6734, 0, 1289, 695, 0, 0, 2827, 10000, 27481), -- SpellId : 160064
(2201 , 6733, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 159489
(3204, 7882, 0, 1288, 1192, 0, 0, 3000, 3000, 27481), -- SpellId : 173241
(3203, 7881, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 173229
(2729 , 7338, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 166148
(2149 , 6701, 0, 0, 0, 0, 0, 0, 0, 27481), -- SpellId : 159202
(2327, 6867, 0, 0, 0, 0, 0, 0, 30000, 27481); -- SpellId : 161634


-- DELETE FROM `conversation_actors` WHERE (`ConversationId`=43 AND `Idx`=3) OR (`ConversationId`=43 AND `Idx`=2) OR (`ConversationId`=43 AND `Idx`=0) OR (`ConversationId`=43 AND `Idx`=1) OR (`ConversationId`=42 AND `Idx`=0) OR (`ConversationId`=42 AND `Idx`=1) OR (`ConversationId`=170 AND `Idx`=1) OR (`ConversationId`=170 AND `Idx`=0);
-- INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `Idx`, `VerifiedBuild`) VALUES
-- (43, UNKNOWN, 3, 27481), -- Full: 0x20307C9980515100000E970000091097 Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83268 (Imperator Mar'gok) Low: 594071
-- (43, UNKNOWN, 2, 27481), -- Full: 0x24307C99804CDE80000E970000090FDB Vehicle/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 78714 (Kargath Bladefist) Low: 593883
-- (43, UNKNOWN, 0, 27481), -- Full: 0x20307C9980516C40000E970000090FDB Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83377 (Jhorn the Mad) Low: 593883
-- (43, UNKNOWN, 1, 27481), -- Full: 0x20307C9980516C80000E970000090FDB Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83378 (Thoktar Ironskull) Low: 593883
-- (42, UNKNOWN, 0, 27481), -- Full: 0x20307C9980516C40000E970000090FDB Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83377 (Jhorn the Mad) Low: 593883
-- (42, UNKNOWN, 1, 27481), -- Full: 0x20307C9980516C80000E970000090FDB Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83378 (Thoktar Ironskull) Low: 593883
-- (170, UNKNOWN, 1, 27481), -- Full: 0x20307C9980516C80000E970000090FDB Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83378 (Thoktar Ironskull) Low: 593883
-- (170, UNKNOWN, 0, 27481); -- Full: 0x20307C9980516C40000E970000090FDB Creature/0 R3103/S3735 Map: 1228 (Highmaul) Entry: 83377 (Jhorn the Mad) Low: 593883


DELETE FROM `conversation_line_template` WHERE `Id` IN (159, 158, 157, 156, 155, 154, 153, 150, 149, 148, 147, 146, 145, 144, 143, 681, 680, 679, 678);
INSERT INTO `conversation_line_template` (`Id`, `StartTime`, `UiCameraID`, `ActorIdx`, `Flags`, `VerifiedBuild`) VALUES
(159, 50755, 192, 3, 0, 27481),
(158, 38931, 192, 2, 0, 27481),
(157, 27830, 192, 3, 0, 27481),
(156, 18958, 192, 0, 0, 27481),
(155, 10306, 192, 2, 0, 27481),
(154, 5100, 192, 1, 0, 27481),
(153, 0, 192, 0, 0, 27481),
(150, 68898, 192, 0, 0, 27481),
(149, 54251, 192, 0, 0, 27481),
(148, 49826, 192, 1, 0, 27481),
(147, 37184, 192, 0, 0, 27481),
(146, 30673, 192, 1, 0, 27481),
(145, 15357, 192, 0, 0, 27481),
(144, 10530, 192, 1, 0, 27481),
(143, 0, 192, 0, 0, 27481),
(681, 15959, 192, 1, 0, 27481),
(680, 10396, 192, 0, 0, 27481),
(679, 5013, 192, 1, 0, 27481),
(678, 0, 192, 0, 0, 27481);


DELETE FROM `conversation_template` WHERE `Id` IN (43, 170, 42);
INSERT INTO `conversation_template` (`Id`, `FirstLineID`, `LastLineEndTime`, `VerifiedBuild`) VALUES
(43, 153, 2147486400, 27481),
(170, 678, 2147494528, 27481),
(42, 143, 2147486336, 27481);



UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=32 WHERE `entry`=231989; -- Rune of Fortification
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=32 WHERE `entry`=231990; -- Rune of Replication
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=32 WHERE `entry`=231988; -- Rune of Displacement
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=236210; -- Sorcerer King Stair Blocking Door
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=32 WHERE `entry`=233125; -- Rune of Nullification
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=236213; -- Fel Breaker Entrance Door
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=236212; -- Twin Ogron Exit
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=236214; -- Fel Breaker Exit Door
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=236211; -- Twin Ogron Entrance
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=236446; -- Fel Breaker Floor
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=32 WHERE `entry`=233127; -- Chain
UPDATE `gameobject_template_addon` SET `faction`=14, `flags`=48 WHERE `entry`=229649; -- Earthen Pillar
UPDATE `gameobject_template_addon` SET `faction`=114, `flags`=32 WHERE `entry`=236703; -- Wind Door
UPDATE `gameobject_template_addon` SET `faction`=114, `flags`=32 WHERE `entry`=231776; -- Portal
UPDATE `gameobject_template_addon` SET `faction`=1375 WHERE `entry`=234299; -- Collision Wall
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=237780; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=237777; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=237779; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=237778; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=239128; -- Highmaul LFR Door - Not Used
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=239125; -- Highmaul LFR Door - Near Coliseum
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=32 WHERE `entry`=239110; -- Earthen Pillar
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=239124; -- Highmaul LFR Door - Fungal Giant
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=239127; -- Highmaul LFR Door - Not Used
UPDATE `gameobject_template_addon` SET `faction`=1375, `flags`=48 WHERE `entry`=239126; -- Highmaul LFR Door - Near Portal
UPDATE `gameobject_template_addon` SET `faction`=35, `flags`=32 WHERE `entry`=231770; -- Instance Portal (Raid: Normal, Heroic, Mythic)
UPDATE `gameobject_template_addon` SET `faction`=1375 WHERE `entry`=232369; -- Doodad_6DU_HighmaulRaid_Grate002
UPDATE `gameobject_template_addon` SET `faction`=1375 WHERE `entry`=232368; -- Doodad_6DU_HighmaulRaid_Grate001
UPDATE `gameobject_template_addon` SET `faction`=1375 WHERE `entry`=232371; -- Doodad_6DU_HighmaulRaid_Grate004
UPDATE `gameobject_template_addon` SET `faction`=1375 WHERE `entry`=232370; -- Doodad_6DU_HighmaulRaid_Grate003

-- INSERT IGNORE INTO `weather_update` (`map_id`, `zone_id`, `weather_state`, `grade`, `unk`) VALUES
-- (1228, 0, 1, 0, 1); -- Highmaul - Fog - 0

DELETE FROM `scene_template` WHERE (`SceneId`=902 AND `ScriptPackageID`=1338);
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`) VALUES
(902, 16, 1338);

UPDATE `creature_template_addon` SET `bytes1`=50331648 WHERE `entry`=15214; -- 15214 (Invisible Stalker)
UPDATE `creature_template_addon` SET `aiAnimKit`=5517 WHERE `entry`=68553; -- 68553 (SLG Generic MoP (Large AOI))

DELETE FROM `creature_model_info` WHERE `DisplayID`=84345;
INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`, `VerifiedBuild`) VALUES
(84345, 0.3, 1, 0, 27481);

UPDATE `creature_model_info` SET `BoundingRadius`=3.217123, `CombatReach`=5.625, `VerifiedBuild`=27481 WHERE `DisplayID`=54586;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=60608;
UPDATE `creature_model_info` SET `BoundingRadius`=3.002648, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=59426;
UPDATE `creature_model_info` SET `BoundingRadius`=3.002648, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=56643;
UPDATE `creature_model_info` SET `BoundingRadius`=3.431598, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=56644;
UPDATE `creature_model_info` SET `BoundingRadius`=8.690866, `CombatReach`=18, `VerifiedBuild`=27481 WHERE `DisplayID`=57148;
UPDATE `creature_model_info` SET `BoundingRadius`=3.002648, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=56638;
UPDATE `creature_model_info` SET `BoundingRadius`=3.431598, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=56641;
UPDATE `creature_model_info` SET `BoundingRadius`=3.431598, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=56642;
UPDATE `creature_model_info` SET `BoundingRadius`=3.002648, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=56328;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=60422;
UPDATE `creature_model_info` SET `BoundingRadius`=3.002648, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=56639;
UPDATE `creature_model_info` SET `BoundingRadius`=3.002648, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=56640;
UPDATE `creature_model_info` SET `BoundingRadius`=4.611526, `CombatReach`=9.5, `VerifiedBuild`=27481 WHERE `DisplayID`=54825;
UPDATE `creature_model_info` SET `BoundingRadius`=2.305763, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=59490;
UPDATE `creature_model_info` SET `BoundingRadius`=2.305763, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=59495;
UPDATE `creature_model_info` SET `BoundingRadius`=2.305763, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=59492;
UPDATE `creature_model_info` SET `BoundingRadius`=2.402118, `CombatReach`=4.2, `VerifiedBuild`=27481 WHERE `DisplayID`=57048;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=57045;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=57074;
UPDATE `creature_model_info` SET `BoundingRadius`=6.083606, `CombatReach`=11.2, `VerifiedBuild`=27481 WHERE `DisplayID`=55849;
UPDATE `creature_model_info` SET `BoundingRadius`=6.518149, `CombatReach`=12, `VerifiedBuild`=27481 WHERE `DisplayID`=54385;
UPDATE `creature_model_info` SET `BoundingRadius`=4.345432, `CombatReach`=9, `VerifiedBuild`=27481 WHERE `DisplayID`=55821;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=54630;
UPDATE `creature_model_info` SET `BoundingRadius`=4.293915, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=23372;
UPDATE `creature_model_info` SET `BoundingRadius`=1.563862, `CombatReach`=4, `VerifiedBuild`=27481 WHERE `DisplayID`=55940;
UPDATE `creature_model_info` SET `BoundingRadius`=6.286919, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=59412;
UPDATE `creature_model_info` SET `BoundingRadius`=6.286919, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=59414;
UPDATE `creature_model_info` SET `BoundingRadius`=6.286919, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=59413;
UPDATE `creature_model_info` SET `BoundingRadius`=12.57384, `CombatReach`=12, `VerifiedBuild`=27481 WHERE `DisplayID`=54793;
UPDATE `creature_model_info` SET `BoundingRadius`=3.925986, `CombatReach`=7, `VerifiedBuild`=27481 WHERE `DisplayID`=60437;
UPDATE `creature_model_info` SET `BoundingRadius`=0.5, `CombatReach`=1, `VerifiedBuild`=27481 WHERE `DisplayID`=60571;
UPDATE `creature_model_info` SET `BoundingRadius`=2.94449, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=60193;
UPDATE `creature_model_info` SET `BoundingRadius`=0.7, `CombatReach`=2, `VerifiedBuild`=27481 WHERE `DisplayID`=58898;
UPDATE `creature_model_info` SET `BoundingRadius`=0.3, `CombatReach`=0.75, `VerifiedBuild`=27481 WHERE `DisplayID`=59306;
UPDATE `creature_model_info` SET `BoundingRadius`=0.6327568, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=60195;
UPDATE `creature_model_info` SET `BoundingRadius`=0.4464, `CombatReach`=1.8, `VerifiedBuild`=27481 WHERE `DisplayID`=57894;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=31379;
UPDATE `creature_model_info` SET `BoundingRadius`=0.5952, `CombatReach`=2.4, `VerifiedBuild`=27481 WHERE `DisplayID`=59898;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=57264;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=60722;
UPDATE `creature_model_info` SET `BoundingRadius`=0.4836, `CombatReach`=1.95, `VerifiedBuild`=27481 WHERE `DisplayID`=59709;
UPDATE `creature_model_info` SET `BoundingRadius`=0.744, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=60744;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=9904;
UPDATE `creature_model_info` SET `BoundingRadius`=5.888979, `CombatReach`=9, `VerifiedBuild`=27481 WHERE `DisplayID`=58539;
UPDATE `creature_model_info` SET `BoundingRadius`=1.172896, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=59416;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=56329;
UPDATE `creature_model_info` SET `BoundingRadius`=2.535891, `CombatReach`=6.25, `VerifiedBuild`=27481 WHERE `DisplayID`=55719;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=57375;
UPDATE `creature_model_info` SET `BoundingRadius`=2.610071, `CombatReach`=8, `VerifiedBuild`=27481 WHERE `DisplayID`=53855;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=56330;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=58816;
UPDATE `creature_model_info` SET `BoundingRadius`=1.172896, `CombatReach`=5.25, `VerifiedBuild`=27481 WHERE `DisplayID`=57346;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=60721;
UPDATE `creature_model_info` SET `BoundingRadius`=1.231541, `CombatReach`=5.5125, `VerifiedBuild`=27481 WHERE `DisplayID`=57332;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=56325;
UPDATE `creature_model_info` SET `BoundingRadius`=1.563862, `CombatReach`=4, `VerifiedBuild`=27481 WHERE `DisplayID`=57226;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=60683;
UPDATE `creature_model_info` SET `BoundingRadius`=1.1338, `CombatReach`=5.075, `VerifiedBuild`=27481 WHERE `DisplayID`=57331;
UPDATE `creature_model_info` SET `BoundingRadius`=1.715799, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=60723;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=57376;
UPDATE `creature_model_info` SET `BoundingRadius`=2.573699, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=57370;
UPDATE `creature_model_info` SET `BoundingRadius`=1.211993, `CombatReach`=5.425, `VerifiedBuild`=27481 WHERE `DisplayID`=57330;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=56326;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=56324;
UPDATE `creature_model_info` SET `BoundingRadius`=3.295839, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=58840;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=56323;
UPDATE `creature_model_info` SET `BoundingRadius`=1.172896, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=58741;
UPDATE `creature_model_info` SET `BoundingRadius`=1.172896, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=57225;
UPDATE `creature_model_info` SET `BoundingRadius`=0.8928, `CombatReach`=3.6, `VerifiedBuild`=27481 WHERE `DisplayID`=54774;
UPDATE `creature_model_info` SET `BoundingRadius`=0.8928, `CombatReach`=3.6, `VerifiedBuild`=27481 WHERE `DisplayID`=54786;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=23767;
UPDATE `creature_model_info` SET `BoundingRadius`=3.427221, `CombatReach`=6, `VerifiedBuild`=27481 WHERE `DisplayID`=54329;
UPDATE `creature_model_info` SET `BoundingRadius`=3.153459, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=55482;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=55499;
UPDATE `creature_model_info` SET `BoundingRadius`=3.12499, `CombatReach`=7, `VerifiedBuild`=27481 WHERE `DisplayID`=55680;
UPDATE `creature_model_info` SET `BoundingRadius`=2.359224, `CombatReach`=4.125, `VerifiedBuild`=27481 WHERE `DisplayID`=58585;
UPDATE `creature_model_info` SET `BoundingRadius`=1.652884, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=56250;
UPDATE `creature_model_info` SET `BoundingRadius`=1.690072, `CombatReach`=4.2, `VerifiedBuild`=27481 WHERE `DisplayID`=54674;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=56916;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=56917;
UPDATE `creature_model_info` SET `BoundingRadius`=2.144749, `CombatReach`=3.75, `VerifiedBuild`=27481 WHERE `DisplayID`=58596;
UPDATE `creature_model_info` SET `BoundingRadius`=2.359224, `CombatReach`=4.125, `VerifiedBuild`=27481 WHERE `DisplayID`=58586;
UPDATE `creature_model_info` SET `BoundingRadius`=3.518327, `CombatReach`=5, `VerifiedBuild`=27481 WHERE `DisplayID`=59276;
UPDATE `creature_model_info` SET `BoundingRadius`=0.472, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=54872;
UPDATE `creature_model_info` SET `BoundingRadius`=0.744, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=54871;
UPDATE `creature_model_info` SET `BoundingRadius`=0.472, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=54870;
UPDATE `creature_model_info` SET `BoundingRadius`=0.744, `CombatReach`=3, `VerifiedBuild`=27481 WHERE `DisplayID`=54869;
UPDATE `creature_model_info` SET `BoundingRadius`=1, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=56123;
UPDATE `creature_model_info` SET `BoundingRadius`=2.385, `CombatReach`=4.5, `VerifiedBuild`=27481 WHERE `DisplayID`=55031;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=11686;

DELETE FROM `creature_equip_template` WHERE (`CreatureID`=78549 AND `ID`=1) OR (`CreatureID`=87910 AND `ID`=1) OR (`CreatureID`=81806 AND `ID`=2) OR (`CreatureID`=86256 AND `ID`=1) OR (`CreatureID`=81806 AND `ID`=1) OR (`CreatureID`=81269 AND `ID`=1) OR (`CreatureID`=81808 AND `ID`=1) OR (`CreatureID`=81811 AND `ID`=1) OR (`CreatureID`=81780 AND `ID`=1) OR (`CreatureID`=81807 AND `ID`=1) OR (`CreatureID`=87619 AND `ID`=1) OR (`CreatureID`=81809 AND `ID`=1) OR (`CreatureID`=81810 AND `ID`=1) OR (`CreatureID`=79015 AND `ID`=1) OR (`CreatureID`=82528 AND `ID`=1) OR (`CreatureID`=82519 AND `ID`=1) OR (`CreatureID`=78237 AND `ID`=1) OR (`CreatureID`=78238 AND `ID`=1) OR (`CreatureID`=82400 AND `ID`=1) OR (`CreatureID`=86610 AND `ID`=1) OR (`CreatureID`=86609 AND `ID`=1) OR (`CreatureID`=86607 AND `ID`=1) OR (`CreatureID`=88118 AND `ID`=1) OR (`CreatureID`=82690 AND `ID`=2) OR (`CreatureID`=77404 AND `ID`=1) OR (`CreatureID`=85225 AND `ID`=1) OR (`CreatureID`=81270 AND `ID`=3) OR (`CreatureID`=82690 AND `ID`=1) OR (`CreatureID`=81272 AND `ID`=1) OR (`CreatureID`=86275 AND `ID`=1) OR (`CreatureID`=82900 AND `ID`=1) OR (`CreatureID`=81270 AND `ID`=2) OR (`CreatureID`=81270 AND `ID`=1) OR (`CreatureID`=88724 AND `ID`=1) OR (`CreatureID`=83268 AND `ID`=1) OR (`CreatureID`=80071 AND `ID`=1) OR (`CreatureID`=84823 AND `ID`=1) OR (`CreatureID`=84971 AND `ID`=1);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`) VALUES
(78549, 1, 107737, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Reaver
(87910, 1, 111046, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Rune-Mender
(81806, 2, 111367, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Royal Guardsman
(86256, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian High Sorcerer
(81806, 1, 110960, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Royal Guardsman
(81269, 1, 118533, 0, 0, 0, 0, 0, 0, 0, 0), -- Warden Thul'tok
(81808, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- Councilor Magknor
(81811, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- High Councilor Mal'gris
(81780, 1, 110251, 0, 0, 110160, 0, 0, 0, 0, 0), -- Guard Captain Thag
(81807, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- Councilor Nouk
(87619, 1, 110457, 0, 0, 110457, 0, 0, 0, 0, 0), -- Gorian Warden
(81809, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- Councilor Gorluk
(81810, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- Councilor Daglat
(79015, 1, 116377, 0, 0, 0, 0, 0, 0, 0, 0), -- Ko'ragh
(82528, 1, 109043, 0, 0, 110791, 0, 0, 0, 0, 0), -- Gorian Arcanist
(82519, 1, 120119, 0, 0, 108475, 0, 0, 0, 0, 0), -- Highmaul Conscript
(78237, 1, 113512, 0, 0, 113512, 0, 0, 0, 0, 0), -- Phemos
(78238, 1, 113544, 0, 0, 108626, 0, 0, 0, 0, 0), -- Pol
(82400, 1, 107407, 0, 0, 0, 0, 0, 0, 0, 0), -- Ogron Brute
(86610, 1, 109596, 0, 0, 111519, 0, 0, 0, 0, 0), -- Blackrock Grunt
(86609, 1, 109596, 0, 0, 111519, 0, 0, 0, 0, 0), -- Iron Warmaster
(86607, 1, 109596, 0, 0, 0, 0, 0, 108504, 0, 0), -- Iron Flame Technician
(88118, 1, 118247, 0, 0, 0, 0, 0, 0, 0, 0), -- Iron Grunt
(82690, 2, 110960, 0, 0, 0, 0, 0, 0, 0, 0), -- Cosmetic Gorian Warrior
(77404, 1, 109166, 0, 0, 109165, 0, 0, 0, 0, 0), -- The Butcher
(85225, 1, 110281, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Sorcerer
(81270, 3, 110960, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Guardsman
(82690, 1, 111367, 0, 0, 0, 0, 0, 0, 0, 0), -- Cosmetic Gorian Warrior
(81272, 1, 111743, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Runemaster
(86275, 1, 113440, 0, 0, 113440, 0, 0, 0, 0, 0), -- Gorian Enforcer
(82900, 1, 113440, 0, 0, 113440, 0, 0, 0, 0, 0), -- Gorian Enforcer
(81270, 2, 111367, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Guardsman
(81270, 1, 110901, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Guardsman
(88724, 1, 110961, 0, 0, 0, 0, 0, 0, 0, 0), -- Gorian Enforcer
(83268, 1, 115015, 0, 0, 0, 0, 0, 0, 0, 0), -- Imperator Mar'gok
(80071, 1, 111489, 0, 0, 0, 0, 0, 0, 0, 0), -- Bladespire Sorcerer
(84823, 1, 30414, 0, 0, 0, 0, 0, 0, 0, 0), -- Grommash Hellscream
(84971, 1, 110961, 0, 0, 0, 0, 0, 0, 0, 0); -- Gharg


DELETE FROM `gossip_menu` WHERE (`MenuId`=16899 AND `TextId`=24586);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
(16899, 24586, 27481); -- 84971 (Gharg)

DELETE FROM `gossip_menu_option` WHERE (`MenuId`=16899 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `VerifiedBuild`) VALUES
(16899, 0, 0, 'We are ready, Gharg!', 86507, 27481);

DELETE FROM `creature_text` WHERE `CreatureID` IN (77404, 77428, 77637, 78237, 78238, 78491, 78714, 78948, 79015, 79092, 80048, 80551, 80599, 81811, 82733, 83268, 86609);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(77404, 0, 0, 'Come and get it!', 14, 0, 100, 0, 0, 41626, 83198, 'The Butcher'),
(77404, 1, 0, 'Come here you scrawny grabbers!', 14, 0, 100, 0, 0, 41626, 83205, 'The Butcher to Player'),
(77404, 2, 0, '%s frenzies!', 41, 0, 100, 0, 0, 41628, 82959, 'The Butcher'),
(77404, 3, 0, 'Time for the meat grinder!', 14, 0, 100, 0, 0, 41628, 83200, 'The Butcher'),
(77404, 4, 0, 'Gonna make a Pale stew.', 14, 0, 100, 0, 0, 41628, 83207, 'The Butcher to The Butcher'),
(77428, 0, 0, 'Highmaul will never fall. The Gorian empire will not be overthrown by these peasants!', 14, 0, 100, 0, 0, 44768, 84881, 'Imperator Mar\'gok to Ogron Mauler'),
(77428, 1, 0, 'End this now, Mal\'gris. Remove them from my throne room.', 14, 0, 100, 0, 0, 44769, 84882, 'Imperator Mar\'gok to Ogron Mauler'),
(77428, 2, 0, 'You dare assault the seat of my power? Is this the work of that traitor Cho\'gall? Kneel and swear fealty to me, and I may yet spare your lives for my coliseum.', 14, 0, 100, 0, 0, 42029, 80750, 'Imperator Mar\'gok to Player'),
(77428, 3, 0, 'You will learn why I am king, and you are little more than peasants.', 14, 0, 100, 0, 0, 42015, 80751, 'Imperator Mar\'gok to Player'),
(77428, 4, 0, 'The arcane bends to my will, as shall you!', 14, 0, 100, 0, 0, 42035, 83525, 'Imperator Mar\'gok'),
(77428, 5, 0, 'Look upon the tools of your demise! The ancient stones grant me unimaginable power!', 14, 0, 100, 408, 0, 42018, 80660, 'Imperator Mar\'gok'),
(77428, 6, 0, 'Come, see the error of your ways.', 14, 0, 100, 0, 0, 42036, 83526, 'Imperator Mar\'gok'),
(77428, 7, 0, '|TINTERFACE\\ICONS\\Spell_Arcane_MassDispel.blp:20|t You are afflicted with |cFFF00000|Hspell:158605|h[Mark of Chaos]|h|r!', 42, 0, 100, 0, 0, 0, 81318, 'Imperator Mar\'gok to Player'),
(77428, 8, 0, 'I command the arcane!', 14, 0, 100, 0, 0, 42038, 83528, 'Imperator Mar\'gok'),
(77428, 9, 0, 'You have earned my wrath!', 14, 0, 100, 0, 0, 42034, 83524, 'Imperator Mar\'gok'),
(77428, 10, 0, 'You have seen but a fraction of my power. Behold the ancient magics unearthed by my empire!', 14, 0, 100, 408, 0, 42019, 80827, 'Imperator Mar\'gok'),
(77428, 11, 0, 'King\'s guard, to my side! I must focus my power and awaken the stone!', 14, 0, 100, 0, 0, 42020, 80828, 'Imperator Mar\'gok'),
(77428, 12, 0, 'Such power! It takes form to destroy you!', 14, 0, 100, 0, 0, 42021, 80829, 'Imperator Mar\'gok'),
(77428, 13, 0, 'Its energy overflows! Soon it will be unleashed!', 14, 0, 100, 0, 0, 42022, 80830, 'Imperator Mar\'gok'),
(77428, 14, 0, 'The boundless power of the stones flows through me! Your destruction comes!', 14, 0, 100, 15, 0, 42023, 80658, 'Imperator Mar\'gok'),
(77428, 15, 0, 'My power knows no limit!', 14, 0, 100, 0, 0, 42033, 83523, 'Imperator Mar\'gok'),
(77428, 16, 0, 'Enough! Long have the Sorcerer Kings guarded these chambers. Today you will see our secret power.', 14, 0, 100, 408, 0, 42024, 80832, 'Imperator Mar\'gok'),
(77428, 17, 0, 'Guards, remove these peasants.', 14, 0, 100, 0, 0, 42025, 80833, 'Imperator Mar\'gok'),
(77428, 18, 0, 'Its power grows beyond comprehension!', 14, 0, 100, 0, 0, 42026, 80834, 'Imperator Mar\'gok'),
(77428, 19, 0, 'You can never challenge my rule! I command the power of the stones and know no equal!', 14, 0, 100, 15, 0, 42027, 80661, 'Imperator Mar\'gok'),
(77428, 20, 0, 'Begone from my sight.', 14, 0, 100, 0, 0, 42037, 83527, 'Imperator Mar\'gok'),
(77428, 21, 0, '|TINTERFACE\\ICONS\\spell_Mage_NetherTempest.blp:20|t |cFFF00000|Hspell:158648|h[Orbs of Chaos]|h|r explode from $n!', 41, 0, 100, 0, 0, 0, 81319, 'Imperator Mar\'gok to Player'),
(77428, 22, 0, 'I... am... king...', 14, 0, 100, 0, 0, 42017, 83519, 'Imperator Mar\'gok to Player'),
(77637, 0, 0, '$n detonated Destructive Resonance!', 16, 0, 100, 0, 0, 0, 90796, 'Destructive Resonance to Player'),
(78237, 0, 0, 'Who is dat?', 14, 0, 100, 0, 0, 41932, 82796, 'Phemos to Player'),
(78237, 1, 0, 'Oy! Dey fightin\'!', 14, 0, 100, 0, 0, 41928, 82797, 'Phemos to Player'),
(78237, 2, 0, 'Let\'s have some fun!', 14, 0, 100, 0, 0, 41931, 82813, 'Phemos'),
(78237, 3, 0, '|TInterface\\Icons\\ability_whirlwind:20|t%s readies a |cFFFF0000|Hspell:157943|h[Whirlwind]|h|r!', 41, 0, 100, 0, 0, 41939, 82098, 'Phemos'),
(78237, 4, 0, '\'Dis gonna hurt.', 14, 0, 100, 0, 0, 41939, 82811, 'Phemos'),
(78237, 5, 0, 'Feel \'dis!', 14, 0, 100, 0, 0, 41938, 82810, 'Phemos to Player'),
(78238, 0, 0, 'Da King don\'t wanna see nobody! Go away!', 14, 0, 100, 0, 0, 42086, 82798, 'Pol to Player'),
(78238, 1, 0, 'Fight \'em back den.', 14, 0, 100, 0, 0, 42083, 82799, 'Pol to Player'),
(78238, 2, 0, 'Watch out!', 14, 0, 100, 0, 0, 42092, 82802, 'Pol'),
(78238, 3, 0, '|TInterface\\Icons\\ability_warrior_shieldguard:20|t%s readies a |cFFFF0000|Hspell:158136|h[Shield Charge]|h|r!', 41, 0, 100, 0, 0, 42092, 82097, 'Pol'),
(78238, 4, 0, 'Hear \'dis?', 14, 0, 100, 0, 0, 42090, 82800, 'Pol to Player'),
(78238, 5, 0, 'Heh heh... \'Dis gonna be gud.', 14, 0, 100, 0, 0, 42085, 82804, 'Pol'),
(78491, 0, 0, '%s begins to channel |cFFFF0404|Hspell:159996|h[Infesting Spores]|h|r!', 41, 0, 100, 0, 0, 0, 91502, 'Brackenspore'),
(78714, 0, 0, 'You owe me a fight, cowards.', 14, 0, 100, 0, 0, 44515, 81169, 'Kargath Bladefist'),
(78714, 1, 0, 'Time to spill your blood!', 14, 0, 100, 0, 0, 44529, 81230, 'Kargath Bladefist to Player'),
(78714, 2, 0, 'There is no escape.', 14, 0, 100, 0, 0, 44527, 81171, 'Kargath Bladefist to Player'),
(78714, 3, 0, '%s |cFFFF0404|Hspell:158986|h[Fixates]|h|r on you!', 42, 0, 100, 0, 0, 0, 81167, 'Kargath Bladefist to Player'),
(78714, 4, 0, 'And that\'s... one hundred.', 12, 0, 100, 0, 0, 44513, 88065, 'Kargath Bladefist to Player'),
(78948, 0, 0, 'ALL THAT LIVES, TO DUST.', 14, 0, 100, 0, 0, 43509, 90277, 'Tectus'),
(78948, 1, 0, 'RISE, MOUNTAINS!', 14, 0, 100, 0, 0, 43521, 90282, 'Tectus'),
(78948, 2, 0, 'Tectus directs his Crystalline Barrage towards you!', 42, 0, 100, 0, 0, 0, 88741, 'Tectus to Player'),
(78948, 3, 0, 'BREAK.', 14, 0, 100, 0, 0, 43517, 90278, 'Tectus'),
(78948, 4, 0, 'WHAT... IS... THIS....', 14, 0, 100, 0, 0, 43512, 90284, 'Tectus to Tectus'),
(78948, 5, 0, 'EVEN THE MOUNTAIN... FALLS....', 14, 0, 100, 0, 0, 43510, 90285, 'Tectus to Mote of Tectus'),
(79015, 0, 0, 'Your magic is powerless here!', 14, 0, 100, 0, 0, 41970, 83577, 'Ko\'ragh to Player'),
(79015, 1, 0, 'AHHHHHH!', 14, 0, 100, 0, 0, 41975, 83580, 'Ko\'ragh to Ko\'ragh'),
(79015, 2, 0, 'Broken.', 14, 0, 100, 0, 0, 41983, 83590, 'Ko\'ragh'),
(79015, 3, 0, 'Impossible...', 14, 0, 100, 0, 0, 41972, 83579, 'Ko\'ragh to Player'),
(79092, 0, 0, 'A |cFFFF0404%s|r comes lurking from the depths!', 41, 0, 100, 0, 0, 0, 83690, 'Fungal Flesh-Eater'),
(80048, 0, 0, 'Glory and death!', 14, 0, 100, 0, 0, 45788, 81720, 'Vul\'gor'),
(80048, 1, 0, 'Break you!', 14, 0, 100, 0, 0, 45792, 82904, 'Vul\'gor to Vul\'gor'),
(80551, 0, 0, 'SHATTER.', 14, 0, 100, 0, 0, 43520, 90281, 'Shard of Tectus'),
(80599, 0, 0, 'Yjj\'rmr... Xzzolos...', 14, 0, 100, 0, 0, 45415, 90291, 'Night-Twisted Earthwarper'),
(81811, 0, 0, 'My liege, the city is lost! We must abandon the palace!', 14, 0, 100, 20, 0, 45106, 88778, 'High Councilor Mal\'gris to Ogron Mauler'),
(81811, 1, 0, 'The gates have been breached! They have come for the stones!', 14, 0, 100, 1, 0, 45107, 88779, 'High Councilor Mal\'gris to Ogron Mauler'),
(82733, 0, 0, 'Heretics! Kill! Feast!', 14, 0, 100, 397, 0, 0, 84693, 'Night-Twisted Shadowsworn to Player'),
(83268, 0, 0, 'Finish him.', 14, 0, 100, 0, 0, 44758, 84871, 'Imperator Mar\'gok to Kargath Bladefist'),
(86609, 0, 0, 'Argh! These flamethrowers are useless, it\'s eating us alive!', 14, 0, 100, 5, 0, 46607, 88561, 'Iron Warmaster to Brackenspore'),
(86609, 1, 0, 'Fall back! Drop your weapons and retreat to the ship!', 14, 0, 100, 5, 0, 46608, 88562, 'Iron Warmaster to Brackenspore');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 81403;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(81403, 164193, 1, 0);

UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=231990; -- Rune of Replication
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=231989; -- Rune of Fortification
UPDATE `gameobject_template` SET `name`='Sorcerer King Stair Blocking Door', `VerifiedBuild`=27481 WHERE `entry`=236210; -- Sorcerer King Stair Blocking Door
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=231988; -- Rune of Displacement
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=243403; -- Collision Wall
UPDATE `gameobject_template` SET `name`='Fel Breaker Floor', `VerifiedBuild`=27481 WHERE `entry`=236446; -- Fel Breaker Floor
UPDATE `gameobject_template` SET `name`='Chain', `VerifiedBuild`=27481 WHERE `entry`=233127; -- Chain
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=233125; -- Rune of Nullification
UPDATE `gameobject_template` SET `name`='Fel Breaker Exit Door', `VerifiedBuild`=27481 WHERE `entry`=236214; -- Fel Breaker Exit Door
UPDATE `gameobject_template` SET `name`='Fel Breaker Entrance Door', `VerifiedBuild`=27481 WHERE `entry`=236213; -- Fel Breaker Entrance Door
UPDATE `gameobject_template` SET `name`='Twin Ogron Exit', `Data0`=0, `VerifiedBuild`=27481 WHERE `entry`=236212; -- Twin Ogron Exit
UPDATE `gameobject_template` SET `name`='Twin Ogron Entrance', `VerifiedBuild`=27481 WHERE `entry`=236211; -- Twin Ogron Entrance
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=229649; -- Earthen Pillar
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=236033; -- Fungal Giant LFR Tower Door
UPDATE `gameobject_template` SET `name`='Wind Door', `VerifiedBuild`=27481 WHERE `entry`=236703; -- Wind Door
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=231776; -- Portal
UPDATE `gameobject_template` SET `name`='Collision Wall', `VerifiedBuild`=27481 WHERE `entry`=234299; -- Collision Wall
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=239127; -- Highmaul LFR Door - Not Used
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=239124; -- Highmaul LFR Door - Fungal Giant
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=237779; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=239126; -- Highmaul LFR Door - Near Portal
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=237780; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=237778; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=237777; -- 6DU_HighmaulRaid_earthwall
UPDATE `gameobject_template` SET `name`='Earthen Pillar', `VerifiedBuild`=27481 WHERE `entry`=239110; -- Earthen Pillar
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=239128; -- Highmaul LFR Door - Not Used
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=239125; -- Highmaul LFR Door - Near Coliseum
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=231770; -- Instance Portal (Raid: Normal, Heroic, Mythic)
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=232369; -- Doodad_6DU_HighmaulRaid_Grate002
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=232368; -- Doodad_6DU_HighmaulRaid_Grate001
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=232371; -- Doodad_6DU_HighmaulRaid_Grate004
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=232370; -- Doodad_6DU_HighmaulRaid_Grate003

DELETE FROM `npc_text` WHERE `ID`=24586;
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(24586, 1, 0, 0, 0, 0, 0, 0, 0, 86506, 0, 0, 0, 0, 0, 0, 0, 27481); -- 24586

UPDATE `gameobject` SET `spawntimesecs` = -7200 WHERE `guid` IN (1530127, 19801444); 
UPDATE `creature_template` SET `gossip_menu_id` = 16899 WHERE `entry` = 84971; 

UPDATE `gossip_menu_option` SET `OptionType` = '1' , `OptionNpcFlag` = '1' WHERE `MenuId` = '16899' AND `OptionIndex` = '0';

UPDATE creature_template SET lootid = 77428 WHERE entry = 77428 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '77428';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('77428', '0', '77428', '100', '0', '1', '0', '2', '2', ''),
('77428', '118344', '0', '0', '0', '1', '0', '1', '1', ''),
('77428', '118345', '0', '0', '0', '1', '0', '1', '1', ''),
('77428', '118346', '0', '0', '0', '1', '0', '1', '1', ''),
('77428', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('77428', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('77428', '118632', '0', '0', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '77428';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('77428', '113848', '0', '6.271057', '0', '1', '1', '1', '1', ''),
('77428', '113849', '0', '6.603313', '0', '1', '1', '1', '1', ''),
('77428', '113850', '0', '7', '0', '1', '1', '1', '1', ''),
('77428', '113851', '0', '5.66463', '0', '1', '1', '1', '1', ''),
('77428', '113852', '0', '3.301657', '0', '1', '1', '1', '1', ''),
('77428', '113853', '0', '6', '0', '1', '1', '1', '1', ''),
('77428', '113854', '0', '3', '0', '1', '1', '1', '1', ''),
('77428', '113855', '0', '8', '0', '1', '1', '1', '1', ''),
('77428', '113856', '0', '8.524826', '0', '1', '1', '1', '1', ''),
('77428', '113857', '0', '8.575943', '0', '1', '1', '1', '1', ''),
('77428', '113858', '0', '4.217105', '0', '1', '1', '1', '1', ''),
('77428', '113859', '0', '6', '0', '1', '1', '1', '1', ''),
('77428', '113860', '0', '6.891424', '0', '1', '1', '1', '1', ''),
('77428', '113861', '0', '3.445712', '0', '1', '1', '1', '1', ''),
('77428', '116002', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116027', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116206', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116235', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116280', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116287', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116296', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116372', '0', '0', '0', '1', '1', '1', '1', ''),
('77428', '116373', '0', '0', '0', '1', '1', '1', '1', '');


UPDATE creature_template SET lootid = 77404 WHERE entry = 77404 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '77404';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('77404', '0', '77404', '100', '0', '1', '0', '2', '2', ''),
('77404', '118344', '0', '0', '0', '1', '0', '1', '1', ''),
('77404', '118345', '0', '0', '0', '1', '0', '1', '1', ''),
('77404', '118346', '0', '0', '0', '1', '0', '1', '1', ''),
('77404', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('77404', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('77404', '118632', '0', '0', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '77404';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('77404', '113606', '0', '7.188008', '0', '1', '1', '1', '1', ''),
('77404', '113607', '0', '6.836526', '0', '1', '1', '1', '1', ''),
('77404', '113608', '0', '6.842083', '0', '1', '1', '1', '1', ''),
('77404', '113609', '0', '10.50138', '0', '1', '1', '1', '1', ''),
('77404', '113610', '0', '8', '0', '1', '1', '1', '1', ''),
('77404', '113611', '0', '7.385282', '0', '1', '1', '1', '1', ''),
('77404', '113612', '0', '7.154666', '0', '1', '1', '1', '1', ''),
('77404', '113632', '0', '10', '0', '1', '1', '1', '1', ''),
('77404', '113633', '0', '10', '0', '1', '1', '1', '1', ''),
('77404', '113634', '0', '11.55166', '0', '1', '1', '1', '1', ''),
('77404', '113636', '0', '10', '0', '1', '1', '1', '1', ''),
('77404', '113637', '0', '5.501452', '0', '1', '1', '1', '1', ''),
('77404', '113638', '0', '6', '0', '1', '1', '1', '1', ''),
('77404', '115998', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116026', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116209', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116230', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116281', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116290', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116297', '0', '0', '0', '1', '1', '1', '1', ''),
('77404', '116361', '0', '0', '0', '1', '1', '1', '1', '');


UPDATE creature_template SET lootid = 78714 WHERE entry = 78714 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '78714';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78714', '0', '78714', '100', '0', '1', '0', '2', '2', ''),
('78714', '118344', '0', '0', '0', '1', '0', '1', '1', ''),
('78714', '118345', '0', '0', '0', '1', '0', '1', '1', ''),
('78714', '118346', '0', '0', '0', '1', '0', '1', '1', ''),
('78714', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('78714', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('78714', '118632', '0', '0', '0', '1', '0', '1', '1', ''),
('78714', '138807', '0', '6.662824', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '78714';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78714', '113591', '0', '9.282806', '0', '1', '1', '1', '1', ''),
('78714', '113592', '0', '12', '0', '1', '1', '1', '1', ''),
('78714', '113593', '0', '9.154329', '0', '1', '1', '1', '1', ''),
('78714', '113595', '0', '9.662236', '0', '1', '1', '1', '1', ''),
('78714', '113596', '0', '12.76851', '0', '1', '1', '1', '1', ''),
('78714', '113598', '0', '5.839127', '0', '1', '1', '1', '1', ''),
('78714', '113599', '0', '11.5894', '0', '1', '1', '1', '1', ''),
('78714', '113600', '0', '12.70607', '0', '1', '1', '1', '1', ''),
('78714', '113601', '0', '11.72508', '0', '1', '1', '1', '1', ''),
('78714', '113602', '0', '12.67846', '0', '1', '1', '1', '1', ''),
('78714', '113604', '0', '12', '0', '1', '1', '1', '1', ''),
('78714', '113605', '0', '6.536748', '0', '1', '1', '1', '1', ''),
('78714', '116003', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116030', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116205', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116236', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116282', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116289', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116298', '0', '0', '0', '1', '1', '1', '1', ''),
('78714', '116360', '0', '0', '0', '1', '1', '1', '1', '');


UPDATE creature_template SET lootid = 78238 WHERE entry = 78238 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '78238';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78238', '0', '78238', '100', '0', '1', '0', '2', '2', ''),
('78238', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('78238', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('78238', '118632', '0', '0', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '78238';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78238', '113666', '0', '1.715272', '0', '1', '1', '1', '1', ''),
('78238', '113667', '0', '2.858787', '0', '1', '1', '1', '1', ''),
('78238', '113826', '0', '3', '0', '1', '1', '1', '1', ''),
('78238', '113827', '0', '2.876766', '0', '1', '1', '1', '1', ''),
('78238', '113828', '0', '3.373009', '0', '1', '1', '1', '1', ''),
('78238', '113829', '0', '9.27038', '0', '1', '1', '1', '1', ''),
('78238', '113830', '0', '8.475674', '0', '1', '1', '1', '1', ''),
('78238', '113831', '0', '21.23054', '0', '1', '1', '1', '1', ''),
('78238', '113832', '0', '23.89155', '0', '1', '1', '1', '1', ''),
('78238', '113833', '0', '19.43256', '0', '1', '1', '1', '1', ''),
('78238', '113834', '0', '10.56133', '0', '1', '1', '1', '1', ''),
('78238', '113835', '0', '19.78496', '0', '1', '1', '1', '1', ''),
('78238', '115997', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116025', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116211', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116234', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116283', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116286', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116364', '0', '0', '0', '1', '1', '1', '1', ''),
('78238', '116365', '0', '0', '0', '1', '1', '1', '1', '');


UPDATE creature_template SET lootid = 79015 WHERE entry = 79015 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '79015';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('79015', '0', '79015', '100', '0', '1', '0', '2', '2', ''),
('79015', '117491', '0', '0.3362152', '0', '1', '0', '1', '3', ''),
('79015', '118344', '0', '0', '0', '1', '0', '1', '1', ''),
('79015', '118345', '0', '0', '0', '1', '0', '1', '1', ''),
('79015', '118346', '0', '0', '0', '1', '0', '1', '1', ''),
('79015', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('79015', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('79015', '118632', '0', '0', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '79015';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('79015', '113836', '0', '4.836642', '0', '1', '1', '1', '1', ''),
('79015', '113837', '0', '6.151564', '0', '1', '1', '1', '1', ''),
('79015', '113838', '0', '6.351183', '0', '1', '1', '1', '1', ''),
('79015', '113839', '0', '7', '0', '1', '1', '1', '1', ''),
('79015', '113840', '0', '7.574537', '0', '1', '1', '1', '1', ''),
('79015', '113841', '0', '5.658926', '0', '1', '1', '1', '1', ''),
('79015', '113842', '0', '4', '0', '1', '1', '1', '1', ''),
('79015', '113843', '0', '8.211853', '0', '1', '1', '1', '1', ''),
('79015', '113844', '0', '11.84345', '0', '1', '1', '1', '1', ''),
('79015', '113845', '0', '13.47154', '0', '1', '1', '1', '1', ''),
('79015', '113846', '0', '7', '0', '1', '1', '1', '1', ''),
('79015', '113847', '0', '15.70581', '0', '1', '1', '1', '1', ''),
('79015', '115996', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116029', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116212', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116231', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116284', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116293', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116295', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116366', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116367', '0', '0', '0', '1', '1', '1', '1', ''),
('79015', '116368', '0', '0', '0', '1', '1', '1', '1', '');


UPDATE creature_template SET lootid = 78948 WHERE entry = 78948 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '78948';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78948', '107471', '0', '0.4304161', '0', '1', '0', '1', '1', ''),
('78948', '0', '78948', '100', '0', '1', '0', '2', '2', ''),
('78948', '118344', '0', '0', '0', '1', '0', '1', '1', ''),
('78948', '118345', '0', '0', '0', '1', '0', '1', '1', ''),
('78948', '118346', '0', '0', '0', '1', '0', '1', '1', ''),
('78948', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('78948', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('78948', '118632', '0', '0', '0', '1', '0', '1', '1', ''),
('78948', '138835', '0', '0.2955753', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '78948';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78948', '113639', '0', '10.58737', '0', '1', '1', '1', '1', ''),
('78948', '113640', '0', '10.41625', '0', '1', '1', '1', '1', ''),
('78948', '113641', '0', '8', '0', '1', '1', '1', '1', ''),
('78948', '113642', '0', '9.14061', '0', '1', '1', '1', '1', ''),
('78948', '113643', '0', '5.695935', '0', '1', '1', '1', '1', ''),
('78948', '113644', '0', '8.576127', '0', '1', '1', '1', '1', ''),
('78948', '113645', '0', '6', '0', '1', '1', '1', '1', ''),
('78948', '113646', '0', '4.215837', '0', '1', '1', '1', '1', ''),
('78948', '113647', '0', '8.224993', '0', '1', '1', '1', '1', ''),
('78948', '113648', '0', '8.720581', '0', '1', '1', '1', '1', ''),
('78948', '113649', '0', '11', '0', '1', '1', '1', '1', ''),
('78948', '113650', '0', '5', '0', '1', '1', '1', '1', ''),
('78948', '113651', '0', '13.55868', '0', '1', '1', '1', '1', ''),
('78948', '116000', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116032', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116210', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116237', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116279', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116285', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116292', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116362', '0', '0', '0', '1', '1', '1', '1', ''),
('78948', '116363', '0', '0', '0', '1', '1', '1', '1', '');


UPDATE creature_template SET lootid = 78491 WHERE entry = 78491 AND lootid = 0;
DELETE FROM `creature_loot_template` WHERE `entry` = '78491';
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78491', '0', '78491', '100', '0', '1', '0', '2', '2', ''),
('78491', '118344', '0', '0', '0', '1', '0', '1', '1', ''),
('78491', '118345', '0', '0', '0', '1', '0', '1', '1', ''),
('78491', '118346', '0', '0', '0', '1', '0', '1', '1', ''),
('78491', '118630', '0', '0', '0', '1', '0', '1', '1', ''),
('78491', '118631', '0', '0', '0', '1', '0', '1', '1', ''),
('78491', '118632', '0', '0', '0', '1', '0', '1', '1', '');


DELETE FROM `reference_loot_template` WHERE `entry` = '78491';
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
('78491', '113652', '0', '6', '0', '1', '1', '1', '1', ''),
('78491', '113653', '0', '5.257122', '0', '1', '1', '1', '1', ''),
('78491', '113654', '0', '8.27197', '0', '1', '1', '1', '1', ''),
('78491', '113655', '0', '11.15252', '0', '1', '1', '1', '1', ''),
('78491', '113656', '0', '8.339872', '0', '1', '1', '1', '1', ''),
('78491', '113657', '0', '7.795147', '0', '1', '1', '1', '1', ''),
('78491', '113658', '0', '5.513641', '0', '1', '1', '1', '1', ''),
('78491', '113659', '0', '10.7602', '0', '1', '1', '1', '1', ''),
('78491', '113660', '0', '9.894073', '0', '1', '1', '1', '1', ''),
('78491', '113661', '0', '11', '0', '1', '1', '1', '1', ''),
('78491', '113662', '0', '7.801183', '0', '1', '1', '1', '1', ''),
('78491', '113664', '0', '11', '0', '1', '1', '1', '1', ''),
('78491', '115999', '0', '0', '0', '1', '1', '1', '1', ''),
('78491', '116028', '0', '0', '0', '1', '1', '1', '1', ''),
('78491', '116208', '0', '0', '0', '1', '1', '1', '1', ''),
('78491', '116233', '0', '0', '0', '1', '1', '1', '1', ''),
('78491', '116288', '0', '0', '0', '1', '1', '1', '1', ''),
('78491', '116291', '0', '0', '0', '1', '1', '1', '1', ''),
('78491', '116294', '0', '0', '0', '1', '1', '1', '1', '');
