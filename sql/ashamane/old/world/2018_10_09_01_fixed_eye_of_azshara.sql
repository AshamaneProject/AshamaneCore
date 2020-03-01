-- https://www.wowhead.com/npc=91784/warlord-parjesh
SET @NPCID := 91784;
UPDATE `creature_template` SET `lootid`=@NPCID WHERE `entry`=@NPCID;
DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 124124, 0,  22.211155, 0, 1, 0, 1, 1, 'Blood of Sargeras'),
(@NPCID, 138993, 0,  14.374083, 1, 1, 0, 4, 5, 'Rarefied Water'),
(@NPCID, 130106, 0,   6.437408, 1, 1, 0, 1, 1, 'Warlord Parjesh''s Hauberk'),
(@NPCID, 138482, 0,   0.760117, 1, 1, 0, 1, 1, 'Sovereign Soul'),
(@NPCID, 138781, 0,   0.513735, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 139574, 0,   0.199203, 0, 1, 0, 1, 1, 'Coil of the Drowned Queen'),
(@NPCID, 147579, 0,   0.256579, 0, 1, 0, 1, 1, 'Tome of the Legionfall Magi'),
(@NPCID, 140227, 0,   0.147590, 0, 1, 0, 1, 1, 'Bloodhunter''s Quarry'),
-- LOOT NORMAL MODE
(@NPCID, 141690, 0,  47.431327, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID, 140224, 0,   0.424617, 0, 1, 0, 1, 1, 'Butchered Meat'),
(@NPCID, 140220, 0,   0.445586, 0, 1, 0, 1, 1, 'Scavenged Cloth'),
-- LOOT HEROIC MODE
(@NPCID, 141689, 0,  54.106401, 0, 1, 0, 1, 1, 'Jewel of Victory'),
(@NPCID, 124437, 0,   0.451852, 0, 1, 0, 1, 3, 'Shal''dorei Silk'),
(@NPCID, 140222, 0,   0.206626, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 144345, 0,   0.193002, 0, 1, 0, 1, 1, 'Pile of Pet Goodies'),
(@NPCID, 132183, 0,   0.168025, 0, 1, 0, 1, 1, 'Razor Tooth'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,  69.600409, 0, 1, 0, 1, 1, 'Talisman of Victory'),
-- CURRENCY
(@NPCID,  -1275, 0,   0.703312, 0, 1, 0, 1, 1, 'Curious Coin');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@NPCID, 134492, 0, 10.023066, 0, 1, 1, 1, 1, 'Hatecoil Commander''s Amulet'),
(@NPCID, 134240, 0,  4.802343, 0, 1, 1, 1, 1, 'Brinewashed Leather Cowl'),
(@NPCID, 137361, 0,  3.022184, 0, 1, 1, 1, 1, 'Roaring Shellbreaker Greatbelt'),
(@NPCID, 134223, 0,  3.367317, 0, 1, 1, 1, 1, 'Coralplate Chestguard'),
(@NPCID, 137363, 0,  2.016303, 0, 1, 1, 1, 1, 'Bloodied Spearhead'),
(@NPCID, 137360, 0,  2.359165, 0, 1, 1, 1, 1, 'Shoulderpads of Crashing Waves'),
(@NPCID, 134484, 0,  1.814219, 0, 1, 1, 1, 1, 'Crestrider Conduit Bracers'),
(@NPCID, 134441, 0,  1.718853, 0, 1, 1, 1, 1, 'Shellshock Footguards'),
(@NPCID, 134251, 0,  1.571263, 0, 1, 1, 1, 1, 'Sea Stalker''s Cinch'),
(@NPCID, 134261, 0,  1.444109, 0, 1, 1, 1, 1, 'Seawitch Gloves'),
(@NPCID, 137362, 0,  1.005881, 0, 1, 1, 1, 1, 'Parjesh''s Medallion');

-- https://www.wowhead.com/npc=91789/lady-hatecoil
SET @NPCID := 91789;
DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 124124, 0,  18.706138, 0, 1, 0, 1, 1, 'Blood of Sargeras'),
(@NPCID, 139464, 0,  10.473442, 1, 1, 0, 1, 1, 'Lens of the Tides'),
(@NPCID, 132212, 0,  10.199138, 0, 1, 0, 1, 1, 'Frothing Essence'),
(@NPCID, 138993, 0,   8.952300, 1, 1, 0, 3, 5, 'Rarefied Water'),
(@NPCID, 138995, 0,   5.108475, 1, 1, 0, 1, 1, 'Scepter of Storms'),
(@NPCID, 132223, 0,   3.601582, 0, 1, 0, 1, 1, 'Elemental Droplet'),
(@NPCID, 138482, 0,   0.598482, 1, 1, 0, 1, 1, 'Sovereign Soul'),
(@NPCID, 138781, 0,   0.388301, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 132218, 0,   0.381176, 0, 1, 0, 1, 1, 'Glob of Elemental Goo'),
(@NPCID, 139574, 0,   0.138933, 0, 1, 0, 1, 1, 'Coil of the Drowned Queen'),
(@NPCID, 140222, 0,   0.317244, 0, 1, 0, 1, 1, 'Harvested Goods'),
-- LOOT NORMAL MODE
(@NPCID, 141690, 0,  32.460546, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID, 134525, 0,  12.970681, 0, 1, 0, 1, 1, 'Seal of the Nazjatar Empire'),
-- LOOT HEROIC MODE
(@NPCID, 141689, 0,  58.507193, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,  61.408681, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 147579, 0,   0.575252, 0, 1, 0, 1, 1, 'Tome of the Legionfall Magi'),
(@NPCID, 140227, 0,   0.477337, 0, 1, 0, 1, 1, 'Bloodhunter''s Quarry'),
(@NPCID, 140226, 0,   0.122850, 0, 1, 0, 1, 1, 'Mana-Tinged Pack'),
-- CURRENCY
(@NPCID,  -1275, 0,   0.066092, 0, 1, 0, 1, 1, 'Curious Coin');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@NPCID, 134525, 0,  5.635478, 0, 1, 1, 1, 1, 'Seal of the Nazjatar Empire'),
(@NPCID, 137367, 0,  3.216497, 0, 1, 1, 1, 1, 'Stormsinger Fulmination Charge'),
(@NPCID, 134263, 0,  2.597431, 0, 1, 1, 1, 1, 'Seawitch Robes'),
(@NPCID, 137365, 0,  1.995990, 0, 1, 1, 1, 1, 'Condensed Saltsea Globule'),
(@NPCID, 137364, 0,  2.079707, 0, 1, 1, 1, 1, 'Crashing Oceantide Mantle'),
(@NPCID, 134505, 0,  2.007006, 0, 1, 1, 1, 1, 'Horizon Line Warboots'),
(@NPCID, 134238, 0,  2.148003, 0, 1, 1, 1, 1, 'Brinewashed Leather Pants'),
(@NPCID, 134230, 0,  1.623670, 0, 1, 1, 1, 1, 'Coralplate Wristguard'),
(@NPCID, 134433, 0,  1.449627, 0, 1, 1, 1, 1, 'Cord of the Sea-Caller'),
(@NPCID, 134471, 0,  1.310833, 0, 1, 1, 1, 1, 'Helm of Endless Dunes'),
(@NPCID, 144345, 0,  1.302020, 0, 1, 1, 1, 1, 'Pile of Pet Goodies'),
(@NPCID, 137366, 0,  1.101540, 0, 1, 1, 1, 1, 'Gift of the Ocean Empress'),
(@NPCID, 134253, 0,  0.837170, 0, 1, 1, 1, 1, 'Sea Stalker''s Gloves'),
(@NPCID, 144239, 0,  0.178449, 0, 1, 1, 1, 1, 'The Emperor''s Capacitor');

-- https://www.wowhead.com/npc=91797/king-deepbeard
SET @NPCID := 91797;
DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 124124, 0,  26.191582, 0, 1, 0, 1, 1, 'Blood of Sargeras'),
(@NPCID, 138993, 0,  15.312597, 1, 1, 0, 5, 5, 'Rarefied Water'),
(@NPCID, 139300, 0,   1.199319, 0, 1, 0, 1, 1, 'Finely-Tailored Green Holiday Hat'),
(@NPCID, 132193, 0,   0.773754, 0, 1, 0, 1, 1, 'Tuft of Plumage'),
(@NPCID, 138482, 0,   0.649954, 1, 1, 0, 1, 1, 'Sovereign Soul'),
(@NPCID, 132192, 0,   0.340452, 0, 1, 0, 1, 1, 'Pitted Bone'),
(@NPCID, 140222, 0,   0.211496, 0, 1, 0, 1, 1, 'Harvested Goods'),
-- LOOT NORMAL MODE
(@NPCID, 141690, 0,  42.641597, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID, 138781, 0,   8.936862, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 124121, 0,   0.905292, 0, 1, 0, 1, 2, 'Wildfowl Egg'),
(@NPCID, 142119, 0,   0.147013, 0, 1, 0, 1, 1, 'Recipe: Potion of Prolonged Power'),
(@NPCID, 124438, 0,   0.139276, 0, 1, 0, 4, 4, 'Unbroken Claw'),
(@NPCID, 138782, 0,   0.139276, 0, 1, 0, 1, 1, 'Brief History of the Ages'),
-- LOOT HEROIC MODE
(@NPCID, 141689, 0,   0.139276, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,  54.472930, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 140226, 0,   0.178143, 0, 1, 0, 1, 1, 'Mana-Tinged Pack'),
-- CURRENCY
(@NPCID,  -1275, 0,   3.710015, 0, 1, 0, 1, 1, 'Curious Coin');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@NPCID, 134539, 0, 10.213556, 0, 1, 1, 1, 1, 'Braided Silver Ring'),
(@NPCID, 134406, 0,  7.389353, 0, 1, 1, 1, 1, 'Mainsail Cloak'),
(@NPCID, 137369, 0,  4.928815, 0, 1, 1, 1, 1, 'Giant Ornamental Pearl'),
(@NPCID, 137371, 0,  4.611575, 0, 1, 1, 1, 1, 'Tumultuous Aftershock'),
(@NPCID, 134456, 0,  3.791396, 0, 1, 1, 1, 1, 'Taut Halyard Waistband'),
(@NPCID, 134428, 0,  3.172392, 0, 1, 1, 1, 1, 'Rising Ocean Legwraps'),
(@NPCID, 137370, 0,  1.965336, 0, 1, 1, 1, 1, 'Heart of the Sea'),
(@NPCID, 134514, 0,  2.429588, 0, 1, 1, 1, 1, 'Keelhauler Legplates'),
(@NPCID, 137368, 0,  0.974930, 0, 1, 1, 1, 1, 'Breastplate of Ten Lashes');

