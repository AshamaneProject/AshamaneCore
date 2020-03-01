/*

FIX Stormwind Guard Gossip

*/

-- DELETE EXISTING Menu Options
DELETE FROM gossip_menu_option WHERE MenuId = 435;


DELETE FROM `quest_poi_points` WHERE (`QuestID`=31859 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=31858 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=31857 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=31856 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=31855 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=29691 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=29691 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=10483 AND `Idx1`=2 AND `Idx2`=0) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=8) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=7) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=6) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=5) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=4) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=3) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=2) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=1) OR (`QuestID`=10483 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=10483 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=10143 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=10143 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=10055 AND `Idx1`=3 AND `Idx2`=0) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=11) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=10) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=9) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=8) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=7) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=6) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=5) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=4) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=3) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=2) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=1) OR (`QuestID`=10055 AND `Idx1`=2 AND `Idx2`=0) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=11) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=10) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=9) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=8) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=7) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=6) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=5) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=4) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=3) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=2) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=1) OR (`QuestID`=10055 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=10055 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=9625 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=9625 AND `Idx1`=0 AND `Idx2`=0) OR (`QuestID`=9559 AND `Idx1`=1 AND `Idx2`=0) OR (`QuestID`=9559 AND `Idx1`=0 AND `Idx2`=0);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(31859, 0, 0, 3837, 1799, 27481), -- 31859
(31858, 0, 0, 3837, 1799, 27481), -- 31858
(31857, 0, 0, 3837, 1799, 27481), -- 31857
(31856, 0, 0, 3837, 1799, 27481), -- 31856
(31855, 0, 0, 3837, 1799, 27481), -- 31855
(29691, 1, 0, 34, -42, 27481), -- 29691
(29691, 0, 0, 34, -42, 27481), -- 29691
(10483, 2, 0, -592, 2910, 27481), -- 10483
(10483, 1, 8, -1147, 1889, 27481), -- 10483
(10483, 1, 7, -1192, 1901, 27481), -- 10483
(10483, 1, 6, -1205, 1907, 27481), -- 10483
(10483, 1, 5, -1200, 2128, 27481), -- 10483
(10483, 1, 4, -1187, 2271, 27481), -- 10483
(10483, 1, 3, -1157, 2431, 27481), -- 10483
(10483, 1, 2, -854, 2142, 27481), -- 10483
(10483, 1, 1, -808, 2027, 27481), -- 10483
(10483, 1, 0, -835, 1854, 27481), -- 10483
(10483, 0, 0, -701, 1875, 27481), -- 10483
(10143, 1, 0, -609, 2351, 27481), -- 10143
(10143, 0, 0, -680, 1855, 27481), -- 10143
(10055, 3, 0, -596, 2891, 27481), -- 10055
(10055, 2, 11, -376, 2221, 27481), -- 10055
(10055, 2, 10, -501, 2335, 27481), -- 10055
(10055, 2, 9, -523, 2416, 27481), -- 10055
(10055, 2, 8, -523, 2574, 27481), -- 10055
(10055, 2, 7, -523, 2666, 27481), -- 10055
(10055, 2, 6, -517, 2818, 27481), -- 10055
(10055, 2, 5, -457, 2932, 27481), -- 10055
(10055, 2, 4, -354, 2894, 27481), -- 10055
(10055, 2, 3, -332, 2769, 27481), -- 10055
(10055, 2, 2, -316, 2672, 27481), -- 10055
(10055, 2, 1, -267, 2286, 27481), -- 10055
(10055, 2, 0, -273, 2210, 27481), -- 10055
(10055, 1, 11, -409, 2264, 27481), -- 10055
(10055, 1, 10, -501, 2530, 27481), -- 10055
(10055, 1, 9, -523, 2607, 27481), -- 10055
(10055, 1, 8, -528, 2927, 27481), -- 10055
(10055, 1, 7, -468, 3030, 27481), -- 10055
(10055, 1, 6, -387, 2916, 27481), -- 10055
(10055, 1, 5, -343, 2829, 27481), -- 10055
(10055, 1, 4, -322, 2748, 27481), -- 10055
(10055, 1, 3, -300, 2612, 27481), -- 10055
(10055, 1, 2, -300, 2514, 27481), -- 10055
(10055, 1, 1, -300, 2389, 27481), -- 10055
(10055, 1, 0, -300, 2226, 27481), -- 10055
(10055, 0, 0, -596, 2891, 27481), -- 10055
(9625, 1, 0, -3972, -11928, 27481), -- 9625
(9625, 0, 0, -2670, -12131, 27481), -- 9625
(9559, 1, 0, -4181, -12510, 27481), -- 9559
(9559, 0, 0, -3353, -12400, 27481); -- 9559


