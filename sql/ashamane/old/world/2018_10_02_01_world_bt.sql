UPDATE `creature_template` SET `flags_extra` = 128 WHERE entry = 23123;
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE id = 23123;
