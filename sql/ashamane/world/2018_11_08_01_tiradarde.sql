UPDATE creature_template SET scriptname = "npc_anduin_tides_of_war" WHERE entry = 120756;
UPDATE creature_template SET scriptname = "npc_jaina_tides_of_war" WHERE entry = 120590;
UPDATE `conversation_template` SET `ScriptName` = 'conversation_tides_of_war' WHERE `Id` IN (4857, 8709);

UPDATE creature_template SET gossip_menu_id = 22328 WHERE entry = 120590;
REPLACE INTO `gossip_menu` VALUES (22328, 34271, 28153);
REPLACE INTO `gossip_menu_option` VALUES (22328, 0, 0, "I'm ready to set sail!", 0, 1, 1, 28153);
UPDATE creature SET npcflag = 1 WHERE guid = 280000120;

UPDATE creature_template SET scriptname = "npc_jaina_boralus_intro" WHERE entry = 120922;
UPDATE scene_template SET ScriptName = "scene_jaina_to_proudmoore_keep" where SceneId = 1954;
UPDATE scene_template SET ScriptName = "scene_flynn_jailbreak" where SceneId = 1735;
UPDATE creature_template SET scriptname = "npc_flynn_fairwind" WHERE entry = 121239;
UPDATE creature_template SET scriptname = "npc_flynn_fairwind_follower" WHERE entry = 124311;
UPDATE gameobject_template SET scriptname = "go_toldagor_cell_block_lever" WHERE entry = 271938;
UPDATE `creature_template` SET `flags_extra` = 128, `ScriptName` = 'npc_tol_dagor_enter_sewer_credit' WHERE (entry = 134922);

UPDATE `creature_addon` SET `aiAnimKit` = 14225 WHERE `guid` = 210303366;

UPDATE quest_template_addon SET scriptname = "quest_out_like_flynn" WHERE Id = 47098;

REPLACE INTO npc_spellclick_spells VALUES
(121239, 264918, 1, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 246555;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 1, 246555, 31, 5, 124022); 

DELETE FROM spell_script_names WHERE scriptname IN ("aura_tol_dagor_intro_prisoner", "aura_stormwind_to_harbor_teleport");
INSERT INTO spell_script_names VALUES
(240876, "aura_stormwind_to_harbor_teleport"),
(272512, "aura_tol_dagor_intro_prisoner");

UPDATE `npc_spellclick_spells` SET `cast_flags` = '1' WHERE `npc_entry` = '124030' AND `spell_id` = '247045';
UPDATE `creature_template` SET `InhabitType` = 4 WHERE entry IN (124030, 139522);

UPDATE `conversation_template` SET `ScriptName` = 'conversation_tol_dagor_escape' WHERE `Id` IN (5336, 5340);
UPDATE `conversation_template` SET `ScriptName` = 'conversation_tol_dagor_inmate' WHERE `Id` IN (8330, 8333, 8334);
UPDATE `creature_template` SET `InhabitType` = 4, `VehicleId` = '5474' WHERE `entry` = '124357'; 

DELETE FROM `gameobject` WHERE `guid` IN (210406721, 210406722);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(210406721, 289321, 0, 1519, 6292, '0', '11925', 0, -8371.054, 242.3681, 155.3472, 2.24604, 0, 0, 0.901412, 0.4329623, 120, 255, 1, 27404), -- Alliance Map Table (Area: Stormwind Keep - Difficulty: 0)
(210406722, 281874, 0, 1519, 6292, '0', '11825', 0, -8245.816, 1331.063, -3.089088, 4.750497, 0, 0, -0.6935062, 0.7204506, 120, 255, 1, 27404); -- Jaina's Ship (Area: Stormwind Keep - Difficulty: 0)

