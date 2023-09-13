DROP DATABASE Exo3;
CREATE DATABASE  Exo3;
USE Exo3;


/*
Soit le schéma relationnel suivant:
ETUDIANTS(id_etud, nom_etud, prenom_etud)
MATIERES(code_matiere, libelle_matiere, coeff_matiere)
EVALUER(#id_etud, #code_matiere, date, note)

Écrivez par la suite les requêtes pour:
Créer la base de données Exo3
Créer les tables par rapport au schéma relationnel ci-dessus
Insérer des données dans les tables principales puis dans les tables d’association

*/

CREATE TABLE ETUDIANTS(
 id_etud VARCHAR(50) PRIMARY KEY NOT NULL, 
 nom_etud VARCHAR(50) NOT NULL, 
 prenom_etud VARCHAR(50) NOT NULL
 );
 
INSERT INTO ETUDIANTS (id_etud, nom_etud, prenom_etud)
VALUES
('ETU001', 'Doe', 'John'),
('ETU002', 'Smith', 'Jane'),
('ETU003', 'Johnson', 'Robert'),
('ETU004', 'Williams', 'Alice'),
('ETU005', 'Brown', 'Michael'),
('ETU006', 'Davis', 'Sarah'),
('ETU007', 'Wilson', 'David'),
('ETU008', 'Lee', 'Jennifer'),
('ETU009', 'Miller', 'Christopher'),
('ETU010', 'White', 'Mary'),
('ETU011', 'Jones', 'James'),
('ETU012', 'Hall', 'Linda'),
('ETU013', 'Brown', 'William'),
('ETU014', 'Davis', 'Patricia'),
('ETU015', 'Martinez', 'Richard'),
('ETU016', 'Taylor', 'Karen'),
('ETU017', 'Clark', 'Edward'),
('ETU018', 'Garcia', 'Susan'),
('ETU019', 'Johnson', 'Michael'),
('ETU020', 'Moore', 'Laura'),
('ETU021', 'Anderson', 'Thomas'),
('ETU022', 'Harris', 'Elizabeth'),
('ETU023', 'Wilson', 'Richard'),
('ETU024', 'Garcia', 'Maria'),
('ETU025', 'Brown', 'Jennifer'),
('ETU026', 'Lee', 'Matthew'),
('ETU027', 'Davis', 'Sarah'),
('ETU028', 'Smith', 'William'),
('ETU029', 'Anderson', 'Jessica'),
('ETU030', 'Martinez', 'Daniel'),
('ETU031', 'Hall', 'Michelle'),
('ETU032', 'White', 'John'),
('ETU033', 'Harris', 'Sarah'),
('ETU034', 'Davis', 'Brian'),
('ETU035', 'Jones', 'Nancy'),
('ETU036', 'Smith', 'Kevin'),
('ETU037', 'Wilson', 'Laura'),
('ETU038', 'Moore', 'Michael'),
('ETU039', 'Brown', 'Sandra'),
('ETU040', 'Lee', 'James'),
('ETU041', 'Davis', 'Jessica'),
('ETU042', 'Johnson', 'David'),
('ETU043', 'Williams', 'Sarah'),
('ETU044', 'Taylor', 'Paul'),
('ETU045', 'Smith', 'Catherine'),
('ETU046', 'Martin', 'Charles'),
('ETU047', 'Wilson', 'Karen'),
('ETU048', 'Garcia', 'Peter'),
('ETU049', 'Davis', 'Amy'),
('ETU050', 'Brown', 'Thomas');


CREATE TABLE MATIERES(
code_matiere VARCHAR(50) PRIMARY KEY NOT NULL, 
libelle_matiere VARCHAR(50) NOT NULL,
coeff_matiere INT NOT NULL
);

INSERT INTO MATIERES(code_matiere, libelle_matiere, coeff_matiere)
VALUES
('M101', 'Maths', 3),
('AP01', 'Arts Plastiques', 8),
('LIT01', 'Littérature', 4),
('EPS01', 'Sport', 1),
('MU01', 'Musique', 6),
('IT01', 'Informatique', 6),
('BTP01', 'BTP', 5);

CREATE TABLE EVALUER(
FOREIGN KEY (id_etud) REFERENCES ETUDIANTS(id_etud),
FOREIGN KEY (code_matiere) REFERENCES MATIERES(code_matiere),
date_jour DATE NOT NULL, 
note DECIMAL(2,2) 
);

INSERT INTO EVALUER(id_etud, code_matiere, date_jour, note)
VALUES
('ETU001', 'MAT101', '2023-09-10', 17.5),
('ETU001', 'AP01', '2023-09-12', 18.0),
('ETU001', 'MU01', '2023-09-14', 15.8),
('ETU002', 'MAT101', '2023-09-11', 16.2),
('ETU002', 'AP01', '2023-09-10', 14.9),
('ETU002', 'MU01', '2023-09-15', 17.4),
('ETU003', 'MAT101', '2023-09-12', 19.1),
('ETU003', 'AP01', '2023-09-14', 16.7),
('ETU003', 'MU01', '2023-09-13', 18.3),
('ETU004', 'MAT101', '2023-09-09', 15.0),
('ETU004', 'AP01', '2023-09-10', 17.2),
('ETU004', 'MU01', '2023-09-11', 16.5),
('ETU005', 'MAT101', '2023-09-12', 18.9),
('ETU005', 'AP01', '2023-09-13', 15.4),
('ETU005', 'MU01', '2023-09-14', 19.6),
('ETU006', 'MAT101', '2023-09-15', 16.0),
('ETU006', 'AP01', '2023-09-16', 17.8),
('ETU006', 'MU01', '2023-09-17', 15.2),
('ETU007', 'MAT101', '2023-09-18', 18.7),
('ETU007', 'AP01', '2023-09-19', 19.5),
('ETU007', 'MU01', '2023-09-20', 17.3);

#SELECT * FROM DEPARTEMENTS, EMPLOYES;
/*
Quel est le nombre total d’étudiants ?*/
SELECT id_etud, SUM(note) AS total_score
FROM EVALUER
GROUP BY id_etud;

/* SELECT COUNT(*) AS nombre_total_etudiants
FROM ETUDIANTS; */ 
/*
Quelles sont, parmi l’ensemble des notes, la note la plus haute et la note la plus basse ?
*/
SELECT MAX(note) AS max_note
FROM EVALUER;

/*Quelles sont les moyennes de chaque étudiant dans chacune des matières ?
*/
/*SELECT
    EVALUER.id_etud,
    MATIERES.code_matiere,
    AVG(E.note) AS moyenne
FROM
    EVALUER 
JOIN
    MATIERES 
ON
    EVALUER.code_matiere = MATIERES.code_matiere
GROUP BY
    EVALUER.id_etud,
    MATIERES.code_matiere
ORDER BY
    EVALUER.id_etud,
    MATIERES.code_matiere;
*/
/*Quelles sont les moyennes par matière ? Avec la vue MGETU de la question 3 (MoyEtuMat)
Quelle est la moyenne générale de chaque étudiant ? Avec la vue MGETU de la question 3 
Quelle est la moyenne générale de la promotion ? Avec la vue MGETU de la question 5 :
Quels sont les étudiants qui ont une moyenne générale supérieure ou égale à la moyenne générale de la promotion? Avec la vue MGETU de la question 5
*/
