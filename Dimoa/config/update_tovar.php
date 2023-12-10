<?php
session_start();
require_once 'connect.php';
$uploaddir = '../image/menu';
$file = $uploaddir.$_FILES['file']['name'];
$id_tovar = $_POST['id_tovar'];
$Name = $_POST['Name'];
$Price = $_POST['Price'];
$Description = $_POST['Description'];
mysqli_query($connect, query:"UPDATE `menu` SET `Name` = '$Name', `Price` = '$Price', `Description` = '$Description', `Image` = '$file' WHERE `menu`.`idMenu` = '$id_tovar'");
if (!empty($_POST)) {
    if ($_FILES['file'] ['name'] !=''){
        $uploadfile = $uploaddir . $_FILES['file']['name'];
        move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
    }
}
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>