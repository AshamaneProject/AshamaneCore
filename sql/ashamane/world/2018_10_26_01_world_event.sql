-- Goblin that normally appear just during winter veil
DELETE FROM `game_event_creature` WHERE `eventEntry` = 2 AND `guid` = 20549314;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(2, 20549314);
