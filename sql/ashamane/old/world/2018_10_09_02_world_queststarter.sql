UPDATE `creature_queststarter` SET id = 197 WHERE quest IN (SELECT id FROM `quest_template` WHERE `LogTitle` = 'Join the Battle!');
