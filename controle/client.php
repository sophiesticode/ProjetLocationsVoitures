<?php

	function connexion_c() {
		$idClient='';
		$msg='';

		// si connexion manuelle (en validation de formulaire)
		$email=isset($_POST['email'])?trim($_POST['email']):'';
		$mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';

		if (count($_POST) == 0 && !isset($_COOKIE['idClient'])){
			require("vue/client/connexionC.tpl");
		}
		else {
			$msg = "Identification incorrecte, essayez de nouveau";
			if (isset($_COOKIE['idClient'])) {
				// s'il existe un cookie 'idClient' (à la suite d'une inscription)
				$idClient = $_COOKIE['idClient'];
				$msg = "Identification automatique incorrecte, essayez manuellement";
			}
			// la connexion
			require ("./modele/clientBD.php");
			if (verif_C_bd($idClient, $email, $mdp, $profil)) {
				//session_start(); //deja fait dans index
				$_SESSION['profil'] = $profil;
				$_SESSION['utilisateur'] = "client";
				$nexturl = "index.php?controle=vehicule&action=accueil";
				header ("Location:" . $nexturl);
			}
			else {
				require("vue/client/connexionC.tpl");
			}
		}
	}

    function ajout_c()  {

		$nomE=isset($_POST['nomE'])?trim($_POST['nomE']):'';
		$adrE=isset($_POST['adrE'])?trim($_POST['adrE']):'';
		$email=isset($_POST['email'])?trim($_POST['email']):'';
        $mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
		$msg='';
		$idClient='';
		$profil=array();
		
		if (count($_POST)==0) require("vue/client/inscription.tpl");
		else if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$msg = "Mail manquant ou non conforme";
			require("vue/client/inscription.tpl");
		}
		else {
			require ("./modele/clientBD.php");

			if (! verif_C_bd($idClient, $email, $mdp, $profil)) {
				// si l'utilisateur n'existe pas dans la base, on effectue la requête insert
				insert_C_bd($nomE, $adrE, $mdp, $email);
				// recherche des infos pour dépôt du cookie
				verif_C_bd($idClient, $email, $mdp, $profil);
				// dépôt du cookie
				setCookie('idClient',$profil['idClient']);
				// on l'invite à présent à s'identifier
				$nexturl = "index.php?controle=client&action=connexion_c";
				header ("Location:" . $nexturl);
			}
			else {
				$msg = "Utilisateur déjà inscrit !";
				require("vue/client/inscription.tpl");
			}
		}
	}

	function deconnexion() {
		echo ("deconnexion");
		session_destroy();
		setCookie('idClient');
		$nexturl = "index.php?controle=vehicule&action=accueil";
		header ("Location:" . $nexturl);
	}
?>