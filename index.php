<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ClubPrime</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div class="accueil">
        <div class="navbar">
        <img class="logo" src="./ressources/imagespage1/logo.png" alt="Logo">
            <nav>
                <a class="acc" href="#">Accueil</a>
                <a href="#">Podium</a>
                <a href="#">Classement</a>
                <a href="#">Équipes</a>
            </nav>
            <div class="recherche">
                <img src="./ressources/imagespage1/recherche.svg" alt="recherche">
            </div>
        </div>
        <div class="corp">
            <h1>Le Top 10 de l'excellence.</h1>
            <a href="#podium">Découvrir le podium</a>
        </div>

        <script>
        var defaultImage = "../ressources/imagespage1/imageequipe/mancity.png";
        var newImage = "../ressources/imagespage1/imageequipe/bayernmunich.png";

        document.querySelector('.general').addEventListener('mouseover', function() {
            document.getElementById('podium').style.backgroundImage = "url( + newImage + )";
        });

        document.querySelector('.general2').addEventListener('mouseout', function() {
            document.getElementById('podium').style.backgroundImage = "url(" + defaultImage + ")";
        });
    </script>

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
                    <img src="./ressources/logoequipe/Bayern_München.png" alt="logo du bayern">
                    <div class="deux">
                        <p>Bayern Munich</p>
                        <div class="coupe2">
                            <p>2</p>
                        </div>
                    </div>
                </div>

                <div class="general2">
                    <img src="./ressources/logoequipe/Manchester_City.png" alt="logo du mancherster city">
                    <div class="un">
                        <p>Manchester City</p>
                        <div class="coupe1">
                            <p>1</p>
                        </div>
                    </div>
                </div>

                <div class="general3">
                    <img src="./ressources/logoequipe/chelsea.png" alt="logo du real madrid">
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
    <div class="test">
        <style>
        .test{
            height:100vh;
        }
        </style>
    </div>
</body>
</html>