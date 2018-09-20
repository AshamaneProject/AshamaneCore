DROP TABLE IF EXISTS `creature_template_journal`;
CREATE TABLE `creature_template_journal`(
    `entry` INT(10) UNSIGNED NOT NULL,
    `JournalEncounterID` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`entry`)
); 
