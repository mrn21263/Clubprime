<?php
$annee = 2022;
include("../model/bdclassement.php");

$podium = getPodiumByAnnee($annee);

if (!empty($podium)) {
    $premierClub = $podium[0]['nom'];
    $deuxiemeClub = $podium[1]['nom'];
    $troisiemeClub = $podium[2]['nom'];

    $imagepremierClub = $podium[0]['photologo'];
   
} else {
    echo "Aucun résultat trouvé pour l'année $annee.";
}
echo  $premierClub; 
echo $imagepremierClub;
?>
<img src="../<?php echo $imagepremierClub; ?>" alt="logo equipe1">
