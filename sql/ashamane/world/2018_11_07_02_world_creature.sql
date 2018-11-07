-- Fix Lelanai
UPDATE `creature_template` SET `npcflag` = 131 WHERE (entry = 4730);

-- Fix Dalaran Inn
DELETE FROM `creature` WHERE (id = 25428) AND (guid IN (97343));
DELETE FROM `creature` WHERE (id = 31718) AND (guid IN (111385));
