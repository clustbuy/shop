<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
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
~~if $search_query~
        <a href="/search/">Поиск</a>
        <span>/</span>
        <span>~~$search_query~</span>
~~else~
        <a href="/catalog/">Каталог</a>
~~if $category.id~
        <span>/</span>
        <span>~~$category.name~</span>
~~/if~
~~/if~
    </div>
</div>

<!-- Catalog Page -->
<main class="catalog-page">
    <div class="container">
        <div class="catalog-layout">
            <!-- Sidebar Filters -->
~~if $search_query~
~~assign var="action_url" value="/search/"~
~~else~
~~assign var="action_url" value="/catalog/"~
~~if $category.id~
~~assign var="action_url" value="/catalog/`$category.id`/"~
~~/if~
~~/if~
~~mod path="sfera/" mod_name="filter" action_url=$action_url~

            <!-- Main Content -->
            <div class="catalog-content">
                <!-- Toolbar -->
                <div class="catalog-toolbar">
                    <div class="toolbar-left">
~~if $search_query~
                        <h1>Результаты поиска: "~~$search_query~"</h1>
~~else~
                        <h1>~~$category.name~</h1>
~~/if~
                        <span class="results-count" id="resultsCount">Найдено ~~$total~ </span>
                    </div>
                    <div class="toolbar-right">

                    </div>
                </div>

                <!-- Products Grid -->
                <div class="products-grid" id="productsGrid">
~~if $products|@count > 0~
~~foreach from=$products item=product~
                    <article class="product-card">
                        <button class="product-favorite~~if isset($favorites.items[$product.id])~ favorite-filled~~/if~" data-product-id="~~$product.id~" title="~~if isset($favorites.items[$product.id])~Удалить из избранного~~else~Добавить в избранное~~/if~">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" stroke="currentColor" stroke-width="1.5"/>
                            </svg>
                        </button>
                        <a href="/product/~~$product.id~/" class="product-link">
                            <div class="product-image">
                                <img src="~~$product.image~" alt="~~$product.name~" onerror="this.onerror=null; this.src='/assets/img/product_empty.jpg';">
                            </div>
                            <div class="product-info">
                                <h3 class="product-title">~~$product.name~</h3>


                                <div class="vi_24 vi0_24 p6b3_0_4-a p6b3_0_4-a0 p6b3_0_4-a1 tsBodyMBold"
                                     style="text-align: left;height: 22px;">
                                    ~~if $product.rating > 0 || $product.reviews_count > 0~
                                    ~~if $product.rating > 0~
                                    <span class="p6b3_0_4-a4">
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                class="p6b3_0_4-a6 p6b3_0_4-a5" style="color: var(--graphicRating);"><path
                                                    fill="currentColor"
                                                    d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2"></path>
                                        </svg>
                                        <span style="color:var(--textPremium);">~~$product.rating~</span>
                                    </span>
                                    ~~/if~
                                    ~~if $product.reviews_count > 0~
                                    <span class="p6b3_0_4-a4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                     height="16" class="p6b3_0_4-a5"
                                                                     style="color: var(--graphicTertiary);"><path
                                                    fill="currentColor"
                                                    d="M8.545 13C11.93 13 14 11.102 14 8s-2.07-5-5.455-5C5.161 3 3.091 4.897 3.091 8c0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394"></path>
                                        </svg>
                                        <span style="color: var(--textSecondary);">~~$product.reviews_count|number_format:2~&nbsp;отзыв~~$product.reviews_count|fins~</span>
                                    </span>
                                    ~~/if~
                                    ~~/if~
                                </div>



                                ~~if $product.price && $product.price > 0~
                                <div class="product-price">
                                    <span class="price-current">~~$product.price~ ₽</span>
                                </div>
~~/if~
                            </div>
                        </a>
                        <div class="product-actions">
