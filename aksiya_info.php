<?
require_once 'config/connect.php';
$listCategory = mysqli_query($connect, query: 'SELECT * FROM `category`');
$categories = mysqli_fetch_all($listCategory, MYSQLI_ASSOC);
$id_aksiya = $_GET['id'];
$aksiya_info = mysqli_query($connect, query:"SELECT * FROM `aksi` WHERE `idAksi` = '$id_aksiya'");
$aksiya_info = mysqli_fetch_assoc($aksiya_info);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/aksii.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<header class="header" id="header">
        <div class="container">
            <div class="header_inner">
                <div class="logo"><a href="index.html">DiMoa</a></div>

                <nav>
                    <ul>
                        <li><a href="/">Главная</a></li>
                        <li><a href="/#menu">Меню</a>
                            <ul>
                                <?php foreach ($categories as $category) : ?>
                                    <li><a href="/#<?= $category['idCategory'] ?>"><?= $category['Name_category'] ?></a></li>
                                <?php endforeach; ?>
                            </ul>
                        </li>
                        <li><a href="aksii.php">Акции</a></li>
                        <li><a href="kontact.php">Контакты</a></li>
                        <li><a href="#">Ещё</a>
                            <ul>
                                <li><a href="o_nas.php">О нас</a></li>
                                <li><a href="sostav.php">Состав и калорийность</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>


                <div class="corzina" id="easynetshop-cart">
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAACrUlEQVR4nO3W72sScRwH8KO/oOc96EHPehY96VHP1rMeBvP3ead3zmaoW1s1nG6DbZ7O7E8YYziCGptOGv2gH1Yrko2a2NTT6U1Dyslm20zLT2gJE9a8c3on4Rve8IH78uUFx4c7BOmkE3YxzQWvjrg+JS2uwFOk3UIthK/ZF0Ol+c85mF5Jg2U2kEbaJfe80SsOd+hgMbIHbnq/UttCBHCH/1V74Dyh3GHcrP8r2NwJMM2lhEU6l+guh3ujBudazQC1EAXr0m6lpvtfAHN8eN02uIkHwXW1czU36dkRDvkvnHU+6Cs/J50fuwRD1sNVIwiSLU4QJFccr8hGcbwgT4prKbJZuKYhI1rteFiFe8sNkeSTN7fHimvjdlib+FP/KAXv+oe3q2ca6ZpG9/6x3vLTN2SDal8MToJPd2ureiZCqOZjRt2FGhyt1Ti/URQUXC7BezA9DTRJZGqAGzj2XGhY4VCZ/j6oAYbU+KP8zIzgsMLfJoyGYg2QGTBcokkizQzcLG0NDoCQjRv0P6I9modHLkrCQJ5J9mpLRccU8F870HJJ/d+zTRWWEQL4fcQCNCq/WxdIK6TrQgDTRgNEMexyXWBYKvbkKSurS5NaDaf5uMbVqn0wm0/VBcaUir7s0B1WlzIagtN8XGNKNIywSQrDzrJdFKZJwMKUHSIyyTOEbeI4ts0nMGexQBSVT7AG0gpZgE9g2qCHuEp1kTUwLBV589Qkb8AEoc6xxlVeMYYOslkUpknAKIYGuQEJ+blk7/USH8BCZUGkywjXbOJYlg/grnm4vCBmzkBaLgvWA+6YTJzmIxdEfwNSpPI8Z2BEKl5m+0UpnqAJksgijSRG4GKmh/xVsNtahtsbGwVaLltpCFhBoqg2JOp+GRZ1v21FaZnEFVMoTjcM7OR/yG+55VR3p5ah8AAAAABJRU5ErkJggg==">
                </div>

            </div>
        </div>

    </header>

<div class="back_button">
    <a href="aksii.php" class="back">Назад</a>
</div>

<div class="content">
    <div class="title"><h1><?= $aksiya_info['Name'] ?></h1></div>
    <img class="content_img" src="../image/aksii/1.jpg" alt="">
</div>

<div id="faq">
    <ul>
        <li>
        <input type="checkbox" checked>
        <i></i>
        <h2>Подробные условия акции</h2>
        <p><?= $aksiya_info['Description'] ?></p>
        </li>
    </ul>
</div>

</body> 
</html>