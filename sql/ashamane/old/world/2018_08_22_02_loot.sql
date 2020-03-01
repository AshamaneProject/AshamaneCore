DELETE FROM creature_loot_template WHERE (Entry = 83746);
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(83746, 0, 83746, 100, 0, 1, 0, 2, 3, 'Faucon des flèches solaire');

DELETE FROM reference_loot_template WHERE (Entry = 83746);
INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(83746, 116771, 0, 0.3, 0, 1, 1, 1, 1, 'Faucon des flèches solaire'),
(83746, 116578, 0, 0.6, 0, 1, 1, 1, 1, 'Arc longuegriffe'),
(83746, 109133, 0, 1.5, 0, 1, 1, 1, 1, 'Œuf de rylak'),
(83746, 120113, 0, 1.6, 0, 1, 1, 1, 1, 'Jambières de plumes ondulantes'),
(83746, 115435, 0, 4, 0, 1, 1, 1, 1, 'Jambières de plumes ondulantes'),
(83746, 120112, 0, 4, 0, 1, 1, 1, 1, 'Bottes de chevaucheur de phénix'),
(83746, 115439, 0, 4, 0, 1, 1, 1, 1, 'Anneau de garde-feu'),
(83746, 120111, 0, 5, 0, 1, 1, 1, 1, 'Sandales de penneflammes'),
(83746, 115438, 0, 5, 0, 1, 1, 1, 1, 'Chevalière de vérités brûlantes'),
(83746, 115433, 0, 6, 0, 1, 1, 1, 1, 'Jambards flamme-solaire'),
(83746, 120114, 0, 6, 0, 1, 1, 1, 1, 'Grandes bottes d\'aileforge'),
(83746, 115434, 0, 7, 0, 1, 1, 1, 1, 'Jambières rembourrées de duvet'),
(83746, 115440, 0, 7, 0, 1, 1, 1, 1, 'Bague du bec brûlant'),
(83746, 112775, 0, 11, 0, 1, 1, 1, 1, 'Module tailleur de gemmes : Endurance de feu du phénix'),
(83746, 115436, 0, 13, 0, 1, 1, 1, 1, 'Cuissards de feu du phénix'),
(83746, 115437, 0, 13, 0, 1, 1, 1, 1, 'Anneau de l\'œil de feu'),
(83746, 115441, 0, 17, 0, 1, 1, 1, 1, 'Sceau calciné de Callie');
