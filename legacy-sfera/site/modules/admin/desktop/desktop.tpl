<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Админ-панель - Творческий Центр СФЕРА</title>

    <!-- Google Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- ExtJS 4.2.1 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/extjs/4.2.1/resources/css/ext-all.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/extjs/4.2.1/ext-all.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/extjs/4.2.1/locale/ext-lang-ru.js"></script>

    <style>
        * {
            box-sizing: border-box;
        }

        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            background: #000;
            overflow: hidden;
            font-family: 'Inter', sans-serif !important;
        }

        /* Desktop - фон Windows 10 */
        .desktop {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0px; /*43*/
            background: url('https://images.wallpaperscraft.ru/image/single/lodka_gory_ozero_135258_1280x720.jpg') center center no-repeat;
            background-size: cover;
            z-index: 1;
        }

        /* Ярлыки на рабочем столе */
        .desktop-shortcuts {
            position: absolute;
            top: 20px;
            left: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;

        }

        .shortcut {
            width: 80px;
            text-align: center;
            padding: 8px;
            cursor: pointer;
            /*border: 2px solid transparent;*/
            border-radius: 10px;
            transition: all 0.15s ease;
            /*user-select: none;*/
            /*box-shadow: 0 15px 35px rgba(0,0,0,0.15); !* Мягкая тень *!*/
            /*transition: all 0.2s cubic-bezier(0.25, 0.8, 0.25, 1);*/
            /*!* Эффект матового стекла + градиент *!*/
            /*background: rgba(255, 255, 255, 0.1) !important;*/
            /*backdrop-filter: blur(12px) !important;*/
            /*border: 1px solid rgba(255, 255, 255, 0.2) !important;*/
        }

        .shortcut:hover {
            /*background: rgba(255, 255, 255, 0.1);*/
            /*border: 2px solid rgba(255, 255, 255, 0.2);*/
            transform: translateY(-4px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
            background: rgba(255, 255, 255, 0.15) !important;
            border-color: rgba(255, 255, 255, 0.3) !important;
        }

        .shortcut::before {
            background: linear-gradient(135deg, #64748b, #334155); opacity: 0.3;
        }

        .shortcut-icon {
            font-size: 48px;
            line-height: 1;
            margin-bottom: 5px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 48px;
            /*background: rgba(255,255,255,0.25);*/
        }

        .shortcut-icon .material-icons {
            font-size: 48px;
        }
        }

        .shortcut-icon i {
            font-size: 48px;
        }

        .shortcut-text {
            color: white;
            text-shadow: 0 1px 2px rgba(0,0,0,0.8);
            line-height: 1.3;
            font-size: 11px;
            font-weight: 600;
            margin-bottom: 2px;
            display: block;
            overflow: hidden;
            /*text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px  1px 0 #000, 1px  1px 0 #000;*/
            -webkit-text-stroke: 1px black; /* Толщина и цвет обводки */
            paint-order: stroke fill; /* Чтобы обводка не "съедала" толщину букв */
        }

        .shortcut.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        /* Логотип издательства */
        .desktop-logo {
            position: absolute;
            bottom: 100px;
            right: 50px;
            opacity: 0.08;
            pointer-events: none;
            text-align: right;
            line-height: 0.9;
            color: white;
        }

        .desktop-logo-main {
            font-size: 180px;
            font-weight: 600;
            letter-spacing: -5px;
        }

        .desktop-logo-sub {
            font-size: 45px;
            font-weight: 300;
            letter-spacing: 2px;
            margin-top: 5px;
        }

        /* Панель задач - Windows 10 */
        .taskbar {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 43px;
            /* Эффект матового стекла + градиент */
            background: rgba(255, 255, 255, 0.51) !important;
            backdrop-filter: blur(12px) !important;
            border: 1px solid rgba(255, 255, 255, 0.2) !important;

            display: flex;
            align-items: center;
            z-index: 100000;
        }

        /* Кнопка Пуск */
        .start-button {
            width: 48px;
            height: 43px;
            background: transparent;
            border: none;
            color: black;
            font-size: 21px;
            cursor: pointer;
            transition: background 0.1s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .start-button:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        /* Разделитель */
        /*.taskbar-separator {*/
        /*    width: 1px;*/
        /*    height: 24px;*/
        /*    background: rgba(128, 128, 128, 0.5);*/
        /*    margin: 0 4px;*/
        /*}*/

        /* Контейнер открытых окон */
        .taskbar-windows {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 0 8px;
        }

        /* Кнопка окна на панели задач */
        .window-button {
            height: 43px;
            padding: 0 16px;
            background: transparent;
            border: none;
            border-bottom: 2px solid transparent;
            color: white;
            font-size: 12px;
            cursor: pointer;
            transition: all 0.1s ease;
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .window-button:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .window-button.active {
            background: rgba(255, 255, 255, 0.05);
            border-bottom-color: rgba(245, 245, 245, 0.651);
        }

        .window-button.minimized {
            opacity: 0.7;
        }

        /* Системный трей */
        .system-tray {
            display: flex;
            align-items: center;
            gap: 0;
            padding: 0 8px;
        }

        .tray-button {
            width: 42px;
            height: 43px;
            background: transparent;
            border: none;
            color: black;
            font-size: 17px;
            cursor: pointer;
            transition: background 0.1s ease;
        }

        .tray-button:hover {
            background: rgba(255, 255, 255, 0.1);

        }

        /* Часы */
        .clock {
            padding: 6px 12px;
            color: black;
            text-align: center;
            font-size: 12px;
            line-height: 1.3;
            cursor: pointer;
            min-width: 70px;
            transition: background 0.1s ease;
        }

        .clock:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .clock-time {
            font-weight: 400;
        }

        .clock-date {
            font-size: 12px;
            opacity: 0.9;
        }

        /* Меню Пуск - Windows 10 Style */
        #start-menu-modal {
            background: rgba(255, 255, 255, 0.55);
            backdrop-filter: blur(200px);
            position: fixed;
            left: 0;
            bottom: 43px;
            height: 600px;
            color: black; /*white*/
            visibility: hidden;
            display: grid;
            grid-template-columns: 50px 250px 400px;
            cursor: default;
            z-index: 99999;
            animation-duration: 0.15s;
        }

        #start-menu-modal.open {
            visibility: visible;
            animation-name: slideUp;
        }

        @keyframes slideUp {
            from {
                height: 550px;
                opacity: 0.7;
            }
            to {
                height: 600px;
                opacity: 1;
            }
        }

        /* Левая панель - иконки пользователя */
        #start-menu-modal #user {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #start-menu-modal #user a {
            /*color: whitesmoke;*/
            color: black;
            height: 50px;
            width: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            cursor: pointer;
            font-size: 18px;
        }

        #start-menu-modal #user a:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        #start-menu-modal #user .push {
            margin-bottom: auto;
        }

        /* Центральная панель - список приложений */
        #start-menu-modal #apps {
            display: flex;
            flex-direction: column;
            overflow-y: auto;
            padding: 10px;
            /* Тонкая полупрозрачная лента прокрутки в стиле Windows 10 */
            scrollbar-width: thin;
            scrollbar-color: rgba(255, 255, 255, 0.3) transparent;
        }

        /* Стилизация скроллбара для WebKit браузеров (Chrome, Edge, Safari) */
        #start-menu-modal #apps::-webkit-scrollbar {
            width: 8px;
        }

        #start-menu-modal #apps::-webkit-scrollbar-track {
            background: transparent;
        }

        #start-menu-modal #apps::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 4px;
            transition: background 0.2s ease;
        }

        #start-menu-modal #apps::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 255, 255, 0.5);
        }

        #start-menu-modal #apps::-webkit-scrollbar-thumb:active {
            background: rgba(255, 255, 255, 0.6);
        }

        #start-menu-modal #apps a {
            color: whitesmoke;
            display: flex;
            text-decoration: none;
            padding: 8px 16px;
            line-height: 1.8;
            font-size: 13px;
            letter-spacing: 0.3px;
            cursor: pointer;
            align-items: center;
            gap: 12px;
        }

        #start-menu-modal #apps a span.app-icon {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #start-menu-modal #apps a span.app-icon i {
            font-size: 20px;
        }

        #start-menu-modal #apps a span.app-text {
            color: black;
        }

        #start-menu-modal #apps a:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        #start-menu-modal #apps a.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        #start-menu-modal #apps a.category {
            height: 30px;
            font-weight: 600;
            /*color: rgba(255, 255, 255, 0.8);*/
            color: black;
            cursor: default;

        }

        #start-menu-modal #apps a.category:hover {
            background: transparent;
        }

        #start-menu-modal #apps .separator {
            height: 1px;
            background: rgba(255, 255, 255, 0.1);
            margin: 8px 0;
        }

        /* Правая панель - плитки приложений */
        #start-menu-modal #others {
            padding: 20px;
        }

        #start-menu-modal #others .title-others {
            /*color: whitesmoke;*/
            color: black;
            padding-bottom: 10px;
            font-size: 12px;
            letter-spacing: 0.5px;
            font-weight: 300;
        }

        #start-menu-modal #others .box-others {
            display: grid;
            grid-template-columns: repeat(4, 90px);
            gap: 4px;
        }

        #start-menu-modal #others .box-others .box {
            height: 90px;
            width: 90px;
            position: relative;
            /*background: #0078d7;*/
            /* Эффект матового стекла + градиент */
            background: rgba(255, 255, 255, 0.1) !important;
            backdrop-filter: blur(12px) !important;
            border: 1px solid rgba(255, 255, 255, 0.2) !important;

            /*border: 2px solid transparent;*/
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #start-menu-modal #others .box-others .box.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        #start-menu-modal #others .box-others .box .box-icon {
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 40px;
        }

        #start-menu-modal #others .box-others .box .box-icon .material-icons {
            font-size: 40px;
        }

        #start-menu-modal #others .box-others .box span {
            font-size: 11px;
            text-align: center;
            padding: 0 4px;
        }

        #start-menu-modal #others .box-others .box:hover:not(.disabled) {
            border: 2px solid white !important;
        }

        /* Окна ExtJS - минимальные стили Windows 10 */
        .x-window {
            background: transparent !important;
            border: none !important;
            /* Стандартные стили ExtJS остаются */
        }

        /* Убираем padding у окна */
        .x-window-default {
            padding: 0 !important;
        }

        /* Заголовок окна - увеличиваем высоту на 4px */
        .x-window-header {
            /*background: #ffffff !important;*/
            /* Эффект матового стекла + градиент */
            background: rgba(255, 255, 255, 0.71) !important;
            backdrop-filter: blur(12px) !important;
            border: 1px solid rgba(255, 255, 255, 0.2) !important;

            background-image: none !important;
            border-bottom: 1px solid #e5e5e5 !important;
            height: 36px !important; /* было 32px, теперь 36px */
            line-height: 36px !important;
        }

        .x-box-inner {
            /*height: 30px !important;*/
        }

        .x-window-header-text {
            color: #000000 !important;
            font-size: 12px !important;
            font-weight: 600 !important;
            line-height: 24px !important;
        }

        /* Кнопки управления - подстраиваем под новую высоту */
        .x-window-header .x-tool {
            height: 36px !important;
            line-height: 36px !important;
            transition: background 0.1s ease !important;
        }

        .x-window-header .x-tool:hover {
            opacity: 1;
            /* Эффект при наведении, как в Win10 (легкий серый фон) */
            background-color: rgba(255, 255, 255, 0.3) !important;
        }

        /* Для кнопки закрытия при наведении обычно красный фон */
        .x-window-header .x-tool-close:hover {
            background-color: #e81123 !important;
        }

        /* Убираем top у кнопок */
        .x-tool.x-box-item.x-tool-default.x-tool-after-title {
            top: 0 !important;
        }

        .x-toolbar-default {
            background: transparent !important; /* Прозрачный фон, чтобы видеть фон окна */
            background-image: none !important;  /* Убираем градиенты ExtJS */
            border: none !important;            /* Убираем рамки */
            border-bottom: 2px solid #e5e5e5 !important; /* Тонкая линия разделителя */
            padding: 8px 8px 4px 8px !important;
            align-items: center !important;
        }

        /* Тело окна */
        .x-window-body {
            background: #ffffff !important;
        }

        .x-panel-header-default {
            border: 0px solid #99bce8 !important;

    }
    /* Убираем лишнюю окантовку у панелей */
        .x-panel-body-default {
            border-style: none !important;
        }
    </style>
</head>
<body>
<!-- Рабочий стол -->
<div class="desktop">
    <!-- Ярлыки -->
    <div class="desktop-shortcuts">
        ~~if $moduleAccess.banners~
        <div class="shortcut" onclick="openWindow('banners', 'Баннеры', '/index.php?module=banners')">
            <div class="shortcut-icon"><span class="material-icons">view_carousel</span></div>
            <div class="shortcut-text">Баннеры</div>
        </div>
        ~~/if~
        ~~if $moduleAccess.marketplace~
        <div class="shortcut" onclick="openWindow('marketplace', 'App Store', '/index.php?module=marketplace')">
            <div class="shortcut-icon"><span class="material-icons">store</span></div>
            <div class="shortcut-text">App Store</div>
        </div>
        ~~/if~
        ~~if $moduleAccess.wholesaler_banners~
        <div class="shortcut" onclick="openWholesalerBanners()">
            <div class="shortcut-icon"><span class="material-icons">perm_media</span></div>
            <div class="shortcut-text">Баннеры (Опт)</div>
        </div>
        ~~/if~
        <div class="shortcut" onclick="openTop10Products()">
            <div class="shortcut-icon"><span class="material-icons">star</span></div>
            <div class="shortcut-text">Топ-10</div>
        </div>
        <div class="shortcut disabled">
            <div class="shortcut-icon"><span class="material-icons">menu</span></div>
            <div class="shortcut-text">Меню</div>
        </div>
        <div class="shortcut disabled">
            <div class="shortcut-icon"><span class="material-icons">description</span></div>
            <div class="shortcut-text">Страницы</div>
        </div>
        ~~if $moduleAccess.permissions~
        <div class="shortcut" onclick="openPermissions()">
            <div class="shortcut-icon"><span class="material-icons">admin_panel_settings</span></div>
            <div class="shortcut-text">Права доступа</div>
        </div>
        ~~/if~
        ~~if $moduleAccess.users~
        <div class="shortcut" onclick="openUsers()">
            <div class="shortcut-icon"><span class="material-icons">people</span></div>
            <div class="shortcut-text">Пользователи</div>
        </div>
        ~~/if~
    </div>

    <!-- Логотип -->
    <div class="desktop-logo">
        <div class="desktop-logo-main">СФЕРА</div>
        <div class="desktop-logo-sub">Творческий Центр</div>
    </div>
</div>

<!-- Панель задач -->
<div class="taskbar">
    <!-- Кнопка Пуск -->
    <button class="start-button" id="start-button">
        <span class="material-icons">apps</span>
    </button>

    <!-- Разделитель -->
    <div class="taskbar-separator"></div>

    <!-- Контейнер открытых окон -->
    <div class="taskbar-windows" id="taskbar-windows"></div>

    <!-- Системный трей -->
    <div class="system-tray">
        <button class="tray-button" onclick="alert('Новых уведомлений нет')" title="Уведомления">
            <span class="material-icons">notifications</span>
        </button>
        <button class="tray-button" onclick="showUserMenu()" title="~~$admin_user.name~">
            <span class="material-icons">person</span>
        </button>
    </div>

    <div class="taskbar-separator"></div>

    <!-- Часы -->
    <div class="clock" id="clock">
        <div class="clock-time" id="clock-time">00:00</div>
        <div class="clock-date" id="clock-date">01.01.2024</div>
    </div>
</div>

<!-- Меню Пуск - Windows 10 Style -->
<div id="start-menu-modal">
    <!-- Левая панель - иконки пользователя -->
    <div id="user">
        <a class="push" href="#" onclick="closeStartMenu(); return false;">
            <span class="material-icons">menu</span>
        </a>
        <a href="#" onclick="showProfile(); return false;" title="~~$admin_user.name~">
            <span class="material-icons">person</span>
        </a>
        <a href="#" onclick="alert('Настройки в разработке'); return false;" title="Настройки">
            <span class="material-icons">settings</span>
        </a>
        <a href="#" onclick="logout(); return false;" title="Выход">
            <span class="material-icons">power_settings_new</span>
        </a>
    </div>

    <!-- Центральная панель - список приложений -->
    <div id="apps">
        <a class="category">Приложения</a>
        ~~if $moduleAccess.banners~
        <a href="#" onclick="openBanners(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">image</span></span>
            <span class="app-text">Управление баннерами</span>
        </a>
        ~~/if~
        ~~if $moduleAccess.wholesaler_banners~
        <a href="#" onclick="openWholesalerBanners(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">perm_media</span></span>
            <span class="app-text">Баннеры для оптовиков</span>
        </a>
        ~~/if~
        <a href="#" onclick="openTop10Products(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">star</span></span>
            <span class="app-text">Топ-10 товаров</span>
        </a>
        <a href="#" class="disabled" onclick="return false;">
            <span class="app-icon"><span class="material-icons">menu</span></span>
            <span class="app-text">Управление меню</span>
        </a>
        ~~if $moduleAccess.menu~
        <a href="#" onclick="openMenu(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">menu</span></span>
            <span class="app-text">Управление меню</span>
        </a>
        ~~/if~
        <a href="#" onclick="openPopularCategories(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">star</span></span>
            <span class="app-text">Популярные категории</span>
        </a>
        <a href="#" onclick="openReviews(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">article</span></span>
            <span class="app-text">Обзоры продукции</span>
        </a>
        ~~if $moduleAccess.products~
        <a href="#" onclick="openProducts(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">inventory_2</span></span>
            <span class="app-text">Управление товарами</span>
        </a>
        ~~/if~
        ~~if $moduleAccess.import~
        <a href="#" onclick="openImport(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">file_upload</span></span>
            <span class="app-text">Импорт товаров</span>
        </a>
        ~~/if~
        ~~if $moduleAccess.ozon_import~
        <a href="#" onclick="openOzonImport(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">cloud_download</span></span>
            <span class="app-text">Импорт товаров из Ozon</span>
        </a>
        ~~/if~
        ~~if $moduleAccess.yandex_import~
        <a href="#" onclick="openYandexImport(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">location_on</span></span>
            <span class="app-text">Импорт из Яндекс</span>
        </a>
        ~~/if~
        ~~if $moduleAccess.permissions~
        <a href="#" onclick="openPermissions(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">admin_panel_settings</span></span>
            <span class="app-text">Управление правами</span>
        </a>
        ~~/if~
        ~~if $moduleAccess.users~
        <a href="#" onclick="openUsers(); closeStartMenu(); return false;">
            <span class="app-icon"><span class="material-icons">people</span></span>
            <span class="app-text">Управление пользователями</span>
        </a>
        ~~/if~
    </div>

    <!-- Правая панель - плитки приложений -->
    <div id="others">
        <div class="title-others">
            Быстрый доступ
        </div>
        <div class="box-others">
            ~~if $moduleAccess.banners~
            <div class="box" onclick="openBanners(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">image</span></div>
                <span>Баннеры</span>
            </div>
            ~~/if~
            ~~if $moduleAccess.wholesaler_banners~
            <div class="box" onclick="openWholesalerBanners(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">perm_media</span></div>
                <span>Баннеры (Опт)</span>
            </div>
            ~~/if~
            <div class="box" onclick="openTop10Products(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">star</span></div>
                <span>Топ-10</span>
            </div>
            <div class="box" onclick="openReviews(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">article</span></div>
                <span>Обзоры</span>
            </div>
            ~~if $moduleAccess.menu~
            <div class="box" onclick="openMenu(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">menu</span></div>
                <span>Меню</span>
            </div>
            ~~/if~
            <div class="box" onclick="openPopularCategories(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">star</span></div>
                <span>Популярные категории</span>
            </div>
            <div class="box disabled">
                <div class="box-icon"><span class="material-icons">description</span></div>
                <span>Страницы</span>
            </div>
            ~~if $moduleAccess.products~
            <div class="box" onclick="openProducts(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">inventory_2</span></div>
                <span>Товары</span>
            </div>
            ~~/if~
            ~~if $moduleAccess.import~
            <div class="box" onclick="openImport(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">file_upload</span></div>
                <span>Импорт</span>
            </div>
            ~~/if~
            ~~if $moduleAccess.permissions~
            <div class="box" onclick="openPermissions(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">admin_panel_settings</span></div>
                <span>Права</span>
            </div>
            ~~/if~
            ~~if $moduleAccess.users~
            <div class="box" onclick="openUsers(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">people</span></div>
                <span>Пользователи</span>
            </div>
            ~~/if~
            <div class="box disabled">
                <div class="box-icon"><span class="material-icons">settings</span></div>
                <span>Настройки</span>
            </div>
            <div class="box" onclick="showProfile(); closeStartMenu();">
                <div class="box-icon"><span class="material-icons">person</span></div>
                <span>Профиль</span>
            </div>
            <div class="box disabled">
                <div class="box-icon"><span class="material-icons">bar_chart</span></div>
                <span>Статистика</span>
            </div>
            <div class="box" onclick="logout();">
                <div class="box-icon"><span class="material-icons">power_settings_new</span></div>
                <span>Выход</span>
            </div>
        </div>
    </div>
