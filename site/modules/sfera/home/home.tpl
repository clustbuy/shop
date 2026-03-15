<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <style>
        /* ===== ОБЩИЕ СТИЛИ ===== */
        body {
            margin: 0;
            padding: 0;
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

        /* ===== МЕНЮ НАВИГАЦИИ ===== */
        nav[role="navigation"] {
            width: 100%;
            background: none;
            margin: 0;
            padding: 0;
        }

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

        /* ===== ОСНОВНОЙ КОНТЕНТ ===== */
        .catalog-preview {
            margin: 0;
            padding: 110px 0 40px; /* padding-top компенсирует фиксированную шапку */
            background: #fff;
        }

        .catalog-layout {
            display: flex;
            gap: 30px;
        }

        .categories-list {
            flex: 0 0 250px;
        }

        .categories-list h3 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #333;
        }

        .categories-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .categories-list li {
            margin-bottom: 10px;
        }

        .categories-list a {
            text-decoration: none;
            color: #555;
            font-size: 16px;
            transition: color 0.2s;
        }

        .categories-list a:hover {
            color: #ff8a1f;
        }

        .products-grid {
            flex: 1;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }

        .product-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 8px;
            overflow: hidden;
            transition: box-shadow 0.3s;
        }

        .product-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .product-image {
            height: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            background: #f9f9f9;
        }

        .product-image img {
            max-width: 100%;
            max-height: 100%;
            width: auto;
            height: auto;
            object-fit: contain;
        }

        .product-title {
            font-size: 16px;
            font-weight: 500;
            margin: 12px 12px 8px;
            color: #333;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #ff8a1f;
            margin: 0 12px 12px;
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
    <div id="header" class="floating_header">
        <div class="wrapper_content">
            <div id="logo">
                <a href="/"><img src="assets/sfera/img/logo/logo_new_header.svg" alt=""></a>
            </div>
            <div id="search_form">
                <form method="GET" action="/search/">
                    <input type="image" name="find" src="assets/sfera/img/icons/Search_icon.svg.png" alt="Искать" class="find_button">
                    <input name="txt" class="suggest_item" autocomplete="off" placeholder="поиск 50 000+ моделей">
                </form>
            </div>
            <div id="phones_holder_new">
                <b>+7 495 185-09-85</b>  без&nbsp;выходных 9:00 - 23:00
            </div>
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

    <section class="catalog-preview">
        <div class="container">
            <div class="catalog-layout">
                <aside class="categories-list">
                    <h3>Категории</h3>
                    <ul>
                        <li><a href="/catalog/sunglasses/">Солнцезащитные очки</a></li>
                        <li><a href="/catalog/glasses_frames/">Оправы</a></li>
                        <li><a href="/catalog/spectacle_lenses/">Линзы для очков</a></li>
                        <li><a href="/catalog/accessories/">Аксессуары</a></li>
                        <li><a href="/catalog/children/">Детские очки</a></li>
                        <li><a href="/catalog/sport/">Спортивные очки</a></li>
                    </ul>
                </aside>

                <div class="products-grid">
                    <!-- Карточки товаров (8 штук) -->
                    <div class="product-card">
                        <a href="/product/1" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/polaroid.jpg" alt="Солнцезащитные очки"></div>
                            <h4 class="product-title">Солнцезащитные очки Polaroid</h4>
                            <div class="product-price">3 990 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/2" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/rayban.jpg" alt="Оправы"></div>
                            <h4 class="product-title">Оправы Ray-Ban</h4>
                            <div class="product-price">5 490 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/3" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/oasis.jpg" alt="Линзы"></div>
                            <h4 class="product-title">Линзы Acuvue Oasys</h4>
                            <div class="product-price">1 290 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/4" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/futlar.jpg" alt="Аксессуары"></div>
                            <h4 class="product-title">Футляр для очков</h4>
                            <div class="product-price">490 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/5" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/gucci.jpg" alt="Солнцезащитные очки"></div>
                            <h4 class="product-title">Солнцезащитные очки Gucci</h4>
                            <div class="product-price">12 990 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/6" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/tom_ford.jpg" alt="Оправы"></div>
                            <h4 class="product-title">Оправы Tom Ford</h4>
                            <div class="product-price">8 490 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/7" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/airoptix.jpg" alt="Линзы"></div>
                            <h4 class="product-title">Линзы Air Optix</h4>
                            <div class="product-price">1 590 ₽</div>
                        </a>
                    </div>
                    <div class="product-card">
                        <a href="/product/8" class="product-link">
                            <div class="product-image"><img src="assets/sfera/img/icons/marc_jacobs.webp" alt="Аксессуары"></div>
                            <h4 class="product-title">MARC JACOBS MARC 878 003 Matte Black</h4>
                            <div class="product-price">2 490 ₽</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

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