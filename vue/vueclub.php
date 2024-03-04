<?php
include('../model/bdclassement.php');


$idEquipe = isset($_GET['id']) ? intval($_GET['id']) : 0;


if ($idEquipe > 0) {
    $bdClassement = new BdClassement();


    $equipe = $bdClassement->getEquipeById($idEquipe);


    if ($equipe) {

        $nomEquipe = $equipe['nom'];
        $logo = $equipe['logo'];
        $logoLigue = $equipe['logo'];
        $description = $equipe['descr'];
        $imageStade = $equipe['photoStade'];
    } else {

        header('Location: ./erreur.php');

        die("Équipe non trouvée");
    }
} else {

    header('Location: ./erreur.php');

    die("ID d'équipe non valide");
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?php echo $nomEquipe; ?></title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../css/styleclub.css" />
</head>

<body>
    <div class="accueil">
        <div class="navbar">
            <img class="logo" src="../ressources/club/logo.png" alt="Logo">
            <nav>
                <a class="acc" href="../index.php">Accueil</a>
                <a href="#podium">Podium</a>
                <a href="#Classement">Classement</a>
                <a href="#Contact">Contact</a>
            </nav>
        </div>
        <div class="landing">
            <h1><?php echo $nomEquipe; ?></h1>
            <!-- Utilisation de l'URL de données pour afficher l'image de la ligue de l'équipe -->
            <img src="data:image/jpeg;base64,<?php echo base64_encode($logoLigue); ?>" alt="Ligue de l'equipe" width="10%">
            <!-- Utilisation de l'URL de données pour afficher le logo de l'équipe -->
            <img src="data:image/jpeg;base64,<?php echo base64_encode($logo); ?>" alt="Logo de l'equipe" width="20%">
            <p><?php echo $description; ?></p>
        </div>
        <div class="logoancien">
            <h1>Depuis 1900</h1>
        </div>
        <div class="stade">
            <div class="gauche">
                <!-- Utilisation de l'URL de données pour afficher l'image du stade de l'équipe -->
                <img src="data:image/jpeg;base64,<?php echo base64_encode($imageStade); ?>" alt="stade de l'equipe">
            </div>
            <div class="droite">
                <h6>Le stade</h6>
                <p><?php echo $description; ?></p>
            </div>
        </div>
    </div>
</body>

</html>