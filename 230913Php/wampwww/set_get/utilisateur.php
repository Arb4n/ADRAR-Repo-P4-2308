
<?php
// 1>> création d'une classe utilisateurs
class Utilisateur {

    // 2>> définition des attributs de la classe utilisateurs
    protected  $id;
    private  $nom;
    private  $prenom;


// 3>> Création des accesseurs lol
    public function getId() {
        return $this->id;
    }

    public function getNom() {
        return $this->nom;
    }

    public function getPrenom() {
        return $this->prenom;
    }


// 4>> Création des setters correspondants    

public function setId($new_id) {
        return $this->id = $new_id;
    }

    public function setNom($new_nom) {
        return $this->nom = $new_nom;
    }

    public function setPrenom($new_prenom) {
        return $this->prenom = $new_prenom;
    }

}


$utilisateur_1 = new Utilisateur();
$utilisateur_1->setNom("Cranston");

echo($utilisateur_1->getNom());


// $utilisateur_2 = new Utilisateur();
// $utilisateur_2->setNom("reynolds");
// echo($utilisateur_2->getNom());


$utilisateur_2 = new Utilisateur("reynolds");
// $utilisateur_2->setNom("reynolds");
echo($utilisateur_2->getNom());

class Truc {
    private $id;
    private $bidule;

    public function __construct($îd {
        
    })
} 

?>