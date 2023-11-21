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
      <img class="logo" src="./ressources/accueil/logo.png" alt="Logo" />
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
  <div class="podium" id="podium">
    <div class="date">
      <select id="quantity" name="quantity">
        <option value="2023/2024">2023/2024</option>
        <option value="2022/2023">2022/2023</option>
      </select>
    </div>
    <div class="place">
      <div class="ranked">
        <div class="general">
          <img src="./ressources/LogoEquipe/Bayern/2002–2017.png" alt="logo du bayern" width="60%" />
          <div class="deux">
            <p>Bayern Munich</p>
            <div class="coupe2">
              <p>2</p>
            </div>
          </div>
        </div>

        <div class="general2">
          <img src="./ressources/LogoEquipe/ManCity/2016-Actuel.png" alt="logo du mancherster city" width="60%" />
          <div class="un">
            <p>Manchester City</p>
            <div class="coupe1">
              <p>1</p>
            </div>
          </div>
        </div>

        <div class="general3">
          <img src="./ressources/LogoEquipe/Chelsea/2005-Actuel.jpg" alt="logo du real madrid" width="60%" />
          <div class="trois">
            <p>Chelsea</p>
            <div class="coupe3">
              <p>3</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="classement" id="Classement">

    <div class="place4">
      <div class="boxlogoclub"><img src="./ressources/LogoEquipe/Liverpool/2000-Actuel.png" alt="Logo Liverpool"
          width="80px"></div>
      <p>Liverpool</p>
      <div class="boxplaceclub">
        <p>#4</p>
      </div>
    </div>

    <div class="place5">
      <div class="boxlogoclub"><img src="./ressources/LogoEquipe/PSG/2013-Actuel.png" alt="Logo equipe" width="100px">
      </div>
      <p>Paris Saint-Germain</p>
      <div class="boxplaceclub">
        <p>#5</p>
      </div>
    </div>

    <div class="place6">
      <div class="boxlogoclub"> <img src="./ressources/LogoEquipe/Chelsea/2005-Actuel.jpg" alt="Logo equipe"
          width="100px"></div>
      <p>Chelsea</p>
      <div class="boxplaceclub">
        <p>#6</p>
      </div>
    </div>

    <div class="place7">
      <div class="boxlogoclub"> <img src="./ressources/LogoEquipe/ManUnited/1998-Actuel.png" alt="Logo equipe"
          width="100px"></div>
      <p>Manchester United</p>
      <div class="boxplaceclub">
        <p>#7</p>
      </div>
    </div>

    <div class="place8">
      <div class="boxlogoclub"> <img src="./ressources/LogoEquipe/Juventus/2020-Actuel.png" alt="Logo equipe"
          width="100px"></div>
      <p>Juventus</p>
      <div class="boxplaceclub">
        <p>#8</p>
      </div>
    </div>

    <div class="place9">
      <div class="boxlogoclub"> <img src="./ressources/LogoEquipe/Roma/2013-2017.png" alt="Logo equipe" width="100px">
      </div>
      <p>AS Roma</p>
      <div class="boxplaceclub">
        <p>#9</p>
      </div>
    </div>

    <div class="place10">
      <div class="boxlogoclub"> <img src="./ressources/LogoEquipe/Barcelone/2002-Actuel.png" alt="Logo equipe"
          width="100px"></div>
      <p>Fc Barcelone</p>
      <div class="boxplaceclub">
        <p>#10</p>
      </div>
    </div>
  </div>
  <?php
  include './vue/footer.php';
  ?>
  <script src="./js/script.js"></script>
</body>

</html>