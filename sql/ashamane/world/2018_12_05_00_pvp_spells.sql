DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_pvp_honor_adaptation',
'spell_pvp_honor_medallion');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(214027, 'spell_pvp_honor_adaptation'),
(42292,  'spell_pvp_honor_medallion'),
(195710, 'spell_pvp_honor_medallion'),
(208683, 'spell_pvp_honor_medallion');
