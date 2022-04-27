<?php
    function verif_A_bd($email, $mdp, &$profil) {
		require('modele/connectBD.php'); //$pdo est défini dans ce fichier
		$sql="SELECT * FROM `admin` WHERE email=:email AND mdp=:mdp";
		try {
			$commande = $pdo->prepare($sql);
            $commande->bindParam(':email', $email);
			$commande->bindParam(':mdp', $mdp);

			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				// var_dump($resultat); die();
				/*while ($ligne = $commande->fetch()) { // ligne par ligne
					print_r($ligne);
				}*/
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
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
?>