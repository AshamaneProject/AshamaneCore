DELETE FROM `spell_script_names` WHERE `spell_id` IN (113095, 74589);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(113095, 'spell_item_demon_hunters_aspect'),
(74589, 'spell_item_faded_wizard_hat'); 

DELETE FROM spell_script_names WHERE spell_id=224968;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (224968, 'aura_arti_mage_mark_of_aluneth');

DELETE FROM spell_script_names WHERE spell_id=211088;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (211088, 'spell_arti_mage_mark_of_aluneth_aoe');

DELETE FROM spell_script_names WHERE spell_id=211076;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (211076, 'spell_arti_mage_mark_of_aluneth_aoe');

DELETE FROM spell_script_names WHERE spell_id=210725;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (210725, 'spell_mage_arcane_touch_of_the_magi');

DELETE FROM spell_script_names WHERE spell_id=210824;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (210824, 'aura_mage_arcane_touch_of_the_magi');