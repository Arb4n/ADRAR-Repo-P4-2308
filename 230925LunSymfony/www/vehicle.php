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

?>