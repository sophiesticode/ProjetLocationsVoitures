<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Connexion</title>

		<!-- Liaison au fichier css Bootstrap -->
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	</head>
	<body>
		<div class="container">
			<h1 class="text-center">Connexion Admin 🔐</h1>
			<div class="row justify-content-center">
				<form action="index.php?controle=admin&action=connexion_a" method="post" class="col-4" style="border:2px solid gray; padding:10px;">

					<div class="form-group" >
						<label for="email">Email :</label>
						<input name="email" type="email" value="<?php echo $email ?>" id="email" class="form-control"/>
					</div>

					<div class="form-group" >
						<label for="mdp">Mot de passe :</label>
						<input name="mdp" type="password" placeholder="votre mot de passe" id="mdp" class="form-control"/>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col align-self-center">
							<input type="submit" value= "Connexion" class="btn btn-warning"/>
						</div>
						<div class="col"></div>
					</div> 
				 
				</form>
			</div>
		</div>
		<div id ="msg"> <?php echo $msg; ?> </div>

	</body>
</html>