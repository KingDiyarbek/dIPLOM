<?php
session_start();
require_once 'connect.php';
$login = $_POST['login'];
$password = $_POST['password'];
$chek_user= mysqli_query($connect, query:"SELECT * FROM `user` WHERE `login` = '$login' AND `password` = '$password' AND `Post`  = 'Администратор'");
$chek_admin= mysqli_query($connect, query:"SELECT * FROM `user` WHERE `login` = '$login' AND `password` = '$password' AND `Post`  = 'Директор'");
if (mysqli_num_rows($chek_user) > 0) {

    $user = mysqli_fetch_assoc($chek_user);
        $_SESSION ['user'] = [
        "id" => $user['idUser'],
        "Name" => $user['Name'],
        "Surname" => $user['Surname'],
        "Patronymic" => $user['Patronymic']
    ];
    header('Location:../profile.php');
} else {
    $_SESSION['message'] = 'Неверный логин или пароль';
    header('Location:../admin.php');
}

if (mysqli_num_rows($chek_admin) > 0) {

    $admin = mysqli_fetch_assoc($chek_admin);
        $_SESSION ['admin'] = [
        "id" => $admin['idUser'],
        "Name" => $admin['Name'],
        "Surname" => $admin['Surname'],
        "Patronymic" => $admin['Patronymic']
    ];
    header('Location:../admin/profile.php');
} else {
    $_SESSION['message'] = 'Неверный логин или пароль';
    header('Location:../admin.php');
}