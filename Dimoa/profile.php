<?php
session_start();
require_once 'connect.php';
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$login = $_POST['login'];
$password = $_POST['password'];
$chek_user= mysqli_query($connect, query:"SELECT * FROM `user` WHERE `login` = '$login' AND `password` = '$password'");

if (mysqli_num_rows($chek_user) > 0) {

    $user = mysqli_fetch_assoc($chek_user);

    $_SESSION ['user'] = [
        "id" => $user['idUser'],
        "Name" => $user['Name'],
        "Surname" => $user['Surname'],
        "Patronymic" => $user['Patronymic']
    ];
} else {
    $_SESSION['message'] = 'Неверный логин или пароль';
    header('Location:admin.php');
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
<div class="welcom">
    <div class="container">
        <div class="welcom_content">
            <h2>Добро пожаловать <?= $_SESSION['user'] ['Name']?> <?= $_SESSION['user'] ['Surname']?> <?= $_SESSION['user'] ['Patronymic']?></h2>
        </div>
            
    </div>
</div> 
<div class="sidebar_menu">
    <?php
        while ($sidebar = mysqli_fetch_assoc($result_sidebar))
        {
            ?>
            <li><a href="#pizza"><?= $sidebar['Name']; ?></a></li>
            <?php
        }
    ?>
</div>
</body>
</html>