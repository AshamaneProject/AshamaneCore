UPDATE `areatrigger` SET `spawn_mask`='8388614' WHERE  `guid`=4;
UPDATE `areatrigger` SET `spawn_mask`='8388868' WHERE  `guid` IN (8,10,22,24,47);
UPDATE `areatrigger` SET `spawn_mask`='245760' WHERE  `guid` IN (28,30,32,33,35);
UPDATE `areatrigger` SET `spawn_mask`='4096' WHERE  `guid`=40;

DELETE FROM `pool_creature` WHERE `pool_entry`=107544;

UPDATE `creature_template` SET `lootid`='83746' WHERE  `entry`=83746;

DELETE FROM `reference_loot_template` WHERE  `Entry`=83746 AND `Item`=112775 AND `Reference`=0;

