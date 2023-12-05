<?php
include_once '../model/bdclub.php';

function getNomClubController($idEquipe) {
    try {
        $resultat = getNomClub($idEquipe);

        if (!empty($resultat)) {
            $nomClub = $resultat[0]['nom'];
        } else {
            echo "Club non trouvé.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $nomClub;
}

function getPhotoLigue($idEquipe) {
    try {
        $resultat = getLigue($idEquipe);

        if (!empty($resultat)) {
            $photoLigue = $resultat['photoLigue'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $photoLigue;
}

function getLogoEquipe($idEquipe) {
    try {
        $resultat = getLogo($idEquipe);
        if (!empty($resultat)) {
            $photologo = $resultat['photologo'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $photologo;
}

function getDescription($idEquipe) {
    try {
        $resultat = getDesc($idEquipe);
        if (!empty($resultat)) {
            $descr = $resultat['descr'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $descr;
}


function getLogosanc($idEquipe) {
    try {
        $resultat = getLogosAncien($idEquipe);
        $photos = array(); 

        if (!empty($resultat)) {
            foreach ($resultat as $row) {
                $photos[] = $row['photologo']; 
            }
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $photos; 
}


function getPhotoStade($idEquipe) {
    try {
        $resultat = getImageStade($idEquipe);

        if (!empty($resultat)) {
            $PhotoStade = $resultat['photoStade'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $PhotoStade;
}

function getDescrStade($idEquipe) {
    try {
        $resultat = getDescriptionStade($idEquipe);
        if (!empty($resultat)) {
            $descr = $resultat['descrStade'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $descr;
}



function getPalmares($idEquipe) {
    $Palamares = null;
    try {
        $resultat = getPhotoNbCoupe($idEquipe);
        if (!empty($resultat) && isset($resultat['photoTrophee'])) {
            $Palamares = $resultat['photoTrophee']['nombre'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }
   
    return $Palamares;
   
}


function getPhotoCapi($idEquipe) {
    try {
        $resultat = getPhotoCapitaine($idEquipe);

        if (!empty($resultat)) {
            $photoCapitaine = $resultat['photoCapitaine'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $photoCapitaine;
}


function getPhotoCoach($idEquipe) {
    try {
        $resultat = getPhotoEntraineur($idEquipe);

        if (!empty($resultat)) {
            $photoEntraineur = $resultat['photoEntraineur'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $photoEntraineur;
}





