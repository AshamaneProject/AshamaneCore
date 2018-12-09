-- 228974 - Soul Leech Base
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_warl_soul_leech_base';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(228974, 'spell_warl_soul_leech_base');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_warl_soul_leech_aura';

-- 265259 - Twist of fate
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_pri_twist_of_fate';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(265259, 'spell_pri_twist_of_fate');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pri_shadowy_apparitions';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(78203, 'spell_pri_shadowy_apparitions');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pri_mind_blast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(8092, 'spell_pri_mind_blast');

-- 124430 - Shadowy Insight
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_pri_shadowy_insight';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(124430, 'spell_pri_shadowy_insight');
