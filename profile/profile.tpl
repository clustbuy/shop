<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <style>
        /* Общие сбросы */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Graphik', sans-serif;
            background: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 1600px;
            margin: 0 auto;
            padding: 0 20px;
            width: 100%;
        }

        /* ===== ШАПКА ===== */
        .floating_header {
            --big_tm_size: 100px;
            --blue: #49A4DC;
            --black: #111;
            --mg-blue: #49A4DC;
            --dark-blue: #005b94;
            --light-blue: #76C1EE;
            --light-blue2: #96CDEE;
            --bg-blue: #EBF1F4;
            --medium-blue: hsl(203deg 85% 42%);
            font: 16px Graphik, sans-serif;
            color: #404040;
            -webkit-tap-highlight-color: transparent;
            -webkit-text-size-adjust: 100%;
            height: 110px;
            background: linear-gradient(to bottom, #fffe, #fffe);
            position: fixed;
            width: 100%;
            z-index: 120;
            box-shadow: 0 2px 10px 2px rgba(0,0,0,.1), 0 1px 0 rgba(58,72,80,.08), 0 2px 4px rgba(58,72,80,.08);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 0;
            top: 0;
            left: 0;
            right: 0;
        }

        .floating_header .wrapper_content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            width: 100%;
            max-width: 1600px;
            margin: 0 auto;
            margin-top: 0;
        }

        #logo img {
            max-width: 100%;
            height: auto;
            width: 200px;
        }

        #phones_holder_new {
            flex: 1;
            text-align: center;
        }

        #search_form {
            margin-left: 300px;
        }

        #search_form .suggest_item {
            border: none;
            outline: none;
            background: transparent;
            flex: 1;
            padding: 8px 5px;
            font-size: 14px;
        }

        #search_form input.find_button {
            width: 36px;
            height: 36px;
            border: none;
            background: none;
            padding: 0;
            border-radius: 50%;
            object-fit: contain;
        }

        #search_form form {
            display: inline-flex;
            width: auto;
            min-width: 300px;
            background: #fff;
            border-radius: 40px;
            border: 1px solid #e0e0e0;
            padding: 2px 2px 2px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        /* Кнопка профиля в шапке */
        .profile-button {
            display: flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #49A4DC, #005b94);
            color: white;
            padding: 8px 18px;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,91,148,0.3);
        }

        .profile-button:hover {
            background: linear-gradient(135deg, #005b94, #003f66);
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0,91,148,0.4);
        }

        /* Меню навигации */
        #main_menu {
            width: 100%;
            max-width: 1600px;
            margin: 0 auto;
            padding: 0;
            border-collapse: collapse;
            background: none;
        }

        #main_menu td {
            padding: 10px 15px;
            text-align: left;
            white-space: nowrap;
        }

        #main_menu td a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }

        /* ===== КОНТЕНТ ПРОФИЛЯ ===== */
        .profile-simple {
            margin-top: 130px; /* отступ под фиксированной шапкой */
            padding: 40px 0;
            min-height: calc(100vh - 110px - 300px);
        }

        .profile-card {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
            border: 1px solid #eee;
        }

        .profile-header {
            background: linear-gradient(135deg, #49A4DC, #005b94);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .profile-header h1 {
            font-size: 24px;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .profile-header p {
            opacity: 0.9;
            font-size: 14px;
        }

        .profile-avatar {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 50%;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #005b94;
            font-size: 32px;
            font-weight: bold;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .profile-info {
            padding: 30px;
        }

        .info-row {
            display: flex;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f0f0f0;
        }

        .info-label {
            width: 100px;
            color: #777;
            font-size: 14px;
        }

        .info-value {
            flex: 1;
            color: #333;
            font-weight: 500;
        }

        .password-field {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .password-dots {
            letter-spacing: 3px;
            font-size: 18px;
            color: #333;
        }

        .edit-btn {
            background: none;
            border: 1px solid #49A4DC;
            color: #49A4DC;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 12px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .edit-btn:hover {
            background: #49A4DC;
            color: white;
        }

        .profile-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .action-btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 40px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
            text-decoration: none;
        }

        .save-btn {
            background: linear-gradient(135deg, #49A4DC, #005b94);
            color: white;
        }

        .save-btn:hover {
            background: linear-gradient(135deg, #005b94, #003f66);
            transform: translateY(-2px);
        }

        .logout-btn {
            background: #f8f9fa;
            border: 1px solid #ddd;
            color: #666;
        }

        .logout-btn:hover {
            background: #e9ecef;
            color: #dc3545;
            border-color: #dc3545;
        }

        /* ===== ПОДВАЛ ===== */
        #footer {
            background: #f5f5f5;
            border-top: 1px solid #ddd;
            padding: 40px 0 20px;
            margin-top: 40px;
            font-family: inherit;
            color: #404040;
        }

        #footer_container {
            max-width: 1600px;
            margin: 0 auto;
            padding: 0 20px;
        }

        #footer_menu {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            margin-bottom: 30px;
        }

        #footer_icons {
            flex: 2;
            min-width: 300px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 20px;
        }

        #logo_footer {
            flex-shrink: 0;
        }

        .footer__contacts__phone {
            display: flex;
            flex-direction: column;
            font-size: 14px;
            line-height: 1.4;
        }

        .footer__contacts__phone a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
        }

        .footer__contacts__phone a:hover {
            color: #ff8a1f;
        }

        .footer__contacts__phone2 {
            color: #777;
            font-size: 12px;
        }

        .footer_links {
            flex: 1;
            min-width: 160px;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer_links li {
            margin-bottom: 8px;
            font-size: 14px;
        }

        .footer_links li b {
            font-weight: 600;
            color: #333;
        }

        .footer_links a {
            color: #555;
            text-decoration: none;
            transition: color 0.2s;
        }

        .footer_links a:hover {
            color: #ff8a1f;
        }

        #copy {
            text-align: center;
            color: #777;
            font-size: 13px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }

    </style>
