<?php
session_start();
require_once '../config/connect.php';
$idUser = $_GET['idUser']; 
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$user = mysqli_query($connect, query:"SELECT * FROM `user` WHERE `idUser` = '$idUser'");
$user = mysqli_fetch_assoc($user);
if (!isset($_SESSION['admin'])) {
    header('Location: admin.php');
}
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
        <a class="btn_user" href="config/logout.php">ВЫХОД</a>
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
        <form action="../config/update_user.php" method="post"  enctype="multipart/form-data">
            <input type="hidden" name="idUser" value="<?= $user['idUser']?>">
            <label for="Name">Название</label>
            <input type="text" name="Surname" value="<?= $user['Surname']?>">
            <label for="Name">Name</label>
            <input type="text" name="Name" value="<?= $user['Name']?>">
            <label for="Patronymic">Очество</label>
            <input type="text" name="Patronymic" value="<?= $user['Patronymic'] ?>">
            <label for="login">Логин</label>
            <input type="text" name="login" value="<?= $user['login'] ?>">
            <label for="password">Пароль</label>
            <input type="text" name="password" value="<?= $user['password'] ?>">
            <img src="<?= $user['Image'] ?>" alt="">
            <input type="file" name="file" value="<?= $user['Image']?>">
            <button>Изменить</button>
        </form>
    </div>

</div>
<script src="js/sotrudniki.js"></script>
</body>
</html>