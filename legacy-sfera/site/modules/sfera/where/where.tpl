<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Где купить — Творческий Центр СФЕРА</title>
    <meta name="theme-color" content="#fde678">

    <!-- Подключаем ваши основные стили, если они нужны для шапки/футера -->
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
</head>
<body>

~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<link rel="stylesheet" href="/assets/sfera/css/where_buy.css">
<main class="main-certificate">
    <div class="container">
        <section class="buy-page">

            <h1>Где купить?</h1>

            <!-- Описание -->
            <div class="buy-description">
                <h2>Где можно приобрести продукцию Издательства ТЦ Сфера?</h2>
                <p><strong>Магазины наших партнёров</strong></p>
                <p>Здесь Вы можете найти точки продаж в Вашем городе. Магазины размещены на карте с указанием адреса,
                    телефона и корпоративного сайта.</p>
                <div class="partner-info">
                    Если Вы являетесь нашим партнёром и хотите разместить
                    информацию о своих точках продаж на нашем сайте, пожалуйста, свяжитесь со своим менеджером.
                </div>
                <div class="buy-contacts">
                    <p>
                        <strong>Телефоны:</strong>
                        <span class="phone-list">
                            <span class="phone-item">+7 (495) 656-75-05,</span>
                            <span class="phone-item">+7 (495) 656-72-05,</span>
                            <span class="phone-item">+7 (499) 181-21-58,</span>
                            <span class="phone-item">+7 (499) 181-34-52</span>
                        </span>
                    </p>
                    <p><strong>E-mail:</strong> <a href="mailto:sfera@tc-sfera.ru" style="color: #3b82f6;">sfera@tc-sfera.ru</a></p>
                </div>

            </div>

            <!-- Поиск -->
            <div class="search-block">
                <h2>Адреса магазинов</h2>
                <p style="margin-bottom: 15px; color: #666;">Выберите свой город из списка:</p>

                <form action="/gde-kupit" method="GET" class="search-form" autocomplete="off">
                    <div class="search-input-wrapper">
                        <input type="text" name="city" id="cityInput" class="search-input" placeholder="Выберите город">
                        <ul id="cityList" class="city-dropdown">
                            <li data-value="Алтайский край">Алтайский край</li>
                            <li data-value="Амурская область">Амурская область</li>
                            <li data-value="Архангельская область">Архангельская область</li>
                            <li data-value="Астраханская область">Астраханская область</li>
                            <li data-value="Башкортостан">Башкортостан</li>
                            <li data-value="Беларусь">Беларусь</li>
                            <li data-value="Белгородская область">Белгородская область</li>
                            <li data-value="Брянская область">Брянская область</li>
                            <li data-value="Бурятия">Бурятия</li>
                            <li data-value="Владимирская область">Владимирская область</li>
                            <li data-value="Волгоградская область">Волгоградская область</li>
                            <li data-value="Вологодская область">Вологодская область</li>
                            <li data-value="Воронежская область">Воронежская область</li>
                            <li data-value="Дагестан">Дагестан</li>
                            <li data-value="Забайкальский край">Забайкальский край</li>
                            <li data-value="Ивановская область">Ивановская область</li>
                            <li data-value="Иркутская область">Иркутская область</li>
                            <li data-value="Кабардино-Балкарская Республика">Кабардино-Балкарская Республика</li>
                            <li data-value="Казахстан">Казахстан</li>
                            <li data-value="Калининградская область">Калининградская область</li>
                            <li data-value="Калужская область">Калужская область</li>
                            <li data-value="Камчатский край">Камчатский край</li>
                            <li data-value="Карелия">Карелия</li>
                            <li data-value="Кемеровская область">Кемеровская область</li>
                            <li data-value="Кировская область">Кировская область</li>
                            <li data-value="Коми">Коми</li>
                            <li data-value="Костромская область">Костромская область</li>
                            <li data-value="Краснодарский край">Краснодарский край</li>
                            <li data-value="Красноярский край">Красноярский край</li>
                            <li data-value="Крым">Крым</li>
                            <li data-value="Курганская область">Курганская область</li>
                            <li data-value="Курская область">Курская область</li>
                            <li data-value="Ленинградская область">Ленинградская область</li>
                            <li data-value="Липецкая область">Липецкая область</li>
                            <li data-value="Магаданская область">Магаданская область</li>
                            <li data-value="Марий Эл">Марий Эл</li>
                            <li data-value="Мордовия">Мордовия</li>
                            <li data-value="Москва">Москва</li>
                            <li data-value="Московская область">Московская область</li>
                            <li data-value="Мурманская область">Мурманская область</li>
                            <li data-value="Нижегородская область">Нижегородская область</li>
                            <li data-value="Новгородская область">Новгородская область</li>
                            <li data-value="Новосибирская область">Новосибирская область</li>
                            <li data-value="Омская область">Омская область</li>
                            <li data-value="Оренбургская область">Оренбургская область</li>
                            <li data-value="Орловская область">Орловская область</li>
                            <li data-value="Пензенская область">Пензенская область</li>
                            <li data-value="Пермский край">Пермский край</li>
                            <li data-value="Приморский край">Приморский край</li>
                            <li data-value="Псковская область">Псковская область</li>
                            <li data-value="Ростовская область">Ростовская область</li>
                            <li data-value="Рязанская область">Рязанская область</li>
                            <li data-value="Самарская область">Самарская область</li>
                            <li data-value="Санкт-Петербург">Санкт-Петербург</li>
                            <li data-value="Саратовская область">Саратовская область</li>
                            <li data-value="Саха (Якутия)">Саха (Якутия)</li>
                            <li data-value="Сахалинская область">Сахалинская область</li>
                            <li data-value="Свердловская область">Свердловская область</li>
                            <li data-value="Северная Осетия-Алания">Северная Осетия-Алания</li>
                            <li data-value="Смоленская область">Смоленская область</li>
                            <li data-value="Ставропольский край">Ставропольский край</li>
                            <li data-value="Татарстан">Татарстан</li>
                            <li data-value="Тверская область">Тверская область</li>
                            <li data-value="Томская область">Томская область</li>
                            <li data-value="Тульская область">Тульская область</li>
                            <li data-value="Тюменская область">Тюменская область</li>
                            <li data-value="Удмуртская Республика">Удмуртская Республика</li>
                            <li data-value="Украина">Украина</li>
                            <li data-value="Ульяновская область">Ульяновская область</li>
                            <li data-value="Хабаровский край">Хабаровский край</li>
                            <li data-value="Хакасия">Хакасия</li>
                            <li data-value="Ханты-Мансийский автономный округ - Югра">Ханты-Мансийский автономный округ - Югра</li>
                            <li data-value="Челябинская область">Челябинская область</li>
                            <li data-value="Чеченская республика">Чеченская республика</li>
                            <li data-value="Чувашская Республика">Чувашская Республика</li>
                            <li data-value="Ярославская область">Ярославская область</li>

                        </ul>
                    </div>
                    <button type="submit" class="search-btn">Применить</button>
                </form>
            </div>

            <h2 style="margin-bottom: 25px; font-size: 24px; font-weight: 600;">Список магазинов</h2>

            <!-- Слайдер -->
            <div class="custom-shops-slider">
                <div class="custom-shops-track-container">
                    <div class="custom-shops-track">

                        <!-- 1 -->
                        <div class="custom-shop-slide">
                            <div class="shop-card">
                                <div class="shop-title">Магазин "Амиталь"</div>
                                <div class="shop-info-row"><span class="shop-label">Город:</span> <span class="shop-value">Воронеж</span></div>
                                <div class="shop-info-row"><span class="shop-label">Адрес:</span> <span class="shop-value">ул. Грибоедова, 7А</span></div>
                                <div class="shop-info-row"><span class="shop-label">Сайт:</span> <span class="shop-value"><a href="https://amital.ru/">amital.ru</a></span></div>
                                <div class="shop-info-row"><span class="shop-label">Телефон:</span> <span class="shop-value">+7 (473) 224-24-90</span></div>
                            </div>
                        </div>

                        <!-- 2 -->
                        <div class="custom-shop-slide">
                            <div class="shop-card">
                                <div class="shop-title">Магазин "Амиталь"</div>
                                <div class="shop-info-row"><span class="shop-label">Город:</span> <span class="shop-value">Россошь</span></div>
                                <div class="shop-info-row"><span class="shop-label">Сайт:</span> <span class="shop-value"><a href="https://amital.ru/">amital.ru</a></span></div>
                            </div>
                        </div>

                        <!-- 3 -->
                        <div class="custom-shop-slide">
                            <div class="shop-card">
                                <div class="shop-title">Магазин "Амиталь"</div>
                                <div class="shop-info-row"><span class="shop-label">Город:</span> <span class="shop-value">Лиски</span></div>
                                <div class="shop-info-row"><span class="shop-label">Адрес:</span> <span class="shop-value">ул. Коммунистическая, 21</span></div>
                                <div class="shop-info-row"><span class="shop-label">Сайт:</span> <span class="shop-value"><a href="https://amital.ru/">amital.ru</a></span></div>
                                <div class="shop-info-row"><span class="shop-label">Телефон:</span> <span class="shop-value">+7 (473) 914-16-71</span></div>
                            </div>
                        </div>

                        <!-- 4 -->
                        <div class="custom-shop-slide">
                            <div class="shop-card">
                                <div class="shop-title">Магазин "Амиталь"</div>
                                <div class="shop-info-row"><span class="shop-label">Город:</span> <span class="shop-value">Поворино</span></div>
                                <div class="shop-info-row"><span class="shop-label">Адрес:</span> <span class="shop-value">ул. Советская, 87</span></div>
                                <div class="shop-info-row"><span class="shop-label">Сайт:</span> <span class="shop-value"><a href="https://amital.ru/">amital.ru</a></span></div>
                                <div class="shop-info-row"><span class="shop-label">Телефон:</span> <span class="shop-value">+7 (473) 764-28-43</span></div>
                            </div>
                        </div>

                        <!-- 5 -->
                        <div class="custom-shop-slide">
                            <div class="shop-card">
                                <div class="shop-title">Магазин "Амиталь"</div>
                                <div class="shop-info-row"><span class="shop-label">Город:</span> <span class="shop-value">Калач</span></div>
                                <div class="shop-info-row"><span class="shop-label">Адрес:</span> <span class="shop-value">Колхозная площадь, 23</span></div>
                                <div class="shop-info-row"><span class="shop-label">Сайт:</span> <span class="shop-value"><a href="https://amital.ru/">amital.ru</a></span></div>
                                <div class="shop-info-row"><span class="shop-label">Телефон:</span> <span class="shop-value">+7 (473) 632-18-57</span></div>
                            </div>
                        </div>

                        <!-- 6 -->
                        <div class="custom-shop-slide">
                            <div class="shop-card">
                                <div class="shop-title">Магазин "Амиталь"</div>
                                <div class="shop-info-row"><span class="shop-label">Город:</span> <span class="shop-value">Богучар</span></div>
                                <div class="shop-info-row"><span class="shop-label">Адрес:</span> <span class="shop-value">ул. Дзержинского, 4</span></div>
                                <div class="shop-info-row"><span class="shop-label">Сайт:</span> <span class="shop-value"><a href="https://amital.ru/">amital.ru</a></span></div>
                                <div class="shop-info-row"><span class="shop-label">Телефон:</span> <span class="shop-value">+7 (473) 662-12-90</span></div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="custom-slider-dots"></div>
            </div>

        </section>
    </div>
</main>
<script src="/assets/sfera/js/where_buy.js"></script>

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
</body>
</html>
