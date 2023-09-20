DROP DATABASE IF EXISTS Adnum;
-- Question n°1: Création de la BDD
CREATE DATABASE Adnum;

USE Adnum;

-- Question n°2: Création des tables
CREATE TABLE IF NOT EXISTS UTILISATEURS(
	id_util INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	login_util VARCHAR(25) NOT NULL,
	mot_de_passe_util VARCHAR(60) NOT NULL
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS DROITS(
	id_droit INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	libelle_droit VARCHAR(25) NOT NULL
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS FOURNISSEURS(
	id_fourn INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_fourn VARCHAR(25) NOT NULL, 
	tel_fourn VARCHAR(25) NOT NULL, 
	adr_num_fourn INT NOT NULL, 
	adr_rue_fourn VARCHAR(50) NOT NULL, 
	adr_cp_fourn VARCHAR(20), 
	adr_ville_fourn VARCHAR(50) NOT NULL, 
	adr_pays_fourn VARCHAR(50) NOT NULL 
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS MATIERES_PREMIERES(
	id_mp INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_mp VARCHAR(25) NOT NULL, 
	prix_achat_mp DECIMAL(5, 2) NOT NULL, 
	qte_stk_mp INT NOT NULL 
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS FOURN_MP(
	id_fourn INT NOT NULL, 
	id_mp INT NOT NULL, 
    PRIMARY KEY(id_fourn, id_mp), 
    FOREIGN KEY(id_fourn) REFERENCES FOURNISSEURS(id_fourn), 
    FOREIGN KEY(id_mp) REFERENCES MATIERES_PREMIERES(id_mp)
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS TYPE_PF(
	id_type_pf INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_type_pf VARCHAR(75) NOT NULL
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS PRODUITS_FINIS(
	id_pf INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_pf VARCHAR(75) NOT NULL, 
	prix_vente_pf DECIMAL(7, 2) NOT NULL, 
	qte_stk_pf INT NOT NULL, 
	id_type_pf INT NOT NULL, 
    FOREIGN KEY(id_type_pf) REFERENCES TYPE_PF(id_type_pf)
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS PF_MP(
	id_pf INT NOT NULL, 
	id_mp INT NOT NULL, 
    PRIMARY KEY(id_pf, id_mp), 
    FOREIGN KEY(id_pf) REFERENCES PRODUITS_FINIS(id_pf), 
    FOREIGN KEY(id_mp) REFERENCES MATIERES_PREMIERES(id_mp)
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS CLIENTS(
	id_cli INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_cli VARCHAR(50) NOT NULL, 
	tel_cli VARCHAR(25) NOT NULL, 
	adr_num_cli INT NOT NULL, 
	adr_rue_cli VARCHAR(50) NOT NULL, 
	adr_cp_cli VARCHAR(20), 
	adr_ville_cli VARCHAR(50) NOT NULL, 
	adr_pays_cli VARCHAR(50) NOT NULL 
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS CLIENTS_PF(
	id_cli INT NOT NULL, 
	id_pf INT NOT NULL, 
    PRIMARY KEY(id_cli, id_pf), 
    FOREIGN KEY(id_cli) REFERENCES CLIENTS(id_cli), 
    FOREIGN KEY(id_pf) REFERENCES PRODUITS_FINIS(id_pf)
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS COMMERCIAUX(
	id_comm INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
	nom_comm VARCHAR(50) NOT NULL, 
	prenom_comm VARCHAR(50) NOT NULL, 
	tel_comm VARCHAR(25) NOT NULL
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS CLIENTS_COMMERCIAUX(
	id_cli INT NOT NULL, 
	id_comm INT NOT NULL, 
    chiffre_affaires DECIMAL(8, 2) NOT NULL, 
    PRIMARY KEY(id_cli, id_comm), 
    FOREIGN KEY(id_cli) REFERENCES CLIENTS(id_cli), 
    FOREIGN KEY(id_comm) REFERENCES COMMERCIAUX(id_comm)
) Engine=InnoDB;
CREATE TABLE IF NOT EXISTS COMMERCIAUX_PF(
	id_comm INT NOT NULL, 
  	id_pf INT NOT NULL, 
	PRIMARY KEY(id_comm, id_pf), 
    FOREIGN KEY(id_comm) REFERENCES COMMERCIAUX(id_comm), 
    FOREIGN KEY(id_pf) REFERENCES PRODUITS_FINIS(id_pf)
) Engine=InnoDB;

-- Question n°4: Ajout de l'id_droit à la table utilisateurs
ALTER TABLE UTILISATEURS
ADD	(
	id_droit INT,
	FOREIGN KEY(id_droit) REFERENCES DROITS(id_droit)
);

-- Question n°5: Insertion des données
INSERT INTO CLIENTS(nom_cli, tel_cli, adr_num_cli, adr_rue_cli, adr_cp_cli, adr_ville_cli, adr_pays_cli)
VALUES
	("Dupont Alice", "+33612345678", 123, "Rue des Lilas", "75001", "Paris", "France"), 
	("Smith John", "+1555-123-4567", 456, "Oak Street", "NY 10001", "New York", "USA"), 
	("Garcia Maria", "+34666778899", 789, "Calle Primavera", NULL, "Madrid", "Espagne"), 
	("Müller Hans", "+493098765432", 10, "Hauptstraße", "10115", "Berlin", "Allemagne"), 
	("Yamamoto Sakura", "+81398765432", 123, "Sakura Street", NULL, "Tokyo", "Japon")
;
INSERT INTO COMMERCIAUX(nom_comm, prenom_comm, tel_comm)
VALUES
	("Dupont", "Jean", "+33601020304"), 
	("Martin", "Marie", "+33678563412"), 
	("Leclerc", "Pierre", "+33612345678"), 
	("Lambert", "Sophie", "+33687456321"), 
	("Gagnon", "Thomas", "+33623456789")
;
INSERT INTO DROITS(libelle_droit)
VALUES
	("Administrateur"), 
	("Modérateur"), 
	("Utilisateur enregistré")
;
INSERT INTO FOURNISSEURS(nom_fourn, tel_fourn, adr_num_fourn, adr_rue_fourn, adr_cp_fourn, adr_ville_fourn, adr_pays_fourn)
VALUES
	("La Belle Électronique", "+33145678901", 23, "Rue des Innovations", "75008", "Paris", "France"), 
	("Naturellement Bio", "+33189123456", 10, "Avenue de la Santé", "69002 ", "Lyon", "France"), 
	("Mode Urbaine Chic", "+33165432109", 5, "Rue de la Mode", "33000 ", "Bordeaux", "France"), 
	("Tech Solutions Pro", "+33176543210", 15, "Boulevard de l'Informatique", "69001 ", "Lyon", "France"), 
	("Délices Gourmands", "+33154987602", 8, "Place des Saveurs", "75012 ", "Paris", "France")
;
INSERT INTO TYPE_PF(nom_type_pf)
VALUES
	("Électronique grand public"), 
	("Vêtements et accessoires"), 
	("Meubles et ameublement"), 
	("Produits de beauté et de soins personnels"), 
	("Jouets et jeux"), 
	("Articles ménagers"), 
	("Produits de nettoyage et d'entretien"), 
	("Matériaux de construction"), 
	("Produits automobiles"), 
	("Produits alimentaires")
;
INSERT INTO PRODUITS_FINIS(nom_pf, prix_vente_pf, qte_stk_pf, id_type_pf)
VALUES
	("Téléviseurs", 400.0, 10, 1), 
	("Smartphones", 800.0, 100, 1), 
	("Ordinateurs portables", 1500.0, 8, 1), 
	("T-shirts", 15.0, 1000, 2), 
	("Robes", 80.0, 75, 2), 
	("Pantalons", 30.0, 50, 2), 
	("Chaussures", 100.0, 25, 2), 
	("Céréales", 1.25, 1000, 3), 
	("Boissons", 0.50, 1000, 3), 
	("Conserves", 1.50, 82, 3), 
	("Canapés", 2000.0, 2, 4), 
	("Tables", 105.0, 5, 4), 
	("Étagères", 25.0, 50, 4), 
	("Maquillage", 0.57, 500, 5), 
	("Parfums", 80.0, 50, 5), 
	("Savons", 2.50, 50, 5), 
	("Peluches", 200.0, 5, 6), 
	("Jeux de société", 20.50, 60, 6), 
	("Consoles de jeux", 200.0, 10, 6), 
	("Vaisselle", 2.0, 100, 7), 
	("Électroménagers", 400.0, 5, 7), 
	("Détergents", 4.0, 50, 8), 
	("Produits d'entretien ménager", 4.50, 50, 8), 
	("Briques", 1.50, 50, 9), 
	("Tuiles", 10.50, 40, 9), 
	("Isolants", 42.50, 400, 9), 
	("Voitures", 12500.0, 5, 10)
;
INSERT INTO UTILISATEURS(login_util, mot_de_passe_util, id_droit)
VALUES
	("alice123", "A#k9L!x$1", 1),
	("bobSmith", "P@ssw0rd!2", 2),
	("johnDoe", "5ecureP@$$", 2),
	("emmaJohnson", "My$3cretCode", 3),
	("samWilliams", "9Tru$tM3!", 3)
;
-- Question n°6: Récupérer les utilisateurs
SELECT *
FROM UTILISATEURS;

-- Question n°7: Récupérer les utilisateurs avec le libellé de leur rôle
SELECT *
FROM UTILISATEURS
INNER JOIN DROITS ON DROITS.id_droit = UTILISATEURS.id_droit;

-- Question n°8: Récupérer la somme du chiffres d’affaires par commercial et par client
SELECT nom_comm, nom_cli, SUM(chiffre_affaires) 
FROM CLIENTS_COMMERCIAUX CC 
INNER JOIN CLIENTS C ON C.id_cli = CC.id_cli 
INNER JOIN COMMERCIAUX CO ON CO.id_comm = CC.id_comm 
GROUP BY CO.id_comm, C.id_cli;

-- Question n°9: Récupérer la somme du chiffres d’affaires par commercial 
SELECT nom_comm, SUM(chiffre_affaires) 
FROM CLIENTS_COMMERCIAUX CC 
INNER JOIN COMMERCIAUX CO ON CO.id_comm = CC.id_comm 
GROUP BY CO.id_comm;

-- Question n°10: Récupérer la somme du chiffres d’affaires par client
SELECT nom_cli, SUM(chiffre_affaires) 
FROM CLIENTS_COMMERCIAUX CC 
INNER JOIN CLIENTS C ON C.id_cli = CC.id_cli 
GROUP BY C.id_cli;

-- Question n°11: Récupérer la moyenne du chiffres d’affaires par commercial et par client
SELECT nom_comm, nom_cli, AVG(chiffre_affaires) 
FROM CLIENTS_COMMERCIAUX CC 
INNER JOIN CLIENTS C ON C.id_cli = CC.id_cli 
INNER JOIN COMMERCIAUX CO ON CO.id_comm = CC.id_comm 
GROUP BY CO.id_comm, C.id_cli;

-- Question n°12: Récupérer la moyenne du chiffres d’affaires par commercial 
SELECT nom_comm, AVG(chiffre_affaires) 
FROM CLIENTS_COMMERCIAUX CC 
INNER JOIN COMMERCIAUX CO ON CO.id_comm = CC.id_comm 
GROUP BY CO.id_comm;

-- Question n°13: Récupérer la moyenne du chiffres d’affaires par client 
SELECT nom_cli, AVG(chiffre_affaires) 
FROM CLIENTS_COMMERCIAUX CC 
INNER JOIN CLIENTS C ON C.id_cli = CC.id_cli 
GROUP BY C.id_cli;

-- Question n°14: Supprimer la table CLIENTS_COMMERCIAUX 
-- DROP TABLE IF EXISTS CLIENTS_COMMERCIAUX;