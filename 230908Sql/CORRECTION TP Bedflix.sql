-- Question n°1: Création de la BDD
DROP DATABASE IF EXISTS Bedflix;
CREATE DATABASE IF NOT EXISTS Bedflix;

USE Bedflix;

-- Question n°2: Création des tables
CREATE TABLE IF NOT EXISTS ROLES(
	id_role INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	libelle_role VARCHAR(25) NOT NULL UNIQUE
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS UTILISATEURS(
	id_utilisateur INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_utilisateur TEXT NOT NULL,
	prenom_utilisateur VARCHAR(25) NOT NULL, 
	email_utilisateur VARCHAR(100) NOT NULL,
	pseudo_utilisateur VARCHAR(25) NOT NULL,
	mot_de_passe_utilisateur VARCHAR(60) NOT NULL,
	photo_profil_utilisateur VARCHAR(100) NOT NULL,
    id_role INT NOT NULL, 
	FOREIGN KEY(id_role) REFERENCES roles(id_role)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS FILMS(
	id_film INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	titre_film VARCHAR(50) NOT NULL,
	description_film TEXT NOT NULL,
	affiche_film VARCHAR(50) NOT NULL,
	lien_film VARCHAR(255) NOT NULL,
	duree_film DOUBLE(5, 2) NOT NULL
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS UTILISATEURS_FILMS(
	id_utilisateur INT NOT NULL, 
	id_film INT NOT NULL,
    PRIMARY KEY(id_utilisateur, id_film),
    FOREIGN KEY(id_utilisateur) REFERENCES UTILISATEURS(id_utilisateur),
    FOREIGN KEY(id_film) REFERENCES FILMS(id_film) 
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS CATEGORIES(
	id_categorie INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	libelle_categorie VARCHAR(50) NOT NULL
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS FILMS_CATEGORIES(
	id_film INT NOT NULL,
	id_categorie INT NOT NULL,
    PRIMARY KEY(id_film, id_categorie), 
    FOREIGN KEY(id_film) REFERENCES FILMS(id_film), 
    FOREIGN KEY(id_categorie) REFERENCES CATEGORIES(id_categorie)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS SERIES(
	id_serie INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	titre_serie VARCHAR(50) NOT NULL,
	description_serie TEXT NOT NULL,
	affiche_serie VARCHAR(50) NOT NULL,
	lien_serie VARCHAR(255) NOT NULL
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS UTILISATEURS_SERIES(
	id_utilisateur INT NOT NULL, 
	id_serie INT NOT NULL,
    PRIMARY KEY(id_utilisateur, id_serie),
    FOREIGN KEY(id_utilisateur) REFERENCES UTILISATEURS(id_utilisateur),
    FOREIGN KEY(id_serie) REFERENCES SERIES(id_serie) 
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS SERIES_CATEGORIES(
	id_serie INT NOT NULL,
	id_categorie INT NOT NULL,
    PRIMARY KEY(id_serie, id_categorie), 
    FOREIGN KEY(id_serie) REFERENCES SERIES(id_serie)
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS SAISONS(
	id_saison INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	numero_saison INT NOT NULL,
	titre_saison VARCHAR(25) NOT NULL
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS EPISODES(
	id_episode INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	numero_episode INT NOT NULL,
	titre_episode VARCHAR(25) NOT NULL
) Engine=InnoDB;

-- Question n°3: Changer le type d'une donnée
ALTER TABLE UTILISATEURS
MODIFY nom_utilisateur VARCHAR(25);

-- Question n°4: Ajouter la colonne id_serie
ALTER TABLE SAISONS
ADD id_serie INT NOT NULL;
ALTER TABLE SAISONS
ADD FOREIGN KEY(id_serie) REFERENCES SERIES(id_serie);

-- Question n°5: Ajouter la colonne duree_episode
ALTER TABLE EPISODES
ADD duree_episode DOUBLE(5, 2) NOT NULL;

-- Question n°6: Ajouter la colonne id_saison
ALTER TABLE EPISODES
ADD id_saison INT NOT NULL;
ALTER TABLE EPISODES
ADD FOREIGN KEY(id_saison) REFERENCES SAISONS(id_saison);

-- Question n°7: Insertion de données
INSERT INTO ROLES(libelle_role)
VALUES 
	("Administrateur"), 
	("Utilisateur")
;
INSERT INTO UTILISATEURS(nom_utilisateur, prenom_utilisateur, email_utilisateur, pseudo_utilisateur, mot_de_passe_utilisateur, photo_profil_utilisateur, id_role)
VALUES
	("RODRIGUES", "Marceau", "marceaurodrigues@adrar-formation.com", "marceau", "AdR4r!", "default.png", 1), 
	("AROUDJ", "Zahra", "zahraarourdj@adrar-formation.com", "zahra", "AdR4r!", "default.png", 2),
	("CAYEZ", "Nicolas", "nicolascayez@adrar-formation.com", "nicolas", "AdR4r!", "default.png", 2),
	("CISCAR", "Samuel", "samuelciscar@adrar-formation.com", "samuel", "AdR4r!", "default.png", 2),
	("FONTA", "Coralie", "coraliefonta@adrar-formation.com", "coralie", "AdR4r!", "default.png", 2),
	("GUERIN", "Hugo", "hugoguerin@adrar-formation.com", "hugo", "AdR4r!", "default.png", 2),
	("HAUTBOUT", "Dylan", "dylanhautbout@adrar-formation.com", "dylan", "AdR4r!", "default.png", 2),
	("IGLLA", "Sarah", "sarahiglla@adrar-formation.com", "sarah", "AdR4r!", "default.png", 2),
	("LARA", "Maxime", "maximelara@adrar-formation.com", "maxime", "AdR4r!", "default.png", 2),
	("POZA", "Alicia", "aliciapoza@adrar-formation.com", "alicia", "AdR4r!", "default.png", 2),
	("ROLLIN", "Alexandre", "alexandrerollin@adrar-formation.com", "alexandre", "AdR4r!", "default.png", 2),
	("SENAC", "Jason", "jasonsenac@adrar-formation.com", "jason", "AdR4r!", "default.png", 2)
;
INSERT INTO CATEGORIES(libelle_categorie)
VALUES
	("Action"), 
	("Aventure"), 
	("Comédie"), 
	("Drame"), 
	("Horreur"), 
	("Science-fiction"), 
	("Fantastique"), 
	("Romance"), 
	("Thriller"), 
	("Mystère"), 
	("Animation"), 
	("Famille"), 
	("Documentaire"), 
	("Policier"), 
	("Historique"), 
	("Guerre"), 
	("Biographie"), 
	("Western"), 
	("Comédie musicale"), 
	("Film noir"), 
	("Super-héros")
;
INSERT INTO FILMS(titre_film, description_film, affiche_film, lien_film, duree_film)
VALUES 
	("Inception (2010)", "Dom Cobb est un voleur expérimenté – le meilleur qui soit dans l’art périlleux de l’extraction : sa spécialité consiste à s’approprier les secrets les plus précieux d’un individu, enfouis au plus profond de son subconscient, pendant qu’il rêve et que son esprit est particulièrement vulnérable. Très recherché pour ses talents dans l’univers trouble de l’espionnage industriel, Cobb est aussi devenu un fugitif traqué dans le monde entier qui a perdu tout ce qui lui est cher. Mais une ultime mission pourrait lui permettre de retrouver sa vie d’avant – à condition qu’il puisse accomplir l’impossible : l’inception. Au lieu de subtiliser un rêve, Cobb et son équipe doivent faire l’inverse : implanter une idée dans l’esprit d’un individu. S’ils y parviennent, il pourrait s’agir du crime parfait. Et pourtant, aussi méthodiques et doués soient-ils, rien n’aurait pu préparer Cobb et ses partenaires à un ennemi redoutable qui semble avoir systématiquement un coup d’avance sur eux. Un ennemi dont seul Cobb aurait pu soupçonner l’existence.", "inception.png", "https://www.youtube.com/watch?v=CPTIgILtna8", 136.8), 
	("La La Land (2016)", "Au cœur de Los Angeles, une actrice en devenir prénommée Mia sert des cafés entre deux auditions. De son côté, Sebastian, passionné de jazz, joue du piano dans des clubs miteux pour assurer sa subsistance. Tous deux sont bien loin de la vie rêvée à laquelle ils aspirent… Le destin va réunir ces doux rêveurs, mais leur coup de foudre résistera-t-il aux tentations, aux déceptions, et à la vie trépidante d’Hollywood ?", "lalaland.png", "https://www.youtube.com/watch?v=0pdqf4P9MB8", 124.8), 
	("The Shawshank Redemption (1994)", "Red, condamné à perpétuité, et Andy Dufresne, un gentil banquier injustement condamné pour meurtre, se lient d'une amitié inattendue qui va durer plus de vingt ans. Ensemble, ils découvrent l'espoir comme l'ultime moyen de survie. Sous des conditions terrifiantes et la menace omniprésente de la violence, les deux condamnés à perpétuité récupèrent leurs âmes et retrouvent la liberté dans leurs cœurs.", "les_evades.png", "https://www.youtube.com/watch?v=2e8Otbbcowc", 133.2), 
	("Pulp Fiction (1994)", "L'odyssée sanglante et burlesque de petits malfrats dans la jungle de Hollywood à travers trois histoires qui s'entremêlent.", "pulp_fiction.png", "https://www.youtube.com/watch?v=tGpTpVyI_OQ", 140.4), 
	("The Dark Knight (2008)", "Dans ce nouveau volet, Batman augmente les mises dans sa guerre contre le crime. Avec l'appui du lieutenant de police Jim Gordon et du procureur de Gotham, Harvey Dent, Batman vise à éradiquer le crime organisé qui pullule dans la ville. Leur association est très efficace mais elle sera bientôt bouleversée par le chaos déclenché par un criminel extraordinaire que les citoyens de Gotham connaissent sous le nom de Joker.", "the_dark_knight.png", "https://www.youtube.com/watch?v=UMgb3hQCb08", 139.2), 
	("Interstellar (2014)", "Le film raconte les aventures d’un groupe d’explorateurs qui utilisent une faille récemment découverte dans l’espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire. ", "interstellar.png", "https://www.youtube.com/watch?v=VaOijhK3CRU", 149.4), 
	("Avengers: Endgame (2019)", "Thanos ayant anéanti la moitié de l’univers, les Avengers restants resserrent les rangs dans ce vingt-deuxième film des Studios Marvel, grande conclusion d’un des chapitres de l’Univers Cinématographique Marvel.", "avengers_endgame.png", "https://www.youtube.com/watch?v=bgTlt5-l-AA", 181.2), 
	("Forrest Gump (1994)", "Quelques décennies d'histoire américaine, des années 1940 à la fin du XXème siècle, à travers le regard et l'étrange odyssée d'un homme simple et pur, Forrest Gump.", "forrest_gump.png", "https://www.youtube.com/watch?v=bLvqoHBptjg", 133.2), 
	("The Grand Budapest Hotel (2014)", "Le film retrace les aventures de Gustave H, l’homme aux clés d’or d’un célèbre hôtel européen de l’entre-deux-guerres et du garçon d’étage Zéro Moustafa, son allié le plus fidèle. La recherche d’un tableau volé, oeuvre inestimable datant de la Renaissance et un conflit autour d’un important héritage familial forment la trame de cette histoire au coeur de la vieille Europe en pleine mutation.", "the_grand_budapest_hotel.png", "https://www.youtube.com/watch?v=Lo1nz-scO4Q", 84.0), 
	("Spirited Away (2001)", "Chihiro, une fillette de 10 ans, est en route vers sa nouvelle demeure en compagnie de ses parents. Au cours du voyage, la famille fait une halte dans un parc à thème qui leur paraît délabré. Lors de la visite, les parents s’arrêtent dans un des bâtiments pour déguster quelques mets très appétissants, apparus comme par enchantement. Hélas cette nourriture les transforme en porcs. Prise de panique, Chihiro s’enfuit et se retrouve seule dans cet univers fantasmagorique ; elle rencontre alors l’énigmatique Haku, son seul allié dans cette terrible épreuve...", "spirited_away.png", "https://www.youtube.com/watch?v=6az9wGfeSgM", 123.0)
;
INSERT INTO SERIES(titre_serie, description_serie, affiche_serie, lien_serie)
VALUES 
	("Game of Thrones", "Inspirée des romans de George R.R. Martin, la série se déroule dans les Sept Royaumes de Westeros, où plusieurs familles nobles se battent pour le trône de fer et le contrôle du royaume.", "got.png", "https://www.youtube.com/watch?v=aAF12LNAeNI"), 
	("Stranger Things", "Une série de science-fiction se déroulant dans les années 1980, où un groupe d'enfants cherche à résoudre des mystères surnaturels, y compris la disparition de leur ami et l'apparition d'une jeune fille aux pouvoirs étranges.", "stranger_things.png", "https://www.youtube.com/watch?v=l7nzodXfVsg"), 
	("Breaking Bad", "Walter White, un professeur de chimie atteint d'un cancer en phase terminale, décide de se lancer dans la production de méthamphétamine pour assurer l'avenir financier de sa famille. Cela le conduit à plonger dans le monde dangereux de la drogue.", "breaking_bad.png", "https://www.youtube.com/watch?v=CoWsuFdqeYE"), 
	("The Crown", "Une série historique basée sur la vie de la reine Elizabeth II et les événements marquants de son règne, mettant en lumière les intrigues politiques, les relations familiales et les défis personnels auxquels elle est confrontée.", "the_crown.png", "https://www.youtube.com/watch?v=Gv4MQIQAFMs"), 
	("Black Mirror", "Une anthologie de science-fiction explorant les aspects sombres et dystopiques de la technologie moderne, présentant des histoires indépendantes et dérangeantes sur notre dépendance aux écrans et les conséquences inattendues de l'innovation technologique.", "black_mirror.png", "https://www.youtube.com/watch?v=d6-HaZ0zK6U") 
;
INSERT INTO SAISONS(numero_saison, titre_saison, id_serie)
VALUES 
	(1, "Saison 1", 1), 
	(2, "Saison 2", 1), 
	(3, "Saison 3", 1), 
	(4, "Saison 4", 1), 
	(5, "Saison 5", 1), 
	(6, "Saison 6", 1), 
	(7, "Saison 7", 1), 
	(8, "Saison 8", 1), 
	(1, "Saison 1", 2), 
	(2, "Saison 2", 2), 
	(3, "Saison 3", 2), 
	(4, "Saison 4", 2), 
	(1, "Saison 1", 3), 
	(2, "Saison 2", 3), 
	(3, "Saison 3", 3), 
	(4, "Saison 4", 3), 
	(5, "Saison 5", 3), 
	(1, "Saison 1", 4), 
	(2, "Saison 2", 4), 
	(3, "Saison 3", 4), 
	(4, "Saison 4", 4), 
	(5, "Saison 5", 4), 
	(1, "Saison 1", 5), 
	(2, "Saison 2", 5), 
	(3, "Saison 3", 5), 
	(4, "Saison 4", 5), 
	(5, "Saison 5", 5), 
	(6, "Saison 6", 5) 
;
INSERT INTO EPISODES(numero_episode, titre_episode, duree_episode, id_saison)
VALUES 
	(1, "Episode 1", 50.0, 1), 
	(2, "Episode 2", 50.0, 1), 
	(3, "Episode 3", 50.0, 1), 
	(4, "Episode 4", 50.0, 1), 
	(5, "Episode 5", 50.0, 1), 
	(6, "Episode 6", 50.0, 1), 
	(7, "Episode 7", 50.0, 1), 
	(8, "Episode 8", 50.0, 1), 
	(9, "Episode 9", 50.0, 1), 
	(10, "Episode 10", 50.0, 1), 
	(1, "Episode 1", 50.0, 2), 
	(2, "Episode 2", 50.0, 2), 
	(3, "Episode 3", 50.0, 2), 
	(4, "Episode 4", 50.0, 2), 
	(5, "Episode 5", 50.0, 2), 
	(6, "Episode 6", 50.0, 2), 
	(7, "Episode 7", 50.0, 2), 
	(8, "Episode 8", 50.0, 2), 
	(9, "Episode 9", 50.0, 2), 
	(10, "Episode 10", 50.0, 2),
	(1, "Episode 1", 50.0, 3), 
	(2, "Episode 2", 50.0, 3), 
	(3, "Episode 3", 50.0, 3), 
	(4, "Episode 4", 50.0, 3), 
	(5, "Episode 5", 50.0, 3), 
	(6, "Episode 6", 50.0, 3), 
	(7, "Episode 7", 50.0, 3), 
	(8, "Episode 8", 50.0, 3), 
	(9, "Episode 9", 50.0, 3), 
	(10, "Episode 10", 50.0, 3), 
	(1, "Episode 1", 50.0, 4), 
	(2, "Episode 2", 50.0, 4), 
	(3, "Episode 3", 50.0, 4), 
	(4, "Episode 4", 50.0, 4), 
	(5, "Episode 5", 50.0, 4), 
	(6, "Episode 6", 50.0, 4), 
	(7, "Episode 7", 50.0, 4), 
	(8, "Episode 8", 50.0, 4), 
	(9, "Episode 9", 50.0, 4), 
	(10, "Episode 10", 50.0, 4),  
	(1, "Episode 1", 50.0, 5), 
	(2, "Episode 2", 50.0, 5), 
	(3, "Episode 3", 50.0, 5), 
	(4, "Episode 4", 50.0, 5), 
	(5, "Episode 5", 50.0, 5), 
	(6, "Episode 6", 50.0, 5), 
	(7, "Episode 7", 50.0, 5), 
	(8, "Episode 8", 50.0, 5), 
	(9, "Episode 9", 50.0, 5), 
	(10, "Episode 10", 50.0, 5),
	(1, "Episode 1", 50.0, 6), 
	(2, "Episode 2", 50.0, 6), 
	(3, "Episode 3", 50.0, 6), 
	(4, "Episode 4", 50.0, 6), 
	(5, "Episode 5", 50.0, 6), 
	(6, "Episode 6", 50.0, 6), 
	(7, "Episode 7", 50.0, 6), 
	(8, "Episode 8", 50.0, 6), 
	(9, "Episode 9", 50.0, 6), 
	(10, "Episode 10", 50.0, 6), 
	(1, "Episode 1", 50.0, 7), 
	(2, "Episode 2", 50.0, 7), 
	(3, "Episode 3", 50.0, 7), 
	(4, "Episode 4", 50.0, 7), 
	(5, "Episode 5", 50.0, 7), 
	(6, "Episode 6", 50.0, 7), 
	(7, "Episode 7", 50.0, 7), 
	(8, "Episode 8", 50.0, 7), 
	(1, "Episode 1", 50.0, 8), 
	(2, "Episode 2", 50.0, 8), 
	(3, "Episode 3", 50.0, 8), 
	(4, "Episode 4", 50.0, 8), 
	(5, "Episode 5", 50.0, 8), 
	(6, "Episode 6", 50.0, 8), 
	(1, "Episode 1", 50.0, 9), 
	(2, "Episode 2", 50.0, 9), 
	(3, "Episode 3", 50.0, 9), 
	(4, "Episode 4", 50.0, 9), 
	(5, "Episode 5", 50.0, 9), 
	(6, "Episode 6", 50.0, 9), 
	(7, "Episode 7", 50.0, 9), 
	(8, "Episode 8", 50.0, 9), 
	(1, "Episode 1", 50.0, 10), 
	(2, "Episode 2", 50.0, 10), 
	(3, "Episode 3", 50.0, 10), 
	(5, "Episode 5", 50.0, 10), 
	(6, "Episode 6", 50.0, 10), 
	(7, "Episode 7", 50.0, 10), 
	(8, "Episode 8", 50.0, 10), 
	(9, "Episode 9", 50.0, 10), 
	(1, "Episode 1", 50.0, 11), 
	(2, "Episode 2", 50.0, 11), 
	(3, "Episode 3", 50.0, 11), 
	(4, "Episode 4", 50.0, 11), 
	(5, "Episode 5", 50.0, 11), 
	(6, "Episode 6", 50.0, 11), 
	(7, "Episode 7", 50.0, 11), 
	(8, "Episode 8", 50.0, 11), 
	(1, "Episode 1", 50.0, 12), 
	(2, "Episode 2", 50.0, 12), 
	(3, "Episode 3", 50.0, 12), 
	(4, "Episode 4", 50.0, 12), 
	(5, "Episode 5", 50.0, 12), 
	(6, "Episode 6", 50.0, 12), 
	(7, "Episode 7", 50.0, 12), 
	(8, "Episode 8", 50.0, 12), 
	(9, "Episode 9", 50.0, 12), 
	(1, "Episode 1", 47.0, 13), 
	(2, "Episode 2", 47.0, 13), 
	(3, "Episode 3", 47.0, 13), 
	(4, "Episode 4", 47.0, 13), 
	(5, "Episode 5", 47.0, 13), 
	(6, "Episode 6", 47.0, 13), 
	(7, "Episode 7", 47.0, 13), 
	(1, "Episode 1", 47.0, 15), 
	(2, "Episode 2", 47.0, 15), 
	(3, "Episode 3", 47.0, 15), 
	(4, "Episode 4", 47.0, 15), 
	(5, "Episode 5", 47.0, 15), 
	(6, "Episode 6", 47.0, 15), 
	(7, "Episode 7", 47.0, 15), 
	(8, "Episode 8", 47.0, 15), 
	(9, "Episode 9", 47.0, 15), 
	(10, "Episode 10", 47.0, 15), 
	(11, "Episode 11", 47.0, 15), 
	(12, "Episode 12", 47.0, 15), 
	(13, "Episode 13", 47.0, 15),
	(1, "Episode 1", 47.0, 16), 
	(2, "Episode 2", 47.0, 16), 
	(3, "Episode 3", 47.0, 16), 
	(4, "Episode 4", 47.0, 16), 
	(5, "Episode 5", 47.0, 16), 
	(6, "Episode 6", 47.0, 16), 
	(7, "Episode 7", 47.0, 16), 
	(8, "Episode 8", 47.0, 16), 
	(9, "Episode 9", 47.0, 16), 
	(10, "Episode 10", 47.0, 16), 
	(11, "Episode 11", 47.0, 16), 
	(12, "Episode 12", 47.0, 16), 
	(13, "Episode 13", 47.0, 16),  
	(14, "Episode 14", 47.0, 16),  
	(15, "Episode 15", 47.0, 16),  
	(16, "Episode 16", 47.0, 16),  
	(1, "Episode 1", 60.0, 17), 
	(2, "Episode 2", 60.0, 17), 
	(3, "Episode 3", 60.0, 17), 
	(4, "Episode 4", 60.0, 17), 
	(5, "Episode 5", 60.0, 17), 
	(6, "Episode 6", 60.0, 17), 
	(7, "Episode 7", 60.0, 17), 
	(8, "Episode 8", 60.0, 17), 
	(9, "Episode 9", 60.0, 17), 
	(10, "Episode 10", 60.0, 17),
	(1, "Episode 1", 60.0, 18), 
	(2, "Episode 2", 60.0, 18), 
	(3, "Episode 3", 60.0, 18), 
	(4, "Episode 4", 60.0, 18), 
	(5, "Episode 5", 60.0, 18), 
	(6, "Episode 6", 60.0, 18), 
	(7, "Episode 7", 60.0, 18), 
	(8, "Episode 8", 60.0, 18), 
	(9, "Episode 9", 60.0, 18), 
	(10, "Episode 10", 60.0, 18), 
	(1, "Episode 1", 60.0, 19), 
	(2, "Episode 2", 60.0, 19), 
	(3, "Episode 3", 60.0, 19), 
	(4, "Episode 4", 60.0, 19), 
	(5, "Episode 5", 60.0, 19), 
	(6, "Episode 6", 60.0, 19), 
	(7, "Episode 7", 60.0, 19), 
	(8, "Episode 8", 60.0, 19), 
	(9, "Episode 9", 60.0, 19), 
	(10, "Episode 10", 60.0, 19),
	(1, "Episode 1", 60.0, 20), 
	(2, "Episode 2", 60.0, 20), 
	(3, "Episode 3", 60.0, 20), 
	(4, "Episode 4", 60.0, 20), 
	(5, "Episode 5", 60.0, 20), 
	(6, "Episode 6", 60.0, 20), 
	(7, "Episode 7", 60.0, 20), 
	(8, "Episode 8", 60.0, 20), 
	(9, "Episode 9", 60.0, 20), 
	(10, "Episode 10", 60.0, 20),
	(1, "Episode 1", 60.0, 21), 
	(2, "Episode 2", 60.0, 21), 
	(3, "Episode 3", 60.0, 21), 
	(4, "Episode 4", 60.0, 21), 
	(5, "Episode 5", 60.0, 21), 
	(6, "Episode 6", 60.0, 21), 
	(7, "Episode 7", 60.0, 21), 
	(8, "Episode 8", 60.0, 21), 
	(9, "Episode 9", 60.0, 21), 
	(10, "Episode 10", 60.0, 21),
	(1, "Episode 1", 50.0, 22), 
	(2, "Episode 2", 50.0, 22), 
	(3, "Episode 3", 50.0, 22), 
	(1, "Episode 1", 50.0, 23), 
	(2, "Episode 2", 50.0, 23), 
	(3, "Episode 3", 50.0, 23), 
	(1, "Episode 1", 50.0, 24), 
	(2, "Episode 2", 50.0, 24), 
	(3, "Episode 3", 50.0, 24), 
	(4, "Episode 4", 50.0, 24), 
	(5, "Episode 5", 50.0, 24), 
	(6, "Episode 6", 50.0, 24), 
	(1, "Episode 1", 50.0, 25), 
	(2, "Episode 2", 50.0, 25), 
	(3, "Episode 3", 50.0, 25), 
	(1, "Episode 1", 50.0, 26), 
	(2, "Episode 2", 50.0, 26), 
	(3, "Episode 3", 50.0, 26), 
	(4, "Episode 4", 50.0, 26), 
	(5, "Episode 5", 50.0, 26) 
;
INSERT INTO SERIES_CATEGORIES(id_serie, id_categorie)
VALUES
	(1, 1), 
	(1, 4), 
	(1, 6), 
	(1, 7), 
	(1, 9), 
	(2, 1), 
	(2, 5), 
	(2, 6), 
	(2, 9), 
	(2, 10), 
	(2, 12), 
	(3, 1), 
	(3, 2), 
	(3, 9), 
	(3, 10), 
	(4, 10), 
	(5, 1), 
	(5, 2), 
	(5, 4), 
	(5, 5), 
	(5, 6)
;
INSERT INTO FILMS_CATEGORIES(id_film, id_categorie)
VALUES
	(1, 1), 
	(1, 4), 
	(1, 6), 
	(1, 10), 
	(2, 8), 
	(2, 9), 
	(2, 12), 
	(2, 19), 
	(3, 1), 
	(3, 2), 
	(3, 4), 
	(3, 9), 
	(3, 14), 
	(4, 1), 
	(4, 3), 
	(4, 4), 
	(4, 9), 
	(4, 14), 
	(5, 1), 
	(5, 2), 
	(5, 4), 
	(5, 6), 
	(5, 7), 
	(5, 9), 
	(5, 10), 
	(5, 14), 
	(5, 21), 
	(6, 1), 
	(6, 2), 
	(6, 4), 
	(6, 6), 
	(6, 9), 
	(6, 10), 
	(7, 1), 
	(7, 2), 
	(7, 3), 
	(7, 4), 
	(7, 7), 
	(7, 8), 
	(7, 9), 
	(7, 12), 
	(7, 16), 
	(7, 21), 
	(8, 2), 
	(8, 3), 
	(8, 4), 
	(8, 9), 
	(8, 12), 
	(9, 3), 
	(9, 4), 
	(9, 6), 
	(9, 10), 
	(10, 2), 
	(10, 4), 
	(10, 7), 
	(10, 9), 
	(10, 11), 
	(10, 12)
;
INSERT INTO UTILISATEURS_FILMS(id_utilisateur, id_film)
VALUES
	(4, 1),
	(1, 2),
	(3, 3),
	(8, 4),
	(6, 5),
	(11, 6),
	(12, 7) 
;
INSERT INTO UTILISATEURS_SERIES(id_utilisateur, id_serie)
VALUES
	(4, 1),
	(1, 2),
	(3, 3),
	(8, 4),
	(6, 5),
	(11, 6),
	(12, 7) 
;
-- Question n°8: Liste utilisateurs
SELECT *
FROM UTILISATEURS;

-- Question n°9: Liste utilisateurs avec libellé rôle
SELECT *
FROM UTILISATEURS
INNER JOIN ROLES ON ROLES.id_role = UTILISATEURS.id_role;

-- Question n°10: Liste séries et films
SELECT *
FROM FILMS

UNION 

SELECT *, "" AS duree_serie
FROM SERIES;

-- Question n°11: Liste films avec temps de fin de visionnage
SELECT titre_film, duree_film, DATE_ADD(NOW(), INTERVAL duree_film MINUTE) AS "Terminé vers"
FROM FILMS;

-- Question n°12: Récupérer la liste des séries avec le nombre d’épisodes pour chacune 
SELECT S.*, COUNT(E.id_episode)
FROM SERIES S
INNER JOIN SAISONS SA ON S.id_serie = SA.id_serie
INNER JOIN EPISODES E ON SA.id_saison = E.id_saison
GROUP BY S.id_serie;

-- Question n°13: Liste séries avec la durée totale
SELECT S.*, SUM(E.duree_episode)
FROM SERIES S
INNER JOIN SAISONS SA ON S.id_serie = SA.id_serie
INNER JOIN EPISODES E ON SA.id_saison = E.id_saison
GROUP BY S.id_serie;

-- Question n°14: Supprimer la table SAISONS
-- DELETE FROM SAISONS; -- Ne peut être tapée que si la table SERIES est supprimée, contraintes de clés


