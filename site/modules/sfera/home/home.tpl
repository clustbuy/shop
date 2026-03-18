<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/footer.css">
    <link rel="stylesheet" href="/assets/sfera/css/catalog.css">

    <style>
        /* ===== ОБЩИЕ СТИЛИ ===== */
        body {
            margin: 0;
            padding: 0;
        }
        
    </style>

</head>
<body>
    ~~include file="sfera/tpl/header.tpl"~ <!-- ШАПКА -->

    <section class="catalog-preview">
        <div class="container">
            <div class="catalog-layout">
                <aside class="categories-list">
                    <h3>Категории</h3>
                    <ul>
                        <li><a href="/catalog/sunglasses/">Солнцезащитные очки</a></li>
                        <li><a href="/catalog/glasses_frames/">Оправы</a></li>
                        <li><a href="/catalog/spectacle_lenses/">Линзы для очков</a></li>
                        <li><a href="/catalog/accessories/">Аксессуары</a></li>
                        <li><a href="/catalog/children/">Детские очки</a></li>
                        <li><a href="/catalog/sport/">Спортивные очки</a></li>
                    </ul>
                </aside>

                <div class="products-grid">
                    <!-- Карточки товаров (8 штук) -->
                    <div class="product-card">
                        <a href="/product/1" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/polaroid.jpg" alt="Солнцезащитные очки"></div>
                            <h4 class="product-title">Солнцезащитные очки Polaroid</h4>
                            <div class="product-price">3 990 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/2" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/rayban.jpg" alt="Оправы"></div>
                            <h4 class="product-title">Оправы Ray-Ban</h4>
                            <div class="product-price">5 490 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/3" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/oasis.jpg" alt="Линзы"></div>
                            <h4 class="product-title">Линзы Acuvue Oasys</h4>
                            <div class="product-price">1 290 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/4" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/futlar.jpg" alt="Аксессуары"></div>
                            <h4 class="product-title">Футляр для очков</h4>
                            <div class="product-price">490 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/5" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/gucci.jpg" alt="Солнцезащитные очки"></div>
                            <h4 class="product-title">Солнцезащитные очки Gucci</h4>
                            <div class="product-price">12 990 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/6" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/tom_ford.jpg" alt="Оправы"></div>
                            <h4 class="product-title">Оправы Tom Ford</h4>
                            <div class="product-price">8 490 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/7" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/airoptix.jpg" alt="Линзы"></div>
                            <h4 class="product-title">Линзы Air Optix</h4>
                            <div class="product-price">1 590 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/8" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/marc_jacobs.webp" alt="Аксессуары"></div>
                            <h4 class="product-title">MARC JACOBS MARC 878 003 Matte Black</h4>
                            <div class="product-price">2 490 ₽</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    ~~include file="sfera/tpl/footer.tpl"~ <!-- ПОДВАЛ -->
</body>
</html>