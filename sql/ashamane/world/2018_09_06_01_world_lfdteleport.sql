-- REMOVE unused smart_script
DELETE FROM smart_scripts WHERE entryorguid = 130758;

-- remove the smartai ainame from 130758 correct the npcflag

UPDATE creature_template SET AIName = "", npcflag = 16777216 WHERE entry = 130758;

-- destinatino for the spell
DELETE  FROM spell_target_position WHERE ID = 258297;
INSERT INTO spell_target_position (`ID`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `VerifiedBuild`)VALUES
(258297, 1860, 459.089, 1450.14, 758.018, 27326);

-- add spell to npcspellclick

DELETE FROM npc_spellclick_spells WHERE npc_entry = 130758;
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `cast_flags`, `user_type`)VALUES
(130758, 258298, 1, 1);
