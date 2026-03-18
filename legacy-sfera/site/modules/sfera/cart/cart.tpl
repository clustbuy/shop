<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/cart.css">
    ~~include file="sfera/tpl/scripts.tpl"~
</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Main Content -->
<main class="cart-page">
    <div class="container">
        <div class="page-header">
            <h1>Корзина</h1>
            <button class="btn btn-outline" data-bind="click: clearCart">Очистить корзину</button>
        </div>

        <div class="cart-container">
            <!-- Товары в корзине -->
            <!-- ko if: items().length > 0 -->
            <div class="cart-items" id="cartItems" data-bind="foreach: items">
                <!-- Товар (knockout template) -->
                <div class="cart-item" data-bind="attr: {'data-id': id}">


                    <label class="checkbox-wrapper">
                        <input type="checkbox" class="item-checkbox" data-bind="checked: selected">
                        <span class="checkmark"></span>
                    </label>


                    <div class="item-image">
                        <a target="_blank" data-bind="attr: {href: productUrl()}">
                            <img data-bind="attr: {src: image, alt: name}" onerror="this.src='/assets/img/product_empty.jpg'">
                        </a>
                    </div>

                    <div class="item-details">
                        <h3 class="item-title">
                            <a target="_blank" data-bind="text: name(), attr: {href: productUrl()}" class="item-title-link"></a>
                        </h3>
                        ~~*<p class="item-meta" data-bind="text: 'Продавец: ' + seller()"></p>
                        <p class="item-delivery">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#00a859" stroke-width="2">
                                <rect x="1" y="3" width="15" height="13"/>
                                <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
                                <circle cx="5.5" cy="18.5" r="2.5"/>
                                <circle cx="18.5" cy="18.5" r="2.5"/>
                            </svg>
                            <span data-bind="text: delivery"></span>
                        </p>*~

                        <div class="item-actions">
                            <button class="action-btn remove-btn" data-bind="click: $root.removeItem">
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
                            <button class="qty-btn minus" data-bind="click: $root.decreaseAmount">−</button>
                            <input type="number" class="qty-input" data-bind="value: product_amount, attr: {min: 1, max: max_quantity() || 99}, event: {change: $root.updateAmount}">
                            <button class="qty-btn plus" data-bind="click: $root.increaseAmount">+</button>
                        </div>

                        <div class="item-price-section">
                            <div class="item-price" data-bind="text: formattedPrice"></div>
                            <!-- ko if: hasDiscount -->
                            <div class="item-old-price" data-bind="text: formattedOldPrice"></div>
                            <!-- /ko -->
                            <div class="item-total-price" data-bind="text: formattedTotal"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /ko -->
            
            <!-- ko if: items().length === 0 -->
            <div class="cart-empty">
                <p>Корзина пуста</p>
            </div>
            <!-- /ko -->

            <!-- Итого -->
            <aside class="cart-summary">
                <div class="summary-card">
                    <h3>Ваш заказ</h3>

                    <div class="summary-row">
                        <span>Товары (<span data-bind="text: selectedCount"></span>)</span>
                        <span data-bind="text: formattedItemsTotal"></span>
                    </div>

                    <!-- ko if: discountTotal() > 0 -->
                    <div class="summary-row">
                        <span>Скидка</span>
                        <span class="discount" data-bind="text: formattedDiscountTotal"></span>
                    </div>
                    <!-- /ko -->

                    <div class="summary-divider"></div>

                    <div class="summary-row total">
                        <span>Итого</span>
                        <strong data-bind="text: formattedGrandTotal"></strong>
                    </div>

                    <button class="btn btn-primary btn-checkout " 
                    style="
                        width: 100%;
                        padding: 16px;
                        background: #005bff;
                        border: none;
                        border-radius: 12px;
                        color: #ffffff;
                        font-size: 16px;
                        font-weight: 500;
                        cursor: pointer;
                        transition: all 0.2s;
                        margin-bottom: 16px;
                    "
                     data-bind="click: checkout, enable: total_cart_sum() > 0">
                        Перейти к оформлению
                    </button>

                    <p class="summary-note">
                        Доступные способы и время доставки можно выбрать при оформлении заказа
                    </p>
                </div>

                <div class="promo-card">
                    <h4>Промокод или сертификат</h4>
                    <div class="promo-input-group">
                        <input type="text" class="promo-input" placeholder="Введите код" data-bind="value: promoCode, valueUpdate: 'afterkeydown'">
                        <button class="btn btn-secondary" data-bind="click: applyPromoCode, enable: promoCode().length > 0">Применить</button>
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
        <span class="mobile-nav-badge mobile-cart-counter" data-bind="text: formattedCount, visible: isVisible"></span>
    </a>

    <a href="#" class="mobile-bottom-nav-item">
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

<!-- Инициализация данных корзины с сервера -->
<script>
// console.log('=== Initializing server_cart data ===');
var server_cart = {};
~~if $cart.items|@count > 0~
server_cart.data = ~~json_encode str=$cart~;
~~else~
server_cart.data = {total_cart_sum:0, total_cart_amount:0, cart_sum:0, items:{}};
~~/if~
// console.log('server_cart.data initialized:', server_cart.data);
// console.log('Items count:', Object.keys(server_cart.data.items || {}).length);

// Обновляем корзину после инициализации данных
// Используем setTimeout, чтобы убедиться, что модель уже создана
setTimeout(function() {
    if (typeof model_cart !== 'undefined' && server_cart.data && server_cart.data.items) {
        // console.log('Updating cart from server_cart.data');
        // console.log('server_cart.data:', server_cart.data);
        var currentCart = model_cart.cart();
        var updatedCart = ko.mapping.fromJS(server_cart.data, {}, currentCart);
        model_cart.cart(updatedCart);
        // console.log('Cart updated. Items count:', model_cart.items().length);
        // console.log('Cart sum:', model_cart.cart_sum());
    }
}, 100);
</script>

<!-- cart-viewmodel.js уже подключен глобально в scripts.tpl -->
<script src="/assets/sfera/js/cart.js"></script>
</body>
</html>