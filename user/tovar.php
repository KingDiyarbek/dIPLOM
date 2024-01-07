<?
require_once '../config/connect.php';
session_start();
$id_tovar = $_GET['id'];
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$create_tovar = mysqli_query($connect, query:"SELECT * FROM `menu` WHERE `Category_idcategory`= '$id_tovar'");
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
        <div class="menu">
            <?php
                while ($tovar = mysqli_fetch_assoc($create_tovar))
                {
                    ?>
                    <div class="menu_card">
                        <div class="container_1">
                            <div class="wrapper">
                                <div class="banner-image"><img src="<?= $tovar['Image'] ?>" alt=""></div>
                                <h3><?= $tovar['Name']; ?></h3>
                                <p><?= $tovar['Description']; ?></p>
                            </div>

                            <form class="button-wrapper">
                                <a href="config/delete_tovar.php?id=<?= $tovar['idMenu'] ?>"><img class="delete" src="../image/profile/delete.png" alt=""></a>
                                <a class="setup_tovar" href="update_tovar.php?id=<?= $tovar['idMenu'] ?>">Изменить</a>
                            </form>
                        </div>
                    </div>
                    <?php
                }
            ?>
                    <button class="tovar_create">+</button>
        </div>
    </div>
    
</div>

<div class="create_tovar">
    <div class="container_create_tovar">
        <h1>Добавление товара</h1>
        <div class="content_create_tovar"> 
            <form action="config/create_tovar.php" method="post"  enctype="multipart/form-data">
                <input type="text" name="Name" placeholder="Названия">
                <input type="text" name="Price" placeholder="Цена">
                <textarea  name="Description" placeholder="Названия"></textarea>
                <input type="hidden" name="id_category" value="<?= $id_tovar ?>"> 
                <input type="file" name="file">
                <button type="submit">Добавить</button>
            </form>
            <button class="modal__close">&#10006;</button>
        </div>
        </div>
</div>
<script src="../js/tovar.js"></script>
</body>
</html>
