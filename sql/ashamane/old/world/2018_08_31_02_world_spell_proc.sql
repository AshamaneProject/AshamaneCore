DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 24 AND `SourceEntry` IN (202940, 202941);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES
(24, 202940, 1, 194223),
(24, 202941, 1, 194223);
