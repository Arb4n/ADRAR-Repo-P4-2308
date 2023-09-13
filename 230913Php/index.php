<?php
    echo " Hello ";
    $variable = "une variable";
    echo $variable; 
?>
<br>
<?php 
    $sautALaLigne = 'br';
    echo $sautALaLigne, ' ';
    echo gettype($variable);
    ?>

    <?php
    $varInt = 5;
    echo $varInt;
    echo gettype($varInt);
    echo $prenom = " Hal ", ' ';
    echo gettype($prenom), ' ';
    echo $varBool = false;
    echo gettype($varBool)
    ?>