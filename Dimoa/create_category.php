<?php
session_start();
require_once 'connect.php';
$Name = $_POST['Name'];
mysqli_query($connect, query:"INSERT INTO `category` (`Name`) VALUES ('$Name')");
header('Location: profile.php');
?>