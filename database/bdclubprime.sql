-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS bdClubPrime;

-- Créer la base de données
CREATE DATABASE bdClubPrime;

-- Utiliser la base de données
USE id21551042_clubprime;

-- Création de la table Club
CREATE TABLE IF NOT EXISTS Club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    stade VARCHAR(277),
    descr VARCHAR(277),
    dateCrea DATE,
    idLigue INT,
    descrStade VARCHAR(2757),
    photoStade VARCHAR(277),
    entraineur VARCHAR(277),
    photoEntraineur VARCHAR(277),
    codeCouleur VARCHAR(277),
    FOREIGN KEY (idLigue) REFERENCES Ligue(id)
);

-- Création de la table Pays
CREATE TABLE IF NOT EXISTS Pays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL
);

-- Création de la table Ligue
CREATE TABLE IF NOT EXISTS Ligue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    idPays INT,
    photoLigue VARCHAR(277),
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    prenom VARCHAR(277) NOT NULL,
    photo VARCHAR(277),
    poste VARCHAR(277),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Trophee
CREATE TABLE IF NOT EXISTS Trophee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    photoTrophee VARCHAR(277)
);

-- Création de la table Classement
CREATE TABLE IF NOT EXISTS Classement (
    annee INT,
    position INT,
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id),
    PRIMARY KEY (annee, idClub)
);


-- Création de la table Obtenir (association entre Clubs et Trophées)
CREATE TABLE IF NOT EXISTS Obtenir (
    idClub INT,
    nombre INT,
    idTrophee INT,
    PRIMARY KEY (idClub, idTrophee),
    FOREIGN KEY (idClub) REFERENCES Club(id),
    FOREIGN KEY (idTrophee) REFERENCES Trophee(id)
);

-- Création de la table Logo
CREATE TABLE IF NOT EXISTS Logo (
   annee int,
   idClub INT,
   periode varchar(255),
   photoLogo VARCHAR(277),
   FOREIGN KEY (idClub) REFERENCES Club(id),
   PRIMARY KEY (annee, idClub)
);
-- Insertion de données dans la table Pays
INSERT INTO Pays (nom) VALUES
('Allemagne'),
('Angleterre'),
('Espagne'),
('France'),
('Italie');

-- Insertion de données dans la table Ligue
INSERT INTO Ligue (nom, idPays, photoLigue) VALUES
('Bundesliga', 1, 'ressources/LogoLigue/Bundesliga.png'),
('Premier League', 2,"ressources/LogoLigue/PremierLeague.png"),
('La Liga', 3,"ressources/LogoLigue/LaLiga.png"),
('Ligue 1', 4,"ressources/LogoLigue/Ligue1.png"),
('Serie A', 5,"ressources/LogoLigue/SeriaA.png");

