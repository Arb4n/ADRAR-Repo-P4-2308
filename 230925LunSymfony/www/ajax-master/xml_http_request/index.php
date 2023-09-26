<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Test avec l'objet XMLHttpRequest</title>
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
            function changerDonnees() {
                event.preventDefault();
                // On créé un formulaire de données
                var formData = new FormData();
                formData.append('changer_donnees', 1);
                // On créé un objet XMLHttpRequest
                let xhr = new XMLHttpRequest();
                // On initialise notre requête avec la fonction open()
                xhr.open("POST", "../data.php", true);
                // On demande une réponse au format JSON
                xhr.responseType = "json";
                // On envoie la requête avec le formulaire
                xhr.send(formData);
                // Dès que la réponse est reçue 
                xhr.onload = function() {
                    // Si le statut HTTP n'est pas 200 (donc n'est pas OK)
                    if (xhr.status != 200) { 
                        // On affiche le statut et le message correspondant
                        alert("Erreur " + xhr.status + " : " + xhr.statusText);
                    } else { 
                        // Si le statut HTTP est 200, on affiche le nombre d'octets téléchargés et la réponse
                        document.getElementById("icon").className = "";
                        document.getElementById("icon").className = xhr.response.icon + " stats-icon color";
                        document.getElementById("data").innerText = xhr.response.data;
                        document.getElementById("text").innerText = xhr.response.text;
                        
                        var colors = document.getElementsByClassName('color');
                        for(var i = 0 ; i < colors.length ; i++) {
                            colors[i].style.color = xhr.response.color;
                        }
                    }
                };
            }
        </script>
    </body>
</html>