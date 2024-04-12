-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 12 2024 г., 23:48
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
  `Image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `aksi`
--

INSERT INTO `aksi` (`idAksi`, `Name`, `Data`, `Description`, `Image`) VALUES
(2, 'Третья пицца за 160 рублей!', '2025-01-02', 'Только в декабре при заказе доставки двух средних или больших пицц - третья средняя пицца на классическом тесте всего за 149 рублей по промокоду 23124!', '../image/aksii/1.jpg'),
(3, 'Дарим бонусы на День Рождения', '2023-12-03', 'У Вас День Рождения? «ПиццаФабрика» дарит 1000 бонусных баллов! Акция доступна всем, у кого зарегистрирован личный кабинет ПиццаФабрики. Для получения бонусных баллов необходимо указать в личном кабинете дату Вашего рождения в формате000', '../image/aksii/бонусы на др.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `aksii`
--

CREATE TABLE `aksii` (
  `idAksiya` int NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Image` int NOT NULL,
  `Date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `aksii`
--

INSERT INTO `aksii` (`idAksiya`, `Name`, `Description`, `Image`, `Date`) VALUES
(1, 'Дарим бонусы на День Рождения', 'авыавав', 20, '2024-04-12'),
(2, 'Десерты', '123', 26, '2024-05-05');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `idCategory` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`idCategory`, `Name`, `Image`) VALUES
(9, 'Пицца', 7),
(10, 'Бургер', 8),
(11, 'Шаурма', 9),
(12, 'Салат', 10),
(13, 'Wok', 11),
(14, 'Закуски', 12),
(15, 'Напитки', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `img`
--

CREATE TABLE `img` (
  `id` int NOT NULL,
  `File` varchar(1000) NOT NULL,
  `idMenu` int DEFAULT NULL,
  `idCategory` int DEFAULT NULL,
  `idAksii` int DEFAULT NULL,
  `idUser` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `img`
--

INSERT INTO `img` (`id`, `File`, `idMenu`, `idCategory`, `idAksii`, `idUser`) VALUES
(7, '../image/category/picca-main_cat_image-13-26278.jpg', NULL, 9, NULL, NULL),
(8, '../image/category/бургер.jpg', NULL, 10, NULL, NULL),
(9, '../image/category/шаурма.jpg', NULL, 11, NULL, NULL),
(10, '../image/category/салат.jpg', NULL, 12, NULL, NULL),
(11, '../image/category/вок.jpg', NULL, 13, NULL, NULL),
(12, '../image/category/закуски.jpg', NULL, 14, NULL, NULL),
(13, '../image/category/напитки.jpg', NULL, 15, NULL, NULL),
(14, '../image/menu/9/po-domashnemu.jpg.jpg.jpg', NULL, NULL, NULL, NULL),
(15, '../image/menu/9/po-domashnemu.jpg.jpg.jpg', 2, NULL, NULL, NULL),
(16, '../image/бонусы на др.jpg', NULL, NULL, NULL, NULL),
(17, '../image/бонусы на др.jpg', NULL, NULL, NULL, NULL),
(18, '../image/бонусы на др.jpg', NULL, NULL, NULL, NULL),
(19, '../image/бонусы на др.jpg', NULL, NULL, NULL, NULL),
(20, '../image/бонусы на др.jpg', NULL, NULL, 1, NULL),
(21, '../image/sotrudnik/photo_2023-08-27_00-37-38.jpg', NULL, NULL, NULL, NULL),
(22, '../image/sotrudnik/photo_2023-08-27_00-37-38.jpg', NULL, NULL, NULL, NULL),
(23, '../image/sotrudnik/photo_2023-08-27_00-37-38.jpg', NULL, NULL, NULL, 1),
(24, '../image/sotrudnik/3e7efa8e33f24a9bbd73c68d7c2ae208-scaled.jpg', NULL, NULL, NULL, NULL),
(25, '../image/sotrudnik/s-NgVknlUCM.jpg', NULL, NULL, NULL, 2),
(26, '../image/455.png', NULL, NULL, 2, NULL),
(27, '../image/menu/Пицца/4-syra.jpg.jpg', NULL, NULL, NULL, NULL),
(28, '../image/menu/Пицца/4-syra.jpg.jpg', 3, NULL, NULL, NULL),
(29, '../image/menu/Шаурма/классическая.jpg.jpg.jpg', 4, NULL, NULL, NULL),
(30, '../image/menu/Салат/cezar-s-indeykoy.jpg.jpg', 5, NULL, NULL, NULL),
(31, '../image/menu/Салат/cezar-s-krevetkami.jpg.jpg', 6, NULL, NULL, NULL);

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
(2, 'Халида', 'gfdgfd', 'gfdgfd', '', '2023-12-23 16:06:29', 'Прочитано'),
(3, 'Авазбек', 'sanobar.yusuf2023@gmail.com', 'gf', '../image/photo_2023-08-27_00-36-30.jpg', '2023-12-23 16:06:29', 'Прочитано'),
(4, 'ghf', 'sanobar.yusuf2023@gmail.com', 'gfdg', '12.png', '2023-12-23 16:06:29', 'Не прочитано'),
(5, 'Халида', 'sanobar.yusuf2023@gmail.com', 'uytt', 'photo_2023-08-27_00-37-27 (2).jpg', '2023-12-23 16:07:10', 'Не прочитано'),
(6, 'Халида', 'sanobar.yusuf2023@gmail.com', '000', 'd53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 16:09:01', 'Не прочитано'),
(7, 'Диярбек', '895364633363', 'gfdgf', 'd53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 17:27:51', 'Прочитано'),
(8, 'Имона', '5555', '0252156', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 17:28:39', 'Прочитано'),
(9, 'Пазылжан', '1212', 'Таким образом, постоянный количественный рост и сфера нашей активности представляет собой интересный эксперимент проверки экономической целесообразности принимаемых решений. Задача организации, в особенности же повышение уровня гражданского сознания обеспечивает широкому кругу специалистов участие в формировании дальнейших направлений развитая системы массового участия? Повседневная практика показывает, что рамки и место обучения кадров требует от нас анализа системы масштабного изменения ряда параметров.\r\n\r\nДорогие друзья, новая модель организационной деятельности требует определения и уточнения позиций, занимаемых участниками в отношении поставленных задач. Таким образом, консультация с профессионалами из IT обеспечивает актуальность форм воздействия! Значимость этих проблем настолько очевидна, что курс на социально-ориентированный национальный проект влечет за собой процесс внедрения и модернизации всесторонне сбалансированных нововведений! Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности позволяет выполнить важнейшие задания по разработке всесторонне сбалансированных нововведений!\r\n\r\nДорогие друзья, постоянный количественный рост и сфера нашей активности позволяет оценить значение экономической целесообразности принимаемых решений? Разнообразный и богатый опыт социально-экономическое развитие в значительной степени обуславливает создание позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что реализация намеченного плана развития требует от нас анализа форм воздействия! Значимость этих проблем настолько очевидна, что сложившаяся структура организации позволяет оценить значение соответствующих условий активизации.\r\n\r\nРазнообразный и богатый опыт постоянный количественный рост и сфера нашей...', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2023-12-23 17:29:45', 'Прочитано'),
(10, 'Санабар', 'sanobar.yusuf2023@gmail.com', 'лдооооооооооооооооооооо', 'cool-background.png', '2023-12-24 00:37:45', 'Не прочитано'),
(11, 'Бехрусбек', '123', 'авыыы', 'fon_4.jpg', '2023-12-24 00:39:26', 'Не прочитано'),
(12, 'Момунжанов', '455555555555', '', '../image/12.png', '2023-12-24 00:42:42', 'Прочитано'),
(13, 'папа', 'павпва', 'пава', '../image/photo_2023-08-27_00-37-27.jpg', '2023-12-24 19:15:50', 'Не прочитано'),
(14, '', '', '', '../image/photo_2023-08-27_00-37-36.jpg', '2023-12-27 22:51:38', 'Не прочитано'),
(15, 'Пазылжан', 'fddddd', 'dd', '../image/Array', '2023-12-27 22:57:57', 'Не прочитано'),
(16, 'Пазылжан', 'fddddd', 'dd', '../image/Array', '2023-12-27 22:59:39', 'Не прочитано'),
(17, 'Пазылжан', 'fddddd', 'dd', '../image/Array', '2023-12-27 22:59:50', 'Не прочитано'),
(18, 'Пазылжан', 'fddddd', 'dd', '../image/Array', '2023-12-27 22:59:55', 'Не прочитано'),
(19, 'Пазылжан', 'fddddd', 'dd', '../image/Array', '2023-12-27 23:00:03', 'Не прочитано'),
(20, 'Пазылжан', 'ds', '', '../image/photo_2023-08-27_00-37-33.jpg', '2023-12-27 23:00:48', 'Не прочитано'),
(21, '', '', '', '../image/', '2023-12-31 17:07:44', 'Не прочитано'),
(22, '', '', '', '../image/', '2023-12-31 17:07:47', 'Не прочитано'),
(23, 'па', 'пав', 'пав', '../image/', '2023-12-31 17:07:52', 'Не прочитано'),
(24, '', '', '', '../image/', '2023-12-31 17:09:41', 'Не прочитано'),
(25, 'gf', '', '', '../image/', '2023-12-31 17:09:44', 'Не прочитано'),
(26, '', '', '', '../image/', '2023-12-31 17:13:41', 'Не прочитано'),
(27, '', '', '', '../image/', '2024-01-04 17:53:02', 'Не прочитано'),
(28, 'в', 'в', 'в', '../image/photo_2023-08-27_00-37-09.jpg', '2024-02-25 23:44:13', 'Не прочитано'),
(29, 'г', 'г', 'г', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2024-02-25 23:45:12', 'Не прочитано'),
(30, 'Лидия', 'baikalcentr@gmail.com', 'ы', '../image/', '2024-02-25 23:47:11', 'Не прочитано'),
(31, 'ыы', 'ыыы', 'ы', '../image/', '2024-02-25 23:52:56', 'Не прочитано'),
(32, 'в', 'в', 'вв', '../image/', '2024-02-25 23:53:24', 'Не прочитано'),
(33, 'ы', 'ы', 'ы', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2024-02-25 23:53:50', 'Не прочитано'),
(34, 'мемати', '8951456', '123456', '../image/73Wm99dGMSI.jpg', '2024-02-25 23:59:37', 'Не прочитано'),
(35, 'мемати', '8951456', '123456', '../image/b5488a6cb5693855e77f17312b934fba.jpg', '2024-02-25 23:59:37', 'Не прочитано'),
(36, 'пп', 'пп', 'пп', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2024-02-26 00:00:31', 'Не прочитано'),
(37, 'пп', 'пп', 'пп', '../image/fuIWpFPlpGY.jpg', '2024-02-26 00:00:31', 'Не прочитано'),
(38, '7', '7', '7', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2024-02-26 00:02:49', 'Не прочитано'),
(39, '7', '7', '7', '../image/fuIWpFPlpGY.jpg', '2024-02-26 00:02:49', 'Не прочитано'),
(40, '6', '6', '6', '../image/b5488a6cb5693855e77f17312b934fba.jpg', '2024-02-26 00:06:03', 'Не прочитано'),
(41, '6', '6', '6', '../image/d53585a956fcdca2d9bf3eba771e1001.mp4', '2024-02-26 00:06:03', 'Не прочитано');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `idMenu` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Price` varchar(45) NOT NULL,
  `Description` varchar(5000) NOT NULL,
  `Sostav` varchar(10000) NOT NULL,
  `Image` varchar(1000) NOT NULL,
  `Category_idCategory` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`idMenu`, `Name`, `Price`, `Description`, `Sostav`, `Image`, `Category_idCategory`) VALUES