-- Insertion de données dans la table Club
INSERT INTO Club (nom, stade, descr, dateCrea, idLigue, descrStade, photoStade, entraineur, photoEntraineur, codeCouleur) VALUES
('Bayern', 'Allianz Arena', 'Club de football basé à Munich, Allemagne', '1900-02-27', 1, "L'Allianz Arena ou Fußball Arena München, surnommée le « Schlauchboot » en raison de son aspect, est un stade de football situé au nord de Munich, la capitale du Land de Bavière en Allemagne. Le stade a une capacité de 75 000 spectateurs pour les matchs de Bundesliga, et 70 000 places en configuration internationale.", "ressources/PhotoJoueur/Bayern/Stade.jpg" ,"Thomas Tuchel", "ressources/PhotoJoueur/Bayern/Entraineur.jpg",'#dd0129'),
('Liverpool', 'Anfield', 'Club de football historique de la Premier League anglaise', '1892-03-17', 2, "Anfield, situé à Liverpool, est un stade de football légendaire, surnommé le « Théâtre des rêves rouges ». Construit au nord de la ville, il est le sanctuaire du Liverpool Football Club. Doté d'une atmosphère électrique, Anfield offre une capacité de 53 394 places en configuration de matchs de la Premier League. Le stade emblématique a été le témoin de moments historiques du football, de chants passionnés et de célébrations inoubliables.","ressources/PhotoJoueur/Liverpool/Stade.jpg" ,"Jürgen Klopp", "ressources/PhotoJoueur/Liverpool/Entraineur.jpg",'#d10022'),
('Man City', 'Etihad Stadium', 'Club de football de Manchester jouant en Premier League', '1880-04-16', 2, "L'Etihad Stadium, niché à Manchester, est le foyer éclatant du Manchester City FC. Surnommé le City of Manchester Stadium, il se dresse fièrement au cœur de l'action. Avec une capacité de plus de 53 000 places, ce stade moderne est le théâtre de performances époustouflantes de l'équipe des Ciel et Blanc, illuminant les rêves des supporters.", "ressources/PhotoJoueur/ManCity/Stade.jpg" ,"Pep Guardiola", "ressources/PhotoJoueur/ManCity/Entraineur.jpg",'#6caee0'),
('Real Madrid', 'Santiago Bernabéu', 'Club de football espagnol de la ville de Madrid', '1902-03-06', 3, "Le Santiago Bernabéu, légende du football basé à Madrid, est le temple sacré du Real Madrid. Renommé pour son histoire glorieuse, il peut accueillir plus de 80 000 fans passionnés. Ce stade emblématique est imprégné d'une atmosphère magique lors des matchs, offrant une expérience incomparable aux aficionados madrilènes.", "ressources/PhotoJoueur/RealMadrid/Stade.webp" ,"Carlo Ancelotti", "ressources/PhotoJoueur/Real Madrid/Entraineur.jpg",NULL),
('Chelsea', 'Stamford Bridge', 'Club de football londonien de Premier League', '1905-03-10', 2, "Stamford Bridge, résidence du Chelsea FC, se dresse avec élégance à Londres. Avec une capacité de plus de 40 000 sièges, ce stade empreint de tradition est le lieu où les Blues de Chelsea forgent leur histoire. L'atmosphère vibrante de Stamford Bridge fait de chaque match une aventure captivante.", "ressources/PhotoJoueur/Chelsea/Stade.jpg" ,"Mauricio Pochettino", "ressources/PhotoJoueur/Chelsea/Entraineur.jpg", '#000c8a'),
('Barcelone', 'Camp Nou', 'Club de football de Barcelone un des plus reconnus au monde', '1899-11-29', 3, "Le Camp Nou, situé à Barcelone, est le géant catalan où le FC Barcelone écrit son histoire. Avec une capacité de plus de 99 000 spectateurs, il est le plus grand stade d'Europe. L'ambiance électrique, et les prouesses de génies du ballon rond font du Camp Nou un lieu mythique.", "ressources/PhotoJoueur/Barcelone/Stade.jpg" ,"Xavi Hernández", "ressources/PhotoJoueur/Barcelone/Entraineur.jpg",NULL),
('PSG', 'Parc des Princes', 'Club de football français basé à Paris', '1970-08-12', 4, "Le Parc des Princes, joyau parisien, est l'antre du Paris Saint-Germain. Avec une capacité de plus de 48 000 places, ce stade moderne vibre au rythme des exploits des stars du PSG. L'élégance et le dynamisme du Parc des Princes en font un lieu emblématique du football français.", "ressources/PhotoJoueur/PSG/Stade.jpg" ,"Luis Enrique", "ressources/PhotoJoueur/PSG/Entraineur.jpg",NULL),
('Juventus', 'Allianz Stadium', 'Club de football italien situé à Turin', '1897-11-01', 5, "L'Allianz Stadium, situé à Turin, est le repaire de la Juventus. Avec une capacité de plus de 41 000 sièges, ce stade moderne offre une expérience immersive aux fans bianconeri. L'Allianz Stadium est le théâtre des triomphes de la Vecchia Signora, avec une ambiance électrisante à chaque rencontre.", "ressources/PhotoJoueur/Juventus/Stade.jpg" ,"Massimiliano Allegri", "ressources/PhotoJoueur/Juventus/Entraineur.jpg",NULL),
('Atlético de Madrid', 'Wanda Metropolitano', 'Club de football basé à Madrid, Espagne', '1903-04-26', 3, "Le Wanda Metropolitano, situé à Madrid, est le nouveau sanctuaire de l'Atlético de Madrid. Avec une capacité de plus de 68 000 places, il incarne la passion et la détermination des Colchoneros. Ce stade moderne est le témoin de la lutte incessante de l'Atlético sur le terrain.", "ressources/PhotoJoueur/AtleticoMadrid/Stade.jpg" ,"Diego Simeone", "ressources/PhotoJoueur/AtleticoMarid/Entraineur.jpg",NULL ),
('Man United', 'Old Trafford', 'Club de football anglais basé à Manchester, très populaire mondialement', '1878-01-01', 2, "Old Trafford, trésor de Manchester, est l'icône du Manchester United. Avec une capacité de plus de 74 000 sièges, il résonne de l'histoire glorieuse du club. Surnommé le Théâtre des Rêves, Old Trafford est le lieu où les Red Devils forgent leur légende, avec une atmosphère incomparable.", "ressources/PhotoJoueur/ManUnited/Stade.jpg" ,"Erik ten Hag", "ressources/PhotoJoueur/ManUnited/Entraineur.jpg",NULL),
('Roma', 'Stadio Olimpico', 'Club de football basé à Rome, Italie', '1927-07-22', 5, "Le Stadio Olimpico, situé à Rome, est le temple de l'AS Roma. Avec une capacité de plus de 70 000 places, ce stade historique a été le témoin de moments inoubliables de la Roma. L'atmosphère passionnée du Stadio Olimpico rend chaque match mémorable pour les supporters giallorossi.", "ressources/PhotoJoueur/Roma/Stade.jpg" ,"José Mourinho", "ressources/PhotoJoueur/Roma/Entraineur.jpg",NULL);


