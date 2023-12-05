<?php
include_once 'ywQmodel/bdconnexion.php';

function getPodiumByAnnee($annee) {
    try {
        $req = 
        $req = $cnx->prepare("
            SELECT club.nom, MAX(logo.photologo) AS photologo
            FROM club
            INNER JOIN (
                SELECT idClub, MAX(position) AS max_position
                FROM classement
                WHERE position IN (1, 2, 3) AND annee = :annee
                GROUP BY idClub
            ) AS top_classement ON club.id = top_classement.idClub
            INNER JOIN classement ON club.id = classement.idClub AND classement.position = top_classement.max_position AND classement.annee = :annee
            INNER JOIN logo ON club.id = logo.idClub
            GROUP BY club.nom
            ORDER BY top_classement.max_position;
        ");
        $req->bindValue(':annee', $annee, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getClassement($annee) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("
            SELECT club.nom, club.id, MAX(logo.photologo)
            FROM club
            INNER JOIN logo ON club.id = logo.idClub
            INNER JOIN classement ON club.id = classement.idClub
            WHERE classement.annee = :annee
            GROUP BY club.nom
            ORDER BY classement.position
        ");
        $req->bindParam(':annee', $annee, PDO::PARAM_INT);
        $req->execute();
        $resultat = $req->fetchAll(PDO::FETCH_ASSOC);
        return $resultat;   
    } catch (PDOException $e) {
        echo "Erreur : " . $e->getMessage();
    } finally {
        $cnx = null; 
    }
}

function getEquipeInfo($podium, $position) {
    try {
        if (empty($podium) || !isset($podium[$position])) {
            throw new Exception('ERREUR: Aucun résultat pour cette année ou position invalide');
        }

        $equipeInfo['nom'] = $podium[$position]['nom'];
        $equipeInfo['photologo'] = $podium[$position]['photologo'];

    } catch (Exception $e) {
        echo $e->getMessage();
    }

    return $equipeInfo;
}

?>