DELETE FROM `creature` WHERE `guid` BETWEEN 280000112 AND 280000123;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(280000112, 139645, 0, 1519, 6292, '0', '11925', 0, 0, 0, -8373.802, 245.4097, 156.8826, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Vision of Sailor's Memory (Area: Stormwind Keep - Difficulty: 0)
(280000113, 43845,  0, 1519, 6292, '0', '11925', 0, 0, 0, -8411.259, 219.3385, 155.4305, 3.967043, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Malfurion Stormrage (Area: Stormwind Keep - Difficulty: 0)
(280000114, 120597, 0, 1519, 6292, '0', '11925', 0, 0, 0, -8382.04, 231.9323, 155.4305, 0.9864509, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Commander Lorna Crowley (Area: Stormwind Keep - Difficulty: 0)
(280000115, 7999,   0, 1519, 6292, '0', '11925', 0, 0, 0, -8416.451, 220.0833, 155.4305, 5.23185, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Tyrande Whisperwind (Area: Stormwind Keep - Difficulty: 0)
(280000116, 139642, 0, 1519, 6292, '0', '11925', 0, 0, 0, -8374.014, 245.4497, 155.4305, 5.645445, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- 7th Legion Sailor (Area: Stormwind Keep - Difficulty: 0)
(280000117, 144378, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8264.268, 1338.944, 18.76146, 3.158645, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Alliance Sailor (Area: Stormwind Harbor - Difficulty: 0)
(280000118, 144378, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8235.139, 1334.891, 18.78497, 1.481358, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Alliance Sailor (Area: Stormwind Harbor - Difficulty: 0)
(280000119, 144378, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8234.069, 1337.019, 18.61984, 4.112025, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Alliance Sailor (Area: Stormwind Harbor - Difficulty: 0)
(280000120, 120590, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8281.764, 1326.863, 5.322724, 3.288784, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Lady Jaina Proudmoore (Area: Stormwind Harbor - Difficulty: 0)
(280000121, 144378, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8263.696, 1359.635, 18.8017, 1.417557, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Alliance Sailor (Area: Stormwind Harbor - Difficulty: 0)
(280000122, 144378, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8237.676, 1369.901, 23.27885, 3.236135, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404), -- Alliance Sailor (Area: Stormwind Harbor - Difficulty: 0)
(280000123, 144378, 0, 1519, 4411, '0', '11825', 0, 0, 0, -8240, 1369.356, 23.27885, 0.6054686, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27404); -- Alliance Sailor (Area: Stormwind Harbor - Difficulty: 0)

UPDATE conversation_template SET LastLineEndTime = 35185 WHERE Id = 5336;
UPDATE conversation_template SET LastLineEndTime = 15326 WHERE Id = 5340;

DELETE FROM `conversation_actors` WHERE ConversationId IN (4857, 4896, 8709, 8334, 7653, 5462, 8062, 8356, 8741, 8742);
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorGuid`, `Idx`, `VerifiedBuild`) VALUES
(4857, 280000109, 1, 27404), -- Full: 0x203CE00000885D000009A5000000A939 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: 139636 (Master Mathias Shaw) Low: 43321
(4857, 280000110, 2, 27404), -- Full: 0x203CE0000075F5000009A5000000A938 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: Genn Greymane Low: 43320
(4857, 280000111, 0, 27404), -- Full: 0x203CE0000075ED000009A5000000A938 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: Anduin Wrynn Low: 43320
(4896, 280000110, 2, 27404), -- Full: 0x203CE0000075F5000009A5000000A938 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: Genn Greymane Low: 43320
(4896, 280000111, 1, 27404), -- Full: 0x203CE0000075ED000009A5000000A938 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: Anduin Wrynn Low: 43320
(4896, 280000111, 0, 27404),
(8709, 280000111, 0, 27404), -- Full: 0x203CE0000075ED000009A5000000A938 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: Anduin Wrynn Low: 43320
(8709, 280000110, 2, 27404), -- Full: 0x203CE0000075F5000009A5000000A938 Creature/0 R3896/S2469 Map: Eastern Kingdoms Entry: Genn Greymane Low: 43320;

(8334, 210347835, 0, 27404), -- Full: 0x204240CD60797100006DC9000000A78F Creature/0 R4240/S28105 Map: Kul Tiras Entry: 124356 (Taelia) Low: 42895
-- (8334, UNKNOWN, 1, 27404), -- Full: 0x204240CD607965C0006DC9000003E89F Creature/0 R4240/S28105 Map: Kul Tiras Entry: 124311 (Tol Dagor Inmate) Low: 256159

-- "King greyman it is an honor"
(8062, 210347841, 0, 27404), -- Full: 0x203CD0CD60778080003183000003EECC Creature/0 R3892/S12675 Map: Kul Tiras Entry: Cyrus Crestfall Low: 257740
(8062, 210347835, 1, 27404), -- Full: 0x203CD0CD607664C000318300000316A7 Creature/0 R3892/S12675 Map: Kul Tiras Entry: Taelia Low: 202407

-- Cyrus story with wounded guy
(7653, 210347841, 1, 27404), -- Full: 0x203CD0CD60778080003183000003EF63 Creature/0 R3892/S12675 Map: Kul Tiras Entry: Cyrus Crestfall Low: 257891
(7653, 210334796, 0, 27404), -- Full: 0x203CD0CD6075F500003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Genn Greymane Low: 202398

(5462, 210347841, 0, 27404), -- Full: 0x0800040000000000FFFFFFFFFFFFFFFF Player/0 R1/S16777215 Map: Eastern Kingdoms Low: 1099511627775
(5462, 210347841, 1, 27404), -- Full: 0x203CD0CD60778080003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Cyrus Crestfall Low: 202398
(5462, 210304139, 2, 27404), -- Full: 0x203CD0CD607665C0003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Flynn Fairwind Low: 202398

-- "Situation report ready"
(8356, 210347841, 1, 27404), -- Full: 0x203CD0CD60778080003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Cyrus Crestfall Low: 202398
(8356, 210347835, 0, 27404), -- Full: 0x203CD0CD607664C000318300000316A7 Creature/0 R3892/S12675 Map: Kul Tiras Entry: Taelia Low: 202407

-- Flynn explain new ashvane weapon
(8741, 210347841, 1, 27404), -- Full: 0x203CD0CD60778080003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Cyrus Crestfall Low: 202398
(8741, 210304139, 2, 27404), -- Full: 0x203CD0CD607665C0003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Flynn Fairwind Low: 202398
(8741, 210347835, 0, 27404), -- Full: 0x203CD0CD607664C000318300000316A7 Creature/0 R3892/S12675 Map: Kul Tiras Entry: Taelia Low: 202407

-- Flynn  help our new ally
(8742, 210347841, 0, 27404), -- Full: 0x203CD0CD60778080003183000003169E Creature/0 R3892/S12675 Map: Kul Tiras Entry: Cyrus Crestfall Low: 202398
(8742, 210304139, 1, 27404), -- Full: 0x203CD0CD607665C0003183000003F242 Creature/0 R3892/S12675 Map: Kul Tiras Entry: Flynn Fairwind Low: 258626
(8742, 210347835, 2, 27404); -- Full: 0x203CD0CD607664C000318300000316A7 Creature/0 R3892/S12675 Map: Kul Tiras Entry: Taelia Low: 202407

UPDATE `quest_template_addon` SET `PrevQuestID` = '47099', `ExclusiveGroup` = '0' WHERE `id` = 46729;
UPDATE `quest_template_addon` SET `PrevQuestID` = '47098', `ExclusiveGroup` = '0' WHERE `id` = 47099;
UPDATE `quest_template_addon` SET `PrevQuestID` = '51341', `ExclusiveGroup` = '0' WHERE `id` = 47098;
UPDATE `quest_template_addon` SET `PrevQuestID` = '46728', `ExclusiveGroup` = '0' WHERE `id` = 51341;
UPDATE `quest_template_addon` SET `PrevQuestID` = '46727', `ExclusiveGroup` = '0' WHERE `id` = 46728;
UPDATE `quest_template_addon` SET `PrevQuestID` = '51403', `ExclusiveGroup` = '0' WHERE `id` = 46727;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = '0' WHERE `id` = 51403;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 124357;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
('124357', '46598', '1'); 

DELETE FROM creature WHERE guid IN (210303743, 210303744, 210303745, 210303746, 210303747);

UPDATE `vehicle_template_accessory` SET `seat_id` = '2' WHERE `entry` = '124357' AND `seat_id` = '1'; 

DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (124356, 124363);
INSERT INTO `creature_equip_template` (`CreatureID`, `ItemID1`, `VerifiedBuild`) VALUES
('124356', '155767', '28503'),
('124363', '155767', '28503'); 

UPDATE creature_template SET scriptname = "npc_tol_dagor_getaway_boat" WHERE entry = 124357;
UPDATE scene_template SET ScriptName = "scene_tol_dagor_getaway_boat" where SceneId = 1746;

UPDATE `conversation_template` SET `ScriptName` = 'conversation_boralus_get_your_bearings' WHERE `Id` IN (5360, 5362, 5365, 5366, 5375, 7605, 9556);

REPLACE INTO `creature_model_info` (`DisplayID`, `CombatReach`, `VerifiedBuild`) VALUES
('81516', '1', '28503');

UPDATE creature_template SET npcflag = 2, scriptname = "npc_taelia_get_your_bearings" WHERE entry = 124630;

DELETE FROM `creature_questender` WHERE (quest = 47099);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(124630, 47099);

DELETE FROM `creature_queststarter` WHERE (quest = 46729);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(124630, 46729);

REPLACE INTO `creature_summoner_entry` (`CreatureId`, `SummonerVisibleCreatureId`) VALUES
('124630', '138622');

DELETE FROM creature WHERE id IN (32639, 62821, 32638);
DELETE FROM creature WHERE guid IN (210304119, 210304120, 210304117, 210304118);

UPDATE creature_addon SET aiAnimKit = 13362 WHERE guid = 210304139;
