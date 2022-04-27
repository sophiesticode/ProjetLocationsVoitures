<?php

	function connexion_a() {

		$email=isset($_POST['email'])?trim($_POST['email']):'';
		$mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
		$msg="";

		if (count($_POST)==0) require("vue/admin/connexionA.tpl");
		else {
			
			require ("./modele/adminBD.php");
			
			if (verif_A_bd($email, $mdp, $profil)) {
				//echo ('<br/>PROFIL : <pre>'); var_dump ($profil); echo ('</pre><br/>'); die("ident");
				
				//session_start(); //deja fait dans index
				$_SESSION['profil'] = $profil;
                $_SESSION['utilisateur'] = "admin";
				$nexturl = "index.php?controle=vehicule&action=accueil";
				header ("Location:" . $nexturl);
			}
			else {
				$msg = "Admin inconnu !";
				require("vue/admin/connexionA.tpl");
			}
		}
	}
?>