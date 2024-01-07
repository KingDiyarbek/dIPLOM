-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 24 2023 г., 15:00
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dimoa`
--

-- --------------------------------------------------------

--
-- Структура таблицы `aksi`
--

CREATE TABLE `aksi` (
  `idAksi` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Data` date NOT NULL,
  `Description` varchar(4500) NOT NULL,
  `Image` varchar(1000) NOT NULL,
  `Active` enum('1','0') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `aksi`
--

INSERT INTO `aksi` (`idAksi`, `Name`, `Data`, `Description`, `Image`, `Active`) VALUES
(2, 'Третья пицца за 149 рублей!', '2023-12-02', 'Только в декабре при заказе доставки двух средних или больших пицц - третья средняя пицца на классическом тесте всего за 149 рублей по промокоду 23124!', '', '1'),
(3, 'Дарим бонусы на День Рождения', '2023-12-03', 'У Вас День Рождения? «ПиццаФабрика» дарит 1000 бонусных баллов! Акция доступна всем, у кого зарегистрирован личный кабинет ПиццаФабрики. Для получения бонусных баллов необходимо указать в личном кабинете дату Вашего рождения в формате дд.мм.гг.', 'бонусы на др.jpg', NULL),
(124, 'Дарим бонусы на День Рождения', '2023-12-04', 'Дарим бонусы на День Рождения', '../image/бонусы на др.jpg', NULL),
(125, 'fdfds', '2023-12-14', 'fdfd', '../image/fon_2.jpg', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `idCategory` int NOT NULL,
  `Name_category` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`idCategory`, `Name_category`) VALUES
(1, 'Пицца'),
(2, 'Бургер'),
(3, 'Шаурма'),
(4, 'Роллы'),
(6, 'Салат'),
(7, 'Wok'),
(8, 'Закуски'),
(12, 'Десерты');

-- --------------------------------------------------------

--
-- Структура таблицы `komentariya`
--

