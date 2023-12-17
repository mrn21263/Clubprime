<?php
include('../controller/clubcontroller.php');
$idEquipe = isset($_GET['id']) ? intval($_GET['id']) : 0;
?>
<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title> <?php echo getNomClubController($idEquipe) ?></title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap"
    rel="stylesheet" />
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
      <h1><?php echo getNomClubController($idEquipe); ?></h1>
      <img src="../<?php echo getPhotoLigue($idEquipe) ?>" alt="Ligue de l'equipe" width="10%">
      <img src="../<?php echo getLogoEquipe($idEquipe)?>" alt="Logo de l'equipe"width="20%">
      <p><?php echo getDescription($idEquipe); ?></p>
    </div>
    <div class="logoancien">
      <h1>Depuis 1900</h1>
      <div class="leslogo">
    <?php
    $logos = getLogosanc($idEquipe);
    foreach ($logos as $logo) {
      echo '<div class="lelogo"> <img src="../' . $logo . '" alt="" width="70%"></div>';
    }
    ?>
  </div>
    </div>
    <div class="stade">
      <div class="gauche">
      <img src="../<?php echo getPhotoStade($idEquipe) ?>" alt="stade de l'equipe">
      </div>
      <div class="droite">
        <h6>Le stade</h6>
        <p><?php  echo getDescrStade($idEquipe); ?></p>
      </div>
    </div>
    <div class="palmares">
      <h3>PALMARÈS</h3>
      <div class="coupes">
        <?php 
         $palmares = getPalmares($idEquipe);
         if (is_array($palmares)) {
             foreach ($palmares as $trophy) {
                 $photoTrophee = $trophy['photoTrophee'];
                 echo '<img src="../' . $photoTrophee . '" alt="Photo du trophée">' . PHP_EOL;
                }
         } else {
             echo "Aucune donnée trouvée.";
         }
        ?>
      </div>
    </div>
</body>
</html>


<?php
   echo getPhotoCoach($idEquipe)?><br><?php   
  
   ?>
   


   