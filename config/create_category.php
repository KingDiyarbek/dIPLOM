<?php
session_start();
require_once 'connect.php';
$uploaddir = '../image/category/';
$Name = $_POST['Name'];
$message = '';

if (!empty($_FILES['file']['name'])) {
    $filename = $_FILES['file']['name'];
    $filetmp = $_FILES['file']['tmp_name'];
    $file = $uploaddir . $filename;

    // Перемещение загруженного файла в папку
    if (move_uploaded_file($filetmp, $file)) {
        // Загрузка изображения в таблицу img
        mysqli_query($connect, "INSERT INTO `img` (`id`, `File`, `idMenu`, `idCategory`, `idAksii`, `idUser`) VALUES (NULL, '$file', NULL, NULL, NULL, NULL)");

        // Получение идентификатора добавленного файла
        $file_id = mysqli_insert_id($connect);

        // Добавление категории в таблицу category1 с указанием идентификатора файла
        mysqli_query($connect, "INSERT INTO `categoty_1` (`idCategory`, `Name`, `Image`) VALUES (NULL, '$Name', '$file_id')");

        // Получение идентификатора добавленной категории
        $categoty_id = mysqli_insert_id($connect);

        // Обновление idCategory в таблице img
        mysqli_query($connect, "UPDATE `img` SET `idCategory` = '$categoty_id' WHERE `id` = '$file_id'");

        $message = 'Файл успешно загружен.';
    } else {
        $message = 'Ошибка при загрузке файла.';
    }
} else {
    // Если изображение не загружено, добавляем категорию без изображения
    mysqli_query($connect, "INSERT INTO `categoty_1` (`idCategory`, `Name`) VALUES (NULL, '$Name')");
}

// После загрузки выводим сообщение
echo $message;
?>
