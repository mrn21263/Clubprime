<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ClubPrime</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap"
    rel="stylesheet" />
  <link rel="stylesheet" href="./css/style.css" />
</head>

<body>
  <div class="accueil">
    <div class="navbar">
      <img class="logo" src="./ressources/accueil/logo.png" alt="Logo">
      <nav>
        <a class="acc" href="#">Accueil</a>
        <a href="#podium">Podium</a>
        <a href="#Classement">Classement</a>
        <a href="#Contact">Contact</a>
      </nav>
      <div class="container">
        <input type="text" placeholder="Rechercher...">
        <div class="search"></div>
      </div>
    </div>
    <div class="corp">
      <h1>Le Top 10 de l'excellence.</h1>
      <a href="#podium">Découvrir le podium</a>
    </div>
  </div>
  <?php
  include './vue/vueclassement.php';
  include './vue/footer.php';
  ?>
  <script src="./js/script.js"></script>
</body>

</html>