<?php 
	
	function accueil() {
		require ("modele/vehiculeBD.php");
		$LISTE_V = listeVehiculesBD();
        //var_dump($LISTE_V);
		require ("vue/accueil.tpl");
	}

	function vehicules_Tous() {
		require ("modele/vehiculeBD.php");
		$LISTE_V = listeTousVehiculesBD();
        //var_dump($LISTE_V);
		require ("vue/listeStockV.tpl");
	}

	function vehicules_LocTous() {
		require ("modele/vehiculeBD.php");
		$LISTE_V = listeVehiculesLocBD();
        //print_r($LISTE_V);
		require ("vue/admin/listeVehiculesLoc.tpl");
	}

	function vehicules_C() {
		require ("modele/vehiculeBD.php");
		$LISTE_V = listeVehiculesCliBD($_SESSION['profil']['idClient']);
        //var_dump($LISTE_V);
		require ("vue/client/listeVehiculesC.tpl");
	}

	function validerModifLoc(){
		$idVehicule=isset($_POST['idVehicule'])?trim($_POST['idVehicule']):'';
		$regle=isset($_POST['regle'])?trim($_POST['regle']):'';
		
		$msg='';
		if (count($_POST)!=0) {
			require ("./modele/FactureBD.php");

			$regle=($regle=='on'?0:1);

			if (!(validerReglementLocBD($idVehicule, $regle))){
				$msg = "Erreur de mise à jour";
				require ("vue/admin/listeVehiculesLoc.tpl");	
			}
		}
		$nexturl = "index.php?controle=vehicule&action=vehicules_LocTous";
		header ("Location:" . $nexturl);
	}

	function validerDispoLoc_C(){
		$idVehicule=isset($_POST['idVehicule'])?trim($_POST['idVehicule']):'';
		$dispo=isset($_POST['dispo'])?trim($_POST['dispo']):'';
		$dateD=isset($_POST['dateD'])?trim($_POST['dateD']):'';
		$dateF=isset($_POST['dateF'])?trim($_POST['dateF']):'';
		
		$msg='';
		if (count($_POST)!=0) {
			require ("./modele/vehiculeBD.php");

			if (validerDispoVBD($idVehicule, $dispo)){
				require ("./modele/factureBD.php");
				if (empty($dateD)){
					$msg = "Indiquez une date de début";
					require ("vue/client/listeVehiculesC.tpl");
				}	
				validerDatesLocBD($idVehicule, $dateD, $dateF);
			}
			else {
				$msg = "Erreur de mise à jour";	
			}
		}
		$nexturl = "index.php?controle=vehicule&action=vehicules_C";
		header ("Location:" . $nexturl);
	}

	function ajout_vehicule() {

		$typeV=isset($_POST['typeV'])?trim($_POST['typeV']):'';
		$moteur=isset($_POST['moteur'])?trim($_POST['moteur']):'';
        $vitesse=isset($_POST['vitesse'])?trim($_POST['vitesse']):'';
		$coloris=isset($_POST['coloris'])?trim($_POST['coloris']):'';
		$tarif=isset($_POST['tarif'])?trim($_POST['tarif']):'';
		$msg='';
		
		
		if (count($_POST)==0 ||
			empty($moteur) || empty($vitesse) || empty($coloris) || empty($tarif)){ 
			$msg = "Remplissez tous les champs";
			require("vue/admin/ajoutVehicule.tpl");
		}
		else {
			//var_dump($_FILES);die();
			if(!isset($_FILES['photo'])) {
				$msg = "Rechargez la photo du vehicule"; 
				require("vue/admin/ajoutVehicule.tpl");
			}
			else {
				$origine = $_FILES['photo']['tmp_name'];
				$photo = $_FILES['photo']['name'];
				$dest = 'vue/images/voitures/' . $photo;
				move_uploaded_file($origine, $dest);
			}

			require ("./modele/vehiculeBD.php");
			$caract = json_encode(array('moteur' => $moteur, 'vitesse' => $vitesse, 'couleur' => $coloris));

			if (insert_V_bd($typeV, $caract, $photo, $tarif)) {
				$nexturl = "index.php?controle=vehicule&action=accueil";
				header ("Location:" . $nexturl);
			}
			else {
				$msg = "Echec de l'ajout ! Veuillez réessayer";
				require("vue/admin/ajoutVehicule.tpl");
			}
		}
	}
	
	function supprimerV(){
		$idVehicule=isset($_POST['idVehicule'])?trim($_POST['idVehicule']):'';
		require ("./modele/vehiculeBD.php");
		supprimerVehicule($idVehicule);
		$nexturl = "index.php?controle=vehicule&action=vehicules_Tous";
		header ("Location:" . $nexturl);
	}
?>