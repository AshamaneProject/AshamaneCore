-- Fix Correct flag for npc_vendor
UPDATE `creature_template` SET `npcflag` = `npcflag` | 128 WHERE `entry` IN (4217, 4730, 87049, 87052, 87057, 87062, 87065, 93527, 111741);