INSERT INTO Trophee (nom, photoTrophee) VALUES
('Ligue 1', 'ressources/PhotoTrophee/Ligue1.png'),
('Coupe de France', 'ressources/PhotoTrophee/CoupeDeFrance.png'),
('Trophée des Champions', 'ressources/PhotoTrophee/TropheeDesChampions.png'),
('Serie A', 'ressources/PhotoTrophee/SerieA.png'),
('Coppa Italia', 'ressources/PhotoTrophee/CoppaItalia.png'),
('Supercoppa Italiana', 'ressources/PhotoTrophee/SupercoppaItaliana.png'),
('Premier League', 'ressources/PhotoTrophee/PremierLeague.png'),
('FA Cup', 'ressources/PhotoTrophee/FACup.png'),
('Carabao Cup', 'ressources/PhotoTrophee/CarabaoCup.png'),
('Community Shield', 'ressources/PhotoTrophee/CommunityShield.png'),
('Bundesliga', 'ressources/PhotoTrophee/Bundesliga.jpg'),
('DFB-Pokal', 'ressources/PhotoTrophee/DFBPokal.png'),
('DFL-Supercup', 'ressources/PhotoTrophee/DFLSupercup.png'),
('La Liga', 'ressources/PhotoTrophee/LaLiga.png'),
('Copa del Rey', 'ressources/PhotoTrophee/CopaDelRey.png'),
('Supercopa de España', 'ressources/PhotoTrophee/SupercopaDeEspana.png'),
('Ligue des Champions de l''UEFA', 'ressources/PhotoTrophee/LigueDesChampions.png'),
('Ligue Europa de l\'UEFA', 'ressources/PhotoTrophee/LigueEuropa.png'),
('Supercoupe de l\'UEFA', 'ressources/PhotoTrophee/SupercoupeUEFA.png'),
('Fifa Club World Cup', 'ressources/PhotoTrophee/FifaClubWorldCup.png'),
('Audi Cup', 'ressources/PhotoTrophee/AudiCup.png'),
('Premier League Asia Trophy', 'ressources/PhotoTrophee/PremierLeagueAsiaTrophy.png'),
('International Champions Cup', 'ressources/PhotoTrophee/InternationalChampionsCup.png'),
('Trophée Joan Gamper', 'ressources/PhotoTrophee/TropheeJoanGamper.png'),
('UEFA Europa Conference League', 'ressources/PhotoTrophee/UEFAEuropaConferenceLeague.png');

-- Insertion de données dans la table Classement
INSERT INTO Classement (annee, position, idClub) VALUES
('2022', 1, 1),
('2022', 2, 2),
('2022', 3, 3),
('2022', 4, 4),
('2022', 5, 5),
('2022', 6, 6),
('2022', 7, 7),
('2022', 8, 8),
('2022', 9, 9),
('2022', 10, 10);

INSERT INTO Classement (annee, position, idClub) VALUES
('2023', 2, 1),  -- Bayern
('2023', 4, 2),  -- Liverpool
('2023', 1, 3),  -- Man City
('2023', 5, 4),  -- Real madrid
('2023', 3, 5),  -- Chelsea
('2023', 9, 6),  -- Barcelona
('2023', 6, 7),  -- Paris
('2023', 8, 8),  -- Atletico Madrid
('2023', 7, 9),  -- Man United
('2023', 10, 11); -- Roma


-- Insertion de données dans la table Obtenir (association entre Clubs et Trophées)
INSERT INTO Obtenir (idClub, nombre, idTrophee) VALUES
-- Bayern Munich
(1, 6, 17), -- Ligue des Champions
(1, 1, 18), -- UEFA Europa League
(1, 33, 11), -- Bundesliga
(1, 20, 12), -- DFB Pokal
(1, 2, 19), -- Super Coupe UEFA
(1, 10, 9), -- Super Cup (Community Shield)
(1, 2, 20), -- FIFA Club World Cup (CM Clubs)
(1, 3, 21), -- Audi Cup

-- Liverpool
(2, 6, 17), -- Ligue des Champions
(2, 3, 18), -- UEFA Europa League
(2, 19, 7), -- Premier League
(2, 8, 8), -- FA Cup
(2, 4, 5), -- League Championship
(2, 9, 6), -- League Cup
(2, 16, 10), -- Community Shield (Angleterre)
(2, 4, 19), -- Super Coupe UEFA
(2, 1, 20), -- Cdm club
(2, 1, 22), -- Premier League asia trophy

-- Manchester City
(3, 1, 17), -- Ligue des Champions
(3, 9, 7), -- Premier League
(3, 7, 8), -- FA Cup
(3, 7, 6), -- League Championship
(3, 8, 9), -- League Cup
(3, 6, 10), -- Community Shield (Angleterre)

-- Man City
(4, 14, 17), -- Ligue des Champions
(4, 2, 18), -- UEFA Europa League
(4, 35, 14), -- Liga
(4, 20, 15), -- Coupe du Roi
(4, 10, 16), -- Supercopa de España
(4, 4, 19), -- Super Coupe UEFA
(4, 5, 20), -- CM Clubs
(4, 1, 23), -- International Champions Cup

-- Chelsea
(5, 2, 17), -- Ligue des Champions
(5, 2, 18), -- UEFA Europa League
(5, 6, 7), -- Premier League
(5, 8, 8), -- FA Cup
(5, 2, 5), -- League Championship
(5, 5, 6), -- League Cup
(5, 4, 10), -- Community Shield (Angleterre)
(5, 2, 19), -- Super Coupe UEFA
(5, 1, 20), -- CM Clubs

