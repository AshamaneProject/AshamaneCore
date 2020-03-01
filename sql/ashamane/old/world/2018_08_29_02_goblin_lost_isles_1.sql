-- Lost Isles - First small island

SET @CGUID := 40000000;
SET @OGUID := 20600000;

DELETE FROM `creature` WHERE `guid` = 0 OR `guid` BETWEEN @CGUID+0 AND @CGUID+1775;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+0, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 517.277, 3485.438, 0.2, 0.7766387, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 512.3977, 3418.609, -1.884285, 3.302418, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+2, 39169, 648, 0, 0, 1, '170', 0, 0, 0, 366.4246, 3576.064, 21.91148, 3.060262, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Lost Isles Mail Bird (Area: -Unknown- - Difficulty: 1) (Auras: 73558 - Lost Isles Mail Bird: Mail Bag - Hold) (possible waypoints or random movement)
(@CGUID+3, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 450.4274, 3410.673, 0.2, 3.595012, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+4, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 448.1504, 3353.709, 0.2, 3.111757, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+5, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 520.2009, 3353.956, -1.711968, 5.048044, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+6, 36719, 648, 0, 0, 1, '170', 0, 0, 0, 533.3274, 3253.287, 20.99036, 1.326833, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+7, 36719, 648, 0, 0, 1, '170', 0, 0, 0, 585.239, 3263.513, 16.87575, 2.692463, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+8, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 573.8022, 3358.631, -1.804653, 2.299664, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+9, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 386.0818, 3351.018, 0.2, 0.9156234, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+10, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 444.4129, 3289.532, -1.963381, 2.374978, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+11, 36600, 648, 0, 0, 1, '170', 0, 0, 0, 534.8264, 3270.589, 0.2805953, 1.675516, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Geargrinder Gizmo (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), 91298 - Cosmetic - Sit (Lower/Upper Body - High/Low Priority) (Anim Kit))
(@CGUID+12, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 582.0103, 3294.635, -1.884753, 1.271583, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+13, 36719, 648, 0, 0, 1, '170', 0, 0, 0, 614.217, 3164.901, 13.56262, 3.154239, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+14, 36719, 648, 0, 0, 1, '170', 0, 0, 0, 675.5583, 3204.953, 15.4678, 4.158865, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+15, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 450.2565, 3234.895, -1.665155, 1.010595, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+16, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 510.0262, 3227.615, -1.450112, 5.736487, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+17, 36735, 648, 0, 0, 1, '170', 0, 0, 0, 797.3688, 2987.562, 94.76331, 0.915577, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Matriarch (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+18, 36719, 648, 0, 0, 1, '170', 0, 0, 0, 585.0925, 3092.167, 32.25607, 0.2532942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+19, 36719, 648, 0, 0, 1, '170', 0, 0, 0, 633.2548, 3105.263, 34.12753, 1.296324, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+20, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 648.5097, 3291.996, -13.29189, 2.443448, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+21, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 646.6472, 3353.129, -1.753443, 5.457427, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+22, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 650.2465, 3260.083, -4.664654, 0.8685583, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+23, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 671.9665, 3296.754, -4.826086, 4.855391, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+24, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 583.4545, 3421.015, -1.750265, 4.78953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+25, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 663.2361, 3411.529, -1.262654, 3.62616, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+26, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 713.8854, 3314.167, 1.486228, 5.782867, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+27, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 717.798, 3386.418, -11.60428, 0.8856851, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+28, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 720.375, 3359.668, 1.755669, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+29, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 648.7246, 3481.555, -2.001248, 2.537364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+30, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 585.4006, 3481.781, -1.66111, 0.3968546, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+31, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 385.0004, 3300.881, -1.645076, 2.284166, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+32, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 375.6383, 3220.847, -1.449878, 0.4509125, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+33, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 317.7124, 3273.538, -1.44763, 1.479649, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+34, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 305.8195, 3206.679, -1.536768, 5.322387, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+35, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 349.2448, 3178.156, -355.7053, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+36, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 252.5658, 3224.643, -1.080528, 1.781763, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+37, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 317.9496, 3150.474, -1.44179, 1.645302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+38, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 388.4538, 3149.007, -1.499341, 3.281059, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+39, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 246.735, 3155.514, -1.74822, 1.33984, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+40, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 437.0196, 3155.689, -1.657505, 3.959266, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+41, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 383.3421, 3084.113, -1.353085, 3.86611, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+42, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 416.4367, 3088.157, -2.738793, 1.241724, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+43, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 387.5167, 3086.345, -8.551031, 0.7202523, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+44, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 322.4461, 3083.263, -1.620327, 3.416054, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+45, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 446.6403, 3115.132, -3.731792, 3.999528, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+46, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 383.6751, 3049.25, -2.801641, 5.602281, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+47, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 342.2229, 3023.663, -7.651533, 2.662332, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+48, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 391.4832, 3025.957, -0.4521314, 0.46627, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+49, 36732, 648, 0, 0, 1, '170', 0, 0, 0, 414.9985, 3051.878, 0.8400896, 1.125381, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Ancient Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+50, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 417.3634, 3050.442, 1.062925, 5.579936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+51, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 368.1228, 3014.499, 1.465277, 2.161509, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+52, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 463.0809, 3095.525, 1.295441, 0.9030718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+53, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 412.8941, 3019.864, 1.461698, 6.220913, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+54, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 461.0418, 3067.212, 2.96702, 3.457171, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+55, 34763, 648, 0, 0, 1, '170', 0, 0, 0, 314.1256, 3017.482, -1.420944, 4.696649, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+56, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 463.0683, 3071.855, 2.945832, 3.464629, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+57, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 376.1245, 3000, -3.685783, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+58, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 459.2008, 3070.761, 2.860743, 3.440251, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+59, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 450.7274, 3043.816, 2.738152, 6.199382, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+60, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 459.4753, 3067.451, 2.911122, 3.44663, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+61, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 463.4306, 3069.531, 3.019114, 3.469335, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+62, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 461.4343, 3072.986, 2.770136, 3.450102, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+63, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 459.4883, 3066.776, 2.947472, 3.366195, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+64, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 461.835, 3071.201, 2.896844, 3.414678, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+65, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 463.0362, 3068.091, 3.019085, 3.389176, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+66, 36721, 648, 0, 0, 1, '170', 0, 0, 0, 458.3729, 3064.031, 2.868356, 3.382583, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+67, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 474.7708, 3128.258, -2.639354, 2.072014, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+68, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 483.105, 3086.487, 2.183016, 1.837562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+69, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 484.1864, 3149.494, -2.411703, 2.329123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+70, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 527.2524, 3143.832, 0.03032517, 0.01999574, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+71, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 544.9147, 3083.702, 3.163847, 4.163141, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+72, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 529.0455, 3133.893, 0.2803252, 1.208739, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+73, 36507, 648, 0, 0, 1, '170', 0, 0, 0, 556.9677, 3094.304, 2.778159, 2.144715, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Crab (Area: -Unknown- - Difficulty: 1) (Auras: 76367 - Infrared = Infradead: Heat Signature Aura - Beast (50%)) (possible waypoints or random movement)
(@CGUID+74, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 555.3304, 3118.679, 0.7545448, 0.4889808, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+75, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 542.274, 3160.418, -0.7660201, 2.409358, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+76, 36184, 648, 0, 0, 1, '170', 0, 0, 0, 577.4739, 3102.943, 3.330419, 6.195919, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Izzy (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+77, 36186, 648, 0, 0, 1, '170', 0, 0, 0, 578.4792, 3098.544, 3.205015, 1.012291, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Gobber (Area: -Unknown- - Difficulty: 1) (Auras: 76356 - Infrared = Infradead: Heat Signature Aura - Humanoid (120%))
(@CGUID+78, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 573.7239, 3094.899, 3.454532, 4.712389, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+79, 36180, 648, 0, 0, 1, '170', 0, 0, 0, 583.4722, 3099.655, 3.355546, 2.303835, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ace (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+80, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 587.1389, 3122.943, 2.004, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+81, 24021, 648, 0, 0, 1, '170', 0, 0, 0, 579.9114, 3132.844, 1.877478, 2.80998, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny (scale x0.01) (Area: -Unknown- - Difficulty: 1)
(@CGUID+82, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 578.9618, 3093.305, 3.641604, 1.256637, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+83, 68989, 648, 0, 0, 1, '170', 0, 0, 0, 584.2708, 3120.968, 0.8301781, 3.202798, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Beastblast Babblesnaff (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+84, 36615, 648, 0, 0, 1, '170', 0, 0, 0, 581.2952, 3099.296, 3.159403, 1.64061, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Doc Zapnozzle (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+85, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 577.0903, 3125.85, 0.6797228, 2.074196, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+86, 36430, 648, 0, 0, 1, '170', 0, 0, 0, 590.0712, 3110.927, 2.977748, 0.5934119, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Sally "Salvager" Sandscrew (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+87, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 590.3853, 3146.658, -1.073696, 2.283658, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+88, 36427, 648, 0, 0, 1, '170', 0, 0, 0, 589.4913, 3096.076, 3.133809, 2.792527, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Brett "Coins" McQuid (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+89, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 590.6024, 3098.46, 3.06817, 0.6457718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+90, 35807, 648, 0, 0, 1, '170', 0, 0, 0, 588.559, 3089.471, 3.87014, 5.585053, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Warrior-Matic NX-01 (Area: -Unknown- - Difficulty: 1)
(@CGUID+91, 35806, 648, 0, 0, 1, '170', 0, 0, 0, 585.8108, 3089.417, 3.898957, 5.183628, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Slinky Sharpshiv (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), 80264 - Stealth)
(@CGUID+92, 38432, 648, 0, 0, 1, '170', 0, 0, 0, 588.7691, 3092.319, 3.493763, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Megs Dreadshredder (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+93, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 598.6476, 3105.395, 5.570901, 1.047198, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+94, 36496, 648, 0, 0, 1, '170', 0, 0, 0, 599.7344, 3118.63, 3.659634, 1.64061, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Grimy Greasefingers (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+95, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 609.6059, 3126.613, 3.763659, 3.089233, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+96, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 552.2014, 3047.906, 7.755953, 2.583087, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+97, 35650, 648, 0, 0, 1, '170', 0, 0, 0, 606.9983, 3124.774, 3.204622, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Sassy Hardwrench (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+98, 35778, 648, 0, 0, 1, '170', 0, 0, 0, 604.0243, 3100.273, 7.107584, 5.148721, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Evol Fingers (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+99, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 605.9531, 3123.128, 3.43085, 1.553343, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+100, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 611.9653, 3119.343, 5.643445, 5.183628, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+101, 36179, 648, 0, 0, 1, '170', 0, 0, 0, 620.9028, 3133.226, 3.343261, 5.934119, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+102, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 621.2421, 3155.712, -0.5725805, 4.231883, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+103, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 587.6007, 3050.094, 8.063107, 2.583087, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+104, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 579.087, 2946.76, 133.2926, 1.831216, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+105, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 615.0239, 3051.932, 9.347664, 3.028133, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+106, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 614.0586, 3050.53, 9.742614, 2.682312, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+107, 36732, 648, 0, 0, 1, '170', 0, 0, 0, 660.7271, 3139.364, 1.872296, 1.080456, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Ancient Island Turtle (Area: -Unknown- - Difficulty: 1) (Auras: 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)) (possible waypoints or random movement)
(@CGUID+108, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 667.9375, 3095.224, 5.195179, 2.373648, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+109, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 656.5966, 3157.988, 0.4856712, 4.091345, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+110, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 655.0651, 3180.953, -0.7023435, 5.222809, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+111, 35758, 648, 0, 0, 1, '170', 0, 0, 0, 640.7864, 3121.731, 2.946545, 5.51524, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bamm Megabomb (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+112, 38738, 648, 0, 0, 1, '170', 0, 0, 0, 639.5486, 3129.05, 2.194017, 5.77704, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Coach Crosscheck (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+113, 35805, 648, 0, 0, 1, '170', 0, 0, 0, 637.7257, 3133.108, 1.672268, 5.61996, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Sister Goldskimmer (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+114, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 671.34, 3100.57, 19.6014, 3.060976, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+115, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 606.8406, 3032.023, 13.08877, 4.039783, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+116, 35780, 648, 0, 0, 1, '170', 0, 0, 0, 646.3004, 3132.264, 1.777438, 5.864306, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Fizz Lighter (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+117, 35786, 648, 0, 0, 1, '170', 0, 0, 0, 644.816, 3126.258, 2.575226, 5.794493, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Maxx Avalanche (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), 78273 - Flametongue Weapon)
(@CGUID+118, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 622.8657, 3179.153, -2.326109, 5.215789, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+119, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 669.459, 3180.356, 1.273889, 0.4243665, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+120, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 697.2189, 3105.469, 7.64357, 5.257835, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+121, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 655.3671, 3208.652, -2.266781, 4.459153, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+122, 36403, 648, 0, 0, 1, '170', 0, 0, 0, 605.3125, 3120.334, 13.67198, 2.234021, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Trade Prince Gallywix (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+123, 36406, 648, 0, 0, 1, '170', 0, 0, 0, 580.2309, 3105.645, 2.870662, 4.974188, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Chip Endale (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+124, 36404, 648, 0, 0, 1, '170', 0, 0, 0, 583.2465, 3105.811, 2.945678, 4.24115, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Candy Cane (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+125, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 700.7618, 3149.853, 4.084836, 5.963786, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+126, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 656.5393, 3037.389, 12.33865, 5.088542, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+127, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 710.003, 3097.84, 33.699, 1.035366, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+128, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 701.4187, 3074.357, 10.35715, 2.769791, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+129, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 717, 3122.862, 7.132212, 2.583087, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+130, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 696.0388, 3058.614, 11.44076, 1.272513, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+131, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 679.7227, 3212.489, 2.694359, 4.37044, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+132, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 738.7745, 3141.566, 9.040801, 5.593944, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+133, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 732.6801, 3086.903, 12.12094, 2.628139, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+134, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 681.1014, 3045.15, 44.18759, 1.213812, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+135, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 709.8151, 3045.184, 13.45898, 2.678819, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+136, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 742.988, 3138.96, 15.1643, 4.21898, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+137, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 713.9219, 3032.282, 14.0318, 2.499872, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+138, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 745.7358, 3106.113, 11.65426, 4.181854, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+139, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 680.7813, 3015.691, 15.90342, 0.5809605, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+140, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 739.2626, 3077.445, 13.67553, 3.532253, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+141, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 675.5343, 3014.629, 16.11889, 3.704127, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+142, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 748.5799, 3051.359, 14.07827, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+143, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 644.3368, 3004.553, -13.458, 1.117011, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+144, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 720.655, 3026.19, 42.0829, 3.33964, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+145, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 752.5916, 3052.791, 14.07055, 0.8655584, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+146, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 754.0378, 3051.316, 14.0248, 1.094991, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+147, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 732.9426, 3026.122, 15.04484, 2.675776, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+148, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 639.6268, 2994.934, -12.17615, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+149, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 763.1052, 3110.198, 13.95492, 2.473868, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+150, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 865.292, 3072.39, 136.675, 1.702677, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+151, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 768.389, 2918.1, 163.279, 1.006531, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+152, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 780.2714, 3059.682, 13.96486, 3.003209, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+153, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 789.8971, 3082.04, 13.91271, 0.7316982, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+154, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 653.1285, 2985.535, 1.663086, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+155, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 790.3245, 3089.078, 13.91271, 3.828804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+156, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 848.649, 2993.19, 138.478, 3.61745, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+157, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 713.0776, 2989.007, 15.84949, 5.892525, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+158, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 786.7691, 3085.688, 13.91271, 2.583087, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+159, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 714.5469, 2987.426, 15.9209, 2.583087, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+160, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 746.1268, 3016.579, 13.9843, 3.102427, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+161, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 736.2917, 3184.55, 9.172161, 2.659546, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+162, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 733.7238, 3175.435, 8.564008, 3.269159, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+163, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 783.382, 3149.06, 11.78992, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+164, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 785.3559, 3124.986, 14.7309, 0, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+165, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 800.5428, 3109.087, 14.51108, 3.547384, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+166, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 811.372, 2912.49, 141.473, 3.89673, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+167, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 808.8943, 3109.445, 13.96662, 3.541936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+168, 35837, 648, 0, 0, 1, '170', 0, 0, 0, 650.2292, 2975.065, 3.133734, 2.338741, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Dead Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+169, 35838, 648, 0, 0, 1, '170', 0, 0, 0, 652.5851, 2973.304, 1.912902, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pygmy Witchdoctor (Area: -Unknown- - Difficulty: 1) (Auras: 51733 - Shadow Channelling)
(@CGUID+170, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 656.2587, 2963.76, 1.74369, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+171, 23837, 648, 0, 0, 1, '170', 0, 0, 0, 653.09, 2968.38, 2.896263, 3.822271, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+172, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 636.222, 2860.46, 140.701, 4.096237, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+173, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 665.8768, 2949.25, 0.03828933, 0.05235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+174, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 640.1545, 2956.305, 94.62457, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+175, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 650.007, 2953.948, 95.9285, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+176, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 703.7448, 2922.465, 84.92361, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+177, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 659.1302, 2942.304, 0.4584833, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+178, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 644.908, 2951.742, 95.64156, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+179, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 647.2049, 2957.729, 95.21416, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+180, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 652.0781, 2945.792, 94.52702, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+181, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 708.4913, 2921.469, 83.79742, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+182, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 645.0677, 2948.502, 95.65783, 5.969026, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+183, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 703.4618, 2915.886, 85.70818, 4.520403, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+184, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 711.309, 2914.814, 82.98271, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+185, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 654.8143, 2939.468, 92.57538, 0.03490658, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+186, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 699.342, 2921.82, 85.56366, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+187, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 645.8038, 2946.089, 95.5412, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+188, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+189, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 621.0347, 2975.261, -5.015006, 4.18879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+190, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 708.8889, 2905.747, 88.73163, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+191, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 663.5712, 2926.978, 92.80499, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+192, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 657.7639, 2925.441, 93.57563, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+193, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 694.4948, 2909.938, 89.50921, 5.67232, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+194, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 647.1077, 2932.714, 95.67709, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+195, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 633.8559, 2954.112, 93.65955, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+196, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 639.9479, 2943.149, 95.0163, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+197, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 715.7847, 2904.57, 90.17189, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+198, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 647.4011, 2938.906, 94.27084, 5.148721, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+199, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 669.846, 2814.04, 99.3808, 5.707971, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+200, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 637.4618, 2948.333, 95.02778, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+201, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 702.8611, 2908.691, 87.8941, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+202, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 654.8958, 2931.609, 93.50574, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+203, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 655.2136, 2923.844, 93.65753, 1.361357, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
-- (@CGUID+204, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+205, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 619.1077, 2973.71, -4.39635, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+206, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 718.0955, 2899.77, 89.79678, 4.572762, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+207, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 709.2552, 2896.493, 89.85516, 4.642576, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+208, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 634.4983, 2937.112, 94.88788, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+209, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 704.1406, 2898.589, 90.0192, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+210, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 627.2917, 2953.847, 92.7616, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+211, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 656.8733, 2915.944, 91.97993, 4.276057, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+212, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 725.9896, 2897.273, 88.76791, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+213, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 644.802, 2930.089, 0.1819048, 3.025887, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+214, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 720.9462, 2895.151, 88.60852, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+215, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 639.6945, 2932.152, 96.3559, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+216, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 697.4427, 2899.547, 90.65247, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+217, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 654.0608, 2919.937, 92.84375, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+218, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+219, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 691.5504, 2898.815, 91.04349, 4.485496, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+220, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 715.3264, 2895.382, 89.05287, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+221, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 686.1667, 2898.73, 92.07887, 4.764749, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+222, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 710.7066, 2901.168, 89.99509, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+223, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 734.5399, 2901.106, 89.39184, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+224, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 648.3629, 2923.283, 97.51232, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+225, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 632.2917, 2944.74, 94.77881, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+226, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 700.3871, 2903.551, 89.66013, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+227, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 707.833, 2794.18, 138.352, 1.518527, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+228, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 635.3333, 2930.041, 95.82729, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+229, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 623.7257, 2948.586, 93.85474, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+230, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 825.4247, 2972.171, 99.57141, 3.840582, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+231, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 888.2902, 2878.503, 146.2399, 2.500796, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+232, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 823.7488, 2974.768, 99.69564, 6.253897, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+233, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 968.833, 3022.16, 140.764, 2.553002, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+234, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 760.741, 3171.3, 22.3762, 5.653039, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+235, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 695.441, 3108.398, 7.072303, 2.807106, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+236, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 750.1875, 3043.844, 13.92495, 1.066632, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+237, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 742.8941, 3228.77, 10.73597, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+238, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 791.5279, 3225.509, 47.34814, 5.209644, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+239, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 710.2726, 3246.495, 3.839844, 0.5541493, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+240, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 539.8229, 3021.158, 17.30912, 2.024582, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+241, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 513.2639, 2991.928, 8.726704, 5.305801, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1)
(@CGUID+242, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 532.4861, 2966.042, 23.25632, 2.373648, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+243, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 521.9184, 2967.302, 7.996602, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+244, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 492.6354, 2972.206, 8.02257, 1.029744, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1)
(@CGUID+245, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 499.9184, 2970.431, 7.869606, 4.799655, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1)
(@CGUID+246, 35769, 648, 0, 0, 1, '170', 0, 0, 0, 495.0313, 2971.541, 7.880383, 1.797689, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Foreman Dampwick (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+247, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 437.3986, 3004.034, 3.408, 3.927894, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+248, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 440.3915, 2953.867, 5.469512, 4.954972, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+249, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 558.1996, 2942.711, 93.43964, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+250, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 562.816, 2946.477, 94.07907, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+251, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 551.4236, 2940.37, 1.807008, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+252, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 447.9286, 3000.788, 4.221494, 0.002929679, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+253, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 470.8455, 2929.069, 15.54905, 2.408554, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+254, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 412.4511, 2977.586, 0.6760604, 4.253109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+255, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 552.8976, 2936.916, 92.96085, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+256, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 558.0677, 2933.471, 0.9335793, 2.373648, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+257, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 560.9827, 2929.99, 92.71342, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+258, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+259, 23837, 648, 0, 0, 1, '170', 0, 0, 0, 570.102, 2945.58, 2.777293, 2.565634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+260, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 567.5643, 2945.48, 94.00257, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+261, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 568.8489, 2939.639, 93.35838, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+262, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 562.3577, 2937.289, 93.53751, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+263, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 559.1719, 2933.749, 93.39463, 5.393067, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+264, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 450.9824, 2917.366, 10.15955, 5.086366, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+265, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 575.0087, 2950.759, -0.7974407, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+266, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 571.1458, 2934.093, 91.63638, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+267, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 558.816, 2920.202, 92.65552, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+268, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 568.2014, 2930.089, 91.52001, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+269, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 590.0938, 2964.576, -2.406796, 1.553343, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+270, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 586.6059, 2960.256, -2.663854, 4.380776, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+271, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 576.257, 2930.712, 90.74531, 0.03490658, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+272, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 560.6805, 2912.353, 91.84138, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+273, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 565.0104, 2919.6, 92.82013, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+274, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 553.1805, 2914.766, 90.86365, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+275, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 459.381, 2888.501, 17.71203, 1.925909, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+276, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 570.9028, 2921.611, 92.43085, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+277, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 578.1007, 2925.468, 91.23657, 0.6457718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+278, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 567.217, 2911.971, 92.63162, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+279, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 576.4427, 2915.886, -7.281987, 0.6108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+280, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 574.0139, 2917.693, 92.67891, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+281, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 566.2031, 2905.951, 91.31243, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+282, 23837, 648, 0, 0, 1, '170', 0, 0, 0, 573.233, 2914.36, 3.373833, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+283, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 403.9021, 2938.497, -1.179925, 0.8351547, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+284, 37872, 648, 0, 0, 1, '170', 0, 0, 0, 566.854, 2947.43, 2.967163, 5.61996, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Capturing The Unknown - Bunny 1 (Area: -Unknown- - Difficulty: 1) (Auras: 68231 - Capturing The Unknown: Bunny 1 Invis & State Visual)
(@CGUID+285, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 581.8507, 2921.016, 92.20817, 1.134464, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+286, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 571.6406, 2908.32, -8.172973, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+287, 37895, 648, 0, 0, 1, '170', 0, 0, 0, 570.646, 2908.03, 4.517593, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Capturing The Unknown - Bunny 2 (Area: -Unknown- - Difficulty: 1) (Auras: 70686 - Capturing The Unknown: Bunny 2 Invis & State Visual)
(@CGUID+288, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 590.0053, 2937.836, -7.612967, 3.710522, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+289, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 574.1771, 2911.304, 92.98917, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+290, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 595.4636, 2942.858, -7.228994, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+291, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 576.6632, 2906.121, 92.80798, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+292, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 573.243, 2898.708, 91.58599, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+293, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 568.9583, 2898.601, 91.1302, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+294, 35810, 648, 0, 0, 1, '170', 0, 0, 0, 596.382, 2948.247, -6.443487, 2.617994, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+295, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 570.9514, 2904.955, 92.0445, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+296, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 581.8698, 2914.312, 92.99528, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+297, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 587.6077, 2921.001, 92.40412, 1.570796, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+298, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 575.8125, 2904.943, -7.236139, 6.021386, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+299, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 599.2344, 2956.083, -5.118593, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+300, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 597.6493, 2935.302, 92.26001, 3.316126, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+301, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 591.8906, 2921.719, 92.28345, 1.884956, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+302, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 596.7031, 2929.904, 91.80836, 2.792527, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+303, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 580.7864, 2901.655, 92.43521, 6.143559, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+304, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 575.118, 2892.709, 90.99301, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+305, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 578.0625, 2896.714, 91.67835, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+306, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 604.1163, 2930.466, 93.21983, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+307, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 595.3004, 2924.009, 91.6616, 2.216568, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+308, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+309, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 609.3524, 2956.903, 99.65661, 0.01745329, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+310, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 601.7361, 2923.938, 92.04633, 5.044002, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+311, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 599.2244, 2920.059, 1.339967, 3.935005, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+312, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 590.0938, 2915.818, 92.95305, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+313, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 569.5555, 2889.695, 90.32019, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+314, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 584.0764, 2906.683, 92.78564, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+315, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 606.8316, 2934.162, 2.308312, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+316, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 591.0746, 2908.853, 92.35495, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+317, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 591.007, 2896.434, 91.69971, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+318, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 605.6927, 2909.917, -0.5610677, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+319, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.4636, 2919.666, 93.26022, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+320, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 613.2552, 2954.142, 98.06625, 0.5235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+321, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 588.5208, 2901.617, 92.17361, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+322, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 578.9063, 2882.427, 88.83107, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+323, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 617.3993, 2947.042, 96.66664, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+324, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 606.4688, 2920.67, 92.68709, 5.044002, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+325, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 577.3715, 2883.752, -8.324045, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+326, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 585.0174, 2888.089, 90.26215, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+327, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 577.6042, 2887.526, 90.21271, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+328, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.2136, 2904.625, 91.9458, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+329, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 616.8918, 2948.919, 2.791754, 5.56936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+330, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 571.8403, 2880.554, 88.94454, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+331, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 615.1667, 2933.273, 94.06166, 3.368485, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+332, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 609.7083, 2927.017, 93.57583, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+333, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 605.4965, 2906.839, 91.12424, 5.026548, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+334, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 582.8108, 2895.717, 91.62468, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+335, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 605.632, 2914.42, 92.17328, 1.396263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+336, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 618.967, 2956.318, 94.56692, 4.747295, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+337, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 597.9393, 2911.412, 91.71179, 3.106686, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+338, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 622.368, 2928.425, 94.99605, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+339, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 578.2692, 2878.427, -8.570217, 5.666029, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+340, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 598.4202, 2896.997, 91.68798, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+341, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 577.9219, 2875.088, 86.96063, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+342, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 593.8281, 2891.302, 91.1983, 2.426008, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+343, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+344, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 601.316, 2893.471, 91.39775, 0.541052, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+345, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 600.2899, 2891.391, -6.564709, 5.67232, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+346, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 617.3663, 2923.202, 93.9921, 4.39823, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+347, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 612.0712, 2912.697, 92.22739, 2.426008, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+348, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 606.5469, 2898.442, 91.07522, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+349, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 624.1189, 2912.495, -1.900477, 4.669216, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+350, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 609.0295, 2857.33, -7.061595, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+351, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 618.482, 2890.665, -4.463208, 1.987078, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+352, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 621.4688, 2888.517, -4.403594, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+353, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 635.2136, 2923.201, -0.5398607, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+354, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 599.507, 2870.964, -6.07409, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+355, 37897, 648, 0, 0, 1, '170', 0, 0, 0, 650.604, 2966.22, 3.328713, 0.5585054, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Capturing The Unknown - Bunny 4 (Area: -Unknown- - Difficulty: 1) (Auras: 70688 - Capturing The Unknown: Bunny 4 Invis & State Visual)
(@CGUID+356, 37896, 648, 0, 0, 1, '170', 0, 0, 0, 616.08, 2849.9, -4.647556, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Capturing The Unknown - Bunny 3 (Area: -Unknown- - Difficulty: 1) (Auras: 70687 - Capturing The Unknown: Bunny 3 Invis & State Visual)
(@CGUID+357, 23837, 648, 0, 0, 1, '170', 0, 0, 0, 615.701, 2852.67, -5.081447, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+358, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 497.6034, 2855.189, 32.70185, 2.287053, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+359, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 521.588, 2832.614, 36.85165, 3.700606, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+360, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 511.2018, 2830.026, 38.28281, 2.339622, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+361, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 582.3924, 2869.182, 86.20313, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+362, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 484.7737, 2856.097, 31.03559, 2.094302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+363, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 576.4184, 2854.787, 85.26679, 2.460914, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+364, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 517.9783, 2761.019, 137.0415, 6.134512, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+365, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 622.875, 2906.191, 89.16146, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+366, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 593.5452, 2873.57, 92.16615, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+367, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 617.6684, 2898, 90.09549, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+368, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.5104, 2892.571, 91.23942, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+369, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 616.9913, 2909.147, 91.2225, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+370, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 613.3438, 2902.727, 90.36189, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+371, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 574.4809, 2847.046, 85.54424, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+372, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+373, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 578.2691, 2845.359, 86.79317, 4.852015, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+374, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 580.7986, 2831.06, 85.52512, 3.351032, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+375, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 575.3055, 2837.604, 85.61192, 3.036873, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+376, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 583.5643, 2833.714, 87.12207, 4.415683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+377, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 644.9583, 2853.091, 87.46576, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+378, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 642.6146, 2857.311, 87.73836, 5.969026, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+379, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 645.5382, 2845.856, 87.33391, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+380, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 639.8246, 2880.966, 87.07477, 0.122173, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+381, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 648.5035, 2860.197, 87.13161, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+382, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+383, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 643.757, 2875.859, 86.58771, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+384, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 642.5226, 2862.386, 87.63624, 6.178465, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+385, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 641.3143, 2836.215, 87.34375, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+386, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 654.8976, 2860.534, 86.44792, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+387, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 632.4636, 2822.438, 87.53406, 5.323254, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+388, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 647.8299, 2839.311, 86.9996, 3.124139, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+389, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 638.2761, 2825.689, 87.34949, 4.607669, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+390, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 651.967, 2866.075, 86.71519, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+391, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 646.3715, 2825.853, 86.05986, 0.8377581, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+392, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 639.6996, 2830.388, 87.40539, 5.61996, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+393, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 651.5469, 2854.262, 86.76477, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+394, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 649.9427, 2829.421, 85.54436, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+395, 36682, 648, 0, 0, 1, '170', 0, 0, 0, 859.0142, 2537.032, -10.10748, 2.400209, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- The Hammer (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+396, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 654.7587, 2848.353, 86.65452, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+397, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+398, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 632.6354, 2894.036, 88.10764, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+399, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 638.8507, 2901.522, 87.3177, 0.418879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+400, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 653.3524, 2886.617, 85.81208, 3.193953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+401, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 646, 2891.613, 86.27425, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+402, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 630.7292, 2904.88, 87.98264, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+403, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 621.8264, 2892.749, 89.8468, 0.1396263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+404, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 640.0313, 2895.971, 87.24214, 3.193953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+405, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 626.7864, 2878.929, 93.33352, 0.6457718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+406, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 652.5851, 2875.677, 85.73609, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+407, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 657.75, 2870.819, 85.42467, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+408, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 626.4896, 2896.406, 88.86633, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+409, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 614.507, 2883.205, 93.99274, 1.27409, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+410, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 647.6111, 2882.741, 85.90278, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+411, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 629.4861, 2889.41, 88.81918, 2.059489, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+412, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 630.8646, 2899.816, 88.01389, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+413, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 639.9792, 2889.507, 87.14931, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+414, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 645.882, 2900.541, 86.80703, 5.009095, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+415, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 651.8854, 2899.953, 86.51247, 4.18879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+416, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 619.033, 2880.955, 94.65219, 5.969026, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+417, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 618.2309, 2878.27, 95.01855, 1.343904, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+418, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 659.4358, 2883.536, 85.98644, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+419, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 643.2552, 2909.067, 87.27309, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+420, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 652.4583, 2894.408, 86.45509, 5.218534, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+421, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 620.3871, 2884.373, 94.56549, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+422, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+423, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 657.4063, 2891.694, 86.29188, 1.500983, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
-- (@CGUID+424, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+425, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 624.8542, 2923.242, 94.48114, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+426, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 625.3125, 2932.43, 95.2222, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+427, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 632.2674, 2923.805, 96.15411, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+428, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 630.0608, 2931.433, 95.71736, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+429, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 628.1979, 2937.422, 95.07793, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+430, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 666.0295, 2889.095, 86.48132, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+431, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 707.8859, 2989.732, 14.8096, 5.426627, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+432, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 714.9957, 2980.036, 16.79179, 4.835733, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+433, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 713.9219, 3032.282, 14.0318, 2.499872, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+434, 36740, 648, 0, 0, 1, '170', 0, 0, 0, 710.4963, 3044.877, 13.42212, 4.268391, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Hatchling (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+435, 35838, 648, 0, 0, 1, '170', 0, 0, 0, 652.5851, 2973.304, 1.912902, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pygmy Witchdoctor (Area: -Unknown- - Difficulty: 1) (Auras: 51733 - Shadow Channelling)
(@CGUID+436, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 667.9375, 3095.224, 5.195179, 2.373648, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+437, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 590.0938, 2964.576, -2.406796, 1.553343, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+438, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 415.1485, 2897.204, -7.4161, 0.4387771, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+439, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 381.0815, 2922.813, -6.851018, 2.087279, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+440, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 375.4599, 2960.527, -6.167395, 3.407417, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+441, 34699, 648, 0, 0, 1, '170', 0, 0, 0, 431.4149, 2849.053, 58.85744, 1.305922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+442, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 469.8234, 2800.058, 53.71754, 3.241456, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+443, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 433.8478, 2818.829, 44.77989, 4.320088, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+444, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 374.5017, 2888.677, -8.312932, 1.707996, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+445, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 416.116, 2797.537, 58.94876, 3.818317, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+446, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 486.413, 2782.227, 64.9873, 3.309309, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+447, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 354.1164, 2871.128, 12.32067, 3.882101, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+448, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 385.7497, 2791.505, 63.60372, 1.080954, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+449, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 377.7797, 2785.865, 64.50826, 1.003393, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+450, 6827, 648, 0, 0, 1, '170', 0, 0, 0, 350.8926, 2849.894, 16.53403, 2.863097, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+451, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 389.6012, 2778.699, 66.73726, 0.883556, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+452, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 513.2518, 2827.907, 38.71482, 4.491902, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+453, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 491.62, 2655.28, 94.2257, 3.285017, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+454, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 469.5412, 2731.114, 101.4217, 5.476367, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+455, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 426.7756, 2733.156, 95.18417, 0.9823358, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+456, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 427.3312, 2737.789, 95.82909, 2.574714, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+457, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 466.1752, 2729.727, 101.0237, 0.3907202, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+458, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 557.2822, 2786.849, 87.81065, 0.4737139, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+459, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 556.1738, 2757.287, 91.97728, 1.690187, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+460, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 572.2899, 2802.563, 85.70577, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+461, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 577.1476, 2808.19, 85.71327, 4.869469, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+462, 36432, 648, 0, 0, 1, '170', 0, 0, 0, 534.9011, 2716.125, 105.9871, 5.794493, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Chawg (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+463, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 592.1406, 2798.148, 89.28115, 5.951573, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+464, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 578.3333, 2824.356, 83.91351, 3.036873, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+465, 35893, 648, 0, 0, 1, '170', 0, 0, 0, 602.0538, 2783.784, 88.73811, 0.6398838, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Kilag Gorefang (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+466, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+467, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.7101, 2803.586, 89.83949, 4.415683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+468, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.5886, 2796.657, 89.26716, 5.050241, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+469, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 579.3958, 2815.661, 85.49572, 3.665191, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+470, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 584.1337, 2803.88, 86.86796, 5.131268, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+471, 35894, 648, 0, 0, 1, '170', 0, 0, 0, 600.3281, 2786.013, 88.68888, 1.908648, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+472, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 589.5035, 2805.333, 88.14439, 5.340707, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+473, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 579.8577, 2798.547, 87.84188, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+474, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 595.2535, 2811.247, 89.3382, 4.485496, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+475, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 585.066, 2794.316, 89.85236, 5.148721, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+476, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 593.6563, 2817.98, 88.96843, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+477, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 598.092, 2814.709, 89.77309, 4.852015, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+478, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 587.1424, 2812.645, 86.98427, 3.892084, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+479, 35894, 648, 0, 0, 1, '170', 0, 0, 0, 602.5712, 2780.97, 88.98627, 6.121052, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+480, 35875, 648, 0, 0, 1, '170', 0, 0, 0, 532.0903, 2684.59, 107.2642, 4.24115, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Aggra (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+481, 35882, 648, 0, 0, 1, '170', 0, 0, 0, 550.8186, 2687.804, 106.1465, 4.91982, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+482, 35882, 648, 0, 0, 1, '170', 0, 0, 0, 549.8444, 2687.173, 106.0994, 5.242242, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+483, 36578, 648, 0, 0, 1, '170', 0, 0, 0, 604.007, 2785.826, 88.32947, 0.6457718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bastia (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+484, 35882, 648, 0, 0, 1, '170', 0, 0, 0, 549.1287, 2686.931, 106.0038, 5.44645, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+485, 35891, 648, 0, 0, 1, '170', 0, 0, 0, 548.9457, 2683.874, 105.9602, 4.685836, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Infiltrator (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+486, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 605.0555, 2797.711, 88.13056, 4.328334, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+487, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 594.8733, 2823.46, 89.96069, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+488, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 610.3403, 2797.639, 87.75854, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+489, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 590.0816, 2834.056, 89.98456, 3.001966, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+490, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 604.5087, 2807.724, 90.79194, 4.660029, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+491, 35882, 648, 0, 0, 1, '170', 0, 0, 0, 548.1231, 2685.408, 105.9978, 5.952242, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+492, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 600.0278, 2819.027, 91.34282, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+493, 35882, 648, 0, 0, 1, '170', 0, 0, 0, 554.7444, 2686.043, 106.3173, 3.662618, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+494, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 608.4011, 2793.596, 87.92455, 4.13823, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+495, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.4792, 2771.835, 91.84202, 2.396792, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+496, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.0886, 2791.253, 87.47245, 3.781476, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+497, 35891, 648, 0, 0, 1, '170', 0, 0, 0, 551.5723, 2684.223, 106.3763, 2.022208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Infiltrator (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+498, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 589.408, 2839.524, 90.82435, 2.513274, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+499, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.350226, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+500, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 603.2465, 2822.826, 91.76484, 5.183628, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+501, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 616.9636, 2782.341, 88.34237, 3.236588, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+502, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 617.5104, 2778.526, 89.40452, 2.979459, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+503, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 614.7639, 2775.951, 90.45011, 2.751142, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+504, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 607.658, 2813.78, 91.48964, 4.834562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+505, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 616.7864, 2793.175, 87.09723, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+506, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 614.9305, 2801.663, 87.67206, 5.393067, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+507, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 621.7153, 2774.063, 89.6007, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+508, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 621.2136, 2797.266, 86.72223, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+509, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 621.2448, 2805.544, 88.47675, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+510, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 628.2101, 2772.296, 89.5108, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+511, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+512, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 626.1736, 2777.385, 88.8893, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+513, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 613.1719, 2814.198, 91.617, 5.5676, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+514, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 621.507, 2786.73, 87.06061, 4.153883, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+515, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 621.6875, 2792.005, 86.56454, 1.972222, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+516, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 626.1441, 2782.32, 87.90452, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+517, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 629.7604, 2792.093, 86.43271, 4.258604, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+518, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1371, 2819.999, 92.24653, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+519, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 627.2379, 2797.269, 86.04741, 1.780236, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+520, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 632.9896, 2777.011, 89.21448, 1.396263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+521, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 629.1146, 2786.352, 87.37801, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+522, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 625.2441, 2676.689, 122.9807, 4.84365, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
-- (@CGUID+523, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+524, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 632.1042, 2801.367, 85.49653, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+525, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 643.592, 2799.559, 86.03478, 2.984513, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+526, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 638.9636, 2792.353, 86.71356, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+527, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 644.4011, 2780.16, 88.84234, 1.169371, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+528, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+529, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 625.2292, 2810.437, 87.34215, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+530, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 640.3229, 2762.066, 92.91576, 2.007129, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+531, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 627.7726, 2815.005, 87.43156, 5.410521, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+532, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 643.7361, 2791.773, 87.30042, 5.846853, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+533, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 662.4733, 2721.102, 116.8678, 1.14821, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+534, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 628.0625, 2805.415, 86.68924, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+535, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 632.7292, 2809.156, 86.22852, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+536, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 638.25, 2798.998, 85.53993, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+537, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 637.1024, 2768.711, 90.33136, 1.553343, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+538, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 638.8733, 2774.774, 89.54102, 2.391101, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+539, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 622.743, 2814.233, 87.62727, 1.745329, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+540, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 647.8559, 2793.128, 87.58027, 5.969026, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+541, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 638.25, 2798.998, 85.53993, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+542, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 623.0825, 2684.013, 121.1225, 3.039785, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+543, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 634.0139, 2794.529, 86.06819, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+544, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 632.1042, 2801.367, 85.49653, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+545, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 644.4028, 2785.707, 88.05624, 3.473205, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+546, 35882, 648, 0, 0, 1, '170', 0, 0, 0, 549.9393, 2687.591, 105.9901, 5.410521, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+547, 39169, 648, 0, 0, 1, '170', 0, 0, 0, 521.8297, 2489.008, 118.1888, 3.019836, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Lost Isles Mail Bird (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 73561 - Lost Isles Mail Bird: Aura Timer)
(@CGUID+548, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 614.7639, 2775.951, 90.45011, 2.751142, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+549, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.5886, 2796.657, 89.26716, 5.050241, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+550, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 617.5104, 2778.526, 89.40452, 2.722714, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+551, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.0886, 2791.253, 87.47245, 3.781476, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+552, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 608.4011, 2793.596, 87.92455, 3.89574, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+553, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 600.3906, 2798.573, 89.57623, 4.707413, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+554, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 605.0555, 2797.711, 88.13056, 4.328334, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+555, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.350226, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+556, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 690.4608, 2740.084, 114.2967, 5.667021, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+557, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 695.3164, 2737.51, 115.124, 1.703993, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+558, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 682.8914, 2761.74, 113.9855, 4.783766, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+559, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 654.1389, 2789.318, 88.37353, 2.129302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+560, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 786.7309, 2787.307, 161.7622, 4.904451, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+561, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 725.0043, 2708.441, 118.4984, 3.917323, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+562, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 648.8768, 2799.601, 86.60001, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+563, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 657.7101, 2795.766, 87.68392, 2.234021, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+564, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 727.8663, 2713.443, 117.2954, 5.553056, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+565, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 662.7639, 2802.1, 87.28412, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+566, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 665.9636, 2808.706, 86.47319, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+567, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 650.6719, 2803.631, 85.9124, 2.303835, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+568, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 656.5643, 2799.623, 87.16762, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+569, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 660.993, 2807.879, 86.31316, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+570, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 685.7309, 2810.971, 86.99784, 1.413717, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+571, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 656.618, 2804.469, 86.42222, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+572, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 670.8073, 2819.3, 85.11951, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+573, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 685.8021, 2823.289, 86.52509, 2.129302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+574, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 666.2153, 2813.606, 85.58611, 2.426008, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+575, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 658.0538, 2818.127, 84.9323, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+576, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 674.4653, 2821.881, 85.47705, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+577, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 639.3976, 2812.065, 85.58313, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+578, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 647.5903, 2808.842, 84.90465, 4.834562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+579, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 655.3472, 2812.391, 85.02258, 4.415683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+580, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 648.1424, 2814.137, 84.80323, 1.204277, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+581, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 663.3941, 2818.738, 84.92636, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+582, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 695.2691, 2822.267, 86.70828, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+583, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 679.9688, 2817.554, 86.54332, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+584, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 692.4028, 2816.766, 88.29585, 2.181662, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+585, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 641.4496, 2805.604, 85.17709, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+586, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 660.908, 2823.921, 85.02335, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+587, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 690.743, 2825.747, 86.31483, 1.518436, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+588, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+589, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 633.7813, 2816.577, 86.90961, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+590, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 746.0411, 2802.041, 109.9694, 2.219765, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+591, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 771.0495, 2739.591, 116.2658, 5.307434, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+592, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 674.882, 2828.016, 85.28619, 5.969026, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+593, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 766.0035, 2746.286, 115.4381, 0.2577711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+594, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 652.2726, 2821.183, 85.1368, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+595, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 642.3577, 2818.759, 86.10938, 1.466077, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+596, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 679.5643, 2826.753, 86.1934, 1.972222, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+597, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 692.5191, 2830.05, 85.96155, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+598, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 696.5695, 2827.188, 86.15285, 4.468043, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+599, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 657.0087, 2827.65, 84.7245, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+600, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 686.0868, 2829.935, 86.02203, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+601, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 701.059, 2829.579, 85.93307, 1.762783, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+602, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 670.2014, 2834.131, 84.88394, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+603, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 683.2205, 2834.716, 85.45007, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+604, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 661.507, 2834.056, 85.38033, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+605, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 690.5989, 2835.251, 85.65516, 4.014257, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+606, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 654.4549, 2834.737, 85.75868, 4.014257, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+607, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 622.3212, 2825.011, 93.53487, 5.602507, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+608, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 675.6129, 2837.57, 84.82566, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+609, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 617.1302, 2826.353, 93.94965, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+610, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.4792, 2771.835, 91.84202, 2.303835, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+611, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 612.3837, 2827.35, 94.06424, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+612, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.5434, 2844.747, 95.91869, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+613, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 588.1771, 2850.593, 94.02641, 3.333579, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+614, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 593.8403, 2855.285, 96.36918, 2.9147, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+615, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 609.0295, 2857.33, -7.061595, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+616, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 592.4549, 2864.502, 95.56638, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+617, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 597.4202, 2861.71, 97.46702, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+618, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 68227 - Weed Whacker: Plant Burst Controller)
(@CGUID+619, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 598.6371, 2866.213, 97.05072, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+620, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 655.8646, 2840.728, 86.37547, 2.076942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+621, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 665.6771, 2839.454, 85.45702, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+622, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 626.9705, 2870.849, 96.7914, 0.2792527, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+623, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 662.3924, 2847.234, 86.05005, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+624, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 621.7587, 2875.103, 95.61383, 0.08726646, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+625, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 668.4496, 2845.076, 85.05776, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+626, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 666.0764, 2852.117, 85.39063, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+627, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 666.0764, 2852.117, 85.39063, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+628, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 659.4184, 2854.361, 86.24638, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+629, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 673.7083, 2845.352, 84.90625, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+630, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 673.7083, 2845.352, 84.90625, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+631, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 577.8809, 2878.78, -8.615425, 2.579835, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+632, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 664.5156, 2858.2, 85.25476, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+633, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 680.9636, 2842.149, 84.42814, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+634, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 659.3246, 2864.625, 85.40572, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+635, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 607.3646, 2881.341, 95.0249, 1.762783, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+636, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 665.0469, 2864.712, 84.76556, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+637, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 676.9063, 2851.958, 84.63368, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+638, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 687.1754, 2839.192, 85.11377, 3.124139, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+639, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 676.9063, 2851.958, 84.63368, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+640, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 671.8021, 2856.195, 84.57533, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+641, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 671.8021, 2856.195, 84.57533, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+642, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 699.559, 2843.719, 84.90447, 1.204277, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+643, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 671.0417, 2870.162, 85.74155, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+644, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 677.316, 2866.55, 85.23188, 4.101524, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+645, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+646, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 690.9167, 2844.194, 84.48476, 3.595378, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+647, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 663.7118, 2877.376, 85.83508, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+648, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 621.1354, 2890.49, -4.375284, 3.665191, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+649, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 689.6771, 2851.984, 84.88078, 1.762783, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+650, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 708.2917, 2831.816, 86.25771, 3.01942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+651, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 695.816, 2847.6, 84.68453, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+652, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+653, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 683.3802, 2865.623, 85.06076, 4.625123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+654, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 683.566, 2857.829, 84.57973, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+655, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 683.158, 2849.563, 84.33134, 2.129302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+656, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 696.2031, 2836.521, 85.53461, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+657, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 694.5989, 2841.56, 84.98824, 2.076942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+658, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 692.3698, 2859.377, 85.30956, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+659, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 710.0191, 2850.542, 86.27974, 3.752458, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+660, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 703.6476, 2849.774, 85.49203, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+661, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 678.3368, 2879.026, 86.45199, 3.595378, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+662, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 708.8889, 2838.72, 85.63845, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+663, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 672.5486, 2881.661, 86.5, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+664, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 698.5573, 2862.168, 85.97319, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+665, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 669.6042, 2877.656, 86.29176, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+666, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 710.2309, 2843.815, 85.12919, 2.722714, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+667, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 696.0573, 2856.5, 85.52755, 3.595378, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+668, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 675.3038, 2874.31, 86.25868, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+669, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 714.3386, 2836.509, 86.26834, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+670, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 703.5643, 2844.351, 84.79931, 2.513274, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+671, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 689.7031, 2869.423, 85.38849, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+672, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 686.5729, 2872.652, 85.95187, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+673, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 666.0452, 2883.327, 86.39245, 4.171337, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+674, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 701.408, 2856.575, 85.97339, 3.543018, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+675, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 706.6389, 2855.306, 86.4173, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+676, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 696.4219, 2870.043, 85.69861, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+677, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 684.9393, 2878.6, 86.48714, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+678, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 676.5313, 2885.178, 86.534, 5.585053, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+679, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 706.3455, 2861.543, 86.57262, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+680, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 715.1858, 2843.782, 85.48215, 1.48353, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+681, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+682, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 691.4375, 2886.282, 86.45971, 4.39823, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+683, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 674.5, 2894.329, 91.89857, 4.520403, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+684, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 697.0799, 2878.255, 86.46671, 5.88176, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+685, 35995, 648, 0, 0, 1, '170', 0, 0, 0, 690.9045, 2879.623, 86.50784, 5.131268, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strangle Vine (Area: -Unknown- - Difficulty: 1) (Auras: 68295 - Strangle Vine: Entangling Roots Visual)
(@CGUID+686, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 704.8299, 2867.794, 86.49287, 2.303835, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+687, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 726.8802, 2841.809, 86.2853, 2.844887, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+688, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 721.9948, 2846.161, 86.01673, 2.949606, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+689, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 682.1337, 2889.135, 88.69232, 5.078908, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+690, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 716.8698, 2848.885, 86.0565, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+691, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 686.342, 2883.04, 86.50468, 0.122173, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+692, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 600.3906, 2798.573, 89.57623, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+693, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.0886, 2791.253, 87.47245, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
-- (@CGUID+694, 36042, UNKNOWN, 0, 0, 1, '170', 0, 0, 0, -0.01588377, 0.131746, 14.89697, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) - !!! on transport - transport template not found !!!
(@CGUID+695, 6491, 648, 0, 0, 1, '170', 0, 0, 0, 521.9097, 2707.837, 105.979, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Spirit Healer (Area: -Unknown- - Difficulty: 1) (Auras: 9036 - Ghost, 10848 - Shroud of Death)
(@CGUID+696, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.4792, 2771.835, 91.84202, 2.396792, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+697, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.350226, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+698, 36383, 648, 0, 0, 1, '170', 0, 0, 0, 789.326, 2746.45, 143.121, 0.6133883, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+699, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 608.4011, 2793.596, 87.92455, 3.89574, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+700, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 614.7639, 2775.951, 90.45011, 2.495821, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+701, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.5886, 2796.657, 89.26716, 5.113815, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+702, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.0886, 2791.253, 87.47245, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+703, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 730.1528, 2848.155, 86.40402, 3.717551, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+704, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+705, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 697.6302, 2884.994, 86.48492, 4.747295, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+706, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 702.3768, 2883.997, 86.6283, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+707, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 616.9636, 2782.341, 88.34237, 2.984513, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+708, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 608.4011, 2793.596, 87.92455, 4.206244, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+709, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 675.0347, 2898.408, 92.39704, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+710, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 760.3765, 2848.762, 107.0961, 1.06607, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+711, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 600.3906, 2798.573, 89.57623, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+712, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 624.5801, 2913.979, -1.667751, 1.114571, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+713, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 645.6904, 2931.26, 0.3378803, 3.637448, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+714, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 761.3915, 2892.41, 95.65466, 2.135503, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+715, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 614.7639, 2775.951, 90.45011, 2.495821, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+716, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 788.9668, 2788.428, 111.4212, 0.8766833, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+717, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 781.2596, 2783.131, 111.9736, 0.09713323, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+718, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 808.4983, 2873.967, 104.6931, 0.5042544, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+719, 35904, 648, 0, 0, 1, '170', 0, 0, 0, 820.1134, 2882.07, 101.8403, 2.148236, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+720, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 665.8768, 2949.25, 0.03828933, 0.05235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+721, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 608.4011, 2793.596, 87.92455, 3.89574, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+722, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.4792, 2771.835, 91.84202, 2.396792, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+723, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.5886, 2796.657, 89.26716, 5.050241, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+724, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 605.0555, 2797.711, 88.13056, 4.328334, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+725, 36042, 648, 0, 0, 1, '170', 0, 0, 0, 690.9045, 2879.623, 86.59117, 1.570796, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 46598 - Ride Vehicle Hardcoded) (possible waypoints or random movement)
(@CGUID+726, 35812, 648, 0, 0, 1, '170', 0, 0, 0, 575.8125, 2904.943, -7.236139, 6.021386, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1)
(@CGUID+727, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+728, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 616.9636, 2782.341, 88.34237, 2.984513, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+729, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 612.0886, 2791.253, 87.47245, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+730, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 608.4011, 2793.596, 87.92455, 3.89574, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+731, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 596.5886, 2796.657, 89.26716, 5.113815, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+732, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 614.7639, 2775.951, 90.45011, 2.495821, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+733, 35897, 648, 0, 0, 1, '170', 0, 0, 0, 605.0555, 2797.711, 88.13056, 4.468043, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+734, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 600.3906, 2798.573, 89.57623, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+735, 35891, 648, 0, 0, 1, '170', 0, 0, 0, 551.5723, 2684.223, 106.3763, 2.022208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Infiltrator (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+736, 35891, 648, 0, 0, 1, '170', 0, 0, 0, 549.2409, 2683.808, 105.9602, 5.173538, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Infiltrator (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+737, 36591, 648, 0, 0, 1, '170', 0, 0, 0, 622.084, 2680.467, 121.7606, 2.830661, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+738, 35896, 648, 0, 0, 1, '170', 0, 0, 0, 615.1042, 2786.547, 87.42069, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: )
(@CGUID+739, 4075, 648, 0, 0, 1, '170', 0, 0, 0, 464.367, 2724.64, 100.8951, 4.934871, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+740, 36735, 648, 0, 0, 1, '171', 0, 0, 0, 789.0452, 2976.731, 92.66994, 2.513274, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Teraptor Matriarch (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+741, 36682, 648, 0, 0, 1, '171', 0, 0, 0, 860.2199, 2538.61, -9.660428, 6.159849, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- The Hammer (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+742, 39655, 648, 0, 0, 1, '171', 0, 0, 0, 550.8186, 2687.804, 106.1465, 4.91982, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+743, 35891, 648, 0, 0, 1, '171', 0, 0, 0, 551.5723, 2684.223, 106.3763, 2.022208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Infiltrator (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+744, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 558.7849, 2750.958, 93.45325, 3.904189, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+745, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 622.0159, 2680.38, 121.754, 2.86584, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+746, 35891, 648, 0, 0, 1, '171', 0, 0, 0, 552.6624, 2685.237, 106.3513, 0.7494228, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Infiltrator (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+747, 39655, 648, 0, 0, 1, '171', 0, 0, 0, 549.1287, 2686.931, 106.0038, 5.44645, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+748, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 466.7078, 2725.804, 101.3825, 6.010252, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+749, 39655, 648, 0, 0, 1, '171', 0, 0, 0, 548.1231, 2685.408, 105.9978, 5.952242, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+750, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 616.666, 2690.104, 117.496, 2.357085, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+751, 39655, 648, 0, 0, 1, '171', 0, 0, 0, 554.7444, 2686.043, 106.3173, 3.662618, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+752, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 472.1543, 2727.821, 102.1236, 2.454352, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+753, 39655, 648, 0, 0, 1, '171', 0, 0, 0, 549.8444, 2687.173, 106.0994, 5.242242, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+754, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 572.2899, 2802.563, 85.70577, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+755, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 628.2101, 2772.296, 89.5108, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+756, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 577.1476, 2808.19, 85.71327, 4.869469, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+757, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 617.2708, 2778.856, 89.35459, 2.897247, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+758, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 584.1337, 2803.88, 86.86796, 5.131268, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+759, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 556.5615, 2792.093, 85.3398, 0.01269463, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+760, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 621.7153, 2774.063, 89.6007, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+761, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 585.066, 2794.316, 89.85236, 5.148721, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+762, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 608.0955, 2793.507, 87.95868, 4.223697, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+763, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 642.989, 2711.41, 117.6609, 2.612394, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+764, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 600.3212, 2798.427, 89.55353, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+765, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 621.507, 2786.73, 87.06061, 4.153883, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+766, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 640.3229, 2762.066, 92.91576, 2.007129, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+767, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 611.8542, 2791.005, 87.47725, 3.403392, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+768, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 589.5035, 2805.333, 88.14439, 5.340707, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+769, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 614.6424, 2786.59, 87.44485, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+770, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 614.3906, 2775.958, 90.47852, 2.565634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+771, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 616.3889, 2782.326, 88.37056, 3.124139, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+772, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 626.1441, 2782.32, 87.90452, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+773, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 592.1406, 2798.148, 89.28115, 5.951573, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+774, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 596.4722, 2796.518, 89.26389, 4.956735, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+775, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 637.1024, 2768.711, 90.33136, 1.553343, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+776, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 604.6389, 2797.207, 88.21763, 4.276057, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+777, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 612.0833, 2771.957, 91.79819, 2.251475, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+778, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 626.1736, 2777.385, 88.8893, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+779, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 579.8577, 2798.547, 87.84188, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+780, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 621.2136, 2797.266, 86.72223, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+781, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 604.5087, 2807.724, 90.79194, 4.660029, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+782, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 579.3958, 2815.661, 85.49572, 3.665191, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+783, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 610.3403, 2797.639, 87.75854, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+784, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 657.8475, 2717.619, 117.8577, 3.277825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+785, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 595.2535, 2811.247, 89.3382, 4.485496, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+786, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 587.1424, 2812.645, 86.98427, 3.892084, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+787, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 629.1146, 2786.352, 87.37801, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+788, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 632.9896, 2777.011, 89.21448, 1.396263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+789, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 616.7864, 2793.175, 87.09723, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+790, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 596.7101, 2803.586, 89.83949, 4.415683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+791, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 491.8271, 2782.44, 65.72012, 2.242794, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+792, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 638.8733, 2774.774, 89.54102, 2.391101, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+793, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 614.9305, 2801.663, 87.67206, 5.393067, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+794, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 593.6563, 2817.98, 88.96843, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+795, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 632.1042, 2801.367, 85.49653, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+796, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 629.7604, 2792.093, 86.43271, 4.258604, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+797, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 613.1719, 2814.198, 91.617, 5.5676, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+798, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 607.658, 2813.78, 91.48964, 4.834562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+799, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 644.4028, 2785.707, 88.05624, 3.473205, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+800, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 578.3333, 2824.356, 83.91351, 3.036873, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+801, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 600.0278, 2819.027, 91.34282, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+802, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 638.9636, 2792.353, 86.71356, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+803, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 644.4011, 2780.16, 88.84234, 1.169371, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+804, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 632.1042, 2801.367, 85.49653, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+805, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 627.2379, 2797.269, 86.04741, 1.780236, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+806, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 621.2448, 2805.544, 88.47675, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+807, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 634.0139, 2794.529, 86.06819, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+808, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 643.592, 2799.559, 86.03478, 2.984513, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+809, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 625.2292, 2810.437, 87.34215, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+810, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 649.2153, 2784.752, 88.50848, 2.495821, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+811, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 594.8733, 2823.46, 89.96069, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+812, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 628.0625, 2805.415, 86.68924, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+813, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 632.7292, 2809.156, 86.22852, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+814, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 615.1371, 2819.999, 92.24653, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+815, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 638.25, 2798.998, 85.53993, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+816, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 638.25, 2798.998, 85.53993, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+817, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 580.7986, 2831.06, 85.52512, 3.351032, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+818, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 609.4393, 2823.345, 92.85243, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+819, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 627.7726, 2815.005, 87.43156, 5.410521, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+820, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 603.2465, 2822.826, 91.76484, 5.183628, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+821, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 643.7361, 2791.773, 87.30042, 5.846853, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+822, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 650.6719, 2803.631, 85.9124, 2.303835, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+823, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 641.4496, 2805.604, 85.17709, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+824, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 633.7813, 2816.577, 86.90961, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+825, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 583.5643, 2833.714, 87.12207, 4.415683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+826, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 648.8768, 2799.601, 86.60001, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+827, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 617.1302, 2826.353, 93.94965, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+828, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 654.1389, 2789.318, 88.37353, 2.129302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+829, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 612.3837, 2827.35, 94.06424, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+830, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 639.3976, 2812.065, 85.58313, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+831, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 590.0816, 2834.056, 89.98456, 3.001966, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+832, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 622.3212, 2825.011, 93.53487, 5.602507, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+833, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 638.2761, 2825.689, 87.34949, 4.607669, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+834, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 580.8629, 2842.069, 87.38021, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+835, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 655.3472, 2812.391, 85.02258, 4.415683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+836, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 642.3577, 2818.759, 86.10938, 1.466077, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+837, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 648.1424, 2814.137, 84.80323, 1.204277, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+838, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 662.7639, 2802.1, 87.28412, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+839, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 657.7101, 2795.766, 87.68392, 2.234021, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+840, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 647.5903, 2808.842, 84.90465, 4.834562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+841, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 656.5643, 2799.623, 87.16762, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+842, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 660.993, 2807.879, 86.31316, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+843, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 656.618, 2804.469, 86.42222, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+844, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 589.408, 2839.524, 90.82435, 2.513274, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+845, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 596.5434, 2844.747, 95.91869, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+846, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 575.3055, 2837.604, 85.61192, 3.036873, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+847, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 632.4636, 2822.438, 87.53406, 5.323254, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+848, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 684.5948, 2762.448, 114.1094, 5.425251, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+849, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 665.9636, 2808.706, 86.47319, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+850, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 652.2726, 2821.183, 85.1368, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+851, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 588.1771, 2850.593, 94.02641, 3.333579, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+852, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 574.4809, 2847.046, 85.54424, 3.141593, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+853, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 658.0538, 2818.127, 84.9323, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+854, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 639.6996, 2830.388, 87.40539, 5.61996, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+855, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 657.0087, 2827.65, 84.7245, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+856, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 641.3143, 2836.215, 87.34375, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+857, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 576.4184, 2854.787, 85.26679, 2.460914, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+858, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 649.9427, 2829.421, 85.54436, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+859, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 666.2153, 2813.606, 85.58611, 2.426008, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+860, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 660.908, 2823.921, 85.02335, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+861, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 593.8403, 2855.285, 96.36918, 2.9147, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+862, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 663.3941, 2818.738, 84.92636, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+863, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 512.4515, 2824.856, 39.346, 4.455945, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+864, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 608.5191, 2857.307, -7.04389, 4.712389, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+865, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 654.4549, 2834.737, 85.75868, 4.014257, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+866, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 519.1691, 2831.711, 37.39882, 0.5809605, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+867, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 592.4549, 2864.502, 95.56638, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+868, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 647.8299, 2839.311, 86.9996, 3.124139, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+869, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 598.6371, 2866.213, 97.05072, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+870, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 597.4202, 2861.71, 97.46702, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+871, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 645.5382, 2845.856, 87.33391, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+872, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 606.1493, 2859.955, -6.653656, 3.665191, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+873, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 670.8073, 2819.3, 85.11951, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+874, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 661.507, 2834.056, 85.38033, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+875, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 668.6007, 2826.929, 84.80693, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+876, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 582.6337, 2869.886, -7.378273, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+877, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 665.6771, 2839.454, 85.45702, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+878, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 674.4653, 2821.881, 85.47705, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+879, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 655.8646, 2840.728, 86.37547, 2.076942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+880, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 593.5452, 2873.57, 92.16615, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+881, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 679.9688, 2817.554, 86.54332, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+882, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 644.9583, 2853.091, 87.46576, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+883, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 654.7587, 2848.353, 86.65452, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+884, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 599.2314, 2871.86, -6.140728, 3.9925, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+885, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 670.2014, 2834.131, 84.88394, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+886, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 582.3924, 2869.182, 86.20313, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+887, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 662.3924, 2847.234, 86.05005, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+888, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 675.6129, 2837.57, 84.82566, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+889, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 626.9705, 2870.849, 96.7914, 0.2792527, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+890, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 685.8021, 2823.289, 86.52509, 2.129302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+891, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 642.5226, 2862.386, 87.63624, 6.178465, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+892, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 689.5787, 2743.478, 113.6561, 0.8392879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+893, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 679.5643, 2826.753, 86.1934, 1.972222, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+894, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 577.9219, 2875.088, 86.96063, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+895, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 654.8976, 2860.534, 86.44792, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+896, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 668.4496, 2845.076, 85.05776, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+897, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 685.7309, 2810.971, 86.99784, 1.413717, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+898, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 659.4184, 2854.361, 86.24638, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+899, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 651.5469, 2854.262, 86.76477, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+900, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 648.5035, 2860.197, 87.13161, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+901, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 621.7587, 2875.103, 95.61383, 0.08726646, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+902, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 626.7864, 2878.929, 93.33352, 0.6457718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+903, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 692.4028, 2816.766, 88.29585, 2.181662, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+904, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 576.8073, 2877.975, -8.500837, 1.692969, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+905, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 632.4514, 2876.934, -5.928873, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+906, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 664.5156, 2858.2, 85.25476, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+907, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 659.3246, 2864.625, 85.40572, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+908, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 683.2205, 2834.716, 85.45007, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+909, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 651.967, 2866.075, 86.71519, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+910, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 570.7118, 2877.206, -8.379104, 4.171337, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+911, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 618.2309, 2878.27, 95.01855, 1.343904, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+912, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 673.7083, 2845.352, 84.90625, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+913, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 673.7083, 2845.352, 84.90625, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+914, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 680.9636, 2842.149, 84.42814, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+915, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 646.3038, 2868.832, 87.14243, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+916, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 690.743, 2825.747, 86.31483, 1.518436, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+917, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 607.3646, 2881.341, 95.0249, 1.762783, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+918, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 666.0764, 2852.117, 85.39063, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+919, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 666.0764, 2852.117, 85.39063, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+920, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 686.0868, 2829.935, 86.02203, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+921, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 676.9063, 2851.958, 84.63368, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+922, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 692.5191, 2830.05, 85.96155, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+923, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 683.158, 2849.563, 84.33134, 2.129302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+924, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 671.8021, 2856.195, 84.57533, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+925, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 690.9167, 2844.194, 84.48476, 3.595378, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+926, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 671.8021, 2856.195, 84.57533, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+927, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 614.507, 2883.205, 93.99274, 1.27409, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+928, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 634.8177, 2885.266, 88.03865, 0.8726646, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+929, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 639.8246, 2880.966, 87.07477, 0.122173, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+930, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 701.059, 2829.579, 85.93307, 1.762783, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+931, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 695.2691, 2822.267, 86.70828, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+932, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 665.4462, 2871.322, 85.47223, 3.193953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+933, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 643.757, 2875.859, 86.58771, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+934, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 696.5695, 2827.188, 86.15285, 4.468043, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+935, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 665.0469, 2864.712, 84.76556, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+936, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 652.5851, 2875.677, 85.73609, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+937, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 690.5989, 2835.251, 85.65516, 4.014257, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+938, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 578.9063, 2882.427, 88.83107, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+939, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 696.2031, 2836.521, 85.53461, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+940, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 687.1754, 2839.192, 85.11377, 3.124139, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+941, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 694.5989, 2841.56, 84.98824, 2.076942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+942, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 657.75, 2870.819, 85.42467, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+943, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 620.3871, 2884.373, 94.56549, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+944, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 571.8403, 2880.554, 88.94454, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+945, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 676.9063, 2851.958, 84.63368, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+946, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 683.566, 2857.829, 84.57973, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+947, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 647.6111, 2882.741, 85.90278, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+948, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 694.5601, 2738.086, 114.9833, 2.31621, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+949, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 578.5924, 2882.723, -8.346396, 5.582843, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+950, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 671.0417, 2870.162, 85.74155, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+951, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 619.7843, 2886.007, -4.59147, 5.47779, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+952, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 595.7778, 2892.313, -7.208358, 3.351032, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+953, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 629.4861, 2889.41, 88.81918, 2.059489, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+954, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 675.3038, 2874.31, 86.25868, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+955, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 632.6354, 2894.036, 88.10764, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+956, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 689.6771, 2851.984, 84.88078, 1.762783, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+957, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 659.4358, 2883.536, 85.98644, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+958, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 653.3524, 2886.617, 85.81208, 3.193953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+959, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 612.5104, 2892.571, 91.23942, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+960, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 663.7118, 2877.376, 85.83508, 3.857178, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+961, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 601.316, 2893.471, 91.39775, 0.541052, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+962, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 695.816, 2847.6, 84.68453, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+963, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 639.9792, 2889.507, 87.14931, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+964, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 585.0174, 2888.089, 90.26215, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+965, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 619.8611, 2890.705, -4.363836, 6.091199, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+966, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 577.6042, 2887.526, 90.21271, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+967, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 593.8281, 2891.302, 91.1983, 2.426008, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+968, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 683.3802, 2865.623, 85.06076, 4.625123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+969, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 621.8264, 2892.749, 89.8468, 0.1396263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+970, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 600.0746, 2891.235, -6.581847, 5.72468, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+971, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 613.0035, 2895.662, -3.086382, 4.118977, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+972, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 677.316, 2866.55, 85.23188, 4.101524, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+973, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 669.6042, 2877.656, 86.29176, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+974, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 708.2917, 2831.816, 86.25771, 3.01942, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+975, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 672.5486, 2881.661, 86.5, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+976, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 652.4583, 2894.408, 86.45509, 5.218534, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+977, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 678.3368, 2879.026, 86.45199, 3.595378, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+978, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 689.7031, 2869.423, 85.38849, 4.817109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+979, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 617.6684, 2898, 90.09549, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+980, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 703.6476, 2849.774, 85.49203, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+981, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 710.2309, 2843.815, 85.12919, 2.722714, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+982, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 630.8646, 2899.816, 88.01389, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+983, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 666.0452, 2883.327, 86.39245, 4.171337, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+984, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 666.0295, 2889.095, 86.48132, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+985, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 640.0313, 2895.971, 87.24214, 3.193953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+986, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 626.4896, 2896.406, 88.86633, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+987, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 696.0573, 2856.5, 85.52755, 3.595378, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+988, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 646, 2891.613, 86.27425, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+989, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 698.5573, 2862.168, 85.97319, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+990, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 701.408, 2856.575, 85.97339, 3.543018, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+991, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 692.3698, 2859.377, 85.30956, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+992, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 606.5469, 2898.442, 91.07522, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+993, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 708.8889, 2838.72, 85.63845, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+994, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 686.5729, 2872.652, 85.95187, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+995, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 598.4202, 2896.997, 91.68798, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+996, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 703.5643, 2844.351, 84.79931, 2.513274, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+997, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 697.0799, 2878.255, 86.46671, 5.88176, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+998, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 674.5, 2894.329, 91.89857, 4.520403, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+999, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 697.6302, 2884.994, 86.48492, 4.747295, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+1000, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 706.3455, 2861.543, 86.57262, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1001, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 704.8299, 2867.794, 86.49287, 2.303835, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1002, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 676.5313, 2885.178, 86.534, 5.585053, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1003, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 714.3386, 2836.509, 86.26834, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1004, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 675.0347, 2898.408, 92.39704, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1005, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 702.3768, 2883.997, 86.6283, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1006, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 706.6389, 2855.306, 86.4173, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1007, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 696.4219, 2870.043, 85.69861, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1008, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 686.342, 2883.04, 86.50468, 0.122173, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1009, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 715.1858, 2843.782, 85.48215, 1.48353, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1010, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 716.8698, 2848.885, 86.0565, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1011, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 686.1667, 2898.73, 92.07887, 4.764749, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1012, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 721.9948, 2846.161, 86.01673, 2.949606, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1013, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 651.8854, 2899.953, 86.51247, 4.18879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1014, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 645.882, 2900.541, 86.80703, 5.009095, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1015, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 682.1337, 2889.135, 88.69232, 5.078908, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1016, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 721.0243, 2839.662, 86.18968, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1017, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 638.8507, 2901.522, 87.3177, 0.418879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1018, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 684.9393, 2878.6, 86.48714, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1019, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 710.0191, 2850.542, 86.27974, 3.752458, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1020, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 691.4375, 2886.282, 86.45971, 4.39823, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1021, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 726.8802, 2841.809, 86.2853, 2.844887, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1022, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 708.8889, 2905.747, 88.73163, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1023, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 654.0608, 2919.937, 92.84375, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1024, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 643.2552, 2909.067, 87.27309, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1025, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 700.3871, 2903.551, 89.66013, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1026, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 656.8733, 2915.944, 91.97993, 4.276057, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1027, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 709.2552, 2896.493, 89.85516, 4.642576, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1028, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 691.5504, 2898.815, 91.04349, 4.485496, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1029, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 616.9913, 2909.147, 91.2225, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1030, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 702.8611, 2908.691, 87.8941, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1031, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 613.3438, 2902.727, 90.36189, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1032, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 697.4427, 2899.547, 90.65247, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1033, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 612.0712, 2912.697, 92.22739, 2.426008, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1034, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 720.9462, 2895.151, 88.60852, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1035, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 739.1266, 2811.878, 107.5012, 2.346526, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1036, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 635.8629, 2907.006, 87.6207, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1037, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 591.007, 2896.434, 91.69971, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1038, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 694.4948, 2909.938, 89.50921, 5.67232, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1039, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 715.3264, 2895.382, 89.05287, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1040, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 605.4965, 2906.839, 91.12424, 5.026548, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1041, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 704.1406, 2898.589, 90.0192, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1042, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 630.7292, 2904.88, 87.98264, 0.7330383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1043, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 622.875, 2906.191, 89.16146, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1044, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 710.7066, 2901.168, 89.99509, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1045, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 698.8038, 2911.761, 87.77112, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1046, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 730.1528, 2848.155, 86.40402, 3.717551, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1047, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 661.0486, 2927.342, -0.3170637, 5.67232, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1048, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 648.3629, 2923.283, 97.51232, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1049, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 632.2674, 2923.805, 96.15411, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1050, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 625.2969, 2913.722, -1.640789, 3.665191, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1051, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 642.6702, 2927.036, 98.06477, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1052, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 631.8987, 2922.343, -0.6949209, 3.395058, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1053, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 725.9896, 2897.273, 88.76791, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1054, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 657.7639, 2925.441, 93.57563, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1055, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 715.7847, 2904.57, 90.17189, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1056, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 611.7239, 2914.077, -0.8960267, 1.151917, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1057, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 608.3482, 2908.963, -1.283808, 5.938033, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1058, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 624.8542, 2923.242, 94.48114, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1059, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 596.2136, 2904.625, 91.9458, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1060, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 605.632, 2914.42, 92.17328, 1.396263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1061, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 588.5208, 2901.617, 92.17361, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1062, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 663.5712, 2926.978, 92.80499, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1063, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 618.9305, 2916.249, 92.58112, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1064, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 582.8108, 2895.717, 91.62468, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1065, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 708.4913, 2921.469, 83.79742, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1066, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 639.6945, 2932.152, 96.3559, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1067, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 703.7448, 2922.465, 84.92361, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1068, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 654.8958, 2931.609, 93.50574, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1069, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 720.5313, 2903.573, 90.25468, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1070, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 699.342, 2921.82, 85.56366, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1071, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 646.7518, 2929.341, 0.1110263, 3.665191, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1072, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 612.4636, 2919.666, 93.26022, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1073, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 711.309, 2914.814, 82.98271, 4.29351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1074, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 597.9393, 2911.412, 91.71179, 3.106686, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1075, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 635.3333, 2930.041, 95.82729, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1076, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 647.1077, 2932.714, 95.67709, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1077, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 734.5399, 2901.106, 89.39184, 3.944444, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1078, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 622.368, 2928.425, 94.99605, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1079, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 638.2899, 2936.234, 0.6728183, 1.658063, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1080, 36719, 648, 0, 0, 1, '171', 0, 0, 0, 589.8951, 3027.433, 40.62906, 2.915912, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1081, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 647.4011, 2938.906, 94.27084, 5.148721, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1082, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 654.8143, 2939.468, 92.57538, 0.03490658, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1083, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 625.3125, 2932.43, 95.2222, 1.082104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1084, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 660.6608, 2944.794, 0.2946601, 1.019675, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1085, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 768.035, 2864.517, 107.2303, 2.136851, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1086, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 606.4688, 2920.67, 92.68709, 5.044002, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1087, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 630.0608, 2931.433, 95.71736, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1088, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 634.4983, 2937.112, 94.88788, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1089, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 639.9479, 2943.149, 95.0163, 2.86234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1090, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 650.007, 2953.948, 95.9285, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1091, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 652.0781, 2945.792, 94.52702, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1092, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 647.2049, 2957.729, 95.21416, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1093, 36342, 648, 0, 0, 1, '171', 0, 0, 0, 662.2239, 2949.865, 0.5655344, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Smart Mining Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1094, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 767.3722, 2882.687, 99.07002, 5.266401, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1095, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 645.8038, 2946.089, 95.5412, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1096, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 666.2344, 2949.048, 0.01955234, 0.2443461, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1097, 35928, 648, 0, 0, 1, '171', 0, 0, 0, 628.1979, 2937.422, 95.07793, 4.34587, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Freezya (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1098, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 644.908, 2951.742, 95.64156, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1099, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 654.4114, 2952.657, 1.803933, 3.717551, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1100, 36344, 648, 0, 0, 1, '171', 0, 0, 0, 668.8246, 2969.583, -1.026402, 6.265732, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frightened Miner (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1101, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 637.4618, 2948.333, 95.02778, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1102, 35929, 648, 0, 0, 1, '171', 0, 0, 0, 632.2917, 2944.74, 94.77881, 1.186824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Poison Spitter (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1103, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 803.161, 2871.8, 105.6011, 3.412383, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1104, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 812.8964, 2883.589, 103.4191, 4.116787, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1105, 34699, 648, 0, 0, 1, '171', 0, 0, 0, 714.5469, 2987.426, 15.95523, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bomb-Throwing Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1106, 36719, 648, 0, 0, 1, '171', 0, 0, 0, 700.7188, 3080.764, 33.3478, 4.427818, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1107, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 855.9321, 2890.31, 100.0263, 0.07916817, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1108, 36383, 648, 0, 0, 1, '171', 0, 0, 0, 963.946, 2937.83, 133.523, 2.586523, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1109, 36063, 648, 0, 0, 1, '171', 0, 0, 0, 855.5, 2846.718, 103.8352, 1.27409, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1110, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 848.1653, 2945.354, 100.6233, 3.125871, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1111, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 863.4781, 2908.643, 100.9511, 4.219903, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1112, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 822.6006, 2972.751, 99.37549, 4.754397, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1113, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 826.5197, 2974.705, 99.70276, 2.718116, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1114, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 837.9524, 2799.8, 109.1537, 3.158193, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1115, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 784.7443, 2784.095, 111.9927, 3.868965, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1116, 36578, 648, 0, 0, 1, '171', 0, 0, 0, 870.592, 2820.306, 109.2544, 1.727876, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bastia (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1117, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 766.3046, 2780.958, 111.7222, 4.701647, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1118, 36063, 648, 0, 0, 1, '171', 0, 0, 0, 869.4583, 2822.979, 108.2982, 1.675516, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1119, 35917, 648, 0, 0, 1, '171', 0, 0, 0, 868.8299, 2820.598, 108.823, 1.553343, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Kilag Gorefang (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1120, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 883.9158, 2916.031, 102.2208, 3.386902, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1121, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 834.7275, 2753.569, 115.9331, 0.05248867, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1122, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 916.5435, 2765.65, 116.0245, 1.969792, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1123, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 951.4538, 2844.948, 118.8448, 2.970824, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1124, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 948.1059, 2788.365, 116.9243, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1125, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 941.449, 2762.357, 113.307, 3.161122, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1126, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1013.279, 2903.86, 109.9853, 2.234021, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1127, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 795.3333, 2992.873, 93.64191, 2.565634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1128, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 941.8021, 2997.656, 110.8358, 5.375614, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1129, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 797.6528, 2993.85, 94.85417, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1130, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 953.8611, 2869.901, 116.957, 1.815142, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1131, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 936.9861, 2999.073, 111.7154, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1132, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 926.9453, 2954.784, 108.3682, 0.8061134, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1133, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 973.7151, 2895.583, 111.1749, 4.292875, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1134, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 923.1088, 2954.845, 107.9645, 0.8261496, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1135, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 845.8785, 2995.648, 102.7795, 5.375614, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1136, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 977.4919, 2896.965, 110.7911, 4.266207, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1137, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 848.9802, 2899.088, 100.1845, 1.086604, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1138, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 848.9566, 2996.514, 103.7917, 5.113815, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1139, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 845.1594, 2897.901, 100.5048, 1.086276, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1140, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 863.5417, 3013.583, 110.8329, 2.495821, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1141, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 891.8455, 2982.836, 108.7906, 5.375614, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1142, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 876.1111, 2937.872, 102.3575, 5.166174, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1143, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 923.0434, 2974.807, 111.8416, 4.747295, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1144, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1020.826, 2910.658, 110.8114, 1.727876, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1145, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 822.5295, 2902.982, 102.3894, 5.410521, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1146, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 828.0851, 2901.921, 101.6493, 4.904375, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1147, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 950.783, 2869.036, 116.7507, 2.059489, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1148, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 897.1632, 2983.593, 108.5257, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1149, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 869.257, 2941.237, 101.2158, 4.694936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1150, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 920.3403, 2970.014, 110.1012, 4.782202, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1151, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 864.3629, 3016.046, 110.5877, 2.565634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1152, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 772.4537, 2743.757, 115.7658, 0.5213263, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1153, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 791.4716, 2703.514, 111.9945, 4.462672, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1154, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 963.812, 2869.719, 114.4122, 1.640157, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1155, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1006.417, 2988.883, 113.1256, 3.892084, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1156, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 900.0713, 2932.898, 104.0148, 1.538418, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1157, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1066.901, 2892.085, 113.4916, 2.234021, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1158, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1007.764, 2992.049, 113.9348, 3.735005, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1159, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 948.7096, 3027.308, 112.6906, 4.206808, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1160, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 952.5917, 3028.439, 113.3302, 4.198936, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1161, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1071.25, 2897.855, 112.6341, 2.6529, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1162, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 991.3889, 3021.205, 113.0546, 3.822271, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1163, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 991.9167, 3025.574, 113.9993, 3.036873, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1164, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 951.5781, 3046.57, 114.114, 4.799655, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1165, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 907.0773, 2952.799, 105.3181, 2.528385, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1166, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 944.9375, 3050.822, 121.1161, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1167, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 977.9865, 2903.987, 110.6198, 1.702057, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1168, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 990.2604, 3052.229, 115.0315, 3.961897, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1169, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 993.2257, 3050.218, 114.9634, 4.223697, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1170, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1026.483, 3034.948, 127.8461, 4.694936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1171, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1079.887, 2947.129, 113.4609, 4.258604, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1172, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1074.556, 2947.246, 113.5207, 3.630285, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1173, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1028.802, 3035.925, 127.7781, 4.502949, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1174, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 908.6244, 2992.51, 109.5999, 3.711992, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1175, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 989.0066, 2912.016, 110.9819, 5.203553, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1176, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 874.4642, 3000.264, 107.1358, 1.901336, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1177, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 908.8624, 2999.099, 110.8788, 4.316085, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1178, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 959.8784, 2985.175, 111.7709, 5.515741, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1179, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 954.993, 2991.673, 111.6459, 2.374148, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1180, 36383, 648, 0, 0, 1, '171', 0, 0, 0, 1067.21, 3016.76, 178.853, 2.730164, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1181, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1058.04, 3041.182, 126.6473, 5.759586, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1182, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1059.069, 3043.168, 127.1397, 5.462881, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1183, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1033.2, 3072.953, 132.1721, 1.797689, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1184, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 908.7016, 3026.52, 113.7012, 3.950467, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1185, 36719, 648, 0, 0, 1, '171', 0, 0, 0, 771.5422, 3085.813, 28.13425, 6.093576, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1186, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1089.044, 2932.066, 111.7477, 1.228363, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1187, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1085.528, 2930.154, 111.2971, 1.276533, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1188, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1111.915, 2939.523, 113.7158, 3.438299, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1189, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1015.06, 2924.498, 111.3521, 3.189455, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1190, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1117.811, 2937.65, 113.2339, 3.560472, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1191, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1124.076, 2977.197, 116.1076, 3.089233, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1192, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1117.49, 2991.276, 117.1533, 2.443461, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1193, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1034.925, 3074.171, 131.7447, 1.815142, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1194, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 988.9443, 2981.547, 111.3867, 4.816819, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1195, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 986.1458, 2791.488, 116.2517, 1.003917, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1196, 36383, 648, 0, 0, 1, '171', 0, 0, 0, 1043.37, 3073.65, 179.157, 3.756331, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1197, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 1049.307, 2917.777, 111.8643, 1.995565, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1198, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 991.9373, 2800.279, 115.6187, 4.526681, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1199, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1059.37, 2907.955, 111.5268, 3.687039, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1200, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1152.686, 2994.706, 121.2396, 2.565634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1201, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1155.005, 2995.682, 121.5243, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1202, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 995.3125, 3102.16, 135.0363, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1203, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1120.7, 3049.03, 125.568, 3.647738, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1204, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 1120.057, 3051.368, 125.7763, 3.979351, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1205, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1087.416, 2930.771, 111.5069, 4.112466, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1206, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 993.3316, 3109.008, 134.6379, 5.899213, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1207, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1030.289, 3020.45, 120.1156, 0.1604319, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1208, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 968.2549, 3021.06, 113.5949, 4.58016, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1209, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1097.828, 2991.785, 117.1716, 4.468088, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1210, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 1125.982, 3018.037, 121.5971, 2.787735, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1211, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1141.198, 2983.76, 119.0325, 2.390492, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1212, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 1131.94, 2918.849, 111.9336, 2.456817, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)) (possible waypoints or random movement)
(@CGUID+1213, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1060.645, 3062.321, 129.0868, 3.492366, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1214, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1132.963, 2930.301, 112.418, 0.9043533, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1215, 36383, 648, 0, 0, 1, '171', 0, 0, 0, 1211.94, 2990.87, 131.521, 5.440433, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1216, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1135.992, 3016.77, 123.517, 3.320224, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1217, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1128.091, 3026.311, 123.0374, 1.055162, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1218, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1147.245, 3046.135, 125.4291, 5.289829, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1219, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1137.441, 3076.087, 124.0421, 2.264909, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1220, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1029.556, 3080.646, 132.5013, 3.286147, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1221, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1096.534, 3089.285, 124.5097, 5.340604, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1222, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1055.965, 3094.738, 127.7776, 0.4780634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1223, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 975.3784, 3036.994, 114.9961, 4.139769, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1224, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 915.3227, 3062.929, 120.7456, 5.076759, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1225, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 916.2007, 3073.656, 120.9971, 4.630675, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1226, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 869.257, 2941.237, 101.2158, 4.694936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura)
(@CGUID+1227, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 876.1111, 2937.872, 102.3575, 5.166174, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura)
(@CGUID+1228, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 1154.773, 3060.914, 125.5057, 5.140634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1229, 36383, 648, 0, 0, 1, '171', 0, 0, 0, 1020.74, 3208.33, 137.74, 5.455359, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1230, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1081.58, 3130.633, 124.27, 0.9691268, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1231, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 1179.271, 3010.428, 121.8475, 5.365797, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1232, 36591, 648, 0, 0, 1, '171', 0, 0, 0, 1072.286, 3151.202, 122.0254, 0.3896543, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1233, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1070.761, 3171.989, 120.9075, 1.380107, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1234, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 1003.456, 3178.67, 121.5078, 0.4064299, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1235, 35904, 648, 0, 0, 1, '171', 0, 0, 0, 973.3156, 3157.974, 124.7386, 2.035755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1236, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 989.7, 3135.607, 129.576, 4.140641, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1237, 4075, 648, 0, 0, 1, '171', 0, 0, 0, 962.7526, 3189.551, 111.5422, 4.643029, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1238, 36383, 648, 0, 0, 1, '171', 0, 0, 0, 943.372, 3306.53, 52.7936, 3.798541, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jumping Monkey (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1239, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 957.2691, 2977.753, 111.6354, 3.425544, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura)
(@CGUID+1240, 36092, 648, 0, 0, 1, '171', 0, 0, 0, 954.1858, 2978.632, 111.3005, 5.303828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Assassin (Area: -Unknown- - Difficulty: 1) (Auras: 68322 - Infrared = Infradead: SI:7 Assassin Aura)
(@CGUID+1241, 36112, 648, 0, 0, 1, '171', 0, 0, 0, 1079.87, 3241.813, 80.83971, 2.600541, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Scout Brax (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1242, 6827, 648, 0, 0, 1, '171', 0, 0, 0, 1048.518, 3319.45, -10.81479, 1.897795, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1) (Auras: 76367 - Infrared = Infradead: Heat Signature Aura - Beast (50%))
(@CGUID+1243, 36735, 648, 0, 0, 1, '172', 0, 0, 0, 796.1303, 2985.939, 94.29347, 2.513274, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Matriarch (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1244, 36591, 648, 0, 0, 1, '172', 0, 0, 0, 1063.318, 3155.064, 123.4345, 3.540589, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1245, 36591, 648, 0, 0, 1, '172', 0, 0, 0, 1073.653, 3167.014, 121.5044, 3.502878, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1246, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1048.096, 3318.628, -10.51384, 5.243767, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1247, 36127, 648, 0, 0, 1, '172', 0, 0, 0, 849.0469, 3334.667, 6.911458, 0.6632251, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Gyrochoppa (Area: -Unknown- - Difficulty: 1)
(@CGUID+1248, 4075, 648, 0, 0, 1, '172', 0, 0, 0, 1009.612, 3179.191, 121.2101, 5.237229, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1249, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1027.296, 3327.088, -6.867955, 0.8420457, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Strand Crab (Area: -Unknown- - Difficulty: 1)

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+1250, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1054.925, 3340.513, -15.98355, 1.883588, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1251, 36104, 648, 0, 0, 1, '172', 0, 0, 0, 946.9601, 3267.195, 18.89186, 3.647738, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Battlesworn (Area: -Unknown- - Difficulty: 1)
(@CGUID+1252, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 953.2188, 3327.648, 2.351257, 3.804818, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1253, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 942.9305, 3276.771, 16.94437, 6.085902, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1254, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 944.8802, 3266.033, 19.01669, 0.541052, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1255, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 943.1927, 3268.646, 18.03132, 0.2617994, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1256, 36591, 648, 0, 0, 1, '172', 0, 0, 0, 965.3336, 3258.043, 26.1355, 6.106951, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1257, 36115, 648, 0, 0, 1, '172', 0, 0, 0, 945.7257, 3271.531, 17.82581, 3.176499, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Aggra (Area: -Unknown- - Difficulty: 1)
(@CGUID+1258, 36117, 648, 0, 0, 1, '172', 0, 0, 0, 945.9636, 3274.339, 17.59387, 3.054326, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Kilag Gorefang (Area: -Unknown- - Difficulty: 1)
(@CGUID+1259, 36578, 648, 0, 0, 1, '172', 0, 0, 0, 946.0781, 3276.142, 17.46031, 3.263766, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bastia (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1260, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 943.2656, 3278.93, 16.75759, 5.77704, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1261, 36464, 648, 0, 0, 1, '172', 0, 0, 0, 947.5486, 3280.712, 16.88955, 2.775074, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Chawg (Area: -Unknown- - Difficulty: 1)
(@CGUID+1262, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 943.3663, 3310.818, 6.816118, 0.7715869, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1263, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 942.9149, 3271.601, 17.54807, 6.230825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1264, 36104, 648, 0, 0, 1, '172', 0, 0, 0, 946.2257, 3269.621, 18.22363, 3.281219, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Battlesworn (Area: -Unknown- - Difficulty: 1)
(@CGUID+1265, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 981.6979, 3318.638, 3.121101, 5.406502, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1266, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 944.1788, 3282.038, 16.31883, 6.038839, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1267, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1015.942, 3347.047, -8.02524, 1.884618, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1268, 36104, 648, 0, 0, 1, '172', 0, 0, 0, 946.3055, 3277.942, 17.33746, 2.740167, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Battlesworn (Area: -Unknown- - Difficulty: 1)
(@CGUID+1269, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 942.408, 3274.47, 17.12598, 6.213372, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1270, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 991.9459, 3341.409, -3.945457, 0.9609036, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1271, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 936.6294, 3334.218, 2.550352, 2.009547, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1272, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 915.1702, 3265.251, 14.54139, 0.06981317, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1273, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 915.2101, 3292.09, 12.04133, 5.77704, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1274, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 890.4271, 3271.21, 13.67151, 0.2617994, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1275, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 914.8906, 3327.15, 8.455675, 4.625123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1276, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 888.4739, 3296.269, 11.78757, 0.05235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1277, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 915.2935, 3350.752, 3.575674, 6.071615, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1278, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 955.5313, 3378.686, -4.678363, 2.11842, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1279, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 871.0452, 3313.506, 10.66996, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1280, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 985.8291, 3384.174, -10.70402, 2.77505, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1281, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1018.14, 3382.331, -13.58334, 0.05371173, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1282, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 914.9273, 3383.966, -0.9660716, 2.759233, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1283, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 949.9255, 3413.107, -8.174481, 2.24416, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1284, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 869.7552, 3337.362, 7.864882, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1285, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 851.4271, 3296.82, 12.03354, 6.108652, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1286, 36129, 648, 0, 0, 1, '172', 0, 0, 0, 850.9132, 3334.143, 7.055555, 3.001966, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Gyrochoppa Pilot (Area: -Unknown- - Difficulty: 1)
(@CGUID+1287, 36719, 648, 0, 0, 1, '172', 0, 0, 0, 804.5958, 3146.572, 30.2966, 2.140695, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Pterrordax Scavenger (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1288, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 850.2379, 3352.002, 5.556112, 5.72468, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1289, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 822.3021, 3322.117, 9.090351, 3.228859, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1290, 36591, 648, 0, 0, 1, '172', 0, 0, 0, 957.0442, 3175.837, 118.9569, 3.953453, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1291, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 876.9107, 3390.548, 3.26859, 5.277096, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1292, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 802.559, 3349.963, 3.733641, 3.085877, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1293, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 840.1274, 3392.425, 3.812135, 0.4154481, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1294, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 816.3912, 3383.229, 2.894866, 4.238163, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1295, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 878.2446, 3412, -1.876874, 0.4369017, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1296, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 786.0222, 3354.995, 1.788522, 0.03810471, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1297, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 786.2083, 3375.773, -1.071092, 5.199187, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1298, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 819.9656, 3402.613, 0.5024633, 5.032287, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1299, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 800.6031, 3405.126, -2.981641, 0.8392879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1300, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 798.9113, 3393.807, -1.821772, 5.686784, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1301, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 855.3839, 3424.067, -3.15501, 4.038411, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1302, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 799.459, 3413.596, -5.038274, 5.86278, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1303, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 792.8616, 3410.877, -5.471868, 5.226267, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1304, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 783.8662, 3412.896, -6.991643, 3.566194, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1305, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 756.3056, 3356.128, -0.7610052, 3.968886, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1306, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 765.1445, 3381.652, -2.154722, 6.162882, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1307, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 790.9017, 3409.447, -5.444524, 4.505108, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1308, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 787.5668, 3413.689, -6.782659, 2.614559, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1309, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 799.9934, 3425.404, -7.896698, 6.08557, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1310, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 751.6039, 3318.553, 1.538353, 2.431879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1311, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 779.478, 3416.523, -8.259907, 2.685372, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1312, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 783.6217, 3417.843, -7.957952, 2.044492, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1313, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 779.6891, 3421.565, -8.94843, 0.1556939, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1314, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 777.2676, 3422.719, -9.406583, 5.796388, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1315, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 770.5315, 3417.184, -9.052174, 0.2070571, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1316, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 782.6572, 3431.59, -10.72944, 1.41592, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1317, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 784.2493, 3432.331, -10.59015, 1.953116, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1318, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 726.7824, 3368.165, -1.124786, 0.9911109, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1319, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 918.7325, 3418.099, -6.680743, 3.79199, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1320, 36129, 648, 0, 0, 1, '172', 0, 0, 0, 850.9132, 3334.143, 7.055555, 3.001966, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Gyrochoppa Pilot (Area: -Unknown- - Difficulty: 1)
(@CGUID+1321, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 871.0452, 3313.506, 10.66996, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1322, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 869.7552, 3337.362, 7.864882, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1323, 36103, 648, 0, 0, 1, '172', 0, 0, 0, 914.8906, 3327.15, 8.455675, 4.625123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1)
(@CGUID+1324, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 766.3641, 3434.012, -13.05934, 0.6356887, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1325, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 775.0668, 3440.433, -13.4861, 1.055329, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1326, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 714.429, 3317.042, 2.142388, 3.167954, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1327, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 708.3669, 3383.625, -16.08866, 3.239415, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1328, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 710.5297, 3285.203, 4.371651, 2.540864, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1329, 34763, 648, 0, 0, 1, '172', 0, 0, 0, 660.0928, 3414.219, -1.31145, 2.951946, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Daggertooth Shark (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1330, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1001.865, 3539.287, 3.601492, 5.313118, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1331, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1000.186, 3533.109, 0.5025043, 5.131177, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1332, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 993.2773, 3526.261, -3.478235, 3.449138, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1333, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 999.1278, 3531.652, -0.7023563, 5.302795, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1334, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1003.351, 3541.568, 3.829641, 4.179572, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1335, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 999.4631, 3545.91, 3.515373, 2.065626, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1336, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 996.7477, 3546.77, 1.903069, 1.223856, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1337, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1003.216, 3549.059, 1.074759, 4.925869, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1338, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 992.0297, 3549.019, -1.389575, 1.729214, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1339, 6827, 648, 0, 0, 1, '172', 0, 0, 0, 1014.429, 3542.803, -4.37446, 0.99004, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1340, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1056.29, 3787.475, 13.65458, 0.6129099, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1341, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1056.108, 3784.428, 14.37572, 4.546091, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1342, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1065.292, 3795.187, 2.618354, 0.6826998, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1343, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1064.046, 3784.842, 14.39703, 5.275958, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1344, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1061.941, 3787.388, 13.74609, 2.216329, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1345, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1065.583, 3810.63, 8.098783, 5.081312, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1346, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1048.462, 3801.662, 2.607886, 6.024683, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1347, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1052.259, 3796.253, 2.618652, 4.340199, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1348, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1059.57, 3797.309, 2.617048, 0.2304381, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1349, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1055.068, 3794.553, 2.618157, 5.502911, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1350, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1068.577, 3799.814, 2.619347, 4.704413, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1351, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1054.08, 3800.773, 2.618007, 4.835492, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1352, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1065.737, 3822.293, 8.580029, 5.07145, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1353, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1049.692, 3810.476, 8.05297, 2.408466, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1354, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1060.179, 3817.956, 8.493802, 5.185863, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1355, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1059.796, 3814.262, 8.350336, 2.372633, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1356, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1051.191, 3815.334, 8.301198, 3.851303, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1357, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1054.701, 3818.466, 8.486773, 1.933625, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1358, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1065.746, 3818.555, 8.425147, 1.963428, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1359, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1052.605, 3828.593, 12.72408, 3.815936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1360, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1062.785, 3828.334, 12.5196, 0.06136606, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1361, 36153, 648, 0, 0, 1, '172', 0, 0, 0, 1056.481, 3837.221, 14.88948, 4.677482, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Captain (Area: -Unknown- - Difficulty: 1)
(@CGUID+1362, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1061.38, 3834.568, 13.76379, 4.831773, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1363, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1058.758, 3833.198, 13.56278, 1.489266, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1364, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1050.64, 3820.595, 8.525235, 0.1606964, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1365, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 1055.933, 3841.174, 15.19482, 0.5459682, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1366, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 980.1436, 3830.823, 3.231109, 6.096507, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1367, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 988.491, 3846.255, 8.282882, 5.672927, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1368, 36621, 648, 0, 0, 1, '172', 0, 0, 0, 990.5695, 3848.936, 3.312686, 0.9424778, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Wizard (Area: -Unknown- - Difficulty: 1) (Auras: 54219 - Arcane Channeling)
(@CGUID+1369, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 981.7698, 3809.495, 3.231996, 3.900016, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1370, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 970.9891, 3817.969, 3.231639, 1.704428, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1371, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 991.2532, 3826.666, 8.986524, 0.615895, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1372, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 975.7695, 3826.294, 8.68951, 0.1340435, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1373, 36153, 648, 0, 0, 1, '172', 0, 0, 0, 993.2274, 3848.156, 15.50292, 4.223697, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Captain (Area: -Unknown- - Difficulty: 1)
(@CGUID+1374, 36145, 648, 0, 0, 1, '172', 0, 0, 0, 993.2761, 3852.146, 3.31015, 4.13643, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Thrall (Area: -Unknown- - Difficulty: 1)
(@CGUID+1375, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 934.5251, 3894.757, 9.216061, 1.043029, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1376, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 918.0425, 3883.397, 3.229957, 3.59938, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1377, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 923.8105, 3883.724, 3.231142, 2.573788, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1378, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 905.4958, 3877.033, 14.96563, 3.523566, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1379, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 910.563, 3878.282, 13.94732, 1.536528, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1380, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 930.0112, 3889.938, 8.668206, 0.8903279, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1381, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 913.6781, 3884.082, 3.228516, 2.145214, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1382, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 924.0565, 3891.419, 8.650358, 1.104659, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1383, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 935.3834, 3900.498, 9.210526, 1.890002, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1384, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 926.7276, 3898.456, 8.999887, 3.817851, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1385, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 929.0732, 3899.124, 9.061584, 3.928972, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1386, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 904.5575, 3882.405, 14.13763, 2.644656, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1387, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 921.5062, 3902.846, 8.889015, 5.870141, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1388, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 926.8023, 3902.863, 9.10511, 5.506358, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1389, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 937.1706, 3907.053, 13.20168, 0.9957106, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1390, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 906.5566, 3889.84, 3.230942, 4.723704, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1391, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 938.5469, 3908.955, 13.66223, 1.209723, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1392, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 910.9427, 3891.61, 3.230031, 3.553905, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1393, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 915.3596, 3899.78, 8.594442, 3.642681, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1394, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 933.569, 3916.371, 14.08261, 3.589908, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1395, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 925.8285, 3907.85, 9.172709, 0.6530439, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1396, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 940.9993, 3919.684, 15.63402, 3.153822, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1397, 36149, 648, 0, 0, 1, '172', 0, 0, 0, 929.501, 3913.9, 13.18951, 3.188521, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1398, 36153, 648, 0, 0, 1, '172', 0, 0, 0, 940.4827, 3916.509, 15.50146, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Captain (Area: -Unknown- - Difficulty: 1)
(@CGUID+1399, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 958.184, 3884.87, -1.710435, 0.8377581, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1400, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 974.4705, 3825.439, 8.755536, 2.548181, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1401, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 995.1428, 3847.04, 15.55143, 0.001580818, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1402, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1015.359, 3824.28, -1.443017, 1.308997, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1403, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1016.019, 3854.241, -1.471759, 0.418879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1404, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 949.6528, 3832.322, -1.468843, 4.13643, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1405, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1021.767, 3852.049, -1.427876, 1.029744, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1406, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 981.3594, 3834.728, 3.313507, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1407, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 946.1771, 3851.089, -1.410592, 5.8294, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1408, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 984.8512, 3847.434, 15.36672, 4.047015, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1409, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1025.542, 3857.66, 0.1083463, 4.171337, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1410, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1019.833, 3816.17, -1.481392, 1.413717, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1411, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1024.543, 3861.188, 0.6572233, 1.658063, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1412, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 987.4601, 3821.266, 8.832617, 5.550147, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1413, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 959.7309, 3827.416, -1.467587, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1414, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 996.8934, 3839.679, 13.76766, 4.500522, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1415, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 979.9739, 3862.615, 0.5226403, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1416, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 980.1614, 3864.579, 0.1081923, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1417, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1029.962, 3828.546, -1.439666, 1.710423, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1418, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 981.1979, 3806.905, 3.315529, 2.111848, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1419, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 991.8967, 3843.942, 14.17786, 3.648474, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1420, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1025.441, 3862.549, 0.3823463, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1421, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1026.747, 3859.877, 0.1151753, 3.490659, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1422, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1026.342, 3861.478, 0.6573643, 1.658063, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1423, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 974.2031, 3848.687, -1.675549, 1.204277, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1424, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 971.4774, 3814.438, 3.314756, 2.827433, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1425, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 973.8038, 3856.26, -1.478057, 0.9075712, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1426, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 976.5121, 3869.99, -1.384872, 5.8294, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1427, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1024.806, 3856.181, 0.5558074, 4.031711, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1428, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1033.655, 3845.24, -1.353271, 2.199115, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1429, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 987.3489, 3826.939, 9.074617, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1430, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 980.1163, 3866.836, 0.1297983, 2.530727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1431, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 992.2604, 3841.783, 13.91832, 3.717551, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1432, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 999.25, 3808.447, -1.463451, 4.764749, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1433, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 964.7813, 3857.563, -1.522506, 0.4712389, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1434, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 978.3108, 3863.721, 0.4998343, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1435, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1024.545, 3857.57, 0.1693163, 4.171337, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1436, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 982.6077, 3866.951, 0.6604383, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1437, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 994.1272, 3850.968, 15.661, 2.747251, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1438, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 995.1545, 3839.095, 3.312743, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1439, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1027.392, 3856.457, 0.5530463, 3.926991, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1440, 36621, 648, 0, 0, 1, '179', 0, 0, 0, 987.875, 3845.257, 3.313392, 3.996804, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Wizard (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1441, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 983.1528, 3828.785, 9.142763, 0.9250245, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1442, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 993.908, 3848.058, 15.50311, 1.064651, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1443, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 982.2691, 3865.592, 0.1342833, 3.473205, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1444, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 981.2639, 3867.841, 0.6638253, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1445, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 943.9063, 3848.542, -1.461489, 3.054326, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1446, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 964.9114, 3887.543, -1.774754, 1.029744, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1447, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 988.5677, 3848.056, 14.66783, 2.548181, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (Auras: 31261 - Permanent Feign Death (Root))
(@CGUID+1448, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 948.0938, 3816.478, -1.411769, 3.647738, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1449, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1009.858, 3826.502, 15.99268, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1450, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 990.3611, 3827.457, 16.34932, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1451, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 934.7882, 3862.277, -1.48799, 3.787364, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1452, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 970.7882, 3900.207, 0.4253453, 3.490659, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1453, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 975.4114, 3902.677, 0.6741033, 0.4014257, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1454, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 968.1401, 3800.593, 15.21732, 2.356154, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1455, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 942.0504, 3884.013, -1.495971, 0.5061455, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1456, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 972.1424, 3901.863, 0.1482183, 5.77704, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1457, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 962.8055, 3904.529, -1.729711, 5.8294, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1458, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 998.5746, 3793.931, -1.509667, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1459, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 969.3472, 3855.34, 19.50889, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1460, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 974.9841, 3800.005, 14.58807, 2.783314, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1461, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1031.257, 3810.295, -1.418446, 1.675516, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1462, 36161, 648, 0, 0, 1, '179', 0, 0, 0, 980.9236, 3823.163, 11.2704, 1.169371, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Thrall (Area: -Unknown- - Difficulty: 1)
(@CGUID+1463, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 951.4219, 3894.606, -1.424604, 0.296706, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1464, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 982.5434, 3831.676, 16.2098, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1465, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 975.9445, 3901.172, 0.6743243, 0.4537856, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1466, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1010.646, 3800.679, -1.45978, 4.118977, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1467, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 970.7634, 3798.141, 15.484, 3.247962, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1468, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 974.5035, 3900.276, 0.1475353, 2.583087, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1469, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 972.5139, 3899.781, 0.1519163, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1470, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 973.6198, 3902.55, 0.1474163, 4.310963, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1471, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 963.1215, 3896.185, -1.67874, 0.4712389, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1472, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 935.3785, 3814.06, -1.523552, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1473, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1051.618, 3812.925, 8.200948, 2.462335, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1474, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1001.783, 3783.982, 0.1664233, 5.899213, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1475, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1000.918, 3782.832, 0.1330303, 6.248279, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1476, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1014.417, 3820.848, -1.373403, 5.742133, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1477, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1029.168, 3797.243, -1.488747, 4.625123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1478, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 934.9149, 3810.747, 0.6272963, 1.291544, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1479, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1020.321, 3790.841, -1.515043, 4.852015, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1480, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1001.707, 3786.368, 0.4160583, 4.520403, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1481, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1030.045, 3825.857, 13.87382, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1482, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 921.8611, 3851.712, 0.1340993, 4.258604, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1483, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 934.7274, 3824.413, -1.362013, 4.607669, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1484, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 999.0035, 3781.962, 0.6546223, 4.276057, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1485, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 925.717, 3837.145, -1.459387, 1.884956, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1486, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1012.759, 3788.499, -1.475093, 3.455752, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1487, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1055.173, 3837.591, 14.80677, 0.4693504, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1488, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 936.0156, 3810.444, 0.1593053, 1.972222, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1489, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 999.2083, 3785.076, 0.1493173, 5.253441, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1490, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1053.36, 3830.669, 13.12504, 2.799432, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1491, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 957.816, 3871.21, 16.73363, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1492, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1031.455, 3877.449, -0.4938847, 4.956735, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1493, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1004.32, 3783.053, -1.498356, 2.897247, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1494, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 922.6979, 3853.232, 0.5307453, 4.39823, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1495, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 966.6893, 3892.894, -0.8896757, 2.722714, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1496, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1000.663, 3788.04, 0.1814473, 1.692969, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1497, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 912.9254, 3841.584, -0.9486226, 2.007129, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1498, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 944.6945, 3887.406, 16.28836, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1499, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 907.2137, 3882.016, 13.81063, 4.702049, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+1500, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 930.3177, 3808.585, 0.6819453, 3.455752, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1501, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 920.7483, 3848.461, 0.6850513, 4.171337, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1502, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1059.238, 3820.774, 31.15996, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1503, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1047.042, 3840.093, 8.920731, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1504, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1059.458, 3818.304, 8.523849, 2.170676, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1505, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1085.568, 3826.537, -1.442905, 0.5061455, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1506, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 919.4531, 3851.25, 0.1546893, 2.181662, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1507, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 932.1597, 3809.766, 0.1784283, 5.096361, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1508, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1061.377, 3799.676, 2.617289, 5.57275, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1509, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 933.8218, 3915.193, 13.95575, 2.382607, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1510, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 933.1215, 3807.191, 0.1610203, 1.832596, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1511, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1047.064, 3804.627, 14.39634, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1512, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1058.634, 3838.155, 24.97134, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1513, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1053.478, 3785.009, 14.18874, 2.81763, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1514, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 916.7066, 3853.728, -1.476934, 6.038839, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1515, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 938.4948, 3903.622, 18.4363, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1516, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 917.0598, 3877.916, 3.230799, 3.225089, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1517, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1064.382, 3786.349, 14.01762, 3.941453, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1518, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 934.3646, 3807.61, 0.1729343, 1.972222, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1519, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1060.188, 3830.472, 13.00227, 5.001889, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1520, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 937.4931, 3910.922, 13.82931, 5.614448, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1521, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 928.0302, 3886.581, 9.673878, 1.915614, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1522, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 921.5313, 3849.581, 0.1545583, 5.009095, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1523, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 908.7822, 3869.766, 17.28016, 3.77275, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1524, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1057.5, 3842.377, 16.44197, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1525, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1018.457, 3781.306, -1.525237, 0.4886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1526, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 916.3021, 3819.863, -1.463424, 3.926991, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1527, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1088.182, 3842.056, -1.549354, 2.094395, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1528, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 919.243, 3849.102, 0.6711223, 4.45059, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1529, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1022.472, 3774.523, -1.458378, 4.939282, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1530, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 907.4374, 3889.259, 3.230249, 3.160347, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1531, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 930.8195, 3806.871, 0.6874123, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1532, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 920.809, 3848.537, 0.6764473, 4.363323, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1533, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 947.9305, 3913.583, 10.99202, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1534, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1034.566, 3787.817, -1.496083, 4.45059, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1535, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 949.7743, 3873.986, 15.40505, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1536, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 938.1285, 3894.711, 17.42204, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1537, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1047.46, 3823.795, 25.84813, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1538, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 933.717, 3810.232, 0.1963793, 1.064651, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1539, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 918.9195, 3907.123, 8.873488, 5.364525, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1540, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1056.866, 3835.55, 31.46897, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1541, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 926.7604, 3885.062, 14.95902, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1542, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 937.1511, 3912.568, 14.16451, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1543, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1080.493, 3827.456, -1.502381, 0.5235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1544, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 940.4202, 3915.251, 15.41875, 2.830481, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1545, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1052.4, 3791.477, 2.618688, 2.169647, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1546, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 920.1146, 3852.828, 0.1651373, 2.827433, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1547, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 914.8281, 3900.275, 31.31354, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1548, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 921.7952, 3893.832, 33.73415, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1549, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 897.1719, 3872.114, 18.25871, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1550, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1060.186, 3781.715, 31.8958, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1551, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 944.4757, 3921.789, 20.78905, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1552, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1060.759, 3787.622, 37.84244, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1553, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1071.498, 3805.161, 2.479986, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1554, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1055.917, 3793.157, 20.84593, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1555, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1026.722, 3756.952, 0.5392963, 4.939282, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1556, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1067.668, 3808.131, 34.50257, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1557, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 929.2761, 3917.181, 11.58908, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1558, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 901.559, 3876.785, 32.11272, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1559, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 921.1875, 3892.872, 26.37986, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1560, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 922.8229, 3895.684, 51.45094, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1561, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1048.04, 3776.12, 5.31391, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1562, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 921.1059, 3895.331, 41.44111, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1563, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 906.3837, 3876.073, 26.98633, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1564, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 909.3976, 3862.575, 6.481741, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1565, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1057.446, 3809.521, 48.92661, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1566, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1083.234, 3809.425, 11.83482, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1567, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1059.377, 3778.3, 15.89305, 4.915751, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1) (possible waypoints or random movement)
(@CGUID+1568, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 935.5712, 3910.622, 44.03946, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1569, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 943.3177, 3916.802, 33.78036, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1570, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 933.8906, 3909.922, 34.83119, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1) (Auras: 42345 - Cosmetic - Flame Patch)
(@CGUID+1571, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1024.286, 3756.387, 0.5696403, 4.904375, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1572, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1068.085, 3773.399, 14.67654, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1573, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 878.9844, 3800.554, -0.9920446, 2.024582, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1574, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 880.8698, 3847.281, 8.178994, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1575, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 902.8368, 3907, 3.436689, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1576, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1062.691, 3776.372, 18.01016, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1577, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 1062.91, 3750.101, 7.271567, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1578, 36177, 648, 0, 0, 1, '179', 0, 0, 0, 893.1754, 3879.901, 7.050794, 2.146755, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) (Area: -Unknown- - Difficulty: 1)
(@CGUID+1579, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1027.083, 3753.648, 0.1201183, 4.520403, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1580, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1024.505, 3754.688, 0.1628683, 5.445427, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1581, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1026.859, 3755.174, 0.1344213, 4.799655, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1582, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1027.351, 3751.74, 0.6696473, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1583, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1024.979, 3753.229, 0.1331873, 5.445427, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1584, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1026.533, 3750.62, 0.3658283, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1585, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1025.455, 3751.448, 0.6649223, 4.991642, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1586, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1097.227, 3786.398, -1.566349, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1587, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1097.082, 3778.974, 0.3908073, 5.323254, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1588, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1106.679, 3825.759, -1.491598, 1.937315, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1589, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1103.931, 3835.315, 0.1365553, 2.181662, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1590, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1101.49, 3832.926, 0.5540693, 3.892084, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1591, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1100.799, 3835.653, 0.1593023, 6.091199, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1592, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1102.559, 3833.93, 0.1547853, 1.500983, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1593, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1096.056, 3815.735, -1.467176, 1.64061, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1594, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1092.064, 3798.974, -1.371042, 2.059489, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1595, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1102.302, 3837.117, 0.1377543, 4.921828, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1596, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1108.335, 3812.296, -1.520112, 0.4537856, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1597, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1099.95, 3834.303, 0.4967173, 0.8203048, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1598, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1096.111, 3778.025, 0.5656113, 5.462881, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1599, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1103.656, 3837.846, 0.6608113, 0.418879, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1600, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1095.8, 3841.973, -1.508646, 5.77704, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1601, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1105.108, 3838.123, 0.3871363, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1602, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1097.247, 3780.359, 0.1767893, 1.605703, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1603, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1081.005, 3800.685, -1.406347, 2.234021, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1604, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1104.849, 3836.665, 0.6606653, 0.8901179, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1605, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1098.398, 3776.988, 0.1151963, 5.51524, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1606, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1099.582, 3774.273, 0.6733513, 5.445427, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1607, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1100.892, 3775.37, 0.6727493, 4.974188, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1608, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1100.092, 3776.734, 0.1301843, 3.874631, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1609, 36176, 648, 0, 0, 1, '179', 0, 0, 0, 1098.851, 3775.744, 0.1059823, 5.410521, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Alliance Sailor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1610, 24110, 648, 0, 0, 1, '179', 0, 0, 0, 919.955, 3548.45, -22.59237, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny Large (Area: -Unknown- - Difficulty: 1)
(@CGUID+1611, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 994.6107, 3548.403, 0.31533, 5.543399, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1612, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 989.1466, 3543.342, -2.856087, 1.813406, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1613, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 1003.938, 3551.163, -0.5402906, 1.319187, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1614, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 1004.997, 3544.402, 2.56365, 0.0860614, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1615, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 1005.34, 3540.097, 2.659677, 2.134156, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1616, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 995.8411, 3542.491, 1.93029, 2.017585, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1617, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 1010.578, 3547.694, -2.02656, 2.157445, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1618, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 1005.277, 3545.852, 2.090544, 2.214102, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1619, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 1004.532, 3529.38, -4.220152, 1.354691, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1620, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 995.9504, 3529.761, -1.991541, 4.066935, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1621, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 856.2983, 3543.336, -14.84143, 1.259234, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1622, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 864.2928, 3535.997, -16.76428, 2.252402, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1623, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 853.3555, 3523.426, -13.81824, 0.3415133, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1624, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 845.8711, 3538.745, -7.302126, 4.742746, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1625, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 849.1577, 3543.71, -7.64869, 1.950033, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1626, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 869.6868, 3515.315, -17.242, 5.814811, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1627, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 870.0834, 3516.005, -17.05951, 5.255153, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1628, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 861.8123, 3524.115, -11.09258, 0.5134533, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1629, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 844.1207, 3547.27, -5.986818, 3.803144, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1630, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 840.3123, 3547.24, -6.28003, 0.9070626, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1631, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 856.937, 3517.97, -15.56373, 6.240201, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1632, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 842.3834, 3537.45, -7.760744, 3.277825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1633, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 846.8812, 3519.455, -14.23687, 4.551574, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1634, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 833.441, 3531.967, -13.71167, 1.747505, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1635, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 859.3881, 3510.653, -17.86377, 3.296561, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1636, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 848.1583, 3520.771, -14.13806, 2.939983, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1637, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 860.7841, 3428.963, -5.138074, 6.27342, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1638, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 910.2813, 3424.756, -6.385943, 3.68352, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1639, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 865.6714, 3412.543, -0.7157536, 2.81859, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1640, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 942.3392, 3402.98, -7.416852, 4.630302, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1641, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 912.9257, 3385.632, -0.8074704, 2.533268, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1642, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 959.395, 3375.187, -4.450702, 3.218814, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1643, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 867.4456, 3386.271, 4.366522, 1.362294, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1644, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 982.3465, 3380.777, -10.00358, 6.099577, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1645, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 909.1371, 3325.039, 9.389835, 4.625123, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1646, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 945.1821, 3345.189, 1.704557, 2.184546, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1647, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 908.5891, 3349.479, 4.856859, 6.138111, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1648, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 849.9279, 3378.277, 5.462892, 4.718248, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1649, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 817.0037, 3410.904, -1.349009, 5.327756, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1650, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 817.868, 3386.081, 2.864506, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1651, 36354, 648, 0, 0, 1, '179', 0, 0, 0, 850.9132, 3334.143, 7.055555, 3.001966, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Gyrochoppa Pilot (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1652, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 877.3055, 3328.664, 9.646296, 5.986479, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1653, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 952.9913, 3328.627, 2.257491, 5.166174, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1654, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 989.6443, 3343.593, -4.179587, 1.610853, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1655, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 872.8438, 3315.447, 10.44271, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1656, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 972.7783, 3327.709, 2.569953, 4.785715, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1657, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 940.4524, 3306.152, 8.970293, 4.486915, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1658, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 913.8924, 3293.89, 11.81429, 5.166174, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1659, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 885.8768, 3292.365, 12.31326, 0.05235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1660, 6827, 648, 0, 0, 1, '179', 0, 0, 0, 813.0195, 3356.875, 3.989134, 3.624889, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Strand Crab (Area: -Unknown- - Difficulty: 1)
(@CGUID+1661, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 938.9114, 3287.893, 14.45139, 0.05235988, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1662, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 889.3195, 3273.171, 13.56076, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1663, 36735, 648, 0, 0, 1, '179', 0, 0, 0, 793.186, 2982.108, 93.64521, 4.05717, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Teraptor Matriarch (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1664, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 944.4722, 3260.509, 20.92394, 0.1570796, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1665, 36348, 648, 0, 0, 1, '179', 0, 0, 0, 920.9896, 3262.946, 15.33709, 5.497787, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- SI:7 Operative (Area: -Unknown- - Difficulty: 1) (Auras: 29266 - Permanent Feign Death)
(@CGUID+1666, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 965.9594, 3263.475, 24.80126, 1.487655, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1667, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 960.9467, 3182.804, 115.0033, 4.331339, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1668, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 974.2189, 3155.516, 125.916, 2.155278, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1669, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1006.582, 3179.029, 121.3137, 0.4173318, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1670, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 991.7251, 3138.103, 128.9917, 3.998889, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1671, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1066.832, 3155.735, 122.5287, 1.58471, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1672, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 1050.751, 3092.694, 128.6486, 0.812344, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1673, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1071.275, 3134.57, 124.7361, 1.896642, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1674, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 1016.667, 3084.375, 134.2979, 0.7529286, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1675, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1076.329, 3181.898, 120.1036, 2.114901, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1676, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 1067.147, 3068.773, 127.4693, 5.482595, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1677, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 972.7902, 3034.381, 114.9961, 3.660562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1678, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1101.932, 3091.582, 123.472, 2.559816, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1679, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 969.0642, 3028.262, 114.5378, 4.517492, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1680, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1030.69, 3015.021, 118.8635, 4.327892, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1681, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 911.7018, 3071.753, 120.0305, 4.176158, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1682, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 993.3281, 2978.983, 111.2812, 3.994019, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1683, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 912.6359, 3060.477, 119.983, 4.351104, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1684, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 968.9753, 2989.233, 111.0268, 1.055162, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1685, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 955.2239, 2988.834, 111.6459, 2.576886, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1686, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 912.6109, 3026.332, 113.5518, 5.378742, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1687, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 906.0316, 3016.36, 113.1019, 3.036869, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1688, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 910.1373, 2990.295, 109.3988, 4.46078, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1689, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 912.3883, 2950.262, 105.7185, 6.004081, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1690, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 873.0276, 2994.059, 107.2871, 1.400255, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1691, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 1019.831, 2927.007, 111.8475, 0.9177215, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1692, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 907.783, 2930.56, 103.3596, 5.831243, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1693, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 985.8078, 2912.348, 110.9549, 4.041155, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1694, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 971.2043, 2910.099, 110.4107, 2.204333, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1695, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 884.8448, 2916.381, 102.374, 3.604866, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1696, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 865.1355, 2906.485, 101.1738, 1.435446, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1697, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 848.2852, 2943.791, 100.3936, 1.313025, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1698, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 851.9922, 2888.846, 99.82616, 4.712389, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1699, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 969.1758, 2860.397, 115.4474, 4.499864, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1700, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 823.1051, 2976.42, 99.50072, 0.5554937, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1701, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 822.7564, 2970.04, 99.25155, 3.853077, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1702, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 816.8438, 2883.502, 102.7736, 2.426939, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1703, 36682, 648, 0, 0, 1, '179', 0, 0, 0, 862.8036, 2538.339, -9.360349, 2.774936, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- The Hammer (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1704, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 808.5258, 2875.082, 104.6865, 0.8365293, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1705, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 965.1309, 2847.546, 117.1975, 0.9814391, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1706, 36423, 648, 0, 0, 1, '179', 0, 0, 0, 858.2882, 2793.348, 113.7277, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Battlesworn (Area: -Unknown- - Difficulty: 1)
(@CGUID+1707, 36422, 648, 0, 0, 1, '179', 0, 0, 0, 868.6042, 2791.115, 115.5013, 2.321288, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1)
(@CGUID+1708, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 834.3022, 2811.247, 107.6116, 2.012613, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1709, 36422, 648, 0, 0, 1, '179', 0, 0, 0, 874.7969, 2794.805, 115.2021, 1.658063, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1)
(@CGUID+1710, 36465, 648, 0, 0, 1, '179', 0, 0, 0, 860.3108, 2762.559, 117.1458, 1.64061, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Chawg (Area: -Unknown- - Difficulty: 1)
(@CGUID+1711, 36424, 648, 0, 0, 1, '179', 0, 0, 0, 878.5452, 2761.006, 120.1594, 2.111848, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Scout Brax (Area: -Unknown- - Difficulty: 1)
(@CGUID+1712, 36615, 648, 0, 0, 1, '179', 0, 0, 0, 848.6858, 2770.775, 113.709, 4.904375, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Doc Zapnozzle (Area: -Unknown- - Difficulty: 1)
(@CGUID+1713, 36418, 648, 0, 0, 1, '179', 0, 0, 0, 869.7049, 2760.263, 119.2278, 1.047198, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Aggra (Area: -Unknown- - Difficulty: 1)
(@CGUID+1714, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 849.4549, 2767.307, 114.5135, 4.834562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1715, 36188, 648, 0, 0, 1, '179', 0, 0, 0, 872.7222, 2761.36, 119.2843, 1.692969, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Thrall (Area: -Unknown- - Difficulty: 1)
(@CGUID+1716, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 948.9764, 2786.599, 116.359, 5.170794, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1717, 36423, 648, 0, 0, 1, '179', 0, 0, 0, 841.2518, 2780.699, 110.7478, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Battlesworn (Area: -Unknown- - Difficulty: 1)
(@CGUID+1718, 36466, 648, 0, 0, 1, '179', 0, 0, 0, 849.8281, 2765.263, 114.9384, 4.886922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Brett "Coins" McQuid (Area: -Unknown- - Difficulty: 1)
(@CGUID+1719, 38432, 648, 0, 0, 1, '179', 0, 0, 0, 847.9097, 2773.873, 112.922, 4.939282, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Megs Dreadshredder (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1720, 36578, 648, 0, 0, 1, '179', 0, 0, 0, 897.1315, 2767.088, 117.6136, 0.2352859, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Bastia (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1721, 36421, 648, 0, 0, 1, '179', 0, 0, 0, 881.066, 2764.709, 119.791, 2.565634, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1722, 36423, 648, 0, 0, 1, '179', 0, 0, 0, 887.0886, 2762.431, 120.4686, 6.038839, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Battlesworn (Area: -Unknown- - Difficulty: 1)
(@CGUID+1723, 36520, 648, 0, 0, 1, '179', 0, 0, 0, 849.0903, 2769.031, 114.114, 4.834562, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Fizz Lighter (Area: -Unknown- - Difficulty: 1)
(@CGUID+1724, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 847.4254, 2775.453, 112.538, 5.061455, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1725, 36417, 648, 0, 0, 1, '179', 0, 0, 0, 876.0746, 2761.739, 119.812, 2.268928, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Kilag Gorefang (Area: -Unknown- - Difficulty: 1)
(@CGUID+1726, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 848.3316, 2772.228, 113.3291, 4.974188, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1727, 36421, 648, 0, 0, 1, '179', 0, 0, 0, 865.0521, 2761.531, 118.1538, 5.410521, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1728, 36422, 648, 0, 0, 1, '179', 0, 0, 0, 867.941, 2769.221, 117.6708, 2.164208, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Scout (Area: -Unknown- - Difficulty: 1)
(@CGUID+1729, 36523, 648, 0, 0, 1, '179', 0, 0, 0, 858.4114, 2752.458, 118.9498, 5.393067, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Sister Goldskimmer (Area: -Unknown- - Difficulty: 1)
(@CGUID+1730, 36467, 648, 0, 0, 1, '179', 0, 0, 0, 849.9514, 2763.392, 115.266, 1.658063, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Sally "Salvager" Sandscrew (Area: -Unknown- - Difficulty: 1)
(@CGUID+1731, 36429, 648, 0, 0, 1, '179', 0, 0, 0, 853.092, 2757.796, 116.571, 5.480334, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Izzy (Area: -Unknown- - Difficulty: 1)
(@CGUID+1732, 36469, 648, 0, 0, 1, '179', 0, 0, 0, 860.0261, 2752.453, 119.2701, 5.72468, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Chip Endale (Area: -Unknown- - Difficulty: 1)
(@CGUID+1733, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 852.0504, 2758.814, 116.2278, 5.480334, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1734, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 881.5208, 2744.628, 125.4708, 4.991642, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1735, 36468, 648, 0, 0, 1, '179', 0, 0, 0, 859.9358, 2751.652, 119.4121, 5.8294, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Candy Cane (Area: -Unknown- - Difficulty: 1)
(@CGUID+1736, 38738, 648, 0, 0, 1, '179', 0, 0, 0, 850.4114, 2761.423, 115.6347, 5.358161, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Coach Crosscheck (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1737, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 859.8542, 2760.045, 118.66, 0.7504916, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1738, 36519, 648, 0, 0, 1, '179', 0, 0, 0, 860.0399, 2750.586, 119.6279, 6.038839, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Evol Fingers (Area: -Unknown- - Difficulty: 1)
(@CGUID+1739, 23837, 648, 0, 0, 1, '179', 0, 0, 0, 876.1979, 2747.082, 123.6021, 1.919862, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- ELM General Purpose Bunny (Area: -Unknown- - Difficulty: 1)
(@CGUID+1740, 36521, 648, 0, 0, 1, '179', 0, 0, 0, 854.8594, 2756.054, 117.4102, 5.550147, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Maxx Avalanche (Area: -Unknown- - Difficulty: 1) (Auras: 12550 - Lightning Shield)
(@CGUID+1741, 36421, 648, 0, 0, 1, '179', 0, 0, 0, 866.533, 2759.769, 118.833, 2.321288, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Orc Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1742, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 866.6406, 2753.577, 120.3283, 1.954769, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1743, 36501, 648, 0, 0, 1, '179', 0, 0, 0, 851.1163, 2760.077, 115.9117, 5.550147, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Grimy Greasefingers (Area: -Unknown- - Difficulty: 1)
(@CGUID+1744, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 852.6649, 2749.105, 118.8705, 4.904375, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1745, 36425, 648, 0, 0, 1, '179', 0, 0, 0, 848.4879, 2756.918, 116.6279, 0.7853982, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Sassy Hardwrench (Area: -Unknown- - Difficulty: 1)
(@CGUID+1746, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 919.5628, 2763.034, 115.0475, 5.829149, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1747, 36524, 648, 0, 0, 1, '179', 0, 0, 0, 857.1111, 2753.938, 118.4167, 2.356194, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Slinky Sharpshiv (Area: -Unknown- - Difficulty: 1)
(@CGUID+1748, 36428, 648, 0, 0, 1, '179', 0, 0, 0, 853.8021, 2757.071, 116.865, 2.356194, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ace (Area: -Unknown- - Difficulty: 1)
(@CGUID+1749, 36518, 648, 0, 0, 1, '179', 0, 0, 0, 856.2205, 2754.8, 118.0556, 5.532694, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481); -- Bamm Megabomb (Area: -Unknown- - Difficulty: 1)

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+1750, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 848.2239, 2737.22, 123.7176, 3.193953, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1751, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 857.8524, 2745.276, 120.2896, 3.211406, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1752, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 850.1493, 2747.433, 118.9649, 0.3665192, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1753, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 831.0273, 2753.283, 115.1996, 0.232657, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1754, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 942.3867, 2757.25, 112.5376, 3.147169, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1755, 36463, 648, 0, 0, 1, '179', 0, 0, 0, 850.9688, 2738.833, 123.9192, 1.500983, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Gobber (Area: -Unknown- - Difficulty: 1)
(@CGUID+1756, 36525, 648, 0, 0, 1, '179', 0, 0, 0, 848.9011, 2736.947, 123.7235, 1.58825, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Warrior-Matic NX-01 (Area: -Unknown- - Difficulty: 1)
(@CGUID+1757, 36600, 648, 0, 0, 1, '179', 0, 0, 0, 871.9618, 2740.74, 123.2754, 0.7679449, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Geargrinder Gizmo (Area: -Unknown- - Difficulty: 1) (Auras: 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%))
(@CGUID+1758, 36426, 648, 0, 0, 1, '179', 0, 0, 0, 884.7986, 2743.537, 123.3148, 3.525565, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Goblin Survivor (Area: -Unknown- - Difficulty: 1)
(@CGUID+1759, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 784.0847, 2786.431, 111.7745, 3.069241, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1760, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 787.6835, 2700.786, 112.9442, 3.655046, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1761, 36591, 648, 0, 0, 1, '179', 0, 0, 0, 774.3301, 2706.299, 115.987, 4.181854, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Frog (Area: -Unknown- - Difficulty: 1)
(@CGUID+1762, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 769.8539, 2736.41, 116.5224, 1.132411, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1763, 4075, 648, 0, 0, 1, '179', 0, 0, 0, 764.3073, 2746.945, 115.359, 0.8233895, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Rat (Area: -Unknown- - Difficulty: 1)
(@CGUID+1764, 35904, 648, 0, 0, 1, '179', 0, 0, 0, 768.5515, 2786.201, 111.5851, 5.902135, 120, 10, 0, 0, 0, 1, 0, 0, 0, 27481), -- Jungle Cat (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast) (possible waypoints or random movement)
(@CGUID+1765, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 931.5735, 2635.858, -1.596904, 5.366032, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1766, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 934.135, 2592.949, -1.661487, 1.381513, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1767, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 983.6096, 2640.654, -1.361055, 4.678347, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1768, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 849.7875, 2580.089, -1.496682, 4.051532, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1769, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 983.2892, 2601.044, -1.316121, 1.419329, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1770, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 867.0839, 2533.823, -1.455142, 0.8341101, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1771, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 931.0376, 2517.683, -1.370185, 2.913203, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1772, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 971.6666, 2534.454, -1.383903, 3.332171, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1773, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 914.3967, 2454.832, -1.682907, 1.381971, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1774, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 980.9063, 2474.755, -1.489437, 1.853616, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481), -- Ravenous Lurker (Area: -Unknown- - Difficulty: 1) (Auras: 76354 - Infrared = Infradead: Heat Signature Aura - Beast)
(@CGUID+1775, 36681, 648, 0, 0, 1, '179', 0, 0, 0, 855.8264, 2461.883, -1.429014, 5.601965, 120, 0, 0, 0, 0, 0, 0, 0, 0, 27481);

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+1775;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+0, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+2, 0, 0, 0, 1, 0, 0, 0, 0, '73558'), -- Lost Isles Mail Bird - 73558 - Lost Isles Mail Bird: Mail Bag - Hold
(@CGUID+3, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+4, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+5, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+6, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+7, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+8, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+9, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+10, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+11, 0, 0, 0, 1, 0, 0, 0, 0, '68327 91298'), -- Geargrinder Gizmo - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), 91298 - Cosmetic - Sit (Lower/Upper Body - High/Low Priority) (Anim Kit)
(@CGUID+12, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+13, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+14, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+15, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+16, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+17, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Matriarch - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+18, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+19, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+20, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+21, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+22, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+23, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+24, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+25, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+26, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+27, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+28, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+29, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+30, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+31, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+32, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+33, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+34, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+35, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+36, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+37, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+38, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+39, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+40, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+41, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+42, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+43, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+44, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+45, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+46, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+47, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+48, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+49, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Ancient Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+50, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+51, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+52, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+53, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+54, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+55, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+56, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+57, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+58, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+59, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+60, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+61, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+62, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+63, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+64, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+65, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+66, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+67, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+68, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+69, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+70, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+71, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+72, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+73, 0, 0, 0, 1, 0, 0, 0, 0, '76367'), -- Crab - 76367 - Infrared = Infradead: Heat Signature Aura - Beast (50%)
(@CGUID+74, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+75, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+76, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- Izzy - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+77, 0, 0, 0, 1, 0, 0, 0, 0, '76356'), -- Gobber - 76356 - Infrared = Infradead: Heat Signature Aura - Humanoid (120%)
(@CGUID+78, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+79, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- Ace - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+80, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+81, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny (scale x0.01)
(@CGUID+82, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+83, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Beastblast Babblesnaff
(@CGUID+84, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Doc Zapnozzle - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+85, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+86, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Sally "Salvager" Sandscrew - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+87, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+88, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Brett "Coins" McQuid - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+89, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+90, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Warrior-Matic NX-01
(@CGUID+91, 0, 0, 0, 1, 0, 0, 0, 0, '68327 80264'), -- Slinky Sharpshiv - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), 80264 - Stealth
(@CGUID+92, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Megs Dreadshredder - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+93, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+94, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Grimy Greasefingers - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+95, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+96, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+97, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Sassy Hardwrench - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+98, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Evol Fingers - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+99, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+100, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+101, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- Goblin Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+102, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+103, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+104, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+105, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+106, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+107, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- Ancient Island Turtle - 76371 - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(@CGUID+108, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+109, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+110, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+111, 0, 0, 0, 2, 0, 0, 0, 0, '68327'), -- Bamm Megabomb - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+112, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Coach Crosscheck - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+113, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Sister Goldskimmer - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+114, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+115, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+116, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Fizz Lighter - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+117, 0, 0, 0, 1, 0, 0, 0, 0, '68327 78273'), -- Maxx Avalanche - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), 78273 - Flametongue Weapon
(@CGUID+118, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+119, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+120, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+121, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+122, 0, 0, 65536, 1, 0, 0, 0, 0, '68327'), -- Trade Prince Gallywix - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+123, 0, 0, 65536, 1, 0, 0, 0, 0, '68327'), -- Chip Endale - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+124, 0, 0, 65541, 1, 0, 0, 0, 0, '68327'), -- Candy Cane - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+125, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+126, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+127, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+128, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+129, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+130, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+131, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+132, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+133, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+134, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+135, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+136, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+137, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+138, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+139, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+140, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+141, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+142, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+143, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+144, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+145, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+146, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+147, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+148, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+149, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+150, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+151, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+152, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+153, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+154, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+155, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+156, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+157, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+158, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+159, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+160, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+161, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+162, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+163, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+164, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+165, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+166, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+167, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+168, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Dead Orc Scout - 29266 - Permanent Feign Death
(@CGUID+169, 0, 0, 0, 1, 0, 0, 0, 0, '51733'), -- Pygmy Witchdoctor - 51733 - Shadow Channelling
(@CGUID+170, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+171, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny
(@CGUID+172, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+173, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+174, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+175, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+176, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+177, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+178, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+179, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+180, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+181, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+182, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+183, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+184, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+185, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+186, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+187, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+188, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+189, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Frightened Miner - 29266 - Permanent Feign Death
(@CGUID+190, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+191, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+192, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+193, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+194, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+195, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+196, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+197, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+198, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+199, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+200, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+201, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+202, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+203, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+204, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+205, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+206, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+207, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+208, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+209, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+210, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+211, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+212, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+213, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+214, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+215, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+216, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+217, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+218, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+219, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+220, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+221, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+222, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+223, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+224, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+225, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+226, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+227, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+228, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+229, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+230, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+231, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+232, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+233, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+234, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+235, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+236, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+237, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+238, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+239, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+240, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+241, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frightened Miner
(@CGUID+242, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+243, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+244, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frightened Miner
(@CGUID+245, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frightened Miner
(@CGUID+246, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Foreman Dampwick - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+247, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+248, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+249, 0, 0, 0, 1, 0, 0, 0, 0, ''); -- Freezya

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+250, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+251, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+252, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+253, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+254, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+255, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+256, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Frightened Miner - 29266 - Permanent Feign Death
(@CGUID+257, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+258, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+259, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny
(@CGUID+260, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+261, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+262, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+263, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+264, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+265, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+266, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+267, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+268, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+269, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+270, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Frightened Miner - 29266 - Permanent Feign Death
(@CGUID+271, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+272, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+273, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+274, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+275, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+276, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+277, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+278, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+279, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Frightened Miner - 29266 - Permanent Feign Death
(@CGUID+280, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+281, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+282, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny
(@CGUID+283, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+284, 0, 0, 50397184, 1, 0, 0, 0, 0, '68231'), -- Capturing The Unknown - Bunny 1 - 68231 - Capturing The Unknown: Bunny 1 Invis & State Visual
(@CGUID+285, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+286, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+287, 0, 0, 50397184, 1, 0, 0, 0, 0, '70686'), -- Capturing The Unknown - Bunny 2 - 70686 - Capturing The Unknown: Bunny 2 Invis & State Visual
(@CGUID+288, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+289, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+290, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+291, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+292, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+293, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+294, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Frightened Miner - 29266 - Permanent Feign Death
(@CGUID+295, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+296, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+297, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+298, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+299, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+300, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+301, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+302, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+303, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+304, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+305, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+306, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+307, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+308, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+309, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+310, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+311, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+312, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+313, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+314, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+315, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+316, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+317, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+318, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+319, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+320, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+321, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+322, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+323, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+324, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+325, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+326, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+327, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+328, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+329, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+330, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+331, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+332, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+333, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+334, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+335, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+336, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+337, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+338, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+339, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+340, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+341, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+342, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+343, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+344, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+345, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+346, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+347, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+348, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+349, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+350, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+351, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+352, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+353, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+354, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+355, 0, 0, 50397184, 1, 0, 0, 0, 0, '70688'), -- Capturing The Unknown - Bunny 4 - 70688 - Capturing The Unknown: Bunny 4 Invis & State Visual
(@CGUID+356, 0, 0, 50397184, 1, 0, 0, 0, 0, '70687'), -- Capturing The Unknown - Bunny 3 - 70687 - Capturing The Unknown: Bunny 3 Invis & State Visual
(@CGUID+357, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny
(@CGUID+358, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+359, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+360, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+361, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+362, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+363, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+364, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+365, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+366, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+367, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+368, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+369, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+370, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+371, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+372, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+373, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+374, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+375, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+376, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+377, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+378, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+379, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+380, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+381, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+382, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+383, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+384, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+385, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+386, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+387, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+388, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+389, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+390, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+391, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+392, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+393, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+394, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+395, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- The Hammer - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+396, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+397, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+398, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+399, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+400, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+401, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+402, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+403, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+404, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+405, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+406, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+407, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+408, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+409, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+410, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+411, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+412, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+413, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+414, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+415, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+416, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+417, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+418, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+419, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+420, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+421, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+422, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+423, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+424, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+425, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+426, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+427, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+428, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+429, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+430, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+431, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+432, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+433, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+434, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Hatchling - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+435, 0, 0, 0, 1, 0, 0, 0, 0, '51733'), -- Pygmy Witchdoctor - 51733 - Shadow Channelling
(@CGUID+436, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+437, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+438, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+439, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+440, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+441, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Bomb-Throwing Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+442, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+443, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+444, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+445, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+446, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+447, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+448, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+449, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+450, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+451, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+452, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+453, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+454, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+455, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+456, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+457, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+458, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+459, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+460, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+461, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+462, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Chawg - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+463, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+464, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+465, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- Kilag Gorefang
(@CGUID+466, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+467, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+468, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+469, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+470, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+471, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- Orc Scout
(@CGUID+472, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+473, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+474, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+475, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+476, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+477, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+478, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+479, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- Orc Scout
(@CGUID+480, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Aggra - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+481, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+482, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+483, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bastia - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+484, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+485, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- SI:7 Infiltrator - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+486, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+487, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+488, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+489, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+490, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+491, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+492, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+493, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+494, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+495, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+496, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+497, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- SI:7 Infiltrator - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+498, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+499, 0, 0, 0, 1, 0, 0, 0, 0, ''); -- Poison Spitter

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+500, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+501, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+502, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+503, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+504, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+505, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+506, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+507, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+508, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+509, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+510, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+511, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+512, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+513, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+514, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+515, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+516, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+517, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+518, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+519, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+520, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+521, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+522, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+523, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+524, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+525, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+526, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+527, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+528, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+529, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+530, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+531, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+532, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+533, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+534, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+535, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+536, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+537, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+538, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+539, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+540, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+541, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+542, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+543, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+544, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+545, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+546, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+547, 0, 0, 0, 1, 0, 0, 0, 0, '76354 73561'), -- Lost Isles Mail Bird - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 73561 - Lost Isles Mail Bird: Aura Timer
(@CGUID+548, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+549, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+550, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+551, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+552, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+553, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+554, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+555, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+556, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+557, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+558, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+559, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+560, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+561, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+562, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+563, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+564, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+565, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+566, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+567, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+568, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+569, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+570, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+571, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+572, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+573, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+574, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+575, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+576, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+577, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+578, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+579, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+580, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+581, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+582, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+583, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+584, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+585, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+586, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+587, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+588, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+589, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+590, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+591, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+592, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+593, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+594, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+595, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+596, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+597, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+598, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+599, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+600, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+601, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+602, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+603, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+604, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+605, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+606, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+607, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+608, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+609, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+610, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+611, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+612, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+613, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+614, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+615, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+616, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+617, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+618, 0, 0, 0, 1, 0, 0, 0, 0, '68227'), -- Poison Spitter - 68227 - Weed Whacker: Plant Burst Controller
(@CGUID+619, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+620, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+621, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+622, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+623, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+624, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+625, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+626, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+627, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+628, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+629, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+630, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+631, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+632, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+633, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+634, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+635, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+636, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+637, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+638, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+639, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+640, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+641, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+642, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+643, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+644, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+645, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+646, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+647, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+648, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+649, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+650, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+651, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+652, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+653, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+654, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+655, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+656, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+657, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+658, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+659, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+660, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+661, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+662, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+663, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+664, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+665, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+666, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+667, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+668, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+669, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+670, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+671, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+672, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+673, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+674, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+675, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+676, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+677, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+678, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+679, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+680, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+681, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+682, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+683, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+684, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+685, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- Strangle Vine - 68295 - Strangle Vine: Entangling Roots Visual
(@CGUID+686, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+687, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+688, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+689, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+690, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+691, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+692, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+693, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+694, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+695, 0, 0, 65536, 1, 0, 0, 0, 0, '9036 10848'), -- Spirit Healer - 9036 - Ghost, 10848 - Shroud of Death
(@CGUID+696, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+697, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+698, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+699, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+700, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+701, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+702, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+703, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+704, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+705, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+706, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+707, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+708, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+709, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+710, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+711, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+712, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+713, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+714, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+715, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+716, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+717, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+718, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+719, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+720, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+721, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+722, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+723, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+724, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+725, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- Orc Scout - 46598 - Ride Vehicle Hardcoded
(@CGUID+726, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Smart Mining Monkey
(@CGUID+727, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+728, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+729, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+730, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+731, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+732, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+733, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Freezya
(@CGUID+734, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+735, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- SI:7 Infiltrator - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+736, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- SI:7 Infiltrator - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+737, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+738, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Poison Spitter
(@CGUID+739, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+740, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Matriarch - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+741, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- The Hammer - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+742, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+743, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- SI:7 Infiltrator - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+744, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+745, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+746, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- SI:7 Infiltrator - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+747, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+748, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+749, 0, 0, 0, 1, 0, 0, 0, 0, '68327'); -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+750, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+751, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+752, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+753, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Orc Survivor - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+754, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+755, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+756, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+757, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+758, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+759, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+760, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+761, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+762, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+763, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+764, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+765, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+766, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+767, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+768, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+769, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+770, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+771, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+772, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+773, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+774, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+775, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+776, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+777, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+778, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+779, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+780, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+781, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+782, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+783, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+784, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+785, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+786, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+787, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+788, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+789, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+790, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+791, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+792, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+793, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+794, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+795, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+796, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+797, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+798, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+799, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+800, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+801, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+802, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+803, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+804, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+805, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+806, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+807, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+808, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+809, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+810, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+811, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+812, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+813, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+814, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+815, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+816, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+817, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+818, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+819, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+820, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+821, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+822, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+823, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+824, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+825, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+826, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+827, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+828, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+829, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+830, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+831, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+832, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+833, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+834, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+835, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+836, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+837, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+838, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+839, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+840, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+841, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+842, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+843, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+844, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+845, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+846, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+847, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+848, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+849, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+850, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+851, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+852, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+853, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+854, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+855, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+856, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+857, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+858, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+859, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+860, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+861, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+862, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+863, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+864, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+865, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+866, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+867, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+868, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+869, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+870, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+871, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+872, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+873, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+874, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+875, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+876, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+877, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+878, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+879, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+880, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+881, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+882, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+883, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+884, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+885, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+886, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+887, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+888, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+889, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+890, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+891, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+892, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+893, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+894, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+895, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+896, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+897, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+898, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+899, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+900, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+901, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+902, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+903, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+904, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+905, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+906, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+907, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+908, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+909, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+910, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+911, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+912, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+913, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+914, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+915, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+916, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+917, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+918, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+919, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+920, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+921, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+922, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+923, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+924, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+925, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+926, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+927, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+928, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+929, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+930, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+931, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+932, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+933, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+934, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+935, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+936, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+937, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+938, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+939, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+940, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+941, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+942, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+943, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+944, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+945, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+946, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+947, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+948, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+949, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+950, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+951, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+952, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+953, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+954, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+955, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+956, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+957, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+958, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+959, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+960, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+961, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+962, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+963, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+964, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+965, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+966, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+967, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+968, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+969, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+970, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+971, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+972, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+973, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+974, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+975, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+976, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+977, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+978, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+979, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+980, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+981, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+982, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+983, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+984, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+985, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+986, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+987, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+988, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+989, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+990, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+991, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+992, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+993, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+994, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+995, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+996, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+997, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+998, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+999, 0, 0, 0, 1, 0, 0, 0, 0, '29266'); -- Poison Spitter - 29266 - Permanent Feign Death

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+1000, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1001, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1002, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1003, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1004, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1005, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1006, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1007, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1008, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1009, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1010, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1011, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1012, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1013, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1014, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1015, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1016, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1017, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1018, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1019, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1020, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1021, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1022, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1023, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1024, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1025, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1026, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1027, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1028, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1029, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1030, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1031, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1032, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1033, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1034, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1035, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1036, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1037, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1038, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1039, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1040, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1041, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1042, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1043, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1044, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1045, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1046, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1047, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1048, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1049, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1050, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+1051, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1052, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1053, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1054, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1055, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1056, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1057, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1058, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1059, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1060, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1061, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1062, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1063, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1064, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1065, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1066, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1067, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1068, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1069, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1070, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1071, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+1072, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1073, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1074, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1075, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1076, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1077, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1078, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1079, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1080, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354 68327'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1081, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1082, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1083, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1084, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1085, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1086, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1087, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1088, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1089, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1090, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1091, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1092, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1093, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Smart Mining Monkey - 29266 - Permanent Feign Death
(@CGUID+1094, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1095, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1096, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1097, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Freezya - 29266 - Permanent Feign Death
(@CGUID+1098, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1099, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1100, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frightened Miner - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1101, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1102, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Poison Spitter - 29266 - Permanent Feign Death
(@CGUID+1103, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1104, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1105, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Bomb-Throwing Monkey - 29266 - Permanent Feign Death
(@CGUID+1106, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354 68327'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1107, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1108, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1109, 0, 0, 8, 2, 0, 0, 0, 0, '68327'), -- Orc Scout - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1110, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1111, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1112, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1113, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1114, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1115, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1116, 0, 0, 1, 1, 0, 0, 0, 0, '76354'), -- Bastia - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1117, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1118, 0, 0, 8, 2, 0, 0, 0, 0, '68327'), -- Orc Scout - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1119, 0, 0, 0, 2, 0, 0, 0, 0, '68327'), -- Kilag Gorefang - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1120, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1121, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1122, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1123, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1124, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1125, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1126, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1127, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1128, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1129, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1130, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1131, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1132, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1133, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1134, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1135, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1136, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1137, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1138, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1139, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1140, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1141, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1142, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1143, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1144, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1145, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1146, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1147, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1148, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1149, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1150, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1151, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1152, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1153, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1154, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1155, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1156, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1157, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1158, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1159, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1160, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1161, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1162, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1163, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1164, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1165, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1166, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1167, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1168, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1169, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1170, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1171, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1172, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1173, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1174, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1175, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1176, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1177, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1178, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1179, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1180, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1181, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1182, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1183, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1184, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1185, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354 68327'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1186, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1187, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1188, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1189, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1190, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1191, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1192, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1193, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1194, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1195, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1196, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1197, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1198, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1199, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1200, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1201, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1202, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1203, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1204, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1205, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1206, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1207, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1208, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1209, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1210, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1211, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1212, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1213, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1214, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1215, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1216, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1217, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1218, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1219, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1220, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1221, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1222, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1223, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1224, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1225, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1226, 0, 0, 0, 1, 0, 0, 0, 0, '68322'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura
(@CGUID+1227, 0, 0, 0, 1, 0, 0, 0, 0, '68322'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura
(@CGUID+1228, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1229, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1230, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1231, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1232, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Frog - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1233, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1234, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1235, 0, 0, 0, 1, 0, 0, 0, 0, '76354 68327'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1236, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1237, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Rat - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1238, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- Jumping Monkey - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1239, 0, 0, 0, 1, 0, 0, 0, 0, '68322'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura
(@CGUID+1240, 0, 0, 0, 1, 0, 0, 0, 0, '68322'), -- SI:7 Assassin - 68322 - Infrared = Infradead: SI:7 Assassin Aura
(@CGUID+1241, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Scout Brax - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1242, 0, 0, 0, 1, 0, 0, 0, 0, '76367'), -- Strand Crab - 76367 - Infrared = Infradead: Heat Signature Aura - Beast (50%)
(@CGUID+1243, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Matriarch - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1244, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1245, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1246, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1247, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Gyrochoppa
(@CGUID+1248, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1249, 0, 0, 0, 1, 0, 0, 0, 0, ''); -- Strand Crab

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+1250, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1251, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Orc Battlesworn
(@CGUID+1252, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1253, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1254, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1255, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1256, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1257, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Aggra
(@CGUID+1258, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Kilag Gorefang
(@CGUID+1259, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bastia - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1260, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1261, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Chawg
(@CGUID+1262, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1263, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1264, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Orc Battlesworn
(@CGUID+1265, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1266, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1267, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1268, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Orc Battlesworn
(@CGUID+1269, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1270, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1271, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1272, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1273, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1274, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1275, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1276, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1277, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1278, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1279, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1280, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1281, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1282, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1283, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1284, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1285, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1286, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Gyrochoppa Pilot
(@CGUID+1287, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354 68327'), -- Pterrordax Scavenger - 76354 - Infrared = Infradead: Heat Signature Aura - Beast, 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1288, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1289, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1290, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1291, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1292, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1293, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1294, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1295, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1296, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1297, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1298, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1299, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1300, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1301, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1302, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1303, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1304, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1305, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1306, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1307, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1308, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1309, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1310, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1311, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1312, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1313, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1314, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1315, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1316, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1317, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1318, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1319, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1320, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Gyrochoppa Pilot
(@CGUID+1321, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1322, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1323, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- SI:7 Operative
(@CGUID+1324, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1325, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1326, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1327, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1328, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1329, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Daggertooth Shark - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1330, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1331, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1332, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1333, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1334, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1335, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1336, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1337, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1338, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1339, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1340, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1341, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1342, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1343, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1344, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1345, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1346, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1347, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1348, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1349, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1350, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1351, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1352, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1353, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1354, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1355, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1356, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1357, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1358, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1359, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1360, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1361, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Captain
(@CGUID+1362, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1363, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1364, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1365, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1366, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1367, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1368, 0, 0, 0, 1, 0, 0, 0, 0, '54219'), -- Alliance Wizard - 54219 - Arcane Channeling
(@CGUID+1369, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1370, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1371, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1372, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1373, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Captain
(@CGUID+1374, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Thrall
(@CGUID+1375, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1376, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1377, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1378, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1379, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1380, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1381, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1382, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1383, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1384, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1385, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1386, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1387, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1388, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1389, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1390, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1391, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1392, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1393, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1394, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1395, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1396, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1397, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1398, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Captain
(@CGUID+1399, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1400, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1401, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1402, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1403, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1404, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1405, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1406, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1407, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1408, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1409, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1410, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1411, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1412, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1413, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1414, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1415, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1416, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1417, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1418, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1419, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1420, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1421, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1422, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1423, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1424, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1425, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1426, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1427, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1428, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1429, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1430, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1431, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1432, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1433, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1434, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1435, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1436, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1437, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1438, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1439, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1440, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Wizard - 31261 - Permanent Feign Death (Root)
(@CGUID+1441, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1442, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1443, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1444, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1445, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1446, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1447, 0, 0, 0, 1, 0, 0, 0, 0, '31261'), -- Alliance Sailor - 31261 - Permanent Feign Death (Root)
(@CGUID+1448, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1449, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1450, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1451, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1452, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1453, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1454, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1455, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1456, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1457, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1458, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1459, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1460, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1461, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1462, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Thrall
(@CGUID+1463, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1464, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1465, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1466, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1467, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1468, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1469, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1470, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1471, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1472, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1473, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1474, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1475, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1476, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1477, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1478, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1479, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1480, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1481, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1482, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1483, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1484, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1485, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1486, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1487, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1488, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1489, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1490, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1491, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1492, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1493, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1494, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1495, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1496, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1497, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1498, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1499, 0, 0, 0, 1, 0, 0, 0, 0, ''); -- Alliance Sailor

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+1500, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1501, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1502, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1503, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1504, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1505, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1506, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1507, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1508, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1509, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1510, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1511, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1512, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1513, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1514, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1515, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1516, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1517, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1518, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1519, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1520, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1521, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1522, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1523, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1524, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1525, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1526, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1527, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1528, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1529, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1530, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1531, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1532, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1533, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1534, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1535, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1536, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1537, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1538, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1539, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1540, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1541, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1542, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1543, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1544, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1545, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1546, 0, 0, 8, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1547, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1548, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1549, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1550, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1551, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1552, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1553, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1554, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1555, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1556, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1557, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1558, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1559, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1560, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1561, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1562, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1563, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1564, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1565, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1566, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1567, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1568, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1569, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1570, 0, 0, 0, 1, 0, 0, 0, 0, '42345'), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4) - 42345 - Cosmetic - Flame Patch
(@CGUID+1571, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1572, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1573, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1574, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1575, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1576, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1577, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1578, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
(@CGUID+1579, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1580, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1581, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1582, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1583, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1584, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1585, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1586, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1587, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1588, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1589, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1590, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1591, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1592, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1593, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1594, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1595, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1596, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1597, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1598, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1599, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1600, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1601, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1602, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1603, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1604, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1605, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1606, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1607, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1608, 0, 0, 1, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1609, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Alliance Sailor
(@CGUID+1610, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny Large
(@CGUID+1611, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1612, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1613, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1614, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1615, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1616, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1617, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1618, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1619, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1620, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1621, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1622, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1623, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1624, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1625, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1626, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1627, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1628, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1629, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1630, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1631, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1632, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1633, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1634, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1635, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1636, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1637, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1638, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1639, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1640, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1641, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1642, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1643, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1644, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1645, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1646, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1647, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1648, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1649, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1650, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1651, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- Gyrochoppa Pilot - 29266 - Permanent Feign Death
(@CGUID+1652, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1653, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1654, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1655, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1656, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1657, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1658, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1659, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1660, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Strand Crab
(@CGUID+1661, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1662, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1663, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Teraptor Matriarch - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1664, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1665, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- SI:7 Operative - 29266 - Permanent Feign Death
(@CGUID+1666, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1667, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1668, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1669, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1670, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1671, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1672, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1673, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1674, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1675, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1676, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1677, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1678, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1679, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1680, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1681, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1682, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1683, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1684, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1685, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1686, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1687, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1688, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1689, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1690, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1691, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1692, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1693, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1694, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1695, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1696, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1697, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1698, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1699, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1700, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1701, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1702, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1703, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- The Hammer - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1704, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1705, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1706, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Orc Battlesworn
(@CGUID+1707, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- Orc Scout
(@CGUID+1708, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1709, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- Orc Scout
(@CGUID+1710, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Chawg
(@CGUID+1711, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Scout Brax
(@CGUID+1712, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Doc Zapnozzle
(@CGUID+1713, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Aggra
(@CGUID+1714, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1715, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Thrall
(@CGUID+1716, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1717, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Orc Battlesworn
(@CGUID+1718, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Brett "Coins" McQuid
(@CGUID+1719, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Megs Dreadshredder - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1720, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Bastia - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1721, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Orc Survivor
(@CGUID+1722, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Orc Battlesworn
(@CGUID+1723, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Fizz Lighter
(@CGUID+1724, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1725, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Kilag Gorefang
(@CGUID+1726, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1727, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Orc Survivor
(@CGUID+1728, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- Orc Scout
(@CGUID+1729, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Sister Goldskimmer
(@CGUID+1730, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Sally "Salvager" Sandscrew
(@CGUID+1731, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Izzy
(@CGUID+1732, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Chip Endale
(@CGUID+1733, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1734, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1735, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Candy Cane
(@CGUID+1736, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Coach Crosscheck - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1737, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1738, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Evol Fingers
(@CGUID+1739, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- ELM General Purpose Bunny
(@CGUID+1740, 0, 0, 0, 1, 0, 0, 0, 0, '12550'), -- Maxx Avalanche - 12550 - Lightning Shield
(@CGUID+1741, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Orc Survivor
(@CGUID+1742, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1743, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Grimy Greasefingers
(@CGUID+1744, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1745, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Sassy Hardwrench
(@CGUID+1746, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1747, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- Slinky Sharpshiv
(@CGUID+1748, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Ace
(@CGUID+1749, 0, 0, 0, 0, 0, 0, 0, 0, ''); -- Bamm Megabomb

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(@CGUID+1750, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1751, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1752, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1753, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1754, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1755, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Gobber
(@CGUID+1756, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Warrior-Matic NX-01
(@CGUID+1757, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- Geargrinder Gizmo - 68327 - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(@CGUID+1758, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Goblin Survivor
(@CGUID+1759, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1760, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1761, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Frog
(@CGUID+1762, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1763, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- Rat
(@CGUID+1764, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Jungle Cat - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1765, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1766, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1767, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1768, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1769, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1770, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1771, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1772, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1773, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1774, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast
(@CGUID+1775, 0, 0, 0, 1, 0, 0, 0, 0, '76354'); -- Ravenous Lurker - 76354 - Infrared = Infradead: Heat Signature Aura - Beast

DELETE FROM `gameobject` WHERE `guid` = 0 OR `guid` BETWEEN @OGUID+0 AND @OGUID+115;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 195188, 648, 0, 0, 1, '170', 0, 484.358, 3386.83, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+1, 195188, 648, 0, 0, 1, '170', 0, 520.4167, 3407.221, 0, 4.921829, 0, 0, -0.6293201, 0.7771462, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+2, 195188, 648, 0, 0, 1, '170', 0, 554.8229, 3435.682, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+3, 195188, 648, 0, 0, 1, '170', 0, 503.1528, 3345.603, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+4, 195188, 648, 0, 0, 1, '170', 0, 563.316, 3381.815, 0, 3.246347, 0, 0, -0.9986286, 0.05235322, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+5, 195188, 648, 0, 0, 1, '170', 0, 477.0521, 3327.461, 0, 5.253442, 0, 0, -0.4924231, 0.870356, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+6, 195188, 648, 0, 0, 1, '170', 0, 432.816, 3310.579, 0, 3.159062, 0, 0, -0.9999619, 0.008734641, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+7, 195188, 648, 0, 0, 1, '170', 0, 548.6962, 3327.155, 0, 4.310966, 0, 0, -0.8338852, 0.5519379, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+8, 195188, 648, 0, 0, 1, '170', 0, 510.8403, 3281.251, 0, 1.937312, 0, 0, 0.8241253, 0.5664076, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+9, 195188, 648, 0, 0, 1, '170', 0, 454.7465, 3274.634, 0, 0.1047193, 0, 0, 0.05233574, 0.9986296, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+10, 202495, 648, 0, 0, 1, '170', 0, 880.8264, 3317.732, 10.50565, 3.143686, 0.02537394, 0.00182724, -0.9996758, 0.00109183, 120, 255, 1, 27481), -- Campfire (Area: -Unknown- - Difficulty: 1)
(@OGUID+11, 195188, 648, 0, 0, 1, '170', 0, 485.5313, 3240.849, 0, 1.117009, 0, 0, 0.5299187, 0.8480484, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+12, 195188, 648, 0, 0, 1, '170', 0, 574.8264, 3294.393, 0, 3.892087, 0, 0, -0.9304171, 0.3665025, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+13, 202494, 648, 0, 0, 1, '170', 0, 900.3542, 3275.425, 13.45322, 3.143686, 0.02537394, 0.00182724, -0.9996758, 0.00109183, 120, 255, 1, 27481), -- Campfire (Area: -Unknown- - Difficulty: 1)
(@OGUID+14, 195188, 648, 0, 0, 1, '170', 0, 486.2899, 3201.208, 0, 4.537859, 0, 0, -0.7660437, 0.6427886, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+15, 195188, 648, 0, 0, 1, '170', 0, 512.4167, 3220.306, 0, 1.308995, 0, 0, 0.6087608, 0.7933538, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+16, 195188, 648, 0, 0, 1, '170', 0, 621.8438, 3262.851, 0, 3.665196, 0, 0, -0.9659252, 0.2588213, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+17, 195188, 648, 0, 0, 1, '170', 0, 551.0903, 3181.908, 0, 4.921829, 0, 0, -0.6293201, 0.7771462, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+18, 195188, 648, 0, 0, 1, '170', 0, 632.7917, 3379.958, 0, 4.572764, 0, 0, -0.7547092, 0.6560594, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+19, 195188, 648, 0, 0, 1, '170', 0, 588.6163, 3409.43, 0, 3.159062, 0, 0, -0.9999619, 0.008734641, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+20, 195188, 648, 0, 0, 1, '170', 0, 376.59, 3297.09, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+21, 195188, 648, 0, 0, 1, '170', 0, 406.4097, 3257.612, 0, 5.183629, 0, 0, -0.5224981, 0.8526405, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+22, 195188, 648, 0, 0, 1, '170', 0, 434.533, 3222.872, 0, 1.727875, 0, 0, 0.7604055, 0.6494485, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+23, 195188, 648, 0, 0, 1, '170', 0, 366.2431, 3233.604, 0, 4.81711, 0, 0, -0.6691303, 0.743145, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+24, 195188, 648, 0, 0, 1, '170', 0, 318.911, 3271.23, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+25, 195188, 648, 0, 0, 1, '170', 0, 318.911, 3271.23, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+26, 195188, 648, 0, 0, 1, '170', 0, 318.911, 3271.23, 0, 2.373644, 0, 0, 0.9271832, 0.3746083, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+27, 195188, 648, 0, 0, 1, '170', 0, 384.9774, 3199.773, 0, 1.745327, 0, 0, 0.7660437, 0.6427886, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+28, 195188, 648, 0, 0, 1, '170', 0, 349.3212, 3181.99, 0, 3.159062, 0, 0, -0.9999619, 0.008734641, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+29, 195188, 648, 0, 0, 1, '170', 0, 308.7899, 3206.192, 0, 4.921829, 0, 0, -0.6293201, 0.7771462, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+30, 195188, 648, 0, 0, 1, '170', 0, 369.8333, 3148.738, 0, 3.159062, 0, 0, -0.9999619, 0.008734641, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+31, 195188, 648, 0, 0, 1, '170', 0, 367.4931, 3096.531, 0, 4.921829, 0, 0, -0.6293201, 0.7771462, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+32, 195188, 648, 0, 0, 1, '170', 0, 418.4323, 3142.503, 0, 3.159062, 0, 0, -0.9999619, 0.008734641, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+33, 195188, 648, 0, 0, 1, '170', 0, 432.4601, 3186.178, 0, 4.32842, 0, 0, -0.8290367, 0.5591941, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+34, 195188, 648, 0, 0, 1, '170', 0, 457.276, 3157.988, 0, 1.989672, 0, 0, 0.8386698, 0.5446402, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+35, 202536, 648, 0, 0, 1, '170', 0, 580.2049, 3133.366, 0.130139, 1.221727, 0, 0, 0.573575, 0.819153, 120, 255, 1, 27481), -- Mailbox (Area: -Unknown- - Difficulty: 1)
(@OGUID+36, 195694, 648, 0, 0, 1, '170', 0, 581.118, 3102.372, 2.994819, 3.464481, 0.0212369, -0.03551006, -0.9862452, 0.1600267, 120, 255, 1, 27481), -- Bonfire (Area: -Unknown- - Difficulty: 1)
(@OGUID+37, 195201, 648, 0, 0, 1, '170', 0, 562.9531, 3030.081, 10.55165, 2.91469, 0, 0, 0.9935713, 0.1132084, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+38, 195188, 648, 0, 0, 1, '170', 0, 590.3316, 3221.278, 0, 5.235988, 0, 0, -0.5, 0.8660254, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+39, 195201, 648, 0, 0, 1, '170', 0, 610.9774, 3031.104, 12.80549, 2.321287, 0, 0, 0.9170599, 0.3987495, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+40, 195188, 648, 0, 0, 1, '170', 0, 619.5989, 3199.653, 0, 1.53589, 0, 0, 0.6946583, 0.7193398, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+41, 195201, 648, 0, 0, 1, '170', 0, 610.1215, 3052.48, 9.675187, 4.06662, 0, 0, -0.8949337, 0.4461992, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+42, 195201, 648, 0, 0, 1, '170', 0, 668.9271, 3091.033, 5.798674, 4.06662, 0, 0, -0.8949337, 0.4461992, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+43, 195201, 648, 0, 0, 1, '170', 0, 674.684, 3093.662, 6.188143, 2.286379, 0, 0, 0.9099607, 0.4146944, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+44, 196458, 648, 0, 0, 1, '170', 0, 583.2465, 3105.811, 2.945678, 4.24115, 0, 0, -0.8526402, 0.5224986, 120, 255, 1, 27481), -- Candy Cane's Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+45, 199328, 648, 0, 0, 1, '170', 0, 582.5486, 3106.877, 2.768584, 0.9599299, 0, 0, 0.4617481, 0.8870111, 120, 255, 1, 27481), -- Candy Cane's Parasol (Area: -Unknown- - Difficulty: 1)
(@OGUID+46, 195201, 648, 0, 0, 1, '170', 0, 709.566, 3093.796, 9.690938, 3.595379, 0, 0, -0.97437, 0.2249513, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+47, 195201, 648, 0, 0, 1, '170', 0, 719.2969, 3094.439, 10.14715, 5.462882, 0, 0, -0.3987484, 0.9170604, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+48, 195188, 648, 0, 0, 1, '170', 0, 632.684, 3225.135, 0, 0.9075702, 0, 0, 0.4383707, 0.8987942, 120, 255, 1, 27481), -- Goblin Escape Pod (Area: -Unknown- - Difficulty: 1)
(@OGUID+49, 195201, 648, 0, 0, 1, '170', 0, 694.2118, 3052.678, 12.08679, 1.675514, 0, 0, 0.743144, 0.6691315, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+50, 195201, 648, 0, 0, 1, '170', 0, 739.9288, 3140.623, 9.033684, 3.228859, 0, 0, -0.9990482, 0.04361926, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+51, 195201, 648, 0, 0, 1, '170', 0, 668.1632, 3009.983, 17.11775, 2.024579, 0, 0, 0.8480473, 0.5299206, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+52, 195622, 648, 0, 0, 1, '170', 0, 645.7882, 3006.575, -13.30673, 0.5585039, 0, 0, 0.2756367, 0.9612619, 120, 255, 1, 27481), -- Kaja'mite Ore (Area: -Unknown- - Difficulty: 1)
(@OGUID+53, 195201, 648, 0, 0, 1, '170', 0, 748.342, 3140.135, 9.635689, 2.809975, 0, 0, 0.9862852, 0.1650499, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+54, 195201, 648, 0, 0, 1, '170', 0, 751, 3133.016, 9.584511, 0.6981314, 0, 0, 0.34202, 0.9396927, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+55, 195201, 648, 0, 0, 1, '170', 0, 649.9375, 3006.451, 14.63873, 3.036838, 0, 0, 0.9986286, 0.05235322, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+56, 195201, 648, 0, 0, 1, '170', 0, 626.3438, 3012.6, 16.39315, 2.216565, 0, 0, 0.8949337, 0.4461992, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+57, 195201, 648, 0, 0, 1, '170', 0, 719.7969, 3027.892, 15.45003, 2.844883, 0, 0, 0.9890156, 0.1478114, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+58, 195201, 648, 0, 0, 1, '170', 0, 731.6042, 3026.797, 14.98648, 0.7330382, 0, 0, 0.3583679, 0.9335805, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+59, 195201, 648, 0, 0, 1, '170', 0, 760.1702, 3068.391, 14.99574, 4.904376, 0, 0, -0.6360779, 0.7716249, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+60, 195201, 648, 0, 0, 1, '170', 0, 771.8108, 3037.15, 13.62275, 2.949595, 0, 0, 0.9953957, 0.09585124, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+61, 195201, 648, 0, 0, 1, '170', 0, 768.0417, 3106.313, 14.37384, 4.276057, 0, 0, -0.8433914, 0.5372996, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+62, 195201, 648, 0, 0, 1, '170', 0, 733.9323, 2992.367, 13.83896, 5.462882, 0, 0, -0.3987484, 0.9170604, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+63, 195201, 648, 0, 0, 1, '170', 0, 771.2274, 3035.717, 13.6453, 4.677484, 0, 0, -0.7193394, 0.6946588, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+64, 195201, 648, 0, 0, 1, '170', 0, 767.9479, 3068.427, 14.49066, 5.462882, 0, 0, -0.3987484, 0.9170604, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+65, 195201, 648, 0, 0, 1, '170', 0, 797.0434, 3108.714, 14.74782, 5.462882, 0, 0, -0.3987484, 0.9170604, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+66, 195201, 648, 0, 0, 1, '170', 0, 765.217, 3164.69, 10.81448, 5.550147, 0, 0, -0.3583679, 0.9335805, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+67, 195201, 648, 0, 0, 1, '170', 0, 757.9063, 3173.219, 10.25848, 3.996807, 0, 0, -0.9099607, 0.4146944, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+68, 195201, 648, 0, 0, 1, '170', 0, 809.6146, 3079.51, 13.85693, 2.984498, 0, 0, 0.9969168, 0.07846643, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+69, 195201, 648, 0, 0, 1, '170', 0, 796.1545, 3135.656, 14.6833, 3.612838, 0, 0, -0.9723692, 0.2334484, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+70, 195201, 648, 0, 0, 1, '170', 0, 716.0746, 2973.838, 17.30612, 2.094393, 0, 0, 0.866025, 0.5000008, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+71, 195622, 648, 0, 0, 1, '170', 0, 668.467, 2949.857, -0.032897, 0.5235979, 0, 0, 0.2588186, 0.9659259, 120, 255, 1, 27481), -- Kaja'mite Ore (Area: -Unknown- - Difficulty: 1)
(@OGUID+72, 195201, 648, 0, 0, 1, '170', 0, 784.0938, 3166.142, 11.8764, 3.857183, 0, 0, -0.9366713, 0.3502098, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+73, 195201, 648, 0, 0, 1, '170', 0, 758.5121, 3202.872, 8.375953, 4.468043, 0, 0, -0.7880106, 0.6156617, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+74, 195201, 648, 0, 0, 1, '170', 0, 716.7309, 3201.714, 5.955711, 5.166176, 0, 0, -0.5299187, 0.8480484, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+75, 195201, 648, 0, 0, 1, '170', 0, 668.9271, 3091.033, 5.798674, 4.06662, 0, 0, -0.8949337, 0.4461992, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+76, 195201, 648, 0, 0, 1, '170', 0, 709.566, 3093.796, 9.690938, 3.595379, 0, 0, -0.97437, 0.2249513, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+77, 195201, 648, 0, 0, 1, '170', 0, 557.5573, 3024.869, 10.07926, 2.356195, 0, 0, 0.9238796, 0.3826832, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+78, 195622, 648, 0, 0, 1, '170', 0, 588.8195, 2966.685, -2.358135, 2.321287, 0, 0, 0.9170599, 0.3987495, 120, 255, 1, 27481), -- Kaja'mite Ore (Area: -Unknown- - Difficulty: 1)
(@OGUID+79, 195622, 648, 0, 0, 1, '170', 0, 577.7847, 2904.273, -6.971854, 5.410522, 0, 0, -0.4226179, 0.9063079, 120, 255, 1, 27481), -- Kaja'mite Ore (Area: -Unknown- - Difficulty: 1)
(@OGUID+80, 195622, 648, 0, 0, 1, '170', 0, 601.2691, 2889.742, -6.276491, 3.926996, 0, 0, -0.9238787, 0.3826855, 120, 255, 1, 27481), -- Kaja'mite Ore (Area: -Unknown- - Difficulty: 1)
(@OGUID+81, 195622, 648, 0, 0, 1, '170', 0, 607.6632, 2855.469, -7.236666, 2.530723, 0, 0, 0.9537163, 0.3007079, 120, 255, 1, 27481), -- Kaja'mite Ore (Area: -Unknown- - Difficulty: 1)
(@OGUID+82, 195201, 648, 0, 0, 1, '170', 0, 733.9323, 2992.367, 13.83896, 5.462882, 0, 0, -0.3987484, 0.9170604, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+83, 195201, 648, 0, 0, 1, '170', 0, 719.7969, 3027.892, 15.45003, 2.844883, 0, 0, 0.9890156, 0.1478114, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+84, 195201, 648, 0, 0, 1, '170', 0, 731.6042, 3026.797, 14.98648, 0.7330382, 0, 0, 0.3583679, 0.9335805, 120, 255, 1, 27481), -- Crate of Tools (Area: -Unknown- - Difficulty: 1)
(@OGUID+85, 196386, 648, 0, 0, 1, '170', 0, 546.9705, 2696.744, 105.795, 3.953176, 0.00634861, -0.01144695, -0.9187183, 0.3946964, 120, 255, 1, 27481), -- Bonfire (Area: -Unknown- - Difficulty: 1)
(@OGUID+86, 196397, 648, 0, 0, 1, '172', 0, 989.2761, 3810.351, -3.9846, 2.687807, 0, 0, 0.97437, 0.2249513, 120, 255, 1, 27481), -- Rope Ladder (Area: -Unknown- - Difficulty: 1)
(@OGUID+87, 196396, 648, 0, 0, 1, '172', 0, 965.8629, 3821.98, -3.892544, 5.864307, 0, 0, -0.2079115, 0.9781476, 120, 255, 1, 27481), -- Rope Ladder (Area: -Unknown- - Difficulty: 1)
(@OGUID+88, 164759, 648, 0, 0, 1, '172', 0, 1058.231, 3820.446, 2.5838, 2.312558, 0, 0, 0.9153109, 0.4027481, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+89, 164761, 648, 0, 0, 1, '172', 0, 1058.442, 3817.664, 2.616601, 5.532697, 0, 0, -0.3664999, 0.9304181, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+90, 164760, 648, 0, 0, 1, '172', 0, 1056.922, 3821.693, 2.5838, 5.532697, 0, 0, -0.3664999, 0.9304181, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+91, 164763, 648, 0, 0, 1, '172', 0, 1055.156, 3814.415, 2.616742, 0.1308994, 0, 0, 0.06540298, 0.9978589, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+92, 164762, 648, 0, 0, 1, '172', 0, 1059.769, 3816.372, 2.616601, 2.312558, 0, 0, 0.9153109, 0.4027481, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+93, 164765, 648, 0, 0, 1, '172', 0, 1047.505, 3808.167, 2.619135, 5.532697, 0, 0, -0.3664999, 0.9304181, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+94, 164764, 648, 0, 0, 1, '172', 0, 1056.926, 3814.617, 2.616742, 3.194002, 0, 0, -0.9996567, 0.02620165, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+95, 164766, 648, 0, 0, 1, '172', 0, 1048.618, 3807.124, 2.619135, 2.312558, 0, 0, 0.9153109, 0.4027481, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+96, 164759, 648, 0, 0, 1, '172', 0, 986.27, 3832.605, 3.197241, 1.788962, 0, 0, 0.7798843, 0.6259237, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+97, 164761, 648, 0, 0, 1, '172', 0, 985.0609, 3830.09, 3.230042, 5.009097, 0, 0, -0.5948219, 0.8038574, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+98, 164760, 648, 0, 0, 1, '172', 0, 985.759, 3834.34, 3.197241, 5.009097, 0, 0, -0.5948219, 0.8038574, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+99, 164763, 648, 0, 0, 1, '172', 0, 980.591, 3828.919, 3.230183, 5.890489, 0, 0, -0.1950893, 0.9807855, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+100, 164762, 648, 0, 0, 1, '172', 0, 985.5648, 3828.308, 3.230042, 1.788962, 0, 0, 0.7798843, 0.6259237, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+101, 164765, 648, 0, 0, 1, '172', 0, 970.8411, 3827.334, 3.232576, 5.009097, 0, 0, -0.5948219, 0.8038574, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+102, 164764, 648, 0, 0, 1, '172', 0, 982.2249, 3828.209, 3.230183, 2.670356, 0, 0, 0.9723701, 0.2334444, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+103, 164766, 648, 0, 0, 1, '172', 0, 971.2834, 3825.875, 3.232576, 1.788962, 0, 0, 0.7798843, 0.6259237, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+104, 195704, 648, 0, 0, 1, '172', 0, 993.1771, 3852.282, 2.818956, 2.705255, 0, 0, 0.9762955, 0.2164421, 120, 255, 1, 27481), -- Arcane Cage (Area: -Unknown- - Difficulty: 1)
(@OGUID+105, 164762, 648, 0, 0, 1, '172', 0, 928.0203, 3899.18, 3.228579, 1.527163, 0, 0, 0.6915131, 0.7223639, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+106, 164759, 648, 0, 0, 1, '172', 0, 929.8135, 3903.148, 3.195778, 1.527163, 0, 0, 0.6915131, 0.7223639, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+107, 164761, 648, 0, 0, 1, '172', 0, 927.9946, 3901.031, 3.228579, 4.747299, 0, 0, -0.6946573, 0.7193408, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+108, 164760, 648, 0, 0, 1, '172', 0, 929.7688, 3904.955, 3.195778, 4.747299, 0, 0, -0.6946573, 0.7193408, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+109, 164763, 648, 0, 0, 1, '172', 0, 923.374, 3901.057, 3.228719, 5.628688, 0, 0, -0.3214388, 0.9469303, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+110, 164764, 648, 0, 0, 1, '172', 0, 924.7684, 3899.948, 3.228719, 2.408554, 0, 0, 0.9335804, 0.358368, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+111, 164765, 648, 0, 0, 1, '172', 0, 913.546, 3902.049, 3.231113, 4.747299, 0, 0, -0.6946573, 0.7193408, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+112, 164766, 648, 0, 0, 1, '172', 0, 913.5956, 3900.525, 3.231113, 1.527163, 0, 0, 0.6915131, 0.7223639, 120, 255, 1, 27481), -- Wooden Chair (Area: -Unknown- - Difficulty: 1)
(@OGUID+113, 195707, 648, 0, 0, 1, '179', 0, 993.1771, 3852.282, 2.818956, 2.705255, 0, 0, 0.9762955, 0.2164421, 120, 255, 0, 27481), -- Arcane Cage (Area: -Unknown- - Difficulty: 1)
(@OGUID+114, 196439, 648, 0, 0, 1, '179', 0, 878.6702, 2741.236, 123.2292, 5.078908, -0.01199198, -0.00682354, -0.5664139, 0.8240054, 120, 255, 1, 27481); -- Rocket Sling (Area: -Unknown- - Difficulty: 1)
DELETE FROM `gameobject_addon` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+114;
INSERT INTO `gameobject_addon` (`guid`, `parent_rotation0`, `parent_rotation1`, `parent_rotation2`, `parent_rotation3`) VALUES
(@OGUID+88, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+89, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+90, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+91, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+92, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+93, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+94, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+95, 0, 0, 0.7313537, 0.6819984), -- Wooden Chair
(@OGUID+96, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+97, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+98, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+99, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+100, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+101, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+102, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+103, 0, 0, 0.5299193, 0.8480481), -- Wooden Chair
(@OGUID+105, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+106, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+107, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+108, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+109, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+110, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+111, 0, 0, 0.4146933, 0.9099613), -- Wooden Chair
(@OGUID+112, 0, 0, 0.4146933, 0.9099613); -- Wooden Chair

DELETE FROM `creature_template_addon` WHERE `entry` IN (36470 /*36470 (Foreman Dampwick)*/, 38111 /*38111 (Wild Clucker) - Cluster Cluck: Wild Clucker Loot FX*/, 36681 /*36681 (Ravenous Lurker) - Infrared = Infradead: Heat Signature Aura - Beast*/, 36525 /*36525 (Warrior-Matic NX-01)*/, 36463 /*36463 (Gobber)*/, 36518 /*36518 (Bamm Megabomb)*/, 36428 /*36428 (Ace)*/, 36524 /*36524 (Slinky Sharpshiv)*/, 36425 /*36425 (Sassy Hardwrench)*/, 36501 /*36501 (Grimy Greasefingers)*/, 36521 /*36521 (Maxx Avalanche) - Lightning Shield*/, 36519 /*36519 (Evol Fingers)*/, 36468 /*36468 (Candy Cane)*/, 36469 /*36469 (Chip Endale)*/, 36429 /*36429 (Izzy)*/, 36467 /*36467 (Sally "Salvager" Sandscrew)*/, 36523 /*36523 (Sister Goldskimmer)*/, 36417 /*36417 (Kilag Gorefang)*/, 36520 /*36520 (Fizz Lighter)*/, 36421 /*36421 (Orc Survivor)*/, 36466 /*36466 (Brett "Coins" McQuid)*/, 36188 /*36188 (Thrall)*/, 36426 /*36426 (Goblin Survivor)*/, 36418 /*36418 (Aggra)*/, 36424 /*36424 (Scout Brax)*/, 36465 /*36465 (Chawg)*/, 36422 /*36422 (Orc Scout)*/, 36423 /*36423 (Orc Battlesworn)*/, 36354 /*36354 (Gyrochoppa Pilot) - Permanent Feign Death*/, 36348 /*36348 (SI:7 Operative) - Permanent Feign Death*/, 36161 /*36161 (Thrall)*/, 36177 /*36177 (Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4))*/, 36176 /*36176 (Alliance Sailor)*/, 36145 /*36145 (Thrall)*/, 36621 /*36621 (Alliance Wizard) - Arcane Channeling*/, 36153 /*36153 (Alliance Captain)*/, 36149 /*36149 (Alliance Sailor)*/, 36129 /*36129 (Gyrochoppa Pilot)*/, 36464 /*36464 (Chawg)*/, 36117 /*36117 (Kilag Gorefang)*/, 36115 /*36115 (Aggra)*/, 36103 /*36103 (SI:7 Operative)*/, 36104 /*36104 (Orc Battlesworn)*/, 36127 /*36127 (Gyrochoppa)*/, 36112 /*36112 (Scout Brax) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36092 /*36092 (SI:7 Assassin) - Infrared = Infradead: SI:7 Assassin Aura, Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35917 /*35917 (Kilag Gorefang) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36063 /*36063 (Orc Scout) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36342 /*36342 (Smart Mining Monkey) - Permanent Feign Death*/, 36344 /*36344 (Frightened Miner) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35929 /*35929 (Poison Spitter) - Permanent Feign Death*/, 35928 /*35928 (Freezya) - Permanent Feign Death*/, 39655 /*39655 (Orc Survivor) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35891 /*35891 (SI:7 Infiltrator) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36578 /*36578 (Bastia) - Infrared = Infradead: Heat Signature Aura - Beast*/, 35882 /*35882 (Orc Survivor) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35875 /*35875 (Aggra) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35894 /*35894 (Orc Scout)*/, 35893 /*35893 (Kilag Gorefang)*/, 36432 /*36432 (Chawg) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36682 /*36682 (The Hammer) - Infrared = Infradead: Heat Signature Aura - Beast*/, 37896 /*37896 (Capturing The Unknown - Bunny 3) - Capturing The Unknown: Bunny 3 Invis & State Visual*/, 37897 /*37897 (Capturing The Unknown - Bunny 4) - Capturing The Unknown: Bunny 4 Invis & State Visual*/, 37895 /*37895 (Capturing The Unknown - Bunny 2) - Capturing The Unknown: Bunny 2 Invis & State Visual*/, 37872 /*37872 (Capturing The Unknown - Bunny 1) - Capturing The Unknown: Bunny 1 Invis & State Visual*/, 35769 /*35769 (Foreman Dampwick) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35904 /*35904 (Jungle Cat) - Infrared = Infradead: Heat Signature Aura - Beast*/, 35810 /*35810 (Frightened Miner) - Permanent Feign Death*/, 36042 /*36042 (Orc Scout) - Ride Vehicle Hardcoded*/, 35995 /*35995 (Strangle Vine) - Strangle Vine: Entangling Roots Visual*/, 35896 /*35896 (Poison Spitter)*/, 35897 /*35897 (Freezya)*/, 35838 /*35838 (Pygmy Witchdoctor) - Shadow Channelling*/, 35837 /*35837 (Dead Orc Scout) - Permanent Feign Death*/, 35812 /*35812 (Smart Mining Monkey)*/, 36404 /*36404 (Candy Cane) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36406 /*36406 (Chip Endale) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36403 /*36403 (Trade Prince Gallywix) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35786 /*35786 (Maxx Avalanche) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), Flametongue Weapon*/, 35780 /*35780 (Fizz Lighter) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36740 /*36740 (Teraptor Hatchling) - Infrared = Infradead: Heat Signature Aura - Beast*/, 35805 /*35805 (Sister Goldskimmer) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 38738 /*38738 (Coach Crosscheck) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35758 /*35758 (Bamm Megabomb) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36383 /*36383 (Jumping Monkey) - Infrared = Infradead: Heat Signature Aura - Beast*/, 35778 /*35778 (Evol Fingers) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35650 /*35650 (Sassy Hardwrench) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 34699 /*34699 (Bomb-Throwing Monkey) - Infrared = Infradead: Heat Signature Aura - Beast*/, 36496 /*36496 (Grimy Greasefingers) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 38432 /*38432 (Megs Dreadshredder) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 35806 /*35806 (Slinky Sharpshiv) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), Stealth*/, 35807 /*35807 (Warrior-Matic NX-01)*/, 36427 /*36427 (Brett "Coins" McQuid) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36430 /*36430 (Sally "Salvager" Sandscrew) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36615 /*36615 (Doc Zapnozzle) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 68989 /*68989 (Beastblast Babblesnaff)*/, 36180 /*36180 (Ace) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36186 /*36186 (Gobber) - Infrared = Infradead: Heat Signature Aura - Humanoid (120%)*/, 36184 /*36184 (Izzy) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36507 /*36507 (Crab) - Infrared = Infradead: Heat Signature Aura - Beast (50%)*/, 36179 /*36179 (Goblin Survivor) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)*/, 36721 /*36721 (Island Turtle) - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)*/, 36732 /*36732 (Ancient Island Turtle) - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)*/, 39169 /*39169 (Lost Isles Mail Bird) - Lost Isles Mail Bird: Mail Bag - Hold*/);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `auras`) VALUES
(36470, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36470 (Foreman Dampwick)
(38111, 0, 0, 0, 1, 0, 0, 0, 0, '66727'), -- 38111 (Wild Clucker) - Cluster Cluck: Wild Clucker Loot FX
(36681, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- 36681 (Ravenous Lurker) - Infrared = Infradead: Heat Signature Aura - Beast
(36525, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36525 (Warrior-Matic NX-01)
(36463, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36463 (Gobber)
(36518, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36518 (Bamm Megabomb)
(36428, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36428 (Ace)
(36524, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36524 (Slinky Sharpshiv)
(36425, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36425 (Sassy Hardwrench)
(36501, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36501 (Grimy Greasefingers)
(36521, 0, 0, 0, 1, 0, 0, 0, 0, '12550'), -- 36521 (Maxx Avalanche) - Lightning Shield
(36519, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36519 (Evol Fingers)
(36468, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36468 (Candy Cane)
(36469, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36469 (Chip Endale)
(36429, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36429 (Izzy)
(36467, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36467 (Sally "Salvager" Sandscrew)
(36523, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36523 (Sister Goldskimmer)
(36417, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36417 (Kilag Gorefang)
(36520, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36520 (Fizz Lighter)
(36421, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36421 (Orc Survivor)
(36466, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36466 (Brett "Coins" McQuid)
(36188, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36188 (Thrall)
(36426, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36426 (Goblin Survivor)
(36418, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36418 (Aggra)
(36424, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36424 (Scout Brax)
(36465, 0, 0, 0, 0, 0, 0, 0, 0, ''), -- 36465 (Chawg)
(36422, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- 36422 (Orc Scout)
(36423, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36423 (Orc Battlesworn)
(36354, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 36354 (Gyrochoppa Pilot) - Permanent Feign Death
(36348, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 36348 (SI:7 Operative) - Permanent Feign Death
(36161, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36161 (Thrall)
(36177, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36177 (Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4))
(36176, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36176 (Alliance Sailor)
(36145, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36145 (Thrall)
(36621, 0, 0, 0, 1, 0, 0, 0, 0, '54219'), -- 36621 (Alliance Wizard) - Arcane Channeling
(36153, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36153 (Alliance Captain)
(36149, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36149 (Alliance Sailor)
(36129, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36129 (Gyrochoppa Pilot)
(36464, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36464 (Chawg)
(36117, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36117 (Kilag Gorefang)
(36115, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36115 (Aggra)
(36103, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36103 (SI:7 Operative)
(36104, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36104 (Orc Battlesworn)
(36127, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 36127 (Gyrochoppa)
(36112, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36112 (Scout Brax) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36092, 0, 0, 196608, 1, 0, 0, 0, 0, '68322 68327'), -- 36092 (SI:7 Assassin) - Infrared = Infradead: SI:7 Assassin Aura, Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35917, 0, 0, 0, 2, 0, 0, 0, 0, '68327'), -- 35917 (Kilag Gorefang) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36063, 0, 0, 8, 2, 0, 0, 0, 0, '68327'), -- 36063 (Orc Scout) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36342, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 36342 (Smart Mining Monkey) - Permanent Feign Death
(36344, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36344 (Frightened Miner) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35929, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 35929 (Poison Spitter) - Permanent Feign Death
(35928, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 35928 (Freezya) - Permanent Feign Death
(39655, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 39655 (Orc Survivor) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35891, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35891 (SI:7 Infiltrator) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36578, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- 36578 (Bastia) - Infrared = Infradead: Heat Signature Aura - Beast
(35882, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35882 (Orc Survivor) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35875, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35875 (Aggra) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35894, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- 35894 (Orc Scout)
(35893, 0, 0, 0, 2, 0, 0, 0, 0, ''), -- 35893 (Kilag Gorefang)
(36432, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36432 (Chawg) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36682, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- 36682 (The Hammer) - Infrared = Infradead: Heat Signature Aura - Beast
(37896, 0, 0, 50397184, 1, 0, 0, 0, 0, '70687'), -- 37896 (Capturing The Unknown - Bunny 3) - Capturing The Unknown: Bunny 3 Invis & State Visual
(37897, 0, 0, 50397184, 1, 0, 0, 0, 0, '70688'), -- 37897 (Capturing The Unknown - Bunny 4) - Capturing The Unknown: Bunny 4 Invis & State Visual
(37895, 0, 0, 50397184, 1, 0, 0, 0, 0, '70686'), -- 37895 (Capturing The Unknown - Bunny 2) - Capturing The Unknown: Bunny 2 Invis & State Visual
(37872, 0, 0, 50397184, 1, 0, 0, 0, 0, '68231'), -- 37872 (Capturing The Unknown - Bunny 1) - Capturing The Unknown: Bunny 1 Invis & State Visual
(35769, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35769 (Foreman Dampwick) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35904, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- 35904 (Jungle Cat) - Infrared = Infradead: Heat Signature Aura - Beast
(35810, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 35810 (Frightened Miner) - Permanent Feign Death
(36042, 0, 0, 0, 1, 0, 0, 0, 0, '46598'), -- 36042 (Orc Scout) - Ride Vehicle Hardcoded
(35995, 0, 0, 0, 1, 0, 0, 0, 0, '68295'), -- 35995 (Strangle Vine) - Strangle Vine: Entangling Roots Visual
(35896, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 35896 (Poison Spitter)
(35897, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 35897 (Freezya)
(35838, 0, 0, 0, 1, 0, 0, 0, 0, '51733'), -- 35838 (Pygmy Witchdoctor) - Shadow Channelling
(35837, 0, 0, 0, 1, 0, 0, 0, 0, '29266'), -- 35837 (Dead Orc Scout) - Permanent Feign Death
(35812, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 35812 (Smart Mining Monkey)
(36404, 0, 0, 65541, 1, 0, 0, 0, 0, '68327'), -- 36404 (Candy Cane) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36406, 0, 0, 65536, 1, 0, 0, 0, 0, '68327'), -- 36406 (Chip Endale) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36403, 0, 0, 65536, 1, 0, 0, 0, 0, '68327'), -- 36403 (Trade Prince Gallywix) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35786, 0, 0, 0, 1, 0, 0, 0, 0, '68327 78273'), -- 35786 (Maxx Avalanche) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), Flametongue Weapon
(35780, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35780 (Fizz Lighter) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36740, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- 36740 (Teraptor Hatchling) - Infrared = Infradead: Heat Signature Aura - Beast
(35805, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35805 (Sister Goldskimmer) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(38738, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 38738 (Coach Crosscheck) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35758, 0, 0, 0, 2, 0, 0, 0, 0, '68327'), -- 35758 (Bamm Megabomb) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36383, 0, 0, 50331648, 1, 0, 0, 0, 0, '76354'), -- 36383 (Jumping Monkey) - Infrared = Infradead: Heat Signature Aura - Beast
(35778, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35778 (Evol Fingers) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35650, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 35650 (Sassy Hardwrench) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(34699, 0, 0, 0, 1, 0, 0, 0, 0, '76354'), -- 34699 (Bomb-Throwing Monkey) - Infrared = Infradead: Heat Signature Aura - Beast
(36496, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36496 (Grimy Greasefingers) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(38432, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 38432 (Megs Dreadshredder) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(35806, 0, 0, 0, 1, 0, 0, 0, 0, '68327 80264'), -- 35806 (Slinky Sharpshiv) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%), Stealth
(35807, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 35807 (Warrior-Matic NX-01)
(36427, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36427 (Brett "Coins" McQuid) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36430, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36430 (Sally "Salvager" Sandscrew) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36615, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36615 (Doc Zapnozzle) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(68989, 0, 0, 0, 1, 0, 0, 0, 0, ''), -- 68989 (Beastblast Babblesnaff)
(36180, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- 36180 (Ace) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36186, 0, 0, 0, 1, 0, 0, 0, 0, '76356'), -- 36186 (Gobber) - Infrared = Infradead: Heat Signature Aura - Humanoid (120%)
(36184, 0, 0, 1, 1, 0, 0, 0, 0, '68327'), -- 36184 (Izzy) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36507, 0, 0, 0, 1, 0, 0, 0, 0, '76367'), -- 36507 (Crab) - Infrared = Infradead: Heat Signature Aura - Beast (50%)
(36179, 0, 0, 0, 1, 0, 0, 0, 0, '68327'), -- 36179 (Goblin Survivor) - Infrared = Infradead: Heat Signature Aura - Humanoid (80%)
(36721, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- 36721 (Island Turtle) - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(36732, 0, 0, 0, 1, 0, 0, 0, 0, '76371'), -- 36732 (Ancient Island Turtle) - Infrared = Infradead: Heat Signature Aura - Humanoid (175%)
(39169, 0, 0, 0, 1, 0, 0, 0, 0, '73558'); -- 39169 (Lost Isles Mail Bird) - Lost Isles Mail Bird: Mail Bag - Hold


DELETE FROM `creature_template_scaling` WHERE `Entry` IN (36470, 36681, 36525, 36463, 36518, 36428, 36524, 36425, 36501, 36521, 36519, 36468, 36469, 36429, 36467, 36523, 36417, 36520, 36421, 36466, 36418, 36424, 36465, 36422, 36423, 36354, 36348, 36176, 36621, 36153, 36149, 36129, 36464, 36117, 36115, 36103, 36104, 36127, 36112, 36092, 35917, 36063, 36342, 36344, 35929, 35928, 39655, 35891, 36578, 35882, 35875, 35894, 35893, 36432, 36682, 35769, 35904, 35810, 36042, 35995, 35896, 35897, 35838, 35837, 35812, 36404, 36406, 35786, 35780, 36740, 35805, 38738, 35758, 36383, 35778, 35650, 34699, 36496, 38432, 35806, 35807, 36427, 36430, 36615, 36180, 36186, 36184, 36732, 36600, 36719, 34763);
INSERT INTO `creature_template_scaling` (`Entry`, `LevelScalingMin`, `LevelScalingMax`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `VerifiedBuild`) VALUES
(36470, 5, 20, 0, 0, 27481),
(36681, 5, 20, 0, 1, 27481),
(36525, 5, 20, 0, 0, 27481),
(36463, 5, 20, 0, 0, 27481),
(36518, 5, 20, 0, 0, 27481),
(36428, 5, 20, 0, 0, 27481),
(36524, 5, 20, 0, 0, 27481),
(36425, 5, 20, 0, 0, 27481),
(36501, 5, 20, 0, 0, 27481),
(36521, 5, 20, 0, 0, 27481),
(36519, 5, 20, 0, 0, 27481),
(36468, 5, 20, 0, 0, 27481),
(36469, 5, 20, 0, 0, 27481),
(36429, 5, 20, 0, 0, 27481),
(36467, 5, 20, 0, 0, 27481),
(36523, 5, 20, 0, 0, 27481),
(36417, 5, 20, 0, 0, 27481),
(36520, 5, 20, 0, 0, 27481),
(36421, 5, 20, 0, 1, 27481),
(36466, 5, 20, 0, 0, 27481),
(36418, 5, 20, 0, 0, 27481),
(36424, 5, 20, 0, 0, 27481),
(36465, 5, 20, 0, 0, 27481),
(36422, 5, 20, 0, 1, 27481),
(36423, 5, 20, 0, 0, 27481),
(36354, 5, 20, 0, 0, 27481),
(36348, 5, 20, 0, 1, 27481),
(36176, 5, 20, -1, 0, 27481),
(36621, 5, 20, 0, 0, 27481),
(36153, 5, 20, 0, 0, 27481),
(36149, 5, 20, -1, 0, 27481),
(36129, 5, 20, 0, 0, 27481),
(36464, 5, 20, 0, 0, 27481),
(36117, 5, 20, 0, 0, 27481),
(36115, 5, 20, 0, 0, 27481),
(36103, 5, 20, 0, 1, 27481),
(36104, 5, 20, 0, 0, 27481),
(36127, 5, 20, 0, 0, 27481),
(36112, 5, 20, 0, 0, 27481),
(36092, 5, 20, -1, 0, 27481),
(35917, 5, 20, 0, 0, 27481),
(36063, 5, 20, 0, 1, 27481),
(36342, 5, 20, -1, 0, 27481),
(36344, 5, 20, 0, 0, 27481),
(35929, 5, 20, 0, 1, 27481),
(35928, 5, 20, -1, 0, 27481),
(39655, 5, 20, 0, 1, 27481),
(35891, 5, 20, 0, 0, 27481),
(36578, 5, 20, 0, 0, 27481),
(35882, 5, 20, 0, 1, 27481),
(35875, 5, 20, 0, 0, 27481),
(35894, 5, 20, 0, 1, 27481),
(35893, 5, 20, 0, 0, 27481),
(36432, 5, 20, 0, 0, 27481),
(36682, 5, 20, 0, 0, 27481),
(35769, 5, 20, 0, 0, 27481),
(35904, 5, 20, -1, 0, 27481),
(35810, 5, 20, 0, 0, 27481),
(36042, 5, 20, 0, 0, 27481),
(35995, 5, 20, 0, 1, 27481),
(35896, 5, 20, -1, 0, 27481),
(35897, 5, 20, 0, 1, 27481),
(35838, 5, 20, 0, 0, 27481),
(35837, 5, 20, 0, 0, 27481),
(35812, 5, 20, -1, 0, 27481),
(36404, 5, 20, 0, 0, 27481),
(36406, 5, 20, 0, 0, 27481),
(35786, 5, 20, 0, 0, 27481),
(35780, 5, 20, 0, 0, 27481),
(36740, 5, 20, -1, 0, 27481),
(35805, 5, 20, 0, 0, 27481),
(38738, 5, 20, 0, 0, 27481),
(35758, 5, 20, 0, 0, 27481),
(36383, 5, 20, -1, 0, 27481),
(35778, 5, 20, 0, 0, 27481),
(35650, 5, 20, 0, 0, 27481),
(34699, 5, 20, 0, 1, 27481),
(36496, 5, 20, 0, 0, 27481),
(38432, 5, 20, 0, 0, 27481),
(35806, 5, 20, 0, 0, 27481),
(35807, 5, 20, 0, 0, 27481),
(36427, 5, 20, 0, 0, 27481),
(36430, 5, 20, 0, 0, 27481),
(36615, 5, 20, 0, 0, 27481),
(36180, 5, 20, 0, 0, 27481),
(36186, 5, 20, 0, 0, 27481),
(36184, 5, 20, 0, 0, 27481),
(36732, 5, 20, -1, -1, 27481),
(36600, 5, 20, 0, 0, 27481),
(36719, 5, 20, 0, 1, 27481),
(34763, 5, 20, -1, 0, 27481);



UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30970;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30969;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30971;
UPDATE `creature_model_info` SET `BoundingRadius`=3.978021, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=2851;
UPDATE `creature_model_info` SET `BoundingRadius`=3.978021, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=12197;
UPDATE `creature_model_info` SET `BoundingRadius`=3.978021, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=12198;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30014;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=38689;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30237;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30035;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30031;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30034;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30032;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30033;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30013;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30018;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30017;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30010;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30012;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30011;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30015;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=22719;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29994;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29979;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29981;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29980;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29982;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29943;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=5233;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29944;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29947;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29948;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29942;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29945;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29936;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29950;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30116;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29951;
UPDATE `creature_model_info` SET `BoundingRadius`=29.83516, `CombatReach`=11.25, `VerifiedBuild`=27481 WHERE `DisplayID`=26216;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=2176;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30123;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29927;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29913;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29925;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29926;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2557212, `VerifiedBuild`=27481 WHERE `DisplayID`=6295;
UPDATE `creature_model_info` SET `BoundingRadius`=0.795, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=599;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29952;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30135;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30127;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29924;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29954;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29953;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29999;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30138;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30165;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30129;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30140;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30043;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=11686;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=1418;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=32111;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29933;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2557212, `VerifiedBuild`=27481 WHERE `DisplayID`=1924;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2557212, `VerifiedBuild`=27481 WHERE `DisplayID`=901;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=1141;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2557212, `VerifiedBuild`=27481 WHERE `DisplayID`=6297;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30104;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30105;
UPDATE `creature_model_info` SET `BoundingRadius`=0.6885476, `CombatReach`=1.8, `VerifiedBuild`=27481 WHERE `DisplayID`=75730;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29918;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29917;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30306;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29922;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30513;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29912;
UPDATE `creature_model_info` SET `BoundingRadius`=0.8048676, `VerifiedBuild`=27481 WHERE `DisplayID`=30184;
UPDATE `creature_model_info` SET `BoundingRadius`=0.8048676, `VerifiedBuild`=27481 WHERE `DisplayID`=30187;
UPDATE `creature_model_info` SET `BoundingRadius`=0.8048676, `VerifiedBuild`=27481 WHERE `DisplayID`=30186;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29916;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29889;
UPDATE `creature_model_info` SET `BoundingRadius`=0.8048676, `VerifiedBuild`=27481 WHERE `DisplayID`=30185;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30142;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29386;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=31090;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29923;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29350;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29383;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30115;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30114;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30227;
UPDATE `creature_model_info` SET `BoundingRadius`=0.306, `CombatReach`=1.5, `VerifiedBuild`=27481 WHERE `DisplayID`=47037;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29385;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=21999;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30051;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=32385;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30053;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=5558;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=29384;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=27677;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=17654;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2875962, `CombatReach`=0.375, `VerifiedBuild`=27481 WHERE `DisplayID`=32790;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2875962, `CombatReach`=0.375, `VerifiedBuild`=27481 WHERE `DisplayID`=32789;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2875962, `CombatReach`=0.375, `VerifiedBuild`=27481 WHERE `DisplayID`=32791;
UPDATE `creature_model_info` SET `BoundingRadius`=0.2875962, `CombatReach`=0.375, `VerifiedBuild`=27481 WHERE `DisplayID`=45880;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30303;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=30219;
UPDATE `creature_model_info` SET `BoundingRadius`=2.214035, `VerifiedBuild`=27481 WHERE `DisplayID`=8410;
UPDATE `creature_model_info` SET `BoundingRadius`=3.978021, `VerifiedBuild`=27481 WHERE `DisplayID`=12200;
UPDATE `creature_model_info` SET `VerifiedBuild`=27481 WHERE `DisplayID`=31344;
UPDATE `creature_model_info` SET `BoundingRadius`=3.978021, `VerifiedBuild`=27481 WHERE `DisplayID`=1557;
UPDATE `creature_model_info` SET `BoundingRadius`=3.978021, `VerifiedBuild`=27481 WHERE `DisplayID`=12199;

DELETE FROM `trainer` WHERE `Id`=877;
INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`) VALUES
(877, 2, 'Here, let me show you how to bind those wounds....', 27481);


DELETE FROM `trainer_spell` WHERE (`TrainerId`=877 AND `SpellId`=7928) OR (`TrainerId`=877 AND `SpellId`=7929) OR (`TrainerId`=877 AND `SpellId`=3278) OR (`TrainerId`=877 AND `SpellId`=3277) OR (`TrainerId`=877 AND `SpellId`=3276) OR (`TrainerId`=877 AND `SpellId`=18630) OR (`TrainerId`=877 AND `SpellId`=10840) OR (`TrainerId`=877 AND `SpellId`=10841) OR (`TrainerId`=877 AND `SpellId`=18629);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES
(877, 7928, 4000, 2540, 150, 0, 0, 0, 0, 27481),
(877, 7929, 4000, 2540, 180, 0, 0, 0, 0, 27481),
(877, 3278, 800, 2540, 115, 0, 0, 0, 0, 27481),
(877, 3277, 200, 2540, 80, 0, 0, 0, 0, 27481),
(877, 3276, 80, 2540, 40, 0, 0, 0, 0, 27481),
(877, 18630, 16000, 2540, 290, 0, 0, 0, 0, 27481),
(877, 10840, 8000, 2540, 210, 0, 0, 0, 0, 27481),
(877, 10841, 8000, 2540, 240, 0, 0, 0, 0, 27481),
(877, 18629, 16000, 2540, 260, 0, 0, 0, 0, 27481);


DELETE FROM `creature_equip_template` WHERE (`CreatureID`=36426 AND `ID`=1) OR (`CreatureID`=36600 AND `ID`=1) OR (`CreatureID`=38432 AND `ID`=2) OR (`CreatureID`=39655 AND `ID`=2) OR (`CreatureID`=35882 AND `ID`=2) OR (`CreatureID`=36179 AND `ID`=2) OR (`CreatureID`=36507 AND `ID`=1) OR (`CreatureID`=36179 AND `ID`=1);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`) VALUES
(36426, 1, 5292, 0, 0, 0, 0, 0, 0, 0, 0), -- Goblin Survivor
(36600, 1, 5292, 0, 0, 0, 0, 0, 0, 0, 0), -- Geargrinder Gizmo
(38432, 2, 50139, 0, 0, 0, 0, 0, 0, 0, 0), -- Megs Dreadshredder
(39655, 2, 1902, 0, 0, 0, 0, 0, 0, 0, 0), -- Orc Survivor
(35882, 2, 1902, 0, 0, 0, 0, 0, 0, 0, 0), -- Orc Survivor
(36179, 2, 1902, 0, 0, 0, 0, 0, 0, 0, 0), -- Goblin Survivor
(36507, 1, 0, 0, 0, 13604, 0, 0, 0, 0, 0), -- Crab
(36179, 1, 17040, 0, 0, 13604, 0, 0, 0, 0, 0); -- Goblin Survivor

UPDATE `creature_equip_template` SET `ItemID1`=33963 WHERE (`CreatureID`=38432 AND `ID`=1); -- Megs Dreadshredder

DELETE FROM `gossip_menu` WHERE (`MenuId`=10808 AND `TextId`=14985) OR (`MenuId`=10722 AND `TextId`=14881) OR (`MenuId`=10555 AND `TextId`=14605) OR (`MenuId`=10792 AND `TextId`=14961) OR (`MenuId`=10793 AND `TextId`=14962) OR (`MenuId`=10826 AND `TextId`=15012) OR (`MenuId`=10816 AND `TextId`=14992) OR (`MenuId`=11075 AND `TextId`=15403) OR (`MenuId`=10795 AND `TextId`=14966) OR (`MenuId`=10794 AND `TextId`=14965) OR (`MenuId`=10817 AND `TextId`=14994) OR (`MenuId`=10814 AND `TextId`=14988) OR (`MenuId`=10819 AND `TextId`=14999) OR (`MenuId`=10818 AND `TextId`=14996) OR (`MenuId`=10815 AND `TextId`=14990) OR (`MenuId`=10714 AND `TextId`=14871) OR (`MenuId`=10713 AND `TextId`=14870) OR (`MenuId`=10708 AND `TextId`=14860) OR (`MenuId`=10671 AND `TextId`=14789) OR (`MenuId`=10677 AND `TextId`=14799) OR (`MenuId`=10823 AND `TextId`=15007) OR (`MenuId`=10550 AND `TextId`=14802) OR (`MenuId`=10549 AND `TextId`=14593) OR (`MenuId`=10552 AND `TextId`=14599) OR (`MenuId`=10551 AND `TextId`=14597) OR (`MenuId`=11074 AND `TextId`=15401) OR (`MenuId`=10553 AND `TextId`=14809) OR (`MenuId`=10791 AND `TextId`=14959) OR (`MenuId`=10805 AND `TextId`=14981) OR (`MenuId`=10554 AND `TextId`=14604) OR (`MenuId`=10720 AND `TextId`=14879) OR (`MenuId`=10721 AND `TextId`=14880) OR (`MenuId`=10790 AND `TextId`=14957);
INSERT INTO `gossip_menu` (`MenuId`, `TextId`, `VerifiedBuild`) VALUES
(10808, 14985, 27481), -- 196439
(10722, 14881, 27481), -- 36463 (Gobber)
(10555, 14605, 27481), -- 36525 (Warrior-Matic NX-01)
(10792, 14961, 27481), -- 36417 (Kilag Gorefang)
(10793, 14962, 27481), -- 36418 (Aggra)
(10826, 15012, 27481), -- 36615 (Doc Zapnozzle)
(10816, 14992, 27481), -- 36520 (Fizz Lighter)
(11075, 15403, 27481), -- 38738 (Coach Crosscheck)
(10795, 14966, 27481), -- 36429 (Izzy)
(10794, 14965, 27481), -- 36428 (Ace)
(10817, 14994, 27481), -- 36521 (Maxx Avalanche)
(10814, 14988, 27481), -- 36518 (Bamm Megabomb)
(10819, 14999, 27481), -- 36524 (Slinky Sharpshiv)
(10818, 14996, 27481), -- 36523 (Sister Goldskimmer)
(10815, 14990, 27481), -- 36519 (Evol Fingers)
(10714, 14871, 27481), -- 36117 (Kilag Gorefang)
(10713, 14870, 27481), -- 36115 (Aggra)
(10708, 14860, 27481), -- 35917 (Kilag Gorefang)
(10671, 14789, 27481), -- 35650 (Sassy Hardwrench)
(10677, 14799, 27481), -- 35769 (Foreman Dampwick)
(10823, 15007, 27481), -- 35769 (Foreman Dampwick)
(10550, 14802, 27481), -- 35778 (Evol Fingers)
(10549, 14593, 27481), -- 35758 (Bamm Megabomb)
(10552, 14599, 27481), -- 35786 (Maxx Avalanche)
(10551, 14597, 27481), -- 35780 (Fizz Lighter)
(11074, 15401, 27481), -- 38738 (Coach Crosscheck)
(10553, 14809, 27481), -- 35805 (Sister Goldskimmer)
(10791, 14959, 27481), -- 36403 (Trade Prince Gallywix)
(10805, 14981, 27481), -- 36496 (Grimy Greasefingers)
(10554, 14604, 27481), -- 35806 (Slinky Sharpshiv)
(10720, 14879, 27481), -- 36180 (Ace)
(10721, 14880, 27481), -- 36184 (Izzy)
(10790, 14957, 27481); -- 36406 (Chip Endale)

UPDATE `gossip_menu` SET `VerifiedBuild`=27481 WHERE (`MenuId`=1221 AND `TextId`=1853); -- 0
UPDATE `gossip_menu` SET `VerifiedBuild`=27481 WHERE (`MenuId`=9821 AND `TextId`=13584); -- 0
UPDATE `gossip_menu` SET `VerifiedBuild`=27481 WHERE (`MenuId`=9821 AND `TextId`=13584); -- 0
DELETE FROM `gossip_menu_option` WHERE (`MenuId`=10708 AND `OptionIndex`=0) OR (`MenuId`=10677 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `VerifiedBuild`) VALUES
(10708, 0, 0, 'Kilag, I... uh, somehow... er, lost my scout.', 36148, 27481),
(10677, 0, 0, 'Er, Dampwick, I need another miner....', 36020, 27481);

UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36458, `VerifiedBuild`=27481 WHERE (`MenuId`=10808 AND `OptionIndex`=0);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=41362, `VerifiedBuild`=27481 WHERE (`MenuId`=10722 AND `OptionIndex`=0);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=3266, `VerifiedBuild`=27481 WHERE (`MenuId`=10826 AND `OptionIndex`=0);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36520, `VerifiedBuild`=27481 WHERE (`MenuId`=10677 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36520, `VerifiedBuild`=27481 WHERE (`MenuId`=10677 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36520, `VerifiedBuild`=27481 WHERE (`MenuId`=10677 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36520, `VerifiedBuild`=27481 WHERE (`MenuId`=10677 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36520, `VerifiedBuild`=27481 WHERE (`MenuId`=10677 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=36520, `VerifiedBuild`=27481 WHERE (`MenuId`=10677 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=4308, `VerifiedBuild`=27481 WHERE (`MenuId`=10805 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=2822, `VerifiedBuild`=27481 WHERE (`MenuId`=10805 AND `OptionIndex`=0);
UPDATE `gossip_menu_option` SET `VerifiedBuild`=27481 WHERE (`MenuId`=9821 AND `OptionIndex`=2);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=56613, `VerifiedBuild`=27481 WHERE (`MenuId`=9821 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `VerifiedBuild`=27481 WHERE (`MenuId`=9821 AND `OptionIndex`=2);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=56613, `VerifiedBuild`=27481 WHERE (`MenuId`=9821 AND `OptionIndex`=1);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=41362, `VerifiedBuild`=27481 WHERE (`MenuId`=10722 AND `OptionIndex`=0);
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`=3266, `VerifiedBuild`=27481 WHERE (`MenuId`=10826 AND `OptionIndex`=0);
DELETE FROM `gossip_menu_option_action` WHERE (`MenuId`=10677 AND `OptionIndex`=1) OR (`MenuId`=10805 AND `OptionIndex`=1);
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(10677, 1, 10823, 0),
(10805, 1, 1221, 0);


DELETE FROM `gossip_menu_option_trainer` WHERE (`MenuId`=10826 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(10826, 0, 877);



UPDATE `creature_template` SET `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36470; -- Foreman Dampwick
UPDATE `creature_template` SET `npcflag`=0, `unit_flags`=32768 WHERE `entry`=38111; -- Wild Clucker
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags`=32768 WHERE `entry`=36681; -- Ravenous Lurker
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33589248 WHERE `entry`=36525; -- Warrior-Matic NX-01
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `speed_run`=1.142857 WHERE `entry`=36463; -- Gobber
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=36518; -- Bamm Megabomb
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36428; -- Ace
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=36524; -- Slinky Sharpshiv
UPDATE `creature_template` SET `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36425; -- Sassy Hardwrench
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=0 WHERE `entry`=36501; -- Grimy Greasefingers
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=3, `unit_flags2`=33556480 WHERE `entry`=36521; -- Maxx Avalanche
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=36519; -- Evol Fingers
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36468; -- Candy Cane
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36469; -- Chip Endale
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36429; -- Izzy
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36467; -- Sally "Salvager" Sandscrew
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=36523; -- Sister Goldskimmer
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36417; -- Kilag Gorefang
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=36520; -- Fizz Lighter
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36421; -- Orc Survivor
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36466; -- Brett "Coins" McQuid
UPDATE `creature_template` SET `speed_run`=1.142857 WHERE `entry`=36188; -- Thrall
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36418; -- Aggra
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36424; -- Scout Brax
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36465; -- Chawg
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36422; -- Orc Scout
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36423; -- Orc Battlesworn
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=36354; -- Gyrochoppa Pilot
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=36348; -- SI:7 Operative
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=24110; -- ELM General Purpose Bunny Large
UPDATE `creature_template` SET `gossip_menu_id`=0, `speed_run`=1.142857, `unit_flags2`=4196352 WHERE `entry`=36161; -- Thrall
UPDATE `creature_template` SET `unit_flags2`=1073743872 WHERE `entry`=36177; -- Invisible Stalker (Floating, Uninteractible, Infinite, Sessile, Quest Phase 4)
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags`=32768 WHERE `entry`=36176; -- Alliance Sailor
UPDATE `creature_template` SET `gossip_menu_id`=0, `speed_run`=1.142857 WHERE `entry`=36145; -- Thrall
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags`=32768 WHERE `entry`=36621; -- Alliance Wizard
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36153; -- Alliance Captain
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36149; -- Alliance Sailor
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36129; -- Gyrochoppa Pilot
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36464; -- Chawg
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36117; -- Kilag Gorefang
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36115; -- Aggra
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36103; -- SI:7 Operative
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36104; -- Orc Battlesworn
UPDATE `creature_template` SET `gossip_menu_id`=0, `minlevel`=5, `maxlevel`=20, `unit_flags2`=4229120 WHERE `entry`=36127; -- Gyrochoppa
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36112; -- Scout Brax
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2099200 WHERE `entry`=36092; -- SI:7 Assassin
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=35917; -- Kilag Gorefang
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36063; -- Orc Scout
UPDATE `creature_template` SET `maxlevel`=20, `speed_walk`=1, `speed_run`=0.8571429, `unit_flags`=570721024, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=36342; -- Smart Mining Monkey
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `speed_walk`=1, `speed_run`=1.142857 WHERE `entry`=36344; -- Frightened Miner
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=35929; -- Poison Spitter
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=35928; -- Freezya
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=39655; -- Orc Survivor
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=35891; -- SI:7 Infiltrator
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=36578; -- Bastia
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=35882; -- Orc Survivor
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=35875; -- Aggra
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=35894; -- Orc Scout
UPDATE `creature_template` SET `gossip_menu_id`=0, `minlevel`=5, `maxlevel`=20 WHERE `entry`=35893; -- Kilag Gorefang
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36432; -- Chawg
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=4196352 WHERE `entry`=36682; -- The Hammer
UPDATE `creature_template` SET `unit_flags2`=34816 WHERE `entry`=37896; -- Capturing The Unknown - Bunny 3
UPDATE `creature_template` SET `unit_flags2`=34816 WHERE `entry`=37897; -- Capturing The Unknown - Bunny 4
UPDATE `creature_template` SET `unit_flags2`=34816 WHERE `entry`=37895; -- Capturing The Unknown - Bunny 2
UPDATE `creature_template` SET `unit_flags2`=34816 WHERE `entry`=37872; -- Capturing The Unknown - Bunny 1
UPDATE `creature_template` SET `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=35769; -- Foreman Dampwick
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags`=32768 WHERE `entry`=35904; -- Jungle Cat
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=35810; -- Frightened Miner
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36042; -- Orc Scout
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=35995; -- Strangle Vine
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=35896; -- Poison Spitter
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=35897; -- Freezya
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `speed_walk`=0.888888 WHERE `entry`=35838; -- Pygmy Witchdoctor
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2049, `unit_flags3`=8192 WHERE `entry`=35837; -- Dead Orc Scout
UPDATE `creature_template` SET `maxlevel`=20, `unit_flags`=32768 WHERE `entry`=35812; -- Smart Mining Monkey
UPDATE `creature_template` SET `gossip_menu_id`=0, `maxlevel`=20 WHERE `entry`=36404; -- Candy Cane
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36406; -- Chip Endale
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=36403; -- Trade Prince Gallywix
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=3, `unit_flags2`=33556480 WHERE `entry`=35786; -- Maxx Avalanche
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=35780; -- Fizz Lighter
UPDATE `creature_template` SET `maxlevel`=20, `unit_flags`=32768 WHERE `entry`=36740; -- Teraptor Hatchling
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=35805; -- Sister Goldskimmer
UPDATE `creature_template` SET `gossip_menu_id`=11074, `maxlevel`=20, `npcflag`=1 WHERE `entry`=38738; -- Coach Crosscheck
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=3, `unit_flags2`=33556480 WHERE `entry`=35758; -- Bamm Megabomb
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2099200 WHERE `entry`=36383; -- Jumping Monkey
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=35778; -- Evol Fingers
UPDATE `creature_template` SET `maxlevel`=20, `unit_flags2`=33556480 WHERE `entry`=35650; -- Sassy Hardwrench
UPDATE `creature_template` SET `maxlevel`=20, `speed_run`=0.8571429, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768 WHERE `entry`=34699; -- Bomb-Throwing Monkey
UPDATE `creature_template` SET `gossip_menu_id`=1221, `minlevel`=5, `maxlevel`=20 WHERE `entry`=36496; -- Grimy Greasefingers
UPDATE `creature_template` SET `gossip_menu_id`=0, `maxlevel`=20, `npcflag`=0, `unit_flags2`=33556480 WHERE `entry`=38432; -- Megs Dreadshredder
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33556480 WHERE `entry`=35806; -- Slinky Sharpshiv
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=1, `unit_flags2`=33589248 WHERE `entry`=35807; -- Warrior-Matic NX-01
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36427; -- Brett "Coins" McQuid
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36430; -- Sally "Salvager" Sandscrew
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `npcflag`=17, `unit_flags2`=33556480 WHERE `entry`=36615; -- Doc Zapnozzle
UPDATE `creature_template` SET `gossip_menu_id`=9821, `npcflag`=4194433, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=68989; -- Beastblast Babblesnaff
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36180; -- Ace
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `speed_run`=1.142857 WHERE `entry`=36186; -- Gobber
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36184; -- Izzy
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20 WHERE `entry`=36732; -- Ancient Island Turtle
UPDATE `creature_template` SET `unit_flags2`=4196352 WHERE `entry`=36735; -- Teraptor Matriarch
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=36600; -- Geargrinder Gizmo
UPDATE `creature_template` SET `minlevel`=5, `maxlevel`=20, `unit_flags2`=2099200 WHERE `entry`=36719; -- Pterrordax Scavenger
UPDATE `creature_template` SET `unit_flags2`=2099200 WHERE `entry`=39169; -- Lost Isles Mail Bird
UPDATE `creature_template` SET `maxlevel`=20 WHERE `entry`=34763; -- Daggertooth Shark

DELETE FROM `creature_text` WHERE `CreatureID` IN (34748, 35649, 35650, 35758, 35769, 35786, 35813, 35838, 35875, 35893, 35917, 36042, 36100, 36112, 36129, 36143, 36161, 36403, 36425, 36470, 36513, 36519, 36600, 36622, 38738);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `comment`) VALUES
(34748, 0, 0, '$n, it\'s you! Thanks, $g man : sweetie;!', 12, 0, 100, 0, 0, 0, 35003, 'Goblin Survivor to Player'),
(34748, 1, 0, '$n? I heard you were dead.', 12, 0, 100, 0, 0, 0, 35005, 'Goblin Survivor to Player'),
(34748, 2, 0, 'Blowing open my escape pod. I like your style, $n!', 12, 0, 100, 0, 0, 0, 35004, 'Goblin Survivor to Player'),
(34748, 3, 0, 'What were those Alliance ships doing firing at us?! Did I see a Horde ship, too?', 12, 0, 100, 0, 0, 0, 35009, 'Goblin Survivor to Player'),
(35649, 0, 0, 'Hello there, $n. So nice of you to rescue me. No hard feelings, right?', 12, 0, 100, 0, 0, 0, 35947, 'Trade Prince Gallywix to Player'),
(35650, 0, 0, 'We need all of our bombs and tools to survive on this deserted island, $n.', 12, 0, 100, 0, 0, 0, 49827, 'Sassy Hardwrench to Player'),
(35650, 1, 0, 'Dampwick\'s at the cave entrance just to the southeast.', 12, 0, 100, 0, 0, 0, 49832, 'Sassy Hardwrench to Player'),
(35650, 2, 0, 'We need some new friends if we\'re going to survive all of this. Hopefully, the orcs won\'t just kill you on sight.', 12, 0, 100, 0, 0, 0, 49835, 'Sassy Hardwrench to Player'),
(35758, 0, 0, 'The monkeys are going to get a kick out of those bananas!', 12, 0, 100, 0, 0, 0, 49830, 'Bamm Megabomb to Player'),
(35758, 1, 0, 'That was the most beautiful thing that I\'ve ever seen!', 12, 0, 100, 0, 0, 0, 49831, 'Bamm Megabomb to Player'),
(35769, 0, 0, 'The kaja\'mite has gone and made these monkeys smart! Keep that miner safe, $n.', 12, 0, 100, 0, 0, 0, 49833, 'Foreman Dampwick to Player'),
(35769, 1, 0, 'On behalf of the Bilgewater Cartel, I lay claim to this mine!', 12, 0, 100, 0, 0, 0, 49834, 'Foreman Dampwick to Player'),
(35786, 0, 0, '$n, you gotta get those teraptor hatchlings before they get us!', 12, 0, 100, 0, 0, 0, 49828, 'Maxx Avalanche to Player'),
(35786, 1, 0, 'Did you hear the matriarch growling up on the cliff? Steer clear of her!', 12, 0, 100, 0, 0, 0, 49829, 'Maxx Avalanche to Player'),
(35813, 0, 0, 'Okay, here we go. You\'re gonna cover me, right?', 12, 0, 100, 0, 0, 0, 35995, 'Frightened Miner to Player'),
(35813, 1, 0, 'Whoa! What\'s with all of the cave paintings? Ack, do I hear monkeys?!', 12, 0, 100, 0, 0, 0, 36102, 'Frightened Miner to Player'),
(35813, 2, 0, 'Let\'s move on.', 12, 0, 100, 0, 0, 0, 36010, 'Frightened Miner to Player'),
(35813, 3, 0, 'I can\'t get anything else out of this one.', 12, 0, 100, 0, 0, 0, 36012, 'Frightened Miner to Player'),
(35813, 4, 0, 'Hey, why am I doing all of the work here?', 12, 0, 100, 0, 0, 0, 36017, 'Frightened Miner to Player'),
(35813, 5, 0, 'That\'s good enough for now. I\'ll make my way out on my own. Thanks for the escort, $n.', 12, 0, 100, 0, 0, 0, 36018, 'Frightened Miner to Player'),
(35838, 0, 0, 'Mkay, m\'ne ta oor!', 14, 0, 100, 0, 0, 0, 36349, 'Pygmy Witchdoctor'),
(35838, 1, 0, 'Sooie nah mi juju, gobin!', 14, 0, 100, 0, 0, 0, 36347, 'Pygmy Witchdoctor'),
(35875, 0, 0, 'Kilag Gorefang should be down the path to the west, goblin.', 12, 0, 100, 0, 0, 0, 49843, 'Aggra to Player'),
(35875, 1, 0, 'Head back through the vale and meetup with Kilag at the Wild Overlook.', 12, 0, 100, 0, 0, 0, 49860, 'Aggra to Player'),
(35893, 0, 0, 'Use your weed whacker to mow down these plants, little goblin!', 12, 0, 100, 0, 0, 0, 49846, 'Kilag Gorefang to Player'),
(35893, 1, 0, 'Go back to Aggra and tell her that we\'re moving northwest.', 12, 0, 100, 0, 0, 0, 49855, 'Kilag Gorefang to Player'),
(35917, 0, 0, 'Use your Infrared Heat Focals!', 42, 0, 100, 0, 0, 0, 36517, 'Kilag Gorefang to Player'),
(35917, 1, 0, 'Ride Bastia! Find Brax!', 12, 0, 100, 0, 0, 0, 49863, 'Kilag Gorefang to Player'),
(36042, 0, 0, 'Lok\'tar!', 12, 0, 100, 0, 0, 0, 36602, 'Orc Scout to Strangle Vine'),
(36042, 1, 0, 'Aka\'Magosh, goblin!', 12, 0, 100, 0, 0, 0, 36601, 'Orc Scout to Strangle Vine'),
(36042, 2, 0, 'My ribs are broken.', 12, 0, 100, 0, 0, 0, 36599, 'Orc Scout to Strangle Vine'),
(36042, 3, 0, 'Throm-Ka, goblin!', 12, 0, 100, 0, 0, 0, 36600, 'Orc Scout to Strangle Vine'),
(36100, 0, 0, 'Don\'t forget to keep your goggles on, $n. That\'s the only way we\'ll spot them before they can jump us.', 12, 0, 100, 0, 0, 0, 36158, 'Orc Scout to Player'),
(36112, 0, 0, 'Get to the gyrochoppa! Do it now!', 14, 0, 100, 0, 0, 0, 36160, 'Scout Brax to Player'),
(36129, 0, 0, 'Hey! Get away from my flying machine!', 12, 0, 100, 0, 0, 0, 36157, 'Gyrochoppa Pilot to Player'),
(36143, 0, 0, 'Find the Precious Cargo!', 42, 0, 100, 0, 0, 0, 36177, 'Gyrochoppa to Player'),
(36161, 0, 0, 'Spirits of the sea, rise and lay waste to my enemies!', 14, 0, 100, 0, 0, 0, 36198, 'Thrall'),
(36403, 0, 0, 'I\'ve got my eye on you, $n. Let\'s just say that only one of us will be leaving this island, and that goblin\'s name begins with Trade Prince!', 14, 0, 100, 0, 0, 0, 36382, 'Trade Prince Gallywix to Player'),
(36425, 0, 0, 'Uh oh, it\'s the Trade Prince.', 12, 0, 100, 0, 0, 0, 49864, 'Sassy Hardwrench to Player'),
(36470, 0, 0, 'Hurry, $n, deploy the Town-In-A-Box. Our people are trapped inside! Oh! I almost forgot your parachute.', 12, 0, 100, 0, 0, 0, 49886, 'Foreman Dampwick to Player'),
(36513, 0, 0, 'You think you\'re such a bigshot, saving everyone and making friends with these orc savages?!', 14, 0, 100, 0, 0, 0, 36460, 'Trade Prince Gallywix to Player'),
(36513, 1, 0, 'I\'m gonna crush you! I\'m the Trade Prince! Me! I gotta plan that\'s gonna get me off of this island and make me the king of Azshara!', 14, 0, 100, 0, 0, 0, 36461, 'Trade Prince Gallywix to Player'),
(36513, 2, 0, 'Mark my words! I\'m gonna get you, $n! I\'ll get you all! Out of my way!', 14, 0, 100, 0, 0, 0, 36462, 'Trade Prince Gallywix to Player'),
(36519, 0, 0, 'Is that a volcano over on that other island?', 12, 0, 100, 0, 0, 0, 36392, 'Evol Fingers'),
(36600, 0, 0, 'Yeah, there\'s tons of people still trapped in the escape pods, boss. Oh, wait. I guess you\'re not the boss anymore. Anyways, they\'re all probably going to drown if you don\'t get them out.', 12, 0, 100, 0, 0, 0, 49824, 'Geargrinder Gizmo to Player'),
(36622, 0, 0, 'I will see you up top, $n. Thank you again for my freedom!', 12, 0, 100, 0, 0, 0, 36558, 'Thrall to Player'),
(38738, 0, 0, 'Alright, people, hold that line!', 12, 0, 100, 0, 0, 0, 38606, 'Coach Crosscheck');

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (36514, 35995);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(36514, 36403, 0, 1, 'Sling Rocket - Trade Prince Gallywix', 5, 0), -- Sling Rocket - Trade Prince Gallywix
(35995, 36042, 0, 0, 'Strangle Vine - Orc Scout', 5, 0); -- Strangle Vine - Orc Scout

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 38111;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(38111, 71170, 1, 0);

UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14245; -- It's a Town-In-A-Box
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14244; -- Up, Up & Away!
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14445; -- Farewell, For Now
UPDATE `quest_template` SET `RewardMoney`=450, `RewardBonusMoney`=90, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14243; -- Warchief's Revenge
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14326; -- Meet Me Up Top
UPDATE `quest_template` SET `RewardMoney`=110, `RewardBonusMoney`=30, `RewardSpell`=69082, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14242; -- Precious Cargo
UPDATE `quest_template` SET `RewardMoney`=175, `RewardBonusMoney`=60, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14241; -- Get to the Gyrochoppa!
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14240; -- To the Cliffs
UPDATE `quest_template` SET `RewardMoney`=175, `RewardBonusMoney`=60, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14238; -- Infrared = Infradead
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14237; -- Forward Movement
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14303; -- Back to Aggra
UPDATE `quest_template` SET `RewardMoney`=175, `RewardBonusMoney`=60, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14236; -- Weed Whacker
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14235; -- The Vicious Vale
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `RewardFactionOverride2`=0, `VerifiedBuild`=27481 WHERE `ID`=14234; -- The Enemy of My Enemy
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14233; -- Orcs Can Write?
UPDATE `quest_template` SET `RewardMoney`=125, `RewardBonusMoney`=30, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14031; -- Capturing the Unknown
UPDATE `quest_template` SET `RewardMoney`=125, `RewardBonusMoney`=30, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14021; -- Miner Troubles
UPDATE `quest_template` SET `RewardBonusMoney`=0, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14248; -- Help Wanted
UPDATE `quest_template` SET `RewardMoney`=125, `RewardBonusMoney`=30, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14019; -- Monkey Business
UPDATE `quest_template` SET `RewardMoney`=125, `RewardBonusMoney`=30, `RewardFactionOverride1`=0, `AllowableRaces`=256, `VerifiedBuild`=27481 WHERE `ID`=14473; -- It's Our Problem Now
UPDATE `quest_template` SET `RewardMoney`=125, `RewardBonusMoney`=30, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14014; -- Get Our Stuff Back!
UPDATE `quest_template` SET `RewardMoney`=200, `RewardBonusMoney`=30, `AllowableRaces`=12261800583900083122, `LogTitle`='WANTED: Thaelis the Hungerer', `VerifiedBuild`=27481 WHERE `ID`=8468; -- Wanted: Thaelis the Hungerer
UPDATE `quest_template` SET `RewardMoney`=75, `RewardBonusMoney`=30, `RewardSpell`=73435, `AllowableRaces`=12261800583900083122, `VerifiedBuild`=27481 WHERE `ID`=24974; -- Ever So Lonely
UPDATE `quest_template` SET `RewardMoney`=100, `RewardBonusMoney`=30, `AllowableRaces`=12261800583900083122, `VerifiedBuild`=27481 WHERE `ID`=14438; -- Sharing the Land
UPDATE `quest_template` SET `RewardMoney`=100, `RewardBonusMoney`=30, `AllowableRaces`=12261800583900083122, `VerifiedBuild`=27481 WHERE `ID`=25170; -- Cleaning Up the Coastline
UPDATE `quest_template` SET `RewardMoney`=100, `RewardBonusMoney`=30, `AllowableRaces`=12261800583900083122, `VerifiedBuild`=27481 WHERE `ID`=25236; -- Thunder Down Under
UPDATE `quest_template` SET `MaxScalingLevel`=120, `RewardMoney`=100, `RewardBonusMoney`=30, `AllowableRaces`=12261800583900083122, `VerifiedBuild`=27481 WHERE `ID`=31812; -- Zunta, The Pet Tamer
UPDATE `quest_template` SET `MaxScalingLevel`=110, `VerifiedBuild`=27481 WHERE `ID`=46736; -- Contribute to Nether Disruptor
UPDATE `quest_template` SET `MaxScalingLevel`=110, `VerifiedBuild`=27481 WHERE `ID`=46735; -- Contribute to Command Center
UPDATE `quest_template` SET `MaxScalingLevel`=110, `VerifiedBuild`=27481 WHERE `ID`=46277; -- Contribute to Mage Tower
UPDATE `quest_template` SET `RewardBonusMoney`=30, `RewardSpell`=68685, `RewardFactionOverride1`=0, `VerifiedBuild`=27481 WHERE `ID`=14001; -- Goblin Escape Pods
UPDATE `quest_template` SET `MaxScalingLevel`=120, `RewardMoney`=100, `RewardBonusMoney`=30, `VerifiedBuild`=27481 WHERE `ID`=32863; -- What We've Been Training For
UPDATE `quest_template` SET `MaxScalingLevel`=120, `RewardMoney`=100, `RewardBonusMoney`=30, `AllowableRaces`=6130900294268439629, `VerifiedBuild`=27481 WHERE `ID`=31902; -- Battle Pet Tamers: Eastern Kingdoms
UPDATE `quest_template` SET `MaxScalingLevel`=120, `RewardMoney`=100, `RewardBonusMoney`=30, `AllowableRaces`=6130900294268439629, `VerifiedBuild`=27481 WHERE `ID`=31889; -- Battle Pet Tamers: Kalimdor


UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264005; -- 264005
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=266658; -- 266658
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265514; -- 265514
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264244; -- 264244
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264122; -- 264122
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265547; -- 265547
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=253935; -- 253935
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264508; -- 264508
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=267212; -- 267212
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264964; -- 264964
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264963; -- 264963
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264962; -- 264962
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264961; -- 264961
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265970; -- 265970
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265386; -- 265386
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265667; -- 265667
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264944; -- 264944
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=259624; -- 259624
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=267187; -- 267187
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=267186; -- 267186
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=264756; -- 264756
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265539; -- 265539
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=265482; -- 265482
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269048; -- 269048
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=289536; -- 289536
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=289535; -- 289535
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=289167; -- 289167
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=267194; -- 267194
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=270529; -- 270529
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269180; -- 269180
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269179; -- 269179
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269178; -- 269178
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269177; -- 269177
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269176; -- 269176
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269150; -- 269150
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269149; -- 269149
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269148; -- 269148
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269147; -- 269147
UPDATE `quest_objectives` SET `VerifiedBuild`=27481 WHERE `ID`=269145; -- 269145


UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=259624 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269048 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269180 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269179 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269178 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269177 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269176 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269150 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269149 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269148 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269147 AND `Index`=0);
UPDATE `quest_visual_effect` SET `VerifiedBuild`=27481 WHERE (`ID`=269145 AND `Index`=0);


UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=201938; -- Town-In-A-Box Plunger
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=196439; -- Rocket Sling
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=195707; -- Arcane Cage
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=195704; -- Arcane Cage
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164766; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164765; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164764; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164763; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164762; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164761; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164760; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=164759; -- Wooden Chair
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=196397; -- Rope Ladder
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=196396; -- Rope Ladder
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=196386; -- Bonfire
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=195622; -- Kaja'mite Ore
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=199328; -- Candy Cane's Parasol
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=196458; -- Candy Cane's Chair
UPDATE `gameobject_template` SET `Data1`=27287, `VerifiedBuild`=27481 WHERE `entry`=195201; -- Crate of Tools
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=202536; -- Mailbox
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=195694; -- Bonfire
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=202494; -- Campfire
UPDATE `gameobject_template` SET `VerifiedBuild`=27481 WHERE `entry`=202495; -- Campfire
UPDATE `gameobject_template` SET `Data13`=0, `Data26`=1, `VerifiedBuild`=27481 WHERE `entry`=195188; -- Goblin Escape Pod


UPDATE `gameobject_questitem` SET `VerifiedBuild`=27481 WHERE (`GameObjectEntry`=195201 AND `Idx`=0); -- Crate of Tools

UPDATE creature_template SET inhabitType = 4 WHERE entry IN (36719, 37872, 37895, 37896, 37897, 36177);
