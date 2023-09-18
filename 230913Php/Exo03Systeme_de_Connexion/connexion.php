<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-COMPATIBLE" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Connexion </title>
    </head>

    <?php
        include('./connect.php');


if(!empty($_POST["form_inscription"])) {

    $select = $db->prepare("SELECT user_email FROM users WHERE user_email=:user_email; AND user_password=:user_password;");
    $select->bindParam(":user_email", $_POST["form_email"]);
    $select->bindParam(":user_password", $_POST["form_password"]);
    $select->execute();
    
    ?>

        <body>
            <h1> connexion.PHP</h1>
            <form method="post">
                <input type ="hidden" name = "form_email" id="form_email" placeholder="Ex: nomprenom@fournisseur.com">
                <label for ="form_email"> EMAIL: </label>
                <input type="text" name="fomr_email" placeholder="Ex: nomprenom@fournisseur.com">
                <label for ="form_password">Mot de passe: </label>
                <input type="password" name="form_password" placeholder="1234">
                <input type="submit" value="s'inscrire">

        </body>

        


</html>
