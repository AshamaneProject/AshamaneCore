-- HORDE

DELETE FROM creature_questender WHERE quest = '42985';
INSERT INTO creature_questender (id, quest) VALUES ('10181', '42985');

DELETE FROM creature_queststarter WHERE quest = '42987';
INSERT INTO creature_queststarter (id, quest) VALUES ('10181', '42987');

UPDATE quest_template_addon SET PrevQuestID = '42985' WHERE ID = '42987';

DELETE FROM creature_questender WHERE quest = '42987';
INSERT INTO creature_questender (id, quest) VALUES ('10181', '42987');

UPDATE quest_template SET QuestType = '0' WHERE ID = '42987';
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = '10181';

DELETE FROM smart_scripts WHERE (source_type = '0' AND entryorguid = '10181');
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, COMMENT) VALUES
(10181, 0, 0, 0, 50, 0, 100, 0, 42985, 0, 0, 0, 85, 218086, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Sylvanas Windrunner - On Quest Rewarded - Invoker Cast \'218086\'');

-- ALLIANCE

DELETE FROM creature_questender WHERE quest = '42978';
INSERT INTO creature_questender (id, quest) VALUES ('107574', '42978');

DELETE FROM creature_questender WHERE quest = '42982';
INSERT INTO creature_questender (id, quest) VALUES ('107574', '42982');

UPDATE quest_template SET QuestType = '0' WHERE ID = '42982';
UPDATE quest_template_addon SET PrevQuestID = '42978' WHERE ID = '42982';

DELETE FROM creature_queststarter WHERE quest = '42982';
INSERT INTO creature_queststarter (id, quest) VALUES ('107574', '42982');

UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = '107574';

DELETE FROM smart_scripts WHERE (source_type = '0' AND entryorguid = '107574');
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, COMMENT) VALUES
(107574, 0, 0, 0, 50, 0, 100, 0, 42985, 0, 0, 0, 85, 218086, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Sylvanas Windrunner - On Quest Rewarded - Invoker Cast \'218086\'');