-- https://www.wowhead.com/npc=91808/serpentrix
SET @NPCID := 91808;
DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 138993, 0,  24.173827, 1, 1, 1, 5, 5, 'Rarefied Water'),
(@NPCID, 124124, 0,  14.491077, 0, 1, 0, 1, 1, 'Blood of Sargeras'),
(@NPCID, 138482, 0,   0.760079, 1, 1, 0, 1, 1, 'Sovereign Soul'),
(@NPCID, 129921, 0,   0.413087, 1, 1, 0, 1, 1, 'Scales of Serpentrix'),
(@NPCID, 138781, 0,   0.330469, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 132184, 0,   2.065594, 0, 1, 0, 1, 1, 'Intact Shimmering Scale'),
(@NPCID, 132192, 0,   0.504573, 0, 1, 0, 1, 1, 'Pitted Bone'),
(@NPCID, 132190, 0,   0.394197, 0, 1, 0, 1, 1, 'Pointed Tail Tip'),
-- CURRENCY
(@NPCID,  -1275, 0,   0.413087, 1, 1, 0, 1, 1, 'Curious Coin'),
-- LOOT NORMAL MODE
(@NPCID, 141690, 0,  29.477859, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID, 140224, 0,   0.561798, 0, 1, 0, 1, 1, 'Butchered Meat'),
-- LOOT HEROIC MODE
(@NPCID, 141689, 0,  47.366761, 0, 1, 0, 1, 1, 'Jewel of Victory'),
(@NPCID, 140221, 0,   0.189215, 0, 1, 0, 1, 1, 'Found Sack of Gems'),
(@NPCID, 124439, 0,   0.157679, 0, 1, 0, 1, 1, 'Unbroken Tooth'),
-- LOOT MITHYC MODE
(@NPCID, 138786, 0,  67.651813, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 140222, 0,   0.207804, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 140226, 0,   0.157679, 0, 1, 0, 1, 1, 'Mana-Tinged Pack'),
(@NPCID, 140227, 0,   0.110375, 0, 1, 0, 1, 1, 'Bloodhunter''s Quarry');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@NPCID, 134239, 0, 21.050892, 0, 1, 1, 1, 1, 'Brinewashed Leather Grips'),
(@NPCID, 137375, 0, 15.978189, 0, 1, 1, 1, 1, 'Blazing Hydra Flame Sac'),
(@NPCID, 137377, 0,  4.543952, 0, 1, 1, 1, 1, 'Serpentrix''s Guile'),
(@NPCID, 134438, 0,  3.552545, 0, 1, 1, 1, 1, 'Tunic of the Pitiless Monstrosity'),
(@NPCID, 134228, 0,  2.759418, 0, 1, 1, 1, 1, 'Coralplate Pauldrons'),
(@NPCID, 134508, 0,  2.081956, 0, 1, 1, 1, 1, 'Stormwake Handguards'),
(@NPCID, 137373, 0,  2.296761, 0, 1, 1, 1, 1, 'Tempered Egg of Serpentrix'),
(@NPCID, 137372, 0,  2.247191, 0, 1, 1, 1, 1, 'Wristbands of the Swirling Deeps'),
(@NPCID, 134256, 0,  2.362855, 0, 1, 1, 1, 1, 'Sea Stalker''s Leggings'),
(@NPCID, 134260, 0,  1.734964, 0, 1, 1, 1, 1, 'Seawitch Hood'),
(@NPCID, 134465, 0,  1.354924, 0, 1, 1, 1, 1, 'Hydra Scale Sabatons'),
(@NPCID, 132443, 0,  0.094607, 0, 1, 1, 1, 1, 'Aggramar''s Stride');

