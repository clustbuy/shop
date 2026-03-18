<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/register.css">
</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Registration Page -->
<main class="register-page">
    <div class="register-container">
        <div class="register-content">
            <!-- Left Side: Form -->
            <div class="register-form-section">
                <div class="form-header">
                    <h1>Регистрация</h1>
                    <p>Создайте аккаунт и начните покупки</p>
                </div>

                <!-- Social Login -->
                <div class="social-login">
                    <button class="social-btn google-btn">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M18.2 10.2c0-.6-.1-1.2-.2-1.8H10v3.4h4.6c-.2 1-.8 1.9-1.7 2.5v2.2h2.7c1.6-1.5 2.6-3.7 2.6-6.3z" fill="#4285F4"/>
                            <path d="M10 19c2.4 0 4.5-.8 6-2.2l-2.7-2.2c-.8.5-1.8.8-3.3.8-2.5 0-4.7-1.7-5.4-4H1.8v2.3C3.3 16.8 6.5 19 10 19z" fill="#34A853"/>
                            <path d="M4.6 11.4c-.2-.5-.3-1.1-.3-1.7s.1-1.2.3-1.7V5.7H1.8C1.1 7.1.7 8.5.7 10s.4 2.9 1.1 4.3l2.8-2.9z" fill="#FBBC05"/>
                            <path d="M10 4c1.4 0 2.7.5 3.7 1.4l2.8-2.8C14.5.9 12.4 0 10 0 6.5 0 3.3 2.2 1.8 5.7l2.8 2.2c.7-2.3 2.9-4 5.4-4z" fill="#EA4335"/>
                        </svg>
                        Регистрация через Google
                    </button>
                    <button class="social-btn vk-btn">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 0C4.48 0 0 4.48 0 10s4.48 10 10 10 10-4.48 10-10S15.52 0 10 0zm4.5 11.5c.5.5 1 1 1.5 1.4.2.2.4.4.5.7.2.3 0 .7-.3.7l-1.8.1c-.5 0-1-.2-1.4-.6-.3-.3-.6-.6-.9-.9-.1-.1-.3-.3-.5-.3-.3-.1-.6 0-.7.3-.1.3-.1.6-.2.9 0 .4-.2.5-.6.5-1 .1-1.9-.1-2.8-.6-.7-.4-1.3-1-1.8-1.6-.9-1.1-1.7-2.3-2.3-3.6-.2-.4-.1-.6.3-.6h1.8c.3 0 .5.2.6.4.4.9.8 1.7 1.4 2.5.2.2.3.5.6.6.3.1.5 0 .6-.3.1-.2.1-.4.1-.6.1-.6.1-1.2 0-1.8-.1-.4-.3-.6-.7-.7-.2 0-.2-.1-.1-.2.2-.2.4-.3.7-.3h2.6c.4.1.5.3.5.7v2.4c0 .2.1.8.4.9.2.1.4 0 .6-.2.6-.6 1-1.3 1.4-2 .2-.3.3-.7.5-1 .1-.2.3-.4.6-.4h2c.1 0 .2 0 .3.1.4.1.5.3.4.6-.2.6-.6 1.1-.9 1.6-.4.5-.8 1-1.1 1.5-.3.4-.3.6 0 1z" fill="#0077FF"/>
                        </svg>
                        Регистрация через VK
                    </button>
                    <button class="social-btn telegram-btn">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 0C4.48 0 0 4.48 0 10s4.48 10 10 10 10-4.48 10-10S15.52 0 10 0zm4.64 6.8c-.15 1.58-.8 5.42-1.13 7.19-.14.75-.42 1-.68 1.03-.58.05-1.02-.38-1.58-.75-.88-.58-1.38-.94-2.23-1.5-.99-.65-.35-1.01.22-1.59.15-.15 2.71-2.48 2.76-2.69.01-.03.01-.14-.07-.2s-.16-.04-.23-.02c-.09.02-1.63 1.03-4.61 3.03-.44.3-.83.45-1.18.44-.39-.01-1.13-.22-1.69-.4-.68-.23-1.22-.35-1.17-.74.02-.2.29-.41.78-.62 3.04-1.33 5.08-2.21 6.11-2.64 2.91-1.21 3.51-1.42 3.91-1.43.09 0 .28.02.41.13.1.09.13.21.14.3.01.06.02.21.01.32z" fill="#0088CC"/>
                        </svg>
                        Регистрация через Telegram
                    </button>
                </div>

                <div class="divider">
                    <span>или</span>
                </div>

                <!-- Registration Form -->
                <form class="register-form" id="registerForm">
                    <div class="form-group">
                        <label for="name">Имя</label>
                        <input type="text" id="name" name="name" placeholder="Введите ваше имя" required>
                        <span class="error-message"></span>
                    </div>

                    <div class="form-group">
                        <label for="phone">Телефон или Email</label>
                        <input type="text" id="phone" name="phone" placeholder="+7 (___) ___-__-__" required>
                        <span class="error-message"></span>
                    </div>

                    <div class="form-group">
                        <label for="password">Пароль</label>
                        <div class="password-input">
                            <input type="password" id="password" name="password" placeholder="Придумайте пароль" required>
                            <button type="button" class="toggle-password" data-target="password">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" class="eye-icon">
                                    <path d="M10 4C5 4 1.73 7.11 1 10c.73 2.89 4 6 9 6s8.27-3.11 9-6c-.73-2.89-4-6-9-6zm0 10a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm0-6.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5z" fill="currentColor"/>
                                </svg>
                            </button>
                        </div>
                        <span class="error-message"></span>
                        <div class="password-strength">
                            <div class="strength-bar">
                                <div class="strength-fill" id="strengthFill"></div>
                            </div>
                            <span class="strength-text" id="strengthText"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Подтверждение пароля</label>
                        <div class="password-input">
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Повторите пароль" required>
                            <button type="button" class="toggle-password" data-target="confirmPassword">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" class="eye-icon">
                                    <path d="M10 4C5 4 1.73 7.11 1 10c.73 2.89 4 6 9 6s8.27-3.11 9-6c-.73-2.89-4-6-9-6zm0 10a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm0-6.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5z" fill="currentColor"/>
                                </svg>
                            </button>
                        </div>
                        <span class="error-message"></span>
                    </div>

                    <div class="form-group checkbox-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="terms" name="terms" required>
                            <span>Я принимаю <a href="#" class="link">условия пользовательского соглашения</a> и даю согласие на обработку моих <a href="#" class="link">персональных данных</a></span>
                        </label>
                    </div>

                    <div class="form-group checkbox-group">
                        <label class="checkbox-label">
                            <input type="checkbox" id="newsletter" name="newsletter">
                            <span>Хочу получать информацию о скидках и акциях</span>
                        </label>
                    </div>

                    <button type="submit" class="btn-submit">Зарегистрироваться</button>

                    <p class="form-footer">
                        Уже есть аккаунт? <a href="/login.html" class="link">Войти</a>
                    </p>
                </form>
            </div>

            <!-- Right Side: Benefits -->
            <div class="register-benefits">
                <h2>Преимущества покупок в издательстве</h2>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                            <circle cx="20" cy="20" r="18" fill="#E6F0FF"/>
                            <path d="M12 20l6 6 10-12" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>Быстрая доставка</h3>
                        <p>Доставим ваш заказ завтра или в удобное для вас время</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                            <circle cx="20" cy="20" r="18" fill="#E6F0FF"/>
                            <path d="M20 12v8l6 3" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round"/>
                            <circle cx="20" cy="20" r="8" stroke="#005BFF" stroke-width="2.5"/>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>Гарантия качества</h3>
                        <p>Проверяем каждый товар перед отправкой покупателю</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                            <circle cx="20" cy="20" r="18" fill="#E6F0FF"/>
                            <path d="M16 18l4 4 8-8" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M12 20v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round"/>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>Простой возврат</h3>
                        <p>30 дней на возврат товара без объяснения причин</p>
                    </div>
                </div>

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                            <circle cx="20" cy="20" r="18" fill="#E6F0FF"/>
                            <path d="M20 10v10l6 3" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round"/>
                            <path d="M26 16c1.5 1.5 2 4 2 6 0 4.5-3.5 8-8 8s-8-3.5-8-8c0-2 .5-4.5 2-6" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round"/>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>Выгодные цены</h3>
                        <p>Регулярные акции и скидки до 30% на популярные товары</p>
                    </div>
                </div>

                ~~*
                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                            <circle cx="20" cy="20" r="18" fill="#E6F0FF"/>
                            <path d="M15 20h10M20 15v10" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round"/>
                            <rect x="12" y="12" width="16" height="16" rx="2" stroke="#005BFF" stroke-width="2.5"/>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>Система лояльности</h3>
                        <p>Кешбэк до 25% баллами на покупки</p>
                    </div>
                </div>
                *~

                <div class="benefit-item">
                    <div class="benefit-icon">
                        <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                            <circle cx="20" cy="20" r="18" fill="#E6F0FF"/>
                            <path d="M15 25c0 3 2 5 5 5s5-2 5-5" stroke="#005BFF" stroke-width="2.5" stroke-linecap="round"/>
                            <circle cx="16" cy="18" r="1.5" fill="#005BFF"/>
                            <circle cx="24" cy="18" r="1.5" fill="#005BFF"/>
                            <circle cx="20" cy="20" r="8" stroke="#005BFF" stroke-width="2.5"/>
                        </svg>
                    </div>
                    <div class="benefit-content">
                        <h3>Поддержка</h3>
                        <p>Наша команда всегда готова помочь с любым вопросом</p>
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

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/register.js"></script>

</body>
</html>