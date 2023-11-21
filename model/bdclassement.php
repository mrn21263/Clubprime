<?php
include_once "bdconnexion.php";

function getPodiumByAnnee($annee) {
    try {
        $cnx = connexionPDO();
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
    }
    return $resultat;
}
?>