-- FC Barcelone
(6, 5, 17), -- Ligue des Champions
(6, 27, 14), -- Liga
(6, 31, 15), -- Coupe du Roi
(6, 14, 16), -- Supercopa de España
(6, 5, 19), -- Super Coupe UEFA
(6, 3, 20), -- CM Clubs
(6, 1, 21), -- Audi Cup
(6, 6, 24), -- Trophée Joan Gamper

-- Paris Saint-Germain (PSG)
(7, 11, 1), -- Ligue 1
(7, 14, 2), -- Coupe de France
(7, 11, 3), -- Trophée des Champions (France)
(7, 9, 12), -- Coupe de la Ligue
(7, 1, 17), -- Ligue des Champions

-- Juventus
(8, 2, 17), -- UEFA Champions League
(8, 3, 18), -- UEFA Europa League
(8, 9, 6), -- Supercoppa Italiana
(8, 36, 4), -- Serie A
(8, 14, 5), -- Coppa Italia

-- Atlético Madrid
(9, 3, 18), -- UEFA Europa League
(9, 11, 14), -- La Liga
(9, 10, 15), -- Copa del Rey
(9, 1, 17), -- UEFA Champions League
(9, 4, 16), -- Supercopa de España
(9, 3, 19), -- UEFA Super Cup
(9, 1, 21), -- Audi Cup

-- Manchester United
(10, 3, 17), -- UEFA Champions League
(10, 1, 18), -- UEFA Europa League
(10, 20, 7), -- Premier League
(10, 12, 8), -- FA Cup
(10, 2, 13), -- DFL-Supercup
(10, 6, 9), -- League Cup
(10, 21, 10), -- Community Shield (Angleterre)
(10, 1, 19), -- UEFA Super Cup
(10, 1, 20), -- FIFA Club World Cup
(10, 1, 23), -- International Champions Cup

-- AS Roma
(11, 1, 25), -- UEFA Europa Conference League
(11, 2, 6), -- Supercoppa Italiana
(11, 3, 4), -- Serie A
(11, 9, 5), -- Coppa Italia
(11, 1, 12); -- Serie B
     
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Ulreich', 'Sven', 'ressources/PhotoJoueur/Bayern/SU.webp', 'G', 1),
  ('Davies', 'Alphonso', 'ressources/PhotoJoueur/Bayern/AD.webp', 'D', 1),
  ('Kim', 'Min-Jae', 'ressources/PhotoJoueur/Bayern/MJK.webp', 'D', 1),
  ('Upamecano', 'Dayot', 'ressources/PhotoJoueur/Bayern/DU.webp', 'D', 1),
  ('Mazraoui', 'Noussair', 'ressources/PhotoJoueur/Bayern/MN.webp', 'D', 1),
  ('Kimmich', 'Joshua', 'ressources/PhotoJoueur/Bayern/JK.webp', 'M', 1),
  ('Goretzka', 'Leon', 'ressources/PhotoJoueur/Bayern/LG.webp', 'M', 1),
  ('Coman', 'Kingsley', 'ressources/PhotoJoueur/Bayern/KC.webp', 'AT', 1),
  ('Musiala', 'Jamal', 'ressources/PhotoJoueur/Bayern/JM.webp', 'M', 1),
  ('Sané', 'Leroy', 'ressources/PhotoJoueur/Bayern/LS.webp', 'AT', 1),
  ('Kane', 'Harry', 'ressources/PhotoJoueur/Bayern/HK.webp', 'AT', 1);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Díaz', 'Luis', 'ressources/PhotoJoueur/Liverpool/LD.webp', 'AT', 2),
  ('Núñez', 'Darwin', 'ressources/PhotoJoueur/Liverpool/DN.webp', 'AT', 2),
  ('Salah', 'Mohamed', 'ressources/PhotoJoueur/Liverpool/MS.webp', 'AT', 2),
  ('Jones', 'Curtis', 'ressources/PhotoJoueur/Liverpool/CJ.webp', 'M', 2),
  ('Mac Allister', 'Alexis', 'ressources/PhotoJoueur/Liverpool/AM.webp', 'M', 2),
  ('Szoboszlai', 'Dominik', 'ressources/PhotoJoueur/Liverpool/DS.webp', 'M', 2),
  ('Robertson', 'Andrew', 'ressources/PhotoJoueur/Liverpool/AR.webp', 'D', 2),
  ('van Dijk', 'Virgil', 'ressources/PhotoJoueur/Liverpool/VV.webp', 'D', 2),
  ('Matip', 'Joel', 'ressources/PhotoJoueur/Liverpool/JM.webp', 'D', 2),
  ('Alexander-Arnold', 'Trent', 'ressources/PhotoJoueur/Liverpool/TA.webp', 'D', 2),
  ('Becker', 'Alisson', 'ressources/PhotoJoueur/Liverpool/AB.webp', 'G', 2);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES 
  ('Haaland', 'Erling', 'ressources/PhotoJoueur/ManCity/EH.webp', 'AT', 3),
  ('Grealish', 'Jack', 'ressources/PhotoJoueur/ManCity/JG1.webp', 'M', 3),
  ('Alvarez', 'Julian', 'ressources/PhotoJoueur/ManCity/JA.webp', 'AT', 3),
  ('Foden', 'Phil', 'ressources/PhotoJoueur/ManCity/PF.webp', 'M', 3),
  ('Kovačić', 'Mateo', 'ressources/PhotoJoueur/ManCity/MK.webp', 'M', 3),
  ('Rodri', NULL, 'ressources/PhotoJoueur/ManCity/HR.webp', 'M', 3),
  ('Gvardiol', 'Josko', 'ressources/PhotoJoueur/ManCity/JG2.webp', 'D', 3),
  ('Dias', 'Rúben', 'ressources/PhotoJoueur/ManCity/RD.webp', 'D', 3),
  ('Akanji', 'Manuel', 'ressources/PhotoJoueur/ManCity/MA.webp', 'D', 3),
  ('Walker', 'Kyle', 'ressources/PhotoJoueur/ManCity/KW.webp', 'D', 3),
  ('Ederson', NULL, 'ressources/PhotoJoueur/ManCity/E.webp', 'G', 3);

