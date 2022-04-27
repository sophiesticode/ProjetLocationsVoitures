<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Liaison au fichier css Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
		.col-4, .col-5, .col-6 {
			border: 1px solid #333;
            color: #52565c;
		}
		.container {
            margin-top: 20px;
			border: 3px bold;
            color: black;
            font-size: 30px;
            font-family:system-ui;
            text-align: center;
            font-weight: lighter;
		}
        .figure-caption {
            color: black;
            font-size: 1.5em;
            text-align: center;
            
        }
        .row{
            background-color: #f2f3f5;

        }
	</style>
</head>
<body>
<header>
    <?php 
        require ("vue/menu.tpl");
    ?>
</header>

    <!-- Vitrine / affichage des voitures -->
    <div class="container">
        <div class="row">

        <?php
            //require ('./controle/facture.php');
		    //locations();

            if (isset($LISTE_V)) {
                
                foreach ($LISTE_V as $v) {

                    echo ('

                        <form action="index.php?controle=vehicule&action=supprimerV" 
                            method="post" name="formLoc" class="col-4" style="border:2px solid gray; padding:10px;">

                        
                        <figcaption class="figure-caption">'
                        .
                            $v["typeV"]
                        .
                        '</figcaption>
                        <img alt="nul" src="vue/images/voitures/'
                        .
                            $v["photo"]
                        .
                        '" class="img-thumbnail">
                        <ul>
                            <li>moteur: '.json_decode($v["caract"])->{'moteur'}.'</li>
                            <li>vitesse: '.json_decode($v["caract"])->{'vitesse'}.'</li>
                            <li>coloris: '.json_decode($v["caract"])->{'couleur'}.'</li>
                            <li>tarif: '.$v["tarif"].'€/jour</li>
                        </ul>
                        <input type="hidden" name="idVehicule" value="'
                        .
                            $v["idVehicule"]
                        .
                        '">

                        <div class="row">
                            <div class="col"></div>
                            <div class="col align-self-center">
                                <input type="submit" value= "supprimer" class="btn btn-danger"/>
                            </div>
                            <div class="col"></div>
                        </div>

                        </form>


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