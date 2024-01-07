<?php
session_start();
require_once 'config/connect.php';
$id = $_GET['id'];
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$komentariya = mysqli_query($connect, query:"SELECT * FROM `komentariya` WHERE `idKomentariya`= '$id'");
$komentariya = mysqli_fetch_assoc($komentariya);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/komentariya.css">
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
                <li><a href="">Заказы</a></li>
                <li><a href="">Уведомлении</a>
                    <ul>
                        <li><a href="komentariya.php">Новые</a></li>
                        <li><a href="all_koment.php">Все</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
<div class="koment">
    <div class="koment_content">
        <form action="config/updare_koment.php" method="post">
            <input type="hidden" name="id_koment" value="<?= $komentariya['idKomentariya']?>">
            <h2>Имя</h2>
            <h3><?= $komentariya['Name'] ?></h3>
            <h2>Телефон номер или почта</h2>
            <h3><?= $komentariya['email'] ?></h3>
            <h2>Комментария</h2>
            <p><?= $komentariya['komentariya'] ?></p>
            <h2>Файл</h2>
            <img src="<?= $komentariya['File'] ?>" alt="">
            <video controls="controls" src="<?= $komentariya['File'] ?>"></video>
            <button type="submit">Прочитано</button>
        </form>
    </div>

</div>
<script src="js/profile.js"></script>
</body>
</html>