(1, 'По-домашнему', '830', 'Моцарелла, ассорти из колбас (ветчина, колбаса полукопченая, колбаса салями), соус фирменный, помидоры свежие, огурцы маринованные, сушеный базилик.', '', '../image/menu/1/po-domashnemu.jpg.jpg', 1),
(2, '4 сыра', '800', 'Томатный соус, моцарелла, сыр гауда, сыр пармезан, сыр с голубой плесенью, сушёный базилик', '', '../image/menu/1/4-syra.jpg.jpg', 1),
(3, 'Чизбургер', '310', 'Куриная котлета, огурцы маринованные, салат айсберг, сыр чеддер, помидоры, соус горчица, булочка, соус кетчуп', '', '../image/menu/2/чизбургер.jpg.jpg', 2),
(6, 'gfdgdfgf', '', '', '', '../image/menu', 2),
(21, 'ff', 'ff', 'ff', '', '../image/menukaliforniya-s-ugrem.jpg', 2),
(24, 'Цезарь ', '500', 'Соус цезарь, моцарелла, курица, салат айсберг, сыр пармезан, помидоры черри, сушёный базилик', '', '../image/menu/1/cezar.jpg.jpg', 1),
(26, 'Маргарита ', '720', 'Моцарелла, помидоры свежие, соус томатный, сушеный базилик.', '', '../image/menu/1/margarita.jpg.jpg', 1),
(27, 'Классическая', '1800', 'Лаваш, курица, чесночный соус, помидор, огурец, морковка по корейски, капуста', '', '../image/menu/3/классическая.jpg.jpg', 3),
(28, 'Барбекю ', '820', 'Тесто дрожжевое, сыр моцарелла, колбаса п/к,соус томатный, мясо свинины в маринаде, помидоры свежие, перец сладкий свежий, соус томатный барбекю, лук репчатый красный, сушеный базилик.', '', '../image/menu/1/barbekyu.jpg.jpg', 1),
(29, 'Сырная ', '580', 'Моцарелла, соус томатный, сушеный базилик.', '', '../image/menu/1/syrnaya.jpg.jpg', 1),
(30, 'Чесночный цыпа ', '805', 'Моцарелла, куриное филе, соус фирменный, помидоры свежие, бекон, чесночное масло, сушеный базилик', '', '../image/menu/1/chesnochnyy-cypa.jpg.jpg', 1),
(31, 'Цезарь с цыплёнком ', '3500', 'Салат листовой, куриное филе грудки, помидоры черри, сыр пармезан, гренки, соус цезарь.', '', '../image/menu/6/cezar-s-indeykoy.jpg.jpg', 6),
(32, 'Цезарь с креветками ', '450', 'Салат айсберг, креветки, помидоры черри, сыр пармезан, гренки, соус цезарь', '', '../image/menu/6/cezar-s-krevetkami.jpg.jpg', 6),
(34, 'Греческий ', '290', 'Огурец, помидор, сладкий перец, сыр фета, салат айсберг, маслины, лук красный, заправка из оливкового масла, зелень', '', '../image/menu/6/grecheskiy.jpg.jpg', 6),
(35, 'Оливье ', '260', 'Картофель, морковь, ветчина, помидоры черри, яйцо, маринованный огурец, зеленый горошек, майонезная заправка, листья шпината.', '', '../image/menu/6/olive.jpg.jpg', 6),
(36, 'Картофель фри ', '230', 'Картофель фри, соль, специи,', '', '../image/menu/8/kartofel-fri-.jpg.jpg', 8),
(37, 'Наггетсы ', '290', 'Наггетсы куриные в панировке', '', '../image/menu/8/naggetsy-.jpg.jpg', 8),
(38, 'Жареный сыр с ягодным соусом ', '400', 'Сырные палочки \"Моцарелла\" в панировке 8шт, с ягодным соусом 25гр', '', '../image/menu/8/zharenyy-syr-.jpg.jpg', 8),
(39, 'Картофель по-деревенски ', '260', 'Картофельные дольки, чеснок, специи\r\n', '', '../image/menu/8/kartofel-po-derevenski-.jpg.jpg', 8),
(42, 'd', 'd', 'd', '', '../image/menu/1/photo_2023-08-27_00-37-33.jpg.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `menu_1`
--

CREATE TABLE `menu_1` (
  `idMenu` int NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `Price` varchar(1000) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Sostav` varchar(1000) NOT NULL,
  `Image` int NOT NULL,
  `Category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `menu_1`
--

INSERT INTO `menu_1` (`idMenu`, `Name`, `Price`, `Description`, `Sostav`, `Image`, `Category`) VALUES
(2, 'По-домашнему', '830', 'Моцарелла, ассорти из колбас (ветчина, колбаса полукопченая, колбаса салями), соус фирменный, помидоры свежие, огурцы маринованные, сушеный базилик.', 'dfs', 15, 9),
(3, '4 сыра', '800', 'Томатный соус, моцарелла, сыр гауда, сыр пармезан, сыр с голубой плесенью, сушёный базилик', 'dfs', 28, 9),
(4, 'Классическая', '180', 'Лаваш, курица, чесночный соус, помидор, огурец, морковка по корейски, капуста', 'dfs', 29, 11),
(5, 'Цезарь с цыплёнком', '350', 'Салат листовой, куриное филе грудки, помидоры черри, сыр пармезан, гренки, соус цезарь.', 'dfs', 30, 12),
(6, 'Цезарь с креветками ', '390', 'Салат айсберг, креветки, помидоры черри, сыр пармезан, гренки, соус цезарь', 'dfs', 31, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `Patronymic` varchar(100) NOT NULL,
  `Post` varchar(100) NOT NULL,
  `Image` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`idUser`, `login`, `password`, `Name`, `Surname`, `Patronymic`, `Post`, `Image`) VALUES
(1, 'нен', 'роп', 'опр', 'опр', 'пор', 'опр', 22),
(2, 'king001', 'volk4565', 'Ольга', 'Кузьмина', 'Павловна', 'Администратор', 25);

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz`
--

CREATE TABLE `zakaz` (
  `idZakaz` int NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `Adres` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `NameProduct` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Itogo` varchar(100) NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Новый'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `zakaz`
--

INSERT INTO `zakaz` (`idZakaz`, `Name`, `Adres`, `Phone`, `NameProduct`, `Itogo`, `Data`, `Status`) VALUES
(1, 'Андрей', 'Лагерная 54', '453654', '', '540', '2024-02-25 17:14:56', 'Готово'),
(2, 'Илья', 'Ленина 23', '89536547851', '{\"30\":\"u0427u0435u0441u043du043eu0447u043du044bu0439 u0446u044bu043fu0430 |805|1\"}', '805', '2024-02-25 17:21:04', 'Готово'),
(3, 'Вова', 'Лагерная 21', '8953654521', '{\"2\":\"4 u0441u044bu0440u0430|829|1\"}', '829', '2024-02-25 18:29:04', 'Готово'),
(4, 'Антон', 'Пушкина 20', '89992301452', '{\"1\":\"u041fu043e-u0434u043eu043cu0430u0448u043du0435u043cu0443|830000|1\",\"2\":\"4 u0441u044bu0440u0430|829|1\",\"24\":\"u0426u0435u0437u0430u0440u044c |829|1\",\"29\":\"u0421u044bu0440u043du0430u044f |580|1\",\"30\":\"u0427u0435u0441u043du043eu0447u043du044bu0439 u0446u044bu043fu0430 |805|1\"}', '833043', '2024-02-25 18:30:07', 'Готово'),
(5, 'Вика', 'Островского 12', '899962305412', '{\"29\":\"u0421u044bu0440u043du0430u044f |580|1\"}', '580', '2024-02-25 23:32:34', 'Готово'),
(6, 'Егор', 'Магистральная 54', '526354', '{\"29\":\"\\u0421\\u044b\\u0440\\u043d\\u0430\\u044f |580|1\",\"30\":\"\\u0427\\u0435\\u0441\\u043d\\u043e\\u0447\\u043d\\u044b\\u0439 \\u0446\\u044b\\u043f\\u0430 |805|1\"}', '1385', '2024-02-25 23:35:11', 'Готово'),
(7, 'дима', 'момунжанов', '55241456', '{\"1\":\"\\u041f\\u043e-\\u0434\\u043e\\u043c\\u0430\\u0448\\u043d\\u0435\\u043c\\u0443|830000|1\",\"2\":\"4 \\u0441\\u044b\\u0440\\u0430|829|1\",\"24\":\"\\u0426\\u0435\\u0437\\u0430\\u0440\\u044c |829|1\",\"26\":\"\\u041c\\u0430\\u0440\\u0433\\u0430\\u0440\\u0438\\u0442\\u0430 |720|1\",\"28\":\"\\u0411\\u0430\\u0440\\u0431\\u0435\\u043a\\u044e |820|1\",\"29\":\"\\u0421\\u044b\\u0440\\u043d\\u0430\\u044f |580|1\",\"30\":\"\\u0427\\u0435\\u0441\\u043d\\u043e\\u0447\\u043d\\u044b\\u0439 \\u0446\\u044b\\u043f\\u0430 |805|1\"}', '834583', '2024-02-25 23:37:19', 'Новый'),
(8, 'Дима', 'Ленина 120', '89541236541', '{\"29\":\"\\u0421\\u044b\\u0440\\u043d\\u0430\\u044f |580|3\",\"30\":\"\\u0427\\u0435\\u0441\\u043d\\u043e\\u0447\\u043d\\u044b\\u0439 \\u0446\\u044b\\u043f\\u0430 |805|1\"}', '2545', '2024-02-25 23:40:39', 'Новый'),
(9, 'Лиза', 'Пушкина 20', '601254', '{\"29\":\"\\u0421\\u044b\\u0440\\u043d\\u0430\\u044f |580|2\",\"30\":\"\\u0427\\u0435\\u0441\\u043d\\u043e\\u0447\\u043d\\u044b\\u0439 \\u0446\\u044b\\u043f\\u0430 |805|1\"}', '1965', '2024-02-26 00:06:28', 'Новый'),
(10, 'Руслан', 'Боровая 8', '89501234567', '{\"3\":\"\\u0427\\u0438\\u0437\\u0431\\u0443\\u0440\\u0433\\u0435\\u0440|310|1\"}', '310', '2024-03-01 22:54:45', 'Новый'),
(11, 'павел', 'Лермонтова 21', '124563', 'null', '0', '2024-03-02 16:12:27', 'Новый'),
(12, 'Диярбек', 'ленина 15', '568974', '{\"1\":\"\\u041f\\u043e-\\u0434\\u043e\\u043c\\u0430\\u0448\\u043d\\u0435\\u043c\\u0443|830|1\",\"2\":\"4 \\u0441\\u044b\\u0440\\u0430|800|1\"}', '1630', '2024-03-03 18:57:30', 'Новый'),
(13, 'арсений', 'дальная 45', '442535', '{\"2\":\"4 \\u0441\\u044b\\u0440\\u0430|800|2\",\"24\":\"\\u0426\\u0435\\u0437\\u0430\\u0440\\u044c |500|2\"}', '2600', '2024-03-28 17:33:35', 'Новый'),
(14, 'Павел', 'ленина  7', '45212', '{\"2\":\"4 \\u0441\\u044b\\u0440\\u0430|800|1\",\"34\":\"\\u0413\\u0440\\u0435\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 |290|1\"}', '1090', '2024-04-09 01:26:14', 'Новый'),
(15, 'd', 'd', 'd', '{\"34\":\"\\u0413\\u0440\\u0435\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 |290|1\"}', '290', '2024-04-11 16:43:01', 'Новый'),
(16, 'Полат Алендар', 'РОССИЯ, 156025, Костромская обл, г Кострома, ул Рабочая 9-я, Дом 2/88, кв. 3', '+79950726284', '{\"24\":\"\\u0426\\u0435\\u0437\\u0430\\u0440\\u044c |500|1\",\"26\":\"\\u041c\\u0430\\u0440\\u0433\\u0430\\u0440\\u0438\\u0442\\u0430 |720|1\"}', '1220', '2024-04-11 20:55:02', 'Новый'),
(17, 'tr', 'tr', 'tr', '{\"2\":\"\\u041f\\u0438\\u0446\\u0446\\u0430|830|3\"}', '2490', '2024-04-12 22:55:33', 'Новый');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `aksi`
--
ALTER TABLE `aksi`
  ADD PRIMARY KEY (`idAksi`);

--
-- Индексы таблицы `aksii`
--
ALTER TABLE `aksii`
  ADD PRIMARY KEY (`idAksiya`),
  ADD KEY `Image` (`Image`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`),
  ADD KEY `Image` (`Image`);

--
-- Индексы таблицы `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMenu` (`idMenu`,`idCategory`,`idAksii`,`idUser`),
  ADD KEY `idCategory` (`idCategory`),
  ADD KEY `idAksii` (`idAksii`),
  ADD KEY `idUser` (`idUser`);

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
  ADD KEY `fk_Menu_Category_idx` (`Category_idCategory`),
  ADD KEY `Name` (`Name`);

--
-- Индексы таблицы `menu_1`
--
ALTER TABLE `menu_1`
  ADD PRIMARY KEY (`idMenu`),
  ADD KEY `Image` (`Image`,`Category`),
  ADD KEY `Category` (`Category`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `Image` (`Image`);

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`idZakaz`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `aksi`
--
ALTER TABLE `aksi`
  MODIFY `idAksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `aksii`
--
ALTER TABLE `aksii`
  MODIFY `idAksiya` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `img`
--
ALTER TABLE `img`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `komentariya`
--
ALTER TABLE `komentariya`
  MODIFY `idKomentariya` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `menu_1`
--
ALTER TABLE `menu_1`
  MODIFY `idMenu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `idZakaz` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `aksii`
--
ALTER TABLE `aksii`
  ADD CONSTRAINT `aksii_ibfk_1` FOREIGN KEY (`Image`) REFERENCES `img` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Image`) REFERENCES `img` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`idMenu`) REFERENCES `menu_1` (`idMenu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `img_ibfk_2` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `img_ibfk_3` FOREIGN KEY (`idAksii`) REFERENCES `aksii` (`idAksiya`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `img_ibfk_4` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `menu_1`
--
ALTER TABLE `menu_1`
  ADD CONSTRAINT `menu_1_ibfk_1` FOREIGN KEY (`Category`) REFERENCES `category` (`idCategory`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `menu_1_ibfk_2` FOREIGN KEY (`Image`) REFERENCES `img` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Image`) REFERENCES `img` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
