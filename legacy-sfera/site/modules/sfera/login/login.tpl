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

<main class="login-page">
  <div class="container">
    <div class="login-container">
      
      <!-- Карточка 1: Форма входа -->
      <div class="login-card">
        
        <!-- Шаг 1: Ввод контакта -->
        <div id="phone-step">
          <div class="login-header">
            <h1>Вход в аккаунт</h1>
            <p>Введите телефон или email</p>
          </div>
          
          <!-- Табы выбора -->
          <div class="contact-tabs">
            <button type="button" class="tab-btn active" data-type="phone">Телефон</button>
            <button type="button" class="tab-btn" data-type="email">Email</button>
          </div>
          
          <form id="sms-phone-form" class="login-form">
            <div class="form-group">
              <label id="contact-label">Номер телефона</label>
              <input 
                type="tel" 
                id="contact-input" 
                class="form-input"
                placeholder="+7 (999) 999-99-99"
                required
              >
            </div>

            <button type="submit" class="btn btn-primary btn-full">
              Отправить код
            </button>

            <div class="sms-message" id="phone-message" style="display:none;"></div>

            <p class="modal-help-text" id="help-text">
              Мы отправим код подтверждения по СМС
            </p>
          </form>
        </div>

        <!-- Шаг 2: Ввод кода -->
        <div id="code-step" style="display: none;">
          <div class="login-header">
            <h2>Подтвердите контакт</h2>
            <p>Код отправлен на: <strong id="phone-display"></strong></p>
          </div>

          <form id="sms-verify-form" class="login-form">
            <div class="form-group">
              <label>Код подтверждения</label>
              <input 
                type="text" 
                id="sms-code-input" 
                class="form-input"
                placeholder="0000" 
                maxlength="4"
                required
              >
            </div>

            <button type="submit" class="btn btn-primary btn-full">
              Подтвердить
            </button>

            <div class="sms-message" id="code-message" style="display:none;"></div>

            <p class="sms-resend-info">
              Код действует 15 минут<br>
              <a href="#" id="resend-link">Отправить заново</a>
            </p>
          </form>
        </div>

      </div>

      <!-- Карточка 2: Преимущества -->
      <div class="login-card">
        <h3>Преимущества покупок в издательстве</h3>
        <ul class="benefits-list">
          <li>
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path d="M12 2L2 7l10 5 10-5-10-5z"></path>
              <path d="M2 17l10 5 10-5M2 12l10 5 10-5"></path>
            </svg>
            <div>
              <strong>Быстрая доставка</strong>
              <p>Доставим за 1-3 дня в любой город России</p>
            </div>
          </li>
          <li>
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <rect x="2" y="7" width="20" height="14" rx="2"></rect>
              <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
            </svg>
            <div>
              <strong>Тысячи товаров</strong>
              <p>Широкий ассортимент</p>
            </div>
          </li>
          <li>
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M8 14s1.5 2 4 2 4-2 4-2"></path>
            </svg>
            <div>
              <strong>Бонусная программа</strong>
              <p>Копите баллы и оплачивайте ими покупки</p>
            </div>
          </li>
          <li>
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <rect x="3" y="11" width="18" height="11" rx="2"></rect>
              <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
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

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/login.js"></script>
<script src="/assets/sfera/js/header.js"></script>
</body>
</html>