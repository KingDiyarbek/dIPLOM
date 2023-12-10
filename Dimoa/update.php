<?php
session_start();
require_once 'config/connect.php';
$id = $_GET['id'];
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$tovar = mysqli_query($connect, query:"SELECT * FROM `menu` WHERE `idMenu`= '$id'");
$tovar = mysqli_fetch_assoc($tovar);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/update.css">
    <title>Document</title>
</head>
<body>
<div class="user">
    <div class="user_content">
        <h2><?= $_SESSION['user']['Name'] ?> <?= $_SESSION['user']['Surname'] ?> <?= $_SESSION['user']['Patronymic'] ?> </h2>
        <a class="btn_user" href="logout.php">ВЫХОД</a>
    </div>

</div>
<div class="sidebar_menu">
    <h2>DIMOA</h2>
    <div class="sidebar_content">
        <ul>
            <li><a href="#11">Акции</a></li>
        </ul>
            <?php
                while ($sidebar = mysqli_fetch_assoc($result_sidebar))
                {
                    ?>
                        <ul>
                            <li><a href="tovar.php?id=<?= $sidebar['idCategory'] ?>"><?= $sidebar['Name']; ?></a></li>
                        </ul>  
                    <?php
                }
            ?>
        <button class="sidebar_create">+</button>
    </div>
</div>
<div class="update">
    <div class="update_content">
        <form action="config/update_tovar.php" method="post"  enctype="multipart/form-data">
            <input type="hidden" name="id_tovar" value="<?= $tovar['idMenu']?>">
            <label for="Name">Название</label>
            <input type="text" name="Name" value="<?= $tovar['Name']?>">
            <label for="Price" >Цена</label>
            <input type="text" name="Price" value="<?= $tovar['Price']?>">
            <label for="Description">Описание</label>
            <textarea name="Description"><?= $tovar['Description']?></textarea>
            <input type="file" name="file"><img src="<?= $tovar['Image']?>" alt="">
            <button>Изменить</button>
        </form>
    </div>

</div>
<div class="create">
    <div class="container_create">
        <h1>Добавление категории</h1>
        <form action="create_category.php" method="post">
            <input type="text" name="Name" placeholder="Названия">
            <button type="submit">Добавить</button>
        </form>
        <button class="modal__close">&#10006;</button>
    </div>
</div>

<script src="js/profile.js"></script>
</body>
</html>