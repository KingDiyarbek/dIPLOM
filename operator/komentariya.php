<?php
session_start();
require_once 'config/connect.php';
$result_konentariya = mysqli_query($connect, query: "SELECT * FROM `komentariya` WHERE `Status` = 'Не прочитано' ORDER BY `komentariya`.`Date` ASC");
if (!isset($_SESSION['user'])) {
    header('Location: admin.php');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/komentariya.css">
    <title>Document</title>
</head>

<body>
    <div class="user">
        <div class="user_content">
            <h2><?= $_SESSION['user']['Name'] ?> <?= $_SESSION['user']['Surname'] ?> <?= $_SESSION['user']['Patronymic'] ?> </h2>
            <a class="btn_user" href="config/logout.php">ВЫХОД</a>
        </div>

    </div>
    <div class="sidebar_menu">
        <h2>DIMOA</h2>
        <div class="sidebar_content">
            <ul>
                <li><a href="">Заказы</a></li>
                <li><a href="">Уведомлении</a>
                    <ul>
                        <li><a href="komentariya.php">Новые</a></li>
                        <li><a href="all_koment.php">Все</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="komentariya">
        <div class="container_komentariya">
            <div class="content_komentariya">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th>Имя</th>
                            <th>Номер или почта</th>
                            <th>Дата</th>
                            <th>Статус</th>
                            <th>Действие</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <?php
                while ($koment = mysqli_fetch_assoc($result_konentariya)) {
                ?>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td><?= $koment['Name'] ?></td>
                                <td><?= $koment['email'] ?></td>
                                <td><?= $koment['Date'] ?></td>
                                <td><?= $koment['Status'] ?></td>
                                <td><a href="koment_prosmotr.php?id=<?= $koment['idKomentariya'] ?>">Открыть</a></td>
                            </tr>
                        </tbody>
                    </table>
                <?php
                }
                ?>
            </div>
        </div>

    </div>
    <div class="create">
        <div class="container_create">
            <h1>Добавление категории</h1>
            <form action="config/create_category.php" method="post">
                <input type="text" name="Name" placeholder="Названия">
                <button type="submit">Добавить</button>
            </form>
            <button class="modal__close">&#10006;</button>
        </div>
    </div>

    <div class="create_aksi">
        <div class="container_create_aksi">
            <h1>Добавление акции</h1>
            <div class="content_create_aksi">
                <form action="config/create_aksi.php" method="post" enctype="multipart/form-data">
                    <input type="text" name="Name" placeholder="Названия">
                    <input type="date" name="Date">
                    <textarea name="Description" placeholder="Названия"></textarea>
                    <input type="file" name="file">
                    <button type="submit">Добавить</button>
                </form>
                <button class="modal__close">&#10006;</button>
            </div>
        </div>
    </div>
    <script src="js/profile.js"></script>
</body>

</html>