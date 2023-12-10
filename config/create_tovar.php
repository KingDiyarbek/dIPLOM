<?php
var_dump($_FILES);
$uploaddir = 'image/menu';
$file = $uploaddir.$_FILES['file']['name'];
session_start();
require_once 'connect.php';
$Name = $_POST['Name'];
$Price = $_POST['Price'];
$Description = $_POST['Description'];
$id_category = $_POST['id_category'];
mysqli_query($connect, query:"INSERT INTO `menu` (`Name`, `Price`, `Description`, `Image`, `Category_idCategory`) VALUES ('$Name', '$Price', '$Description', '$file', '$id_category')");
if (!empty($_POST)) {
    if ($_FILES['file'] ['name'] !=''){
        $uploadfile = $uploaddir . $_FILES['file']['name'];
        move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
    }
}
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>