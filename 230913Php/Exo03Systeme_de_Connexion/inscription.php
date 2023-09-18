<?php 

// Inclure connecteur à la base de données
include('./connect.php');


if(!empty($_POST["form_inscription"])) {

    $select = $db->prepare("SELECT user_email FROM users WHERE user_email=:user_email;");
    $select->bindParam(":user_email", $_POST["form_email"]);
    $select->execute();
    if (empty($select->fetch(PDO::FETCH_COLUMN))){
        $insert = $db->prepare("$INSERT INTO users(user_email, user_password)
                                VALUES(:user_mail, :user_password);");
        $insert->bindParam(":user_mail", $_POST['form_email']);

        // Pour hacher le mdp : Remplacer le bindParam du mot de passe 
        // $insert->bindParam(":user_password", $_POST['form_password']);
        // par: 

        $user_password = password_hash($_POST['form_password'], PASSWORD_BCRYPT, array("cost" => 12));
        $insert->bindParam(":user_password", $user_password);

        if($insert->execute()) {
            die('<p style="color: green;">Inscription réussie.</p><a hred="connexion.php">Se Connecter.</a>');
        }
        die('<p style="color: red;">Inscription échouée.</p><a hred="inscription.php">Réessayer.</a>');

        
    }

}



?>