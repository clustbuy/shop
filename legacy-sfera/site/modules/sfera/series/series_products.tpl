<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>~~$pageTitle~ - Творческий Центр СФЕРА</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/catalog.css">
    ~~include file="sfera/tpl/scripts.tpl"~
</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <a href="/">Главная</a>
        <span>/</span>
        <a href="/catalog/">Каталог</a>
        <span>/</span>
        <a href="/series/">Серии</a>
        <span>/</span>
        <span>~~$series.name~</span>
    </div>
</div>

<!-- Series Products Page -->
<main class="catalog-page">
    <div class="container">
        <div class="catalog-header">
            <h1>Товары серии: ~~$series.name~</h1>
            <p class="catalog-description">Найдено товаров: ~~$series.count~</p>
        </div>

        <div class="products-grid">
~~foreach from=$products item=product~
            <article class="product-card">
                <a href="/product/~~$product.id~/" class="product-link">
                    <div class="product-image">
~~if $product.image~
                        <img src="/~~$product.image~" alt="~~$product.name~">
~~else~
                        <img src="/assets/sfera/img/product-placeholder.jpg" alt="~~$product.name~">
~~/if~
                    </div>
                    <div class="product-info">
                        <h3 class="product-title">~~$product.name~</h3>
~~if $product.description~
                        <p class="product-description">~~$product.description|truncate:150~</p>
~~/if~
                    </div>
                </a>
            </article>
~~/foreach~
        </div>
    </div>
</main>

~~include file="sfera/tpl/footer.tpl"~
</body>
</html>

