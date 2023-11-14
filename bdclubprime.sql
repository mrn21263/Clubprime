-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS bdClubPrime;

-- Créer la base de données
CREATE DATABASE bdClubPrime;

-- Utiliser la base de données
USE bdClubPrime;

-- Création de la table Club
CREATE TABLE IF NOT EXISTS Club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    stade VARCHAR(277),
    descr VARCHAR(277),
    dateCrea DATE,
    idLigue INT,
    descrStade VARCHAR(277),
    photoStade BLOB,
    entraineur VARCHAR(277),
    photoEntraineur BLOB,
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
    photoLigue BLOB,
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    prenom VARCHAR(277) NOT NULL,
    photo BLOB,
    poste VARCHAR(277),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Trophee
CREATE TABLE IF NOT EXISTS Trophee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    photoTrophee BLOB
);

-- Création de la table Classement
CREATE TABLE IF NOT EXISTS Classement (
    annee INT,
    position INT,
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id),
    PRIMARY KEY (annee, idClub)
);

-- Création de la table Tag
CREATE TABLE IF NOT EXISTS Tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lib VARCHAR(277) NOT NULL
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

-- Création de la table Taguer (association entre Clubs et Tags)
CREATE TABLE IF NOT EXISTS Taguer (
    idClub INT,
    idTag INT,
    PRIMARY KEY (idClub, idTag),
    FOREIGN KEY (idClub) REFERENCES Club(id),
    FOREIGN KEY (idTag) REFERENCES Tag(id)
);

-- Création de la table Logo
CREATE TABLE IF NOT EXISTS Logo (
   dateCreat DATE,
   nom VARCHAR(277) NOT NULL,
   idClub INT,
   FOREIGN KEY (idClub) REFERENCES Club(id),
   PRIMARY KEY (dateCreat, idClub)
);

-- Insertion de données dans la table Pays
INSERT INTO Pays (nom) VALUES
('Allemagne'),
('Angleterre'),
('Espagne'),
('France'),
('Italie');

-- Insertion de données dans la table Ligue
INSERT INTO Ligue (nom, idPays) VALUES
('Bundesliga', 1),
('Premier League', 2),
('La Liga', 3),
('Ligue 1', 4),
('Serie A', 7);