-- DELETE FROM `points_of_interest` WHERE `ID` IN (90,91,95,2422,92,2427,2426,2423,527,2418,870,);
INSERT IGNORE INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `Icon`, `Flags`, `Importance`, `Name`, `VerifiedBuild`) VALUES
(90, -8717.89, 464.542, 7, 99, 0, 'Stormwind Leatherworking & Skinning', 27481),
(91, -8979.49, 763.873, 7, 99, 0, 'Stormwind Alchemy & Herbalism', 27481),
(95, -8431.96, 687.125, 7, 99, 0, 'Stormwind Mining', 27481),
(2422, -8780.08, 378.651, 7, 99, 0, 'Stormwind Riding Trainer & Mounts', 27481),
(92, -8941.56, 783.764, 7, 99, 0, 'Stormwind Tailoring', 27481),
(2427, -8767.48, 408.564, 7, 99, 0, 'Stormwind Honor & Conquest Quartermasters', 27481),
(2426, -8804.8, 348.023, 7, 99, 0, 'Stormwind Heroism & Valor Quartermasters', 27481),
(2423, -8849.51, 500.269, 7, 99, 0, 'Stormwind Flying Trainer & Mounts', 27481),
(527, -8832.65, 652.766, 7, 99, 0, 'Stormwind Auction House', 27481),
(2418, -8775.39, 371.104, 7, 99, 0, 'Stormwind Stable Master', 27481),
(870, -8432.87, 555.121, 7, 99, 0, 'Stormwind Stable Master', 27481),
(2425, -8709.56, 621.618, 7, 99, 0, 'Stormwind Jewelcrafting', 27481),
(2272, -8850.78, 856.596, 7, 99, 0, 'Stormwind Inscription', 27481),
(107, -8801.98, 770.842, 7, 99, 0, 'Stormwind Fishing', 27481),
(1427, -8521.81, 816.241, 7, 99, 0, 'Stormwind First Aid', 27481),
(93, -8365.68, 631.149, 7, 99, 0, 'Stormwind Engineering', 27481),
(108, -8854.98, 800.08, 7, 99, 0, 'Stormwind Enchanting', 27481),
(68, -8634.73, 415.613, 7, 99, 0, 'Stormwind Inn', 27481),
(94, -8424.52, 616.797, 7, 99, 0, 'Stormwind Blacksmithing', 27481),
(2424, -8294.95, 233.033, 7, 99, 0, 'Stormwind Archaeology', 27481),
(5213, -9015.66, 874.699, 7, 99, 0, 'Stormwind Portal to Hellfire Peninsula', 27481),
(5215, -8640.37, 1327.42, 7, 99, 0, 'Stormwind Ship to Rut\'theran Village', 27481),
(532, -8394.28, 560.927, 7, 99, 0, 'Stormwind Tram', 27481),
(2420, -8432.65, 319.663, 7, 99, 0, 'Stormwind Keep', 27481),
(2110, -8573.47, 990.095, 7, 0, 0, 'Stormwind Harbor', 27481),
(2421, -8789.09, 827.214, 7, 99, 0, 'Stormwind Stockade', 27481),
(72, -8766.67, 1033.05, 7, 99, 0, 'Lion\'s Rest', 27481),
(1467, -8764.14, 404.2, 7, 99, 0, 'Stormwind Champions\' Hall', 27481),
(47, -8900.59, 632.021, 7, 99, 0, 'Stormwind Bank', 27481),
(529, -8862.7, 665.363, 7, 99, 0, 'Stormwind Inn', 27481),
(2415, -8327.83, 598.797, 7, 99, 0, 'Stormwind Bank', 27481),
(2416, -8363.9, 658.161, 7, 99, 0, 'Stormwind Auction House', 27481),
(2419, -8371.78, 604.283, 7, 99, 0, 'Stormwind Inn', 27481),
(87, -8887.54, 602.309, 7, 99, 0, 'Stormwind Guild Master', 27481),
(67, -8839.34, 487.552, 7, 99, 0, 'Stormwind Flight Master', 27481),
(2766, -8182.733, 545.3889, 7, 99, 0, 'Stormwind Monk Trainer', 27481),
(70, -8788.16, 344.498, 7, 99, 0, 'Stormwind Warrior & Hunter Trainer', 27481),
(75, -8945.1, 991.033, 7, 99, 0, 'Stormwind Warlock Trainer', 27481),
(1986, -8356.92, 574.814, 7, 99, 0, 'Stormwind Shaman Trainer', 27481),
(69, -8716.23, 328.47, 7, 99, 0, 'Stormwind Rogue Trainer', 27481),
(73, -8582.43, 806.635, 7, 99, 0, 'Stormwind Cathedral', 27481),
(71, -9010.27, 852.878, 7, 99, 0, 'Stormwind Mage Trainer', 27481),
(74, -8424.14, 551.444, 7, 99, 0, 'Stormwind Hunter Trainer', 27481),
(2417, -8282.65, 716.852, 7, 99, 0, 'Stormwind Druid Trainer', 27481),
(2202, -8755.01, 657.7, 7, 99, 0, 'Stormwind Barber', 27481),
(2714, -8697.185, 847.6458, 7, 99, 0, 'The Three Winds', 27481),
(2887, -8287.219, 515.5816, 7, 99, 0, 'Stormwind Battle Pet Trainer', 27481);