DELETE FROM `skinning_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@NPCID, 124115, 0, 100.000000, 0, 1, 0, 1, 1, 'Stormscale'),
(@NPCID, 124439, 0,  19.008264, 0, 1, 0, 3, 8, 'Unbroken Tooth'),
(@NPCID, 129894, 0,   5.371901, 1, 1, 0, 1, 1, 'Stormscale Spark'),
(@NPCID, 124124, 0,   1.239669, 0, 1, 0, 1, 1, 'Blood of Sargeras'),
(@NPCID, 129865, 0,   0.826446, 1, 1, 0, 1, 1, 'Unfinished Treatise on the Properties of Stormscale');

-- https://www.wowhead.com/npc=96028/wrath-of-azshara
SET @NPCID := 91808;

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 124124, 0,  47.741753, 0, 1, 0, 1, 2, 'Blood of Sargeras'),
(@NPCID, 140312, 0,   7.730426, 1, 1, 0, 1, 1, 'Essence of Balance'),
(@NPCID, 127048, 0,   7.149936, 1, 1, 0, 1, 1, 'Heart of the Storm'),
(@NPCID, 137877, 0,   5.167776, 0, 1, 0, 1, 1, 'Recipe: Warhide Pants'),
(@NPCID, 138993, 0,   3.553731, 1, 1, 0, 5, 5, 'Rarefied Water'),
(@NPCID, 141916, 0,   2.180377, 0, 1, 0, 1, 1, 'Formula: Enchant Neck - Mark of the Ancient Priestess'),
(@NPCID, 138968, 0,   1.472462, 1, 1, 0, 1, 1, 'Glittering Necklace'),
(@NPCID, 137825, 0,   0.891972, 0, 1, 0, 1, 1, 'Design: Dawnlight Band'),
(@NPCID, 141302, 0,   0.948605, 1, 1, 0, 1, 1, 'Frozen Soul Pendant'),
(@NPCID, 127929, 0,   0.707914, 0, 1, 0, 1, 1, 'Recipe: Leytorrent Potion'),
(@NPCID, 138482, 0,   0.495540, 1, 1, 0, 1, 3, 'Sovereign Soul'),
(@NPCID, 138971, 0,   0.368116, 1, 1, 0, 1, 1, 'Cask of Honey Brew'),
(@NPCID, 138969, 0,   0.424749, 1, 1, 0, 1, 1, 'Handful of Ancient Golden Discs'),
(@NPCID, 141592, 0,   0.254849, 0, 1, 0, 1, 1, 'Technique: Codex of the Tranquil Mind'),
(@NPCID, 138781, 0,   0.254849, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 136705, 0,   2.956801, 0, 1, 0, 1, 1, 'Technique: Aqual Mark'),
(@NPCID, 146688, 0,   0.260599, 1, 1, 0, 1, 1, 'Waterlogged Handmaiden''s Gloves'),
(@NPCID, 140222, 0,   0.300692, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 140221, 0,   0.190438, 0, 1, 0, 1, 1, 'Found Sack of Gems'),
(@NPCID, 140227, 0,   0.130300, 0, 1, 0, 1, 1, 'Bloodhunter''s Quarry'),
-- LOOT NORMAL MODE
(@NPCID, 141690, 0,  46.014441, 0, 1, 0, 1, 1, 'Symbol of Victory'),
-- LOOT HEROIC MODE
(@NPCID, 141689, 0,  93.134209, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT MITHYC MODE
(@NPCID, 138786, 0,  90.511308, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 138019, 0,  29.416585, 0, 1, 0, 1, 1, 'Mythic Keystone'),
(@NPCID, 147579, 0,   0.180269, 0, 1, 0, 1, 1, 'Tome of the Legionfall Magi'),
(@NPCID, 144363, 0,   0.114716, 1, 1, 0, 1, 1, 'Blood-Soaked Invitation'),
-- CURRENCIES
(@NPCID,  -1314, 0, 16.633891, 0, 1, 0, 1, 1, 'Lingering Soul Fragment'),
(@NPCID,  -1275, 0,  0.606359, 0, 1, 0, 1, 1, 'Curious Coin');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@NPCID, 134497, 0, 17.273113, 0, 1, 1, 1, 1, 'Stormcharged Choker'),
(@NPCID, 134259, 0, 10.873566, 0, 1, 1, 1, 1, 'Seawitch Cinch'),
(@NPCID, 134532, 0,  7.971117, 0, 1, 1, 1, 1, 'Band of Fused Coral'),
(@NPCID, 134417, 0,  5.281042, 0, 1, 1, 1, 1, 'Slippers of Martyrdom'),
(@NPCID, 134237, 0,  4.658077, 0, 1, 1, 1, 1, 'Brinewashed Leather Boots'),
(@NPCID, 137381, 0,  3.681155, 0, 1, 1, 1, 1, 'Pact of Vengeful Service'),
(@NPCID, 137380, 0,  4.091746, 0, 1, 1, 1, 1, 'Rage of the Tides'),
(@NPCID, 134459, 0,  3.426306, 0, 1, 1, 1, 1, 'Cuffs of the Arcane Storm'),
(@NPCID, 137379, 0,  2.520176, 0, 1, 1, 1, 1, 'Tempestbinder''s Crystal'),
(@NPCID, 134478, 0,  2.491859, 0, 1, 1, 1, 1, 'Thundercrush Pauldrons'),
(@NPCID, 134512, 0,  1.472462, 0, 1, 1, 1, 1, 'Casque of the Deep'),
(@NPCID, 134225, 0,  1.359196, 0, 1, 1, 1, 1, 'Coralplate Girdle'),
(@NPCID, 134255, 0,  1.274246, 0, 1, 1, 1, 1, 'Sea Stalker''s Hood'),
(@NPCID, 137378, 0,  0.920289, 0, 1, 1, 1, 1, 'Bottled Hurricane');

-- ELITES RAROS
-- https://www.wowhead.com/npc=91788/shellmaw
SET @NPCID := 91788;
SET @GUID  := 280000092;

DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=@NPCID;
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(@GUID, @NPCID, 1456, 8040, 8084, '1,2,8,23', 0, 0, 0, -1, 0, 0, -3501.6, 4815.16, 5.89717, 5.06397, 7200, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 0);

UPDATE `creature_template` SET `minlevel`=102, `maxlevel`=111, `faction`=14, `lootid`=@NPCID, `BaseAttackTime`=2000, `RangeAttackTime`=2000 WHERE `entry`=@NPCID;

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 141690, 0,  76.015228, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID, 132223, 0,  32.741117, 0, 1, 0, 1, 1, 'Elemental Droplet'),
(@NPCID, 132212, 0,   4.949239, 0, 1, 0, 1, 1, 'Frothing Essence'),
(@NPCID, 132218, 0,   5.203046, 0, 1, 0, 1, 1, 'Glob of Elemental Goo'),
(@NPCID, 132204, 0,   1.776650, 0, 1, 0, 1, 1, 'Sticky Volatile Substance'),
(@NPCID, 140220, 0,   0.126904, 0, 1, 0, 1, 1, 'Scavenged Cloth'),
(@NPCID, 141689, 0,  51.868802, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT HEROIC MODE
(@NPCID, 140222, 0,   0.025426, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 138781, 0,   0.025426, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 121369, 0,   0.025426, 0, 1, 0, 1, 1, 'Weatherworn Vest'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,  39.421532, 0, 1, 1, 1, 1, 'Talisman of Victory'),
(@NPCID, 141032, 0,   0.053562, 0, 1, 1, 1, 1, 'Technique: Glyph of the Chilled Shell');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- LOOT NORMAL MODE
(@NPCID, 121002, 0, 10.279188, 0, 1, 1, 1, 1, 'Rhut''van Gauntlets'),
(@NPCID, 141284, 0,  0.253807, 0, 1, 1, 1, 1, 'Nor''danil Ampoule'),
(@NPCID, 121044, 0,  0.126904, 0, 1, 1, 1, 1, 'Faronaar Chain Helm'),
(@NPCID, 121006, 0,  0.126904, 0, 1, 1, 1, 1, 'Rhut''van Pauldrons'),
(@NPCID, 121007, 0,  0.126904, 0, 1, 1, 1, 1, 'Rhut''van Sabatons'),
(@NPCID, 121353, 0,  0.126904, 0, 1, 1, 1, 1, 'Warped-Plate Pauldrons'),
-- LOOT HEROIC MODE
(@NPCID, 121040, 0,  0.177981, 0, 1, 1, 1, 1, 'Faronaar Chain Belt'),
(@NPCID, 121021, 0,  0.177981, 0, 1, 1, 1, 1, 'Llothien Hood'),
(@NPCID, 121015, 0,  0.152555, 0, 1, 1, 1, 1, 'Academy Faculty Pin'),
(@NPCID, 121017, 0,  0.152555, 0, 1, 1, 1, 1, 'Llothien Bindings'),
(@NPCID, 121001, 0,  0.076278, 0, 1, 1, 1, 1, 'Rhut''van Breastplate'),
(@NPCID, 121014, 0,  0.050852, 0, 1, 1, 1, 1, 'Preserved Blue Dragon Scale'),
(@NPCID, 121027, 0,  0.025426, 0, 1, 1, 1, 1, 'Azurewing Signet'),
(@NPCID, 121018, 0,  0.025426, 0, 1, 1, 1, 1, 'Llothien Boots'),
(@NPCID, 121003, 0,  0.025426, 0, 1, 1, 1, 1, 'Rhut''van Girdle'),
(@NPCID, 121008, 0,  0.025426, 0, 1, 1, 1, 1, 'Rhut''van Vambraces'),
(@NPCID, 121048, 0,  0.025426, 0, 1, 1, 1, 1, 'Temporal Scholar''s Cord'),
-- LOOT MITHYC MODE
(@NPCID, 121041, 0,  0.107124, 0, 1, 1, 1, 1, 'Faronaar Chain Bracers'),
(@NPCID, 121019, 0,  0.053562, 0, 1, 1, 1, 1, 'Llothien Britches');

SET @PATH := @NPCID * 10;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@GUID, @PATH, 0, 0, 1, 0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@PATH,  1, -3510.28, 4808.52,  5.93768, 0, 0, 0, 0, 100, 0),
(@PATH,  2, -3514.18, 4800.02,  4.75865, 0, 0, 0, 0, 100, 0),
(@PATH,  3, -3517.03, 4788.80,  4.07392, 0, 0, 0, 0, 100, 0),
(@PATH,  4, -3521.36, 4773.38,  3.36625, 0, 0, 0, 0, 100, 0),
(@PATH,  5, -3523.23, 4763.06,  1.88694, 0, 0, 0, 0, 100, 0),
(@PATH,  6, -3526.18, 4748.45,  1.07165, 0, 0, 0, 0, 100, 0),
(@PATH,  7, -3532.33, 4741.05,  1.25308, 0, 0, 0, 0, 100, 0),
(@PATH,  8, -3540.01, 4731.09,  2.10343, 0, 0, 0, 0, 100, 0),
(@PATH,  9, -3549.01, 4720.13,  2.97154, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -3557.05, 4709.51,  3.41723, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -3566.47, 4697.08,  3.73732, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -3576.30, 4687.98,  4.17313, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -3587.52, 4681.14,  5.53662, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -3600.64, 4678.41,  6.72116, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -3608.12, 4681.64,  6.92057, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -3609.27, 4693.12,  9.12684, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -3608.07, 4703.40, 10.71730, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -3606.47, 4713.59, 11.23660, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -3601.44, 4723.38, 12.07980, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -3593.07, 4737.96, 10.51270, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -3578.64, 4751.38,  7.60494, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -3557.94, 4755.14,  4.68585, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -3544.29, 4759.72,  3.93050, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -3533.11, 4773.29,  3.35175, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -3518.48, 4782.62,  3.64167, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -3510.92, 4797.33,  4.79126, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -3506.96, 4806.83,  5.66648, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -3504.47, 4816.01,  6.03644, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -3490.68, 4817.08,  5.50093, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -3473.77, 4817.04,  3.80901, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -3459.27, 4806.80,  4.08762, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -3448.66, 4798.55,  5.03363, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -3438.85, 4809.21,  3.51736, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -3439.24, 4824.88,  2.26702, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -3445.46, 4836.06,  4.19971, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -3456.91, 4838.62,  3.88704, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -3467.92, 4835.24,  3.96359, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -3477.37, 4830.66,  3.95544, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -3485.10, 4826.44,  4.74863, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -3503.75, 4816.27,  6.01954, 0, 0, 0, 0, 100, 0);

-- https://www.wowhead.com/npc=101467/jaggen-ra
SET @NPCID := 101467;
SET @GUID  := 21003040;

UPDATE `creature_template` SET `minlevel`=107, `maxlevel`=111, `lootid`=@NPCID, `skinloot`=@NPCID WHERE `entry`=@NPCID;

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 141690, 0,  84.707051, 0, 1, 0, 1, 1, 'Symbol of Victory'), 
(@NPCID, 141689, 0,  54.401251, 0, 1, 0, 1, 1, 'Jewel of Victory'),
(@NPCID, 132183, 0,  24.230387, 0, 1, 0, 1, 1, 'Razor Tooth'),
(@NPCID, 132190, 0,  10.228401, 0, 1, 0, 1, 1, 'Pointed Tail Tip'),
(@NPCID, 124439, 0,   3.277061, 0, 1, 0, 1, 4, 'Unbroken Tooth'),
(@NPCID, 132184, 0,   3.078451, 0, 1, 0, 1, 1, 'Intact Shimmering Scale'),
-- LOOT NORMAL MODE
(@NPCID, 140220, 0,   0.198610, 0, 1, 0, 1, 1, 'Scavenged Cloth'),
-- LOOT HEROIC MODE
(@NPCID, 137781, 0,   0.156390, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 137726, 0,   0.134048, 0, 1, 0, 1, 1, 'Schematic: Leystone Buoy'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,  52.531286, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 121331, 0,   0.170648, 0, 1, 0, 1, 1, 'Leystone Lockbox'),
(@NPCID, 140022, 0,   0.085324, 0, 1, 0, 1, 1, 'Harvested Goods');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- LOOT NORMAL MODE
(@NPCID, 121007, 0, 0.595829, 0, 1, 1, 1, 1, 'Rhut''van Sabatons'),
(@NPCID, 121044, 0, 0.198610, 0, 1, 1, 1, 1, 'Faronaar Chain Helm'),
-- LOOT HEROIC MODE
(@NPCID, 121368, 0, 0.156390, 0, 1, 1, 1, 1, 'Sunbleached Shirt'),
(@NPCID, 121364, 0, 0.134048, 0, 1, 1, 1, 1, 'Sunbleached Cowl'),
(@NPCID, 121005, 0, 0.067024, 0, 1, 1, 1, 1, 'Rhut''van Legplates'),
(@NPCID, 121040, 0, 0.044683, 0, 1, 1, 1, 1, 'Faronaar Chain Belt'),
(@NPCID, 121021, 0, 0.044683, 0, 1, 1, 1, 1, 'Llothien Hood'),
(@NPCID, 121004, 0, 0.044683, 0, 1, 1, 1, 1, 'Rhut''van Helm'),
(@NPCID, 121049, 0, 0.044683, 0, 1, 1, 1, 1, 'Temporal Scholar''s Cowl'),
(@NPCID, 121050, 0, 0.022341, 0, 1, 1, 1, 1, 'Temporal Scholar''s Handwraps'),
-- LOOT MYTHIC MODE
(@NPCID, 121053, 0, 0.170648, 0, 1, 1, 1, 1, 'Temporal Scholar''s Sandals'),
(@NPCID, 141285, 0, 0.113766, 0, 1, 1, 1, 1, 'Nar''thalas Writ'),
(@NPCID, 121041, 0, 0.085324, 0, 1, 1, 1, 1, 'Faronaar Chain Bracers'),
(@NPCID, 121003, 0, 0.085324, 0, 1, 1, 1, 1, 'Rhut''van Girdle'),
-- LOOT HEROIC MODE AND MYTHIC MODE
(@NPCID, 121028, 0, 0.134048, 0, 1, 1, 1, 1, 'Azurewing Pendant');

DELETE FROM `skinning_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@NPCID, 124115, 0, 100.000000, 0, 1, 0, 1, 1, 'Stormscale'),
(@NPCID, 124438, 0,  18.750000, 0, 1, 0, 3, 8, 'Unbroken Claw'),
(@NPCID, 129894, 0,   4.076087, 1, 1, 0, 1, 1, 'Stormscale Spark'),
(@NPCID, 124124, 0,   1.222826, 0, 1, 0, 1, 1, 'Blood of Sargeras');

