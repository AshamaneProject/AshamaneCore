-- Cat critter fix wrong aura
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = '6368';

-- Wrong gossip id fix transmogrifier Dalaran
UPDATE `creature_template` SET `gossip_menu_id` = '21043' WHERE `entry` = '99867';