</div>

<script>
    /**
     * Открывает "окно" с модулем
     * @param {string} id - уникальный ID окна (например, 'banners')
     * @param {string} title - Заголовок окна
     * @param {string} url - URL для загрузки контента
     */
    function openWindow(id, title, url) {
        // Если окно уже открыто, просто выводим его на передний план
        let existingWindow = document.getElementById('window-' + id);
        if (existingWindow) {
            $(existingWindow).show(); // Или ваша логика фокуса на окне
            return;
        }

        // Создаем HTML структуру окна (подстройте классы под ваш CSS)
        let windowHtml = `
            <div id="window-${id}" class="app-window" style="position: absolute; top: 50px; left: 50px; width: 800px; height: 600px; background: #fff; border: 1px solid #ccc; box-shadow: 0 0 10px rgba(0,0,0,0.5); z-index: 100;">
                <div class="window-header" style="background: #f0f0f0; padding: 5px 10px; cursor: move; display: flex; justify-content: space-between; align-items: center;">
                    <span class="window-title" style="font-weight: bold;">${title}</span>
                    <div class="window-controls">
                        <span class="material-icons" style="cursor: pointer;" onclick="closeWindow('${id}')">close</span>
                    </div>
                </div>
                <div class="window-content" style="height: calc(100% - 35px); overflow: auto; padding: 10px;">
                    Loading...
                </div>
            </div>
        `;

        // Добавляем окно в DOM (например, в body или контейнер десктопа)
        $('body').append(windowHtml);

        // Загружаем контент
        $(`#window-${id} .window-content`).load(url, function(response, status, xhr) {
            if (status == "error") {
                $(this).html("Ошибка загрузки модуля: " + xhr.status + " " + xhr.statusText);
            }
        });

        // Делаем окно перетаскиваемым (если подключен jQuery UI)
        if ($.fn.draggable) {
            $(`#window-${id}`).draggable({ handle: ".window-header", containment: "window" });
        }
    }

    function closeWindow(id) {
        $('#window-' + id).remove();
    }
</script>