SET @PATH := @NPCID * 10;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@GUID, @PATH, 0, 0, 1, 0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@PATH,	 1,	-3264.82, 3762.49, 3.27261, 0, 0, 0, 0, 100, 0),
(@PATH,	 2,	-3270.44, 3764.12, 1.71888, 0, 0, 0, 0, 100, 0),
(@PATH,	 3,	-3277.98, 3760.81, 0.21990, 0, 0, 0, 0, 100, 0),
(@PATH,	 4,	-3278.43, 3750.81, 5.39553, 0, 0, 0, 0, 100, 0),
(@PATH,	 5,	-3269.24, 3747.45, 8.16710, 0, 0, 0, 0, 100, 0),
(@PATH,	 6,	-3257.74, 3745.92, 9.08789, 0, 0, 0, 0, 100, 0),
(@PATH,	 7,	-3243.93, 3745.85, 9.30759, 0, 0, 0, 0, 100, 0),
(@PATH,	 8,	-3230.20, 3753.12, 7.75063, 0, 0, 0, 0, 100, 0),
(@PATH,	 9,	-3219.58, 3758.62, 6.37090, 0, 0, 0, 0, 100, 0),
(@PATH,	10,	-3209.03, 3757.34, 7.95530, 0, 0, 0, 0, 100, 0),
(@PATH,	11,	-3197.80, 3754.81, 8.13577, 0, 0, 0, 0, 100, 0),
(@PATH,	12,	-3185.70, 3754.27, 6.83971, 0, 0, 0, 0, 100, 0),
(@PATH,	13,	-3181.62, 3760.84, 4.77781, 0, 0, 0, 0, 100, 0),
(@PATH,	14,	-3186.24, 3765.59, 3.53244, 0, 0, 0, 0, 100, 0),
(@PATH,	15,	-3197.00, 3764.64, 3.79929, 0, 0, 0, 0, 100, 0),
(@PATH,	16,	-3205.65, 3764.09, 4.59651, 0, 0, 0, 0, 100, 0),
(@PATH,	17,	-3217.47, 3763.89, 5.04053, 0, 0, 0, 0, 100, 0),
(@PATH,	18,	-3226.15, 3763.73, 5.40727, 0, 0, 0, 0, 100, 0),
(@PATH,	19,	-3235.06, 3763.60, 7.19110, 0, 0, 0, 0, 100, 0),
(@PATH,	20, -3243.52, 3767.04, 5.75902, 0, 0, 0, 0, 100, 0),
(@PATH,	21, -3256.54, 3769.63, 4.29802, 0, 0, 0, 0, 100, 0),
(@PATH,	22, -3264.95, 3768.77, 3.20053, 0, 0, 0, 0, 100, 0),
(@PATH,	23, -3259.43, 3762.25, 4.49482, 0, 0, 0, 0, 100, 0);

-- https://www.wowhead.com/npc=101411/gom-crabbar
SET @NPCID := 101411;
SET @GUID  := 280000096;

DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=@NPCID;
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(@GUID, @NPCID, 1456, 8040, 8082, '1,2,8,23', 0, 0, 0, -1, 0, 0, -3200.16, 4643.28, 2.93886, 2.20196, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

UPDATE `creature_template` SET `minlevel`=100, `maxlevel`=111, `faction`=14, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32832, `unit_flags2`=2099200, `lootid`=@NPCID, `skinloot`=@NPCID WHERE `entry`=@NPCID;

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 141690, 0,  93.726316, 0, 1, 0, 1, 1, 'Symbol of Victory'), 
(@NPCID, 132190, 0,  48.294737, 0, 1, 0, 1, 1, 'Pointed Tail Tip'),
(@NPCID, 132183, 0,   5.936842, 0, 1, 0, 1, 1, 'Razor Tooth'),
(@NPCID, 132184, 0,   4.084211, 0, 1, 0, 1, 1, 'Intact Shimmering Scale'),
(@NPCID, 141689, 0,  55.686726, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT NORMAL MODE
(@NPCID, 137781, 0,   0.252632, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
-- LOOT HEROIC MODE
(@NPCID, 124437, 0,   4.031097, 0, 1, 0, 1, 3, 'Shal''dorei Silk'),
(@NPCID, 140222, 0,   0.431903, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 140227, 0,   0.294737, 0, 1, 0, 1, 1, 'Bloodhunter''s Quarry'),
(@NPCID, 140220, 0,   0.336842, 0, 1, 0, 1, 1, 'Scavenged Cloth'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,  63.315400, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 140226, 0,   0.336247, 0, 1, 0, 1, 1, 'Mana-Tinged Pack');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- LOOT NORMAL MODE
(@NPCID, 121028, 0, 0.294737, 0, 1, 1, 1, 1, 'Azurewing Pendant'),
(@NPCID, 121001, 0, 0.084211, 0, 1, 1, 1, 1, 'Rhut''van Breastplate'),
-- LOOT NORMAL MODE AND HEROIC MODE
(@NPCID, 121051, 0, 0.126316, 0, 1, 1, 1, 1, 'Temporal Scholar''s Leggings'),
-- LOOT HEROIC MODE
(@NPCID, 121352, 0, 0.201555, 0, 1, 1, 1, 1, 'Weatherworn Pants'),
(@NPCID, 121042, 0, 0.172761, 0, 1, 1, 1, 1, 'Faronaar Chain Gauntlets'),
(@NPCID, 121002, 0, 0.172761, 0, 1, 1, 1, 1, 'Rhut''van Gauntlets'),
(@NPCID, 121335, 0, 0.172761, 0, 1, 1, 1, 1, 'Fixing Axe'),
(@NPCID, 121369, 0, 0.172761, 0, 1, 1, 1, 1, 'Weatherworn Vest'),
(@NPCID, 121019, 0, 0.115174, 0, 1, 1, 1, 1, 'Llothien Britches'),
(@NPCID, 121023, 0, 0.084211, 0, 1, 1, 1, 1, 'Llothien Shoulders'),
(@NPCID, 141285, 0, 0.028794, 0, 1, 1, 1, 1, 'Nar''thalas Writ'),
-- LOOT MYTHIC MODE
(@NPCID, 121360, 0, 0.336247, 0, 1, 1, 1, 1, 'Warped-Plate Gauntlets'),
(@NPCID, 121024, 0, 0.201748, 0, 1, 1, 1, 1, 'Llothien Waistband'),
(@NPCID, 121357, 0, 0.100874, 0, 1, 1, 1, 1, 'Rust-Encrusted Gloves'),
(@NPCID, 121054, 0, 0.033625, 0, 1, 1, 1, 1, 'Temporal Scholar''s Sandals');

DELETE FROM `skinning_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@NPCID, 124115, 0, 100.000000, 0, 1, 0, 1, 1, 'Stormscale'),
(@NPCID, 124438, 0,   5.229518, 0, 1, 0, 3, 8, 'Unbroken Claw'),
(@NPCID, 129894, 0,   2.033701, 1, 1, 0, 1, 1, 'Stormscale Spark'),
(@NPCID, 129746, 0,   1.743173, 0, 1, 0, 1, 1, 'Oddly-Shaped Stomach');

SET @PATH := @NPCID * 10;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@GUID, @PATH, 0, 0, 1, 0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@PATH,	 1,	-3205.79, 4651.72, 2.57717, 0, 0, 0, 0, 100, 0),
(@PATH,	 2,	-3211.08, 4657.05, 2.02384, 0, 0, 0, 0, 100, 0),
(@PATH,	 3,	-3216.58, 4662.57, 1.37196, 0, 0, 0, 0, 100, 0),
(@PATH,	 4,	-3227.49, 4673.54, 2.06228, 0, 0, 0, 0, 100, 0),
(@PATH,	 5,	-3232.43, 4682.45, 3.90306, 0, 0, 0, 0, 100, 0),
(@PATH,	 6,	-3239.67, 4675.07, 7.17712, 0, 0, 0, 0, 100, 0),
(@PATH,	 7,	-3244.44, 4670.26, 8.70356, 0, 0, 0, 0, 100, 0),
(@PATH,	 8,	-3245.70, 4662.58, 8.37114, 0, 0, 0, 0, 100, 0),
(@PATH,	 9,	-3236.93, 4662.28, 6.58848, 0, 0, 0, 0, 100, 0),
(@PATH,	10,	-3241.82, 4670.94, 8.25056, 0, 0, 0, 0, 100, 0),
(@PATH,	11,	-3239.30, 4677.58, 5.89262, 0, 0, 0, 0, 100, 0),
(@PATH,	12,	-3229.19, 4675.15, 2.45458,	0, 0, 0, 0, 100, 0),
(@PATH,	13,	-3219.24, 4663.31, 0.99093,	0, 0, 0, 0, 100, 0),
(@PATH,	14,	-3209.03, 4664.17, 1.93404,	0, 0, 0, 0, 100, 0),
(@PATH,	15,	-3196.86, 4669.88, 3.28592,	0, 0, 0, 0, 100, 0),
(@PATH,	16,	-3186.53, 4674.20, 3.58317,	0, 0, 0, 0, 100, 0),
(@PATH,	17,	-3169.61, 4680.63, 2.36667,	0, 0, 0, 0, 100, 0),
(@PATH,	18,	-3156.69, 4686.52, 1.15530,	0, 0, 0, 0, 100, 0),
(@PATH,	19,	-3148.33, 4690.21, -0.6699,	0, 0, 0, 0, 100, 0),
(@PATH,	20,	-3154.52, 4700.92, 0.31681,	0, 0, 0, 0, 100, 0),
(@PATH,	21,	-3155.99, 4702.65, 0.35878,	0, 0, 0, 0, 100, 0),
(@PATH,	22,	-3168.66, 4709.27, 1.69796,	0, 0, 0, 0, 100, 0),
(@PATH,	23,	-3182.10, 4715.25, 1.01565,	0, 0, 0, 0, 100, 0),
(@PATH,	24,	-3197.44, 4715.63, 0.31603,	0, 0, 0, 0, 100, 0),
(@PATH,	25,	-3199.50, 4704.49, 0.50918,	0, 0, 0, 0, 100, 0),
(@PATH,	26,	-3196.87, 4693.22, 2.27077,	0, 0, 0, 0, 100, 0),
(@PATH,	27,	-3202.74, 4676.79, 2.39371,	0, 0, 0, 0, 100, 0),
(@PATH,	28,	-3215.23, 4661.56, 1.50931,	0, 0, 0, 0, 100, 0),
(@PATH,	29,	-3220.34, 4645.91, 0.71165,	0, 0, 0, 0, 100, 0),
(@PATH,	30,	-3224.95, 4632.08, 0.79942,	0, 0, 0, 0, 100, 0),
(@PATH,	31,	-3238.11, 4621.57, 0.68377,	0, 0, 0, 0, 100, 0),
(@PATH,	32,	-3255.80, 4625.08, -1.3812,	0, 0, 0, 0, 100, 0),
(@PATH,	33,	-3265.77, 4632.03, 0.47145,	0, 0, 0, 0, 100, 0),
(@PATH,	34,	-3270.38, 4641.37, 0.54572,	0, 0, 0, 0, 100, 0),
(@PATH,	35,	-3272.82, 4656.57, 0.48893,	0, 0, 0, 0, 100, 0),
(@PATH,	36,	-3269.86, 4675.81, 1.25473,	0, 0, 0, 0, 100, 0),
(@PATH,	37,	-3273.03, 4684.67, 2.14571,	0, 0, 0, 0, 100, 0),
(@PATH,	38,	-3285.75, 4691.07, 3.23186,	0, 0, 0, 0, 100, 0),
(@PATH,	39,	-3290.47, 4680.69, 2.25305,	0, 0, 0, 0, 100, 0),
(@PATH,	40,	-3288.74, 4662.53, 0.31239,	0, 0, 0, 0, 100, 0),
(@PATH,	41,	-3291.61, 4648.67, 1.38440,	0, 0, 0, 0, 100, 0),
(@PATH,	42,	-3294.40, 4635.13, 2.17184,	0, 0, 0, 0, 100, 0),
(@PATH,	43,	-3276.74, 4629.81, 1.78920,	0, 0, 0, 0, 100, 0),
(@PATH,	44,	-3264.00, 4624.15, -0.7916,	0, 0, 0, 0, 100, 0),
(@PATH,	45,	-3247.01, 4617.57, 0.06037,	0, 0, 0, 0,	100, 0),
(@PATH,	46,	-3235.95, 4609.19, 2.02430,	0, 0, 0, 0,	100, 0),
(@PATH,	47,	-3226.07, 4605.45, 1.75693,	0, 0, 0, 0,	100, 0),
(@PATH,	48,	-3212.39, 4613.24, 2.23333,	0, 0, 0, 0,	100, 0),
(@PATH,	49,	-3199.69, 4621.13, 2.39412,	0, 0, 0, 0,	100, 0),
(@PATH,	50,	-3190.35, 4629.04, 2.98046,	0, 0, 0, 0,	100, 0),
(@PATH,	51,	-3195.38, 4639.15, 2.80185,	0, 0, 0, 0,	100, 0);

-- https://www.wowhead.com/npc=108543/dread-captain-thedon
SET @NPCID  := 108541;
SET @GUID   := 280000093;
SET @MAP    := 1456;
SET @ZONE   := 8040;
SET @AREA   := 8082;
SET @SPWDIF := '1,2,8,23';

DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=@NPCID+2 OR `id`=@NPCID;
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(@GUID,  @NPCID+2, @MAP, @ZONE, @AREA, @SPWDIF, 0, 0, 0, -1, 0, 0, -3196.00, 4943.16, 1.407695, 3.36752, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 26972),
(@GUID+11, @NPCID, @MAP, @ZONE,	@AREA, @SPWDIF,	0, 0, 0, -1, 0, 0, -3201.72, 4945.23, 2.547480, 3.44842, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 26972),
(@GUID+12, @NPCID, @MAP, @ZONE,	@AREA, @SPWDIF,	0, 0, 0, -1, 0, 0, -3193.60, 4939.46, 0.885253, 3.21358, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 26972),
(@GUID+13, @NPCID, @MAP, @ZONE,	@AREA, @SPWDIF,	0, 0, 0, -1, 0, 0, -3196.78, 4952.52, 1.624980, 3.54267, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 26972);

UPDATE `creature_template` SET `minlevel`=101, `maxlevel`=101,  `faction`=14, `lootid`=@NPCID, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32832, `unit_flags2`=2099200 WHERE `entry`=@NPCID;
UPDATE `creature_template` SET `minlevel`=101, `maxlevel`=101,  `faction`=14, `lootid`=@NPCID+2, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32832, `unit_flags2`=2099200 WHERE `entry`=@NPCID+2;

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 132239, 0,  60.893855, 0, 1, 0, 1, 1, 'Bone Splinters'),
(@NPCID, 132238, 0,  33.519553, 0, 1, 0, 1, 1, 'Disjointed Jaw'),
(@NPCID, 132237, 0,  20.670391, 0, 1, 0, 1, 1, 'Large Leg Bone'),
(@NPCID, 141690, 0,  15.642458, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID, 124437, 0,   1.145038, 0, 1, 0, 2, 2, 'Shal''dorei Silk'),
(@NPCID, 141689, 0,   5.030891, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT HEROIC MODE
(@NPCID, 121331, 0,   0.882613, 0, 1, 0, 1, 1, 'Leystone Lockbox'),
(@NPCID, 140222, 0,   0.264784, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 140225, 0,   0.176523, 0, 1, 0, 1, 1, 'Salvaged Armor'),
-- LOOT MYTHIC MODE
(@NPCID, 138786, 0,   7.174888, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID, 140221, 0,   0.448430, 0, 1, 0, 1, 1, 'Found Sack of Gems');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- LOOT NORMAL MODE
(@NPCID, 121046, 0,  3.351955, 0, 1, 1, 1, 1, 'Faronaar Chain Spaulders'),
(@NPCID, 121028, 0,  0.413223, 0, 1, 1, 1, 1, 'Azurewing Pendant'),
-- LOOT HEROIC MODE
(@NPCID, 121042, 0,  0.529568, 0, 1, 1, 1, 1, 'Faronaar Chain Gauntlets'),
(@NPCID, 121019, 0,  0.529568, 0, 1, 1, 1, 1, 'Llothien Britches'),
(@NPCID, 121003, 0,  0.529568, 0, 1, 1, 1, 1, 'Rhut''van Girdle'),
(@NPCID, 121020, 0,  0.264784, 0, 1, 1, 1, 1, 'Llothien Gloves'),
(@NPCID, 121006, 0,  0.264784, 0, 1, 1, 1, 1, 'Rhut''van Pauldrons'),
(@NPCID, 121051, 0,  0.264784, 0, 1, 1, 1, 1, 'Temporal Scholar''s Leggings'),
(@NPCID, 121040, 0,  0.176523, 0, 1, 1, 1, 1, 'Faronaar Chain Belt'),
(@NPCID, 121048, 0,  0.088261, 0, 1, 1, 1, 1, 'Temporal Scholar''s Cord'),
(@NPCID, 121053, 0,  0.088261, 0, 1, 1, 1, 1, 'Temporal Scholar''s Sandals'),
-- LOOT MYTHIC MODE
(@NPCID, 121027, 0,  1.494768, 0, 1, 1, 1, 1, 'Azurewing Signet'),
(@NPCID, 121001, 0,  0.448430, 0, 1, 1, 1, 1, 'Rhut''van Breastplate');

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID+2;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID+2, 0, @NPCID+2, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID+2, 141690,   0,  88.555347, 0, 1, 0, 1, 1, 'Symbol of Victory'),
(@NPCID+2, 132239,   0,  28.705441, 0, 1, 0, 1, 1, 'Bone Splinters'),
(@NPCID+2, 132238,   0,  27.767355, 0, 1, 0, 1, 1, 'Disjointed Jaw'),
(@NPCID+2, 132237,   0,   7.317073, 0, 1, 0, 1, 1, 'Large Leg Bone'),
(@NPCID+2, 141689,   0,  57.247494, 0, 1, 0, 1, 1, 'Jewel of Victory'),
-- LOOT HEROIC MODE
(@NPCID+2, 140222, 0,   0.115652, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID+2, 121358, 0,   0.115652, 0, 1, 0, 1, 1, 'Sunbleached Handwraps'),
-- LOOT MYTHIC MODE
(@NPCID+2, 138786, 0,  42.410120, 0, 1, 0, 1, 1, 'Talisman of Victory'),
(@NPCID+2, 140220, 0,   0.199734, 0, 1, 0, 1, 1, 'Scavenged Cloth');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID+2;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- LOOT NORMAL MODE
(@NPCID+2, 141588, 0,   2.251407, 0, 1, 1, 1, 1, 'Talisman of Jaimil Lightheart'),
(@NPCID+2, 121006, 0,   1.125704, 0, 1, 1, 1, 1, 'Rhut''van Pauldrons'),
(@NPCID+2, 121015, 0,   0.562852, 0, 1, 1, 1, 1, 'Academy Faculty Pin'),
(@NPCID+2, 121045, 0,   0.562852, 0, 1, 1, 1, 1, 'Faronaar Chain Legguards'),
(@NPCID+2, 121002, 0,   0.562852, 0, 1, 1, 1, 1, 'Rhut''van Gauntlets'),
-- LOOT HEROIC MODE
(@NPCID+2, 121027, 0,   0.385505, 0, 1, 1, 1, 1, 'Azurewing Signet'),
(@NPCID+2, 121020, 0,   0.231303, 0, 1, 1, 1, 1, 'Llothien Gloves'),
(@NPCID+2, 121005, 0,   0.231303, 0, 1, 1, 1, 1, 'Rhut''van Legplates'),
(@NPCID+2, 121007, 0,   0.231303, 0, 1, 1, 1, 1, 'Rhut''van Sabatons'),
(@NPCID+2, 121021, 0,   0.115652, 0, 1, 1, 1, 1, 'Llothien Hood'),
(@NPCID+2, 121001, 0,   0.115652, 0, 1, 1, 1, 1, 'Rhut''van Breastplate'),
(@NPCID+2, 121054, 0,   0.115652, 0, 1, 1, 1, 1, 'Temporal Scholar''s Shoulderpads'),
(@NPCID+2, 121051, 0,   0.077101, 0, 1, 1, 1, 1, 'Temporal Scholar''s Leggings'),
-- LOOT MYTHIC MODE
(@NPCID+2, 121053, 0,   0.399467, 0, 1, 1, 1, 1, 'Temporal Scholar''s Sandals'),
(@NPCID+2, 121048, 0,   0.115652, 0, 1, 1, 1, 1, 'Temporal Scholar''s Cord'),
(@NPCID+2, 121022, 0,   0.115652, 0, 1, 1, 1, 1, 'Llothien Jerkin'),
(@NPCID+2, 141284, 0,   0.038551, 0, 1, 1, 1, 1, 'Nor''danil Ampoule');

SET @PATH := (@NPCID+2) * 10;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@GUID, @PATH, 0, 0, 1, 0, '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(@PATH, 1, -3219.25, 4938.94, 3.60249, 0, 0, 0,	0, 100,	0),
(@PATH,	2, -3216.78, 4922.25, 0.96621, 0, 0, 0,	0, 100,	0),
(@PATH,	3, -3201.39, 4922.74, 0.88962, 0, 0, 0,	0, 100,	0),
(@PATH,	4, -3197.60, 4940.92, 1.60689, 0, 0, 0,	0, 100,	0),
(@PATH,	5, -3200.39, 4957.05, 2.30123, 0, 0, 0, 0, 100,	0),
(@PATH,	6, -3208.98, 4954.23, 4.82233, 0, 0, 0, 0, 100, 0);

-- https://www.wowhead.com/quest=38286/eye-of-azshara-wrath-of-azshara
-- https://www.wowhead.com/npc=106847/wrath-of-azshara-eye-of-azshara-entered-quest-kill-credit
SET @NPCID := 106847;
SET @GUID  := 280000097;
DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=@NPCID;

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`,  `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(@GUID, @NPCID, 1456, 0, 0, '1,2,8,23', 0, 0, 0, -1, 0, 0, -3913.12, 4539.94, 86.2835, 5.77318, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPCID;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPCID;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,
`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPCID,0,0,0,10,0,100,0,1,200,0,0,33,@NPCID,0,0,0,0,0,18,20,0,0,0,0,0,0,'Wrath of azshara eye of azshara entered quest kill credit');

-- https://www.wowhead.com/npc=106780/tidestone-of-golganneth
SET @NPCID := 106780;
SET @GUID  := 280000098;

DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=@NPCID;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`,  `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES 
(@GUID, @NPCID, 1456, 0, 0, '1,2,8,23', 0, 0, 0, -1, 0, 0, -3477.82, 4360.3, 2.25957, 1.68833, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=@NPCID;

DELETE FROM `creature_queststarter` WHERE `id`=@NPCID AND `quest`=42213;
INSERT INTO `creature_queststarter` (`id`,`quest`) VALUES (@NPCID, 42213);

-- https://www.wowhead.com/quest=42213/eye-of-azshara-the-tidestone-of-golganneth
SET @NPCID := 106815;
SET @GUID  := 280000099;

DELETE FROM `creature` WHERE `guid`=@GUID AND `id`=@NPCID;
INSERT INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnDifficulties`,`phaseUseFlags`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`unit_flags2`,`unit_flags3`,`dynamicflags`,`ScriptName`,`VerifiedBuild`) VALUES
(@GUID, @NPCID, 1220, 0, 0, 1, 0, 0, 0, -1, 0, 0, -784.447, 4418.8, 602.48, 5.12842, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPCID;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPCID;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,
`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPCID,0,0,1,10,0,100,0,1,20,0,0,33,@NPCID,0,0,0,0,0,18,20,0,0,0,0,0,0,'the-tidestone-of-golganneth-teleport-used-quest-kill-credit-elm');

-- Inside Resurrection
DELETE FROM `instance_template` WHERE `map`=1456;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`, `insideResurrection`) VALUES 
(1456, 0, 'instance_eye_of_azshara', 1, 1);

-- https://www.wowhead.com/npc=91781/hatecoil-warrior
SET @NPCID := 91781;

UPDATE `creature_template` SET `lootid`=@NPCID, `pickpocketloot`=@NPCID, `AIName`='SmartAI', `spell1`=195094, `spell2`=176048, `spell3`=115385 WHERE `entry`=@NPCID;

DELETE FROM `creature_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- LOOT ALL MODE
(@NPCID, 0, @NPCID, 100.000000, 0, 1, 0, 2, 2, 'Reference'),
(@NPCID, 124437, 0,  48.993443, 0, 1, 0, 1, 1, 'Shal''dorei Silk'),
(@NPCID, 138993, 0,   2.599793, 1, 1, 0, 1, 1, 'Rarefied Water'),
(@NPCID, 132183, 0,   3.290003, 0, 1, 0, 1, 1, 'Razor Tooth'),
(@NPCID, 140224, 0,   0.977798, 0, 1, 0, 1, 1, 'Butchered Meat'),
(@NPCID, 138781, 0,   0.874267, 0, 1, 0, 1, 1, 'Brief History of the Aeons'),
(@NPCID, 132190, 0,   0.920281, 0, 1, 0, 1, 1, 'Pointed Tail Tip'),
(@NPCID, 124439, 0,   0.276084, 0, 1, 0, 1, 4, 'Unbroken Tooth'),
(@NPCID, 140220, 0,   0.218567, 0, 1, 0, 1, 1, 'Scavenged Cloth'),
(@NPCID, 138782, 0,   0.046014, 0, 1, 0, 1, 1, 'Brief History of the Ages'),
(@NPCID, 121389, 0,   0.034511, 0, 1, 0, 1, 1, 'Fossilized Egg'),
(@NPCID, 144345, 0,   0.023007, 0, 1, 0, 1, 1, 'Pile of Pet Goodies'),
(@NPCID, 140222, 0,   0.971837, 0, 1, 0, 1, 1, 'Harvested Goods'),
(@NPCID, 140227, 0,   0.654502, 0, 1, 0, 1, 1, 'Bloodhunter''s Quarry'),
(@NPCID, 140226, 0,   0.426418, 0, 1, 0, 1, 1, 'Mana-Tinged Pack'),
(@NPCID, 121385, 0,   0.198334, 0, 1, 0, 1, 1, 'Deteriorated Hearthstone Deck'),
(@NPCID, 140221, 0,   0.138834, 0, 1, 0, 1, 1, 'Found Sack of Gems'),
-- LOOT NORMAL MODE
(@NPCID, 121335, 0,   2.760842, 0, 1, 0, 1, 1, 'Fixing Axe'),
(@NPCID, 121351, 0,   2.289198, 0, 1, 0, 1, 1, 'Sunbleached Pants'),
(@NPCID, 121333, 0,   1.840561, 0, 1, 0, 1, 1, 'Poorly Weighted Blackjack'),
(@NPCID, 121350, 0,   1.460946, 0, 1, 0, 1, 1, 'Rust-Encrusted Leggings'),
(@NPCID, 121340, 0,   1.345911, 0, 1, 0, 1, 1, 'Lightning-Struck Hammer'),
(@NPCID, 121332, 0,   1.299896, 0, 1, 0, 1, 1, 'Over-Sharpened Shank'),
(@NPCID, 121343, 0,   1.219372, 0, 1, 0, 1, 1, 'Warped-Plate Belt'),
(@NPCID, 121346, 0,   1.115840, 0, 1, 0, 1, 1, 'Warped-Plate Vambraces'),
(@NPCID, 121338, 0,   0.874267, 0, 1, 0, 1, 1, 'Bent-Blade Axe'),
(@NPCID, 121363, 0,   0.897274, 0, 1, 0, 1, 1, 'Warped-Plate Helmet'),
(@NPCID, 121365, 0,   0.575175, 0, 1, 0, 1, 1, 'Warped-Plate Leggings'),
(@NPCID, 121353, 0,   0.897274, 0, 1, 0, 1, 1, 'Warped-Plate Pauldrons'),
(@NPCID, 121359, 0,   0.839756, 0, 1, 0, 1, 1, 'Weatherworn Gloves'),
(@NPCID, 121334, 0,   0.736225, 0, 1, 0, 1, 1, 'Mining Sword'),
(@NPCID, 121357, 0,   0.736225, 0, 1, 0, 1, 1, 'Rust-Encrusted Gloves'),
(@NPCID, 121347, 0,   0.713218, 0, 1, 0, 1, 1, 'Rust-Encrusted Wristguards'),
(@NPCID, 121360, 0,   0.678707, 0, 1, 0, 1, 1, 'Warped-Plate Gauntlets'),
(@NPCID, 121373, 0,   0.644196, 0, 1, 0, 1, 1, 'Weatherworn Boots'),
(@NPCID, 121362, 0,   0.586679, 0, 1, 0, 1, 1, 'Weatherworn Hood'),
(@NPCID, 121349, 0,   0.575175, 0, 1, 0, 1, 1, 'Weatherworn Wristguards'),
(@NPCID, 121337, 0,   0.471644, 0, 1, 0, 1, 1, 'Permanently Jammed Blunderbuss'),
(@NPCID, 121364, 0,   0.540665, 0, 1, 0, 1, 1, 'Sunbleached Cowl'),
(@NPCID, 121368, 0,   0.460140, 0, 1, 0, 1, 1, 'Sunbleached Shirt'),
(@NPCID, 121367, 0,   0.483147, 0, 1, 0, 1, 1, 'Warped-Plate Breastplate'),
(@NPCID, 121345, 0,   0.483147, 0, 1, 0, 1, 1, 'Weatherworn Belt'),
(@NPCID, 121336, 0,   0.379616, 0, 1, 0, 1, 1, 'Mossy Longbow'),
(@NPCID, 121341, 0,   0.414126, 0, 1, 0, 1, 1, 'Robble''s Staff of Discourse'),
(@NPCID, 121361, 0,   0.437133, 0, 1, 0, 1, 1, 'Rust-Encrusted Coif'),
(@NPCID, 121371, 0,   0.402623, 0, 1, 0, 1, 1, 'Rust-Encrusted Sabatons'),
(@NPCID, 121372, 0,   0.414126, 0, 1, 0, 1, 1, 'Sunbleached Sandals'),
(@NPCID, 121348, 0,   0.402623, 0, 1, 0, 1, 1, 'Sunbleached Wristwraps'),
(@NPCID, 121370, 0,   0.414126, 0, 1, 0, 1, 1, 'Warped-Plate Stompers'),
(@NPCID, 121352, 0,   0.356609, 0, 1, 0, 1, 1, 'Weatherworn Pants'),
(@NPCID, 121369, 0,   0.368112, 0, 1, 0, 1, 1, 'Weatherworn Vest'),
(@NPCID, 121339, 0,   0.299091, 0, 1, 0, 1, 1, 'Kvaldir Skinning Knife'),
(@NPCID, 121391, 0,   0.264581, 0, 1, 0, 1, 1, 'Poison-Soaked Cuffs'),
(@NPCID, 121366, 0,   0.333602, 0, 1, 0, 1, 1, 'Rust-Encrusted Hauberk'),
(@NPCID, 121356, 0,   0.253077, 0, 1, 0, 1, 1, 'Sunbleached Armice'),
(@NPCID, 121344, 0,   0.276084, 0, 1, 0, 1, 1, 'Sunbleached Cord'),
(@NPCID, 121358, 0,   0.230070, 0, 1, 0, 1, 1, 'Sunbleached Handwraps'),
(@NPCID, 153246, 0,   0.149546, 0, 1, 0, 1, 1, 'Strangely-Flawed Gemstone'),
(@NPCID, 121342, 0,   0.115035, 0, 1, 0, 1, 1, 'Rust-Encrusted Chain Belt'),
(@NPCID, 121384, 0,   0.103532, 0, 1, 0, 1, 1, 'Elemental Bindings'),
(@NPCID, 121019, 0,   0.080525, 0, 1, 0, 1, 1, 'Anund''s Bandages'),
(@NPCID, 142119, 0,   0.069021, 0, 1, 0, 1, 1, 'Recipe: Potion of Prolonged Power'),
(@NPCID, 121376, 0,   0.069021, 0, 1, 0, 1, 1, 'Azsharan Queensguard Blade'),
(@NPCID, 121386, 0,   0.057518, 0, 1, 0, 1, 1, 'Cord of Mandibles'),
(@NPCID, 121374, 0,   0.057518, 0, 1, 0, 1, 1, 'Indecipherable Map'),
(@NPCID, 121399, 0,   0.046014, 0, 1, 0, 1, 1, 'Unbalanced Glaive Tossers'),
(@NPCID, 121331, 0,   0.034511, 0, 1, 0, 1, 1, 'Leystone Lockbox'),
(@NPCID, 141051, 0,   0.034511, 0, 1, 0, 1, 1, 'Technique: Glyph of the Trident'),
(@NPCID, 121404, 0,   0.034511, 0, 1, 0, 1, 1, 'Badly Rolled Helmet'),
(@NPCID, 121401, 0,   0.034511, 0, 1, 0, 1, 1, 'Gloves of the Transient'),
(@NPCID, 121413, 0,   0.023007, 0, 1, 0, 1, 1, 'Two-Toed Warboots'),
(@NPCID, 121411, 0,   0.023007, 0, 1, 0, 1, 1, 'Waterlogged Leather Jerkin'),
(@NPCID, 121405, 0,   0.011504, 0, 1, 0, 1, 1, 'Damaged Berserker''s Plate Helm'),
(@NPCID, 121407, 0,   0.011504, 0, 1, 0, 1, 1, 'Empty Rocket-Propelled Legplates'),
-- LOOT HEROIC MODE
(@NPCID, 124124, 0,   1.001587, 0, 1, 0, 1, 1, 'Blood of Sargeras'),
(@NPCID, 141689, 0,   0.823086, 0, 1, 0, 1, 1, 'Jewel of Victory'),
(@NPCID, 140225, 0,   0.109084, 0, 1, 0, 1, 1, 'Salvaged Armor'),
(@NPCID, 132218, 0,   0.069417, 0, 1, 0, 1, 1, 'Glob of Elemental Goo'),
(@NPCID, 121408, 0,   0.059500, 0, 1, 0, 1, 1, 'Puka''s Missing Ball'),
(@NPCID, 121394, 0,   0.039667, 0, 1, 0, 1, 1, 'Raider''s Countdown Timer'),
(@NPCID, 141587, 0,   0.029750, 0, 1, 0, 1, 1, 'Queen Yh''saerie''s Pendant'),
(@NPCID, 121395, 0,   0.019833, 0, 1, 0, 1, 1, 'Enhanced Sours'),
-- LOOT MYTHIC MODE
(@NPCID, 151157, 0,   0.194062, 0, 1, 0, 2, 2, 'Flashy Chronometer'),
(@NPCID, 138001, 0,   0.019406, 0, 1, 0, 1, 1, 'Pattern: Imbued Silkweave Shade'),
(@NPCID, 144330, 0,   0.019406, 0, 1, 0, 1, 1, 'Sprocket Container');

DELETE FROM `reference_loot_template` WHERE `entry`=@NPCID;
INSERT INTO `reference_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- LOOT NORMAL MODE
(@NPCID, 141284, 0, 1.932589, 0, 1, 1, 1, 1, 'Nor''danil Ampoule'),
(@NPCID, 121004, 0, 1.334407, 0, 1, 1, 1, 1, 'Rhut''van Helm'),
(@NPCID, 121005, 0, 1.311400, 0, 1, 1, 1, 1, 'Rhut''van Legplates'),
(@NPCID, 121012, 0, 1.196365, 0, 1, 1, 1, 1, 'Azurewing Defender''s Drape'),
(@NPCID, 121049, 0, 0.977798, 0, 1, 1, 1, 1, 'Temporal Scholar''s Cowl'),
(@NPCID, 121042, 0, 0.736225, 0, 1, 1, 1, 1, 'Faronaar Chain Gauntlets'),
(@NPCID, 121045, 0, 0.678707, 0, 1, 1, 1, 1, 'Faronaar Chain Legguards'),
(@NPCID, 121027, 0, 0.609686, 0, 1, 1, 1, 1, 'Azurewing Signet'),
(@NPCID, 141285, 0, 0.586679, 0, 1, 1, 1, 1, 'Nar''thalas Writ'),
(@NPCID, 121001, 0, 0.598182, 0, 1, 1, 1, 1, 'Rhut''van Breastplate'),
(@NPCID, 121041, 0, 0.506154, 0, 1, 1, 1, 1, 'Faronaar Chain Bracers'),
(@NPCID, 121044, 0, 0.529161, 0, 1, 1, 1, 1, 'Faronaar Chain Helm'),
(@NPCID, 121047, 0, 0.494651, 0, 1, 1, 1, 1, 'Faronaar Chain Vest'),
(@NPCID, 121052, 0, 0.471644, 0, 1, 1, 1, 1, 'Temporal Scholar''s Robe'),
(@NPCID, 121053, 0, 0.540665, 0, 1, 1, 1, 1, 'Temporal Scholar''s Sandals'),
(@NPCID, 121040, 0, 0.356609, 0, 1, 1, 1, 1, 'Faronaar Chain Belt'),
(@NPCID, 121046, 0, 0.368112, 0, 1, 1, 1, 1, 'Faronaar Chain Spaulders'),
(@NPCID, 121017, 0, 0.402623, 0, 1, 1, 1, 1, 'Llothien Bindings'),
(@NPCID, 121018, 0, 0.356609, 0, 1, 1, 1, 1, 'Llothien Boots'),
(@NPCID, 121021, 0, 0.414126, 0, 1, 1, 1, 1, 'Llothien Hood'),
(@NPCID, 121024, 0, 0.437133, 0, 1, 1, 1, 1, 'Llothien Waistband'),
(@NPCID, 121006, 0, 0.448637, 0, 1, 1, 1, 1, 'Rhut''van Pauldrons'),
(@NPCID, 121055, 0, 0.414126, 0, 1, 1, 1, 1, 'Temporal Scholar''s Wristwraps'),
(@NPCID, 121015, 0, 0.276084, 0, 1, 1, 1, 1, 'Academy Faculty Pin'),
(@NPCID, 121016, 0, 0.310595, 0, 1, 1, 1, 1, 'Corsair''s Spyglass'),
(@NPCID, 121022, 0, 0.287588, 0, 1, 1, 1, 1, 'Llothien Jerkin'),
(@NPCID, 121023, 0, 0.345105, 0, 1, 1, 1, 1, 'Llothien Shoulders'),
(@NPCID, 121014, 0, 0.333602, 0, 1, 1, 1, 1, 'Preserved Blue Dragon Scale'),
(@NPCID, 121002, 0, 0.287588, 0, 1, 1, 1, 1, 'Rhut''van Gauntlets'),
(@NPCID, 121008, 0, 0.287588, 0, 1, 1, 1, 1, 'Rhut''van Vambraces'),
(@NPCID, 121048, 0, 0.287588, 0, 1, 1, 1, 1, 'Temporal Scholar''s Cord'),
(@NPCID, 121050, 0, 0.276084, 0, 1, 1, 1, 1, 'Temporal Scholar''s Handwraps'),
(@NPCID, 121028, 0, 0.218567, 0, 1, 1, 1, 1, 'Azurewing Pendant'),
(@NPCID, 121043, 0, 0.241574, 0, 1, 1, 1, 1, 'Faronaar Chain Greaves'),
(@NPCID, 121020, 0, 0.218567, 0, 1, 1, 1, 1, 'Llothien Gloves'),
(@NPCID, 121051, 0, 0.230070, 0, 1, 1, 1, 1, 'Temporal Scholar''s Leggings'),
(@NPCID, 121054, 0, 0.241574, 0, 1, 1, 1, 1, 'Temporal Scholar''s Shoulderpads'),
(@NPCID, 121007, 0, 0.138042, 0, 1, 1, 1, 1, 'Rhut''van Sabatons'),
(@NPCID, 121003, 0, 0.092028, 0, 1, 1, 1, 1, 'Rhut''van Girdle'),
(@NPCID, 121019, 0, 0.080525, 0, 1, 1, 1, 1, 'Llothien Britches'),
-- LOOT HEROIC MODE
(@NPCID, 134441, 0, 0.119000, 0, 1, 1, 1, 1, 'Shellshock Footguards'),
(@NPCID, 134492, 0, 0.039667, 0, 1, 1, 1, 1, 'Hatecoil Commander''s Amulet');

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=@NPCID;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@NPCID, 151155, 0, 18.002257, 0, 1, 0, 1, 3, 'Mana-Etched Signet'),
(@NPCID, 151156, 0, 16.760722, 0, 1, 0, 1, 3, 'Manaweft Bracelet'),
(@NPCID, 151147, 0,  7.787810, 0, 1, 0, 1, 4, 'Charmed Pendant'),
(@NPCID, 151151, 0,  6.828442, 0, 1, 0, 1, 4, 'Tacky Chronometer'),
(@NPCID, 151153, 0,  5.699774, 0, 1, 0, 1, 3, 'Glinting Manaseal'),
(@NPCID, 151154, 0,  5.756208, 0, 1, 0, 1, 3, 'Managleam Pendant'),
(@NPCID, 151148, 0,  5.417607, 0, 1, 0, 1, 4, 'Charmed Choker'),
(@NPCID, 151157, 0,  3.837472, 0, 1, 0, 1, 3, 'Flashy Chronometer'),
(@NPCID, 151150, 0,  4.119639, 0, 1, 0, 1, 4, 'Charmed Bracelet'),
(@NPCID, 151149, 0,  5.417607, 0, 1, 0, 1, 4, 'Charmed Ring'),
(@NPCID, 136547, 0,  5.417607, 0, 1, 0, 1, 1, 'Deep Sea Queenfish Cakes'),
(@NPCID, 151152, 0,  4.176072, 0, 1, 0, 1, 3, 'Star-Etched Ring'),
(@NPCID, 151146, 0,  4.176072, 0, 1, 0, 1, 4, 'Charmed Band'),
(@NPCID, 136562, 0,  4.176072, 0, 1, 0, 1, 1, 'Deep Sea Spirit'),
(@NPCID, 136546, 0,  4.176072, 0, 1, 0, 1, 1, 'Fresh Crawler Salad'),
(@NPCID, 136569, 0,  1.523702, 0, 1, 0, 1, 1, 'Aged Health Potion'),
(@NPCID, 139781, 0,  1.523702, 0, 1, 0, 1, 1, 'Marin Noggenfogger''s Lucky Coin'),
(@NPCID, 151158, 0,  1.523702, 0, 1, 0, 1, 1, 'Manaforged Worry-Chain'),
(@NPCID, 151115, 0,  1.523702, 0, 1, 0, 1, 1, 'Mana-Cloaked Choker'),
(@NPCID, 136572, 0,  1.523702, 0, 1, 0, 1, 1, 'Sand Dollar'),
(@NPCID, 151160, 0,  0.451467, 0, 1, 0, 1, 1, 'Elegant Manabraid'),
(@NPCID, 151159, 0,  0.677201, 0, 1, 0, 1, 1, 'Managraphic Card'),
(@NPCID, 151161, 0,  0.338600, 0, 1, 0, 1, 1, 'Subtle Chronometer'),
(@NPCID, 151163, 0,  0.507901, 0, 1, 0, 1, 1, 'Locket of Magical Memories'),
(@NPCID, 151162, 0,  0.620767, 0, 1, 0, 1, 1, 'Glitzy Mana-Chain');
