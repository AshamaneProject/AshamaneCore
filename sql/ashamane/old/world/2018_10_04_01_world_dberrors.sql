-- Table 'creature_loot_template' Entry X isn't creature entry and not referenced from loot, and thus useless.
DELETE FROM creature_loot_template WHERE entry IN (90997,91794,110321,111632,112153,114314,114539,114542,114544,114637,114792,114914,115004,115006,115019,115115,115172,116025,116205,116281,116955,116981,117021,117049,117056,117955,118016,118782,118783,118980,119185,119189,120789,140608,140686,140700,140735,140736,141366,142673,142678,143674,143907);

-- Table 'gameobject_loot_template' Entry X does not exist but it is used by Gameobject Y
-- Table 'gameobject_loot_template' Entry X isn't gameobject entry and not referenced from loot, and thus useless.
DELETE FROM gameobject_loot_template WHERE entry IN (30894,1416,27287,28398,27805,27800,28225,28415,28420,1619,195201,201974,201977,202351,202552,202553,202554,202574,202607,202608,204360,242636,242637,242638,242639,246519,246710,248093,249729);
INSERT INTO `gameobject_loot_template`(`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30894, 58934, 0, 100, 1, 1, 0, 1, 2, NULL),
(1416, 2449, 0, 100, 0, 1, 0, 1, 3, NULL),
(27287, 46828, 0, 100, 1, 1, 0, 1, 1, NULL),
(28398, 52484, 0, 100, 1, 1, 0, 1, 1, NULL),
(27805, 50261, 0, 100, 1, 1, 0, 1, 1, NULL),
(27800, 50239, 0, 100, 1, 1, 0, 1, 1, NULL),
(28225, 52024, 0, 100, 1, 1, 0, 1, 1, NULL),
(28415, 52481, 0, 100, 1, 1, 0, 1, 1, NULL),
(28420, 52530, 0, 100, 1, 1, 0, 1, 1, NULL);