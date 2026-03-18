

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/login.css">
</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Main Content -->
<main class="login-page">
    <div class="container">
        <div class="login-container">
            <div class="login-card">
                <div class="login-header">
                    <h1>Вход для покупателей</h1>
                    <p>Авторизуйтесь, чтобы отслеживать заказы и пользоваться бонусами</p>
                </div>

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
                        <p class="terms">
                            Продолжая, вы соглашаетесь с <a href="#">условиями программы лояльности</a>
                            и <a href="#">политикой обработки персональных данных</a>
                        </p>
                    </div>
                </form>
            </div>

            <div class="login-benefits">
                <h3>Преимущества покупок в издательстве</h3>
                <ul class="benefits-list">
                    <li>
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="#005bff">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                            <polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                        <div>
                            <strong>Быстрая доставка</strong>
                            <p>Доставим за 1-3 дня в любой город России</p>
                        </div>
                    </li>
                    <li>
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="#005bff">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                            <polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                        <div>
                            <strong>Тысячи товаров</strong>
                            <p>Широкий ассортимент</p>
                        </div>
                    </li>
                    <li>
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="#005bff">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                            <polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                        <div>
                            <strong>Бонусная программа</strong>
                            <p>Копите баллы и оплачивайте ими покупки</p>
                        </div>
                    </li>
                    <li>
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="#005bff">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                            <polyline points="22 4 12 14.01 9 11.01"/>
                        </svg>
                        <div>
                            <strong>Надежная защита</strong>
                            <p>Гарантия качества и защита покупателя</p>
                        </div>
                    </li>
                </ul>
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

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
</body>
</html>