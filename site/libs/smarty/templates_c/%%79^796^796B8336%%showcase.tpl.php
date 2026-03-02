<?php /* Smarty version 2.6.11, created on 2025-12-24 22:04:20
         compiled from sfera/showcase/showcase.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'mod', 'sfera/showcase/showcase.tpl', 123, false),)), $this); ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    <meta name="theme-color" content="#fde678">
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/favicon.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

    <link rel="stylesheet" href="/assets/sfera/css/sms.css">
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/carousel.css">
    <link rel="stylesheet" href="/assets/sfera/css/categories.css">
    <link rel="stylesheet" href="/assets/sfera/css/top10-slider.css">
    <link rel="stylesheet" href="/assets/sfera/css/product-reviews.css">

</head>
<body>
<?php if ($_SESSION['auth_user']): ?>
  <div style="display:none;" data-auth-phone="<?php echo $_SESSION['auth_user']['phone']; ?>
"></div>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
  $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/mobile_menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div id="login-modal" class="modal-overlay" style="display:none;">
  <div class="modal-backdrop"></div>
  
  <div class="modal-dialog">
    <button type="button" class="modal-close" id="login-modal-close">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <line x1="18" y1="6" x2="6" y2="18"></line>
        <line x1="6" y1="6" x2="18" y2="18"></line>
      </svg>
    </button>

<!-- ===== ФОРМА НОМЕРА ===== -->
<div id="phone-step" style="display: block;">
  <div class="modal-header">
    <h2>Вход в аккаунт</h2>
    <p class="modal-subtitle">Введите номер телефона</p>
  </div>
  
  <form id="sms-phone-form" class="modal-form">
    <div class="form-group">
      <label for="sms-phone-input">Номер телефона</label>
      <input 
        type="tel" 
        id="sms-phone-input" 
        name="phone" 
        placeholder="+7 (999) 999-99-99"
        autocomplete="off"
        required
      >
    </div>

    <button type="submit" class="btn btn-primary btn-full">
      Отправить код
    </button>

    <div class="sms-message" id="phone-message"></div>

    <p class="modal-help-text">
      Мы отправим код подтверждения по СМС на ваш номер
    </p>
  </form>
</div>


    <!-- ===== ФОРМА КОДА ===== -->
    <div id="code-step" style="display: none;">
      <div class="modal-header">
        <h2>Подтвердите номер</h2>
        <p class="modal-subtitle">
          Код отправлен на номер: <strong id="phone-display"></strong>
        </p>
      </div>

      <form id="sms-verify-form" class="modal-form">
        <div class="form-group">
          <label for="sms-code-input">Код из СМС</label>
          <input 
            type="text" 
            id="sms-code-input" 
            name="code" 
            placeholder="0000" 
            maxlength="4" 
            pattern="\d{4}"
            autocomplete="off"
            required
          >
        </div>

        <button type="submit" class="btn btn-primary btn-full">
          Подтвердить
        </button>

        <div class="sms-message" id="code-message"></div>

        <div class="modal-footer">
          <p class="code-timer">
            Код действует <span id="timer">15:00</span>
          </p>
          <a href="#" id="resend-btn" onclick="resendCode(event)" class="resend-link">
            Отправить заново
          </a>
        </div>
      </form>
    </div>
  </div>
</div>


<!-- Main Content -->
<main class="main-content">


    <!-- Triple Carousel Block -->
    <section class="triple-carousel-section">
        <div class="container">
            <div class="triple-carousel-wrapper">
                <?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'main_carousel'), $this);?>

                
                <!-- Side Carousels (1/4 width) -->
                <div class="side-carousels-container">
                    <?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'product_carousel'), $this);?>

                    <?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'promo_carousel'), $this);?>

                </div>
            </div>
        </div>
    </section>
   


    <!-- Popular Categories Block -->
    <?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'popular_categories'), $this);?>


    <!-- TOP-10 Slider Block -->
    <?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'top10_products'), $this);?>


    <!-- Product Reviews Section -->
    <?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'product_reviews'), $this);?>


    <!-- Product Grid -->
    <section class="product-grid-section">
        <div class="container">
            <div class="product-grid">
                <!-- Product Card 1 -->
                <article class="product-card">
                    <button class="product-favorite">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                    <div class="product-image">
                            <span class="product-badge badge-sale">
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                                    <path d="M6 2l1.5 3 3.5.5-2.5 2.5.5 3.5L6 10l-3 1.5.5-3.5L1 5.5l3.5-.5L6 2z" fill="currentColor"/>
                                </svg>
                                Распродажа 11.11
                            </span>
                        <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg" alt="Товар">
                    </div>
                    <div class="product-info">
                        <div class="product-price">
                            <span class="price-current">1 990 ₽</span>
                            <span class="price-original">3 990 ₽</span>
                            <span class="price-discount">-50%</span>
                        </div>
                        <h3 class="product-title">Смартфон Apple iPhone 13 128GB</h3>
                        <div class="product-rating">
                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                            </svg>
                            <span class="rating-value">4.8</span>
                            <span class="rating-reviews">(2 345)</span>
                        </div>
                        <div class="product-seller">
                            <span class="seller-badge">Творческий Центр СФЕРА</span>
                        </div>
                    </div>
                </article>

                <!-- Product Card 2 -->
                <article class="product-card">
                    <button class="product-favorite">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                    <div class="product-image">
                        <span class="product-badge badge-price">Цена что надо</span>
                        <img src="https://ir.ozone.ru/s3/multimedia-1-g/wc300/8013967072.jpg" alt="Товар">
                    </div>
                    <div class="product-info">
                        <div class="product-price">
                            <span class="price-current">599 ₽</span>
                            <span class="price-original">1 299 ₽</span>
                            <span class="price-discount">-54%</span>
                        </div>
                        <h3 class="product-title">Беспроводные наушники TWS Bluetooth 5.0</h3>
                        <div class="product-rating">
                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                            </svg>
                            <span class="rating-value">4.6</span>
                            <span class="rating-reviews">(1 892)</span>
                        </div>
                        <div class="product-seller">
                            <span class="seller-badge">Творческий Центр СФЕРА</span>
                        </div>
                    </div>
                </article>

                <!-- Product Card 3 -->
                <article class="product-card">
                    <button class="product-favorite">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                    <div class="product-image">
                            <span class="product-badge badge-sale">
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                                    <path d="M6 2l1.5 3 3.5.5-2.5 2.5.5 3.5L6 10l-3 1.5.5-3.5L1 5.5l3.5-.5L6 2z" fill="currentColor"/>
                                </svg>
                                Распродажа 11.11
                            </span>
                        <img src="https://ir.ozone.ru/s3/multimedia-1-6/wc300/7784859930.jpg" alt="Товар">
                    </div>
                    <div class="product-info">
                        <div class="product-price">
                            <span class="price-current">2 490 ₽</span>
                            <span class="price-original">4 990 ₽</span>
                            <span class="price-discount">-50%</span>
                        </div>
                        <h3 class="product-title">Умные часы Smart Watch фитнес-браслет</h3>
                        <div class="product-rating">
                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                            </svg>
                            <span class="rating-value">4.7</span>
                            <span class="rating-reviews">(3 124)</span>
                        </div>
                        <div class="product-seller">
                            <span class="seller-badge">Творческий Центр СФЕРА</span>
                        </div>
                    </div>
                </article>

                <!-- Product Card 4 -->
                <article class="product-card">
                    <button class="product-favorite">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                    <div class="product-image">
                        <span class="product-badge badge-price">Цена что надо</span>
                        <img src="https://ir.ozone.ru/s3/multimedia-1-2/wc300/7726240838.jpg" alt="Товар">
                    </div>
                    <div class="product-info">
                        <div class="product-price">
                            <span class="price-current">1 299 ₽</span>
                            <span class="price-original">2 990 ₽</span>
                            <span class="price-discount">-57%</span>
                        </div>
                        <h3 class="product-title">Портативная колонка Bluetooth JBL стиль</h3>
                        <div class="product-rating">
                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                            </svg>
                            <span class="rating-value">4.5</span>
                            <span class="rating-reviews">(876)</span>
                        </div>
                        <div class="product-seller">
                            <span class="seller-badge">Творческий Центр СФЕРА</span>
                        </div>
                    </div>
                </article>

                <!-- Product Card 5 -->
                <article class="product-card">
                    <button class="product-favorite">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                    <div class="product-image">
                            <span class="product-badge badge-sale">
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                                    <path d="M6 2l1.5 3 3.5.5-2.5 2.5.5 3.5L6 10l-3 1.5.5-3.5L1 5.5l3.5-.5L6 2z" fill="currentColor"/>
                                </svg>
                                Распродажа 11.11
                            </span>
                        <img src="https://ir.ozone.ru/s3/multimedia-1-9/wc300/7813067157.jpg" alt="Товар">
                    </div>
                    <div class="product-info">
                        <div class="product-price">
                            <span class="price-current">3 990 ₽</span>
                            <span class="price-original">7 990 ₽</span>
                            <span class="price-discount">-50%</span>
                        </div>
                        <h3 class="product-title">Клавиатура игровая механическая RGB</h3>
                        <div class="product-rating">
                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                            </svg>
                            <span class="rating-value">4.9</span>
                            <span class="rating-reviews">(1 567)</span>
                        </div>
                        <div class="product-seller">
                            <span class="seller-badge">Творческий Центр СФЕРА</span>
                        </div>
                    </div>
                </article>

                <!-- Product Card 6 -->
                <article class="product-card">
                    <button class="product-favorite">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                    </button>
                    <div class="product-image">
                        <span class="product-badge badge-price">Цена что надо</span>
                        <img src="https://ir.ozone.ru/s3/multimedia-1-b/wc300/8139888227.jpg" alt="Товар">
                    </div>
                    <div class="product-info">
                        <div class="product-price">
                            <span class="price-current">799 ₽</span>
                            <span class="price-original">1 890 ₽</span>
                            <span class="price-discount">-58%</span>
                        </div>
                        <h3 class="product-title">Мышь беспроводная компьютерная USB</h3>
                        <div class="product-rating">
                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                            </svg>
                            <span class="rating-value">4.4</span>
                            <span class="rating-reviews">(654)</span>
                        </div>
                        <div class="product-seller">
                            <span class="seller-badge">Творческий Центр СФЕРА</span>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>
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
<script src="/assets/sfera/js/sms.js"></script>
<script src="/assets/sfera/js/header.js"></script>
<script src="/assets/sfera/js/carousel.js"></script>
<script src="/assets/sfera/js/top10-slider.js"></script> 
</body>
</html>