DELETE FROM `gossip_menu` WHERE (`MenuId`=11848 AND `TextId`=16629) OR (`MenuId`=435 AND `TextId`=933) OR (`MenuId`=428 AND `TextId`=925) OR (`MenuId`=421 AND `TextId`=918) OR (`MenuId`=427 AND `TextId`=924) OR (`MenuId`=430 AND `TextId`=927) OR (`MenuId`=11869 AND `TextId`=16632) OR (`MenuId`=431 AND `TextId`=928) OR (`MenuId`=432 AND `TextId`=929) OR (`MenuId`=11846 AND `TextId`=16608) OR (`MenuId`=11867 AND `TextId`=16630) OR (`MenuId`=11868 AND `TextId`=16631) OR (`MenuId`=11871 AND `TextId`=16634) OR (`MenuId`=3102 AND `TextId`=3834) OR (`MenuId`=11839 AND `TextId`=16601) OR (`MenuId`=11847 AND `TextId`=16609) OR (`MenuId`=4925 AND `TextId`=5984) OR (`MenuId`=11865 AND `TextId`=16627) OR (`MenuId`=10010 AND `TextId`=13881) OR (`MenuId`=12243 AND `TextId`=31505) OR (`MenuId`=443 AND `TextId`=940) OR (`MenuId`=426 AND `TextId`=923) OR (`MenuId`=425 AND `TextId`=922) OR (`MenuId`=444 AND `TextId`=941) OR (`MenuId`=424 AND `TextId`=921) OR (`MenuId`=423 AND `TextId`=920) OR (`MenuId`=11866 AND `TextId`=16628) OR (`MenuId`=422 AND `TextId`=919) OR (`MenuId`=20919 AND `TextId`=31500) OR (`MenuId`=20921 AND `TextId`=31501) OR (`MenuId`=20923 AND `TextId`=31504) OR (`MenuId`=11858 AND `TextId`=16620) OR (`MenuId`=11845 AND `TextId`=16607) OR (`MenuId`=9767 AND `TextId`=13439) OR (`MenuId`=11859 AND `TextId`=16621) OR (`MenuId`=11857 AND `TextId`=16619) OR (`MenuId`=3081 AND `TextId`=3813) OR (`MenuId`=265 AND `TextId`=764) OR (`MenuId`=11841 AND `TextId`=16603) OR (`MenuId`=3127 AND `TextId`=3861) OR (`MenuId`=11843 AND `TextId`=16605) OR (`MenuId`=3126 AND `TextId`=3860) OR (`MenuId`=11842 AND `TextId`=16604) OR (`MenuId`=11840 AND `TextId`=16602) OR (`MenuId`=11844 AND `TextId`=16606) OR (`MenuId`=383 AND `TextId`=882) OR (`MenuId`=382 AND `TextId`=879) OR (`MenuId`=13858 AND `TextId`=20025) OR (`MenuId`=401 AND `TextId`=898) OR (`MenuId`=404 AND `TextId`=901) OR (`MenuId`=409 AND `TextId`=906) OR (`MenuId`=8164 AND `TextId`=10106) OR (`MenuId`=403 AND `TextId`=900) OR (`MenuId`=406 AND `TextId`=903) OR (`MenuId`=407 AND `TextId`=904) OR (`MenuId`=402 AND `TextId`=899) OR (`MenuId`=11856 AND `TextId`=16618) OR (`MenuId`=11855 AND `TextId`=16617) OR (`MenuId`=408 AND `TextId`=905) OR (`MenuId`=405 AND `TextId`=902) OR (`MenuId`=10011 AND `TextId`=13882) OR (`MenuId`=13029 AND `TextId`=18301) OR (`MenuId`=14950 AND `TextId`=21137);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
(11848, 16629, 27481), -- 68
(435, 933, 27481), -- 68
(428, 925, 27481), -- 68
(421, 918, 27481), -- 68
(427, 924, 27481), -- 68
(430, 927, 27481), -- 68
(11869, 16632, 27481), -- 68
(431, 928, 27481), -- 68
(432, 929, 27481), -- 68
(11846, 16608, 27481), -- 68
(11867, 16630, 27481), -- 68
(11868, 16631, 27481), -- 68
(11871, 16634, 27481), -- 68
(3102, 3834, 27481), -- 68
(11839, 16601, 27481), -- 68
(11847, 16609, 27481), -- 68
(4925, 5984, 27481), -- 68
(11865, 16627, 27481), -- 68
(10010, 13881, 27481), -- 68
(12243, 31505, 27481), -- 68
(443, 940, 27481), -- 68
(426, 923, 27481), -- 68
(425, 922, 27481), -- 68
(444, 941, 27481), -- 68
(424, 921, 27481), -- 68
(423, 920, 27481), -- 68
(11866, 16628, 27481), -- 68
(422, 919, 27481), -- 68
(20919, 31500, 27481), -- 68
(20921, 31501, 27481), -- 68
(20923, 31504, 27481), -- 68
(11858, 16620, 27481), -- 68
(11845, 16607, 27481), -- 68
(9767, 13439, 27481), -- 68
(11859, 16621, 27481), -- 68
(11857, 16619, 27481), -- 68
(3081, 3813, 27481), -- 68
(265, 764, 27481), -- 68
(11841, 16603, 27481), -- 68
(3127, 3861, 27481), -- 68
(11843, 16605, 27481), -- 68
(3126, 3860, 27481), -- 68
(11842, 16604, 27481), -- 68
(11840, 16602, 27481), -- 68
(11844, 16606, 27481), -- 68
(383, 882, 27481), -- 68
(382, 879, 27481), -- 68
(13858, 20025, 27481), -- 68
(401, 898, 27481), -- 68
(404, 901, 27481), -- 68
(409, 906, 27481), -- 68
(8164, 10106, 27481), -- 68
(403, 900, 27481), -- 68
(406, 903, 27481), -- 68
(407, 904, 27481), -- 68
(402, 899, 27481), -- 68
(11856, 16618, 27481), -- 68
(11855, 16617, 27481), -- 68
(408, 905, 27481), -- 68
(405, 902, 27481), -- 68
(10011, 13882, 27481), -- 68
(13029, 18301, 27481), -- 68
(14950, 21137, 27481); -- 68

