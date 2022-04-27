<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Inscription</title>

		<!-- Liaison au fichier css Bootstrap -->
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	</head>
	<style>
		.body {
			background: blue;
		}
		</style>
	<body>
		<div class="container">
			<br>
			<br>
			<br>
			<br>
			<h1 class="text-center display-4">Inscription</h1>
			<br>
			<div class="row justify-content-center">
				<form action="index.php?controle=client&action=ajout_c" method="post" class="col-4" style="border:2px solid gray; padding:10px;">

					<div class="form-group card-header" >
						<label for="nomE">Nom :</label>
						<input name="nomE" value="<?php echo $nomE ?>" id="nomE" class="form-control"/>
					</div>

					<div class="form-group card-header" >
						<label for="adrE">Adresse :</label>
						<input name="adrE" value="<?php echo $adrE ?>" id="adrE" class="form-control"/>
					</div>

					<div class="form-group card-header" >
						<label for="email">Email :</label>
						<input name="email" type="email" value="<?php echo $email ?>" id="email" class="form-control"/>
					</div>

					<div class="form-group card-header" >
						<label for="mdp">Mot de passe :</label>
						<input name="mdp" type="password" placeholder="votre mot de passe" id="mdp" class="form-control"/>
					</div>

					<div class="row card-header">
						<div class="col"></div>
						<div class="col align-self-center">
							<input type="submit" value= "S'incrire" class="btn btn-success"/>
						</div>
						<div class="col"></div>
					</div> 
				 
				</form>
			</div>
		</div>
		<div id ="msg"> <?php echo $msg; ?> </div>

	</body>
</html>