<?php 

date_default_timezone_set('Europe/Paris');
	
	function listeFacturesBD() {
		require ("Modele/connectBD.php") ; 
		$sql=  "SELECT *
                FROM facture f, client c, vehicule v 
                WHERE f.idE = c.idClient 
                AND f.idV = v.idVehicule;";
		try {
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			$LISTE_F = array();
			
        	$JAnow = date('F Y');

			if ($bool) {
				while ($f = $commande->fetch()) {
					$dateD2 = new DateTime($f["dateD"]);
        			$JAdateD = $dateD2->format("F Y");
					if($JAnow == $JAdateD){
						$LISTE_F[] = $f;
					}
				}	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		return $LISTE_F;
	}


	function validerDatesLocBD($idVehicule, $dateD, $dateF) {
		$dateD = (($dateD == '')? NULL:$dateD);
		$dateF = (($dateF == '')? NULL:$dateF);

		require ("Modele/connectBD.php") ; 
		$sql=  "UPDATE facture SET dateD = :dateD, dateF = :dateF
				WHERE idv = :idVehicule";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':dateD', $dateD);
			$commande->bindParam(':dateF', $dateF);

			$commande->bindParam(':idVehicule', $idVehicule);
			$bool = $commande->execute();
			if ($bool) {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec d'update des dates : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}

	function validerReglementLocBD($idVehicule, $regle) {
		require ("Modele/connectBD.php") ; 
		$sql=  "UPDATE facture SET etatR = :regle
				WHERE idv = :idVehicule";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':regle', $regle);
			$commande->bindParam(':idVehicule', $idVehicule);
			$bool = $commande->execute();
			if ($bool) {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec d'update du reglement : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}

	function supprimerLocBD($idVehicule) {
		require ("Modele/connectBD.php"); 
		$sql=  "DELETE facture WHERE idv = :idVehicule";
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