<?php
include('../model/bdcclub.php');

$selectedYear = $_GET['quantity'] ?? '2023/2024';
$podium = getPodiumByAnnee($selectedYear);
$classement = getClassement($selectedYear);

$premiereEquipe = getEquipeInfo($podium, 0);
$deuxiemeEquipe = getEquipeInfo($podium, 1);
$troisiemeEquipe = getEquipeInfo($podium, 2);

$nomPremiereEquipe = $premiereEquipe['nom'];
$imagePremiereEquipe = $premiereEquipe['photologo'];

$nomDeuxiemeEquipe = $deuxiemeEquipe['nom'];
$imageDeuxiemeEquipe = $deuxiemeEquipe['photologo'];

$nomTroisiemeEquipe = $troisiemeEquipe['nom'];
$imageTroisiemeEquipe = $troisiemeEquipe['photologo'];

