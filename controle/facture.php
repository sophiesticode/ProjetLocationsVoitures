<?php
    function locations() {
        require ("modele/factureBD.php");
        $LISTE_F = listeFacturesBD();
        //print_r($LISTE_F);
        //$duree = duree($LISTE_F[0]["dateD"], $LISTE_F[0]["dateF"]);
        //echo($duree);die();
        require ("vue/admin/factures.tpl");
    }

    function duree($dateD, $dateF) {
        if(! is_null($dateD)) {
            // echo("date debut : $dateD\n");
            // echo("date fin : $dateF\n");
            
            $dteStart = new DateTime($dateD); 
            $dteEnd = new DateTime($dateF);
            $duree = $dteStart->diff($dteEnd); 
            //$duree = $duree->format("%M mois et %D jours");
            $duree = $duree->days;
            if(is_null($dateF)) {
                $duree = 30;
            }
            // echo("duree : ".$duree); 
            
            // $estampD = strtotime($dateD);
            // $estampF = strtotime($dateF);
            // duree = $estampD-$estampF;
            // $duree = date("h:i:s", $duree);
        }
        else {
            echo("probleme dans le calcul de la duree");
            require ("vue/admin/factures.tpl");
        }
        return $duree;
    }

    function calculCoutFacture($valeur, $dateD, $dateF){
        $duree=duree($dateD, $dateF);
        $cout = $valeur * $duree;
        return $cout;
    }

?>