~~if isset($cart.items[$product.id]) && isset($cart.items[$product.id].product_amount)~
                            <button class="btn-add-to-cart" data-product-id="~~$product.id~" type="button" style="display: none;">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M3 3h2l1 4m0 0l3 11h10l3-11H6z"/>
                                    <circle cx="9" cy="20" r="1" fill="currentColor"/>
                                    <circle cx="17" cy="20" r="1" fill="currentColor"/>
                                </svg>
                                <span>В корзину</span>
                            </button>
                            <a href="#" class="btn-buy-all" data-product-id="~~$product.id~" data-max-quantity="~~$product.quantity~">Купить всё</a>
                            <div class="product-quantity-control" data-product-id="~~$product.id~">
                                <button class="qty-btn qty-minus" data-product-id="~~$product.id~" type="button">−</button>
                                <input type="number" class="qty-input" value="~~$cart.items[$product.id].product_amount~" min="1" max="~~$product.quantity~" data-product-id="~~$product.id~">
                                <button class="qty-btn qty-plus" data-product-id="~~$product.id~" type="button">+</button>
                            </div>
~~else~
                            <button class="btn-add-to-cart" data-product-id="~~$product.id~" type="button">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M3 3h2l1 4m0 0l3 11h10l3-11H6z"/>
                                    <circle cx="9" cy="20" r="1" fill="currentColor"/>
                                    <circle cx="17" cy="20" r="1" fill="currentColor"/>
                                </svg>
                                <span>В корзину</span>
                            </button>
                            <a href="#" class="btn-buy-all" data-product-id="~~$product.id~" data-max-quantity="~~$product.quantity~">Купить всё</a>
                            <div class="product-quantity-control hidden" data-product-id="~~$product.id~">
                                <button class="qty-btn qty-minus" data-product-id="~~$product.id~" type="button">−</button>
                                <input type="number" class="qty-input" value="1" min="1" max="~~$product.quantity~" data-product-id="~~$product.id~">
                                <button class="qty-btn qty-plus" data-product-id="~~$product.id~" type="button">+</button>
                            </div>
~~/if~
                        </div>
                    </article>
~~/foreach~
~~else~
                    <div class="no-products">
                        <p>Товары не найдены</p>
                    </div>
~~/if~
                </div>

                <!-- Pagination -->
~~if $pages > 1~
                <div class="pagination">
~~if $hasPrevGroup~
~~if $search_query~
                    <a href="/search/?query=~~$search_query~&page=~~$prevGroupEnd~" class="pagination-btn">
~~else~
                    <a href="/catalog/~~if $category.id~~~$category.id~/~~/if~?page=~~$prevGroupEnd~" class="pagination-btn">
~~/if~
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M10 4l-4 4 4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </a>
~~else~
                    <button class="pagination-btn" disabled>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M10 4l-4 4 4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </button>
~~/if~
~~assign var="pagesInGroup" value=$endPage-$startPage+1~
~~section name=pageLoop loop=$pagesInGroup~
~~assign var="pageNum" value=$startPage+$smarty.section.pageLoop.index~
~~if $pageNum == $page~
                    <button class="pagination-btn active">~~$pageNum~</button>
~~else~
~~if $search_query~
                    <a href="/search/?query=~~$search_query~&page=~~$pageNum~" class="pagination-btn">~~$pageNum~</a>
~~else~
                    <a href="/catalog/~~if $category.id~~~$category.id~/~~/if~?page=~~$pageNum~" class="pagination-btn">~~$pageNum~</a>
~~/if~
~~/if~
~~/section~
~~if $hasNextGroup~
~~if $search_query~
                    <a href="/search/?query=~~$search_query~&page=~~$nextGroupStart~" class="pagination-btn">
~~else~
                    <a href="/catalog/~~if $category.id~~~$category.id~/~~/if~?page=~~$nextGroupStart~" class="pagination-btn">
~~/if~
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </a>
~~else~
                    <button class="pagination-btn" disabled>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </button>
~~/if~
                </div>
~~/if~
            </div>
        </div>
    </div>
</main>


<!-- Mobile Bottom Navigation -->
<nav class="mobile-bottom-nav">
    <a href="/" class="mobile-bottom-nav-item active">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
            <polyline points="9 22 9 12 15 12 15 22"></polyline>
        </svg>
        <span>Главная</span>
    </a>

    <a href="/favorites/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
        </svg>
        <span>Избранное</span>
    </a>

    <a href="/cart/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
        </svg>
        <span>Корзина</span>
        <span class="mobile-nav-badge mobile-cart-counter" data-bind="text: formattedCount, visible: isVisible"></span>
    </a>

    <a href="/profile/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
        </svg>
        <span>Профиль</span>
    </a>
</nav>

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
<script src="/assets/sfera/js/catalog.js"></script>

</body>
</html>