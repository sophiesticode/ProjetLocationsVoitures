<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Liaison au fichier css Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
		.col-4, .col-5, .col-6 {
			border: 1px solid #333;
		}
		.container {
            margin-top: 20px;
			border: 3px dashed #333;
		}
        .figure-caption {
            color: black;
            font-size: 1.5em;
            text-align: center;
        }
	</style>
</head>
<body>
<header>
    <?php 
        require ("vue/menu.tpl");
    ?>
</header>

<!-- Affichage des factures -->
    <h3 class="text-center">Factures de 
        <?php
            echo date("F Y");
        ?>
    </h3>
    <div class="container">
        <div class="row">

        <?php
            //require ('./controle/facture.php');

            if (isset($LISTE_F)) {
                
                foreach ($LISTE_F as $f) {

                    echo ('
                        <div class="col-4">
                        <figcaption class="figure-caption">'
                        .
                            $f["typeV"]
                        .
                        '</figcaption>
                        <img alt="nul" src="vue/images/voitures/'
                        .
                            $f["photo"]
                        .
                        '" class="img-thumbnail">
                        <ul>
                            <li>moteur: '.json_decode($f["caract"])->{'moteur'}.'</li>
                            <li>vitesse: '.json_decode($f["caract"])->{'vitesse'}.'</li>
                            <li>coloris: '.json_decode($f["caract"])->{'couleur'}.'</li>
                            <li>tarif: '.$f["tarif"].'€/jour</li>
                        </ul>
                        <div>Durée : '
                        .
                            duree($f["dateD"], $f["dateF"])
                        .
                        ' jours</div>
                        <div>Coût : <b>'
                        .
                            calculCoutFacture($f["tarif"], $f["dateD"], $f["dateF"])
                        .
                        '</b> €</div>
                        </div>
                        ');
                }
            } 
        ?>

        </div>
    </div>
    
    <!-- Liaisons aux scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>