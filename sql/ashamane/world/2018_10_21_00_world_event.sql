DROP TABLE IF EXISTS `game_event_spell_area`;
CREATE TABLE `game_event_spell_area`(
    `eventEntry` TINYINT(3) UNSIGNED NOT NULL,
    `areaId` INT(8) UNSIGNED NOT NULL,
    `spellId` INT(8) UNSIGNED NOT NULL,
    PRIMARY KEY (`eventEntry`, `areaId`, `spellId`)
); 
