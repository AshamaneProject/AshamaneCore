DELETE FROM gameobject_addon WHERE `guid` NOT IN (SELECT `guid` FROM gameobject);
DELETE FROM creature_addon WHERE guid NOT IN (SELECT guid FROM creature);

DELETE FROM pool_template WHERE entry IN (2012,4305,4304,4303);
INSERT INTO `pool_template`(`entry`, `max_limit`, `description`) VALUES
(2012, 10, 'Master Mineral Pool - Eversong Woods'),
(4305, 1, 'Wailing Caverns Large Battered Chest Mother pool'),
(4304, 1, 'Wailing Caverns Liferoot Mother pool'),
(4303, 1, 'Wailing Caverns Tin / Silver Mother pool');

DELETE FROM `game_event_gameobject` WHERE guid NOT IN (SELECT guid FROM gameobject);