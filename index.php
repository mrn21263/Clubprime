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