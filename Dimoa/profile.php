<?php
session_start();
require_once 'connect.php';
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$login = $_POST['login'];
$password = $_POST['password'];
$chek_user= mysqli_query($connect, query:"SELECT * FROM `user` WHERE `login` = '$login' AND `password` = '$password'");
$result_pizza = mysqli_query($connect, query:'SELECT * FROM `menu`');

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
<div class="user">
    <h2><?= $_SESSION['user']['Name'] ?> <?= $_SESSION['user']['Surname'] ?> <?= $_SESSION['user']['Patronymic'] ?> </h2>
    <button class="btn_user" type="submit">ВЫХОД</button>
</div>
<div class="sidebar_menu">
    <h2>DIMOA</h2>
    <div class="sidebar_content">
        <?php
            while ($sidebar = mysqli_fetch_assoc($result_sidebar))
            {
                ?>
                <ul>
                    <li><a href="#pizza"><?= $sidebar['Name']; ?></a></li>
                </ul>
                <?php
            }
        ?>
                <ul>
                    <li><a href="#pizza">Акции</a></li>
                </ul>
    </div>
</div>
<div class="tovar">
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
</body>
</html> 