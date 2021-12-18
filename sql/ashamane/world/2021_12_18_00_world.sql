-- Set goblin start point to Kezan instead of Valley of Trials.
UPDATE `ashamane_world`.`playercreateinfo` SET `position_x` = -8423.685, `position_y` = 1363.726, `position_z` = 104.678, `orientation` = 1.560240, `map` = 648, `zone` = 4737 WHERE `race` = 9;

-- Set Worgen start point to Gilneas instead of Nortshire Abbey.
UPDATE `ashamane_world`.`playercreateinfo` SET `position_x` = -1451.372681, `position_y` = 1401.711792, `position_z` = 35.557007, `orientation` = 6.275496, `map` = 654, `zone` = 4755 WHERE `race` = 22;