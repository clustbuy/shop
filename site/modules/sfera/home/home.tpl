<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/home.css">
    <script src="/assets/sfera/js/hero.js" defer></script>
</head>
<body>
    ~~include file="sfera/tpl/header.tpl"~ <!-- ШАПКА -->
    <main class="main">
        <!-- Баннер -->
        <section class="hero">
            <div class="container">
                <div class="hero__slider">
                    <div class="hero__slides">
                        <div class="hero__slide hero__slide--active">
                            <img src="assets/sfera/img/banners/banner_1.jpg" class="hero__image" alt="Баннер акции">
                        </div>
                        <div class="hero__slide">
                            <img src="assets/sfera/img/banners/banner_2.jpg" class="hero__image" alt="Баннер новинок">
                        </div>
                    </div>
                    <button class="hero__prev">‹</button>
                    <button class="hero__next">›</button>
                </div>
            </div>
        </section>

        <!-- Популярные товары (Хиты продаж) -->
        <section class="products">
            <div class="container">
                <h2 class="section-title">Хиты продаж</h2>
                <div class="products__grid">
                    <!-- Карточка 1: Polaroid -->
                    <div class="product-card">
                        <a href="/product/1" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/polaroid.jpg" alt="Солнцезащитные очки Polaroid">
                            </div>
                            <h4 class="product-card__title">Солнцезащитные очки Polaroid</h4>
                            <span class="product-card__price-old">5 990 ₽</span>
                            <div class="product-card__price">3 990 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 2: Ray-Ban -->
                    <div class="product-card">
                        <a href="/product/2" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/rayban.jpg" alt="Оправы Ray-Ban">
                            </div>
                            <h4 class="product-card__title">Оправы Ray-Ban</h4>
                            <span class="product-card__price-old">5 990 ₽</span>
                            <div class="product-card__price">5 490 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 3: Acuvue Oasys -->
                    <div class="product-card">
                        <a href="/product/3" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/oasis.jpg" alt="Линзы Acuvue Oasys">
                            </div>
                            <h4 class="product-card__title">Линзы Acuvue Oasys</h4>
                            <div class="product-card__price">1 290 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 4: Футляр -->
                    <div class="product-card">
                        <a href="/product/4" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/futlar.jpg" alt="Футляр для очков">
                            </div>
                            <h4 class="product-card__title">Футляр для очков</h4>
                            <div class="product-card__price">490 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 5: Gucci -->
                    <div class="product-card">
                        <a href="/product/5" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/gucci.jpg" alt="Солнцезащитные очки Gucci">
                            </div>
                            <h4 class="product-card__title">Солнцезащитные очки Gucci</h4>
                            <div class="product-card__price">12 990 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 6: Tom Ford -->
                    <div class="product-card">
                        <a href="/product/6" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/tom_ford.jpg" alt="Оправы Tom Ford">
                            </div>
                            <h4 class="product-card__title">Оправы Tom Ford</h4>
                            <div class="product-card__price">8 490 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 7: Air Optix -->
                    <div class="product-card">
                        <a href="/product/7" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/airoptix.jpg" alt="Линзы Air Optix">
                            </div>
                            <h4 class="product-card__title">Линзы Air Optix</h4>
                            <div class="product-card__price">1 590 ₽</div>
                        </a>
                    </div>
                    <!-- Карточка 8: Marc Jacobs -->
                    <div class="product-card">
                        <a href="/product/8" class="product-card__link">
                            <div class="product-card__image">
                                <img src="assets/sfera/img/icons/marc_jacobs.webp" alt="Оправы Marc Jacobs">
                            </div>
                            <h4 class="product-card__title">MARC JACOBS MARC 878 003 Matte Black</h4>
                            <div class="product-card__price">2 490 ₽</div>
                        </a>
                    </div>
                </div>
                <div class="products__more">
                    <a href="/catalog/" class="btn">Смотреть больше</a>
                </div>
            </div>
        </section>
    </main>
    ~~include file="sfera/tpl/footer.tpl"~ <!-- ПОДВАЛ -->
</body>
</html>