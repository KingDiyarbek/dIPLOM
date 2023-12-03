<?php
session_start();
require_once 'connect.php';
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
    <link rel="stylesheet" href="css/profile.css">
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
                        <li><a href="#12?id=<?= $sidebar['idCategory'] ?>"><?= $sidebar['Name']; ?></a></li>
                    </ul>
                    <?php
                }
            ?>
        <button class="sidebar_create">+</button>
    </div>
</div>
<div class="tovar" id="12">
    <div class="container_tovar">
    <?php
        while ($menu = mysqli_fetch_assoc($result_pizza))
        {
            ?>
            <div class="menu_card">
                <div class="container_1">
                    <div class="wrapper">
                        <div class="banner-image"><img src="image/menu/pizza/po-domashnemu.jpg" alt=""></div>
                        <h3><?= $menu['Name']; ?></h3>
                        <p><?= $menu['Description']; ?></p>
                    </div>

                    <form class="button-wrapper" action="" method="post">
                        <button class="btn_delete"><img class="delete" src="image/profile/delete.png" alt=""></button>
                        <input type="hidden" name="id" value="<?= $menu['idMenu'] ?>">
                        <button class="btn_update" type="submit">Изменить</button>
                    </form>
                </div>
            </div>
            <?php
        }
    ?>
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