</head>
<body>
    <!-- ШАПКА -->
    <div id="header" class="floating_header">
        <div class="wrapper_content">
            <div id="logo">
                <a href="/"><img src="/assets/sfera/img/logo/logo_new_header.svg" alt=""></a>
            </div>
            <div id="search_form">
                <form method="GET" action="/search/">
                    <input type="image" name="find" src="/assets/sfera/img/icons/Search_icon.svg.png" alt="Искать" class="find_button">
                    <input name="txt" class="suggest_item" autocomplete="off" placeholder="поиск 50 000+ моделей">
                </form>
            </div>
            <div id="phones_holder_new">
                <b>+7 495 185-09-85</b>  без&nbsp;выходных 9:00 - 23:00
            </div>
            <!-- Кнопка профиля (ведёт на эту же страницу) -->
            <a href="/profile/" class="profile-button">
                <span>Войти</span>
            </a>
        </div>
        <nav role="navigation">
            <table id="main_menu">
                <tbody>
                <tr>
                    <td data-thisid="1" class="main_menu_td" id="main_menu_td_1"><div class="menu_area_layer"><a href="/catalog/sunglasses/">Солнцезащитные очки<div class="arrow_show"></div></a></div></td>
                    <td data-thisid="2" class="main_menu_td" id="main_menu_td_2"><div class="menu_area_layer"><a href="/catalog/glasses_frames/">Оправы<div class="arrow_show"></div></a></div></td>
                    <td data-thisid="3" class="main_menu_td" id="main_menu_td_3"><div class="menu_area_layer"><a href="/catalog/spectacle_lenses/">Линзы для&nbsp;очков<div class="arrow_show"></div></a></div></td>
                    <td data-thisid="5" class="main_menu_td" id="main_menu_td_5"><div class="menu_area_layer"><a href="/catalog/accessories/">Аксессуары<div class="arrow_show"></div></a></div></td>
                    <td data-thisid="66" class="main_menu_td" id="main_menu_td_66"><div class="menu_area_layer"><a href="/gift_cards/">Подарочные карты<div class="arrow_show"></div></a></div></td>
                    <td data-thisid="107" class="main_menu_td" id="main_menu_td_107"><div class="menu_area_layer"><a href="/sale/"><span style="color:var(--medium-blue);">скидки <span style="font-size:88%">%</span></span><div class="arrow_show"></div></a></div></td>
                    <td data-thisid="108" class="main_menu_td" id="main_menu_td_108"><div class="menu_area_layer"><a href="/showroom/">шоу-румы<div class="arrow_show"></div></a></div></td>
                    <td id="search_form_holder" style="text-align:left;"></td>
                </tr>
                </tbody>
            </table>
        </nav>
    </div>

    <!-- ПРОСТОЙ ПРОФИЛЬ -->
    <div class="profile-simple">
        <div class="container">
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar">ИП</div>
                    <h1>Иван Петров</h1>
                    <p>Зарегистрирован с марта 2026</p>
                </div>
                
                <div class="profile-info">
                    <!-- Имя -->
                    <div class="info-row">
                        <div class="info-label">Имя:</div>
                        <div class="info-value">Иван</div>
                        <button class="edit-btn" onclick="alert('Редактирование имени')">✎</button>
                    </div>
                    
                    <!-- Фамилия -->
                    <div class="info-row">
                        <div class="info-label">Фамилия:</div>
                        <div class="info-value">Петров</div>
                        <button class="edit-btn" onclick="alert('Редактирование фамилии')">✎</button>
                    </div>
                    
                    <!-- Email -->
                    <div class="info-row">
                        <div class="info-label">Email:</div>
                        <div class="info-value">ivan.petrov@email.com</div>
                        <button class="edit-btn" onclick="alert('Редактирование email')">✎</button>
                    </div>
                    
                    <!-- Телефон -->
                    <div class="info-row">
                        <div class="info-label">Телефон:</div>
                        <div class="info-value">+7 (495) 123-45-67</div>
                        <button class="edit-btn" onclick="alert('Редактирование телефона')">✎</button>
                    </div>
                    
                    <!-- Пароль (скрытый) -->
                    <div class="info-row">
                        <div class="info-label">Пароль:</div>
                        <div class="info-value">
                            <div class="password-field">
                                <span class="password-dots">••••••••</span>
                                <span style="color:#999; font-size:12px;">(скрыт)(на деле пароль это просто 8 точек)</span>
                            </div>
                        </div>
                        <button class="edit-btn" onclick="alert('Смена пароля')">✎</button>
                    </div>
                    
                    <!-- Кнопки действий -->
                    <div class="profile-actions">
                        <button class="action-btn save-btn" onclick="alert('Данные сохранены (демо)')">
                            💾 Сохранить
                        </button>
                        <a href="/logout/" class="action-btn logout-btn" onclick="alert('Выход из профиля (демо)'); return false;">
                            🚪 Выйти
                        </a>
                    </div>
                    
                    <!-- Подсказка -->
                    <p style="text-align: center; margin-top: 20px; color: #999; font-size: 12px;">
                        * демо-версия, данные не сохраняются
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div id="footer">
        <div id="footer_container">
            <div id="footer_menu">
                <div id="footer_icons">
                    <a id="logo_footer" name="logo_footer" href="/"></a>
                    <span class="footer__contacts__phone">
                        <a href="tel:+78003011169">+7 800 301-11-69</a>
                        <span class="footer__contacts__phone2">звонок бесплатный</span>
                    </span>
                    <span class="footer__contacts__phone">
                        <a href="tel:+74951850985">+7 495 185-09-85</a>
                        <span class="footer__contacts__phone2">9:00 - 23:00<br>без&nbsp;выходных</span>
                    </span>
                    <span class="footer__contacts__phone">
                        <span class="footer__contacts__phone2">e-mail:</span>
                        <a href="mailto:info@masterglasses.ru">info@masterglasses.ru</a>
                    </span>
                </div>
                <ul class="footer_links">
                    <li><b>Каталог</b></li>
                    <li><a href="https://masterglasses.ru/catalog/sunglasses/">Солнцезащитные очки</a></li>
                    <li><a href="https://masterglasses.ru/catalog/glasses_frames/">Оправы</a></li>
                    <li><a href="https://masterglasses.ru/catalog/spectacle_lenses/">Линзы для очков</a></li>
                    <li><a href="https://masterglasses.ru/showroom/">Контакты Шоу-рума</a></li>
                    <li><a href="/progressive_lenses/">Прогрессивные линзы</a></li>
                    <li><a href="/gift_cards/">Подарочные карты</a></li>
                </ul>
                <ul class="footer_links">
                    <li><b>Покупателю</b></li>
                    <li><a href="/delivery.html">Доставка и возврат</a></li>
                    <li><a href="/payment.html">Оплата</a></li>
                    <li><a href="/tinkoff/">Т-банк рассрочка</a></li>
                    <li><a href="/split/">Яндекс.Сплит</a></li>
                    <li><a href="/frame_to_face.html">Оправа к форме лица</a></li>
                    <li><a href="/appointment.html">Проверка зрения</a></li>
                </ul>
                <ul class="footer_links" style="width:290px;">
                    <li><b>Информация</b></li>
                    <li><a href="/about.html">О компании</a></li>
                    <li><a href="/guarantee.html">Гарантии</a></li>
                    <li><a href="/authenticity.html">Гарантия подлинности</a></li>
                    <li><a href="/content_order.html">Процесс заказа очков с&nbsp;линзами</a></li>
                    <li><a href="/virtual_try_on.html">Онлайн примерка очков</a></li>
                    <li><a href="/blog/">Блог</a></li>
                </ul>
            </div>
            <div id="copy">
                © 2013—2026 оптика «МастерГлассес»
            </div>
        </div>
    </div>
</body>
</html>