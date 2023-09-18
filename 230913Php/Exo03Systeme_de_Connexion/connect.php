<?php


// try {
//     // Code pour établir la connexion à la base de données
//     $db = new PDO('mysql:host=localhost;dbname=votre_base_de_donnees', 'votre_utilisateur', 'votre_mot_de_passe');
//     // ... Autres opérations de configuration de la connexion ...
// } catch (PDOException $e) {
//     // Gestion des erreurs de connexion à la base de données
//     echo ("Erreur: " . $e->getMessage());
//     die(); // Arrêter le script après affichage de l'erreur
// }




    session_start();

    try {
        $db = new PDO('mysql:host=localhost;dbname=adrar_classrooms', "root", "", array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    } catch (PDOException $e) {
        $db = NULL;
        echo ("Erreur : " . $e->getMessage());
        die();
    }
    
    





    
    ?>