<?php 
    if(!empty($_POST["changer_donnees"])) {
        $icons = array("fa-solid fa-home", "fa-solid fa-car", "fa-solid fa-wifi", "fa-solid fa-ticket-alt", "fa-solid fa-snowflake");
        $textes = array("E.T", "MAISON", "Le code wifi est", "ça fait cher la place de ciné", "It's raining man, alléluia");
        $colors = array("grey", "red", "yellow", "black", "cyan");

        $rand = rand(0, sizeof($icons)-1);

        die(json_encode(array(
            "success" => "ok", 
            "icon" => $icons[$rand], 
            "data" => rand(0, 10000), 
            "text" => $textes[$rand],
            "color" => $colors[$rand]
        )));
    }
?>