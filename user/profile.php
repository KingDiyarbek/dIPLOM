<?php
session_start();
require_once '../config/connect.php';
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$result_pizza = mysqli_query($connect, query:"SELECT * FROM `menu`");
$result_aksii = mysqli_query($connect, query:'SELECT * FROM `aksi`');

if (!isset($_SESSION['user'])) {
    header('Location: admin.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/profile.css">
    <title>Document</title>
</head>
<body>
<div class="user">
    <div class="user_content">
        <h2><?= $_SESSION['user']['Name'] ?> <?= $_SESSION['user']['Surname'] ?> <?= $_SESSION['user']['Patronymic'] ?> </h2>
        <a class="btn_user" href="../config/logout.php">ВЫХОД</a>
    </div>

</div>
<div class="sidebar_menu">
    <h2>DIMOA</h2>
    <div class="sidebar_content">
            <ul>
                <li><a href="profile.php">Акции</a></li>
            </ul>
            <ul>
                <li><a href="category.php">Категории</a>
                    <?php
                    while ($sidebar = mysqli_fetch_assoc($result_sidebar)) {
                    ?>
                        <ul>
                            <li><a href="tovar.php?id=<?= $sidebar['idCategory'] ?>"><?= $sidebar['Name_category']; ?></a></li>

                        </ul>
                    <?php
                    }
                    ?>
                </li>
            </ul>
    </div>
</div>
<div class="tovar">
    <div class="container_tovar">
        <div class="aksi_card">
                <?php
                    while ($aksi = mysqli_fetch_assoc($result_aksii))
                    {
                        ?>
                        <form action="aksiya_info.php">
                                <div class="aksi_content">
                                    <div class="img_card"><img src="<?= $aksi['Image'] ?>" alt="">
                                    </div>
                                    <div class="aksi_content_text">
                                        <div class="data">
                                            <h3 class="data"><?= $aksi['Data'] ?></h3>
                                        </div>
                                        <div class="aksi_text">
                                            <h2><?= $aksi['Name']; ?></h2>
                                        </div>
                                            
                                        <div class="aksi_priwiew">
                                            <p><?= $aksi['Description']; ?></p>
                                        </div>
                                    </a></div>
                                    <div class="aksi_btn">
                                        <a href="config/delete_aksi.php?id=<?= $aksi['idAksi'] ?>"><img src="image/profile/delete.png" alt=""></a>
                                        <a class="setup_tovar" href="update_aksii.php?id=<?= $aksi['idAksi'] ?>">Изменить</a>
                                    </div>
                                    
                                </div>
                        </form>
                        
                        <?php
                    }
                ?>
                    <button class="aksi_create">+</button>
            </div>    
    </div>
</div>

<div class="create_aksi">
    <div class="container_create_aksi">
        <h1>Добавление акции</h1>
        <div class="content_create_aksi"> 
            <form action="config/create_aksi.php" method="post"  enctype="multipart/form-data">
                <input type="text" name="Name" placeholder="Названия">
                <input type="date" name="Date">
                <textarea  name="Description" placeholder="Названия"></textarea>
                <input type="file" name="file">
                <button type="submit">Добавить</button>
            </form>
            <button class="modal__close">&#10006;</button>
        </div>
        </div>
</div>
<script src="../js/profile.js"></script>
</body>
</html>