-- Real Madrid
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Vinicius', 'Junior', 'ressources/PhotoJoueur/RealMadrid/VJ.webp', 'AT', 4),
  ('Joselu', NULL, 'ressources/PhotoJoueur/RealMadrid/J.webp', 'AT', 4),
  ('Bellingham', 'Jude', 'ressources/PhotoJoueur/RealMadrid/JB.webp', 'M', 4),
  ('Camavinga', 'Eduardo', 'ressources/PhotoJoueur/RealMadrid/EC.webp', 'M', 4),
  ('Tchouameni', 'Aurélien', 'ressources/PhotoJoueur/RealMadrid/AT.webp', 'M', 4),
  ('Valverde', 'Federico', 'ressources/PhotoJoueur/RealMadrid/FV.webp', 'M', 4),
  ('Garcia', 'Fran', 'ressources/PhotoJoueur/RealMadrid/FG.webp', 'D', 4),
  ('Alaba', 'David', 'ressources/PhotoJoueur/RealMadrid/DA.webp', 'D', 4),
  ('Rudiger', 'Antonio', 'ressources/PhotoJoueur/RealMadrid/AR.webp', 'D', 4),
  ('Carvajal', 'Dani', 'ressources/PhotoJoueur/RealMadrid/DC.webp', 'D', 4),
  ('Kepa', NULL, 'ressources/PhotoJoueur/RealMadrid/AK.webp', 'G', 4);

-- Chelsea
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Mudryk', 'Mykhailo', 'ressources/PhotoJoueur/Chelsea/MM.webp', 'AT', 5),
  ('Fernández', 'Enzo', 'ressources/PhotoJoueur/Chelsea/EJF.webp', 'M', 5),
  ('Sterling', 'Raheem', 'ressources/PhotoJoueur/Chelsea/RS.webp', 'AT', 5),
  ('Jackson', 'Nicolas', 'ressources/PhotoJoueur/Chelsea/NJ.webp', 'AT', 5),
  ('Caicedo', 'Moisés', 'ressources/PhotoJoueur/Chelsea/MC.webp', 'M', 5),
  ('Gallagher', 'Conor', 'ressources/PhotoJoueur/Chelsea/CG.webp', 'M', 5),
  ('Cucurella', 'Marc', 'ressources/PhotoJoueur/Chelsea/MC.webp', 'D', 5),
  ('Colwill', 'Levi', 'ressources/PhotoJoueur/Chelsea/LSC.webp', 'D', 5),
  ('Silva', 'Thiago', 'ressources/PhotoJoueur/Chelsea/TS.webp', 'D', 5),
  ('Gusto', 'Malo', 'ressources/PhotoJoueur/Chelsea/MG.webp', 'D', 5),
  ('Sánchez', 'Robert', 'ressources/PhotoJoueur/Chelsea/RS.webp', 'G', 5);

-- Barcelone
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Félix', 'João', 'ressources/PhotoJoueur/Barcelone/JF.webp', 'AT', 6),
  ('Lewandowski', 'Robert', 'ressources/PhotoJoueur/Barcelone/RL.webp', 'AT', 6),
  ('Yamal', 'Lamine', 'ressources/PhotoJoueur/Barcelone/LY.webp', 'AT', 6),
  ('Gündoğan', 'İlkay', 'ressources/PhotoJoueur/Barcelone/IG.webp', 'M', 6),
  ('Romeu', 'Oriol', 'ressources/PhotoJoueur/Barcelone/OR.webp', 'M', 6),
  ('Gavi', '', 'ressources/PhotoJoueur/Barcelone/PMPG.webp', 'M', 6),
  ('Baldé', '', 'ressources/PhotoJoueur/Barcelone/ABM.webp', 'D', 6),
  ('Christensen', 'Andreas', 'ressources/PhotoJoueur/Barcelone/AC.webp', 'D', 6),
  ('Koundé', 'Jules', 'ressources/PhotoJoueur/Barcelone/JK.webp', 'D', 6),
  ('Cancelo', 'João', 'ressources/PhotoJoueur/Barcelone/JC.webp', 'D', 6),
  ('ter Stegen', 'Marc-André', 'ressources/PhotoJoueur/Barcelone/MAT.webp', 'G', 6);

