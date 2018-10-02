DELETE FROM `hotfix_data` WHERE `Id` IN (375, 376, 377) AND `TableHash`= "3689412649";
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordId`, `Deleted`) VALUES
('375', '3689412649', '48624', '0'),
('376', '3689412649', '48625', '0'),
('377', '3689412649', '48626', '0');

DELETE FROM `spell_categories` WHERE `ID` IN (48624, 48625, 48626);
INSERT INTO `spell_categories` (`ID`, `Category`, `StartRecoveryCategory`, `ChargeCategory`, `DifficultyID`, `DefenseType`, `DispelType`, `Mechanic`, `PreventionType`, `SpellID`, `VerifiedBuild`) VALUES
('48624', '1479', '0', '0', '0', '0', '0', '28', '0', '188800', '0'),
('48625', '1479', '0', '0', '0', '0', '0', '28', '0', '188801', '0'),
('48626', '1479', '0', '0', '0', '0', '0', '28', '0', '188802', '0');
