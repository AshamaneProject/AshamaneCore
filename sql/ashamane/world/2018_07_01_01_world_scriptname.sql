DELETE FROM `areatrigger_template_actions` WHERE `AreaTriggerId` = 12880;
INSERT INTO `areatrigger_template_actions` (`AreaTriggerId`, `ActionType`, `ActionParam`, `TargetType`) VALUES
('12880','0','227848','2');

UPDATE `spell_areatrigger` SET `DecalPropertiesId`='86' WHERE `SpellMiscId`='8812';

DELETE FROM spell_script_names WHERE scriptname = "spell_gen_maiden_of_virtue_mass_repentance";
DELETE FROM spell_script_names WHERE scriptname = "spell_gen_maiden_of_virtue_holy_bulwark";
DELETE FROM spell_script_names WHERE scriptname = "spell_gen_maiden_of_virtue_holy_wrath";
INSERT INTO spell_script_names VALUES
(227508, "spell_gen_maiden_of_virtue_mass_repentance"),
(227817, "spell_gen_maiden_of_virtue_holy_bulwark"),
(227823, "spell_gen_maiden_of_virtue_holy_wrath");