-- PSG
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Mbappé', 'Kylian', 'ressources/PhotoJoueur/PSG/KM.webp', 'AT', 7),
  ('Ramos', 'Goncalo', 'ressources/PhotoJoueur/PSG/GM.webp', 'AT', 7),
  ('Dembélé', 'Ousmane', 'ressources/PhotoJoueur/PSG/OD.webp', 'AT', 7),
  ('Vitinha', '', 'ressources/PhotoJoueur/PSG/VF.webp', 'M', 7),
  ('Ugarte', 'Manuel', 'ressources/PhotoJoueur/PSG/MU.webp', 'M', 7),
  ('Zaire-Emery', 'Warren', 'ressources/PhotoJoueur/PSG/WZ.webp', 'M', 7),
  ('Hernández', 'Lucas', 'ressources/PhotoJoueur/PSG/LH.webp', 'D', 7),
  ('Skriniar', 'Milan', 'ressources/PhotoJoueur/PSG/MS.webp', 'D', 7),
  ('Marquinhos', '', 'ressources/PhotoJoueur/PSG/M.webp', 'D', 7),
  ('Hakimi', 'Achraf', 'ressources/PhotoJoueur/PSG/AH.webp', 'D', 7),
  ('Donnarumma', 'Gianluigi', 'ressources/PhotoJoueur/PSG/GD.webp', 'G', 7);

-- Juventus
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Chiesa', 'Federico', 'ressources/PhotoJoueur/Juventus/FC.webp', 'AT', 8),
  ('Kostić', 'Filip', 'ressources/PhotoJoueur/Juventus/FK.webp', 'M', 8),
  ('Rabiot', 'Adrien', 'ressources/PhotoJoueur/Juventus/AR.webp', 'M', 8),
  ('Locatelli', 'Manuel', 'ressources/PhotoJoueur/Juventus/ML.webp', 'M', 8),
  ('Miretti', 'Fabio', 'ressources/PhotoJoueur/Juventus/FM.webp', 'M', 8),
  ('McKennie', 'Weston', 'ressources/PhotoJoueur/Juventus/WM.webp', 'M', 8),
  ('Danilo', NULL, 'ressources/PhotoJoueur/Juventus/PD.webp', 'D', 8),
  ('Bremer', 'Gleison', 'ressources/PhotoJoueur/Juventus/GBSN.webp', 'D', 8),
  ('Gatti', 'Federico', 'ressources/PhotoJoueur/Juventus/FG.webp', 'D', 8),
  ('Vlahović', 'Dušan', 'ressources/PhotoJoueur/Juventus/DV.webp', 'AT', 8);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Morata', 'Álvaro', 'ressources/PhotoJoueur/AtleticoMadrid/AM.webp', 'AT', 9),
    ('Ñíguez', 'Saúl', 'ressources/PhotoJoueur/AtleticoMadrid/SN.webp', 'M', 9),
    ('Koke', NULL, 'ressources/PhotoJoueur/AtleticoMadrid/KR.webp', 'M', 9),
    ('Griezmann', 'Antoine', 'ressources/PhotoJoueur/AtleticoMadrid/AG.webp', 'AT', 9),
    ('Llorente', 'Marcos', 'ressources/PhotoJoueur/AtleticoMadrid/ML.webp', 'M', 9),
    ('Riquelme', 'Rodrigo', 'ressources/PhotoJoueur/AtleticoMadrid/RRR.webp', 'M', 9),
    ('Molina', 'Nahuel', 'ressources/PhotoJoueur/AtleticoMadrid/NML.webp', 'D', 9),
    ('Hermoso', 'Mario', 'ressources/PhotoJoueur/AtleticoMadrid/MH.webp', 'D', 9),
    ('Witsel', 'Axel', 'ressources/PhotoJoueur/AtleticoMadrid/AW.webp', 'M', 9),
    ('Savić', 'Stefan', 'ressources/PhotoJoueur/AtleticoMadrid/SS.webp', 'D', 9),
    ('Oblak', 'Jan', 'ressources/PhotoJoueur/AtleticoMadrid/JO.webp', 'G', 9);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Rashford', 'Marcus', 'ressources/PhotoJoueur/Man United/MR.webp', 'AT', 10),
    ('Fernandes', 'Bruno', 'ressources/PhotoJoueur/Man United/BF.webp', 'M', 10),
    ('Antony', NULL, 'ressources/PhotoJoueur/Man United/A.webp', 'AT', 10),
    ('Eriksen', 'Christian', 'ressources/PhotoJoueur/Man United/CE.webp', 'M', 10),
    ('Casemiro', NULL, 'ressources/PhotoJoueur/Man United/HC.webp', 'M', 10),
    ('Dalot', 'Diogo', 'ressources/PhotoJoueur/Man United/DD.webp', 'D', 10),
    ('Evans', 'Jonny', 'ressources/PhotoJoueur/Man United/JE.webp', 'D', 10),
    ('Maguire', 'Harry', 'ressources/PhotoJoueur/Man United/HM.webp', 'D', 10),
    ('Wan-Bissaka', 'Aaron', 'ressources/PhotoJoueur/Man United/AB.webp', 'D', 10),
    ('Onana', 'André', 'ressources/PhotoJoueur/Man United/AO.webp', 'G', 10),
    ('Højlund', 'Rasmus', 'ressources/PhotoJoueur/Man United/RH.webp', 'AT', 10);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Lukaku', 'Romelu', 'ressources/PhotoJoueur/Roma/RL.webp', 'AT', 11),
    ('Dybala', 'Paulo', 'ressources/PhotoJoueur/Roma/PD.webp', 'AT', 11),
    ('Zalewski', 'Nicola', 'ressources/PhotoJoueur/Roma/NZ.webp', 'M', 11),
    ('Aouar', 'Houssem', 'ressources/PhotoJoueur/Roma/HA.webp', 'M', 11),
    ('Paredes', 'Leandro', 'ressources/PhotoJoueur/Roma/LP.webp', 'M', 11),
    ('Cristante', 'Bryan', 'ressources/PhotoJoueur/Roma/BC.webp', 'M', 11),
    ('Kristensen', 'Rasmus', 'ressources/PhotoJoueur/Roma/RK.webp', 'D', 11),
    ('Nidcka', 'Emil', 'ressources/PhotoJoueur/Roma/EN.webp', 'D', 11),
    ('Llorente', 'Diego', 'ressources/PhotoJoueur/Roma/DL.webp', 'D', 11),
    ('Mancini', 'Gianluca', 'ressources/PhotoJoueur/Roma/GM.webp', 'D', 11),
    ('Patricio', 'Rui', 'ressources/PhotoJoueur/Roma/RP.webp', 'G', 11);


