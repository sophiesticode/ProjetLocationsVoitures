<?php 
	
	function listeVehiculesBD() {
		require ("Modele/connectBD.php") ; 
		$sql="SELECT * FROM vehicule v WHERE etatL='disponible';";
		try {
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			$LISTE_V = array();
			if ($bool) {
				while ($v = $commande->fetch()) {
					$LISTE_V[] = $v;
				}	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		return $LISTE_V;
	}

	function listeTousVehiculesBD() {
		require ("Modele/connectBD.php") ; 
		$sql="SELECT * FROM vehicule v;";
		try {
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			$LISTE_V = array();
			if ($bool) {
				while ($v = $commande->fetch()) {
					$LISTE_V[] = $v;
				}	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		return $LISTE_V;
	}

	function listeVehiculesLocBD() {
		require ("Modele/connectBD.php") ; 
		$sql=	"SELECT Distinct v.*, f.ide, f.dateD, f.dateF, f.valeur, f.etatR
				FROM facture f, vehicule v WHERE f.idV = v.idVehicule AND ceil(v.etatL);";
		try {
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			$LISTE_V = array();
			if ($bool) {
				while ($v = $commande->fetch()) {
					$LISTE_V[] = $v;
				}	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		return $LISTE_V;
	}

	function listeVehiculesCliBD($idClient) {
		require ("Modele/connectBD.php") ; 
		$sql=  "SELECT v.*, f.ide, f.dateD, f.dateF, f.valeur, f.etatR
                FROM facture f, vehicule v 
                WHERE f.ide = :idClient
                AND f.idV = v.idVehicule;";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idClient', $idClient);
			$bool = $commande->execute();
			$LISTE_V = array();
			if ($bool) {
				while ($v = $commande->fetch()) {
					$LISTE_V[] = $v;
				}	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		return $LISTE_V;
	}

	function validerDispoVBD($idVehicule, $dispo) {
		require ("Modele/connectBD.php") ; 
		$sql=  "UPDATE vehicule SET etatL = :dispo 
				WHERE idVehicule = :idVehicule";
		try {
			echo($dispo);
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':dispo', $dispo);
			$commande->bindParam(':idVehicule', $idVehicule);
			$bool = $commande->execute();
			if ($bool) {
				echo "maj état véhicule effectuée";
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec d'update d'etat: " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}

	function insert_V_bd($typeV, $caract, $photo, $tarif) {
		require('modele/connectBD.php');
		$sql = 'INSERT INTO `vehicule`(typeV, caract, photo, tarif, etatL) VALUES (:typeV, :caract, :photo, :tarif, "disponible");';

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':typeV', $typeV);
			$commande->bindParam(':caract', $caract);
			$commande->bindParam(':photo', $photo);
			$commande->bindParam(':tarif', $tarif);
			$bool = $commande->execute();
			if ($bool) {
				echo "vehicule ajouté";
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec d'insert : " . $e->getMessage() . "\n");
			die();
		}
	}

	function supprimerVehicule($idVehicule){
		require ("Modele/connectBD.php"); 
		$sql=  "DELETE vehicule WHERE idv = :idVehicule";
		echo("vehicule supprime");die();
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idVehicule', $idVehicule);
			$bool = $commande->execute();
			if ($bool) {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de delete : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}
	
?>