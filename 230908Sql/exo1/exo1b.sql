DROP DATABASE Exo1;
CREATE DATABASE IF NOT EXISTS Exo1;
USE Exo1;

CREATE TABLE IF NOT EXISTS REPRESENTATIONS
(
id_rep INT PRIMARY KEY auto_increment,
titre_rep VARCHAR(50),
lieu_rep VARCHAR(50)
    
);

INSERT INTO REPRESENTATIONS (titre_rep, lieu_rep)
VALUES
('Hellfest', 'Rennes'),
('Destructor Festival', 'Aix-en-Provence'),
('Concerto le lac des cygnes', 'Paris');

CREATE TABLE IF NOT EXISTS MUSICIENS
(
id_musicien INT PRIMARY KEY auto_increment,
nom_musicien VARCHAR(50),
id_rep INT,
FOREIGN KEY (id_rep) REFERENCES REPRESENTATIONS(id_rep)
);

INSERT INTO MUSICIENS (id_musicien, nom_musicien, id_rep)
VALUES
(1, 'Lorenzo', 2), 
(2,'Moustaki', 2),
(3,'Rammstein', 3),
(4, 'Pipon', 1);

CREATE TABLE IF NOT EXISTS PROGRAMMATION
(
id_rep INT PRIMARY KEY auto_increment,
date_prog DATE,
tarif_prog DECIMAL(10,2)
    
);

INSERT INTO PROGRAMMATION (id_rep, date_prog, tarif_prog)
VALUES
(1, '2022-07-25', 35.99),
(2, '2023-10-33', 55.99),
(3, '2023-11-01', 99.99);


SELECT * FROM representations;
SELECT * FROM MUSICIENS; 

#La liste des titres des représentations
SELECT titre_rep FROM REPRESENTATIONS;


#La liste des titres des représentations ayant lieu au « théâtre allissa »
SELECT titre_rep FROM REPRESENTATIONS
WHERE lieu_rep = 'Théâtre Allissa';

#La liste des noms des musiciens et les titres des représentations auxquelles ils participent
SELECT musiciens.nom_musicien, representations.titre_rep
FROM musiciens
INNER JOIN representations ON musiciens.id_rep = representations.id_rep;

#La liste des titres des représentations, les lieux et les tarifs du 25/07/2022
SELECT representations.titre_rep, representations.lieu_rep, programmation.tarif_prog
FROM representations
INNER JOIN programmation ON representations.id_rep = programmation.id_rep
WHERE programmation.date_prog = '2022-07-25';

#Le nombre de musiciens qui participent à la représentation n°20
SELECT COUNT(*) AS nombre_de_musiciens
FROM musiciens
WHERE id_rep = 2;

#Les représentations et leurs dates dont le tarif ne dépasse pas 20DH
SELECT representations.titre_rep, programmation.date_prog, programmation.tarif_prog
FROM representations
INNER JOIN programmation ON representations.id_rep = programmation.id_rep
WHERE programmation.tarif_prog <= 50;

