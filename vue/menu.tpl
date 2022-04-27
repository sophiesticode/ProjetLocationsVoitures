<?php
	if(isset($_SESSION['utilisateur']) && $_SESSION['utilisateur'] == 'client') echo ("<h1 class='text-center'>Bonjour ".$_SESSION['profil']['nomE']." !</h1>");
?>
<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="index.php?controle=vehicule&action=accueil">LouerVoiture.Net</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<!-- Liens a gauche -->
		<ul class="navbar-nav mr-auto">

			<!-- Affichage du menu de l'utilisateur connecte-->
			<?php 
				//var_dump($_SESSION['utilisateur']); die();
				if(isset($_SESSION['utilisateur'])) require('vue/'.$_SESSION['utilisateur'].'/menu'.$_SESSION['utilisateur'][0].'.tpl');
			?>

		</ul>
		
		<!-- Liens a droite -->
		<ul class="nav nav-pills">

			<!-- Si non inscrit ou non connecte -->
			<li class="nav-item" style="display: <?php echo (!isset($_SESSION['profil']))?"block":"none"; ?>;">
				<a href="index.php?controle=client&action=ajout_c" class="btn btn-outline-success p-2 my-2 m-2 my-sm-0">
					Inscription
				</a>
			</li>

			<li class="nav-item dropdown" style="display: <?php echo (!isset($_SESSION['profil']))?"block":"none"; ?>;">
				<a class="nav-link dropdown-toggle btn btn-outline-primary my-2 m-2 my-sm-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Connexion</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="index.php?controle=client&action=connexion_c">Client</a>
					<a class="dropdown-item" href="index.php?controle=admin&action=connexion_a">Admin 🔐</a>
				</div> 
			</li>

			<!-- Si deja connecte -->
			<li class="nav-item" style="display: <?php echo isset($_SESSION['profil'])?"block":"none"; ?>;">
				<a href="index.php?controle=client&action=deconnexion" class="btn btn-outline-danger p-2 my-2 m-2 my-sm-0">
					Déconnexion
				</a>
			</li>		
		</ul>
	</div>
</nav>
