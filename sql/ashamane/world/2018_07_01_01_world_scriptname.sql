UPDATE areatrigger_template SET ScriptName = 'at_maiden_of_virtue_sacred_ground' WHERE Id IN (12880);

DELETE FROM spell_script_names WHERE scriptname = "spell_gen_maiden_of_virtue_mass_repentance";
DELETE FROM spell_script_names WHERE scriptname = "spell_gen_maiden_of_virtue_holy_bulwark";
DELETE FROM spell_script_names WHERE scriptname = "spell_gen_maiden_of_virtue_holy_wrath";
INSERT INTO spell_script_names VALUES
(227508, "spell_gen_maiden_of_virtue_mass_repentance"),
(227817, "spell_gen_maiden_of_virtue_holy_bulwark"),
(227823, "spell_gen_maiden_of_virtue_holy_wrath");