-- Insertion de données dans la table Club
INSERT INTO Club (nom, stade, descr, dateCrea, idLigue, descrStade, photoStade, entraineur, photoEntraineur) VALUES
('Bayern', 'Allianz Arena', 'Club de football basé à Munich, Allemagne', '1900-02-27', 1, "L'Allianz Arena ou Fußball Arena München, surnommée le « Schlauchboot » en raison de son aspect, est un stade de football situé au nord de Munich, la capitale du Land de Bavière en Allemagne. Le stade a une capacité de 75 000 spectateurs pour les matchs de Bundesliga, et 70 000 places en configuration internationale.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\Stade.jpg" ,"Thomas Tuchel", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\Entraineur.jpg" ),
('Liverpool', 'Anfield', 'Club de football historique de la Premier League anglaise', '1892-03-17', 2, "Anfield, situé à Liverpool, est un stade de football légendaire, surnommé le « Théâtre des rêves rouges ». Construit au nord de la ville, il est le sanctuaire du Liverpool Football Club. Doté d'une atmosphère électrique, Anfield offre une capacité de 53 394 places en configuration de matchs de la Premier League. Le stade emblématique a été le témoin de moments historiques du football, de chants passionnés et de célébrations inoubliables.","E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\Stade.jpg" ,"Jürgen Klopp", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\Entraineur.jpg"),
('Man City', 'Etihad Stadium', 'Club de football de Manchester jouant en Premier League', '1880-04-16', 2, "L'Etihad Stadium, niché à Manchester, est le foyer éclatant du Manchester City FC. Surnommé le City of Manchester Stadium, il se dresse fièrement au cœur de l'action. Avec une capacité de plus de 53 000 places, ce stade moderne est le théâtre de performances époustouflantes de l'équipe des Ciel et Blanc, illuminant les rêves des supporters.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\Stade.jpg" ,"Pep Guardiola", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\Entraineur.jpg" ),
('Real Madrid', 'Santiago Bernabéu', 'Club de football espagnol de la ville de Madrid', '1902-03-06', 3, "Le Santiago Bernabéu, légende du football basé à Madrid, est le temple sacré du Real Madrid. Renommé pour son histoire glorieuse, il peut accueillir plus de 80 000 fans passionnés. Ce stade emblématique est imprégné d'une atmosphère magique lors des matchs, offrant une expérience incomparable aux aficionados madrilènes.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\Stade.webp" ,"Carlo Ancelotti", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\Entraineur.jpg"),
('Chelsea', 'Stamford Bridge', 'Club de football londonien de Premier League', '1905-03-10', 2, "Stamford Bridge, résidence du Chelsea FC, se dresse avec élégance à Londres. Avec une capacité de plus de 40 000 sièges, ce stade empreint de tradition est le lieu où les Blues de Chelsea forgent leur histoire. L'atmosphère vibrante de Stamford Bridge fait de chaque match une aventure captivante.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\Stade.jpg" ,"Mauricio Pochettino", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\Entraineur.jpg"),
('Barcelone', 'Camp Nou', 'Club de football de Barcelone un des plus reconnus au monde', '1899-11-29', 3, "Le Camp Nou, situé à Barcelone, est le géant catalan où le FC Barcelone écrit son histoire. Avec une capacité de plus de 99 000 spectateurs, il est le plus grand stade d'Europe. L'ambiance électrique, et les prouesses de génies du ballon rond font du Camp Nou un lieu mythique.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\Stade.jpg" ,"Xavi Hernández", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\Entraineur.jpg"),
('PSG', 'Parc des Princes', 'Club de football français basé à Paris', '1970-08-12', 4, "Le Parc des Princes, joyau parisien, est l'antre du Paris Saint-Germain. Avec une capacité de plus de 48 000 places, ce stade moderne vibre au rythme des exploits des stars du PSG. L'élégance et le dynamisme du Parc des Princes en font un lieu emblématique du football français.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\Stade.jpg" ,"Luis Enrique", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\Entraineur.jpg"),
('Juventus', 'Allianz Stadium', 'Club de football italien situé à Turin', '1897-11-01', 5, "L'Allianz Stadium, situé à Turin, est le repaire de la Juventus. Avec une capacité de plus de 41 000 sièges, ce stade moderne offre une expérience immersive aux fans bianconeri. L'Allianz Stadium est le théâtre des triomphes de la Vecchia Signora, avec une ambiance électrisante à chaque rencontre.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\Stade.jpg" ,"Massimiliano Allegri", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\Entraineur.jpg"),
('Atlético de Madrid', 'Wanda Metropolitano', 'Club de football basé à Madrid, Espagne', '1903-04-26', 3, "Le Wanda Metropolitano, situé à Madrid, est le nouveau sanctuaire de l'Atlético de Madrid. Avec une capacité de plus de 68 000 places, il incarne la passion et la détermination des Colchoneros. Ce stade moderne est le témoin de la lutte incessante de l'Atlético sur le terrain.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\Stade.jpg" ,"Diego Simeone", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Marid\Entraineur.jpg" ),
('Man United', 'Old Trafford', 'Club de football anglais basé à Manchester, très populaire mondialement', '1878-01-01', 2, "Old Trafford, trésor de Manchester, est l'icône du Manchester United. Avec une capacité de plus de 74 000 sièges, il résonne de l'histoire glorieuse du club. Surnommé le Théâtre des Rêves, Old Trafford est le lieu où les Red Devils forgent leur légende, avec une atmosphère incomparable.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\Stade.jpg" ,"Erik ten Hag", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\Entraineur.jpg"),
('Roma', 'Stadio Olimpico', 'Club de football basé à Rome, Italie', '1927-07-22', 5, "Le Stadio Olimpico, situé à Rome, est le temple de l'AS Roma. Avec une capacité de plus de 70 000 places, ce stade historique a été le témoin de moments inoubliables de la Roma. L'atmosphère passionnée du Stadio Olimpico rend chaque match mémorable pour les supporters giallorossi.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\Stade.jpg" ,"José Mourinho", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\Entraineur.jpg");

-- Insertion de données dans la table Trophee
INSERT INTO Trophee (nom) VALUES
('Ligue 1'),
('Coupe de France'),
('Trophée des Champions (France)'),
('Serie A'),
('Coppa Italia'),
('Supercoppa Italiana'),
('Premier League'),
('FA Cup'),
('Carabao Cup'),
('Community Shield (Angleterre)'),
('Bundesliga'),
('DFB-Pokal'),
('DFL-Supercup'),
('La Liga'),
('Copa del Rey'),
('Supercopa de España'),
('Ligue des champions de l''UEFA'),
('Ligue Europa de l''UEFA'),
('Supercoupe de l''UEFA'),
('Fifa Club World Cup'),
('Audi Cup'),
('Premier League Asia Trophy'),
('International Champions Cup'),
('Trophée Joan Gamper'),
('UEFA Europa Conference League');

select *  from trophee;