INSERT INTO Logo VALUES 
    (1900, 1, '1900-1901', 'ressources/LogoEquipe/Bayern/1900-1901.png'),
    (1902, 1, '1902-1906', 'ressources/LogoEquipe/Bayern/1902-1906.png'),
    (1906, 1, '1906-1908', 'ressources/LogoEquipe/Bayern/1906-1908.png'),
    (1919, 1, '1919-1920', 'ressources/LogoEquipe/Bayern/1919-1920.png'),
    (1931, 1, '1931-1935', 'ressources/LogoEquipe/Bayern/1931-1935.png'),
    (1955, 1, '1955-1966', 'ressources/LogoEquipe/Bayern/1955-1966.gif'),
    (1966, 1, '1966-1967', 'ressources/LogoEquipe/Bayern/1966-1967.gif'),
    (1967, 1, '1967-1997', 'ressources/LogoEquipe/Bayern/1967-1997.png'),
    (1997, 1, '1997-2002', 'ressources/LogoEquipe/Bayern/1997-2002.png'),
    (2002, 1, '2002-2017', 'ressources/LogoEquipe/Bayern/2002-2017.png'),
    (2017, 1, '2017-Actuel', 'ressources/LogoEquipe/Bayern/2017-Actuel.png');

INSERT INTO Logo VALUES 
    (1981, 2, '1981-1987', 'ressources/LogoEquipe/Liverpool/1981-1987.gif'),
    (1987, 2, '1987-1992', 'ressources/LogoEquipe/Liverpool/1987-1992.gif'),
    (1992, 2, '1992-1993', 'ressources/LogoEquipe/Liverpool/1992-1993.gif'),
    (1993, 2, '1993-2000', 'ressources/LogoEquipe/Liverpool/1993-2000.png'),
    (2000, 2, '2000-Actuel', 'ressources/LogoEquipe/Liverpool/2000.png'),

    (1926, 3, '1926-1970', 'ressources/LogoEquipe/ManCity/1926-1970.png'),
    (1972, 3, '1972-1976', 'ressources/LogoEquipe/ManCity/1972-1976.png'),
    (1976, 3, '1976-1981', 'ressources/LogoEquipe/ManCity/1976-1981.png'),
    (1981, 3, '1981-1997', 'ressources/LogoEquipe/ManCity/1981-1997.png'),
    (1997, 3, '1997-2016', 'ressources/LogoEquipe/ManCity/1997-2016.png'),
    (2016, 3, '2016-Actuel', 'ressources/LogoEquipe/ManCity/2016.png'),

    (1902, 4, '1902-1903', 'ressources/LogoEquipe/RealMadrid/1902-1903.png'),
    (1903, 4, '1903-1908', 'ressources/LogoEquipe/RealMadrid/1903-1908.png'),
    (1908, 4, '1908-1920', 'ressources/LogoEquipe/RealMadrid/1908-1920.png'),
    (1920, 4, '1920-1931', 'ressources/LogoEquipe/RealMadrid/1920-1931.png'),
    (1931, 4, '1931-1941', 'ressources/LogoEquipe/RealMadrid/1931-1941.png'),
    (1941, 4, '1941-1997', 'ressources/LogoEquipe/RealMadrid/1941-1997.png'),
    (1997, 4, '1997-Actuel', 'ressources/LogoEquipe/RealMadrid/1997-Actuel.png'),

    (1905, 5, '1906-1951', 'ressources/LogoEquipe/Chelsea/1905-1952.jpg'),
    (1952, 5, '1952-1953', 'ressources/LogoEquipe/Chelsea/1952-1953.jpg'),
    (1953, 5, '1953-1986', 'ressources/LogoEquipe/Chelsea/1953-1986.jpg'),
    (1986, 5, '1986-2002', 'ressources/LogoEquipe/Chelsea/1986-2002.jpg'),
    (2002, 5, '2002-2005', 'ressources/LogoEquipe/Chelsea/2002-2005.jpg'),
    (2005, 5, '2005-Actuel', 'ressources/LogoEquipe/Chelsea/2005-Actuel.png'),

    (1899, 6, '1899-1906', 'ressources/LogoEquipe/Barcelone/1899-1906.jpg'),
    (1906, 6, '1906-1920', 'ressources/LogoEquipe/Barcelone/1906-1920.jpg'),
    (1920, 6, '1920-1936', 'ressources/LogoEquipe/Barcelone/1920-1936.jpg'),
    (1936, 6, '1936-1939', 'ressources/LogoEquipe/Barcelone/1936-1939.jpg'),
    (1939, 6, '1939-1946', 'ressources/LogoEquipe/Barcelone/1939-1946.jpg'),
    (1946, 6, '1946-1960', 'ressources/LogoEquipe/Barcelone/1946-1960.jpg'),
    (1960, 6, '1960-1974', 'ressources/LogoEquipe/Barcelone/1960-1974.jpg'),
    (1974, 6, '1974-1975', 'ressources/LogoEquipe/Barcelone/1974-1975.jpg'),
    (1975, 6, '1975-2002', 'ressources/LogoEquipe/Barcelone/1975-2002.jpg'),
    (2002, 6, '2002-Actuel', 'ressources/LogoEquipe/Barcelone/2002-Actuel.jpg'),

    (1970, 7, '1970-1972', 'ressources/LogoEquipe/PSG/1970-1972.png'),
    (1972, 7, '1972-1982', 'ressources/LogoEquipe/PSG/1972-1982.jpg'),
    (1982, 7, '1982-1992', 'ressources/LogoEquipe/PSG/1982-1992.png'),
    (1992, 7, '1992-1996', 'ressources/LogoEquipe/PSG/1992-1996.png'),
    (1996, 7, '1996-2002', 'ressources/LogoEquipe/PSG/1996-2002.png'),
    (2002, 7, '2002-2010', 'ressources/LogoEquipe/PSG/2002-2010.png'),
    (2010, 7, '2010-2012', 'ressources/LogoEquipe/PSG/2010-2012.png'),
    (2013, 7, '2013-Actuel', 'ressources/LogoEquipe/PSG/2013-Actuel.png'),

    (1905, 8, '1905-1931', 'ressources/LogoEquipe/Juventus/1905-1931.png'),
    (1931, 8, '1931-1993', 'ressources/LogoEquipe/Juventus/1931-1993.png'),
    (1993, 8, '1993-2004', 'ressources/LogoEquipe/Juventus/1993-2004.png'),
    (2004, 8, '2004-2017', 'ressources/LogoEquipe/Juventus/2004-2017.png'),
    (2017, 8, '2017-2020', 'ressources/LogoEquipe/Juventus/2017-2020.png'),
    (2020, 8, '2020-Actuel', 'ressources/LogoEquipe/Juventus/2020-Actuel.png'),

    (1903, 9, '1903-1911', 'ressources/LogoEquipe/AtleticoMadrid/1903-1911.jpg'),
    (1911, 9, '1911-1939', 'ressources/LogoEquipe/AtleticoMadrid/1911-1939.png'),
    (1939, 9, '1939-1942', 'ressources/LogoEquipe/AtleticoMadrid/1939-1942.jpg'),
    (1942, 9, '1942-1947', 'ressources/LogoEquipe/AtleticoMadrid/1942-1947.jpg'),
    (1947, 9, '1947-2016', 'ressources/LogoEquipe/AtleticoMadrid/1947-2016.png'),
    (2017, 9, '2017-Actuel', 'ressources/LogoEquipe/AtleticoMadrid/2017-Actuel.png'),

    (1878, 10, '1878-1902', 'ressources/LogoEquipe/ManUnited/1878-1902.jpg'),
    (1902, 10, '1902-1940', 'ressources/LogoEquipe/ManUnited/1902-1940.jpg'),
    (1940, 10, '1940-1960', 'ressources/LogoEquipe/ManUnited/1940-1960.png'),
    (1960, 10, '1960-1970', 'ressources/LogoEquipe/ManUnited/1960-1970.png'),
    (1970, 10, '1970-1973', 'ressources/LogoEquipe/ManUnited/1970-1973.jpg'),
    (1973, 10, '1973-1998', 'ressources/LogoEquipe/ManUnited/1973-1998.png'),
    (1998, 10, '1998-Actuel', 'ressources/LogoEquipe/ManUnited/1998-Actuel.png'),

    (1930, 11, '1930-1960', 'ressources/LogoEquipe/Roma/1930-1960.jpg'),
    (1960, 11, '1960-1978', 'ressources/LogoEquipe/Roma/1960-1978.png'),
    (1978, 11, '1978-1997', 'ressources/LogoEquipe/Roma/1978-1997.png'),
    (1997, 11, '1997-2013', 'ressources/LogoEquipe/Roma/1997-2013.png'),
    (2013, 11, '2013-2017', 'ressources/LogoEquipe/Roma/2013-2017.png'),
    (2017, 11, '2017-Actuel', 'ressources/LogoEquipe/Roma/2017-Actuel.png');
