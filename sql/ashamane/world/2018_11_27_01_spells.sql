-- New scripts
DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_monk_vivify');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(116670, 'spell_monk_vivify');
