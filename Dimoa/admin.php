<?php
    session_start();
    if (!$_SESSION['user']) {
        header('Location: admin.php');
    } 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admin.css">
    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="brand-logo"></div>
    <div class="brand-title">DIMOA</div>
    <form action="profile.php" method="post">
        <input type="text" name="login" placeholder="Логин"/>
        <input type="password" name="password" placeholder="Введите проль" />
        <button type="submit">ВХОД</button>
    </form>
</div>
</body>
</html>