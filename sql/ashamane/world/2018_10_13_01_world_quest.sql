DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (78499, 69855);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 1, 78499, 2, 31, 3, 41902),
(13, 1, 78499, 3, 31, 3, 42003),

(13, 1, 69855, 2, 31, 3, 37080);
