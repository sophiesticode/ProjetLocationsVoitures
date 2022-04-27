<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Ajout de véhicule</title>

		<!-- Liaison au fichier css Bootstrap -->
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	</head>
	<body>
    <header>
    <?php 
        require ("vue/menu.tpl");
    ?>
    </header>
		<div class="container">
            <br>
            <br>
			<h1 class="text-center display-4">Ajout de Véhicule</h1>
            <br>
			<div class="row justify-content-center">
				<form action="index.php?controle=vehicule&action=ajout_vehicule" enctype="multipart/form-data"
                    method="post" class="col-4" style="border:2px solid gray; padding:10px;">
                        
                    <div class="form-group card-header" >
                        <label>Type: </label>
                        <input type="text card-header" name="typeV" value="<?php echo $typeV ?>">
                    </div>
                    <div class="form-group card-header" >
                        <label>Photo: </label>
                        <input type="file" name="photo" value="">
                    </div><hr/>
                    <div class="form-group card-header" >
                        <label>Moteur: </label>
                        <input type="text" name="moteur" size="10" value="<?php echo $moteur ?>">
                    </div>
                    <div class="form-group card-header" >
                        <label>Vitesse: </label>
                        <input type="text" name="vitesse" size="10" value="<?php echo $vitesse ?>">
                    </div>
                    <div class="form-group card-header" >
                        <label>Coloris: </label>
                        <input type="text" name="coloris" size="10" value="<?php echo $coloris ?>">
                    </div>
                    <div class="form-group card-header" >
                        <label>Tarif: &emsp;</label>
                        <input type="text" name="tarif" size="10" value="<?php echo $tarif ?>">€
                    </div>
                    
                    <div class="row">
                        <div class="col"></div>
                        <div class="col align-self-center">
                            <br>
                            <input type="submit" value= "ajouter" class="btn btn-success"/>
                        </div>
                        <div class="col"></div>
                    </div>

                    <input type="hidden" name="idVehicule" value="'
                    .
                        $LISTE_V[$i]["idVehicule"]
                    .
                    '">
                    <div id ="msg"> <?php echo (empty($msg)?$msg:""); ?> </div>
                </form>
			</div>
		</div>
	</body>
</html>