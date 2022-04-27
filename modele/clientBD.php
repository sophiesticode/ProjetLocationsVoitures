<?php

    function verif_C_bd($idClient, $email, $mdp, &$profil) {
		require('modele/connectBD.php'); //$pdo est défini dans ce fichier
		if(!empty($idClient)) {
			$sql="SELECT * FROM `client` WHERE idClient=:idClient";
			try {
				$commande = $pdo->prepare($sql);
				$commande->bindParam(':idClient', $idClient);
				$bool = $commande->execute();
				if ($bool)
					$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
			catch (PDOException $e){
				echo utf8_encode("Echec de select : " . $e->getMessage() . "\n"); die();
			}
		}
		elseif (!empty($email) && !empty($mdp)){
			$sql="SELECT * FROM `client` WHERE email=:email AND mdp=:mdp";
			try {
				$commande = $pdo->prepare($sql);
				$commande->bindParam(':email', $email);
				$commande->bindParam(':mdp', $mdp);
				$bool = $commande->execute();
				if ($bool)
					$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
			}
			catch (PDOException $e){
				echo utf8_encode("Echec de select : " . $e->getMessage() . "\n"); die();
			}
		}
		
		if (count($resultat) == 0) {
			$profil=array();
			return false; 
		}
		else {
			$profil = $resultat[0];
			//var_dump($profil);
			return true;
		}
	}

    function insert_C_bd($nomE, $adrE, $mdp, $email) {
		require('modele/connectBD.php');
		$sql = 'INSERT INTO `client`(nomE, adresseE, mdp, email) VALUES (:nomE, :adrE, :mdp, :email)';

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':nomE', $nomE);
			$commande->bindParam(':adrE', $adrE);
			$commande->bindParam(':mdp', $mdp);
			$commande->bindParam(':email', $email);
			$bool = $commande->execute();
			if ($bool) {
				echo "utilisateur inscrit";
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec d'insert : " . $e->getMessage() . "\n");
			die();
		}
	}
?>