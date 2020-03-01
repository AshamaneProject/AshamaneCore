UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE  `id`=34281;

DELETE FROM `game_event_creature` WHERE `guid` IN (180928,192660,215380,238114,265026,265027,276778);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES 
(10, 180928),
(10, 192660),
(10, 215380),
(10, 238114),
(10, 265026),
(10, 265027),
(10, 276778);

