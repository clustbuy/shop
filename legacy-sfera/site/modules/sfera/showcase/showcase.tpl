<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    <meta name="theme-color" content="#fde678">
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/carousel.css">
    <link rel="stylesheet" href="/assets/sfera/css/categories.css">
    <link rel="stylesheet" href="/assets/sfera/css/top10-slider.css">
    <link rel="stylesheet" href="/assets/sfera/css/product-reviews.css">
    <link rel="stylesheet" href="/assets/sfera/css/catalog.css">
    ~~include file="sfera/tpl/scripts.tpl"~

</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Main Content -->
<main class="main-content">


    <!-- Triple Carousel Block -->
    <section class="triple-carousel-section">
        <div class="container">
            <div class="triple-carousel-wrapper">
                ~~mod path="sfera/" mod_name="main_carousel"~
                
                <!-- Side Carousels (1/4 width) -->
                <div class="side-carousels-container">
                    ~~mod path="sfera/" mod_name="product_carousel"~
                    ~~mod path="sfera/" mod_name="promo_carousel"~
                </div>
            </div>
        </div>
    </section>


    <!-- Popular Categories Block -->
    ~~mod path="sfera/" mod_name="popular_categories"~

    <!-- TOP-10 Slider Block -->
    ~~mod path="sfera/" mod_name="top10_products"~

    <!-- Product Reviews Section -->
    ~~mod path="sfera/" mod_name="product_reviews"~

    <!-- Product Grid -->
    <section class="product-grid-section">
        <div class="container">
            <h2 class="section-title" style="font-size: 24px;
    line-height: 30px;
    font-weight: 500;
    letter-spacing: -0.01em;
    color: #0d0d0d;
    margin-bottom: 24px;">Новинки</h2>
            ~~mod path="sfera/" mod_name="random_products"~
        </div>
    </section>
</main>


~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
<script src="/assets/sfera/js/carousel.js"></script>
<script src="/assets/sfera/js/top10-slider.js"></script>
<script src="/assets/sfera/js/catalog.js"></script>
</body>
</html>
