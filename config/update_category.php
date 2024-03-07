<?php
session_start();
require_once 'connect.php';
$uploaddir = '../image/menu/';
$id_category = $_POST['id_category'];
$Name = $_POST['Name'];
if (!empty($_FILES['file']['name'])) {
    $file = $uploaddir . $_FILES['file']['name'];
    move_uploaded_file($_FILES['file']['tmp_name'], $file);
    mysqli_query($connect, query:"UPDATE `category` SET `Name_category` = '$Name',Image = '$file'  WHERE `category`.`idCategory` = '$id_category'");
} else {
    mysqli_query($connect, query:"UPDATE `category` SET `Name_category` = '$Name' WHERE `category`.`idCategory` = '$id_category'");
}

if ($_SESSION['user']['Post'] == 'Администратор') {
    // Если пользователь - администратор, перенаправляем его на страницу администратора
    header('Location: ../user/category.php');
} else {
    // Иначе, если пользователь - обычный пользователь, перенаправляем его на страницу пользователя
    header('Location: ../admin/category.php');
}

// Важно: после вызова header() следует прервать выполнение скрипта
exit;
?>