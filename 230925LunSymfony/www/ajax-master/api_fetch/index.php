<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Test avec l'API fetch</title>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../style.css?v=<?=date("d_m_Y_H_i_s")?>">
    </head>
    <body>
        <div class="stats-container">
            <i class="fa-solid fa-house stats-icon color" style="color: #08b1df;" id="icon"></i>
            <div class="stats">
                <div class="stats-value color" style="color: #08b1df;"><span id="text">Indicateur</span>&nbsp;<span id="data">21324</span></div>
            </div>
        </div>
        <a href="#" onclick="changerDonnees();" class="btn">Changer les données</a>
        <script>
            async function changerDonnees() {
                event.preventDefault();
                var formData = new FormData();
                formData.append('changer_donnees', 1);

                await fetch("../data.php", {
                    method: "POST",
                    body: formData
                })
                .then((response) => response.json())
                .then((result) => {
                    document.getElementById("icon").className = "";
                    document.getElementById("icon").className = result.icon + " stats-icon color";
                    document.getElementById("data").innerText = result.data;
                    document.getElementById("text").innerText = result.text;
                    
                    var colors = document.getElementsByClassName('color');
                    for(var i = 0 ; i < colors.length ; i++) {
                        colors[i].style.color = result.color;
                    }
                });
            }
        </script>
    </body>
</html>