DELETE FROM `npc_text` WHERE `ID` IN (927 /*927*/, 928 /*928*/, 929 /*929*/, 16632 /*16632*/, 16631 /*16631*/, 16629 /*16629*/, 16609 /*16609*/, 5984 /*5984*/, 16608 /*16608*/, 925 /*925*/, 16627 /*16627*/, 13881 /*13881*/, 924 /*924*/, 16634 /*16634*/, 940 /*940*/, 923 /*923*/, 922 /*922*/, 941 /*941*/, 921 /*921*/, 920 /*920*/, 16628 /*16628*/, 919 /*919*/, 918 /*918*/, 31500 /*31500*/, 31501 /*31501*/, 31504 /*31504*/, 31505 /*31505*/, 16620 /*16620*/, 13439 /*13439*/, 16621 /*16621*/, 16619 /*16619*/, 3813 /*3813*/, 16630 /*16630*/, 16607 /*16607*/, 3861 /*3861*/, 16606 /*16606*/, 3860 /*3860*/, 16605 /*16605*/, 882 /*882*/, 879 /*879*/, 20025 /*20025*/, 901 /*901*/, 906 /*906*/, 10106 /*10106*/, 900 /*900*/, 903 /*903*/, 904 /*904*/, 899 /*899*/, 16618 /*16618*/, 905 /*905*/, 16617 /*16617*/, 902 /*902*/, 898 /*898*/, 13882 /*13882*/, 16604 /*16604*/, 764 /*764*/, 16603 /*16603*/, 16602 /*16602*/, 3834 /*3834*/, 16601 /*16601*/, 18301 /*18301*/, 21137 /*21137*/, 933 /*933*/);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(927, 1, 1, 0, 0, 0, 0, 0, 0, 2961, 6323, 0, 0, 0, 0, 0, 0, 27481), -- 927
(928, 60, 40, 0, 0, 0, 0, 0, 0, 2962, 6324, 0, 0, 0, 0, 0, 0, 27481), -- 928
(929, 1, 1, 0, 0, 0, 0, 0, 0, 2963, 6325, 0, 0, 0, 0, 0, 0, 27481), -- 929
(16632, 1, 0, 0, 0, 0, 0, 0, 0, 44658, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16632
(16631, 1, 0, 0, 0, 0, 0, 0, 0, 44655, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16631
(16629, 60, 0, 0, 0, 0, 0, 0, 0, 44651, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16629
(16609, 1, 0, 0, 0, 0, 0, 0, 0, 44611, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16609
(5984, 1, 1, 0, 0, 0, 0, 0, 0, 8537, 8538, 0, 0, 0, 0, 0, 0, 27481), -- 5984
(16608, 1, 0, 0, 0, 0, 0, 0, 0, 44608, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16608
(925, 60, 40, 0, 0, 0, 0, 0, 0, 2959, 6321, 0, 0, 0, 0, 0, 0, 27481), -- 925
(16627, 1, 0, 0, 0, 0, 0, 0, 0, 44648, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16627
(13881, 1, 0, 0, 0, 0, 0, 0, 0, 31541, 0, 0, 0, 0, 0, 0, 0, 27481), -- 13881
(924, 1, 1, 0, 0, 0, 0, 0, 0, 2958, 6316, 0, 0, 0, 0, 0, 0, 27481), -- 924
(16634, 1, 0, 0, 0, 0, 0, 0, 0, 44661, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16634
(940, 1, 1, 0, 0, 0, 0, 0, 0, 3009, 6315, 0, 0, 0, 0, 0, 0, 27481), -- 940
(923, 1, 1, 0, 0, 0, 0, 0, 0, 2957, 6313, 0, 0, 0, 0, 0, 0, 27481), -- 923
(922, 75, 25, 0, 0, 0, 0, 0, 0, 2956, 6312, 0, 0, 0, 0, 0, 0, 27481), -- 922
(941, 1, 1, 0, 0, 0, 0, 0, 0, 3010, 6310, 0, 0, 0, 0, 0, 0, 27481), -- 941
(921, 60, 40, 0, 0, 0, 0, 0, 0, 2955, 6309, 0, 0, 0, 0, 0, 0, 27481), -- 921
(920, 1, 1, 0, 0, 0, 0, 0, 0, 2954, 6300, 0, 0, 0, 0, 0, 0, 27481), -- 920
(16628, 1, 0, 0, 0, 0, 0, 0, 0, 44650, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16628
(919, 1, 1, 0, 0, 0, 0, 0, 0, 2953, 6298, 0, 0, 0, 0, 0, 0, 27481), -- 919
(918, 1, 0, 0, 0, 0, 0, 0, 0, 2941, 0, 0, 0, 0, 0, 0, 0, 27481), -- 918
(31500, 1, 0, 0, 0, 0, 0, 0, 0, 129233, 0, 0, 0, 0, 0, 0, 0, 27481), -- 31500
(31501, 1, 0, 0, 0, 0, 0, 0, 0, 129085, 0, 0, 0, 0, 0, 0, 0, 27481), -- 31501
(31504, 1, 0, 0, 0, 0, 0, 0, 0, 129094, 0, 0, 0, 0, 0, 0, 0, 27481), -- 31504
(31505, 1, 0, 0, 0, 0, 0, 0, 0, 129095, 0, 0, 0, 0, 0, 0, 0, 27481), -- 31505
(16620, 1, 0, 0, 0, 0, 0, 0, 0, 44638, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16620
(13439, 1, 1, 0, 0, 0, 0, 0, 0, 29417, 29418, 0, 0, 0, 0, 0, 0, 27481), -- 13439
(16621, 1, 0, 0, 0, 0, 0, 0, 0, 44640, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16621
(16619, 1, 0, 0, 0, 0, 0, 0, 0, 44636, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16619
(3813, 1, 1, 0, 0, 0, 0, 0, 0, 6330, 6331, 0, 0, 0, 0, 0, 0, 27481), -- 3813
(16630, 1, 0, 0, 0, 0, 0, 0, 0, 44653, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16630
(16607, 1, 0, 0, 0, 0, 0, 0, 0, 44607, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16607
(3861, 1, 0, 0, 0, 0, 0, 0, 0, 44606, 0, 0, 0, 0, 0, 0, 0, 27481), -- 3861
(16606, 1, 0, 0, 0, 0, 0, 0, 0, 44605, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16606
(3860, 1, 0, 0, 0, 0, 0, 0, 0, 6393, 0, 0, 0, 0, 0, 0, 0, 27481), -- 3860
(16605, 1, 0, 0, 0, 0, 0, 0, 0, 44602, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16605
(882, 1, 1, 1, 0, 0, 0, 0, 0, 2879, 2880, 2881, 0, 0, 0, 0, 0, 27481), -- 882
(879, 1, 1, 1, 1, 0, 0, 0, 0, 2864, 2876, 2877, 2878, 0, 0, 0, 0, 27481), -- 879
(20025, 1, 0, 0, 0, 0, 0, 0, 0, 61808, 0, 0, 0, 0, 0, 0, 0, 27481), -- 20025
(901, 1, 1, 1, 0, 0, 0, 0, 0, 2911, 2912, 2913, 0, 0, 0, 0, 0, 27481), -- 901
(906, 1, 1, 0, 0, 0, 0, 0, 0, 2927, 6326, 0, 0, 0, 0, 0, 0, 27481), -- 906
(10106, 1, 0, 0, 0, 0, 0, 0, 0, 18360, 0, 0, 0, 0, 0, 0, 0, 27481), -- 10106
(900, 1, 1, 1, 0, 0, 0, 0, 0, 2907, 2908, 2909, 0, 0, 0, 0, 0, 27481), -- 900
(903, 1, 1, 1, 0, 0, 0, 0, 0, 2919, 2920, 2921, 0, 0, 0, 0, 0, 27481), -- 903
(904, 1, 0, 0, 0, 0, 0, 0, 0, 2923, 0, 0, 0, 0, 0, 0, 0, 27481), -- 904
(899, 1, 1, 1, 0, 0, 0, 0, 0, 2903, 2904, 2905, 0, 0, 0, 0, 0, 27481), -- 899
(16618, 1, 0, 0, 0, 0, 0, 0, 0, 44634, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16618
(905, 60, 40, 0, 0, 0, 0, 0, 0, 2925, 6319, 0, 0, 0, 0, 0, 0, 27481), -- 905
(16617, 1, 0, 0, 0, 0, 0, 0, 0, 44631, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16617
(902, 1, 0, 0, 0, 0, 0, 0, 0, 44630, 0, 0, 0, 0, 0, 0, 0, 27481), -- 902
(898, 1, 0, 0, 0, 0, 0, 0, 0, 2901, 0, 0, 0, 0, 0, 0, 0, 27481), -- 898
(13882, 1, 0, 0, 0, 0, 0, 0, 0, 31544, 0, 0, 0, 0, 0, 0, 0, 27481), -- 13882
(16604, 50, 0, 0, 0, 0, 0, 0, 0, 44598, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16604
(764, 50, 50, 0, 0, 0, 0, 0, 0, 2750, 6299, 0, 0, 0, 0, 0, 0, 27481), -- 764
(16603, 60, 0, 0, 0, 0, 0, 0, 0, 44595, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16603
(16602, 1, 0, 0, 0, 0, 0, 0, 0, 44594, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16602
(3834, 60, 40, 0, 0, 0, 0, 0, 0, 6367, 6368, 0, 0, 0, 0, 0, 0, 27481), -- 3834
(16601, 1, 0, 0, 0, 0, 0, 0, 0, 44588, 0, 0, 0, 0, 0, 0, 0, 27481), -- 16601
(18301, 1, 0, 0, 0, 0, 0, 0, 0, 53079, 0, 0, 0, 0, 0, 0, 0, 27481), -- 18301
(21137, 1, 0, 0, 0, 0, 0, 0, 0, 67341, 0, 0, 0, 0, 0, 0, 0, 27481), -- 21137
(933, 1, 0, 0, 0, 0, 0, 0, 0, 2974, 0, 0, 0, 0, 0, 0, 0, 27481); -- 933



DELETE FROM `gossip_menu_option` WHERE (`MenuId`=11848 AND `OptionIndex`=5) OR (`MenuId`=11848 AND `OptionIndex`=4) OR (`MenuId`=11848 AND `OptionIndex`=3) OR (`MenuId`=11848 AND `OptionIndex`=2) OR (`MenuId`=11848 AND `OptionIndex`=1) OR (`MenuId`=11848 AND `OptionIndex`=0) OR (`MenuId`=435 AND `OptionIndex`=16) OR (`MenuId`=435 AND `OptionIndex`=15) OR (`MenuId`=435 AND `OptionIndex`=14) OR (`MenuId`=435 AND `OptionIndex`=13) OR (`MenuId`=435 AND `OptionIndex`=12) OR (`MenuId`=435 AND `OptionIndex`=11) OR (`MenuId`=435 AND `OptionIndex`=10) OR (`MenuId`=435 AND `OptionIndex`=9) OR (`MenuId`=435 AND `OptionIndex`=8) OR (`MenuId`=435 AND `OptionIndex`=7) OR (`MenuId`=435 AND `OptionIndex`=6) OR (`MenuId`=435 AND `OptionIndex`=5) OR (`MenuId`=435 AND `OptionIndex`=4) OR (`MenuId`=435 AND `OptionIndex`=3) OR (`MenuId`=435 AND `OptionIndex`=2) OR (`MenuId`=435 AND `OptionIndex`=0) OR (`MenuId`=421 AND `OptionIndex`=16) OR (`MenuId`=421 AND `OptionIndex`=15) OR (`MenuId`=421 AND `OptionIndex`=14) OR (`MenuId`=421 AND `OptionIndex`=13) OR (`MenuId`=421 AND `OptionIndex`=12) OR (`MenuId`=421 AND `OptionIndex`=11) OR (`MenuId`=421 AND `OptionIndex`=10) OR (`MenuId`=421 AND `OptionIndex`=9) OR (`MenuId`=421 AND `OptionIndex`=8) OR (`MenuId`=421 AND `OptionIndex`=7) OR (`MenuId`=421 AND `OptionIndex`=6) OR (`MenuId`=421 AND `OptionIndex`=5) OR (`MenuId`=421 AND `OptionIndex`=4) OR (`MenuId`=421 AND `OptionIndex`=3) OR (`MenuId`=421 AND `OptionIndex`=2) OR (`MenuId`=421 AND `OptionIndex`=1) OR (`MenuId`=421 AND `OptionIndex`=0) OR (`MenuId`=11846 AND `OptionIndex`=1) OR (`MenuId`=11846 AND `OptionIndex`=0) OR (`MenuId`=11839 AND `OptionIndex`=1) OR (`MenuId`=11839 AND `OptionIndex`=0) OR (`MenuId`=12243 AND `OptionIndex`=2) OR (`MenuId`=12243 AND `OptionIndex`=1) OR (`MenuId`=12243 AND `OptionIndex`=0) OR (`MenuId`=11845 AND `OptionIndex`=5) OR (`MenuId`=11845 AND `OptionIndex`=4) OR (`MenuId`=11845 AND `OptionIndex`=3) OR (`MenuId`=11845 AND `OptionIndex`=2) OR (`MenuId`=11845 AND `OptionIndex`=1) OR (`MenuId`=11845 AND `OptionIndex`=0) OR (`MenuId`=11841 AND `OptionIndex`=1) OR (`MenuId`=11841 AND `OptionIndex`=0) OR (`MenuId`=3127 AND `OptionIndex`=2) OR (`MenuId`=3127 AND `OptionIndex`=1) OR (`MenuId`=3127 AND `OptionIndex`=0) OR (`MenuId`=11843 AND `OptionIndex`=1) OR (`MenuId`=11843 AND `OptionIndex`=0) OR (`MenuId`=401 AND `OptionIndex`=9) OR (`MenuId`=401 AND `OptionIndex`=8) OR (`MenuId`=401 AND `OptionIndex`=7) OR (`MenuId`=401 AND `OptionIndex`=6) OR (`MenuId`=401 AND `OptionIndex`=5) OR (`MenuId`=401 AND `OptionIndex`=4) OR (`MenuId`=401 AND `OptionIndex`=3) OR (`MenuId`=401 AND `OptionIndex`=2) OR (`MenuId`=401 AND `OptionIndex`=1) OR (`MenuId`=401 AND `OptionIndex`=0) OR (`MenuId`=11855 AND `OptionIndex`=1) OR (`MenuId`=11855 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `VerifiedBuild`) VALUES
(11848, 5, 0, 'Profession Trainer', 0, 27481),
(11848, 4, 0, 'Horse Breeder', 0, 27481),
(11848, 3, 0, 'Honor & Conquest Quartermasters', 0, 27481),
(11848, 2, 0, 'Justice & Valor Quartermasters', 0, 27481),
(11848, 1, 0, 'Gryphon Handler', 0, 27481),
(11848, 0, 0, 'Auction House', 0, 27481),
(435, 16, 0, 'Vendor', 0, 27481),
(435, 15, 0, 'Stable Master', 0, 27481),
(435, 14, 0, 'Profession Trainer', 0, 27481),
(435, 13, 0, 'Other Continents', 0, 27481),
(435, 12, 0, 'Points of Interest', 0, 27481),
(435, 11, 0, 'Mailbox', 0, 27481),
(435, 10, 0, 'Inn', 0, 27481),
(435, 9, 0, 'Guild Master & Vendor', 0, 27481),
(435, 8, 0, 'Flight Master', 0, 27481),
(435, 7, 0, 'Class Trainer', 0, 27481),
(435, 6, 0, 'Barber', 0, 27481),
(435, 5, 0, 'Bank', 0, 27481),
(435, 4, 0, 'Auction House', 0, 27481),
(435, 3, 0, 'Void Storage', 0, 27481),
(435, 2, 0, 'Transmogrification', 0, 27481),
(435, 0, 0, 'Battle Pet Trainer', 0, 27481),
(421, 16, 0, 'Tailoring', 0, 27481),
(421, 15, 0, 'Skinning', 0, 27481),
(421, 14, 0, 'Riding', 0, 27481),
(421, 13, 0, 'Mining', 0, 27481),
(421, 12, 0, 'Leatherworking', 0, 27481),
(421, 11, 0, 'Jewelcrafting', 0, 27481),
(421, 10, 0, 'Inscription', 0, 27481),
(421, 9, 0, 'Herbalism', 0, 27481),
(421, 8, 0, 'Flying', 0, 27481),
(421, 7, 0, 'Fishing', 0, 27481),
(421, 6, 0, 'First Aid', 0, 27481),
(421, 5, 0, 'Engineering', 0, 27481),
(421, 4, 0, 'Enchanting', 0, 27481),
(421, 3, 0, 'Cooking', 0, 27481),
(421, 2, 0, 'Blacksmithing', 0, 27481),
(421, 1, 0, 'Archaeology', 0, 27481),
(421, 0, 0, 'Alchemy', 0, 27481),
(11846, 1, 0, 'Dwarven District Stable Master', 0, 27481),
(11846, 0, 0, 'Old Town Stable Master', 0, 27481),
(11839, 1, 0, 'Dwarven District Auction House', 0, 27481),
(11839, 0, 0, 'Trade District Auction House', 0, 27481),
(12243, 2, 0, 'Hellfire Peninsula in Outland', 0, 27481),
(12243, 1, 0, 'Teldrassil or the Exodar in Kalimdor', 0, 27481),
(12243, 0, 0, 'Ironforge', 0, 27481),
(11845, 5, 0, 'Stormwind Keep', 0, 27481),
(11845, 4, 0, 'Stormwind Harbor', 0, 27481),
(11845, 3, 0, 'The Stockade', 0, 27481),
(11845, 2, 0, 'Lion\'s Rest', 0, 27481),
(11845, 1, 0, 'Deeprun Tram', 0, 27481),
(11845, 0, 0, 'Champions\' Hall', 0, 27481),
(11841, 1, 0, 'Dwarven District Bank', 0, 27481),
(11841, 0, 0, 'Trade District Bank', 0, 27481),
(3127, 2, 0, 'Inn', 0, 27481),
(3127, 1, 0, 'Bank', 0, 27481),
(3127, 0, 0, 'Auction House', 0, 27481),
(11843, 1, 0, 'Dwarven District Inn', 0, 27481),
(11843, 0, 0, 'Trade District Inn', 0, 27481),
(401, 9, 0, 'Monk', 0, 27481),
(401, 8, 0, 'Warrior', 0, 27481),
(401, 7, 0, 'Warlock', 0, 27481),
(401, 6, 0, 'Shaman', 0, 27481),
(401, 5, 0, 'Rogue', 0, 27481),
(401, 4, 0, 'Priest', 0, 27481),
(401, 3, 0, 'Paladin', 0, 27481),
(401, 2, 0, 'Mage', 0, 27481),
(401, 1, 0, 'Hunter', 0, 27481),
(401, 0, 0, 'Druid', 0, 27481),
(11855, 1, 0, 'Old Town Hunter Trainer', 0, 27481),
(11855, 0, 0, 'Dwarven District Hunter Trainer', 0, 27481);

DELETE FROM `gossip_menu_option_action` WHERE (`MenuId`=435 AND `OptionIndex`=16) OR (`MenuId`=421 AND `OptionIndex`=12) OR (`MenuId`=11848 AND `OptionIndex`=5) OR (`MenuId`=421 AND `OptionIndex`=9) OR (`MenuId`=421 AND `OptionIndex`=13) OR (`MenuId`=421 AND `OptionIndex`=14) OR (`MenuId`=421 AND `OptionIndex`=15) OR (`MenuId`=435 AND `OptionIndex`=14) OR (`MenuId`=421 AND `OptionIndex`=16) OR (`MenuId`=435 AND `OptionIndex`=15) OR (`MenuId`=11848 AND `OptionIndex`=4) OR (`MenuId`=11848 AND `OptionIndex`=3) OR (`MenuId`=11848 AND `OptionIndex`=2) OR (`MenuId`=11848 AND `OptionIndex`=1) OR (`MenuId`=11839 AND `OptionIndex`=0) OR (`MenuId`=11848 AND `OptionIndex`=0) OR (`MenuId`=11846 AND `OptionIndex`=0) OR (`MenuId`=11846 AND `OptionIndex`=1) OR (`MenuId`=421 AND `OptionIndex`=11) OR (`MenuId`=421 AND `OptionIndex`=10) OR (`MenuId`=435 AND `OptionIndex`=13) OR (`MenuId`=421 AND `OptionIndex`=8) OR (`MenuId`=421 AND `OptionIndex`=7) OR (`MenuId`=421 AND `OptionIndex`=6) OR (`MenuId`=421 AND `OptionIndex`=5) OR (`MenuId`=421 AND `OptionIndex`=4) OR (`MenuId`=421 AND `OptionIndex`=3) OR (`MenuId`=421 AND `OptionIndex`=2) OR (`MenuId`=421 AND `OptionIndex`=1) OR (`MenuId`=421 AND `OptionIndex`=0) OR (`MenuId`=12243 AND `OptionIndex`=2) OR (`MenuId`=12243 AND `OptionIndex`=1) OR (`MenuId`=12243 AND `OptionIndex`=0) OR (`MenuId`=11845 AND `OptionIndex`=5) OR (`MenuId`=435 AND `OptionIndex`=12) OR (`MenuId`=11845 AND `OptionIndex`=4) OR (`MenuId`=11845 AND `OptionIndex`=3) OR (`MenuId`=11845 AND `OptionIndex`=2) OR (`MenuId`=11845 AND `OptionIndex`=1) OR (`MenuId`=11845 AND `OptionIndex`=0) OR (`MenuId`=11841 AND `OptionIndex`=0) OR (`MenuId`=3127 AND `OptionIndex`=1) OR (`MenuId`=435 AND `OptionIndex`=11) OR (`MenuId`=435 AND `OptionIndex`=10) OR (`MenuId`=11843 AND `OptionIndex`=0) OR (`MenuId`=3127 AND `OptionIndex`=2) OR (`MenuId`=11841 AND `OptionIndex`=1) OR (`MenuId`=11839 AND `OptionIndex`=1) OR (`MenuId`=3127 AND `OptionIndex`=0) OR (`MenuId`=11843 AND `OptionIndex`=1) OR (`MenuId`=435 AND `OptionIndex`=9) OR (`MenuId`=435 AND `OptionIndex`=8) OR (`MenuId`=401 AND `OptionIndex`=9) OR (`MenuId`=435 AND `OptionIndex`=7) OR (`MenuId`=401 AND `OptionIndex`=8) OR (`MenuId`=401 AND `OptionIndex`=7) OR (`MenuId`=401 AND `OptionIndex`=6) OR (`MenuId`=401 AND `OptionIndex`=5) OR (`MenuId`=401 AND `OptionIndex`=4) OR (`MenuId`=401 AND `OptionIndex`=3) OR (`MenuId`=401 AND `OptionIndex`=2) OR (`MenuId`=11855 AND `OptionIndex`=1) OR (`MenuId`=401 AND `OptionIndex`=1) OR (`MenuId`=11855 AND `OptionIndex`=0) OR (`MenuId`=401 AND `OptionIndex`=0) OR (`MenuId`=435 AND `OptionIndex`=6) OR (`MenuId`=435 AND `OptionIndex`=5) OR (`MenuId`=435 AND `OptionIndex`=4) OR (`MenuId`=435 AND `OptionIndex`=3) OR (`MenuId`=435 AND `OptionIndex`=2) OR (`MenuId`=435 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(435, 16, 11848, 0),
(421, 12, 428, 90),
(11848, 5, 421, 0),
(421, 9, 427, 91),
(421, 13, 430, 95),
(421, 14, 11869, 2422),
(421, 15, 431, 90),
(435, 14, 421, 0),
(421, 16, 432, 92),
(435, 15, 11846, 0),
(11848, 4, 11869, 2422),
(11848, 3, 11867, 2427),
(11848, 2, 11868, 2426),
(11848, 1, 11871, 2423),
(11839, 0, 3102, 527),
(11848, 0, 11839, 0),
(11846, 0, 11847, 2418),
(11846, 1, 4925, 870),
(421, 11, 11865, 2425),
(421, 10, 10010, 2272),
(435, 13, 12243, 0),
(421, 8, 11871, 2423),
(421, 7, 443, 107),
(421, 6, 426, 1427),
(421, 5, 425, 93),
(421, 4, 444, 108),
(421, 3, 424, 68),
(421, 2, 423, 94),
(421, 1, 11866, 2424),
(421, 0, 422, 91),
(12243, 2, 20919, 5213),
(12243, 1, 20921, 5215),
(12243, 0, 20923, 532),
(11845, 5, 11858, 2420),
(435, 12, 11845, 0),
(11845, 4, 9767, 2110),
(11845, 3, 11859, 2421),
(11845, 2, 11857, 72),
(11845, 1, 3081, 532),
(11845, 0, 11867, 1467),
(11841, 0, 265, 47),
(3127, 1, 11841, 0),
(435, 11, 3127, 0),
(435, 10, 11843, 0),
(11843, 0, 3126, 529),
(3127, 2, 11843, 0),
(11841, 1, 11842, 2415),
(11839, 1, 11840, 2416),
(3127, 0, 11839, 0),
(11843, 1, 11844, 2419),
(435, 9, 383, 87),
(435, 8, 382, 67),
(401, 9, 13858, 2766),
(435, 7, 401, 0),
(401, 8, 404, 70),
(401, 7, 409, 75),
(401, 6, 8164, 1986),
(401, 5, 403, 69),
(401, 4, 406, 73),
(401, 3, 407, 73),
(401, 2, 402, 71),
(11855, 1, 11856, 70),
(401, 1, 11855, 0),
(11855, 0, 408, 74),
(401, 0, 405, 2417),
(435, 6, 10011, 2202),
(435, 5, 11841, 0),
(435, 4, 11839, 0),
(435, 3, 13029, 2714),
(435, 2, 13029, 2714),
(435, 0, 14950, 2887);

-- fixed missing flags
UPDATE gossip_menu_option SET OptionType = 1, OptionNpcFlag = 1 WHERE MenuId IN (435, 401, 11845, 12243, 421, 11848, 11846, 12243, 11845, 3127, 11841, 11855, 11839);
 
 