CREATE TABLE `komentariya` (
  `idKomentariya` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `komentariya` varchar(5000) NOT NULL,
  `File` varchar(1000) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(45) NOT NULL DEFAULT 'Не прочитано'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `komentariya`
--

INSERT INTO `komentariya` (`idKomentariya`, `Name`, `email`, `komentariya`, `File`, `Date`, `Status`) VALUES
(1, 'fd', 'fds', 'fds', '', '2023-12-23 16:06:29', 'Прочитано'),
(2, 'Халида', 'gfdgfd', 'gfdgfd', '', '2023-12-23 16:06:29', 'прочитано'),
(3, 'Авазбек', 'sanobar.yusuf2023@gmail.com', 'gf', '../image/photo_2023-08-27_00-36-30.jpg', '2023-12-23 16:06:29', 'Прочитано'),
(4, 'ghf', 'sanobar.yusuf2023@gmail.com', 'gfdg', '12.png', '2023-12-23 16:06:29', 'Не прочитано'),
(5, 'Халида', 'sanobar.yusuf2023@gmail.com', 'uytt', 'photo_2023-08-27_00-37-27 (2).jpg', '2023-12-23 16:07:10', 'Не прочитано'),
(6, 'Халида', 'sanobar.yusuf2023@gmail.com', '000', 'd53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 16:09:01', 'Не прочитано'),
(7, 'Диярбек', '895364633363', 'gfdgf', 'd53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 17:27:51', 'Прочитано'),
(8, 'Имона', '5555', '0252156', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 17:28:39', 'Прочитано'),
(9, 'Пазылжан', '1212', 'Таким образом, постоянный количественный рост и сфера нашей активности представляет собой интересный эксперимент проверки экономической целесообразности принимаемых решений. Задача организации, в особенности же повышение уровня гражданского сознания обеспечивает широкому кругу специалистов участие в формировании дальнейших направлений развитая системы массового участия? Повседневная практика показывает, что рамки и место обучения кадров требует от нас анализа системы масштабного изменения ряда параметров.\r\n\r\nДорогие друзья, новая модель организационной деятельности требует определения и уточнения позиций, занимаемых участниками в отношении поставленных задач. Таким образом, консультация с профессионалами из IT обеспечивает актуальность форм воздействия! Значимость этих проблем настолько очевидна, что курс на социально-ориентированный национальный проект влечет за собой процесс внедрения и модернизации всесторонне сбалансированных нововведений! Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности позволяет выполнить важнейшие задания по разработке всесторонне сбалансированных нововведений!\r\n\r\nДорогие друзья, постоянный количественный рост и сфера нашей активности позволяет оценить значение экономической целесообразности принимаемых решений? Разнообразный и богатый опыт социально-экономическое развитие в значительной степени обуславливает создание позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что реализация намеченного плана развития требует от нас анализа форм воздействия! Значимость этих проблем настолько очевидна, что сложившаяся структура организации позволяет оценить значение соответствующих условий активизации.\r\n\r\nРазнообразный и богатый опыт постоянный количественный рост и сфера нашей...', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 17:29:45', 'Прочитано'),
(10, 'Санабар', 'sanobar.yusuf2023@gmail.com', 'лдооооооооооооооооооооо', 'cool-background.png', '2023-12-24 00:37:45', 'Не прочитано'),
(11, 'Бехрусбек', '123', 'авыыы', 'fon_4.jpg', '2023-12-24 00:39:26', 'Не прочитано'),
(12, 'Момунжанов', '455555555555', '', '../image/12.png', '2023-12-24 00:42:42', 'Не прочитано');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `idMenu` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Price` varchar(45) NOT NULL,
  `Description` varchar(5000) NOT NULL,
  `Image` varchar(1000) NOT NULL,
  `Category_idCategory` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`idMenu`, `Name`, `Price`, `Description`, `Image`, `Category_idCategory`) VALUES
(1, 'gkjklfjglkjflkgdf', '825', 'Самая уютная пицца: колбаса, огурчики и сыр', '../image/menu', 1),
(2, '5 сыра', '8020', 'Фантастически сырная четверка на томатном соусе', '../image/menu4-syra.jpg', 1),
(3, 'Чизбургер', '310', 'Куриная котлета, огурцы маринованные, салат айсберг, сыр чеддер, помидоры, соус горчица, булочка, соус кетчуп', '', 2),
(6, 'gfdgdfgf', '', '', '../image/menu', 2),
(17, 'fddf', 'dsfds', 'fdfdsfds45', '../image/menu', 1),
(19, 'hgg12134566', '550', '11', '../image/menupo-domashnemu.jpg', 1),
(21, 'ff', 'ff', 'ff', '../image/menukaliforniya-s-ugrem.jpg', 2),
(22, '11', '44', '111', 'image/menubarbekyu.jpg', 2),
(24, 'fgf', 'gfgfd', 'gfdgdf', '../image/menubarbekyu.jpg', 1),
(25, 'еуке', 'кекуе', 'куеуке', 'image/menumenupepperoni.jpg', 2),
(26, 'Rhfcfdxbr', '230', '001', 'image/menuphoto_2023-08-27_00-37-09.jpg', 1),
(27, '112', '002', '33', 'image/menu', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Patronymic` varchar(45) NOT NULL,
  `Post` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Image` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`idUser`, `login`, `password`, `Name`, `Surname`, `Patronymic`, `Post`, `Image`) VALUES
(1, 'admin', 'king2023', 'Дима', 'Момунжанов', 'Пазылжанович', 'Директор', '../imageIMG_20220806_130330.jpg'),
(2, 'king001', 'dima1234', '45646564546', 'Шмид', 'Павлович', 'Администратор', '../image'),
(3, 'liza', 'liza1234', 'Лиза', 'Павлова', 'Евгеньевна', 'Администратор', '../imageIMG_20220904_003901.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `aksi`
--
ALTER TABLE `aksi`
  ADD PRIMARY KEY (`idAksi`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Индексы таблицы `komentariya`
--
ALTER TABLE `komentariya`
  ADD PRIMARY KEY (`idKomentariya`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`),
  ADD KEY `fk_Menu_Category_idx` (`Category_idCategory`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `aksi`
--
ALTER TABLE `aksi`
  MODIFY `idAksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `komentariya`
--
ALTER TABLE `komentariya`
  MODIFY `idKomentariya` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_Menu_Category` FOREIGN KEY (`Category_idCategory`) REFERENCES `category` (`idCategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
