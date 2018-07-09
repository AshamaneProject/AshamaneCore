SET @PHASE_169  = 172329;
SET @PHASE_170  = 59073;
SET @PHASE_171  = 59074;

-- Sylvanas --
UPDATE creature SET PhaseId = 170, position_x = 4899.977, position_y = 2208.158, position_z = 638.8166, orientation = 0.3490658, VerifiedBuild = 26972 WHERE guid = 20548883;

-- Lady Proudmore --
UPDATE creature SET PhaseId = 171, position_x = 4901.254, position_y = 2206.861, position_z = 638.8166, orientation = 5.88176, VerifiedBuild = 26972 WHERE guid = 351792;

-- Phasing --
INSERT INTO spell_area (`spell`, `area`, `teamid`, `flags`) VALUES 
(@PHASE_170, 4809, 1, 3),
(@PHASE_169, 4809, 1, 3),
(@PHASE_171, 4809, 0, 3),
(@PHASE_169, 4809, 0, 3);

-- QuestLine Fixes --