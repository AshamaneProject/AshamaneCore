DELETE FROM instance_template WHERE `map` = 1904;
INSERT INTO instance_template VALUES
(1904, 0, "scenario_stormwind_extraction", 1, 0);

DELETE FROM scenarios WHERE `map` = 1904;
INSERT INTO scenarios VALUES
(1904, 12, 0, 1522);

UPDATE gossip_menu_option SET OptionType = 21 WHERE OptionIcon = 31;
UPDATE `creature_template` SET `npcflag` = 1 WHERE (entry = 144635);

DELETE FROM phase_area WHERE AreaId = 9553;
INSERT INTO phase_area VALUES
(9553, 169, "The Stormwind Extraction - Default phase"),
(9553, 11775, "The Stormwind Extraction - Fire phase");

UPDATE gameobject SET phaseId = 11775 WHERE map = 1904 AND id IN (282244, 282245, 282242, 282238, 282243, 282239, 282241, 282240);
UPDATE creature SET movementType = 0, spawnDist = 0 WHERE map = 1904;
DELETE FROM creature WHERE guid IN (280000688, 280000711);
DELETE FROM gameobject WHERE id = 281661;

UPDATE creature_addon SET aiAnimKit = 6059 WHERE guid = 280000383;
UPDATE creature_addon SET aiAnimKit = 4175 WHERE guid IN (280000370, 280000379, 280000380);
DELETE FROM creature WHERE id = 134094 AND map = 1904 AND guid IN (SELECT guid FROM creature_addon WHERE auras = "271187" OR auras = "263506");

UPDATE creature_template SET inhabitType = 4 WHERE entry = 134094;

DELETE FROM `conversation_actors` WHERE (`ConversationId`=8174 AND `Idx`=0) OR (`ConversationId`=8175 AND `Idx`=0) OR (`ConversationId`=6721 AND `Idx`=0) OR (`ConversationId`=6722 AND `Idx`=0) OR (`ConversationId`=6722 AND `Idx`=1) OR (`ConversationId`=7039 AND `Idx`=0) OR (`ConversationId`=7040 AND `Idx`=0) OR (`ConversationId`=7041 AND `Idx`=0) OR (`ConversationId`=7042 AND `Idx`=1) OR (`ConversationId`=7042 AND `Idx`=0) OR (`ConversationId`=7044 AND `Idx`=0) OR (`ConversationId`=7044 AND `Idx`=2) OR (`ConversationId`=7044 AND `Idx`=1) OR (`ConversationId`=7047 AND `Idx`=3) OR (`ConversationId`=7047 AND `Idx`=2) OR (`ConversationId`=7047 AND `Idx`=1) OR (`ConversationId`=7047 AND `Idx`=0) OR (`ConversationId`=7049 AND `ConversationActorId`=134163 AND `Idx`=0) OR (`ConversationId`=7052 AND `Idx`=0) OR (`ConversationId`=7052 AND `Idx`=2) OR (`ConversationId`=7052 AND `Idx`=1) OR (`ConversationId`=7055 AND `Idx`=0) OR (`ConversationId`=7055 AND `Idx`=1) OR (`ConversationId`=7058 AND `Idx`=3) OR (`ConversationId`=7058 AND `Idx`=2) OR (`ConversationId`=7058 AND `Idx`=1) OR (`ConversationId`=7058 AND `Idx`=0) OR (`ConversationId`=7088 AND `Idx`=1) OR (`ConversationId`=7088 AND `Idx`=0) OR (`ConversationId`=7089 AND `Idx`=0) OR (`ConversationId`=7091 AND `Idx`=1) OR (`ConversationId`=7091 AND `Idx`=0) OR (`ConversationId`=7092 AND `Idx`=0) OR (`ConversationId`=7092 AND `Idx`=1) OR (`ConversationId`=7093 AND `Idx`=0) OR (`ConversationId`=7094 AND `Idx`=1) OR (`ConversationId`=7094 AND `Idx`=0) OR (`ConversationId`=7095 AND `Idx`=2) OR (`ConversationId`=7095 AND `Idx`=1) OR (`ConversationId`=7095 AND `Idx`=0) OR (`ConversationId`=7109 AND `Idx`=1) OR (`ConversationId`=7109 AND `Idx`=0) OR (`ConversationId`=7110 AND `Idx`=1) OR (`ConversationId`=7110 AND `Idx`=0) OR (`ConversationId`=7112 AND `Idx`=0) OR (`ConversationId`=7113 AND `Idx`=1) OR (`ConversationId`=7113 AND `Idx`=0) OR (`ConversationId`=7114 AND `Idx`=1) OR (`ConversationId`=7114 AND `Idx`=0) OR (`ConversationId`=7115 AND `Idx`=0) OR (`ConversationId`=7115 AND `Idx`=1) OR (`ConversationId`=7138 AND `Idx`=0) OR (`ConversationId`=7139 AND `Idx`=1) OR (`ConversationId`=7139 AND `Idx`=0) OR (`ConversationId`=7142 AND `Idx`=1) OR (`ConversationId`=7142 AND `Idx`=0) OR (`ConversationId`=7143 AND `Idx`=3) OR (`ConversationId`=7143 AND `Idx`=2) OR (`ConversationId`=7143 AND `Idx`=1) OR (`ConversationId`=7143 AND `Idx`=0) OR (`ConversationId`=7144 AND `Idx`=1) OR (`ConversationId`=7144 AND `Idx`=0) OR (`ConversationId`=7145 AND `Idx`=0) OR (`ConversationId`=7145 AND `Idx`=1) OR (`ConversationId`=7147 AND `Idx`=1) OR (`ConversationId`=7147 AND `Idx`=2) OR (`ConversationId`=7147 AND `Idx`=3) OR (`ConversationId`=7147 AND `Idx`=0) OR (`ConversationId`=7170 AND `Idx`=2) OR (`ConversationId`=7170 AND `Idx`=1) OR (`ConversationId`=7170 AND `Idx`=0) OR (`ConversationId`=8174 AND `ConversationActorId`=134201 AND `Idx`=0) OR (`ConversationId`=8175 AND `ConversationActorId`=134201 AND `Idx`=0) OR (`ConversationId`=8177 AND `Idx`=0) OR (`ConversationId`=8178 AND `Idx`=1) OR (`ConversationId`=8178 AND `Idx`=0) OR (`ConversationId`=8399 AND `Idx`=0) OR (`ConversationId`=8689 AND `Idx`=0) OR (`ConversationId`=9001 AND `Idx`=0) OR (`ConversationId`=9435 AND `Idx`=0) OR (`ConversationId`=9436 AND `Idx`=0) OR (`ConversationId`=9437 AND `Idx`=0) OR (`ConversationId`=9438 AND `Idx`=0) OR (`ConversationId`=9570 AND `Idx`=0) OR (`ConversationId`=9683 AND `Idx`=0);
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `Idx`, `VerifiedBuild`) VALUES
(7049, 134163, 0, 28153),
(8174, 134201, 0, 28153),
(8175, 134201, 0, 28153);

INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorGuid`, `Idx`, `VerifiedBuild`) VALUES
-- (7170, UNKNOWN, 2, 28153), -- Full: 0x2016FC002084094000755B0000720B37 Creature/0 R1471/S30043 Map: Kalimdor Entry: 135205 -- (Nathanos Blightcaller) Low: 7473975
-- (7170, UNKNOWN, 1, 28153), -- Full: 0x2016FC002084098000755B0000720B37 Creature/0 R1471/S30043 Map: Kalimdor Entry: 135206 -- (Rokhan) Low: 7473975
-- (7170, UNKNOWN, 0, 28153), -- Full: 0x2016FC00208409C000755B0000720B37 Creature/0 R1471/S30043 Map: Kalimdor Entry: 135207 -- (First Arcanist Thalyssra) Low: 7473975
-- (8399, UNKNOWN, 0, 28153), -- Full: 0x2016FC002084094000755B0000720B64 Creature/0 R1471/S30043 Map: Kalimdor Entry: 135205 -- (Nathanos Blightcaller) Low: 7474020

-- Nathanos arrival speech
(7039, 280000317, 0, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720BAC Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7474092
(7040, 280000317, 0, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720BAC Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7474092
(7041, 280000317, 0, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720BAC Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7474092

-- At prison entrance, rokhan go ahead
(7042, 280000373, 1, 28153), -- Full: 0x2016FCEE0082E54000014E0000720BFD Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474173
(7042, 280000372, 0, 28153), -- Full: 0x2016FCEE0082E58000014E0000720BFD Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474173

-- Saurfang dialog
(7044, 280000345, 0, 28153), -- Full: 0x2016FCEE0082FA0000014E0000720BFE Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: 134120 -- (High Overlord Saurfang) Low: 7474174
(7044, 280000373, 2, 28153), -- Full: 0x2016FCEE0082E54000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474347
(7044, 280000372, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474347

-- Nullification field
(7055, 280000317, 0, 28153), -- Full: 0x2016FCEE0082E58000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474347
(7055, 280000319, 1, 28153), -- Full: 0x2016FCEE0082E54000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474347

-- After prison escape
(7088, 280000317, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474643
(7088, 280000319, 0, 28153), -- Full: 0x2016FCEE0082E54000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474643

-- At genn attack
(7109, 280000317, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474869
(7109, 280000319, 0, 28153); -- Full: 0x2016FCEE0082E54000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474869


-- (7047, UNKNOWN, 3, 28153), -- Full: 0x2016FCEE0082F34000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474333
-- (7047, UNKNOWN, 2, 28153), -- Full: 0x2016FCEE0082E54000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474347
-- (7047, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474347
-- (7047, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F30000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474333
-- (7052, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F30000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474333
-- (7052, UNKNOWN, 2, 28153), -- Full: 0x2016FCEE0082F34000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474333
-- (7052, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474347
-- (7058, UNKNOWN, 3, 28153), -- Full: 0x2016FCEE0082F34000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474333
-- (7058, UNKNOWN, 2, 28153), -- Full: 0x2016FCEE0082E54000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474347
-- (7058, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720CAB Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474347
-- (7058, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F30000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474333
-- (7089, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0086A90000014E0000720DFF Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: 137892 -- (Crier Goodman) Low: 7474687
-- (7091, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082F30000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474643
-- (7091, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E58000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474643
-- (7092, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F34000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474643
-- (7092, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474643
-- (7093, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE00830E8000014E0000720E49 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: 134202 -- (Anduin Wrynn) Low: 7474761
-- (7094, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082F34000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474643
-- (7094, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E58000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474643
-- (7095, UNKNOWN, 2, 28153), -- Full: 0x2016FCEE0082F34000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474643
-- (7095, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082F30000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474643
-- (7095, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E54000014E0000720DD3 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7474643
-- (7110, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474869
-- (7110, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE00830E0000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Genn Greymane Low: 7474869
-- (7112, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE00830E4000014E0000720F35 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Lady Jaina Proudmoore Low: 7474997
-- (7113, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082F30000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474869
-- (7113, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F34000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474869
-- (7114, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082F30000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7474869
-- (7114, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F34000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474869
-- (7115, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720EB2 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7474866
-- (7115, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720EB5 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7474869
-- (7138, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (7139, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (7139, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E54000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7475104
-- (7142, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (7142, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E54000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7475104
-- (7143, UNKNOWN, 3, 28153), -- Full: 0x2016FCEE0082F30000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7475104
-- (7143, UNKNOWN, 2, 28153), -- Full: 0x2016FCEE0082E58000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7475104
-- (7143, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E50000014E0000721092 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: 134036 -- (Lasan Skyhorn) Low: 7475346
-- (7143, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F34000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7475104
-- (7144, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (7144, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E54000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: First Arcanist Thalyssra Low: 7475104
-- (7145, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE00830E4000014E00007210BE Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Lady Jaina Proudmoore Low: 7475390
-- (7145, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (7147, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082F34000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7475104
-- (7147, UNKNOWN, 2, 28153), -- Full: 0x2016FCEE0082F30000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7475104
-- (7147, UNKNOWN, 3, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (7147, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E58000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7475104
-- (8177, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F30000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Princess Talanji Low: 7475104
-- (8178, UNKNOWN, 1, 28153), -- Full: 0x2016FCEE0082E58000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Rokhan Low: 7475104
-- (8178, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082E5C000014E0000720FA0 Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Nathanos Blightcaller Low: 7475104
-- (9570, UNKNOWN, 0, 28153), -- Full: 0x2016FC002088E40000755B000072001D Creature/0 R1471/S30043 Map: Kalimdor Entry: 140176 -- (Nathanos Blightcaller) Low: 7471133
-- (9683, UNKNOWN, 0, 28153), -- Full: 0x2016FCEE0082F34000014E0000720C9D Creature/0 R1471/S334 Map: Stormwind Escape from Stockades Entry: Zul the Prophet Low: 7474333

-- (6721, UNKNOWN, 0, 28153), -- Full: 0x204234CD40818D400077A60000721226 Creature/0 R4237/S30630 Map: Zandalar Entry: Princess Talanji Low: 7475750
-- (6722, UNKNOWN, 0, 28153), -- Full: 0x204234CD4077C9400077A600007206F4 Creature/0 R4237/S30630 Map: Zandalar Entry: General Jakra'zet Low: 7472884
-- (6722, UNKNOWN, 1, 28153); -- Full: 0x204234CD40818D400077A60000721226 Creature/0 R4237/S30630 Map: Zandalar Entry: Princess Talanji Low: 7475750

DELETE FROM creature WHERE id = 134091 AND position_z > 46;
DELETE FROM creature WHERE map = 1904 AND id IN (134038, 134037, 134092, 134093);
DELETE FROM `creature_summon_groups` WHERE (summonerId = 134120 AND summonerType = 0) OR (summonerId = 1904 AND summonerType = 2);
INSERT INTO `creature_summon_groups` VALUES
-- Rokhan & Thalyssra at beginning
(1904,  2, 10,  134038, -8689.73,   897.597,    93.1204,    1.36126,    8,  0),
(1904,  2, 10,  134037, -8688.62,   896.144,    93.8165,    0.77452,    8,  0),

-- Talanji & Zul in prison
(1904,  2, 11,  134092, -8751.38,   895.338,    52.9426,    4.07637,    8,  0),
(1904,  2, 11,  134093, -8746.82,   894.208, 	52.8987,    5.35803,    8,  0),

-- Rokhan & Thalyssra inside prison
(1904,  2, 20,  134038, -8718.78,   1000.06,    45.482,     3.25104,    8,  0),
(1904,  2, 20,  134037, -8716.91,   1002.92,    45.482,     3.21722,    8,  0),

-- Rokhan & Thalyssra after saurfang
(1904,  2, 30,  134038, -8687.52,   903.445,    53.8153,    3.80015,    8,  0),
(1904,  2, 30,  134037, -8691.53,   908.429,    53.8153,    4.41243,    8,  0),

-- 7th Legion battlemage after Talanji & Zul freed
(1904,  2, 31,  134091, -8691.55,   891.026,    53.8153,    2.28253,    6,  5000),
(1904,  2, 31,  134091, -8704.78,   907.356,    53.8153,    5.36426,    6,  5000),
(1904,  2, 31,  134091, -8691.04,   904.984,    53.8153,    3.75466,    6,  5000),
(1904,  2, 31,  134091, -8741.61,   865.161,    53.8153,    0.67442,    6,  5000),
(1904,  2, 31,  134091, -8742.98,   866.946,    53.8153,    0.67442,    6,  5000),
(1904,  2, 31,  134091, -8740.20,   863.165,    53.8153,    0.67442,    6,  5000),

-- Rokhan & Thalyssra & Talanji & Zul outside of prison
(1904,  2, 40,  134038, -8535.25,   486.085,    101.567,    2.00541,    8,  0),
(1904,  2, 40,  134037, -8533.11,   489.399,    101.172,    2.29067,    8,  0),
(1904,  2, 40,  134092, -8537.86,   486.47,     101.176,    1.82384,    8,  0),
(1904,  2, 40,  134093, -8533.56,   483.793, 	102.027,    2.04008,    8,  0),

-- Rokhan & Thalyssra & Talanji & Zul at cathedral place
(1904,  2, 50,  134038, -8658.96,   746.929,    96.9081,    3.8786,     8,  0),
(1904,  2, 50,  134037, -8655.75,   749.967,    96.9362,    3.8846,     8,  0),
(1904,  2, 50,  134092, -8653.04,   746.418,    96.9171,    5.4403,     8,  0),
(1904,  2, 50,  134093, -8658.19,   753.052,    97.0275,    2.4085,     8,  0),

-- Everybody near the stormwind harbor
(1904,  2, 60,  134038, -8493.51,   931.075,    97.4637,    1.85595,    8,  0),
(1904,  2, 60,  134037, -8495.97,   930.771,    97.5362,    1.02702,    8,  0),
(1904,  2, 60,  134092, -8491.81,   932.398,    97.4484,    2.68383,    8,  0),
(1904,  2, 60,  134093, -8490.09,   933.602,    97.4276,    3.14107,    8,  0);

UPDATE gameobject_template SET scriptname = "go_se_sewer_access_portal" WHERE entry = 281484;

UPDATE `creature_template` SET `unit_flags` = 33024 WHERE entry IN (134037, 134038);

INSERT INTO creature_formations (leaderGUID, memberGUID) VALUES
(280000375, 280000375),
(280000375, 280000381);
