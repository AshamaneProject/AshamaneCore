-- Resurrect Whelplings on spellclick
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=90167;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (90167, 180463, 3, 1);

UPDATE `creature_template` SET `ScriptName`='questnpc_mana_drained_whelpling' WHERE `entry`=90167;
