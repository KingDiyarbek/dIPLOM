<?php
session_start();
require_once '../config/connect.php';
$id = $_GET['id'];
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$category = mysqli_query($connect, query:"SELECT * FROM `category` WHERE `idCategory` = '$id'");
$category = mysqli_fetch_assoc($category);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/update.css">
    <title>Document</title>
</head>
<body>
<div class="user">
    <div class="user_content">
        <h2><?= $_SESSION['admin']['Name'] ?> <?= $_SESSION['admin']['Surname'] ?> <?= $_SESSION['admin']['Patronymic'] ?> </h2>
        <a class="btn_user" href="../config/logout.php">ВЫХОД</a>
    </div>

</div>
<div class="sidebar_menu">
    <h2>DIMOA</h2>
    <div class="sidebar_content">
            <ul>
                <li><a href="sotrudniki.php">Сотрудники</a></li>
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
<div class="update">
    <div class="update_content">
        <form action="config/update_category.php" method="post"  enctype="multipart/form-data">
            <input type="hidden" name="id_category" value="<?= $category['idCategory']?>">
            <label for="Name">Название</label>
            <input type="text" name="Name" value="<?= $category['Name_category']?>">
            <button>Изменить</button>
        </form>
    </div>
</div>
<script src="js/profile.js"></script>
</body>
</html>