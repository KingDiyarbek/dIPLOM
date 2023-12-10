<?php
session_start();
require_once 'connect.php';
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
    header('Location:../profile.php');
} else {
    $_SESSION['message'] = 'Неверный логин или пароль';
    header('Location:../admin.php');
}