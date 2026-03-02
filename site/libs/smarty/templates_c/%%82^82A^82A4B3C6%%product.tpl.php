<?php /* Smarty version 2.6.11, created on 2025-11-30 15:13:36
         compiled from sfera/product/product.tpl */ ?>
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
    <link rel="stylesheet" href="/assets/sfera/css/product.css">
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

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
<?php $_from = $this->_tpl_vars['breadcrumbs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['breadcrumbLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['breadcrumbLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['crumb']):
        $this->_foreach['breadcrumbLoop']['iteration']++;
?>
<?php if ($this->_tpl_vars['crumb']['url']): ?>
        <a href="<?php echo $this->_tpl_vars['crumb']['url']; ?>
"><?php echo $this->_tpl_vars['crumb']['title']; ?>
</a>
<?php else: ?>
        <span><?php echo $this->_tpl_vars['crumb']['title']; ?>
</span>
<?php endif; ?>
<?php if (! ($this->_foreach['breadcrumbLoop']['iteration'] == $this->_foreach['breadcrumbLoop']['total'])): ?>
        <span>/</span>
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
    </div>
</div>

<!-- Product Page -->
<main class="product-page">
    <div class="container">
        <div class="product-layout">
            <!-- Left Column: Images -->
            <div class="product-gallery">
                <div class="gallery-main">
                    <button class="gallery-favorite" id="favoriteBtn">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path d="M12 21l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="2"/>
                        </svg>
                    </button>
                    <div class="gallery-badge">Распродажа 11.11</div>
<?php if ($this->_tpl_vars['product_image']): ?>
                    <img src="/import_files/<?php echo $this->_tpl_vars['product']['id']; ?>
b.jpg" alt="<?php echo $this->_tpl_vars['product_name']; ?>
" id="mainImage">
<?php else: ?>
                    <img src="/assets/sfera/img/product-placeholder.jpg" alt="<?php echo $this->_tpl_vars['product_name']; ?>
" id="mainImage">
<?php endif; ?>
                </div>
                <div class="gallery-thumbnails">
                    <button class="thumbnail active" data-image="https://ir.ozone.ru/s3/multimedia-1-g/wc1000/7518239728.jpg">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg" alt="Вид 1">
                    </button>
                    <button class="thumbnail" data-image="https://ir.ozone.ru/s3/multimedia-1-g/wc1000/8013967072.jpg">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/8013967072.jpg" alt="Вид 2">
                    </button>
                    <button class="thumbnail" data-image="https://ir.ozone.ru/s3/multimedia-1-6/wc1000/7784859930.jpg">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-6/wc300/7784859930.jpg" alt="Вид 3">
                    </button>
                    <button class="thumbnail" data-image="https://ir.ozone.ru/s3/multimedia-1-2/wc1000/7726240838.jpg">
                        <img src="https://ir.ozone.ru/s3/multimedia-1-2/wc300/7726240838.jpg" alt="Вид 4">
                    </button>
                </div>
            </div>

            <!-- Right Column: Info & Purchase -->
            <div class="product-info-section">
                <h1 class="product-title"><?php echo $this->_tpl_vars['product_name']; ?>
</h1>

                <div class="product-rating-block">
                    <div class="rating-stars">
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="#FFCC00">
                            <path d="M8 1l2 4 4.5.5-3 3 .5 4.5L8 11l-4 2 .5-4.5-3-3L6 5l2-4z"/>
                        </svg>
                        <span class="rating-value">4.8</span>
                    </div>
                    <a href="#reviews" class="rating-reviews">2 345 отзывов</a>
                    <span class="rating-questions">•</span>
                    <a href="#questions" class="rating-questions">128 вопросов</a>
                </div>

                <div class="product-price-block">
                    <div class="price-main">
                        <span class="price-current">54 990 ₽</span>
                        <span class="price-discount-badge">-31%</span>
                    </div>
                    <div class="price-old">79 990 ₽</div>
                    <div class="price-info">Картой — 52 990 ₽</div>
                </div>

                <div class="product-badges">
                        <span class="badge badge-ozon">
                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                                <path d="M8 2l1.5 3 3.5.5-2.5 2.5.5 3.5L8 10l-3 1.5.5-3.5L3 5.5l3.5-.5L8 2z" fill="currentColor"/>
                            </svg>
                            ТЦ Сфера
                        </span>
                    <span class="badge badge-delivery">Доставка завтра</span>
                </div>

                <div class="product-variants">
                    <div class="variant-group">
                        <div class="variant-label">Цвет</div>
                        <div class="variant-options">
                            <button class="variant-option active">Синий</button>
                            <button class="variant-option">Черный</button>
                            <button class="variant-option">Белый</button>
                            <button class="variant-option">Красный</button>
                            <button class="variant-option">Розовый</button>
                        </div>
                    </div>

                    <div class="variant-group">
                        <div class="variant-label">Память</div>
                        <div class="variant-options">
                            <button class="variant-option active">128 ГБ</button>
                            <button class="variant-option">256 ГБ</button>
                            <button class="variant-option">512 ГБ</button>
                        </div>
                    </div>
                </div>

                <div class="product-actions">
                    <button class="btn-add-cart" id="addToCart">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M3 3h2l1 4m0 0l2 8h8l2-8H6z" stroke="currentColor" stroke-width="2"/>
                            <circle cx="8" cy="18" r="1" fill="currentColor"/>
                            <circle cx="15" cy="18" r="1" fill="currentColor"/>
                        </svg>
                        Добавить в корзину
                    </button>
                    <button class="btn-buy-now">Купить в 1 клик</button>
                </div>

                <div class="product-delivery">
                    <h3>Доставка</h3>
                    <div class="delivery-option">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 2c-2.8 0-5 2.2-5 5 0 3.8 5 9 5 9s5-5.2 5-9c0-2.8-2.2-5-5-5z" stroke="currentColor" stroke-width="1.5"/>
                            <circle cx="10" cy="7" r="1.5" fill="currentColor"/>
                        </svg>
                        <div class="delivery-info">
                            <div class="delivery-title">Пункт выдачи • Завтра • Бесплатно</div>
                            <div class="delivery-address">ул. Ленина, 10</div>
                        </div>
                    </div>
                    <div class="delivery-option">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M3 10l7-7 7 7v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-7z" stroke="currentColor" stroke-width="1.5"/>
                            <path d="M8 17v-6h4v6" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                        <div class="delivery-info">
                            <div class="delivery-title">Курьером • 2 дня • 200 ₽</div>
                            <div class="delivery-address">При заказе от 3 000 ₽ — бесплатно</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabs -->
        <div class="product-tabs">
            <div class="tabs-header">
                <button class="tab-btn active" data-tab="description">Описание</button>
                <button class="tab-btn" data-tab="specs">Характеристики</button>
                <button class="tab-btn" data-tab="reviews">Отзывы (2 345)</button>
            </div>

            <div class="tabs-content">
                <!-- Description Tab -->
                <div class="tab-pane active" id="description">
                    <h2>Описание товара</h2>
<?php if ($this->_tpl_vars['product_description']): ?>
                    <p><?php echo $this->_tpl_vars['product_description']; ?>
</p>
<?php endif; ?>
                </div>

                <!-- Specs Tab -->
                <div class="tab-pane" id="specs">
                    <h2>Характеристики</h2>
                    <div class="specs-table">
                        <div class="spec-row">
                            <div class="spec-label">Бренд</div>
                            <div class="spec-value">Apple</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Модель</div>
                            <div class="spec-value">iPhone 13</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Операционная система</div>
                            <div class="spec-value">iOS 15</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Процессор</div>
                            <div class="spec-value">Apple A15 Bionic</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Встроенная память</div>
                            <div class="spec-value">128 ГБ</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Диагональ экрана</div>
                            <div class="spec-value">6.1 дюйма</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Разрешение экрана</div>
                            <div class="spec-value">2532x1170 пикселей</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Основная камера</div>
                            <div class="spec-value">12 Мп + 12 Мп (широкоугольная + сверхширокоугольная)</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Фронтальная камера</div>
                            <div class="spec-value">12 Мп</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Емкость аккумулятора</div>
                            <div class="spec-value">3227 мАч</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Стандарты связи</div>
                            <div class="spec-value">2G, 3G, 4G LTE, 5G</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Вес</div>
                            <div class="spec-value">174 г</div>
                        </div>
                        <div class="spec-row">
                            <div class="spec-label">Гарантия</div>
                            <div class="spec-value">12 месяцев</div>
                        </div>
                    </div>
                </div>

                <!-- Reviews Tab -->
                <div class="tab-pane" id="reviews">
                    <h2>Отзывы покупателей</h2>

                    <div class="reviews-summary">
                        <div class="summary-rating">
                            <div class="summary-number">4.8</div>
                            <div class="summary-stars">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="#FFCC00">
                                    <path d="M10 1l2 4 5 .5-3.5 3.5.5 5L10 12l-4 2 .5-5L3 5.5l5-.5 2-4z"/>
                                </svg>
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="#FFCC00">
                                    <path d="M10 1l2 4 5 .5-3.5 3.5.5 5L10 12l-4 2 .5-5L3 5.5l5-.5 2-4z"/>
                                </svg>
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="#FFCC00">
                                    <path d="M10 1l2 4 5 .5-3.5 3.5.5 5L10 12l-4 2 .5-5L3 5.5l5-.5 2-4z"/>
                                </svg>
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="#FFCC00">
                                    <path d="M10 1l2 4 5 .5-3.5 3.5.5 5L10 12l-4 2 .5-5L3 5.5l5-.5 2-4z"/>
                                </svg>
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="#E5E5E5">
                                    <path d="M10 1l2 4 5 .5-3.5 3.5.5 5L10 12l-4 2 .5-5L3 5.5l5-.5 2-4z"/>
                                </svg>
                            </div>
                            <div class="summary-count">2 345 отзывов</div>
                        </div>
                    </div>

                    <div class="reviews-list">
                        <article class="review-item">
                            <div class="review-header">
                                <div class="review-author">Александр М.</div>
                                <div class="review-rating">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="#FFCC00">
                                        <path d="M8 1l1.5 3 3.5.5-2.5 2.5.5 3.5L8 10l-3 1.5.5-3.5L2 5.5l3.5-.5L8 1z"/>
                                    </svg>
                                    <span>5</span>
                                </div>
                            </div>
                            <div class="review-date">15 октября 2024</div>
                            <p class="review-text">Отличный телефон! Камера супер, батарея держит весь день активного использования. Экран яркий и четкий. Очень доволен покупкой!</p>
                            <div class="review-helpful">
                                <button class="helpful-btn">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                                        <path d="M3 8h2l2-5c0-1 1-2 2-2s2 1 2 2v3h3c1 0 2 1 2 2v5c0 1-1 2-2 2H5c-1 0-2-1-2-2V8z" stroke="currentColor" stroke-width="1.5"/>
                                    </svg>
                                    Полезно (42)
                                </button>
                            </div>
                        </article>

                        <article class="review-item">
                            <div class="review-header">
                                <div class="review-author">Мария К.</div>
                                <div class="review-rating">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="#FFCC00">
                                        <path d="M8 1l1.5 3 3.5.5-2.5 2.5.5 3.5L8 10l-3 1.5.5-3.5L2 5.5l3.5-.5L8 1z"/>
                                    </svg>
                                    <span>4</span>
                                </div>
                            </div>
                            <div class="review-date">10 октября 2024</div>
                            <p class="review-text">Хороший смартфон, но хотелось бы больше памяти. 128 ГБ быстро заполняются. В остальном все отлично - производительность на высоте, дизайн красивый.</p>
                            <div class="review-helpful">
                                <button class="helpful-btn">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                                        <path d="M3 8h2l2-5c0-1 1-2 2-2s2 1 2 2v3h3c1 0 2 1 2 2v5c0 1-1 2-2 2H5c-1 0-2-1-2-2V8z" stroke="currentColor" stroke-width="1.5"/>
                                    </svg>
                                    Полезно (28)
                                </button>
                            </div>
                        </article>

                        <article class="review-item">
                            <div class="review-header">
                                <div class="review-author">Дмитрий С.</div>
                                <div class="review-rating">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="#FFCC00">
                                        <path d="M8 1l1.5 3 3.5.5-2.5 2.5.5 3.5L8 10l-3 1.5.5-3.5L2 5.5l3.5-.5L8 1z"/>
                                    </svg>
                                    <span>5</span>
                                </div>
                            </div>
                            <div class="review-date">5 октября 2024</div>
                            <p class="review-text">Перешел с Android и не жалею. iOS очень удобная, все работает быстро и плавно. Качество сборки на высшем уровне. Рекомендую!</p>
                            <div class="review-helpful">
                                <button class="helpful-btn">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                                        <path d="M3 8h2l2-5c0-1 1-2 2-2s2 1 2 2v3h3c1 0 2 1 2 2v5c0 1-1 2-2 2H5c-1 0-2-1-2-2V8z" stroke="currentColor" stroke-width="1.5"/>
                                    </svg>
                                    Полезно (36)
                                </button>
                            </div>
                        </article>
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
<script src="/assets/sfera/js/product.js"></script>

</body>
</html>