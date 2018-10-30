UPDATE creature_template SET gossip_menu_id = 60003 WHERE entry = 123252;

DELETE FROM gossip_menu WHERE MenuId = 60003;
INSERT INTO gossip_menu VALUES (60003, 79243, 0);

DELETE FROM `gossip_menu_option` WHERE MenuId IN (60002, 60003);
INSERT INTO gossip_menu_option VALUES
(60002, 1, 0, "We have everything we need. It's time to build this Garrison.",  0,      1,  1,  0),
(60003, 0, 0, "Send me into the Black Temple. (Timewalking Raid)",              132375, 1,  1,  0);
