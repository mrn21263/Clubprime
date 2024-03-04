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

function getLogo($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select logo from club where club.id =:id;");
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


