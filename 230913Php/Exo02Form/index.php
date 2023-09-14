
<?php 
// TEST D'IMPORT DE FICHIER : 




?>

<?php 
// Tester si le fichier importé existe : 
    if (isset($_FILES['file'])) {
        $tmpName = $_FILES['file']['tmp_name'];

        // Stocker le nom du fichier : 
        $name=$_FILES['file']['name'];

        // Taille du fichier en octets ? 
        $size= $_FILES['file']['size'];

        // stocke les erreurs  (pb d'imports, de droits, de la nature):
        $error = $_FILES['file']['error'];

        // déplacer le fichier image dans le dossier imgs à la racine du projet. 
        // !!! Commenter ça, apparemment ça renvoie un booléen ou whatev
        // $fichier = move_uploaded_file($tmpName, "./imgs/$name"); 

        // limitation de la taille du fichier à 3mo: 

    if (isset($_FILES['file'])) {
        $extensions_ok = array ('png', 'jpg');

        // vérif de l'xtension du fichier:
            if (!in_array(substr(strrchr($_FILES['file']['name'], '.'), 1), $extensions_ok)) {
                 echo '<span style="color: red;"> !! ERROR ERROR !!</span>';

            } else {
                move_uploaded_file($_FILES['file']['tmp_name'], "./imgs/" .  $_FILES['file']['name']);
                
            }

    }

    else if (filesize($_FILES['file']['tmp_name']) > 3145728) {
          echo '<span style="color: red;"> - de 3 Mo stpéééé !!</span>';
     
            move_uploaded_file($_FILES['file']['tmp_name'], "./imgs/" . $_FILES['file']['name']);
        }
    }
?>


<?php
// if (isset($_FILES["file"])) {}

// if (isset($_FILES['file'])) {
//     $tmpName = $_FILES['file']['tmp_name'];
//     $name = $_FILES['file']['name'];

//     // Vérifier si le fichier temporaire existe
//     if (file_exists($tmpName)) {
//         $size = filesize($tmpName);

//         // ... le reste de votre code pour la vérification de la taille ...
//     } else {
//         echo '<span style="color: red;">Fichier temporaire introuvable.</span>';
//     }
// }
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name ="viewport" content="width=device-width, initial-scale=1.0">
        <title> THE IMPORTER </title>
    </head>
    <body>
        <form action = "index.php" method="POST" enctype="multipart/form-data">
            <p>Import file:</p>
            <input type="file" name="file[]" id = "file" multiple accept=".png, .jpg" value="Dl file" placeholder="Dl file" >
            <br> 
            <input type="submit" value="Envoyer"> 
            <button type="submit"> Import </button>
        </form>
    </body>
</html> 