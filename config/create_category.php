<?php
session_start();
require_once 'connect.php';
$uploaddir = '../image/category/';
$file = $uploaddir.$_FILES['file']['name'];
$Name = $_POST['Name'];
if (!empty($_POST)) {
    if ($_FILES['file'] ['name'] !=''){
        $uploadfile = $uploaddir . $_FILES['file']['name'];
        move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
    }
}
mysqli_query($connect, query:"INSERT INTO `category` (`Name_category`, `Image`) VALUES ('$Name', '$file')");
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>