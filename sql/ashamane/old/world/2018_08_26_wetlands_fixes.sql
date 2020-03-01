-- delete Ma'ruk Wyrmscale overspawn
DELETE FROM `creature`
WHERE `guid` = 53047;

-- 41273 horghast overspawn
DELETE FROM `creature`
WHERE `guid` = 218536;

-- stop Captured Mosshide from moving inside cages
UPDATE `creature`
SET `spawndist` = 0,
`MovementType` = 0
WHERE `id` = 41410;

-- fix Highland Razormaw not being attackable
UPDATE `creature_template`
SET `unit_flags` = 32768
WHERE `entry` = 41400;

-- remove Cosmetic Mottled Raptors
DELETE FROM `creature`
WHERE `id` = 40495;

-- remove Garneg Charskull overspawn
DELETE FROM `creature`
WHERE `guid` = 10222;

-- fix up quest for peats sake (25939)
SET @SPELL_WATER_BLAST         := 77571;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (@SPELL_WATER_BLAST);
INSERT INTO `spell_script_names` 
    (`spell_id`, `ScriptName`)
 VALUES
 (77571,'spell_water_blast');
 
 
