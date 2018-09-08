/*Areatrigger*/
DELETE FROM `spell_areatrigger` WHERE (`SpellMiscId`) IN ('9769');
INSERT INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES ('9769', '3769', '0', '0', '0', '0', '0', '0', '20000', '0');