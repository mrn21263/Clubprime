<?php
include_once '../model/bdconnexion.php';

function getNomClub($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select nom from club where id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
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



function getLigue($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select photoLigue from ligue Inner join club ON  club.idLigue = ligue.id where club.id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getLogo($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select MAX(annee), photologo from logo inner join club on logo.idClub = Club.id where club.id =:id
            GROUP BY photologo order by annee desc;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}


function getDesc($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("Select descr from club where id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getLogosAncien($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select photologo from logo inner join club on logo.idClub = Club.id where club.id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
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

function getImageStade($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select photoStade from club where id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getDescriptionStade($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select descrStade from club where id=:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getPhotoNbCoupe($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("SELECT photoTrophee, nombre FROM trophee 
        INNER JOIN obtenir ON obtenir.idTrophee = trophee.id
        INNER JOIN club ON obtenir.idClub = club.id
        WHERE club.id = :id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
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


 

function getPhotoCapitaine($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("Select photoCapitaine from club where id=:id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getPhotoEntraineur($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select photoEntraineur from club where id =:id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}
