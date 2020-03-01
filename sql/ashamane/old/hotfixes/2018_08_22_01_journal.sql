DROP TABLE IF EXISTS `journal_encounter`;
CREATE TABLE `journal_encounter`(
    `ID` INT(10) UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `Description` TEXT NOT NULL,
    `Map_1` FLOAT NOT NULL,
    `Map_2` FLOAT NOT NULL,
    `DungeonMapID` SMALLINT(5) UNSIGNED NOT NULL,
    `WorldMapAreaID` SMALLINT(5) UNSIGNED NOT NULL,
    `FirstSectionID` SMALLINT(5) UNSIGNED NOT NULL,
    `JournalInstanceID` SMALLINT(5) UNSIGNED NOT NULL,
    `DifficultyMask` TINYINT(3) UNSIGNED NOT NULL,
    `Flags` TINYINT(3) UNSIGNED NOT NULL,
    `OrderIndex` INT(10) UNSIGNED NOT NULL,
    `MapDisplayConditionID` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `journal_encounter_locale`;
CREATE TABLE `journal_encounter_locale`(
    `ID` INT NOT NULL,
    `locale` VARCHAR(2) NOT NULL,
    `Name_lang` TEXT NOT NULL,
    `Description_lang` TEXT NOT NULL,
    PRIMARY KEY (`ID`, `locale`)
);

DROP TABLE IF EXISTS `journal_encounter_item`;
CREATE TABLE `journal_encounter_item`(
    `ItemID` INT(10) UNSIGNED NOT NULL,
    `JournalEncounterID` SMALLINT(5) UNSIGNED NOT NULL,
    `DifficultyMask` TINYINT(3) UNSIGNED NOT NULL,
    `FactionMask` TINYINT(3) UNSIGNED NOT NULL,
    `Flags` TINYINT(3) UNSIGNED NOT NULL,
    `ID` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `journal_instance`;
CREATE TABLE `journal_instance`(
    `Name` TEXT NOT NULL,
    `Description` TEXT NOT NULL,
    `ButtonFileDataID` INT(10) UNSIGNED NOT NULL,
    `ButtonSmallFileDataID` INT(10) UNSIGNED NOT NULL,
    `BackgroundFileDataID` INT(10) UNSIGNED NOT NULL,
    `LoreFileDataID` INT(10) UNSIGNED NOT NULL,
    `MapID` SMALLINT(5) UNSIGNED NOT NULL,
    `AreaID` SMALLINT(5) UNSIGNED NOT NULL,
    `OrderIndex` TINYINT(3) UNSIGNED NOT NULL,
    `Flags` TINYINT(3) UNSIGNED NOT NULL,
    `ID` INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (`ID`)
);

DROP TABLE IF EXISTS `journal_instance_locale`;
CREATE TABLE `journal_instance_locale`(
    `ID` INT NOT NULL,
    `locale` VARCHAR(2) NOT NULL,
    `Name_lang` TEXT NOT NULL,
    `Description_lang` TEXT NOT NULL,
    PRIMARY KEY (`ID`, `locale`)
);
