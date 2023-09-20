<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Test avec jQuery</title>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../style.css?v=<?=date("d_m_Y_H_i_s")?>">
    </head>
    <body>
        <div class="stats-container">
            <i class="fa-solid fa-house stats-icon color" style="color: #08b1df" id="icon"></i>
            <div class="stats">
                <div class="stats-value color" style="color: #08b1df;"><span id="text">Indicateur</span>&nbsp;<span id="data">21324</span></div>
            </div>
        </div>
        <a href="#" onclick="changerDonnees();" class="btn">Changer les données</a>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script>
            function changerDonnees() {
                event.preventDefault();
                $.ajax({
                    url: "../data.php", 
                    method: "post",
                    dataType: "json",
                    data: {
                        changer_donnees: 1
                    }, 
                    success: function(r) {
                        if(r.success == "ok") {
                            $("#icon").removeClass();
                            $("#icon").toggleClass(r.icon + " stats-icon color");
                            $("#data").text(r.data);
                            $("#text").text(r.text);
                            $(".color").css("color", r.color);
                        }
                    }
                });
            }
        </script>
    </body>
</html>