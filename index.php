<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>trait_exists</h1>
</body>
</html>


    <?php
        $imageData = $produit['photo'];
        $imageSrc = 'data:image/jpeg;base64,' . base64_encode($imageData);
    ?>
    <img src="<?php echo $imageSrc; ?>" alt="Photo du produit">

    if (isset($_FILES['photo'])) {
            $imageData = $_FILES['photo']['tmp_name'];

            // Obtenir le type de l'image
            $imageType = exif_imagetype($imageData);

            // Vérifier le type d'image et charger l'image correspondante
            if ($imageType === IMAGETYPE_JPEG) {
                $sourceImage = imagecreatefromjpeg($imageData);
            } elseif ($imageType === IMAGETYPE_PNG) {
                $sourceImage = imagecreatefrompng($imageData);
            } elseif ($imageType === IMAGETYPE_GIF) {
                $sourceImage = imagecreatefromgif($imageData);
            } else {
                // Type d'image non supporté
                // Gérez l'erreur ou affichez un message approprié à l'utilisateur
            }

            $newWidth = 400;
            $newHeight = 400;

            // Créer une nouvelle image avec les nouvelles dimensions
            $resizedImage = imagecreatetruecolor($newWidth, $newHeight);

            // Redimensionner l'image d'origine vers la nouvelle image
            imagecopyresampled($resizedImage, $sourceImage, 0, 0, 0, 0, $newWidth, $newHeight, imagesx($sourceImage), imagesy($sourceImage));

            // Convertir l'image redimensionnée en une chaîne de données
            ob_start();
            imagejpeg($resizedImage);
            $imageDataResized = ob_get_clean();

            $pdo = connectDB();
            $produitModel = new ProduitModel($pdo);
            $produitModel->ajouterProduit($nom, $reference, $description, $prix_ht, $imageDataResized, $prix_ttc, $taux_tva, $couleur, $made_in_france, $longueur, $largeur, $hauteur, $poids_net, $disponibilite);

            imagedestroy($sourceImage);
            imagedestroy($resizedImage);