<?php /* Smarty version 2.6.11, created on 2025-11-30 21:38:05
         compiled from sfera/orders/orders.tpl */ ?>
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
    <link rel="stylesheet" href="/assets/sfera/css/orders.css">
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
<main class="orders-page">
    <div class="container">
        <div class="page-header">
            <h1>Мои заказы</h1>
        </div>

        <div class="orders-container">
            <!-- Фильтры -->
            <aside class="orders-sidebar">
                <div class="filter-section">
                    <h3>Статус заказа</h3>
                    <div class="filter-group">
                        <label class="filter-item">
                            <input type="radio" name="status" value="all" checked>
                            <span>Все заказы</span>
                        </label>
                        <label class="filter-item">
                            <input type="radio" name="status" value="active">
                            <span>Активные</span>
                        </label>
                        <label class="filter-item">
                            <input type="radio" name="status" value="delivered">
                            <span>Доставленные</span>
                        </label>
                        <label class="filter-item">
                            <input type="radio" name="status" value="cancelled">
                            <span>Отмененные</span>
                        </label>
                    </div>
                </div>

                <div class="filter-section">
                    <h3>Период</h3>
                    <div class="filter-group">
                        <label class="filter-item">
                            <input type="radio" name="period" value="all" checked>
                            <span>За все время</span>
                        </label>
                        <label class="filter-item">
                            <input type="radio" name="period" value="month">
                            <span>За месяц</span>
                        </label>
                        <label class="filter-item">
                            <input type="radio" name="period" value="year">
                            <span>За год</span>
                        </label>
                    </div>
                </div>
            </aside>

            <!-- Список заказов -->
            <div class="orders-list">
                <!-- Заказ 1 - Активный -->
                <div class="order-card">
                    <div class="order-header">
                        <div class="order-info">
                            <span class="order-number">Заказ № 12345678</span>
                            <span class="order-date">10 ноября 2024</span>
                        </div>
                        <span class="order-status status-active">В пути</span>
                    </div>

                    <div class="order-delivery">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#00a859" stroke-width="2">
                            <rect x="1" y="3" width="15" height="13"/>
                            <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
                            <circle cx="5.5" cy="18.5" r="2.5"/>
                            <circle cx="18.5" cy="18.5" r="2.5"/>
                        </svg>
                        <div>
                            <strong>Ожидается 12 ноября</strong>
                            <p>Доставка в пункт выдачи</p>
                        </div>
                    </div>

                    <div class="order-items">
                        <div class="order-item">
                            <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg" alt="Товар">
                            <div class="item-info">
                                <h4>Смартфон Apple iPhone 15 Pro Max 256GB</h4>
                                <p class="item-meta">Цвет: Черный титан</p>
                            </div>
                            <div class="item-price">
                                <span class="price">129 990 ₽</span>
                                <span class="quantity">× 1</span>
                            </div>
                        </div>

                        <div class="order-item">
                            <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/8013967072.jpg" alt="Товар">
                            <div class="item-info">
                                <h4>Наушники Apple AirPods Pro 2</h4>
                                <p class="item-meta">С беспроводной зарядкой</p>
                            </div>
                            <div class="item-price">
                                <span class="price">19 990 ₽</span>
                                <span class="quantity">× 1</span>
                            </div>
                        </div>
                    </div>

                    <div class="order-footer">
                        <div class="order-total">
                            <span>Итого:</span>
                            <strong>149 980 ₽</strong>
                        </div>
                        <div class="order-actions">
                            <button class="btn btn-outline">Отследить</button>
                            <button class="btn btn-secondary">Детали заказа</button>
                        </div>
                    </div>
                </div>

                <!-- Заказ 2 - Доставлен -->
                <div class="order-card">
                    <div class="order-header">
                        <div class="order-info">
                            <span class="order-number">Заказ № 12345677</span>
                            <span class="order-date">5 ноября 2024</span>
                        </div>
                        <span class="order-status status-delivered">Доставлен</span>
                    </div>

                    <div class="order-delivery">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#00a859" stroke-width="2">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                            <polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                        <div>
                            <strong>Получен 8 ноября</strong>
                            <p>Пункт выдачи на ул. Ленина, 10</p>
                        </div>
                    </div>

                    <div class="order-items">
                        <div class="order-item">
                            <img src="https://ir.ozone.ru/s3/multimedia-1-6/wc300/7784859930.jpg" alt="Товар">
                            <div class="item-info">
                                <h4>Ноутбук ASUS TUF Gaming A15</h4>
                                <p class="item-meta">Ryzen 7, 16GB, RTX 4060</p>
                            </div>
                            <div class="item-price">
                                <span class="price">89 990 ₽</span>
                                <span class="quantity">× 1</span>
                            </div>
                        </div>
                    </div>

                    <div class="order-footer">
                        <div class="order-total">
                            <span>Итого:</span>
                            <strong>89 990 ₽</strong>
                        </div>
                        <div class="order-actions">
                            <button class="btn btn-outline">Повторить заказ</button>
                            <button class="btn btn-secondary">Оставить отзыв</button>
                        </div>
                    </div>
                </div>

                <!-- Заказ 3 - Отменен -->
                <div class="order-card">
                    <div class="order-header">
                        <div class="order-info">
                            <span class="order-number">Заказ № 12345676</span>
                            <span class="order-date">28 октября 2024</span>
                        </div>
                        <span class="order-status status-cancelled">Отменен</span>
                    </div>

                    <div class="order-delivery cancelled">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#999" stroke-width="2">
                            <circle cx="12" cy="12" r="10"/>
                            <line x1="15" y1="9" x2="9" y2="15"/>
                            <line x1="9" y1="9" x2="15" y2="15"/>
                        </svg>
                        <div>
                            <strong>Отменен по запросу покупателя</strong>
                            <p>Средства возвращены 30 октября</p>
                        </div>
                    </div>

                    <div class="order-items">
                        <div class="order-item">
                            <img src="https://ir.ozone.ru/s3/multimedia-1-2/wc300/7726240838.jpg" alt="Товар">
                            <div class="item-info">
                                <h4>Умные часы Samsung Galaxy Watch 6</h4>
                                <p class="item-meta">40mm, Graphite</p>
                            </div>
                            <div class="item-price">
                                <span class="price">24 990 ₽</span>
                                <span class="quantity">× 1</span>
                            </div>
                        </div>
                    </div>

                    <div class="order-footer">
                        <div class="order-total">
                            <span>Сумма возврата:</span>
                            <strong>24 990 ₽</strong>
                        </div>
                        <div class="order-actions">
                            <button class="btn btn-outline">Повторить заказ</button>
                        </div>
                    </div>
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
<script src="/assets/sfera/js/orders.js"></script>

</body>
</html>