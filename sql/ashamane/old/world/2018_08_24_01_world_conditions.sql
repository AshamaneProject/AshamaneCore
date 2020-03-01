DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (78499, 214482)) OR (`SourceTypeOrReferenceId` = 17 AND `SourceEntry` IN (89557));
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 1, 78499, 1, 31, 0, 3, 41924),
(17, 0, 89557, 1, 31, 0, 3, 48197),
(13, 1, 214482, 1, 31, 0, 3, 107962),
(13, 1, 214482, 2, 31, 0, 3, 107963),
(13, 1, 214482, 3, 31, 0, 3, 107961),
(13, 1, 214482, 4, 31, 0, 3, 107964);
