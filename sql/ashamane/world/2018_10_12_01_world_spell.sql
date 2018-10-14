DELETE FROM `areatrigger_template` WHERE `Id` IN (0, 199720);
INSERT INTO `areatrigger_template` (`Id`, `Data0`, `Data1`, `ScriptName`) VALUES
(199720, 10, 10, 'at_dk_decomposing_aura'); 

DELETE FROM `spell_areatrigger` WHERE `SpellMiscId` = 7330;
INSERT INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`) VALUES
(7330, 199720);
