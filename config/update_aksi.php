<?php
session_start();
require_once 'connect.php';
$uploaddir = '../image/aksii/';
$file = $uploaddir.$_FILES['file']['name'];
$id_aksiya = $_POST['id_aksiya'];
$Name = $_POST['Name'];
$Data = $_POST['Data'];
$Description = $_POST['Description'];
mysqli_query($connect, query:"UPDATE `aksi` SET `Name` = '$Name', `Data` = '$Data', `Description` = '$Description', `Image` = '$file' WHERE `aksi`.`idAksi` = '$id_aksiya'");
if (!empty($_POST)) {
    if ($_FILES['file'] ['name'] !=''){
        $uploadfile = $uploaddir . $_FILES['file']['name'];
        move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
    }
}
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>