<?php /* Smarty version 2.6.11, created on 2025-11-30 22:17:59
         compiled from sfera/profile/profile.tpl */ ?>
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
    <link rel="stylesheet" href="/assets/sfera/css/profile.css">
     <link rel="stylesheet" href="/assets/sfera/css/header.css">
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
<main class="profile-container">
    <div class="container">
        <div class="profile-layout">
            <!-- Sidebar Navigation -->
            <aside class="profile-sidebar">
                <div class="profile-user">
                    <div class="user-avatar">
                        <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
                            <circle cx="24" cy="24" r="24" fill="#005bff"/>
                            <circle cx="24" cy="18" r="8" fill="white"/>
                            <path d="M8 40c0-8 7-14 16-14s16 6 16 14" fill="white"/>
                        </svg>
                    </div>
                    <div class="user-info">
                        <h3>Иванов Иван</h3>
                        <p>ivan@example.com</p>
                    </div>
                </div>

                <nav class="profile-nav">
                    <a href="#personal" class="nav-item active" data-tab="personal">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <circle cx="10" cy="7" r="4" stroke="currentColor" stroke-width="1.5"/>
                            <path d="M3 17c0-4 3-6 7-6s7 2 7 6" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                        <span>Личные данные</span>
                    </a>
                    <a href="#addresses" class="nav-item" data-tab="addresses">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 2c-3 0-5 2-5 5 0 4 5 11 5 11s5-7 5-11c0-3-2-5-5-5z" stroke="currentColor" stroke-width="1.5"/>
                            <circle cx="10" cy="7" r="2" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                        <span>Адреса доставки</span>
                    </a>
                    <a href="#payments" class="nav-item" data-tab="payments">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <rect x="1" y="4" width="18" height="12" rx="2" stroke="currentColor" stroke-width="1.5"/>
                            <path d="M1 8h18" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                        <span>Способы оплаты</span>
                    </a>
                    <a href="#notifications" class="nav-item" data-tab="notifications">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 2a6 6 0 016 6v3l2 2v1H2v-1l2-2V8a6 6 0 016-6z" stroke="currentColor" stroke-width="1.5"/>
                            <path d="M8 15a2 2 0 004 0" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                        <span>Уведомления</span>
                    </a>
                    <a href="#security" class="nav-item" data-tab="security">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <rect x="5" y="8" width="10" height="9" rx="2" stroke="currentColor" stroke-width="1.5"/>
                            <path d="M7 8V6a3 3 0 016 0v2" stroke="currentColor" stroke-width="1.5"/>
                        </svg>
                        <span>Безопасность</span>
                    </a>
                </nav>

                <button class="logout-btn">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                        <path d="M7 17H3V3h4M13 13l4-3-4-3M17 10H7" stroke="currentColor" stroke-width="1.5"/>
                    </svg>
                    Выйти
                </button>
            </aside>

            <!-- Main Content Area -->
            <div class="profile-content">
                <!-- Personal Data Tab -->
                <section class="tab-content active" id="personal">
                    <h1 class="content-title">Личные данные</h1>

                    <div class="profile-section">
                        <div class="section-header">
                            <h2>Основная информация</h2>
                        </div>
                        <form class="profile-form">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="firstName">Имя</label>
                                    <input type="text" id="firstName" value="Иван">
                                </div>
                                <div class="form-group">
                                    <label for="lastName">Фамилия</label>
                                    <input type="text" id="lastName" value="Иванов">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="middleName">Отчество</label>
                                <input type="text" id="middleName" value="Иванович">
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="birthDate">Дата рождения</label>
                                    <input type="date" id="birthDate" value="1990-01-15">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Пол</label>
                                    <select id="gender">
                                        <option value="male">Мужской</option>
                                        <option value="female">Женский</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                        </form>
                    </div>

                    <div class="profile-section">
                        <div class="section-header">
                            <h2>Контактная информация</h2>
                        </div>
                        <form class="profile-form">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <div class="input-with-badge">
                                    <input type="email" id="email" value="ivan@example.com">
                                    <span class="verified-badge">
                      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <path d="M5 8l2 2 4-4" stroke="white" stroke-width="2"/>
                      </svg>
                      Подтвержден
                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone">Телефон</label>
                                <div class="input-with-badge">
                                    <input type="tel" id="phone" value="+7 (999) 123-45-67">
                                    <span class="verified-badge">
                      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <path d="M5 8l2 2 4-4" stroke="white" stroke-width="2"/>
                      </svg>
                      Подтвержден
                    </span>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                        </form>
                    </div>
                </section>

                <!-- Addresses Tab -->
                <section class="tab-content" id="addresses">
                    <h1 class="content-title">Адреса доставки</h1>

                    <div class="addresses-grid">
                        <div class="address-card">
                            <div class="address-header">
                                <span class="address-badge primary">Основной</span>
                                <button class="address-menu">⋮</button>
                            </div>
                            <h3>Москва</h3>
                            <p>улица Пушкина, д. 15, кв. 42</p>
                            <p class="address-contact">Иванов Иван Иванович</p>
                            <p class="address-contact">+7 (999) 123-45-67</p>
                            <div class="address-actions">
                                <button class="btn-edit">Изменить</button>
                                <button class="btn-delete">Удалить</button>
                            </div>
                        </div>

                        <div class="address-card">
                            <div class="address-header">
                                <span class="address-badge">Дополнительный</span>
                                <button class="address-menu">⋮</button>
                            </div>
                            <h3>Санкт-Петербург</h3>
                            <p>Невский проспект, д. 28</p>
                            <p class="address-contact">Иванов Иван Иванович</p>
                            <p class="address-contact">+7 (999) 123-45-67</p>
                            <div class="address-actions">
                                <button class="btn-edit">Изменить</button>
                                <button class="btn-delete">Удалить</button>
                            </div>
                        </div>

                        <button class="add-address-card">
                            <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
                                <circle cx="24" cy="24" r="24" fill="#f5f5f5"/>
                                <path d="M24 16v16M16 24h16" stroke="#005bff" stroke-width="2"/>
                            </svg>
                            <span>Добавить новый адрес</span>
                        </button>
                    </div>
                </section>

                <!-- Payments Tab -->
                <section class="tab-content" id="payments">
                    <h1 class="content-title">Способы оплаты</h1>

                    <div class="payments-grid">
                        <div class="payment-method-card">
                            <div class="card-icon visa">
                                <svg width="48" height="32" viewBox="0 0 48 32" fill="none">
                                    <rect width="48" height="32" rx="4" fill="#1A1F71"/>
                                    <text x="24" y="20" font-size="14" fill="white" text-anchor="middle" font-weight="bold">VISA</text>
                                </svg>
                            </div>
                            <div class="card-info">
                                <p class="card-number">•••• 4242</p>
                                <p class="card-expiry">Действует до 12/25</p>
                            </div>
                            <button class="card-delete">✕</button>
                        </div>

                        <div class="payment-method-card">
                            <div class="card-icon mastercard">
                                <svg width="48" height="32" viewBox="0 0 48 32" fill="none">
                                    <rect width="48" height="32" rx="4" fill="#EB001B"/>
                                    <circle cx="18" cy="16" r="8" fill="#FF5F00" opacity="0.8"/>
                                    <circle cx="30" cy="16" r="8" fill="#F79E1B" opacity="0.8"/>
                                </svg>
                            </div>
                            <div class="card-info">
                                <p class="card-number">•••• 8888</p>
                                <p class="card-expiry">Действует до 06/26</p>
                            </div>
                            <button class="card-delete">✕</button>
                        </div>

                        <button class="add-payment-card">
                            <svg width="48" height="48" viewBox="0 0 48 48" fill="none">
                                <circle cx="24" cy="24" r="24" fill="#f5f5f5"/>
                                <path d="M24 16v16M16 24h16" stroke="#005bff" stroke-width="2"/>
                            </svg>
                            <span>Добавить карту</span>
                        </button>
                    </div>
                </section>

                <!-- Notifications Tab -->
                <section class="tab-content" id="notifications">
                    <h1 class="content-title">Уведомления</h1>

                    <div class="profile-section">
                        <div class="section-header">
                            <h2>Email уведомления</h2>
                        </div>
                        <div class="notifications-list">
                            <div class="notification-item">
                                <div class="notification-info">
                                    <h4>Новости и акции</h4>
                                    <p>Получать информацию о скидках и специальных предложениях</p>
                                </div>
                                <label class="toggle">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                            <div class="notification-item">
                                <div class="notification-info">
                                    <h4>Статус заказа</h4>
                                    <p>Уведомления об изменении статуса заказа</p>
                                </div>
                                <label class="toggle">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                            <div class="notification-item">
                                <div class="notification-info">
                                    <h4>Рекомендации</h4>
                                    <p>Персональные рекомендации товаров</p>
                                </div>
                                <label class="toggle">
                                    <input type="checkbox">
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="profile-section">
                        <div class="section-header">
                            <h2>Push уведомления</h2>
                        </div>
                        <div class="notifications-list">
                            <div class="notification-item">
                                <div class="notification-info">
                                    <h4>Доставка</h4>
                                    <p>Уведомления о доставке заказов</p>
                                </div>
                                <label class="toggle">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                            <div class="notification-item">
                                <div class="notification-info">
                                    <h4>Избранное</h4>
                                    <p>Уведомления о снижении цен на избранные товары</p>
                                </div>
                                <label class="toggle">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Security Tab -->
                <section class="tab-content" id="security">
                    <h1 class="content-title">Безопасность</h1>

                    <div class="profile-section">
                        <div class="section-header">
                            <h2>Изменить пароль</h2>
                        </div>
                        <form class="profile-form">
                            <div class="form-group">
                                <label for="currentPassword">Текущий пароль</label>
                                <input type="password" id="currentPassword" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="newPassword">Новый пароль</label>
                                <input type="password" id="newPassword" autocomplete="off">
                                <small>Минимум 8 символов, включая цифры и буквы</small>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Подтвердите пароль</label>
                                <input type="password" id="confirmPassword" autocomplete="off">
                            </div>
                            <button type="submit" class="btn btn-primary">Изменить пароль</button>
                        </form>
                    </div>

                    <div class="profile-section">
                        <div class="section-header">
                            <h2>Активные сеансы</h2>
                        </div>
                        <div class="sessions-list">
                            <div class="session-item active">
                                <div class="session-icon">
                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
                                        <rect x="4" y="6" width="24" height="16" rx="2" stroke="currentColor" stroke-width="2"/>
                                        <path d="M12 22h8v2h-8v-2z" fill="currentColor"/>
                                    </svg>
                                </div>
                                <div class="session-info">
                                    <h4>Windows • Chrome</h4>
                                    <p>Москва, Россия • Текущий сеанс</p>
                                    <p class="session-time">Сегодня в 14:30</p>
                                </div>
                                <span class="session-badge">Активный</span>
                            </div>
                            <div class="session-item">
                                <div class="session-icon">
                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
                                        <rect x="8" y="4" width="16" height="24" rx="2" stroke="currentColor" stroke-width="2"/>
                                        <circle cx="16" cy="24" r="1.5" fill="currentColor"/>
                                    </svg>
                                </div>
                                <div class="session-info">
                                    <h4>iOS • Safari</h4>
                                    <p>Москва, Россия</p>
                                    <p class="session-time">Вчера в 18:15</p>
                                </div>
                                <button class="btn-end-session">Завершить</button>
                            </div>
                        </div>
                    </div>
                </section>
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
<script src="/assets/sfera/js/profile.js"></script>
</body>
</html>