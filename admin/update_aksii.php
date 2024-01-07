<?php
session_start();
require_once '../config/connect.php';
$id = $_GET['id'];
$result_sidebar = mysqli_query($connect, query:'SELECT * FROM `category`');
$aksiya = mysqli_query($connect, query:"SELECT * FROM `aksi` WHERE `idAksi`= '$id'");
$aksiya = mysqli_fetch_assoc($aksiya);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/update.css">
    <title>Document</title>
</head>
<body>
<div class="user">
    <div class="user_content">
        <h2><?= $_SESSION['admin']['Name'] ?> <?= $_SESSION['admin']['Surname'] ?> <?= $_SESSION['admin']['Patronymic'] ?> </h2>
        <a class="btn_user" href="../config/logout.php">ВЫХОД</a>
    </div>

</div>
<div class="sidebar_menu">
    <h2>DIMOA</h2>
    <div class="sidebar_content">
            <ul>
                <li><a href="sotrudniki.php">Сотрудники</a></li>
                <li><a href="profile.php">Акции</a></li>
            </ul>
            <ul>
                <li><a href="category.php">Категории</a>
                    <?php
                    while ($sidebar = mysqli_fetch_assoc($result_sidebar)) {
                    ?>
                        <ul>
                            <li><a href="tovar.php?id=<?= $sidebar['idCategory'] ?>"><?= $sidebar['Name_category']; ?></a></li>

                        </ul>
                    <?php
                    }
                    ?>
                </li>
            </ul>
    </div>  
</div>
<div class="update">
    <div class="update_content">
        <form action="../config/update_aksi.php" method="post"  enctype="multipart/form-data">
            <input type="hidden" name="id_aksiya" value="<?= $aksiya['idAksi']?>">
            <label for="Name">Название</label>
            <input type="text" name="Name" value="<?= $aksiya['Name']?>">
            <label for="Date" >Дата</label>
            <input type="date" name="Data" value="<?= $aksiya['Data']?>">
            <label for="Description">Описание</label>
            <textarea name="Description"><?= $aksiya['Description']?></textarea>
            <input type="file" name="file"><img src="<?= $aksiya['Image']?>" alt="">
            <button>Изменить</button>
        </form>
    </div>
</div>
<script src="../js/profile.js"></script>
</body>
</html>