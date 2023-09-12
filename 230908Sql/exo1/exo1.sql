CREATE DATABASE Exo1;

CREATE TABLE REPRESENTATIONS
(
id_rep INT PRIMARY KEY auto_increment,
titre_rep VARCHAR(50),
lieu_rep VARCHAR(50)
    
);

CREATE TABLE musiciens
(
id_musicien INT PRIMARY KEY auto_increment,
nom_musicien VARCHAR(50)
#id_rep
    
);


CREATE TABLE programmation
(
#id_rep INT PRIMARY KEY auto_increment,
date_prog DATE,
tarif_prog DEC
    
);