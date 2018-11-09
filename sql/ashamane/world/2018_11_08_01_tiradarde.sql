UPDATE creature_template SET scriptname = "npc_jaina_boralus_intro" WHERE entry = 120922;
UPDATE scene_template SET ScriptName = "scene_jaina_to_proudmoore_keep" where SceneId = 1954;
UPDATE creature_template SET scriptname = "npc_flynn_fairwind" WHERE entry = 121239;

UPDATE `creature_addon` SET `aiAnimKit` = '14225' WHERE `guid` = 210303366;
