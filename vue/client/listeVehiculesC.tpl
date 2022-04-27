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
<h3 class="text-center">Flotte de véhicules</h3>
<!-- Affichage des locations -->
    
    <div class="container"> 
        <div class="row">

        <?php
            //var_dump($LISTE_V);
            if (isset($LISTE_V)) {
                
                foreach ($LISTE_V as $v) {
                    echo ('
                        <form action="index.php?controle=vehicule&action=validerDispoLoc_C" 
                            method="post" name="formLoc" class="col-4" style="border:2px solid gray; padding:10px;">
                        <div class="form-check-inline">
                            <input class="form-check-input" type="radio" name="dispo" 
                            value="disponible" '
                            .
                                (($v["etatL"] == "disponible")?"checked":"")
                            .
                            '>
                            <label class="form-check-label">
                                Disponible &emsp;
                            </label>

                            <input class="form-check-input" type="radio" name="dispo" 
                            value="en_revision" '
                            .
                                (($v["etatL"] == "en_revision")?"checked":"")
                            .
                            '>
                            <label class="form-check-label">
                                En révision &emsp;
                            </label>

                            <input class="form-check-input" type="radio" name="dispo" 
                            value="'. $v["ide"] .'" '
                            .
                                ((is_numeric($v["etatL"]))?"checked":"")
                            .
                            '>
                            <label class="form-check-label">
                                Loué
                            </label>
                        </div>
                        <hr/>
                        <figcaption class="form-check-label figure-caption">'
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
                        <div class="form-group"><b>Dates de location</b> <br>
                            <label>début:&emsp;</label>
                            <input type="date" name="dateD" value="'
                            .
                                $v["dateD"]
                            .
                            '">
                            <br/>
                            <label>fin:&emsp;&emsp;&nbsp;&nbsp;</label>
                            <input type="date" name="dateF" value="'
                            .
                                $v["dateF"]
                            .
                            '">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="regle"'
                                . (($v["etatR"] == "0")?"checked":"") .' disabled="disabled">
                                <label class="form-check-label">réglé</label>
                            </div>
					    </div>
                        <div class="row">
                            <div class="col"></div>
                            <div class="col align-self-center">
                                <input type="submit" value= "valider les modification" class="btn btn-success"/>
                            </div>
                            <div class="col"></div>
                        </div>

                        <input type="hidden" name="idVehicule" value="'
                        .
                            $v["idVehicule"]
                        .
                        '">
                        <div id ="msg"> <?php echo (empty($msg)?$msg:""); ?> </div>
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

<!--(is_numeric($_POST["dispo"])?"disabled=desabled":"")-->
