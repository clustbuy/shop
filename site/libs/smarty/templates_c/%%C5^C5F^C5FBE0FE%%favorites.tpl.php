<?php /* Smarty version 2.6.11, created on 2025-11-30 21:38:54
         compiled from sfera/favorites/favorites.tpl */ ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/favicon.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/favorites.css">
</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/mobile_menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<!-- Main Content -->
<main class="favorites-page">
    <div class="container">
        <div class="page-header">
            <h1>Избранное</h1>
            <div class="header-actions-bar">
                <span class="items-count">12 товаров</span>
                <button class="btn btn-outline" id="clearAllBtn">Очистить все</button>
            </div>
        </div>

        <div class="favorites-grid" id="favoritesGrid">
            <!-- Товар 1 -->
            <div class="favorite-card" data-id="1">
                <button class="remove-btn" data-id="1">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>

                <div class="product-image">
                    <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg" alt="Товар">
                    <span class="badge sale">Распродажа 11.11</span>
                </div>

                <div class="product-info">
                    <h3 class="product-title">Смартфон Apple iPhone 15 Pro Max 256GB Черный титан</h3>

                    <div class="product-rating">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="#ffcc00">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <span>4.8</span>
                        <span class="reviews">(2 345)</span>
                    </div>

                    <div class="product-price">
                        <div class="price-main">
                            <span class="current-price">129 990 ₽</span>
                            <span class="old-price">149 990 ₽</span>
                        </div>
                        <span class="discount">-13%</span>
                    </div>

                    <button class="btn btn-primary add-to-cart" data-id="1">В корзину</button>
                </div>
            </div>

            <!-- Товар 2 -->
            <div class="favorite-card" data-id="2">
                <button class="remove-btn" data-id="2">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>

                <div class="product-image">
                    <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/8013967072.jpg" alt="Товар">
                    <span class="badge sale">Цена что надо</span>
                </div>

                <div class="product-info">
                    <h3 class="product-title">Наушники Apple AirPods Pro 2 с беспроводной зарядкой</h3>

                    <div class="product-rating">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="#ffcc00">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <span>4.9</span>
                        <span class="reviews">(5 678)</span>
                    </div>

                    <div class="product-price">
                        <div class="price-main">
                            <span class="current-price">19 990 ₽</span>
                            <span class="old-price">24 990 ₽</span>
                        </div>
                        <span class="discount">-20%</span>
                    </div>

                    <button class="btn btn-primary add-to-cart" data-id="2">В корзину</button>
                </div>
            </div>

            <!-- Товар 3 -->
            <div class="favorite-card" data-id="3">
                <button class="remove-btn" data-id="3">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>

                <div class="product-image">
                    <img src="https://ir.ozone.ru/s3/multimedia-1-6/wc300/7784859930.jpg" alt="Товар">
                </div>

                <div class="product-info">
                    <h3 class="product-title">Ноутбук ASUS TUF Gaming A15 Ryzen 7 16GB RTX 4060</h3>

                    <div class="product-rating">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="#ffcc00">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <span>4.7</span>
                        <span class="reviews">(892)</span>
                    </div>

                    <div class="product-price">
                        <div class="price-main">
                            <span class="current-price">89 990 ₽</span>
                        </div>
                    </div>

                    <button class="btn btn-primary add-to-cart" data-id="3">В корзину</button>
                </div>
            </div>

            <!-- Товар 4 -->
            <div class="favorite-card" data-id="4">
                <button class="remove-btn" data-id="4">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>

                <div class="product-image">
                    <img src="https://ir.ozone.ru/s3/multimedia-1-2/wc300/7726240838.jpg" alt="Товар">
                    <span class="badge sale">Распродажа 11.11</span>
                </div>

                <div class="product-info">
                    <h3 class="product-title">Умные часы Samsung Galaxy Watch 6 40mm Graphite</h3>

                    <div class="product-rating">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="#ffcc00">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <span>4.6</span>
                        <span class="reviews">(1 234)</span>
                    </div>

                    <div class="product-price">
                        <div class="price-main">
                            <span class="current-price">24 990 ₽</span>
                            <span class="old-price">29 990 ₽</span>
                        </div>
                        <span class="discount">-17%</span>
                    </div>

                    <button class="btn btn-primary add-to-cart" data-id="4">В корзину</button>
                </div>
            </div>

            <!-- Товар 5 -->
            <div class="favorite-card" data-id="5">
                <button class="remove-btn" data-id="5">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>

                <div class="product-image">
                    <img src="https://ir.ozone.ru/s3/multimedia-1-9/wc300/7813067157.jpg" alt="Товар">
                </div>

                <div class="product-info">
                    <h3 class="product-title">Планшет Samsung Galaxy Tab S9 11" 8/128GB Wi-Fi</h3>

                    <div class="product-rating">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="#ffcc00">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <span>4.8</span>
                        <span class="reviews">(567)</span>
                    </div>

                    <div class="product-price">
                        <div class="price-main">
                            <span class="current-price">54 990 ₽</span>
                            <span class="old-price">64 990 ₽</span>
                        </div>
                        <span class="discount">-15%</span>
                    </div>

                    <button class="btn btn-primary add-to-cart" data-id="5">В корзину</button>
                </div>
            </div>

            <!-- Товар 6 -->
            <div class="favorite-card" data-id="6">
                <button class="remove-btn" data-id="6">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="6" x2="6" y2="18"/>
                        <line x1="6" y1="6" x2="18" y2="18"/>
                    </svg>
                </button>

                <div class="product-image">
                    <img src="https://ir.ozone.ru/s3/multimedia-1-b/wc300/8139888227.jpg" alt="Товар">
                    <span class="badge sale">Цена что надо</span>
                </div>

                <div class="product-info">
                    <h3 class="product-title">Беспроводная мышь Logitech MX Master 3S Black</h3>

                    <div class="product-rating">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="#ffcc00">
                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                        </svg>
                        <span>4.9</span>
                        <span class="reviews">(3 456)</span>
                    </div>

                    <div class="product-price">
                        <div class="price-main">
                            <span class="current-price">8 990 ₽</span>
                        </div>
                    </div>

                    <button class="btn btn-primary add-to-cart" data-id="6">В корзину</button>
                </div>
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

    <a href="#" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
        </svg>
        <span>Избранное</span>
    </a>

    <a href="#" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
        </svg>
        <span>Корзина</span>
        <span class="mobile-nav-badge">3</span>
    </a>

    <a href="#" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
        </svg>
        <span>Профиль</span>
    </a>
</nav>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
<script src="/assets/sfera/js/favorites.js"></script>

</body>
</html>