<style>
    /* Базовые стили для окон, если их нет в styles.css */
    .app-window { display: flex; flex-direction: column; }
    .window-header { user-select: none; border-bottom: 1px solid #ccc; }
</style>


<script>
    // Настройка ZIndexManager для окон - чтобы при перетаскивании окно было поверх всех
    Ext.onReady(function() {
        // Увеличиваем базовый z-index для окон
        if (Ext.WindowManager) {
            Ext.WindowManager.zseed = 20000;
        }

        // Функция для получения максимального z-index всех окон
        function getMaxWindowZIndex() {
            var maxZIndex = 20000; // Базовое значение
            var allWindows = Ext.ComponentQuery.query('window');

            Ext.each(allWindows, function(win) {
                if (win.getEl && win.getEl()) {
                    var zIndex = parseInt(win.getEl().getStyle('z-index'), 10);
                    if (!isNaN(zIndex) && zIndex > maxZIndex) {
                        maxZIndex = zIndex;
                    }
                }
            });

            return maxZIndex;
        }

        // Переопределяем класс Window - отключаем ghost-элемент при перетаскивании
        Ext.override(Ext.window.Window, {
            initComponent: function() {
                // Отключаем ghost-элемент (прозрачный дубликат) при перетаскивании
                this.ghost = false;

                this.callParent(arguments);

                // При начале перетаскивания поднимаем окно наверх
                this.on('beforemove', function(win, x, y) {
                    win.toFront();
                });
            }
        });

        // Функция для отладки - проверка текущего состояния z-index
        window.debugZIndex = function() {
            console.log('=== ОТЛАДКА Z-INDEX ===');

            // Проверяем все окна
            var allWindows = Ext.ComponentQuery.query('window');
            console.log('Всего окон:', allWindows.length);
            Ext.each(allWindows, function(w) {
                if (w.getEl()) {
                    var winZIndex = w.getEl().getStyle('z-index');
                    var isVisible = w.isVisible();
                    console.log('Окно:', w.title || w.id, 'z-index:', winZIndex, 'видимо:', isVisible);
                }
            });

            // Проверяем прокси-элементы
            var proxies = Ext.query('.x-window-proxy');
            console.log('Прокси-элементов:', proxies ? proxies.length : 0);
            if (proxies && proxies.length > 0) {
                Ext.each(proxies, function(proxy, index) {
                    var proxyZIndex = proxy.style ? proxy.style.zIndex : 'не определен';
                    console.log('Прокси-элемент #' + index, 'z-index:', proxyZIndex);
                });
            }

            console.log('=== КОНЕЦ ОТЛАДКИ ===');
        };
    });

    // Часы
    function updateClock() {
        var now = new Date();
        document.getElementById('clock-time').textContent = now.toLocaleTimeString('ru-RU', {hour: '2-digit', minute: '2-digit'});
        document.getElementById('clock-date').textContent = now.toLocaleDateString('ru-RU');
    }
    updateClock();
    setInterval(updateClock, 1000);

    // Меню Пуск - Windows 10 Style
    function toggleStartMenu(event) {
        if (event) {
            event.stopPropagation();
        }
        var menu = document.getElementById('start-menu-modal');
        menu.classList.toggle('open');
    }

    function closeStartMenu() {
        var menu = document.getElementById('start-menu-modal');
        menu.classList.remove('open');
    }

    // Обработчик кнопки Пуск
    document.addEventListener('DOMContentLoaded', function() {
        var startBtn = document.getElementById('start-button');
        if (startBtn) {
            startBtn.addEventListener('click', toggleStartMenu);
        }
    });

    // Закрытие меню при клике вне его
    document.addEventListener('click', function(e) {
        var menu = document.getElementById('start-menu-modal');
        var startBtn = document.getElementById('start-button');
        if (!menu.contains(e.target) && e.target !== startBtn && !startBtn.contains(e.target)) {
            closeStartMenu();
        }
    });

    // Функции управления
    var profileWindow = null;

    function showProfile() {
        closeStartMenu();

        if (profileWindow && !profileWindow.isDestroyed) {
            profileWindow.show();
            profileWindow.toFront();
            return;
        }

        profileWindow = Ext.create('Ext.window.Window', {
            title: 'Профиль пользователя',
            width: 850,
            height: 600,
            layout: 'fit',
            modal: false,
            maximizable: true,
            minimizable: true,
            constrain: true,
            html: '<iframe src="/admin/profile/" style="width:100%; height:100%; border:0px;"></iframe>',
            listeners: {
                close: function() {
                    profileWindow = null;
                },
                minimize: function() {
                    this.hide();
                }
            }
        });

        profileWindow.show();
    }

    function showUserMenu() {
        Ext.Msg.alert('Профиль', '<b>Логин:</b> ~~$admin_user.login~<br><b>Имя:</b> ~~$admin_user.name~');
    }

    function logout() {
        window.location.href = '/admin/?action=logout';
    }

    // Управление окнами
    var openWindows = {};

    function addTaskbarButton(windowId, title, win) {
        var container = document.getElementById('taskbar-windows');
        var btn = document.createElement('button');
        btn.className = 'window-button active';
        btn.textContent = title;
        btn.id = 'taskbar-' + windowId;
        btn.onclick = function() {
            if (win.hidden) {
                win.show();
                win.toFront();
                btn.classList.remove('minimized');
                setActiveWindow(windowId);
            } else if (win === Ext.WindowManager.getActive()) {
                win.hide();
                btn.classList.add('minimized');
                btn.classList.remove('active');
            } else {
                win.show();
                win.toFront();
                setActiveWindow(windowId);
            }
        };
        container.appendChild(btn);
        return btn;
    }

    function removeTaskbarButton(windowId) {
        var btn = document.getElementById('taskbar-' + windowId);
        if (btn) btn.remove();
    }

    function setActiveWindow(windowId) {
        var buttons = document.querySelectorAll('.window-button');
        buttons.forEach(function(btn) {
            btn.classList.remove('active');
        });
        var activeBtn = document.getElementById('taskbar-' + windowId);
        if (activeBtn) {
            activeBtn.classList.add('active');
            activeBtn.classList.remove('minimized');
        }
    }

    // Просмотр баннера в полном размере
    var bannerPreviewWindow = null;

    function showBannerPreview(imageUrl) {
        // Создаем временное изображение для получения размеров
        var img = new Image();
        img.onload = function() {
            var imgWidth = this.width;
            var imgHeight = this.height;

            // Максимальные размеры окна (80% от экрана)
            var maxWidth = window.innerWidth * 0.8;
            var maxHeight = window.innerHeight * 0.8;

            // Вычисляем размеры с сохранением пропорций
            var ratio = Math.min(maxWidth / imgWidth, maxHeight / imgHeight, 1);
            var winWidth = Math.floor(imgWidth * ratio);
            var winHeight = Math.floor(imgHeight * ratio);

            // Закрываем предыдущее окно, если оно открыто
            if (bannerPreviewWindow) {
                bannerPreviewWindow.close();
            }

            // Создаем новое модальное окно
            bannerPreviewWindow = Ext.create('Ext.window.Window', {
                title: 'Просмотр баннера',
                width: winWidth,
                height: winHeight,
                modal: true,
                layout: 'fit',
                closeAction: 'destroy',
                resizable: true,
                maximizable: true,
                html: '<div style="width:100%; height:100%; display:flex; align-items:center; justify-content:center; background:#000;">' +
                    '<img src="' + imageUrl + '" style="max-width:100%; max-height:100%; object-fit:contain;" />' +
                    '</div>',
                listeners: {
                    destroy: function() {
                        bannerPreviewWindow = null;
                    }
                }
            });

            bannerPreviewWindow.show();
        };
        img.src = imageUrl;
    }

    // Форма добавления/редактирования баннера
    function showBannerForm(record, store) {
        var isEdit = record !== null;
        var formWindow = Ext.create('Ext.window.Window', {
            title: isEdit ? 'Редактировать баннер' : 'Добавить баннер',
            width: 500,
            modal: true,
            layout: 'fit',
            items: [{
                xtype: 'form',
                padding: 10,
                defaults: {
                    anchor: '100%',
                    labelWidth: 120
                },
                items: [
                    {
                        xtype: 'filefield',
                        name: 'file',
                        fieldLabel: 'Изображение',
                        buttonText: 'Выбрать...',
                        hidden: isEdit,
                        allowBlank: isEdit,
                        listeners: {
                            change: function(field, value) {
                                var form = field.up('form').getForm();
                                if (value && !form.findField('name').getValue()) {
                                    var filename = value.replace(/^.*[\\\/]/, '').replace(/\.[^/.]+$/, "");
                                    form.findField('name').setValue(filename);
                                }
                            }
                        }
                    },
                    {
                        xtype: 'textfield',
                        name: 'name',
                        fieldLabel: 'Название',
                        allowBlank: false,
                        value: isEdit ? record.get('name') : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'title',
                        fieldLabel: 'Заголовок',
                        value: isEdit ? record.get('title') : ''
                    },
                    {
                        xtype: 'numberfield',
                        name: 'sort',
                        fieldLabel: 'Порядок',
                        value: isEdit ? record.get('sort') : 10,
                        minValue: 0,
                        step: 10
                    },
                    isEdit ? {
                        xtype: 'hiddenfield',
                        name: 'id',
                        value: record.get('id')
                    } : null,
                    isEdit ? {
                        xtype: 'hiddenfield',
                        name: 'url',
                        value: record.get('url')
                    } : null
                ].filter(Boolean)
            }],
            buttons: [
                {
                    text: 'Сохранить',
                    handler: function() {
                        var form = this.up('window').down('form').getForm();
                        if (!form.isValid()) {
                            Ext.Msg.alert('Ошибка', 'Заполните все обязательные поля');
                            return;
                        }

                        if (isEdit) {
                            // Редактирование - просто обновляем данные
                            Ext.Ajax.request({
                                url: '/admin/banners/?action=update',
                                params: form.getValues(),
                                success: function(response) {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        Ext.Msg.alert('Успешно', result.message);
                                        formWindow.close();
                                        store.load();
                                    } else {
                                        Ext.Msg.alert('Ошибка', result.message);
                                    }
                                },
                                failure: function() {
                                    Ext.Msg.alert('Ошибка', 'Ошибка обновления');
                                }
                            });
                        } else {
                            // Добавление - сначала загружаем файл, потом создаем запись
                            formWindow.setLoading('Загрузка файла...');
                            form.submit({
                                url: '/admin/banners/?action=upload',
                                success: function(form, action) {
                                    var uploadResult = action.result;
                                    if (uploadResult.success) {
                                        // Файл загружен, создаем запись
                                        var values = form.getValues();
                                        Ext.Ajax.request({
                                            url: '/admin/banners/?action=create',
                                            params: {
                                                url: uploadResult.url,
                                                name: values.name,
                                                title: values.title,
                                                sort: values.sort
                                            },
                                            success: function(response) {
                                                formWindow.setLoading(false);
                                                var result = Ext.decode(response.responseText);
                                                if (result.success) {
                                                    Ext.Msg.alert('Успешно', 'Баннер добавлен');
                                                    formWindow.close();
                                                    store.load();
                                                } else {
                                                    Ext.Msg.alert('Ошибка', result.message);
                                                }
                                            },
                                            failure: function() {
                                                formWindow.setLoading(false);
                                                Ext.Msg.alert('Ошибка', 'Ошибка создания записи');
                                            }
                                        });
                                    } else {
                                        formWindow.setLoading(false);
                                        Ext.Msg.alert('Ошибка', uploadResult.message);
                                    }
                                },
                                failure: function(form, action) {
                                    formWindow.setLoading(false);
                                    Ext.Msg.alert('Ошибка', action.result ? action.result.message : 'Ошибка загрузки файла');
                                }
                            });
                        }
                    }
                },
                {
                    text: 'Отмена',
                    handler: function() {
                        this.up('window').close();
                    }
                }
            ]
        });

        formWindow.show();
    }

    // Удаление баннера
    function deleteBanner(record, store) {
        Ext.Msg.confirm('Удаление', 'Вы уверены, что хотите удалить баннер "' + record.get('name') + '"?', function(btn) {
            if (btn === 'yes') {
                Ext.Ajax.request({
                    url: '/admin/banners/?action=delete',
                    params: {
                        id: record.get('id')
                    },
                    success: function(response) {
                        var result = Ext.decode(response.responseText);
                        if (result.success) {
                            Ext.Msg.alert('Успешно', result.message);
                            store.load();
                        } else {
                            Ext.Msg.alert('Ошибка', result.message);
                        }
                    },
                    failure: function() {
                        Ext.Msg.alert('Ошибка', 'Ошибка удаления баннера');
                    }
                });
            }
        });
    }

    // Открытие окна баннеров
    function openBanners() {
        closeStartMenu();

        if (openWindows['banners']) {
            openWindows['banners'].show();
            openWindows['banners'].toFront();
            return;
        }

        Ext.onReady(function() {

            var store = Ext.create('Ext.data.Store', {
                fields: ['id', 'url', 'name', 'title', 'sort'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/banners/?action=list',
                    reader: {
                        type: 'json',
                        root: 'data',
                        successProperty: 'success',
                        totalProperty: 'total'
                    },
                    listeners: {
                        exception: function(proxy, response, operation) {
                            // Ошибка загрузки данных
                        }
                    }
                },
                autoLoad: true,
                listeners: {
                    load: function(store, records, successful, operation) {
                        // Данные загружены
                    }
                }
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Управление баннерами',
                width: 480,
                height: 750,
                layout: 'fit',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 100,
                y: 50,
                listeners: {
                    close: function() {
                        delete openWindows['banners'];
                        removeTaskbarButton('banners');
                    },
                    activate: function() {
                        setActiveWindow('banners');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-banners');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                },
                items: [{
                    xtype: 'grid',
                    store: store,
                    selModel: {
                        selType: 'rowmodel',
                        mode: 'SINGLE'
                    },
                    viewConfig: {
                        plugins: {
                            ptype: 'gridviewdragdrop',
                            dragText: 'Перетащите для изменения порядка'
                        },
                        listeners: {
                            drop: function(node, data, overModel, dropPosition) {
                                // Собираем новый порядок ID
                                var order = [];
                                store.each(function(record) {
                                    order.push(record.get('id'));
                                });


                                // Отправляем на сервер
                                Ext.Ajax.request({
                                    url: '/admin/banners/?action=updateSort',
                                    params: {
                                        order: JSON.stringify(order)
                                    },
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (!result.success) {
                                            Ext.Msg.alert('Ошибка', result.message);
                                            store.load(); // Откатываем изменения
                                        } else {
                                            // Успешное сохранение - обновляем данные с сервера
                                            store.load();
                                        }
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить порядок');
                                        store.load(); // Откатываем изменения
                                    }
                                });
                            }
                        }
                    },
                    columns: [
                        { text: 'ID', dataIndex: 'id', width: 50 },
                        {
                            text: 'Порядок',
                            dataIndex: 'sort',
                            width: 80,
                            align: 'center'
                        },
                        {
                            text: 'Превью',
                            dataIndex: 'url',
                            width: 150,
                            renderer: function(value) {
                                // Проверяем, локальный ли путь или внешний
                                var imgSrc = value.startsWith('http') ? value : value;
                                return '<img src="' + imgSrc + '" width="130" height="60" style="object-fit: cover; border-radius: 4px; cursor: pointer;" onclick="showBannerPreview(\'' + imgSrc + '\');" />';
                            }
                        },
                        { text: 'Название', dataIndex: 'name', flex: 1 },
                        { text: 'Заголовок', dataIndex: 'title', flex: 1 }
                    ],
                    listeners: {
                        itemdblclick: function(grid, record) {
                            showBannerForm(record, store);
                        }
                    },
                    tbar: [
                        {
                            text: 'Добавить',
                            handler: function() {
                                showBannerForm(null, store);
                            }
                        },
                        {
                            text: 'Редактировать',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length === 0) {
                                    Ext.Msg.alert('Ошибка', 'Выберите баннер для редактирования');
                                    return;
                                }
                                showBannerForm(selection[0], store);
                            }
                        },
                        {
                            text: 'Удалить',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length === 0) {
                                    Ext.Msg.alert('Ошибка', 'Выберите баннер для удаления');
                                    return;
                                }
                                deleteBanner(selection[0], store);
                            }
                        },
                        '->',
                        {
                            text: 'Обновить',
                            handler: function() {
                                store.load();
                            }
                        }
                    ]
                }]
            });

            openWindows['banners'] = win;
            addTaskbarButton('banners', 'Управление баннерами', win);
            win.show();
        });
    }

    /* ========================================================================== */
    /*                            БАННЕРЫ ОПТОВИКОВ                               */
    /* ========================================================================== */

    // Форма добавления/редактирования баннера (ОПТ)
    function showWholesalerBannerForm(record, store) {
        var isEdit = record !== null;
        var formWindow = Ext.create('Ext.window.Window', {
            title: isEdit ? 'Редактировать оптовый баннер' : 'Добавить оптовый баннер',
            width: 500,
            modal: true,
            layout: 'fit',
            items: [{
                xtype: 'form',
                padding: 10,
                defaults: {
                    anchor: '100%',
                    labelWidth: 120
                },
                items: [
                    {
                        xtype: 'filefield',
                        name: 'file',
                        fieldLabel: 'Изображение',
                        buttonText: 'Выбрать...',
                        hidden: isEdit,
                        allowBlank: isEdit,
                        listeners: {
                            change: function(field, value) {
                                var form = field.up('form').getForm();
                                if (value && !form.findField('name').getValue()) {
                                    var filename = value.replace(/^.*[\\\/]/, '').replace(/\.[^/.]+$/, "");
                                    form.findField('name').setValue(filename);
                                }
                            }
                        }
                    },
                    {
                        xtype: 'textfield',
                        name: 'name',
                        fieldLabel: 'Название',
                        allowBlank: false,
                        value: isEdit ? record.get('name') : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'title',
                        fieldLabel: 'Заголовок',
                        value: isEdit ? record.get('title') : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'url',
                        fieldLabel: 'Ссылка (URL)', // Добавил, т.к. в баннерах часто нужна ссылка при клике
                        value: isEdit ? record.get('url') : '',
                        // Если url используется только для картинки, то скройте это поле или переименуйте
                        // В вашем примере url это путь к картинке, поэтому скрываем для create
                        hidden: true
                    },
                    {
                        xtype: 'numberfield',
                        name: 'sort',
                        fieldLabel: 'Порядок',
                        value: isEdit ? record.get('sort') : 10,
                        minValue: 0,
                        step: 10
                    },
                    isEdit ? {
                        xtype: 'hiddenfield',
                        name: 'id',
                        value: record.get('id')
                    } : null
                ].filter(Boolean)
            }],
            buttons: [
                {
                    text: 'Сохранить',
                    handler: function() {
                        var form = this.up('window').down('form').getForm();
                        if (!form.isValid()) {
                            Ext.Msg.alert('Ошибка', 'Заполните все обязательные поля');
                            return;
                        }

                        if (isEdit) {
                            // Редактирование
                            Ext.Ajax.request({
                                url: '/admin/wholesaler_banners/?action=update',
                                params: form.getValues(),
                                success: function(response) {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        Ext.Msg.alert('Успешно', result.message);
                                        formWindow.close();
                                        store.load();
                                    } else {
                                        Ext.Msg.alert('Ошибка', result.message);
                                    }
                                },
                                failure: function() {
                                    Ext.Msg.alert('Ошибка', 'Ошибка обновления');
                                }
                            });
                        } else {
                            // Добавление
                            formWindow.setLoading('Загрузка файла...');
                            form.submit({
                                url: '/admin/wholesaler_banners/?action=upload',
                                success: function(form, action) {
                                    var uploadResult = action.result;
                                    if (uploadResult.success) {
                                        var values = form.getValues();
                                        Ext.Ajax.request({
                                            url: '/admin/wholesaler_banners/?action=create',
                                            params: {
                                                url: uploadResult.url, // Путь к картинке
                                                name: values.name,
                                                title: values.title,
                                                sort: values.sort
                                            },
                                            success: function(response) {
                                                formWindow.setLoading(false);
                                                var result = Ext.decode(response.responseText);
                                                if (result.success) {
                                                    Ext.Msg.alert('Успешно', 'Баннер добавлен');
                                                    formWindow.close();
                                                    store.load();
                                                } else {
                                                    Ext.Msg.alert('Ошибка', result.message);
                                                }
                                            },
                                            failure: function() {
                                                formWindow.setLoading(false);
                                                Ext.Msg.alert('Ошибка', 'Ошибка создания записи');
                                            }
                                        });
                                    } else {
                                        formWindow.setLoading(false);
                                        Ext.Msg.alert('Ошибка', uploadResult.message);
                                    }
                                },
                                failure: function(form, action) {
                                    formWindow.setLoading(false);
                                    Ext.Msg.alert('Ошибка', action.result ? action.result.message : 'Ошибка загрузки файла');
                                }
                            });
                        }
                    }
                },
                {
                    text: 'Отмена',
                    handler: function() {
                        this.up('window').close();
                    }
                }
            ]
        });

        formWindow.show();
    }

    // Удаление баннера (ОПТ)
    function deleteWholesalerBanner(record, store) {
        Ext.Msg.confirm('Удаление', 'Вы уверены, что хотите удалить баннер "' + record.get('name') + '"?', function(btn) {
            if (btn === 'yes') {
                Ext.Ajax.request({
                    url: '/admin/wholesaler_banners/?action=delete',
                    params: {
                        id: record.get('id')
                    },
                    success: function(response) {
                        var result = Ext.decode(response.responseText);
                        if (result.success) {
                            Ext.Msg.alert('Успешно', result.message);
                            store.load();
                        } else {
                            Ext.Msg.alert('Ошибка', result.message);
                        }
                    },
                    failure: function() {
                        Ext.Msg.alert('Ошибка', 'Ошибка удаления баннера');
                    }
                });
            }
        });
    }

    // Открытие окна баннеров (ОПТ)
    function openWholesalerBanners() {
        closeStartMenu();

        if (openWindows['wholesaler_banners']) {
            openWindows['wholesaler_banners'].show();
            openWindows['wholesaler_banners'].toFront();
            return;
        }

        Ext.onReady(function() {

            var store = Ext.create('Ext.data.Store', {
                fields: ['id', 'url', 'name', 'title', 'sort'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/wholesaler_banners/?action=list',
                    reader: {
                        type: 'json',
                        root: 'data',
                        successProperty: 'success',
                        totalProperty: 'total'
                    }
                },
                autoLoad: true
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Баннеры для оптовиков',
                width: 480,
                height: 750,
                layout: 'fit',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 120, // Немного сместим, чтобы не перекрывало обычные баннеры
                y: 70,
                listeners: {
                    close: function() {
                        delete openWindows['wholesaler_banners'];
                        removeTaskbarButton('wholesaler_banners');
                    },
                    activate: function() {
                        setActiveWindow('wholesaler_banners');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-wholesaler_banners');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                },
                items: [{
                    xtype: 'grid',
                    store: store,
                    selModel: {
                        selType: 'rowmodel',
                        mode: 'SINGLE'
                    },
                    viewConfig: {
                        plugins: {
                            ptype: 'gridviewdragdrop',
                            dragText: 'Перетащите для изменения порядка'
                        },
                        listeners: {
                            drop: function(node, data, overModel, dropPosition) {
                                var order = [];
                                store.each(function(record) {
                                    order.push(record.get('id'));
                                });

                                Ext.Ajax.request({
                                    url: '/admin/wholesaler_banners/?action=updateSort',
                                    params: {
                                        order: JSON.stringify(order)
                                    },
                                    success: function(response) {
                                        store.load();
                                    }
                                });
                            }
                        }
                    },
                    columns: [
                        { text: 'ID', dataIndex: 'id', width: 50 },
                        {
                            text: 'Порядок',
                            dataIndex: 'sort',
                            width: 80,
                            align: 'center'
                        },
                        {
                            text: 'Превью',
                            dataIndex: 'url',
                            width: 150,
                            renderer: function(value) {
                                var imgSrc = value.startsWith('http') ? value : value;
                                return '<img src="' + imgSrc + '" width="130" height="60" style="object-fit: cover; border-radius: 4px;" />';
                            }
                        },
                        { text: 'Название', dataIndex: 'name', flex: 1 },
                        { text: 'Заголовок', dataIndex: 'title', flex: 1 }
                    ],
                    listeners: {
                        itemdblclick: function(grid, record) {
                            showWholesalerBannerForm(record, store);
                        }
                    },
                    tbar: [
                        {
                            text: 'Добавить',
                            handler: function() {
                                showWholesalerBannerForm(null, store);
                            }
                        },
                        {
                            text: 'Редактировать',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length === 0) {
                                    Ext.Msg.alert('Ошибка', 'Выберите баннер');
                                    return;
                                }
                                showWholesalerBannerForm(selection[0], store);
                            }
                        },
                        {
                            text: 'Удалить',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length === 0) {
                                    Ext.Msg.alert('Ошибка', 'Выберите баннер');
                                    return;
                                }
                                deleteWholesalerBanner(selection[0], store);
                            }
                        },
                        '->',
                        {
                            text: 'Обновить',
                            handler: function() {
                                store.load();
                            }
                        }
                    ]
                }]
            });

            openWindows['wholesaler_banners'] = win;
            addTaskbarButton('wholesaler_banners', 'Баннеры (Опт)', win);
            win.show();
        });
    }


    // Открытие окна управления топ-10 товарами
    function openTop10Products() {
        closeStartMenu();

        if (openWindows['top10_products']) {
            openWindows['top10_products'].show();
            openWindows['top10_products'].toFront();
            return;
        }

        Ext.onReady(function() {

            var store = Ext.create('Ext.data.Store', {
                fields: ['id', 'product_id', 'product_name', 'sort', 'active'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/top10_products/?action=list',
                    reader: {
                        type: 'json',
                        root: 'data',
                        successProperty: 'success',
                        totalProperty: 'total'
                    },
                    listeners: {
                        exception: function(proxy, response, operation) {
                            // Ошибка загрузки данных
                        }
                    }
                },
                autoLoad: true
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Топ-10 товаров',
                width: 1000,
                height: 600,
                layout: 'fit',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 100,
                y: 50,
                listeners: {
                    close: function() {
                        delete openWindows['top10_products'];
                        removeTaskbarButton('top10_products');
                    },
                    activate: function() {
                        setActiveWindow('top10_products');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-top10_products');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                },
                items: [{
                    xtype: 'grid',
                    store: store,
                    selModel: {
                        selType: 'rowmodel',
                        mode: 'SINGLE'
                    },
                    viewConfig: {
                        plugins: {
                            ptype: 'gridviewdragdrop',
                            dragText: 'Перетащите для изменения порядка'
                        },
                        listeners: {
                            drop: function(node, data, overModel, dropPosition) {
                                // Собираем новый порядок ID
                                var order = [];
                                store.each(function(record) {
                                    order.push(record.get('id'));
                                });

                                // Отправляем на сервер
                                Ext.Ajax.request({
                                    url: '/admin/top10_products/?action=updateSort',
                                    method: 'POST',
                                    params: {
                                        order: Ext.encode(order)
                                    },
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (!result.success) {
                                            Ext.Msg.alert('Ошибка', result.message);
                                            store.load();
                                        }
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить порядок');
                                        store.load();
                                    }
                                });
                            }
                        }
                    },
                    columns: [
                        {
                            xtype: 'rownumberer',
                            width: 40,
                            text: '№',
                            align: 'center'
                        },
                        { text: 'ID', dataIndex: 'id', width: 50 },
                        { text: 'ID товара', dataIndex: 'product_id', width: 150 },
                        { text: 'Название товара', dataIndex: 'product_name', flex: 1 }
                    ],
                    tbar: [
                        {
                            text: 'Добавить товар',
                            iconCls: 'icon-add',
                            handler: function() {
                                // Форма для добавления товара по ID
                                var formWindow = Ext.create('Ext.window.Window', {
                                    title: 'Добавить товар в топ-10',
                                    width: 400,
                                    modal: true,
                                    layout: 'fit',
                                    items: [{
                                        xtype: 'form',
                                        padding: 10,
                                        defaults: {
                                            anchor: '100%',
                                            labelWidth: 120
                                        },
                                        items: [{
                                            xtype: 'textfield',
                                            name: 'product_id',
                                            fieldLabel: 'ID товара',
                                            allowBlank: false
                                        }],
                                        buttons: [{
                                            text: 'Добавить',
                                            handler: function() {
                                                var form = this.up('form').getForm();
                                                if (form.isValid()) {
                                                    var values = form.getValues();

                                                    Ext.Ajax.request({
                                                        url: '/admin/top10_products/?action=create',
                                                        method: 'POST',
                                                        params: values,
                                                        success: function(response) {
                                                            var result = Ext.decode(response.responseText);
                                                            if (result.success) {
                                                                Ext.Msg.alert('Успешно', result.message);
                                                                formWindow.close();
                                                                store.load();
                                                            } else {
                                                                Ext.Msg.alert('Ошибка', result.message);
                                                            }
                                                        },
                                                        failure: function() {
                                                            Ext.Msg.alert('Ошибка', 'Ошибка добавления товара');
                                                        }
                                                    });
                                                }
                                            }
                                        }, {
                                            text: 'Отмена',
                                            handler: function() {
                                                this.up('window').close();
                                            }
                                        }]
                                    }]
                                });

                                formWindow.show();
                            }
                        },
                        {
                            text: 'Удалить',
                            iconCls: 'icon-delete',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length === 0) {
                                    Ext.Msg.alert('Ошибка', 'Выберите товар для удаления');
                                    return;
                                }

                                var record = selection[0];
                                Ext.Msg.confirm('Удаление', 'Вы уверены, что хотите удалить товар "' + record.get('product_name') + '" из топ-10?', function(btn) {
                                    if (btn === 'yes') {
                                        Ext.Ajax.request({
                                            url: '/admin/top10_products/?action=delete',
                                            method: 'POST',
                                            params: {
                                                id: record.get('id')
                                            },
                                            success: function(response) {
                                                var result = Ext.decode(response.responseText);
                                                if (result.success) {
                                                    Ext.Msg.alert('Успешно', result.message);
                                                    store.load();
                                                } else {
                                                    Ext.Msg.alert('Ошибка', result.message);
                                                }
                                            },
                                            failure: function() {
                                                Ext.Msg.alert('Ошибка', 'Не удалось удалить товар');
                                            }
                                        });
                                    }
                                });
                            }
                        },
                        '->',
                        {
                            text: 'Обновить',
                            iconCls: 'icon-refresh',
                            handler: function() {
                                store.load();
                            }
                        }
                    ]
                }]
            });

            openWindows['top10_products'] = win;
            addTaskbarButton('top10_products', 'Топ-10 товаров', win);
            win.show();
        });
    }

    // Открытие окна управления товарами
    function openProducts() {
        closeStartMenu();

        if (openWindows['products']) {
            openWindows['products'].show();
            openWindows['products'].toFront();
            return;
        }

        Ext.onReady(function() {
            // TreeStore для категорий
            var categoriesStore = Ext.create('Ext.data.TreeStore', {
                fields: ['id', 'text', 'name', 'parent_id', 'leaf'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/products/?action=list_categories',
                    reader: {
                        type: 'json',
                        root: 'children'
                    }
                },
                root: {
                    text: 'Категории',
                    id: 'root',
                    expanded: true
                },
                folderSort: false,
                autoLoad: true
            });

            // Store для товаров
            var productsStore = Ext.create('Ext.data.Store', {
                fields: ['id', 'name', 'price', 'description', 'category_id', 'breadcrumbs', 'slug'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/products/?action=list_products',
                    extraParams: {
                        category_id: ''
                    },
                    reader: {
                        type: 'json',
                        root: 'data',
                        totalProperty: 'total'
                    }
                }
            });

            // Tree Panel для категорий
            var treePanel = Ext.create('Ext.tree.Panel', {
                title: 'Категории',
                region: 'west',
                width: 350,
                split: true,
                useArrows: true,
                rootVisible: false,
                singleExpand: true,
                store: categoriesStore,
                columns: [{
                    xtype: 'treecolumn',
                    text: 'Название',
                    flex: 1,
                    dataIndex: 'name',
                    sortable: true
                }],
                listeners: {
                    selectionchange: function(sm, selected) {
                        if (selected.length > 0) {
                            var categoryId = selected[0].get('id');
                            productsStore.getProxy().setExtraParam('category_id', categoryId);
                            productsStore.load();
                        }
                    }
                }
            });

            // Функция для отображения изображения и названия товара
            function title_img(val, x, grid_store) {
                var imgSrc = '/import_files/' + grid_store.data.id + 'b.jpg';

                // Формируем ссылку на карточку товара
                var link = '';
                if (grid_store.data.breadcrumbs && grid_store.data.slug) {
                    link += '<div style="text-align:left; margin-top:5px;">';
                    link += '<span>';
                    link += '<a target="_blank" href="https://www.sfera-book.ru/catalog' + grid_store.data.breadcrumbs + grid_store.data.slug + '" style="color:rgba(0, 26, 52, 0.6);">sfera-book</a>';
                    link += '</span>';
                    link += '</div>';
                }

                return '<img src="' + imgSrc + '" align="left" style="height:80px; margin-right:10px;" onerror="this.style.display=\'none\';">' +
                    '<b style="font-size: 11px;">' + val + '</b><br>' + link;
            }

            // Grid для товаров
            var productsGrid = Ext.create('Ext.grid.Panel', {
                title: 'Товары',
                region: 'center',
                store: productsStore,
                selModel: {
                    selType: 'rowmodel',
                    mode: 'SINGLE'
                },
                viewConfig: {
                    stripeRows: true,
                    enableTextSelection: true
                },
                columns: [
                    {
                        text: 'ID',
                        dataIndex: 'id',
                        width: 60
                    },
                    {
                        text: 'Название',
                        dataIndex: 'name',
                        flex: 2,
                        sortable: true,
                        renderer: title_img
                    },
                    {
                        text: 'Цена',
                        dataIndex: 'price',
                        width: 100,
                        sortable: true,
                        renderer: function(value) {
                            if (value) {
                                return Ext.util.Format.number(value, '0,0.00') + ' ₽';
                            }
                            return '';
                        }
                    },
                    {
                        text: 'Описание',
                        dataIndex: 'description',
                        flex: 1,
                        sortable: false
                    },
                    {
                        menuDisabled: true,
                        sortable: false,
                        xtype: 'actioncolumn',
                        width: 80,
                        items: [{
                            iconCls: 'x-action-col-icon x-action-col-0',
                            tooltip: 'Редактировать',
                            handler: function(grid, rowIndex, colIndex) {
                                var rec = grid.getStore().getAt(rowIndex);
                                showProductForm(rec, productsStore);
                            }
                        }, {
                            iconCls: 'x-action-col-icon x-action-col-1',
                            tooltip: 'Удалить',
                            handler: function(grid, rowIndex, colIndex) {
                                var rec = grid.getStore().getAt(rowIndex);
                                deleteProduct(rec, productsStore);
                            }
                        }]
                    }
                ],
                tbar: [
                    {
                        text: 'Добавить товар',
                        handler: function() {
                            var selected = treePanel.getSelectionModel().getSelection();
                            if (selected.length === 0) {
                                Ext.Msg.alert('Ошибка', 'Выберите категорию для добавления товара');
                                return;
                            }
                            showProductForm(null, productsStore, selected[0].get('id'));
                        }
                    },
                    {
                        text: 'Редактировать',
                        handler: function() {
                            var selection = productsGrid.getSelectionModel().getSelection();
                            if (selection.length === 0) {
                                Ext.Msg.alert('Ошибка', 'Выберите товар для редактирования');
                                return;
                            }
                            showProductForm(selection[0], productsStore);
                        }
                    },
                    {
                        text: 'Удалить',
                        handler: function() {
                            var selection = productsGrid.getSelectionModel().getSelection();
                            if (selection.length === 0) {
                                Ext.Msg.alert('Ошибка', 'Выберите товар для удаления');
                                return;
                            }
                            deleteProduct(selection[0], productsStore);
                        }
                    },
                    '->',
                    {
                        text: 'Обновить',
                        handler: function() {
                            productsStore.load();
                        }
                    }
                ]
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Управление товарами',
                width: 1200,
                height: 700,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 50,
                y: 30,
                items: [treePanel, productsGrid],
                listeners: {
                    close: function() {
                        delete openWindows['products'];
                        removeTaskbarButton('products');
                    },
                    activate: function() {
                        setActiveWindow('products');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-products');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                }
            });

            openWindows['products'] = win;
            addTaskbarButton('products', 'Управление товарами', win);
            win.show();
        });
    }

    // Форма добавления/редактирования товара
    function showProductForm(record, store, categoryId) {
        var isEdit = record !== null;
        var formWindow = Ext.create('Ext.window.Window', {
            title: isEdit ? 'Редактировать товар' : 'Добавить товар',
            width: 500,
            modal: true,
            layout: 'fit',
            items: [{
                xtype: 'form',
                padding: 10,
                defaults: {
                    anchor: '100%',
                    labelWidth: 120
                },
                items: [
                    {
                        xtype: 'textfield',
                        name: 'name',
                        fieldLabel: 'Название',
                        allowBlank: false,
                        value: isEdit ? record.get('name') : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'category_id',
                        fieldLabel: 'Категория ID',
                        allowBlank: false,
                        value: isEdit ? record.get('category_id') : (categoryId || ''),
                        readOnly: true
                    },
                    {
                        xtype: 'numberfield',
                        name: 'price',
                        fieldLabel: 'Цена',
                        allowBlank: false,
                        minValue: 0,
                        decimalPrecision: 2,
                        value: isEdit ? record.get('price') : 0
                    },
                    {
                        xtype: 'textarea',
                        name: 'description',
                        fieldLabel: 'Описание',
                        height: 100,
                        value: isEdit ? record.get('description') : ''
                    }
                ],
                buttons: [{
                    text: 'Отмена',
                    handler: function() {
                        formWindow.close();
                    }
                }, {
                    text: 'Сохранить',
                    formBind: true,
                    handler: function() {
                        var form = this.up('form').getForm();
                        if (form.isValid()) {
                            var values = form.getValues();
                            var url = isEdit ? '/admin/products/?action=update' : '/admin/products/?action=create';

                            if (isEdit) {
                                values.id = record.get('id');
                            }

                            Ext.Ajax.request({
                                url: url,
                                method: 'POST',
                                params: values,
                                success: function(response) {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        Ext.Msg.alert('Успех', result.message);
                                        formWindow.close();
                                        store.load();
                                    } else {
                                        Ext.Msg.alert('Ошибка', result.message);
                                    }
                                },
                                failure: function() {
                                    Ext.Msg.alert('Ошибка', 'Не удалось сохранить товар');
                                }
                            });
                        }
                    }
                }]
            }]
        });

        formWindow.show();
    }

    // Удаление товара
    function deleteProduct(record, store) {
        Ext.Msg.confirm('Подтверждение', 'Вы уверены, что хотите удалить товар "' + record.get('name') + '"?', function(btn) {
            if (btn === 'yes') {
                Ext.Ajax.request({
                    url: '/admin/products/?action=delete',
                    method: 'POST',
                    params: {
                        id: record.get('id')
                    },
                    success: function(response) {
                        var result = Ext.decode(response.responseText);
                        if (result.success) {
                            Ext.Msg.alert('Успех', result.message);
                            store.load();
                        } else {
                            Ext.Msg.alert('Ошибка', result.message);
                        }
                    },
                    failure: function() {
                        Ext.Msg.alert('Ошибка', 'Не удалось удалить товар');
                    }
                });
            }
        });
    }

    // Открытие окна импорта товаров
    function openImport() {
        closeStartMenu();

        if (openWindows['import']) {
            openWindows['import'].show();
            openWindows['import'].toFront();
            return;
        }

        Ext.onReady(function() {
            // Область для лога (терминал)
            var logPanel = Ext.create('Ext.panel.Panel', {
                title: 'Лог импорта',
                region: 'center',
                layout: 'fit',
                bodyStyle: {
                    'background-color': '#1e1e1e',
                    'color': '#d4d4d4',
                    'font-family': 'Consolas, "Courier New", monospace',
                    'font-size': '12px',
                    'padding': '10px'
                },
                html: '<div id="import-log-content" style="white-space: pre-wrap; overflow-y: auto; height: 100%;">Готов к импорту...\n</div>',
                autoScroll: true
            });

            // Функция для обновления лога
            var logUpdateInterval = null;
            var isImporting = false;
            var cometConnection = null;
            var cometChannel = null;

            // Подключение к Comet для получения сообщений в реальном времени
            function connectComet(channel) {
                cometChannel = channel;

                // Подключаемся к Comet серверу
                try {
                    // Используем CometQL для подписки на канал
                    var cometUrl = 'https://app.comet-server.ru:2048/';
                    var cometScript = document.createElement('script');
                    cometScript.src = cometUrl + 'comet.js';
                    cometScript.onload = function() {
                        if (typeof CometServer !== 'undefined') {
                            cometConnection = CometServer.start({
                                user_id: 'admin_' + Math.random().toString(36).substr(2, 9),
                                project_id: 15
                            });

                            // Подписываемся на канал импорта
                            CometServer.subscription(cometChannel, function(data) {
                                handleCometMessage(data);
                            });
                        }
                    };
                    document.head.appendChild(cometScript);
                } catch (e) {
                    console.error('Ошибка подключения к Comet:', e);
                }
            }

            // Обработка сообщений от Comet
            function handleCometMessage(data) {
                var logContent = document.getElementById('import-log-content');
                if (!logContent) return;

                if (data.event === 'log') {
                    // Добавляем сообщение в лог
                    var timestamp = data.data.timestamp || '';
                    var message = data.data.message || '';
                    logContent.textContent += timestamp + ' - ' + message + '\n';
                    logContent.scrollTop = logContent.scrollHeight;
                } else if (data.event === 'progress') {
                    // Обновляем прогресс
                    var progress = data.data;
                    var progressText = 'Прогресс: товаров - ' + progress.products +
                        ', цен - ' + progress.prices +
                        ', атрибутов - ' + progress.attributes +
                        ', авторов - ' + progress.authors;
                    if (progress.errors > 0) {
                        progressText += ', ошибок - ' + progress.errors;
                    }
                    logContent.textContent += progressText + '\n';
                    logContent.scrollTop = logContent.scrollHeight;
                } else if (data.event === 'complete') {
                    // Импорт завершен
                    var summary = data.data;
                    logContent.textContent += '\n=== ИМПОРТ ЗАВЕРШЕН ===\n';
                    logContent.textContent += 'Товаров: ' + summary.products + '\n';
                    logContent.textContent += 'Цен: ' + summary.prices + '\n';
                    logContent.textContent += 'Атрибутов: ' + summary.attributes + '\n';
                    logContent.textContent += 'Авторов: ' + summary.authors + '\n';
                    if (summary.errors > 0) {
                        logContent.textContent += 'Ошибок: ' + summary.errors + '\n';
                    }
                    logContent.scrollTop = logContent.scrollHeight;

                    isImporting = false;
                    if (logUpdateInterval) {
                        clearInterval(logUpdateInterval);
                        logUpdateInterval = null;
                    }
                    startBtn.setDisabled(false);
                    startBtn.setText('Начать импорт');
                } else if (data.event === 'error') {
                    // Критическая ошибка
                    logContent.textContent += '\nКРИТИЧЕСКАЯ ОШИБКА: ' + data.data.message + '\n';
                    logContent.scrollTop = logContent.scrollHeight;

                    isImporting = false;
                    if (logUpdateInterval) {
                        clearInterval(logUpdateInterval);
                        logUpdateInterval = null;
                    }
                    startBtn.setDisabled(false);
                    startBtn.setText('Начать импорт');
                }
            }

            function updateLog() {
                if (!isImporting) {
                    return;
                }

                Ext.Ajax.request({
                    url: '/admin/import/?action=get_log',
                    method: 'GET',
                    success: function(response) {
                        var result = Ext.decode(response.responseText);
                        if (result.success && result.log) {
                            var logContent = document.getElementById('import-log-content');
                            if (logContent) {
                                logContent.textContent = result.log;
                                logContent.scrollTop = logContent.scrollHeight;

                                // Проверяем, завершен ли импорт
                                if (result.log.indexOf('Импорт завершён') !== -1 ||
                                    result.log.indexOf('КРИТИЧЕСКАЯ ОШИБКА') !== -1) {
                                    isImporting = false;
                                    if (logUpdateInterval) {
                                        clearInterval(logUpdateInterval);
                                        logUpdateInterval = null;
                                    }
                                    startBtn.setDisabled(false);
                                    startBtn.setText('Начать импорт');
                                }
                            }
                        }
                    },
                    failure: function() {
                        // Игнорируем ошибки при получении лога
                    }
                });
            }

            // Кнопка загрузки файла
            var uploadBtn = Ext.create('Ext.button.Button', {
                text: 'Загрузить XML',
                iconCls: 'x-btn-icon',
                handler: function() {
                    // Создаем скрытое поле для загрузки файла
                    var fileInput = document.createElement('input');
                    fileInput.type = 'file';
                    fileInput.accept = '.xml';
                    fileInput.style.display = 'none';

                    fileInput.onchange = function(e) {
                        var file = e.target.files[0];
                        if (!file) {
                            return;
                        }

                        // Проверяем расширение
                        if (!file.name.toLowerCase().endsWith('.xml')) {
                            Ext.Msg.alert('Ошибка', 'Разрешена загрузка только XML файлов');
                            return;
                        }

                        // Показываем прогресс
                        uploadBtn.setDisabled(true);
                        uploadBtn.setText('Загрузка...');

                        // Создаем FormData для загрузки
                        var formData = new FormData();
                        formData.append('file', file);

                        // Загружаем файл
                        var xhr = new XMLHttpRequest();
                        xhr.open('POST', '/admin/import/?action=upload_file', true);

                        xhr.onload = function() {
                            uploadBtn.setDisabled(false);
                            uploadBtn.setText('Загрузить XML');

                            if (xhr.status === 200) {
                                try {
                                    var result = Ext.decode(xhr.responseText);
                                    if (result.success) {
                                        Ext.Msg.alert('Успех', result.message);

                                        // Обновляем информацию о файле в логе
                                        var logContent = document.getElementById('import-log-content');
                                        if (logContent) {
                                            logContent.textContent = 'Файл загружен: ' + result.file_name + '\nРазмер: ' + (result.file_size / 1024).toFixed(2) + ' КБ\n\nГотов к импорту...\n';
                                        }
                                    } else {
                                        Ext.Msg.alert('Ошибка', result.message);
                                    }
                                } catch (e) {
                                    Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                }
                            } else {
                                Ext.Msg.alert('Ошибка', 'Ошибка загрузки файла (код: ' + xhr.status + ')');
                            }
                        };

                        xhr.onerror = function() {
                            uploadBtn.setDisabled(false);
                            uploadBtn.setText('Загрузить XML');
                            Ext.Msg.alert('Ошибка', 'Не удалось загрузить файл');
                        };

                        xhr.send(formData);
                    };

                    // Добавляем input в DOM и кликаем
                    document.body.appendChild(fileInput);
                    fileInput.click();
                    document.body.removeChild(fileInput);
                }
            });

            // Кнопка запуска импорта
            var startBtn = Ext.create('Ext.button.Button', {
                text: 'Начать импорт',
                iconCls: 'x-btn-icon',
                handler: function() {
                    Ext.Msg.confirm('Подтверждение',
                        'Внимание! Импорт очистит все данные в таблицах:\n' +
                        '- tree (категории)\n' +
                        '- price_types (типы цен)\n' +
                        '- product_properties (свойства товаров)\n' +
                        '- products (товары)\n\n' +
                        'Продолжить?',
                        function(btn) {
                            if (btn === 'yes') {
                                startBtn.setDisabled(true);
                                startBtn.setText('Импорт выполняется...');

                                // Очищаем лог
                                var logContent = document.getElementById('import-log-content');
                                if (logContent) {
                                    logContent.textContent = 'Запуск импорта...\n';
                                }

                                isImporting = true;

                                // Запускаем импорт
                                Ext.Ajax.request({
                                    url: '/admin/import/?action=start_import',
                                    method: 'GET',
                                    timeout: 10000, // 10 секунд - достаточно для запуска
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (result.success) {
                                            // Подключаемся к Comet для получения сообщений в реальном времени
                                            if (result.comet_channel) {
                                                connectComet(result.comet_channel);
                                            }

                                            // Также начинаем обновление лога каждые 2 секунды как резервный вариант
                                            if (logUpdateInterval) {
                                                clearInterval(logUpdateInterval);
                                            }
                                            logUpdateInterval = setInterval(updateLog, 2000);
                                            updateLog(); // Первый запрос сразу

                                            var logContent = document.getElementById('import-log-content');
                                            if (logContent) {
                                                logContent.textContent = 'Импорт запущен. Ожидание сообщений...\n';
                                            }
                                        } else {
                                            Ext.Msg.alert('Ошибка', result.message);
                                            startBtn.setDisabled(false);
                                            startBtn.setText('Начать импорт');
                                            isImporting = false;
                                        }
                                    },
                                    failure: function(response) {
                                        // Не показываем ошибку сразу - импорт может продолжаться в фоне
                                        // Просто начинаем обновление лога
                                        var logContent = document.getElementById('import-log-content');
                                        if (logContent) {
                                            logContent.textContent += '\nЗапрос отправлен. Проверяем статус импорта...\n';
                                        }

                                        // Начинаем обновление лога
                                        if (logUpdateInterval) {
                                            clearInterval(logUpdateInterval);
                                        }
                                        logUpdateInterval = setInterval(updateLog, 2000);
                                        updateLog();
                                    }
                                });
                            }
                        }
                    );
                }
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Импорт товаров из XML',
                width: 900,
                height: 600,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 100,
                y: 50,
                items: [logPanel],
                tbar: [uploadBtn, startBtn, '->', {
                    text: 'Очистить лог',
                    handler: function() {
                        var logContent = document.getElementById('import-log-content');
                        if (logContent) {
                            logContent.textContent = 'Лог очищен.\n';
                        }
                    }
                }],
                listeners: {
                    close: function() {
                        if (logUpdateInterval) {
                            clearInterval(logUpdateInterval);
                        }
                        delete openWindows['import'];
                        removeTaskbarButton('import');
                    },
                    activate: function() {
                        setActiveWindow('import');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-import');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                }
            });

            openWindows['import'] = win;
            addTaskbarButton('import', 'Импорт товаров', win);
            win.show();
        });
    }

    // Открытие окна импорта категорий из Ozon
    function openOzonImport() {
        closeStartMenu();

        if (openWindows['ozon_import']) {
            openWindows['ozon_import'].show();
            openWindows['ozon_import'].toFront();
            return;
        }

        Ext.onReady(function() {
            // Панель с информацией
            var infoPanel = Ext.create('Ext.panel.Panel', {
                title: 'Импорт категорий из Ozon',
                region: 'center',
                layout: 'fit',
                bodyStyle: {
                    'padding': '20px',
                    'font-size': '14px'
                },
                html: '<div id="ozon-import-info" style="line-height: 1.6;">' +
                    '<p><strong>Импорт категорий из Ozon</strong></p>' +
                    '<p>Нажмите кнопку "Импорт категорий" в заголовке окна для начала импорта.</p>' +
                    '<p>Импорт загрузит все категории из API Ozon и сохранит их в таблицу <code>o_categories</code>.</p>' +
                    '<p id="ozon-import-status" style="margin-top: 20px; padding: 10px; background: #f5f5f5; border-radius: 4px; display: none;"></p>' +
                    '</div>'
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Импорт товаров из Ozon',
                width: 700,
                height: 500,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 150,
                y: 50,
                items: [infoPanel],
                tbar: [{
                    text: 'Импорт категорий',
                    iconCls: 'x-btn-icon',
                    handler: function() {
                        var btn = this;
                        btn.setDisabled(true);
                        btn.setText('Импорт выполняется...');

                        var statusDiv = document.getElementById('ozon-import-status');
                        if (statusDiv) {
                            statusDiv.style.display = 'block';
                            statusDiv.innerHTML = '<p>Запуск импорта категорий...</p>';
                        }

                        Ext.Ajax.request({
                            url: '/admin/ozon_import/?action=import_categories',
                            method: 'GET',
                            timeout: 600000, // 10 минут
                            success: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт категорий');

                                try {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: green;"><strong>✓ Импорт завершен успешно!</strong></p>' +
                                                '<p>Импортировано категорий: <strong>' + (result.count || 0) + '</strong></p>' +
                                                '<p>' + (result.message || '') + '</p>';
                                        }
                                        Ext.Msg.alert('Успех', result.message || 'Импорт завершен успешно');
                                    } else {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка импорта</strong></p>' +
                                                '<p>' + (result.message || 'Неизвестная ошибка') + '</p>';
                                        }
                                        Ext.Msg.alert('Ошибка', result.message || 'Ошибка при импорте');
                                    }
                                } catch (e) {
                                    if (statusDiv) {
                                        statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка</strong></p>' +
                                            '<p>Не удалось обработать ответ сервера</p>';
                                    }
                                    Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                }
                            },
                            failure: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт категорий');

                                if (statusDiv) {
                                    statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка запроса</strong></p>' +
                                        '<p>Не удалось выполнить запрос к серверу</p>';
                                }
                                Ext.Msg.alert('Ошибка', 'Не удалось выполнить запрос к серверу');
                            }
                        });
                    }
                }, {
                    text: 'Импорт товаров',
                    iconCls: 'x-btn-icon',
                    handler: function() {
                        var btn = this;
                        btn.setDisabled(true);
                        btn.setText('Импорт выполняется...');

                        var statusDiv = document.getElementById('ozon-import-status');
                        if (statusDiv) {
                            statusDiv.style.display = 'block';
                            statusDiv.innerHTML = '<p>Запуск импорта товаров...</p>';
                        }

                        Ext.Msg.confirm('Подтверждение',
                            'Внимание! Импорт товаров может занять длительное время. Продолжить?',
                            function(confirmBtn) {
                                if (confirmBtn === 'yes') {
                                    Ext.Ajax.request({
                                        url: '/admin/ozon_import/?action=import_products',
                                        method: 'GET',
                                        timeout: 600000, // 10 минут
                                        success: function(response) {
                                            btn.setDisabled(false);
                                            btn.setText('Импорт товаров');

                                            try {
                                                var result = Ext.decode(response.responseText);
                                                if (result.success) {
                                                    if (statusDiv) {
                                                        statusDiv.innerHTML = '<p style="color: green;"><strong>✓ Импорт завершен успешно!</strong></p>' +
                                                            '<p>Импортировано товаров: <strong>' + (result.count || 0) + '</strong></p>' +
                                                            '<p>Обработано батчей: <strong>' + (result.batches || 0) + '</strong></p>' +
                                                            '<p>' + (result.message || '') + '</p>';
                                                    }
                                                    Ext.Msg.alert('Успех', result.message || 'Импорт завершен успешно');
                                                } else {
                                                    if (statusDiv) {
                                                        statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка импорта</strong></p>' +
                                                            '<p>' + (result.message || 'Неизвестная ошибка') + '</p>';
                                                    }
                                                    Ext.Msg.alert('Ошибка', result.message || 'Ошибка при импорте');
                                                }
                                            } catch (e) {
                                                if (statusDiv) {
                                                    statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка</strong></p>' +
                                                        '<p>Не удалось обработать ответ сервера</p>';
                                                }
                                                Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                            }
                                        },
                                        failure: function(response) {
                                            btn.setDisabled(false);
                                            btn.setText('Импорт товаров');

                                            if (statusDiv) {
                                                statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка запроса</strong></p>' +
                                                    '<p>Не удалось выполнить запрос к серверу</p>';
                                            }
                                            Ext.Msg.alert('Ошибка', 'Не удалось выполнить запрос к серверу');
                                        }
                                    });
                                } else {
                                    btn.setDisabled(false);
                                    btn.setText('Импорт товаров');
                                }
                            }
                        );
                    }
                }, {
                    text: 'Импорт названий атрибутов',
                    iconCls: 'x-btn-icon',
                    handler: function() {
                        var btn = this;
                        btn.setDisabled(true);
                        btn.setText('Импорт выполняется...');

                        var statusDiv = document.getElementById('ozon-import-status');
                        if (statusDiv) {
                            statusDiv.style.display = 'block';
                            statusDiv.innerHTML = '<p>Запуск импорта названий атрибутов...</p>';
                        }

                        Ext.Ajax.request({
                            url: '/admin/ozon_import/?action=import_attr_names',
                            method: 'GET',
                            timeout: 600000, // 10 минут
                            success: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт названий атрибутов');

                                try {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: green;"><strong>✓ Импорт завершен успешно!</strong></p>' +
                                                '<p>Импортировано названий атрибутов: <strong>' + (result.count || 0) + '</strong></p>' +
                                                '<p>Пропущено: <strong>' + (result.skipped || 0) + '</strong></p>' +
                                                '<p>' + (result.message || '') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Успех', result.message || 'Импорт завершен успешно');
                                    } else {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка импорта</strong></p>' +
                                                '<p>' + (result.message || 'Неизвестная ошибка') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Ошибка', result.message || 'Ошибка при импорте');
                                    }
                                } catch (e) {
                                    if (statusDiv) {
                                        statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка</strong></p>' +
                                            '<p>Не удалось обработать ответ сервера</p>';
                                    }
                                    Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                }
                            },
                            failure: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт названий атрибутов');

                                if (statusDiv) {
                                    statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка запроса</strong></p>' +
                                        '<p>Не удалось выполнить запрос к серверу</p>';
                                }
                                Ext.Msg.alert('Ошибка', 'Не удалось выполнить запрос к серверу');
                            }
                        });
                    }
                }, {
                    text: 'Импорт отзывов',
                    iconCls: 'x-btn-icon',
                    handler: function() {
                        var btn = this;
                        btn.setDisabled(true);
                        btn.setText('Импорт выполняется...');

                        var statusDiv = document.getElementById('ozon-import-status');
                        if (statusDiv) {
                            statusDiv.style.display = 'block';
                            statusDiv.innerHTML = '<p>Запуск импорта отзывов...</p>';
                        }

                        Ext.Ajax.request({
                            url: '/admin/ozon_import/?action=import_reviews',
                            method: 'GET',
                            timeout: 600000, // 10 минут
                            success: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт отзывов');

                                try {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: green;"><strong>✓ Импорт завершен успешно!</strong></p>' +
                                                '<p>Импортировано отзывов: <strong>' + (result.count || 0) + '</strong></p>' +
                                                '<p>Пропущено: <strong>' + (result.skipped || 0) + '</strong></p>' +
                                                '<p>Обработано страниц: <strong>' + (result.pages || 0) + '</strong></p>' +
                                                '<p>' + (result.message || '') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Успех', result.message || 'Импорт завершен успешно');
                                    } else {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка импорта</strong></p>' +
                                                '<p>' + (result.message || 'Неизвестная ошибка') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Ошибка', result.message || 'Ошибка при импорте');
                                    }
                                } catch (e) {
                                    if (statusDiv) {
                                        statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка</strong></p>' +
                                            '<p>Не удалось обработать ответ сервера</p>';
                                    }
                                    Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                }
                            },
                            failure: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт отзывов');

                                if (statusDiv) {
                                    statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка запроса</strong></p>' +
                                        '<p>Не удалось выполнить запрос к серверу</p>';
                                }
                                Ext.Msg.alert('Ошибка', 'Не удалось выполнить запрос к серверу');
                            }
                        });
                    }
                }, {
                    text: 'Импорт изображений',
                    iconCls: 'x-btn-icon',
                    handler: function() {
                        var btn = this;
                        btn.setDisabled(true);
                        btn.setText('Импорт выполняется...');

                        var statusDiv = document.getElementById('ozon-import-status');
                        if (statusDiv) {
                            statusDiv.style.display = 'block';
                            statusDiv.innerHTML = '<p>Запуск импорта изображений...</p>';
                        }

                        Ext.Ajax.request({
                            url: '/admin/ozon_import/?action=import_images',
                            method: 'GET',
                            timeout: 1800000, // 30 минут
                            success: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт изображений');

                                try {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: green;"><strong>✓ Импорт завершен успешно!</strong></p>' +
                                                '<p>Обработано изображений: <strong>' + (result.processed || 0) + '</strong></p>' +
                                                '<p>Успешно загружено: <strong>' + (result.success_count || 0) + '</strong></p>' +
                                                '<p>Ошибок: <strong>' + (result.error_count || 0) + '</strong></p>' +
                                                '<p>' + (result.message || '') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Успех', result.message || 'Импорт завершен успешно');
                                    } else {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка импорта</strong></p>' +
                                                '<p>' + (result.message || 'Неизвестная ошибка') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Ошибка', result.message || 'Ошибка при импорте');
                                    }
                                } catch (e) {
                                    if (statusDiv) {
                                        statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка</strong></p>' +
                                            '<p>Не удалось обработать ответ сервера</p>';
                                    }
                                    Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                }
                            },
                            failure: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт изображений');

                                if (statusDiv) {
                                    statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка запроса</strong></p>' +
                                        '<p>Не удалось выполнить запрос к серверу</p>';
                                }
                                Ext.Msg.alert('Ошибка', 'Не удалось выполнить запрос к серверу');
                            }
                        });
                    }
                }],
                listeners: {
                    close: function() {
                        delete openWindows['ozon_import'];
                        removeTaskbarButton('ozon_import');
                    },
                    activate: function() {
                        setActiveWindow('ozon_import');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-ozon_import');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                }
            });

            openWindows['ozon_import'] = win;
            addTaskbarButton('ozon_import', 'Импорт товаров из Ozon', win);
            win.show();
        });
    }

    // Открытие окна импорта ПВЗ из Яндекс
    function openYandexImport() {
        closeStartMenu();

        if (openWindows['yandex_import']) {
            openWindows['yandex_import'].show();
            openWindows['yandex_import'].toFront();
            return;
        }

        Ext.onReady(function() {
            // Панель с информацией
            var infoPanel = Ext.create('Ext.panel.Panel', {
                title: 'Импорт ПВЗ из Яндекс',
                region: 'center',
                layout: 'fit',
                bodyStyle: {
                    'padding': '20px',
                    'font-size': '14px'
                },
                html: '<div id="yandex-import-info" style="line-height: 1.6;">' +
                    '<p><strong>Импорт ПВЗ из Яндекс</strong></p>' +
                    '<p>Нажмите кнопку "Импорт ПВЗ" в заголовке окна для начала импорта.</p>' +
                    '<p>Импорт загрузит все пункты выдачи заказов из файла <code>/upload/response.json</code> и сохранит их в таблицу <code>points</code>.</p>' +
                    '<p id="yandex-import-status" style="margin-top: 20px; padding: 10px; background: #f5f5f5; border-radius: 4px; display: none;"></p>' +
                    '</div>'
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Импорт из Яндекс',
                width: 700,
                height: 500,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 150,
                y: 50,
                items: [infoPanel],
                tbar: [{
                    text: 'Импорт ПВЗ',
                    iconCls: 'x-btn-icon',
                    handler: function() {
                        var btn = this;
                        btn.setDisabled(true);
                        btn.setText('Импорт выполняется...');

                        var statusDiv = document.getElementById('yandex-import-status');
                        if (statusDiv) {
                            statusDiv.style.display = 'block';
                            statusDiv.innerHTML = '<p>Запуск импорта ПВЗ...</p>';
                        }

                        Ext.Ajax.request({
                            url: '/admin/yandex_import/?action=import_points',
                            method: 'GET',
                            timeout: 600000, // 10 минут
                            success: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт ПВЗ');

                                try {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: green;"><strong>✓ Импорт завершен успешно!</strong></p>' +
                                                '<p>Всего обработано: <strong>' + (result.processed || 0) + '</strong></p>' +
                                                '<p>Добавлено: <strong>' + (result.inserted || 0) + '</strong></p>' +
                                                '<p>Обновлено: <strong>' + (result.updated || 0) + '</strong></p>' +
                                                '<p>Ошибок: <strong>' + (result.errors || 0) + '</strong></p>' +
                                                '<p>' + (result.message || '') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Успех', result.message || 'Импорт завершен успешно');
                                    } else {
                                        if (statusDiv) {
                                            statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка импорта</strong></p>' +
                                                '<p>' + (result.message || 'Неизвестная ошибка') + '</p>' +
                                                (result.log_file ? '<p>Лог файл: <a href="/upload/logs/' + result.log_file + '" target="_blank">' + result.log_file + '</a></p>' : '');
                                        }
                                        Ext.Msg.alert('Ошибка', result.message || 'Ошибка при импорте');
                                    }
                                } catch (e) {
                                    if (statusDiv) {
                                        statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка</strong></p>' +
                                            '<p>Не удалось обработать ответ сервера</p>';
                                    }
                                    Ext.Msg.alert('Ошибка', 'Не удалось обработать ответ сервера');
                                }
                            },
                            failure: function(response) {
                                btn.setDisabled(false);
                                btn.setText('Импорт ПВЗ');

                                if (statusDiv) {
                                    statusDiv.innerHTML = '<p style="color: red;"><strong>✗ Ошибка запроса</strong></p>' +
                                        '<p>Не удалось выполнить запрос к серверу</p>';
                                }
                                Ext.Msg.alert('Ошибка', 'Не удалось выполнить запрос к серверу');
                            }
                        });
                    }
                }],
                listeners: {
                    close: function() {
                        delete openWindows['yandex_import'];
                        removeTaskbarButton('yandex_import');
                    },
                    activate: function() {
                        setActiveWindow('yandex_import');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-yandex_import');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                }
            });

            openWindows['yandex_import'] = win;
            addTaskbarButton('yandex_import', 'Импорт из Яндекс', win);
            win.show();
        });
    }

    // Открытие окна управления меню (страницами)
    // Реализация по образцу engine.js
    function openMenu() {
        closeStartMenu();

        if (openWindows['menu']) {
            openWindows['menu'].show();
            openWindows['menu'].toFront();
            return;
        }

        Ext.onReady(function() {
            // TreeStore для страниц
            var pagesStore = Ext.create('Ext.data.TreeStore', {
                fields: [
                    {name: 'id', type: 'int'},
                    'text',
                    'name',
                    'title',
                    {name: 'parent_id', type: 'int'},
                    {name: 'sort', type: 'int'},
                    {name: 'status', type: 'int'},
                    {name: 'leaf', type: 'boolean'}
                ],
                proxy: {
                    type: 'ajax',
                    url: '/admin/menu/?action=list_pages',
                    reader: {
                        type: 'json',
                        root: 'children'
                    }
                },
                root: {
                    text: 'Страницы',
                    id: 'root',
                    expanded: true
                },
                folderSort: false,
                autoLoad: true
            });

            // Функция получения порядка дочерних узлов (как getParentOrder в engine.js)
            var getParentOrder = function(node) {
                var order = [];
                if (node && node.parentNode) {
                    node.parentNode.eachChild(function(child) {
                        var childId = null;
                        if (child.getId) {
                            childId = parseInt(child.getId(), 10);
                        } else if (child.get) {
                            childId = parseInt(child.get('id'), 10);
                        } else if (child.id) {
                            childId = parseInt(child.id, 10);
                        }
                        if (childId && !isNaN(childId)) {
                            order.push(childId);
                        }
                    });
                }
                return Ext.encode(order);
            };

            // Tree Panel для страниц с drag-and-drop
            var treePanel = Ext.create('Ext.tree.Panel', {
                title: 'Страницы',
                region: 'west',
                width: 350,
                split: true,
                useArrows: true,
                rootVisible: false,
                animate: true,
                enableDD: true,
                containerScroll: true,
                store: pagesStore,
                viewConfig: {
                    plugins: {
                        ptype: 'treeviewdragdrop',
                        containerScroll: true,
                        allowParentInserts: true,
                        expandDelay: 200
                    },
                    listeners: {
                        // При drop на узел - определяем куда перемещать
                        beforedrop: function(node, data, overModel, dropPosition, dropHandlers) {
                            var draggedNode = data.records[0];
                            var targetId = overModel ? parseInt(overModel.getId(), 10) : 0;

                            // Родитель перетаскиваемого узла
                            var draggedParentId = draggedNode.parentNode ? draggedNode.parentNode.getId() : 'root';
                            // Родитель целевого узла
                            var targetParentId = overModel && overModel.parentNode ? overModel.parentNode.getId() : 'root';

                            // Если целевой узел на КОРНЕВОМ уровне - разрешаем sibling
                            // (чтобы можно было вынести страницу на верхний уровень)
                            if (targetParentId === 'root') {
                                return true; // Стандартное поведение
                            }

                            // Если перетаскиваем на ВЛОЖЕННЫЙ узел из ДРУГОГО родителя и позиция before/after -
                            // принудительно делаем append (внутрь), а не sibling
                            if ((dropPosition === 'before' || dropPosition === 'after') &&
                                targetId > 0 &&
                                draggedParentId !== targetParentId) {

                                // Отменяем стандартный drop
                                dropHandlers.cancelDrop();

                                // Делаем целевой узел не-листом (папкой)
                                overModel.set('leaf', false);

                                // Перемещаем узел внутрь целевого
                                overModel.appendChild(draggedNode);

                                // Раскрываем родительский узел чтобы показать дочерний
                                overModel.expand();

                                // Сохраняем на сервер
                                var nodeId = parseInt(draggedNode.getId(), 10);
                                var newParentId = targetId;
                                var order = [];
                                overModel.eachChild(function(child) {
                                    var childId = parseInt(child.getId(), 10);
                                    if (childId && !isNaN(childId)) {
                                        order.push(childId);
                                    }
                                });

                                Ext.Ajax.request({
                                    url: '/admin/menu/?action=saveOrder',
                                    method: 'POST',
                                    params: {
                                        node_id: nodeId,
                                        parent_id: newParentId,
                                        order: Ext.encode(order)
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить');
                                        pagesStore.load();
                                    }
                                });

                                return false;
                            }

                            return true;
                        }
                    }
                },
                tbar: [{
                    text: 'Добавить',
                    iconCls: 'icon-add',
                    handler: function() {
                        showPageFormForNode(null, null);
                    }
                }, '-', {
                    text: 'Подстраница',
                    handler: function() {
                        var selection = treePanel.getSelectionModel().getSelection();
                        if (!selection || selection.length === 0) {
                            Ext.Msg.alert('Ошибка', 'Выберите страницу');
                            return;
                        }
                        var node = selection[0];
                        var parentId = node.getId ? parseInt(node.getId(), 10) : parseInt(node.id, 10);
                        if (!parentId || isNaN(parentId)) {
                            Ext.Msg.alert('Ошибка', 'Не удалось определить ID страницы');
                            return;
                        }
                        showPageFormForNode(null, parentId);
                    }
                }, '-', {
                    text: 'Удалить',
                    iconCls: 'icon-delete',
                    handler: function() {
                        var selection = treePanel.getSelectionModel().getSelection();
                        if (!selection || selection.length === 0) {
                            Ext.Msg.alert('Ошибка', 'Выберите страницу для удаления');
                            return;
                        }
                        deletePageNode(selection[0]);
                    }
                }, '->', {
                    text: 'Обновить',
                    iconCls: 'icon-refresh',
                    handler: function() {
                        pagesStore.load();
                    }
                }],
                listeners: {
                    itemclick: function(view, record) {
                        var nodeId = record.getId ? parseInt(record.getId(), 10) : parseInt(record.id, 10);
                        if (nodeId && !isNaN(nodeId)) {
                            loadPageContent(nodeId);
                        }
                    },
                    // Контекстное меню (правый клик)
                    itemcontextmenu: function(view, record, item, index, e) {
                        e.stopEvent();

                        var nodeId = parseInt(record.getId(), 10);
                        var parentNode = record.parentNode;
                        var isRoot = !parentNode || parentNode.getId() === 'root';

                        var menuItems = [];

                        // Опция "На верхний уровень" - только если страница не на верхнем уровне
                        if (!isRoot) {
                            menuItems.push({
                                text: 'На верхний уровень',
                                iconCls: 'icon-arrow-up',
                                handler: function() {
                                    // Перемещаем на корневой уровень
                                    var rootNode = pagesStore.getRootNode();

                                    // Удаляем из текущего родителя
                                    record.parentNode.removeChild(record);

                                    // Добавляем в корень
                                    rootNode.appendChild(record);

                                    // Получаем порядок корневых узлов
                                    var order = [];
                                    rootNode.eachChild(function(child) {
                                        var childId = parseInt(child.getId(), 10);
                                        if (childId && !isNaN(childId)) {
                                            order.push(childId);
                                        }
                                    });

                                    // Сохраняем на сервер
                                    Ext.Ajax.request({
                                        url: '/admin/menu/?action=saveOrder',
                                        method: 'POST',
                                        params: {
                                            node_id: nodeId,
                                            parent_id: 0,
                                            order: Ext.encode(order)
                                        },
                                        success: function(response) {
                                            var result = Ext.decode(response.responseText);
                                            if (!result.success) {
                                                Ext.Msg.alert('Ошибка', result.message || 'Не удалось переместить');
                                                pagesStore.load();
                                            }
                                        },
                                        failure: function() {
                                            Ext.Msg.alert('Ошибка', 'Не удалось переместить');
                                            pagesStore.load();
                                        }
                                    });
                                }
                            });
                            menuItems.push('-');
                        }

                        // Удалить
                        menuItems.push({
                            text: 'Удалить',
                            iconCls: 'icon-delete',
                            handler: function() {
                                deletePageNode(record);
                            }
                        });

                        var contextMenu = Ext.create('Ext.menu.Menu', {
                            items: menuItems
                        });
                        contextMenu.showAt(e.getXY());
                    },
                    // Событие при перемещении узла (drag-and-drop)
                    itemmove: function(node, oldParent, newParent, index, eOpts) {
                        var nodeId = parseInt(node.getId(), 10);

                        // ID нового родителя (0 для корня)
                        var newParentId = 0;
                        if (newParent && newParent.getId() !== 'root') {
                            newParentId = parseInt(newParent.getId(), 10);
                        }
                        if (isNaN(newParentId)) newParentId = 0;

                        // Порядок дочерних узлов нового родителя
                        var order = [];
                        if (newParent && newParent.eachChild) {
                            newParent.eachChild(function(child) {
                                var childId = parseInt(child.getId(), 10);
                                if (childId && !isNaN(childId)) {
                                    order.push(childId);
                                }
                            });
                        }

                        // Сохраняем на сервер
                        Ext.Ajax.request({
                            url: '/admin/menu/?action=saveOrder',
                            method: 'POST',
                            params: {
                                node_id: nodeId,
                                parent_id: newParentId,
                                order: Ext.encode(order)
                            },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (!result.success && result.message) {
                                    Ext.Msg.alert('Ошибка', result.message);
                                    pagesStore.load();
                                }
                            },
                            failure: function() {
                                Ext.Msg.alert('Ошибка', 'Не удалось сохранить порядок');
                                pagesStore.load();
                            }
                        });
                    }
                }
            });

            // Функция показа формы для создания страницы
            function showPageFormForNode(node, parentId) {
                // Функция сохранения страницы
                var savePage = function(form) {
                    if (form.isValid()) {
                        var values = form.getValues();
                        values.parent_id = parentId || '';

                        Ext.Ajax.request({
                            url: '/admin/menu/?action=create',
                            method: 'POST',
                            params: values,
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (result.success) {
                                    formWindow.close();
                                    pagesStore.load();
                                } else {
                                    Ext.Msg.alert('Ошибка', result.message);
                                }
                            }
                        });
                    }
                };

                var formWindow = Ext.create('Ext.window.Window', {
                    title: 'Создать страницу',
                    width: 400,
                    modal: true,
                    layout: 'fit',
                    defaultFocus: 'nameField', // Автофокус на поле названия
                    items: [{
                        xtype: 'form',
                        padding: 10,
                        defaults: {
                            anchor: '100%',
                            labelWidth: 100,
                            enableKeyEvents: true,
                            listeners: {
                                // Сохранение по Enter
                                specialkey: function(field, e) {
                                    if (e.getKey() === e.ENTER) {
                                        savePage(field.up('form').getForm());
                                    }
                                }
                            }
                        },
                        items: [{
                            xtype: 'textfield',
                            itemId: 'nameField',
                            name: 'name',
                            fieldLabel: 'Название',
                            allowBlank: false
                        }, {
                            xtype: 'textfield',
                            name: 'title',
                            fieldLabel: 'Заголовок'
                        }],
                        buttons: [{
                            text: 'Отмена',
                            handler: function() {
                                formWindow.close();
                            }
                        }, {
                            text: 'Создать',
                            formBind: true,
                            handler: function() {
                                savePage(this.up('form').getForm());
                            }
                        }]
                    }],
                    listeners: {
                        // Дополнительно устанавливаем фокус после показа окна
                        show: function(win) {
                            var nameField = win.down('#nameField');
                            if (nameField) {
                                nameField.focus(false, 100);
                            }
                        }
                    }
                });
                formWindow.show();
            }

            // Функция удаления страницы
            function deletePageNode(node) {
                var nodeId = null;
                if (node.getId) {
                    nodeId = parseInt(node.getId(), 10);
                } else if (node.get) {
                    nodeId = parseInt(node.get('id'), 10);
                } else if (node.id) {
                    nodeId = parseInt(node.id, 10);
                }

                if (!nodeId || isNaN(nodeId)) {
                    Ext.Msg.alert('Ошибка', 'Не удалось определить ID страницы');
                    return;
                }

                var nodeName = (node.get && node.get('text')) || (node.data && node.data.name) || 'страницу';

                Ext.Msg.confirm('Подтверждение', 'Удалить страницу "' + nodeName + '"?', function(btn) {
                    if (btn === 'yes') {
                        Ext.Ajax.request({
                            url: '/admin/menu/?action=delete',
                            method: 'POST',
                            params: { id: nodeId },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (result.success) {
                                    pagesStore.load();
                                    var container = Ext.getCmp('page-editor-container');
                                    if (container) {
                                        container.update('<div style="padding: 20px; text-align: center; color: #999;">Выберите страницу для редактирования</div>');
                                    }
                                } else {
                                    Ext.Msg.alert('Ошибка', result.message);
                                }
                            }
                        });
                    }
                });
            }

            // WYSIWYG редактор для содержимого страницы
            var editorPanel = Ext.create('Ext.panel.Panel', {
                title: 'Редактирование страницы',
                region: 'center',
                layout: 'fit',
                id: 'page-editor-container',
                bodyStyle: 'background: #f5f5f5;',
                html: '<div style="padding: 40px; text-align: center; color: #999; font-size: 14px;">Выберите страницу для редактирования</div>'
            });

            // Флаг для предотвращения двойного вызова loadPageContent
            var isLoadingPage = false;

            // Функция загрузки содержимого страницы
            function loadPageContent(pageId) {
                var pageIdNum = parseInt(pageId, 10);
                if (!pageIdNum || isNaN(pageIdNum) || pageIdNum <= 0) {
                    return;
                }

                if (isLoadingPage) return;
                isLoadingPage = true;

                Ext.Ajax.request({
                    url: '/admin/menu/?action=get_page',
                    method: 'GET',
                    params: { id: pageIdNum },
                    success: function(response) {
                        isLoadingPage = false;
                        var result = Ext.decode(response.responseText);
                        if (result.success && result.data) {
                            showPageEditor(result.data, pagesStore);
                        } else {
                            // Ошибка загрузки страницы
                            Ext.Msg.alert('Ошибка', result.message || 'Не удалось загрузить страницу');
                        }
                    },
                    failure: function(response) {
                        isLoadingPage = false;
                        // AJAX ошибка при загрузке страницы
                        Ext.Msg.alert('Ошибка', 'Не удалось загрузить страницу. Проверьте консоль для деталей.');
                    }
                });
            }

            // Функция отображения редактора страницы
            function showPageEditor(pageData, store) {
                var container = Ext.getCmp('page-editor-container');
                if (!container) return;

                // Обновляем заголовок с ID страницы
                container.setTitle('Редактирование страницы #' + pageData.id);

                // Удаляем предыдущий редактор, если есть
                container.removeAll();

                // Создаем форму редактирования
                var form = Ext.create('Ext.form.Panel', {
                    layout: {
                        type: 'vbox',
                        align: 'stretch'
                    },
                    bodyPadding: 10,
                    items: [{
                        xtype: 'hidden',
                        name: 'id',
                        value: pageData.id
                    }, {
                        xtype: 'textfield',
                        name: 'name',
                        fieldLabel: 'Название',
                        value: pageData.name,
                        allowBlank: false,
                        labelWidth: 80
                    }, {
                        xtype: 'textfield',
                        name: 'title',
                        fieldLabel: 'Заголовок',
                        value: pageData.title || '',
                        labelWidth: 80
                    }, {
                        xtype: 'htmleditor',
                        name: 'content',
                        fieldLabel: 'Содержимое',
                        value: pageData.content || '',
                        flex: 1,
                        labelWidth: 80,
                        labelAlign: 'top'
                    }],
                    buttons: [{
                        text: 'Сохранить',
                        handler: function() {
                            var form = this.up('form').getForm();
                            if (form.isValid()) {
                                var values = form.getValues();

                                // Используем parent_id из данных страницы
                                values.parent_id = pageData.parent_id || null;

                                Ext.Ajax.request({
                                    url: '/admin/menu/?action=update',
                                    method: 'POST',
                                    params: values,
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (result.success) {
                                            Ext.Msg.alert('Успех', result.message);
                                            // Обновляем название в дереве
                                            var node = treePanel.getNodeById(pageData.id);
                                            if (node) {
                                                node.set('text', values.name);
                                                node.set('name', values.name);
                                                node.set('title', values.title);
                                            }
                                            // Перезагружаем дерево для обновления структуры
                                            pagesStore.load();
                                        } else {
                                            Ext.Msg.alert('Ошибка', result.message);
                                        }
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить страницу');
                                    }
                                });
                            }
                        }
                    }]
                });

                container.add(form);
                container.doLayout();
            }

            // Форма добавления/редактирования страницы
            function showPageForm(record, store, parentId) {
                var isEdit = record !== null;
                var formWindow = Ext.create('Ext.window.Window', {
                    title: isEdit ? 'Редактировать страницу' : 'Добавить страницу',
                    width: 500,
                    modal: true,
                    layout: 'fit',
                    items: [{
                        xtype: 'form',
                        padding: 10,
                        defaults: {
                            anchor: '100%',
                            labelWidth: 120
                        },
                        items: [
                            // Поле ID только при редактировании (скрыто при создании)
                            isEdit ? {
                                xtype: 'textfield',
                                name: 'id',
                                fieldLabel: 'ID',
                                value: record.get('id'),
                                readOnly: true
                            } : null,
                            {
                                xtype: 'textfield',
                                name: 'name',
                                fieldLabel: 'Название',
                                allowBlank: false,
                                value: isEdit ? record.get('name') : ''
                            },
                            {
                                xtype: 'textfield',
                                name: 'title',
                                fieldLabel: 'Заголовок',
                                value: isEdit ? record.get('title') : ''
                            },
                            {
                                xtype: 'numberfield',
                                name: 'sort',
                                fieldLabel: 'Порядок',
                                value: isEdit ? record.get('sort') : 0,
                                minValue: 0
                            },
                            {
                                xtype: 'checkbox',
                                name: 'status',
                                fieldLabel: 'Активна',
                                checked: isEdit ? record.get('status') : true,
                                inputValue: 1,
                                uncheckedValue: 0
                            }
                        ],
                        buttons: [{
                            text: 'Отмена',
                            handler: function() {
                                formWindow.close();
                            }
                        }, {
                            text: 'Сохранить',
                            formBind: true,
                            handler: function() {
                                var form = this.up('form').getForm();
                                if (form.isValid()) {
                                    var values = form.getValues();
                                    var url = isEdit ? '/admin/menu/?action=update' : '/admin/menu/?action=create';

                                    if (!isEdit) {
                                        // Используем переданный parentId или null
                                        values.parent_id = (parentId !== null && parentId !== undefined && parentId !== '') ? parentId : null;
                                        values.content = '';
                                        // Удаляем ID при создании (будет сгенерирован автоматически)
                                        delete values.id;
                                    }

                                    Ext.Ajax.request({
                                        url: url,
                                        method: 'POST',
                                        params: values,
                                        success: function(response) {
                                            var result = Ext.decode(response.responseText);
                                            if (result.success) {
                                                Ext.Msg.alert('Успех', result.message);
                                                formWindow.close();

                                                if (!isEdit && result.data) {
                                                    // Сохраняем ID созданной страницы
                                                    var newPageId = result.data.id;

                                                    // Отладочная информация

                                                    // Проверяем, что ID существует и является числом
                                                    if (newPageId === undefined || newPageId === null || newPageId === '') {
                                                        // Ошибка: ID страницы не получен
                                                        Ext.Msg.alert('Предупреждение', 'Страница создана, но ID не получен. Дерево будет перезагружено.');
                                                        pagesStore.load();
                                                        return;
                                                    }

                                                    // Преобразуем в число
                                                    newPageId = parseInt(newPageId, 10);

                                                    if (isNaN(newPageId) || newPageId <= 0) {
                                                        // Ошибка: ID страницы некорректен
                                                        Ext.Msg.alert('Предупреждение', 'Страница создана, но ID некорректен. Дерево будет перезагружено.');
                                                        pagesStore.load();
                                                        return;
                                                    }


                                                    // Перезагружаем дерево и после загрузки выбираем новую страницу
                                                    pagesStore.load({
                                                        callback: function(records, operation, success) {
                                                            if (success) {
                                                                // Ищем созданную страницу в дереве
                                                                var findNode = function(node, targetId) {
                                                                    // Приводим оба значения к числу для корректного сравнения
                                                                    var nodeId = parseInt(node.get('id'), 10);
                                                                    var targetIdNum = parseInt(targetId, 10);
                                                                    if (!isNaN(nodeId) && !isNaN(targetIdNum) && nodeId === targetIdNum) {
                                                                        return node;
                                                                    }
                                                                    var children = node.childNodes;
                                                                    if (children) {
                                                                        for (var i = 0; i < children.length; i++) {
                                                                            var found = findNode(children[i], targetId);
                                                                            if (found) {
                                                                                return found;
                                                                            }
                                                                        }
                                                                    }
                                                                    return null;
                                                                };

                                                                var rootNode = pagesStore.getRootNode();
                                                                var newNode = findNode(rootNode, newPageId);

                                                                if (newNode) {
                                                                    // Раскрываем путь к узлу
                                                                    var parent = newNode.parentNode;
                                                                    while (parent && parent !== rootNode) {
                                                                        parent.expand();
                                                                        parent = parent.parentNode;
                                                                    }

                                                                    // Временно отключаем события выбора, чтобы не вызвать selectionchange
                                                                    treePanel.getSelectionModel().suspendEvents();

                                                                    // Выбираем узел
                                                                    treePanel.getSelectionModel().select(newNode);

                                                                    // Включаем события обратно
                                                                    treePanel.getSelectionModel().resumeEvents();

                                                                    // Автоматически загружаем содержимое страницы напрямую
                                                                    // (не через selectionchange, чтобы избежать двойного вызова)
                                                                    loadPageContent(newPageId);
                                                                }
                                                            }
                                                        }
                                                    });
                                                } else {
                                                    // Просто перезагружаем дерево при редактировании
                                                    pagesStore.load();
                                                }
                                            } else {
                                                Ext.Msg.alert('Ошибка', result.message);
                                            }
                                        },
                                        failure: function() {
                                            Ext.Msg.alert('Ошибка', 'Не удалось сохранить страницу');
                                        }
                                    });
                                }
                            }
                        }]
                    }]
                });

                formWindow.show();
            }

            // Удаление страницы
            function deletePage(record, store) {
                Ext.Msg.confirm('Подтверждение', 'Вы уверены, что хотите удалить страницу "' + record.get('name') + '"?', function(btn) {
                    if (btn === 'yes') {
                        Ext.Ajax.request({
                            url: '/admin/menu/?action=delete',
                            method: 'POST',
                            params: {
                                id: record.get('id')
                            },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (result.success) {
                                    Ext.Msg.alert('Успех', result.message);
                                    store.load();
                                    // Очищаем редактор
                                    var container = Ext.getCmp('page-editor-container');
                                    if (container) {
                                        container.removeAll();
                                        container.update('<div style="padding: 20px; text-align: center; color: #999;">Выберите страницу для редактирования</div>');
                                    }
                                } else {
                                    Ext.Msg.alert('Ошибка', result.message);
                                }
                            },
                            failure: function() {
                                Ext.Msg.alert('Ошибка', 'Не удалось удалить страницу');
                            }
                        });
                    }
                });
            }

            var win = Ext.create('Ext.window.Window', {
                title: 'Управление меню (страницы)',
                width: 1200,
                height: 700,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 50,
                y: 30,
                items: [treePanel, editorPanel],
                listeners: {
                    close: function() {
                        delete openWindows['menu'];
                        removeTaskbarButton('menu');
                    },
                    activate: function() {
                        setActiveWindow('menu');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-menu');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                }
            });

            openWindows['menu'] = win;
            addTaskbarButton('menu', 'Управление меню', win);
            win.show();
        });
    }

    // Открытие окна управления обзорами продукции
    function openReviews() {
        closeStartMenu();

        if (openWindows['reviews']) {
            openWindows['reviews'].show();
            openWindows['reviews'].toFront();
            return;
        }

        Ext.onReady(function() {
            // TreeStore для обзоров
            var reviewsStore = Ext.create('Ext.data.TreeStore', {
                fields: [
                    {name: 'id', type: 'int'},
                    'text',
                    'name',
                    'title',
                    {name: 'parent_id', type: 'int'},
                    {name: 'sort', type: 'int'},
                    {name: 'status', type: 'int'},
                    {name: 'leaf', type: 'boolean'}
                ],
                proxy: {
                    type: 'ajax',
                    url: '/admin/reviews/?action=list_reviews',
                    reader: {
                        type: 'json',
                        root: 'children'
                    }
                },
                root: {
                    text: 'Обзоры продукции',
                    id: 'root',
                    expanded: true
                },
                folderSort: false,
                autoLoad: true
            });

            // Функция получения порядка дочерних узлов
            var getParentOrder = function(node) {
                var order = [];
                if (node && node.parentNode) {
                    node.parentNode.eachChild(function(child) {
                        var childId = null;
                        if (child.getId) {
                            childId = parseInt(child.getId(), 10);
                        } else if (child.get) {
                            childId = parseInt(child.get('id'), 10);
                        } else if (child.id) {
                            childId = parseInt(child.id, 10);
                        }
                        if (childId && !isNaN(childId)) {
                            order.push(childId);
                        }
                    });
                }
                return Ext.encode(order);
            };

            // Tree Panel для обзоров с drag-and-drop
            var treePanel = Ext.create('Ext.tree.Panel', {
                title: 'Обзоры',
                region: 'west',
                width: 350,
                split: true,
                useArrows: true,
                rootVisible: false,
                animate: true,
                enableDD: true,
                containerScroll: true,
                store: reviewsStore,
                viewConfig: {
                    plugins: {
                        ptype: 'treeviewdragdrop',
                        containerScroll: true,
                        allowParentInserts: true,
                        expandDelay: 200
                    },
                    listeners: {
                        beforedrop: function(node, data, overModel, dropPosition, dropHandlers) {
                            var draggedNode = data.records[0];
                            var targetId = overModel ? parseInt(overModel.getId(), 10) : 0;

                            var draggedParentId = draggedNode.parentNode ? draggedNode.parentNode.getId() : 'root';
                            var targetParentId = overModel && overModel.parentNode ? overModel.parentNode.getId() : 'root';

                            if (targetParentId === 'root') {
                                return true;
                            }

                            if ((dropPosition === 'before' || dropPosition === 'after') &&
                                targetId > 0 &&
                                draggedParentId !== targetParentId) {

                                dropHandlers.cancelDrop();
                                overModel.set('leaf', false);
                                overModel.appendChild(draggedNode);
                                overModel.expand();

                                var nodeId = parseInt(draggedNode.getId(), 10);
                                var newParentId = targetId;
                                var order = [];
                                overModel.eachChild(function(child) {
                                    var childId = parseInt(child.getId(), 10);
                                    if (childId && !isNaN(childId)) {
                                        order.push(childId);
                                    }
                                });

                                Ext.Ajax.request({
                                    url: '/admin/reviews/?action=saveOrder',
                                    method: 'POST',
                                    params: {
                                        node_id: nodeId,
                                        parent_id: newParentId,
                                        order: Ext.encode(order)
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить');
                                        reviewsStore.load();
                                    }
                                });

                                return false;
                            }

                            return true;
                        }
                    }
                },
                tbar: [{
                    text: 'Добавить',
                    iconCls: 'icon-add',
                    handler: function() {
                        showReviewFormForNode(null, null);
                    }
                }, '-', {
                    text: 'Подобзор',
                    handler: function() {
                        var selection = treePanel.getSelectionModel().getSelection();
                        if (!selection || selection.length === 0) {
                            Ext.Msg.alert('Ошибка', 'Выберите обзор');
                            return;
                        }
                        var node = selection[0];
                        var parentId = node.getId ? parseInt(node.getId(), 10) : parseInt(node.id, 10);
                        if (!parentId || isNaN(parentId)) {
                            Ext.Msg.alert('Ошибка', 'Не удалось определить ID обзора');
                            return;
                        }
                        showReviewFormForNode(null, parentId);
                    }
                }, '-', {
                    text: 'Удалить',
                    iconCls: 'icon-delete',
                    handler: function() {
                        var selection = treePanel.getSelectionModel().getSelection();
                        if (!selection || selection.length === 0) {
                            Ext.Msg.alert('Ошибка', 'Выберите обзор для удаления');
                            return;
                        }
                        deleteReviewNode(selection[0]);
                    }
                }, '->', {
                    text: 'Обновить',
                    iconCls: 'icon-refresh',
                    handler: function() {
                        reviewsStore.load();
                    }
                }],
                listeners: {
                    itemclick: function(view, record) {
                        var nodeId = record.getId ? parseInt(record.getId(), 10) : parseInt(record.id, 10);
                        if (nodeId && !isNaN(nodeId)) {
                            loadReviewContent(nodeId);
                        }
                    },
                    itemcontextmenu: function(view, record, item, index, e) {
                        e.stopEvent();

                        var nodeId = parseInt(record.getId(), 10);
                        var parentNode = record.parentNode;
                        var isRoot = !parentNode || parentNode.getId() === 'root';

                        var menuItems = [];

                        if (!isRoot) {
                            menuItems.push({
                                text: 'На верхний уровень',
                                iconCls: 'icon-arrow-up',
                                handler: function() {
                                    var rootNode = reviewsStore.getRootNode();
                                    record.parentNode.removeChild(record);
                                    rootNode.appendChild(record);

                                    var order = [];
                                    rootNode.eachChild(function(child) {
                                        var childId = parseInt(child.getId(), 10);
                                        if (childId && !isNaN(childId)) {
                                            order.push(childId);
                                        }
                                    });

                                    Ext.Ajax.request({
                                        url: '/admin/reviews/?action=saveOrder',
                                        method: 'POST',
                                        params: {
                                            node_id: nodeId,
                                            parent_id: 0,
                                            order: Ext.encode(order)
                                        },
                                        success: function(response) {
                                            var result = Ext.decode(response.responseText);
                                            if (!result.success) {
                                                Ext.Msg.alert('Ошибка', result.message || 'Не удалось переместить');
                                                reviewsStore.load();
                                            }
                                        },
                                        failure: function() {
                                            Ext.Msg.alert('Ошибка', 'Не удалось переместить');
                                            reviewsStore.load();
                                        }
                                    });
                                }
                            });
                            menuItems.push('-');
                        }

                        menuItems.push({
                            text: 'Удалить',
                            iconCls: 'icon-delete',
                            handler: function() {
                                deleteReviewNode(record);
                            }
                        });

                        var contextMenu = Ext.create('Ext.menu.Menu', {
                            items: menuItems
                        });
                        contextMenu.showAt(e.getXY());
                    },
                    itemmove: function(node, oldParent, newParent, index, eOpts) {
                        var nodeId = parseInt(node.getId(), 10);
                        var newParentId = 0;
                        if (newParent && newParent.getId() !== 'root') {
                            newParentId = parseInt(newParent.getId(), 10);
                        }
                        if (isNaN(newParentId)) newParentId = 0;

                        var order = [];
                        if (newParent && newParent.eachChild) {
                            newParent.eachChild(function(child) {
                                var childId = parseInt(child.getId(), 10);
                                if (childId && !isNaN(childId)) {
                                    order.push(childId);
                                }
                            });
                        }

                        Ext.Ajax.request({
                            url: '/admin/reviews/?action=saveOrder',
                            method: 'POST',
                            params: {
                                node_id: nodeId,
                                parent_id: newParentId,
                                order: Ext.encode(order)
                            },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (!result.success && result.message) {
                                    Ext.Msg.alert('Ошибка', result.message);
                                    reviewsStore.load();
                                }
                            },
                            failure: function() {
                                Ext.Msg.alert('Ошибка', 'Не удалось сохранить порядок');
                                reviewsStore.load();
                            }
                        });
                    }
                }
            });

            // Функция показа формы для создания обзора
            function showReviewFormForNode(node, parentId) {
                var saveReview = function(form) {
                    if (form.isValid()) {
                        var values = form.getValues();
                        values.parent_id = parentId || '';

                        Ext.Ajax.request({
                            url: '/admin/reviews/?action=create',
                            method: 'POST',
                            params: values,
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (result.success) {
                                    formWindow.close();
                                    reviewsStore.load();
                                } else {
                                    Ext.Msg.alert('Ошибка', result.message);
                                }
                            }
                        });
                    }
                };

                var formWindow = Ext.create('Ext.window.Window', {
                    title: 'Создать обзор',
                    width: 400,
                    modal: true,
                    layout: 'fit',
                    defaultFocus: 'nameField',
                    items: [{
                        xtype: 'form',
                        padding: 10,
                        defaults: {
                            anchor: '100%',
                            labelWidth: 100,
                            enableKeyEvents: true,
                            listeners: {
                                specialkey: function(field, e) {
                                    if (e.getKey() === e.ENTER) {
                                        saveReview(field.up('form').getForm());
                                    }
                                }
                            }
                        },
                        items: [{
                            xtype: 'textfield',
                            itemId: 'nameField',
                            name: 'name',
                            fieldLabel: 'Название',
                            allowBlank: false
                        }, {
                            xtype: 'textfield',
                            name: 'title',
                            fieldLabel: 'Заголовок'
                        }],
                        buttons: [{
                            text: 'Отмена',
                            handler: function() {
                                formWindow.close();
                            }
                        }, {
                            text: 'Создать',
                            formBind: true,
                            handler: function() {
                                saveReview(this.up('form').getForm());
                            }
                        }]
                    }],
                    listeners: {
                        show: function(win) {
                            var nameField = win.down('#nameField');
                            if (nameField) {
                                nameField.focus(false, 100);
                            }
                        }
                    }
                });
                formWindow.show();
            }

            // Функция удаления обзора
            function deleteReviewNode(node) {
                var nodeId = null;
                if (node.getId) {
                    nodeId = parseInt(node.getId(), 10);
                } else if (node.get) {
                    nodeId = parseInt(node.get('id'), 10);
                } else if (node.id) {
                    nodeId = parseInt(node.id, 10);
                }

                if (!nodeId || isNaN(nodeId)) {
                    Ext.Msg.alert('Ошибка', 'Не удалось определить ID обзора');
                    return;
                }

                var nodeName = (node.get && node.get('text')) || (node.data && node.data.name) || 'обзор';

                Ext.Msg.confirm('Подтверждение', 'Удалить обзор "' + nodeName + '"?', function(btn) {
                    if (btn === 'yes') {
                        Ext.Ajax.request({
                            url: '/admin/reviews/?action=delete',
                            method: 'POST',
                            params: { id: nodeId },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (result.success) {
                                    reviewsStore.load();
                                    var container = Ext.getCmp('review-editor-container');
                                    if (container) {
                                        container.update('<div style="padding: 20px; text-align: center; color: #999;">Выберите обзор для редактирования</div>');
                                    }
                                } else {
                                    Ext.Msg.alert('Ошибка', result.message);
                                }
                            }
                        });
                    }
                });
            }

            // WYSIWYG редактор для содержимого обзора
            var editorPanel = Ext.create('Ext.panel.Panel', {
                title: 'Редактирование обзора',
                region: 'center',
                layout: 'fit',
                id: 'review-editor-container',
                bodyStyle: 'background: #f5f5f5;',
                html: '<div style="padding: 40px; text-align: center; color: #999; font-size: 14px;">Выберите обзор для редактирования</div>'
            });

            var isLoadingReview = false;

            // Функция загрузки содержимого обзора
            function loadReviewContent(reviewId) {
                var reviewIdNum = parseInt(reviewId, 10);
                if (!reviewIdNum || isNaN(reviewIdNum) || reviewIdNum <= 0) {
                    return;
                }

                if (isLoadingReview) return;
                isLoadingReview = true;

                Ext.Ajax.request({
                    url: '/admin/reviews/?action=get_review',
                    method: 'GET',
                    params: { id: reviewIdNum },
                    success: function(response) {
                        isLoadingReview = false;
                        var result = Ext.decode(response.responseText);
                        if (result.success && result.data) {
                            showReviewEditor(result.data, reviewsStore);
                        } else {
                            Ext.Msg.alert('Ошибка', result.message || 'Не удалось загрузить обзор');
                        }
                    },
                    failure: function(response) {
                        isLoadingReview = false;
                        Ext.Msg.alert('Ошибка', 'Не удалось загрузить обзор. Проверьте консоль для деталей.');
                    }
                });
            }

            // Функция отображения редактора обзора
            function showReviewEditor(reviewData, store) {
                var container = Ext.getCmp('review-editor-container');
                if (!container) return;

                container.setTitle('Редактирование обзора #' + reviewData.id);
                container.removeAll();

                // Создаем форму редактирования
                var form = Ext.create('Ext.form.Panel', {
                    layout: {
                        type: 'vbox',
                        align: 'stretch'
                    },
                    bodyPadding: 10,
                    items: [{
                        xtype: 'hidden',
                        name: 'id',
                        value: reviewData.id
                    }, {
                        xtype: 'textfield',
                        name: 'name',
                        fieldLabel: 'Название',
                        value: reviewData.name,
                        allowBlank: false,
                        labelWidth: 80
                    }, {
                        xtype: 'textfield',
                        name: 'title',
                        fieldLabel: 'Заголовок',
                        value: reviewData.title || '',
                        labelWidth: 80
                    }, {
                        xtype: 'textfield',
                        name: 'image',
                        fieldLabel: 'Изображение (URL)',
                        value: reviewData.image || '',
                        labelWidth: 80
                    }, {
                        xtype: 'htmleditor',
                        name: 'content',
                        fieldLabel: 'Текст статьи',
                        value: reviewData.content || '',
                        flex: 1,
                        labelWidth: 80,
                        labelAlign: 'top'
                    }],
                    buttons: [{
                        text: 'Сохранить',
                        handler: function() {
                            var form = this.up('form').getForm();
                            if (form.isValid()) {
                                var values = form.getValues();
                                values.parent_id = reviewData.parent_id || null;

                                Ext.Ajax.request({
                                    url: '/admin/reviews/?action=update',
                                    method: 'POST',
                                    params: values,
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (result.success) {
                                            Ext.Msg.alert('Успех', result.message);
                                            var node = treePanel.getNodeById(reviewData.id);
                                            if (node) {
                                                node.set('text', values.name);
                                                node.set('name', values.name);
                                                node.set('title', values.title);
                                            }
                                            reviewsStore.load();
                                        } else {
                                            Ext.Msg.alert('Ошибка', result.message);
                                        }
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить обзор');
                                    }
                                });
                            }
                        }
                    }]
                });

                container.add(form);
                container.doLayout();
            }

            var win = Ext.create('Ext.window.Window', {
                title: 'Обзоры продукции',
                width: 1200,
                height: 700,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 50,
                y: 30,
                items: [treePanel, editorPanel],
                listeners: {
                    close: function() {
                        delete openWindows['reviews'];
                        removeTaskbarButton('reviews');
                    },
                    activate: function() {
                        setActiveWindow('reviews');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-reviews');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                }
            });

            openWindows['reviews'] = win;
            addTaskbarButton('reviews', 'Обзоры продукции', win);
            win.show();
        });
    }

    // Открытие окна управления популярными категориями
    function openPopularCategories() {
        closeStartMenu();

        if (openWindows['popular_categories']) {
            openWindows['popular_categories'].show();
            openWindows['popular_categories'].toFront();
            return;
        }

        Ext.onReady(function() {

            // TreeStore для категорий (ExtJS 4.x)
            var categoriesTreeStore = Ext.create('Ext.data.TreeStore', {
                proxy: {
                    type: 'ajax',
                    url: '/admin/popular_categories/?action=get_tree',
                    reader: {
                        type: 'json'
                    }
                },
                root: {
                    text: 'Категории',
                    id: 'root',
                    expanded: true
                },
                autoLoad: true
            });

            // TreePanel для категорий
            var my_tree = Ext.create('Ext.tree.Panel', {
                title: 'Все категории',
                region: 'west',
                width: 350,
                split: true,
                autoScroll: true,
                animate: true,
                store: categoriesTreeStore,
                rootVisible: false,
                useArrows: true,
                viewConfig: {
                    plugins: {
                        ptype: 'treeviewdragdrop',
                        dragGroup: 'categoryToGrid',
                        enableDrop: false, // Запрещаем drop в дереве
                        copy: true // Копируем, а не перемещаем
                    },
                    listeners: {
                        // Отменяем удаление из дерева после перетаскивания
                        beforedrop: function(node, data, overModel, dropPosition, dropHandlers) {
                            // Если перетаскивание из дерева - отменяем
                            if (data.view && data.view.xtype === 'treeview') {
                                dropHandlers.cancelDrop();
                                return false;
                            }
                            return true;
                        }
                    }
                }
            });

            // Store для популярных категорий (ExtJS 4.x)
            var popular_store = Ext.create('Ext.data.Store', {
                fields: ['id', 'category_id', 'title', 'guid', 'sort', 'image'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/popular_categories/?action=get_popular',
                    reader: {
                        type: 'json',
                        root: 'rows',
                        totalProperty: 'results'
                    }
                },
                autoLoad: true
            });

            // Grid для популярных категорий (ExtJS 4.x)
            var popular_grid = Ext.create('Ext.grid.Panel', {
                title: 'Популярные категории',
                region: 'center',
                store: popular_store,
                listeners: {
                    // Используем afterrender для создания DropZone
                    afterrender: function(grid) {
                        var gridView = grid.getView();

                        // Создаём DropZone для приёма из дерева
                        var dropZone = new Ext.dd.DropZone(gridView.el, {
                            ddGroup: 'categoryToGrid',

                            getTargetFromEvent: function(e) {
                                return e.getTarget(gridView.rowSelector);
                            },

                            onNodeOver: function(target, dd, e, data) {
                                return Ext.dd.DropZone.prototype.dropAllowed;
                            },

                            onNodeDrop: function(target, dd, e, data) {
                                // Проверяем что это из дерева
                                if (data.records && data.records.length > 0) {
                                    var record = data.records[0];
                                    var categoryId = record.get('id');

                                    console.log('Adding category from tree:', categoryId);

                                    // Добавляем через API
                                    Ext.Ajax.request({
                                        url: '/admin/popular_categories/?action=add_popular',
                                        method: 'POST',
                                        params: { category_id: categoryId },
                                        success: function(response) {
                                            var result = Ext.decode(response.responseText);
                                            if (result.success) {
                                                popular_store.load();
                                            } else {
                                                Ext.MessageBox.alert('Ошибка', result.message);
                                            }
                                        },
                                        failure: function() {
                                            Ext.MessageBox.alert('Ошибка', 'Не удалось добавить категорию');
                                        }
                                    });

                                    return true;
                                }
                                return false;
                            }
                        });
                    }
                },
                columns: [
                    {
                        text: "ID",
                        width: 50,
                        dataIndex: 'category_id',
                        sortable: true
                    },
                    {
                        text: "Название категории",
                        dataIndex: 'title',
                        sortable: true,
                        flex: 1
                    },
                    {
                        text: "GUID",
                        width: 100,
                        dataIndex: 'guid',
                        sortable: true
                    },
                    {
                        text: "Изображение",
                        width: 150,
                        dataIndex: 'image',
                        renderer: function(value) {
                            if (value) {
                                return '<img src="/' + value + '" style="height: 30px; max-width: 100px;" />';
                            }
                            return 'Нет';
                        }
                    }
                ],
                tbar: [{
                    text: '↑ Вверх',
                    iconCls: 'icon-up',
                    handler: function() {
                        var selected = popular_grid.getSelectionModel().getSelection();
                        if (selected.length === 0) {
                            Ext.MessageBox.alert('Внимание', 'Выберите категорию для перемещения');
                            return;
                        }

                        var record = selected[0];
                        var currentIndex = popular_store.indexOf(record);

                        if (currentIndex === 0) {
                            Ext.MessageBox.alert('Внимание', 'Категория уже на первом месте');
                            return;
                        }

                        // Перемещаем вверх
                        popular_store.remove(record);
                        popular_store.insert(currentIndex - 1, record);
                        popular_grid.getSelectionModel().select(record);

                        // Сохраняем новый порядок
                        var order = [];
                        popular_store.each(function(rec) {
                            order.push(rec.get('id'));
                        });

                        Ext.Ajax.request({
                            url: '/admin/popular_categories/?action=save_order',
                            method: 'POST',
                            params: {
                                order: Ext.encode(order)
                            },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (!result.success) {
                                    Ext.MessageBox.alert('Ошибка', result.message || 'Не удалось сохранить порядок');
                                    popular_store.load();
                                }
                            },
                            failure: function() {
                                Ext.MessageBox.alert('Ошибка', 'Не удалось сохранить порядок');
                                popular_store.load();
                            }
                        });
                    }
                }, {
                    text: '↓ Вниз',
                    iconCls: 'icon-down',
                    handler: function() {
                        var selected = popular_grid.getSelectionModel().getSelection();
                        if (selected.length === 0) {
                            Ext.MessageBox.alert('Внимание', 'Выберите категорию для перемещения');
                            return;
                        }

                        var record = selected[0];
                        var currentIndex = popular_store.indexOf(record);
                        var totalRecords = popular_store.getCount();

                        if (currentIndex === totalRecords - 1) {
                            Ext.MessageBox.alert('Внимание', 'Категория уже на последнем месте');
                            return;
                        }

                        // Перемещаем вниз
                        popular_store.remove(record);
                        popular_store.insert(currentIndex + 1, record);
                        popular_grid.getSelectionModel().select(record);

                        // Сохраняем новый порядок
                        var order = [];
                        popular_store.each(function(rec) {
                            order.push(rec.get('id'));
                        });

                        Ext.Ajax.request({
                            url: '/admin/popular_categories/?action=save_order',
                            method: 'POST',
                            params: {
                                order: Ext.encode(order)
                            },
                            success: function(response) {
                                var result = Ext.decode(response.responseText);
                                if (!result.success) {
                                    Ext.MessageBox.alert('Ошибка', result.message || 'Не удалось сохранить порядок');
                                    popular_store.load();
                                }
                            },
                            failure: function() {
                                Ext.MessageBox.alert('Ошибка', 'Не удалось сохранить порядок');
                                popular_store.load();
                            }
                        });
                    }
                }, '-', {
                    text: 'Удалить',
                    iconCls: 'icon-delete',
                    handler: function() {
                        var selected = popular_grid.getSelectionModel().getSelection();
                        if (selected.length > 0) {
                            Ext.MessageBox.confirm('Внимание', 'Удалить выбранные категории?', function(btn) {
                                if (btn === 'yes') {
                                    selected.forEach(function(record) {
                                        Ext.Ajax.request({
                                            url: '/admin/popular_categories/?action=remove_popular',
                                            method: 'POST',
                                            params: { id: record.get('id') },
                                            success: function() {
                                                popular_store.load();
                                            }
                                        });
                                    });
                                }
                            });
                        } else {
                            Ext.MessageBox.alert('Внимание', 'Выберите хотя бы одну запись');
                        }
                    }
                }, '-', {
                    text: 'Загрузить изображение',
                    iconCls: 'icon-upload',
                    handler: function() {
                        var selected = popular_grid.getSelectionModel().getSelection();
                        if (selected.length === 0) {
                            Ext.MessageBox.alert('Внимание', 'Выберите категорию');
                            return;
                        }

                        var record = selected[0];
                        var uploadWindow = Ext.create('Ext.window.Window', {
                            title: 'Загрузить изображение',
                            width: 400,
                            modal: true,
                            layout: 'fit',
                            items: [{
                                xtype: 'form',
                                bodyPadding: 10,
                                items: [{
                                    xtype: 'filefield',
                                    name: 'image',
                                    fieldLabel: 'Изображение',
                                    labelWidth: 100,
                                    anchor: '100%',
                                    allowBlank: false,
                                    buttonText: 'Выбрать...'
                                }],
                                buttons: [{
                                    text: 'Отмена',
                                    handler: function() {
                                        uploadWindow.close();
                                    }
                                }, {
                                    text: 'Загрузить',
                                    formBind: true,
                                    handler: function() {
                                        var form = this.up('form').getForm();
                                        if (form.isValid()) {
                                            form.submit({
                                                url: '/admin/popular_categories/?action=upload_image',
                                                params: { id: record.get('id') },
                                                waitMsg: 'Загрузка...',
                                                success: function() {
                                                    uploadWindow.close();
                                                    popular_store.load();
                                                    Ext.Msg.alert('Успех', 'Изображение загружено');
                                                },
                                                failure: function(form, action) {
                                                    Ext.Msg.alert('Ошибка', action.result ? action.result.message : 'Не удалось загрузить');
                                                }
                                            });
                                        }
                                    }
                                }]
                            }]
                        });
                        uploadWindow.show();
                    }
                }, '->', {
                    text: 'Обновить',
                    iconCls: 'icon-refresh',
                    handler: function() {
                        popular_store.load();
                        categoriesTreeStore.load();
                    }
                }]
            });


            var win = Ext.create('Ext.window.Window', {
                title: 'Популярные категории',
                width: 1200,
                height: 600,
                layout: 'border',
                maximizable: true,
                minimizable: true,
                items: [my_tree, popular_grid],
                listeners: {
                    close: function() {
                        delete openWindows['popular_categories'];
                        removeTaskbarButton('popular_categories');
                    },
                    minimize: function() {
                        this.hide();
                    }
                }
            });

            openWindows['popular_categories'] = win;
            addTaskbarButton('popular_categories', 'Популярные категории', win);
            win.show();
        });
    }

    // Открытие окна управления правами
    function openPermissions() {
        closeStartMenu();

        if (openWindows['permissions']) {
            openWindows['permissions'].show();
            openWindows['permissions'].toFront();
            return;
        }

        // Store для ролей
        var rolesStore = Ext.create('Ext.data.Store', {
            fields: ['id', 'name', 'title', 'description'],
            proxy: {
                type: 'ajax',
                url: '/admin/permissions/?action=list_roles',
                reader: {
                    type: 'json',
                    root: 'data',
                    totalProperty: 'total'
                },
                listeners: {
                    exception: function(proxy, response, operation) {
                        // Ошибка загрузки ролей
                        Ext.Msg.alert('Ошибка загрузки ролей', 'Возможно, таблицы ACL не созданы.');
                    }
                }
            },
            autoLoad: true,
            listeners: {
                load: function(store, records, successful) {
                    // Роли загружены
                }
            }
        });

        // Store для пользователей
        var usersStore = Ext.create('Ext.data.Store', {
            fields: ['id', 'login', 'name', 'email', 'role', 'role_title', 'active', 'last_login'],
            proxy: {
                type: 'ajax',
                url: '/admin/permissions/?action=list_users',
                reader: {
                    type: 'json',
                    root: 'data',
                    totalProperty: 'total'
                },
                listeners: {
                    exception: function(proxy, response, operation) {
                        // Ошибка загрузки пользователей
                    }
                }
            },
            autoLoad: true,
            listeners: {
                load: function(store, records, successful) {
                    // Пользователи загружены
                }
            }
        });

        // TabPanel с двумя вкладками
        var tabs = Ext.create('Ext.tab.Panel', {
            activeTab: 0,
            items: [
                {
                    title: 'Пользователи',
                    layout: 'border',
                    items: [
                        {
                            region: 'west',
                            width: 300,
                            split: true,
                            title: 'Пользователи',
                            xtype: 'grid',
                            store: usersStore,
                            columns: [
                                { text: 'Логин', dataIndex: 'login', flex: 1 },
                                { text: 'Имя', dataIndex: 'name', flex: 1 }
                            ],
                            listeners: {
                                selectionchange: function(sm, selected) {
                                    if (selected.length > 0) {
                                        loadUserModuleAccess(selected[0].get('id'));
                                    }
                                }
                            }
                        },
                        {
                            region: 'center',
                            title: 'Доступ к модулям',
                            id: 'user-modules-container',
                            layout: 'fit',
                            html: '<div style="padding: 20px; text-align: center; color: #999;">Выберите пользователя для просмотра прав доступа</div>'
                        }
                    ]
                },
                {
                    title: 'Роли и права',
                    layout: 'border',
                    items: [
                        {
                            region: 'west',
                            width: 300,
                            split: true,
                            title: 'Роли',
                            xtype: 'grid',
                            store: rolesStore,
                            columns: [
                                { text: 'Название', dataIndex: 'title', flex: 1 },
                                { text: 'Код', dataIndex: 'name', width: 100 }
                            ],
                            listeners: {
                                selectionchange: function(sm, selected) {
                                    if (selected.length > 0) {
                                        loadRolePermissions(selected[0].get('id'));
                                    }
                                }
                            }
                        },
                        {
                            region: 'center',
                            title: 'Права доступа',
                            id: 'permissions-grid-container',
                            layout: 'fit',
                            html: '<div style="padding: 20px; text-align: center; color: #999;">Выберите роль для просмотра прав</div>'
                        }
                    ]
                }

            ]
        });

        var win = Ext.create('Ext.window.Window', {
            title: 'Управление правами доступа',
            width: 1200,
            height: 700,
            layout: 'fit',
            maximizable: true,
            minimizable: true,
            constrain: true,
            x: 50,
            y: 30,
            items: [tabs],
            listeners: {
                close: function() {
                    delete openWindows['permissions'];
                    removeTaskbarButton('permissions');
                },
                activate: function() {
                    setActiveWindow('permissions');
                },
                minimize: function() {
                    this.hide();
                    var btn = document.getElementById('taskbar-permissions');
                    if (btn) {
                        btn.classList.add('minimized');
                        btn.classList.remove('active');
                    }
                }
            }
        });

        openWindows['permissions'] = win;
        addTaskbarButton('permissions', 'Управление правами', win);
        win.show();

        // Функция загрузки прав роли
        function loadRolePermissions(roleId) {
            Ext.Ajax.request({
                url: '/admin/permissions/?action=get_role_permissions&role_id=' + roleId,
                success: function(response) {
                    var result = Ext.decode(response.responseText);
                    if (result.success) {
                        showPermissionsGrid(result.role, result.permissions);
                    } else {
                        Ext.Msg.alert('Ошибка', result.message);
                    }
                },
                failure: function() {
                    Ext.Msg.alert('Ошибка', 'Не удалось загрузить права');
                }
            });
        }

        // Показать таблицу прав
        function showPermissionsGrid(role, permissions) {
            var container = Ext.getCmp('permissions-grid-container');
            container.removeAll();

            // Группируем права по модулям
            var grouped = {};
            Ext.each(permissions, function(p) {
                if (!grouped[p.module]) {
                    grouped[p.module] = [];
                }
                grouped[p.module].push(p);
            });

            // Создаем Store
            var permissionsStore = Ext.create('Ext.data.Store', {
                fields: ['id', 'module', 'action', 'title', 'description', 'granted'],
                data: permissions
            });

            var grid = Ext.create('Ext.grid.Panel', {
                store: permissionsStore,
                selModel: {
                    selType: 'checkboxmodel',
                    checkOnly: true,
                    mode: 'MULTI',
                    listeners: {
                        select: function(sm, record) {
                            record.set('granted', 1);
                        },
                        deselect: function(sm, record) {
                            record.set('granted', 0);
                        }
                    }
                },
                columns: [
                    { text: 'Модуль', dataIndex: 'module', width: 120 },
                    { text: 'Действие', dataIndex: 'action', width: 100 },
                    { text: 'Название', dataIndex: 'title', flex: 1 },
                    { text: 'Описание', dataIndex: 'description', flex: 2 }
                ],
                tbar: [
                    {
                        text: 'Сохранить изменения',
                        handler: function() {
                            saveRolePermissions(role.id, permissionsStore);
                        }
                    },
                    '->',
                    '<b>Редактирование роли: ' + role.title + '</b>'
                ],
                listeners: {
                    afterrender: function(grid) {
                        // Выбираем строки с granted=1
                        var sm = grid.getSelectionModel();
                        permissionsStore.each(function(record) {
                            if (record.get('granted') == 1) {
                                sm.select(record, true, true);
                            }
                        });
                    }
                }
            });

            container.add(grid);
        }

        // Сохранить права роли
        function saveRolePermissions(roleId, store) {
            var selectedIds = [];
            store.each(function(record) {
                if (record.get('granted') == 1) {
                    selectedIds.push(record.get('id'));
                }
            });

            Ext.Ajax.request({
                url: '/admin/permissions/?action=save_role_permissions',
                method: 'POST',
                jsonData: {
                    role_id: roleId,
                    permissions: selectedIds
                },
                success: function(response) {
                    var result = Ext.decode(response.responseText);
                    if (result.success) {
                        Ext.Msg.alert('Успешно', result.message);
                    } else {
                        Ext.Msg.alert('Ошибка', result.message);
                    }
                },
                failure: function() {
                    Ext.Msg.alert('Ошибка', 'Не удалось сохранить права');
                }
            });
        }

        // Форма изменения роли пользователя
        function showChangeRoleForm(userRecord, usersStore, rolesStore) {
            var form = Ext.create('Ext.form.Panel', {
                bodyPadding: 15,
                defaults: {
                    anchor: '100%',
                    labelWidth: 100
                },
                items: [
                    {
                        xtype: 'displayfield',
                        fieldLabel: 'Пользователь',
                        value: userRecord.get('name') + ' (' + userRecord.get('login') + ')'
                    },
                    {
                        xtype: 'combobox',
                        fieldLabel: 'Новая роль',
                        name: 'role',
                        store: rolesStore,
                        displayField: 'title',
                        valueField: 'name',
                        value: userRecord.get('role'),
                        editable: false,
                        allowBlank: false
                    }
                ]
            });

            var formWindow = Ext.create('Ext.window.Window', {
                title: 'Изменить роль пользователя',
                width: 400,
                modal: true,
                layout: 'fit',
                items: [form],
                buttons: [
                    {
                        text: 'Сохранить',
                        handler: function() {
                            var values = form.getValues();
                            Ext.Ajax.request({
                                url: '/admin/permissions/?action=update_user_role',
                                method: 'POST',
                                params: {
                                    user_id: userRecord.get('id'),
                                    role: values.role
                                },
                                success: function(response) {
                                    var result = Ext.decode(response.responseText);
                                    if (result.success) {
                                        Ext.Msg.alert('Успешно', result.message);
                                        usersStore.load();
                                        formWindow.close();
                                    } else {
                                        Ext.Msg.alert('Ошибка', result.message);
                                    }
                                },
                                failure: function() {
                                    Ext.Msg.alert('Ошибка', 'Не удалось изменить роль');
                                }
                            });
                        }
                    },
                    {
                        text: 'Отмена',
                        handler: function() {
                            formWindow.close();
                        }
                    }
                ]
            });

            formWindow.show();
        }

        // Загрузить индивидуальные права пользователя
        function loadUserModuleAccess(userId) {
            Ext.Ajax.request({
                url: '/admin/permissions/?action=get_user_module_access&user_id=' + userId,
                success: function(response) {
                    var result = Ext.decode(response.responseText);
                    if (result.success) {
                        showUserModulesGrid(result.user, result.modules);
                    } else {
                        Ext.Msg.alert('Ошибка', result.message);
                    }
                },
                failure: function() {
                    Ext.Msg.alert('Ошибка', 'Не удалось загрузить права пользователя');
                }
            });
        }

        // Показать таблицу индивидуальных прав пользователя
        function showUserModulesGrid(user, modules) {
            var container = Ext.getCmp('user-modules-container');
            container.removeAll();

            // Создаем Store для модулей
            var modulesStore = Ext.create('Ext.data.Store', {
                fields: ['module', 'role_access', 'user_access', 'is_custom'],
                data: modules
            });

            var grid = Ext.create('Ext.grid.Panel', {
                store: modulesStore,
                columns: [
                    { text: 'Модуль', dataIndex: 'module', flex: 1 },
                    {
                        text: 'Права роли',
                        dataIndex: 'role_access',
                        width: 100,
                        renderer: function(value) {
                            return value ? '<span style="color: green;">✓ Доступен</span>' : '<span style="color: red;">✗ Запрещен</span>';
                        }
                    },
                    {
                        xtype: 'checkcolumn',
                        text: 'Индивидуальные права',
                        dataIndex: 'user_access',
                        width: 160,
                        listeners: {
                            checkchange: function(checkColumn, rowIndex, checked) {
                                var record = modulesStore.getAt(rowIndex);
                                record.set('user_access', checked);
                                record.set('is_custom', true);
                            }
                        }
                    },
                    {
                        text: 'Статус',
                        dataIndex: 'is_custom',
                        width: 100,
                        renderer: function(value) {
                            return value ? '<span style="color: blue;">Индивидуально</span>' : '<span style="color: gray;">По роли</span>';
                        }
                    }
                ],
                tbar: [
                    {
                        text: 'Сохранить изменения',
                        handler: function() {
                            saveUserModuleAccess(user.id, modulesStore);
                        }
                    },
                    {
                        text: 'Сбросить индивидуальные права',
                        handler: function() {
                            Ext.Msg.confirm('Подтверждение', 'Сбросить индивидуальные права пользователя к правам роли?', function(btn) {
                                if (btn === 'yes') {
                                    resetUserModuleAccess(user.id, modulesStore);
                                }
                            });
                        }
                    },
                    '->',
                    '<b>Пользователь: ' + user.name + ' (' + user.login + ') | Роль: ' + user.role + '</b>'
                ],
                listeners: {
                    afterrender: function(grid) {
                        // Выбираем чекбоксы согласно user_access
                        var view = grid.getView();
                        modulesStore.each(function(record, index) {
                            var node = view.getNode(index);
                            if (node) {
                                var checkbox = node.querySelector('input[type="checkbox"]');
                                if (checkbox) {
                                    checkbox.checked = record.get('user_access');
                                }
                            }
                        });
                    }
                }
            });

            container.add(grid);
        }

        // Сохранить индивидуальные права пользователя
        function saveUserModuleAccess(userId, store) {
            var moduleAccess = {};
            store.each(function(record) {
                moduleAccess[record.get('module')] = record.get('user_access');
            });

            Ext.Ajax.request({
                url: '/admin/permissions/?action=save_user_module_access',
                method: 'POST',
                jsonData: {
                    user_id: userId,
                    modules: moduleAccess
                },
                success: function(response) {
                    var result = Ext.decode(response.responseText);
                    if (result.success) {
                        Ext.Msg.alert('Успешно', result.message);
                        store.each(function(record) {
                            if (record.get('user_access') != record.get('role_access')) {
                                record.set('is_custom', true);
                            } else {
                                record.set('is_custom', false);
                            }
                        });
                    } else {
                        Ext.Msg.alert('Ошибка', result.message);
                    }
                },
                failure: function() {
                    Ext.Msg.alert('Ошибка', 'Не удалось сохранить права');
                }
            });
        }

        // Сбросить индивидуальные права к правам роли
        function resetUserModuleAccess(userId, store) {
            Ext.Ajax.request({
                url: '/admin/permissions/?action=save_user_module_access',
                method: 'POST',
                jsonData: {
                    user_id: userId,
                    modules: {} // Пустой объект сбросит все индивидуальные права
                },
                success: function(response) {
                    var result = Ext.decode(response.responseText);
                    if (result.success) {
                        Ext.Msg.alert('Успешно', 'Индивидуальные права сброшены к правам роли');
                        store.load(); // Перезагрузим данные
                    } else {
                        Ext.Msg.alert('Ошибка', result.message);
                    }
                },
                failure: function() {
                    Ext.Msg.alert('Ошибка', 'Не удалось сбросить права');
                }
            });
        }
    }

    // Открытие окна управления пользователями
    function openUsers() {
        closeStartMenu();

        if (openWindows['users']) {
            openWindows['users'].show();
            openWindows['users'].toFront();
            return;
        }

        Ext.onReady(function() {
            var store = Ext.create('Ext.data.Store', {
                fields: ['id', 'login', 'name', 'email', 'role', 'active', 'created_at'],
                proxy: {
                    type: 'ajax',
                    url: '/admin/users/?action=list',
                    reader: {
                        type: 'json',
                        root: 'data',
                        successProperty: 'success',
                        totalProperty: 'total'
                    }
                },
                autoLoad: true
            });

            var win = Ext.create('Ext.window.Window', {
                title: 'Управление пользователями',
                width: 1000,
                height: 600,
                layout: 'fit',
                maximizable: true,
                minimizable: true,
                constrain: true,
                x: 120,
                y: 70,
                listeners: {
                    close: function() {
                        delete openWindows['users'];
                        removeTaskbarButton('users');
                    },
                    activate: function() {
                        setActiveWindow('users');
                    },
                    minimize: function() {
                        this.hide();
                        var btn = document.getElementById('taskbar-users');
                        if (btn) {
                            btn.classList.add('minimized');
                            btn.classList.remove('active');
                        }
                    }
                },
                items: [{
                    xtype: 'grid',
                    store: store,
                    columns: [
                        { text: 'ID', dataIndex: 'id', width: 50 },
                        { text: 'Логин', dataIndex: 'login', width: 120 },
                        { text: 'Имя', dataIndex: 'name', flex: 1 },
                        { text: 'Email', dataIndex: 'email', flex: 1 },
                        {
                            text: 'Роль',
                            dataIndex: 'role',
                            width: 100,
                            renderer: function(value) {
                                var roleNames = {
                                    'admin': 'Администратор',
                                    'editor': 'Редактор',
                                    'moderator': 'Модератор',
                                    'user': 'Пользователь'
                                };
                                return roleNames[value] || value;
                            }
                        },
                        {
                            text: 'Статус',
                            dataIndex: 'active',
                            width: 80,
                            align: 'center',
                            renderer: function(value) {
                                return value == 1
                                    ? '<span style="color: green; font-weight: bold;">Активен</span>'
                                    : '<span style="color: red; font-weight: bold;">Заблокирован</span>';
                            }
                        },
                        {
                            text: 'Создан',
                            dataIndex: 'created_at',
                            width: 150,
                            renderer: function(value) {
                                if (!value) return '';
                                var date = new Date(value);
                                return Ext.Date.format(date, 'd.m.Y H:i');
                            }
                        }
                    ],
                    listeners: {
                        itemdblclick: function(grid, record) {
                            showUserForm(record, store);
                        }
                    },
                    tbar: [
                        {
                            text: 'Добавить',
                            iconCls: 'add-icon',
                            handler: function() {
                                showUserForm(null, store);
                            }
                        },
                        {
                            text: 'Редактировать',
                            iconCls: 'edit-icon',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length > 0) {
                                    showUserForm(selection[0], store);
                                } else {
                                    Ext.Msg.alert('Внимание', 'Выберите пользователя');
                                }
                            }
                        },
                        {
                            text: 'Сменить пароль',
                            iconCls: 'key-icon',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length > 0) {
                                    showPasswordForm(selection[0], store);
                                } else {
                                    Ext.Msg.alert('Внимание', 'Выберите пользователя');
                                }
                            }
                        },
                        {
                            text: 'Блокировать/Активировать',
                            iconCls: 'lock-icon',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length > 0) {
                                    toggleUserActive(selection[0], store);
                                } else {
                                    Ext.Msg.alert('Внимание', 'Выберите пользователя');
                                }
                            }
                        },
                        '-',
                        {
                            text: 'Удалить',
                            iconCls: 'delete-icon',
                            handler: function() {
                                var selection = this.up('grid').getSelectionModel().getSelection();
                                if (selection.length > 0) {
                                    Ext.Msg.confirm('Подтверждение', 'Вы уверены, что хотите удалить пользователя?', function(btn) {
                                        if (btn === 'yes') {
                                            deleteUser(selection[0], store);
                                        }
                                    });
                                } else {
                                    Ext.Msg.alert('Внимание', 'Выберите пользователя');
                                }
                            }
                        },
                        '->',
                        {
                            text: 'Обновить',
                            iconCls: 'refresh-icon',
                            handler: function() {
                                store.load();
                            }
                        }
                    ]
                }]
            });

            openWindows['users'] = win;
            addTaskbarButton('users', 'Пользователи', win);
            win.show();
        });
    }

    // Форма добавления/редактирования пользователя
    function showUserForm(record, store) {
        var isEdit = record !== null;
        var formWindow = Ext.create('Ext.window.Window', {
            title: isEdit ? 'Редактировать пользователя' : 'Добавить пользователя',
            width: 500,
            modal: true,
            layout: 'fit',
            items: [{
                xtype: 'form',
                padding: 10,
                defaults: {
                    anchor: '100%',
                    labelWidth: 120
                },
                items: [
                    {
                        xtype: 'textfield',
                        name: 'login',
                        fieldLabel: 'Логин',
                        allowBlank: false,
                        value: isEdit ? record.get('login') : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'password',
                        fieldLabel: 'Пароль',
                        inputType: 'password',
                        allowBlank: isEdit,
                        emptyText: isEdit ? 'Оставьте пустым, если не хотите менять' : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'name',
                        fieldLabel: 'Имя',
                        allowBlank: false,
                        value: isEdit ? record.get('name') : ''
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
                        fieldLabel: 'Email',
                        vtype: 'email',
                        value: isEdit ? record.get('email') : ''
                    },
                    {
                        xtype: 'combobox',
                        name: 'role',
                        fieldLabel: 'Роль',
                        store: [
                            ['admin', 'Администратор'],
                            ['editor', 'Редактор'],
                            ['moderator', 'Модератор'],
                            ['user', 'Пользователь']
                        ],
                        value: isEdit ? record.get('role') : 'user',
                        editable: false
                    },
                    {
                        xtype: 'checkbox',
                        name: 'active',
                        fieldLabel: 'Активен',
                        checked: isEdit ? record.get('active') == 1 : true
                    }
                ],
                buttons: [
                    {
                        text: 'Сохранить',
                        handler: function() {
                            var form = this.up('form').getForm();
                            if (form.isValid()) {
                                var values = form.getValues();

                                var params = {
                                    action: isEdit ? 'edit' : 'add',
                                    login: values.login,
                                    name: values.name,
                                    email: values.email,
                                    role: values.role,
                                    active: values.active ? 1 : 0
                                };

                                if (isEdit) {
                                    params.id = record.get('id');
                                } else {
                                    params.password = values.password;
                                }

                                // Если редактирование и пароль заполнен - меняем пароль отдельно
                                if (isEdit && values.password) {
                                    Ext.Ajax.request({
                                        url: '/admin/users/',
                                        params: {
                                            action: 'change_password',
                                            id: record.get('id'),
                                            password: values.password
                                        },
                                        success: function(response) {
                                            var result = Ext.decode(response.responseText);
                                            if (!result.success) {
                                                Ext.Msg.alert('Ошибка', result.message);
                                            }
                                        }
                                    });
                                }

                                Ext.Ajax.request({
                                    url: '/admin/users/',
                                    params: params,
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (result.success) {
                                            store.load();
                                            formWindow.close();
                                        } else {
                                            Ext.Msg.alert('Ошибка', result.message);
                                        }
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось сохранить данные');
                                    }
                                });
                            }
                        }
                    },
                    {
                        text: 'Отмена',
                        handler: function() {
                            formWindow.close();
                        }
                    }
                ]
            }]
        });

        formWindow.show();
    }

    // Форма смены пароля
    function showPasswordForm(record, store) {
        var formWindow = Ext.create('Ext.window.Window', {
            title: 'Сменить пароль: ' + record.get('login'),
            width: 400,
            modal: true,
            layout: 'fit',
            items: [{
                xtype: 'form',
                padding: 10,
                defaults: {
                    anchor: '100%',
                    labelWidth: 120
                },
                items: [
                    {
                        xtype: 'displayfield',
                        fieldLabel: 'Пользователь',
                        value: record.get('name') + ' (' + record.get('login') + ')'
                    },
                    {
                        xtype: 'textfield',
                        name: 'password',
                        fieldLabel: 'Новый пароль',
                        inputType: 'password',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'password_confirm',
                        fieldLabel: 'Подтверждение',
                        inputType: 'password',
                        allowBlank: false
                    }
                ],
                buttons: [
                    {
                        text: 'Сохранить',
                        handler: function() {
                            var form = this.up('form').getForm();
                            if (form.isValid()) {
                                var values = form.getValues();

                                if (values.password !== values.password_confirm) {
                                    Ext.Msg.alert('Ошибка', 'Пароли не совпадают');
                                    return;
                                }

                                Ext.Ajax.request({
                                    url: '/admin/users/',
                                    params: {
                                        action: 'change_password',
                                        id: record.get('id'),
                                        password: values.password
                                    },
                                    success: function(response) {
                                        var result = Ext.decode(response.responseText);
                                        if (result.success) {
                                            Ext.Msg.alert('Успешно', result.message);
                                            formWindow.close();
                                        } else {
                                            Ext.Msg.alert('Ошибка', result.message);
                                        }
                                    },
                                    failure: function() {
                                        Ext.Msg.alert('Ошибка', 'Не удалось изменить пароль');
                                    }
                                });
                            }
                        }
                    },
                    {
                        text: 'Отмена',
                        handler: function() {
                            formWindow.close();
                        }
                    }
                ]
            }]
        });

        formWindow.show();
    }

    // Блокировка/активация пользователя
    function toggleUserActive(record, store) {
        var newStatus = record.get('active') == 1 ? 0 : 1;
        var action = newStatus == 1 ? 'активировать' : 'заблокировать';

        Ext.Msg.confirm('Подтверждение', 'Вы уверены, что хотите ' + action + ' пользователя?', function(btn) {
            if (btn === 'yes') {
                Ext.Ajax.request({
                    url: '/admin/users/',
                    params: {
                        action: 'toggle_active',
                        id: record.get('id'),
                        active: newStatus
                    },
                    success: function(response) {
                        var result = Ext.decode(response.responseText);
                        if (result.success) {
                            store.load();
                        } else {
                            Ext.Msg.alert('Ошибка', result.message);
                        }
                    },
                    failure: function() {
                        Ext.Msg.alert('Ошибка', 'Не удалось изменить статус');
                    }
                });
            }
        });
    }

    // Удаление пользователя
    function deleteUser(record, store) {
        Ext.Ajax.request({
            url: '/admin/users/',
            params: {
                action: 'delete',
                id: record.get('id')
            },
            success: function(response) {
                var result = Ext.decode(response.responseText);
                if (result.success) {
                    store.load();
                } else {
                    Ext.Msg.alert('Ошибка', result.message);
                }
            },
            failure: function() {
                Ext.Msg.alert('Ошибка', 'Не удалось удалить пользователя');
            }
        });
    }
</script>
</body>
</html>
