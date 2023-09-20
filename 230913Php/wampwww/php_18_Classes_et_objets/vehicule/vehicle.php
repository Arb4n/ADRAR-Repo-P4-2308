<?php

class Vehicule {
    public $nomVehicule;
    public $roues;
    public $vitesse;


    public function demarrer($sTest) {
        echo "<p>Démarrage d'une $this->nomVehicule en cours...</p>";
        echo "<p>$sTest</p>";
    }
}

$vehicule = new Vehicule();
$vehicule->nomVehicule = "Audi";
// appel de la méthode démarrer qui va afficher le texte
$vehicule->demarrer("Bidule");

var_dump($vehicule);

print_r($vehicule);

?>

<!-- <!DOCTYPE html>
<html>
    <head>
        <title>Cours PHP & MySQL</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="cours.css">
    </head>
    
    <body>
        <h1>Titre principal</h1>
        <?php
            //Affiche "Hello World" avec un retour à la ligne
            echo 'Hello World <br>'; //Ceci est un commentaire PHP
            
            /*Affiche
              "Bonjour le Monde
            */
            echo "Bonjour le Monde"; /*Ceci est un commentaire PHP*/
        ?>
        <p>Un paragraphe</p>
    </body>
</html> -->