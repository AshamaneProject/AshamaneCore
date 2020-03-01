DELETE FROM pool_template WHERE entry IN (573,462,572);
INSERT INTO pool_template (entry,max_limit,description) VALUES
(573,1,"Foe Reaper 4000"),
(462,1,"Vultros"),
(572,1,"Leprithus");

DELETE FROM pool_creature WHERE pool_entry IN (573,462,572);
INSERT INTO pool_creature (guid,pool_entry,chance,description) VALUES
(97255,573,0,"Foe Reaper 4000-Spawn1"),
(97253,573,0,"Foe Reaper 4000-Spawn2"),
(88424,573,0,"Foe Reaper 4000-Spawn3"),
(87053,573,0,"Foe Reaper 4000-Spawn4"),
(82536,573,0,"Foe Reaper 4000-Spawn5"),
(75888,573,0,"Foe Reaper 4000-Spawn6"),
(75887,573,0,"Foe Reaper 4000-Spawn7"),
(61938,573,0,"Foe Reaper 4000-Spawn8"),
(61937,573,0,"Foe Reaper 4000-Spawn9"),
(61916,573,0,"Foe Reaper 4000-Spawn10"),
(61915,573,0,"Foe Reaper 4000-Spawn11"),
(61909,573,0,"Foe Reaper 4000-Spawn12"),
(61900,573,0,"Foe Reaper 4000-Spawn13"),
(61885,573,0,"Foe Reaper 4000-Spawn14"),
(61880,573,0,"Foe Reaper 4000-Spawn15"),
(59219,573,0,"Foe Reaper 4000-Spawn16"),
(58229,573,0,"Foe Reaper 4000-Spawn17"),
(58224,573,0,"Foe Reaper 4000-Spawn18"),
(57255,573,0,"Foe Reaper 4000-Spawn19"),
(56918,573,0,"Foe Reaper 4000-Spawn20"),
(3419,573,0,"Foe Reaper 4000-Spawn21"),
(214702,573,0,"Foe Reaper 4000-Spawn22");

INSERT INTO pool_creature (guid,pool_entry,chance,description) VALUES
(2186,462,0,"Vultros-Spawn1"),
(126977,462,0,"Vultros-Spawn2"),
(126976,462,0,"Vultros-Spawn3"),
(126975,462,0,"Vultros-Spawn4"),
(126974,462,0,"Vultros-Spawn5"),
(126973,462,0,"Vultros-Spawn6"),
(126972,462,0,"Vultros-Spawn7"),
(117458,462,0,"Vultros-Spawn8"),
(117457,462,0,"Vultros-Spawn9"),
(117456,462,0,"Vultros-Spawn10"),
(117455,462,0,"Vultros-Spawn11"),
(117454,462,0,"Vultros-Spawn12"),
(117453,462,0,"Vultros-Spawn13"),
(117452,462,0,"Vultros-Spawn14"),
(116952,462,0,"Vultros-Spawn15"),
(116946,462,0,"Vultros-Spawn16"),
(302994,462,0,"Vultros-Spawn17");

INSERT INTO pool_creature (guid,pool_entry,chance,description) VALUES
(126879,572,0,"Leprithus"),
(3695,572,0,"Leprithus"),
(316894,572,0,"Leprithus");

-- Table `creature_template`
UPDATE `creature_template` SET `InhabitType` = 4 WHERE entry IN (199,154,462,1109);

-- Some duplicates
DELETE FROM creature WHERE guid IN (371192,371230,302994,215250);
DELETE FROM `creature` WHERE (id = 596) AND (guid IN (216419));
DELETE FROM `creature` WHERE (id = 599) AND (guid IN (216404));
DELETE FROM `creature` WHERE (id = 520) AND (guid IN (303008));