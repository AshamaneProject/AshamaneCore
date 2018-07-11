-- INSERT INTO THE HOTFIX DATABASE --
DELETE FROM `broadcast_text` WHERE `ID` IN (147222, 147231, 147229, 147228, 147223, 147224, 147226, 147233);
INSERT INTO `broadcast_text` (`ID`, `Text`, `Text1`, `VerifiedBuild`) VALUES
(147222, '', 'The Alliance needs strength. Unity. The king''s plan to bring in fresh blood is a good one.\n\nBut I can''t help thinking of my own Dark Iron clan. Of the fractures that divide us.', 26972),
(147231, '', '<Tyrande says nothing. Her brow is furrowed, as if deep in thought.>', 26972),
(147229, '', 'It seems like only yesterday that those of us who follow the way of the Tushui pledged to fight for the Alliance. \n\nThough I have great respect for King Anduin, I must confess that I found his father a more capable sparring partner.\n\nPlease do not tell him this.\n\n<Aysa bows.>', 26972),
(147228, 'The young king reminds me so much of his father. More than he realizes, I think.\n\nHe''s the right person to lead this effort and bring new faces into the Alliance.', '', 26972),
(147223, '', 'One day Silvermoon will stand again on the side of the Alliance. I know it.', 26972),
(147224, 'Much about Azeroth has changed in the years I was absent. But the Alliance remains an ideal worth fighting for.\n\nI will do everything in my power to make it stronger.', '', 26972),
(147226, 'The campaign on Argus was costly, but necessary. Now we must focus on defending our own lands.\n\nWe cannot sit idle while those Horde monsters build their forces.', '', 26972),
(147233, 'I have spent too long depending on visions to guide me.\n\nIt is time we forge our own fate. Part of that is finding new allies to stand beside us.', '', 26972);
