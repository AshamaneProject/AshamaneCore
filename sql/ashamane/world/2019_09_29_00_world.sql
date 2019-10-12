-- Spirit Healer https://www.wowhead.com/npc=6491/spirit-healer
UPDATE `creature_template` SET `gossip_menu_id` = 83 WHERE `entry` = 6491;
UPDATE `gossip_menu_option` SET `Optiontype` = 6, `optionnpcflag` = 16385 WHERE `menuid` = 83;