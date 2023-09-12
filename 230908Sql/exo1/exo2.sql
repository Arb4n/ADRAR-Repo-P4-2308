
/*

Donner la liste des employés ayant une commission
Donner les noms, emplois et salaires des employés par emploi croissant, et pour chaque emploi, par salaire décroissant
Donner le salaire moyen des employés
Donner le salaire moyen du département Production
Donner les numéros de département et leur salaire maximum
Donner les différentes professions et leur salaire moyen
Donner le salaire le plus bas par profession
Donner le ou les emplois ayant le salaire moyen le plus bas, ainsi que ce salaire moyen

*/

/*
Soit le schéma relationnel suivant:
DEPARTEMENTS(id_dep, nom_dep, directeur_dep, ville_dep)
EMPLOYES(id_emp, nom_emp, prof, date_embauche_emp, salaire_emp, commission_emp, #id_dep)
Insérer des données dans les tables principales puis dans les tables d’association
*/

DROP DATABASE Exo2;
CREATE DATABASE  Exo2;
USE Exo2;

CREATE TABLE DEPARTEMENTS (
id_dep INT NOT NULL, 
nom_dep VARCHAR(50),
directeur_dep VARCHAR (50), 
ville_dep VARCHAR (50)
);

INSERT INTO DEPARTEMENTS (id_dep, nom_dep, directeur_dep, ville_dep)
VALUES
(1, 'Vente', 'Ledruand', 'Montluçon'),
(2, 'Marketing', 'Leplantu', 'Montluçon'),
(3, 'Communication', 'Lelit', 'Montluçon'),
(4, 'Management', 'Theboss', 'Montluçon'),
(5, 'Vente', 'Dwight', 'Montferrand'),
(6, 'Marketing', 'De Mesmaeker', 'Montferrand'),
(7, 'Comptabilité', 'Oscar', 'Montferrand'),
(8, 'Management', 'Ryan', 'Monferrand'),
(9, 'Vente', 'Bill', 'Montgomery'),
(10, 'Marketing', 'Flantier', 'Montgomery'),
(11, 'Comptabilité', 'Brune', 'Montgomery'),
(12, 'Management', 'Scott', 'Montgomery'), 
(13, 'Vente', 'Cleese', 'Montypython'),
(14, 'Marketing', 'Idle', 'Montypython'),
(15, 'Comptabilité', 'Chapman', 'Montypython'),
(16, 'Management', 'Gilliam', 'Montypython');


CREATE TABLE EMPLOYES (
id_emp VARCHAR (50),
nom_emp VARCHAR (50),
prof VARCHAR (50),
date_embauche_emp DATE,
salaire_emp DECIMAL (12,2),
comission_emp DECIMAL (12,2), 
id_dep INT PRIMARY KEY 
);
/*
INSERT INTO EMPLOYES (id_emp, nom_emp, prof, date_embauche_emp, salaire_emp, 
comission_emp, id_dep)
VALUES
('EMP001', 'John Doe', 'Manager', '2022-01-15', 60000.00, 5000.00, 1),
('EMP002', 'Jane Smith', 'Analyste', '2022-03-20', 45000.00, 2500.00, 2),
('EMP003', 'Robert Johnson', 'Développeur', '2021-11-10', 55000.00, 3000.00, 1),
('EMP004', 'Alice Williams', 'Comptable', '2022-05-05', 52000.00, 3500.00, 3),
('EMP005', 'Michael Brown', 'Ingénieur', '2021-09-30', 65000.00, 4000.00, 2),
('EMP006', 'Sarah Davis', 'Manager', '2022-02-28', 62000.00, 4800.00, 1),
('EMP007', 'David Wilson', 'Analyste', '2022-04-15', 46000.00, 2700.00, 3),
('EMP008', 'Jennifer Lee', 'Développeur', '2021-12-05', 54000.00, 3200.00, 2),
('EMP009', 'Christopher Miller', 'Comptable', '2022-06-10', 53000.00, 3600.00, 1),
('EMP010', 'Mary White', 'Ingénieur', '2021-10-20', 67000.00, 4200.00, 3),
('EMP011', 'James Jones', 'Manager', '2022-03-01', 61000.00, 4900.00, 2),
('EMP012', 'Linda Hall', 'Analyste', '2022-05-25', 47000.00, 2600.00, 1),
('EMP013', 'William Brown', 'Développeur', '2021-11-15', 56000.00, 3100.00, 3),
('EMP014', 'Patricia Davis', 'Comptable', '2022-07-05', 54000.00, 3700.00, 2),
('EMP015', 'Richard Martinez', 'Ingénieur', '2021-08-10', 69000.00, 4300.00, 1),
('EMP016', 'Karen Taylor', 'Manager', '2022-02-15', 63000.00, 4600.00, 3),
('EMP017', 'Edward Clark', 'Analyste', '2022-04-30', 48000.00, 2800.00, 2),
('EMP018', 'Susan Garcia', 'Développeur', '2021-12-20', 55000.00, 3300.00, 1),
('EMP019', 'Michael Johnson', 'Comptable', '2022-08-15', 55000.00, 3800.00, 2),
('EMP020', 'Laura Moore', 'Ingénieur', '2021-10-05', 71000.00, 4400.00, 3);*/

SELECT * FROM DEPARTEMENTS, EMPLOYES;

#SHOW DATABASES;
/*
Écrivez par la suite les requêtes pour:
Créer la base de données Exo2
Créer les tables par rapport au schéma relationnel ci-dessus */
