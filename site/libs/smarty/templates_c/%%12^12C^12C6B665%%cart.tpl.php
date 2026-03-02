<?php /* Smarty version 2.6.11, created on 2025-11-30 14:13:11
         compiled from sfera/cart/cart.tpl */ ?>
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
    <link rel="stylesheet" href="/assets/sfera/css/cart.css">
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
<main class="cart-page">
    <div class="container">
        <div class="page-header">
            <h1>Корзина</h1>
            <button class="btn btn-outline" id="clearCartBtn">Очистить корзину</button>
        </div>

        <div class="cart-container">
            <!-- Товары в корзине -->
            <div class="cart-items" id="cartItems">
                <!-- Товар 1 -->
                <div class="cart-item" data-id="1" data-price="129990">
                    <label class="checkbox-wrapper">
                        <input type="checkbox" class="item-checkbox" checked>
                        <span class="checkmark"></span>
                    </label>

                    <div class="item-image">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg" alt="Товар">
                    </div>

                    <div class="item-details">
                        <h3 class="item-title">Смартфон Apple iPhone 15 Pro Max 256GB Черный титан</h3>
                        <p class="item-meta">Продавец: Ozon</p>
                        <p class="item-delivery">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#00a859" stroke-width="2">
                                <rect x="1" y="3" width="15" height="13"/>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
                                <circle cx="5.5" cy="18.5" r="2.5"/>
                                <circle cx="18.5" cy="18.5" r="2.5"/>
                            </svg>
                            Доставка завтра, бесплатно
                        </p>

                        <div class="item-actions">
                            <button class="action-btn favorite-btn" data-id="1">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                </svg>
                                В избранное
                            </button>
                            <button class="action-btn remove-btn" data-id="1">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="3 6 5 6 21 6"/>
                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/>
                                </svg>
                                Удалить
                            </button>
                        </div>
                    </div>

                    <div class="item-controls">
                        <div class="quantity-control">
                            <button class="qty-btn minus" data-id="1">−</button>
                            <input type="number" class="qty-input" value="1" min="1" max="99" data-id="1">
                            <button class="qty-btn plus" data-id="1">+</button>
                        </div>

                        <div class="item-price-section">
                            <div class="item-price">129 990 ₽</div>
                            <div class="item-old-price">149 990 ₽</div>
                        </div>
                    </div>
                </div>

                <!-- Товар 2 -->
                <div class="cart-item" data-id="2" data-price="19990">
                    <label class="checkbox-wrapper">
                        <input type="checkbox" class="item-checkbox" checked>
                        <span class="checkmark"></span>
                    </label>

                    <div class="item-image">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/8013967072.jpg" alt="Товар">
                    </div>

                    <div class="item-details">
                        <h3 class="item-title">Наушники Apple AirPods Pro 2 с беспроводной зарядкой</h3>
                        <p class="item-meta">Продавец: Apple Store</p>
                        <p class="item-delivery">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#00a859" stroke-width="2">
                                <rect x="1" y="3" width="15" height="13"/>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
                                <circle cx="5.5" cy="18.5" r="2.5"/>
                                <circle cx="18.5" cy="18.5" r="2.5"/>
                            </svg>
                            Доставка завтра, бесплатно
                        </p>

                        <div class="item-actions">
                            <button class="action-btn favorite-btn" data-id="2">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                </svg>
                                В избранное
                            </button>
                            <button class="action-btn remove-btn" data-id="2">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="3 6 5 6 21 6"/>
                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/>
                                </svg>
                                Удалить
                            </button>
                        </div>
                    </div>

                    <div class="item-controls">
                        <div class="quantity-control">
                            <button class="qty-btn minus" data-id="2">−</button>
                            <input type="number" class="qty-input" value="1" min="1" max="99" data-id="2">
                            <button class="qty-btn plus" data-id="2">+</button>
                        </div>

                        <div class="item-price-section">
                            <div class="item-price">19 990 ₽</div>
                            <div class="item-old-price">24 990 ₽</div>
                        </div>
                    </div>
                </div>

                <!-- Товар 3 -->
                <div class="cart-item" data-id="3" data-price="89990">
                    <label class="checkbox-wrapper">
                        <input type="checkbox" class="item-checkbox" checked>
                        <span class="checkmark"></span>
                    </label>

                    <div class="item-image">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-6/wc300/7784859930.jpg" alt="Товар">
                    </div>

                    <div class="item-details">
                        <h3 class="item-title">Ноутбук ASUS TUF Gaming A15 Ryzen 7 16GB RTX 4060</h3>
                        <p class="item-meta">Продавец: ASUS Official Store</p>
                        <p class="item-delivery">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#ff8c00" stroke-width="2">
                                <rect x="1" y="3" width="15" height="13"/>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
                                <circle cx="5.5" cy="18.5" r="2.5"/>
                                <circle cx="18.5" cy="18.5" r="2.5"/>
                            </svg>
                            Доставка 12-14 ноября, 350 ₽
                        </p>

                        <div class="item-actions">
                            <button class="action-btn favorite-btn" data-id="3">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                </svg>
                                В избранное
                            </button>
                            <button class="action-btn remove-btn" data-id="3">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="3 6 5 6 21 6"/>
                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/>
                                </svg>
                                Удалить
                            </button>
                        </div>
                    </div>

                    <div class="item-controls">
                        <div class="quantity-control">
                            <button class="qty-btn minus" data-id="3">−</button>
                            <input type="number" class="qty-input" value="1" min="1" max="99" data-id="3">
                            <button class="qty-btn plus" data-id="3">+</button>
                        </div>

                        <div class="item-price-section">
                            <div class="item-price">89 990 ₽</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Итого -->
            <aside class="cart-summary">
                <div class="summary-card">
                    <h3>Ваш заказ</h3>

                    <div class="summary-row">
                        <span>Товары (<span id="selectedCount">3</span>)</span>
                        <span id="itemsTotal">239 970 ₽</span>
                    </div>

                    <div class="summary-row">
                        <span>Скидка</span>
                        <span class="discount" id="discountTotal">−25 000 ₽</span>
                    </div>

                    <div class="summary-divider"></div>

                    <div class="summary-row total">
                        <span>Итого</span>
                        <strong id="grandTotal">239 970 ₽</strong>
                    </div>

                    <button class="btn btn-primary btn-checkout" id="checkoutBtn">
                        Перейти к оформлению
                    </button>

                    <p class="summary-note">
                        Доступные способы и время доставки можно выбрать при оформлении заказа
                    </p>
                </div>

                <div class="promo-card">
                    <h4>Промокод или сертификат</h4>
                    <div class="promo-input-group">
                        <input type="text" class="promo-input" placeholder="Введите код" id="promoInput">
                        <button class="btn btn-secondary" id="applyPromoBtn">Применить</button>
                    </div>
                </div>
            </aside>
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
<script src="/assets/sfera/js/cart.js"></script>
</body>
</html>