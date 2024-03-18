    <?php
    include('./controller/classementcontroller.php');
    ?>

    <head>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="../css/style.css">


    </head>

    <body>
    
        <div class="podium" id="podium">
        
            <div class="place">
                <div class="ranked">
                    <?php if (isset($classementData[1])) : ?>
                        <a href="./vue/vueclub.php?id=<?php echo $classementData[1]['id']; ?>">
                            <div class="general" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="600">
                                <img src="data:image/jpeg;base64,<?php echo base64_encode($classementData[1]['logo']); ?>" alt="logo du premier" width="50%">
                                <div class="deux">
                                    <p><?php echo $classementData[1]['nom']; ?></p>
                                    <div class="coupe2">
                                        <p>2</p>
                                    </div>
                                </div>

                            </div>
                        </a>
                    <?php endif; ?>

                    <?php if (isset($classementData[0])) : ?>
                        <a href="./vue/vueclub.php?id=<?php echo $classementData[0]['id']; ?>">
                            <div class="general2"  data-aos="fade-up" data-aos-duration="500" data-aos-delay="300">
                                <img src="data:image/jpeg;base64,<?php echo base64_encode($classementData[0]['logo']); ?>" alt="logo du deuxième" width="50%">
                                <div class="un">
                                    <p><?php echo $classementData[0]['nom']; ?></p>
                                    <div class="coupe1">
                                        <p>1</p>
                                    </div>
                                </div>


                            </div>
                        </a>
                    <?php endif; ?>

                    <?php if (isset($classementData[2])) : ?>
                        <a href="./vue/vueclub.php?id=<?php echo $classementData[2]['id']; ?>">
                            <div class="general3" data-aos="fade-up" data-aos-duration="500" data-aos-delay="900">
                                <img src="data:image/jpeg;base64,<?php echo base64_encode($classementData[2]['logo']); ?>" alt="logo du troisième" width="50%">
                                <div class="trois">
                                    <p><?php echo $classementData[2]['nom']; ?></p>
                                    <div class="coupe3">
                                        <p>3</p>
                                    </div>
                                </div>


                            </div>
                        </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="classement" id="Classement">
    <?php foreach ($clubs as $club) : ?>
        <a href="./vue/vueclub.php?id=<?php echo $club['id']; ?>">
            <div class="place<?php echo $club['classement']; ?>" data-aos="fade-right" data-aos-delay="300">
                <div class="boxlogoclub">
                    <img src="data:image/jpeg;base64,<?php echo base64_encode($club['logo']); ?>" alt="Logo de <?php echo $club['nom']; ?>" width="80px">
                </div>
                <p><?php echo $club['nom']; ?></p>
                <div class="boxplaceclub">
                    <p>#<?php echo $club['classement']; ?></p>
                </div>
            </div>
        </a>
    <?php endforeach; ?>
</div>

    </body>