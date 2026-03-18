<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/checkout.css">

    <!-- Инициализация данных корзины с сервера ДО загрузки scripts.tpl -->
    <script>
        // console.log('=== Initializing server_cart data for checkout (BEFORE scripts.tpl) ===');
        var server_cart = {};
        ~~if isset($cart) && $cart.items|@count > 0~
        server_cart.data = ~~json_encode str=$cart~;
        ~~else~
        server_cart.data = {total_cart_sum:0, total_cart_amount:0, cart_sum:0, items:{}};
        ~~/if~
        // console.log('server_cart.data initialized:', server_cart.data);
        // console.log('Items count:', Object.keys(server_cart.data.items || {}).length);
    </script>

    ~~include file="sfera/tpl/scripts.tpl"~

    <script src="https://api-maps.yandex.ru/2.1/?apikey=71dcace5-2bc2-42e5-8e82-62aa21e52541&lang=ru_RU"></script>

</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Main Content -->
<main class="checkout-container">
    <div class="container">
        <div class="checkout-layout">
            <!-- Left Column -->
            <div class="checkout-main">
                <h1 class="checkout-title">Оформление заказа</h1>

                <!-- Delivery Address -->
                <section class="checkout-section">
                    <div class="section-header">
                        <h2 class="section-title">1. Адрес доставки</h2>
                    </div>
                    <div class="address-selector">
                        <input type="hidden" name="point_id" id="point_id">

                        <!-- ko if: pickpoint()  -->
                        <div class="address-card active" >
                            <div class="address-content">
                                <h4 data-bind="text: pickuppoint()['address']['full_address']"></h4>
                                <p data-bind="text: 'тел: ' + pickuppoint()['contact']['phone']"></p>
                                <p data-bind="text: pickuppoint()['name']"></p>
                                <p data-bind="text: pickuppoint()['address']['comment']"></p>
                            </div>
                            <button class="address-edit">Удалить</button>
                        </div>
                        <!-- /ko -->

                        <button class="add-address-btn">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M10 4v12M4 10h12" stroke="currentColor" stroke-width="2"/>
                            </svg>
                            Выбрать адрес доставки
                        </button>
                    </div>
                </section>

                <!-- Delivery Method -->
                <section class="checkout-section">
                    <div class="section-header">
                        <h2 class="section-title">2. Способ доставки</h2>
                    </div>
                    <div class="delivery-methods">
                        <div class="delivery-card active" data-method="pickup">
                            <div class="delivery-radio">
                                <input type="radio" name="delivery" id="pickup" value="pickup" checked>
                                <label for="pickup"></label>
                            </div>
                            <div class="delivery-icon">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <rect x="5" y="10" width="20" height="20" rx="2" stroke="currentColor" stroke-width="2"/>
                                    <path d="M12 25v-5M18 25v-5M15 10v5" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="delivery-content">
                                <h4>Пункт выдачи Яндекс Доставка</h4>
                                <p class="delivery-price">Бесплатно</p>
                                <p class="delivery-date">Завтра, 12 ноября</p>
                            </div>
                        </div>
                        <div class="delivery-card" data-method="courier">
                            <div class="delivery-radio">
                                <input type="radio" name="delivery" id="courier" value="courier">
                                <label for="courier"></label>
                            </div>
                            <div class="delivery-icon">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <rect x="5" y="12" width="22" height="16" rx="2" stroke="currentColor" stroke-width="2"/>
                                    <path d="M27 18h5l3 4v6h-3" stroke="currentColor" stroke-width="2"/>
                                    <circle cx="12" cy="31" r="3" stroke="currentColor" stroke-width="2"/>
                                    <circle cx="30" cy="31" r="3" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="delivery-content">
                                <h4>Курьером до двери</h4>
                                <p class="delivery-price">200 ₽</p>
                                <p class="delivery-date">Завтра, 12 ноября, 10:00 - 18:00</p>
                            </div>
                        </div>
                        <div class="delivery-card" data-method="express">
                            <div class="delivery-radio">
                                <input type="radio" name="delivery" id="express" value="express">
                                <label for="express"></label>
                            </div>
                            <div class="delivery-icon">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none">
                                    <path d="M8 20l5-5 5 5" stroke="currentColor" stroke-width="2"/>
                                    <path d="M13 15v12" stroke="currentColor" stroke-width="2"/>
                                    <circle cx="25" cy="20" r="10" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="delivery-content">
                                <h4>Экспресс-доставка</h4>
                                <p class="delivery-price">500 ₽</p>
                                <p class="delivery-date">Сегодня, 14:00 - 18:00</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Payment Method -->
                <section class="checkout-section">
                    <div class="section-header">
                        <h2 class="section-title">3. Способ оплаты</h2>
                    </div>
                    <div class="payment-methods">
                        <div class="payment-card active" data-payment="card">
                            <div class="payment-radio">
                                <input type="radio" name="payment" id="card" value="card" checked>
                                <label for="card"></label>
                            </div>
                            <div class="payment-icon">
                                <svg width="32" height="24" viewBox="0 0 32 24" fill="none">
                                    <rect x="1" y="1" width="30" height="22" rx="3" stroke="currentColor" stroke-width="2"/>
                                    <path d="M1 7h30" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="payment-content">
                                <h4>Банковская карта</h4>
                                <p>Visa, MasterCard, Мир</p>
                            </div>
                        </div>
                        <div class="payment-card" data-payment="cash">
                            <div class="payment-radio">
                                <input type="radio" name="payment" id="cash" value="cash">
                                <label for="cash"></label>
                            </div>
                            <div class="payment-icon">
                                <svg width="32" height="24" viewBox="0 0 32 24" fill="none">
                                    <rect x="1" y="5" width="30" height="14" rx="2" stroke="currentColor" stroke-width="2"/>
                                    <circle cx="16" cy="12" r="4" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="payment-content">
                                <h4>Наличными при получении</h4>
                                <p>Оплата курьеру или в пункте выдачи</p>
                            </div>
                        </div>
                        <div class="payment-card" data-payment="sberpay">
                            <div class="payment-radio">
                                <input type="radio" name="payment" id="sberpay" value="sberpay">
                                <label for="sberpay"></label>
                            </div>
                            <div class="payment-icon">
                                <svg width="32" height="24" viewBox="0 0 32 24" fill="none">
                                    <circle cx="16" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
                                    <path d="M16 7v5l3 3" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </div>
                            <div class="payment-content">
                                <h4>SberPay</h4>
                                <p>Быстрая оплата</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Recipient -->
                <section class="checkout-section">
                    <div class="section-header">
                        <h2 class="section-title">4. Получатель</h2>
                    </div>
                    <div class="recipient-form">
                        <div class="form-group">
                            <label for="recipientName">ФИО <span style="color: red;">*</span></label>
                            <input type="text" id="recipientName" name="recipientName" required>
                        </div>
                        <div class="form-group">
                            <label for="recipientPhone">Телефон <span style="color: red;">*</span></label>
                            <input type="tel" id="recipientPhone" name="recipientPhone" required>
                        </div>
                        <div class="form-group">
                            <label for="recipientEmail">Email (необязательно)</label>
                            <input type="email" id="recipientEmail" name="recipientEmail" placeholder="example@mail.ru">
                        </div>
                    </div>
                </section>

                <!-- Comment -->
                <section class="checkout-section">
                    <div class="section-header">
                        <h2 class="section-title">Комментарий к заказу</h2>
                    </div>
                    <textarea class="order-comment" id="orderComment" name="orderComment" placeholder="Укажите пожелания по доставке или другую важную информацию"></textarea>
                </section>
            </div>

            <!-- Right Column - Order Summary -->
            <aside class="checkout-sidebar">
                <div class="order-summary">
                    <h3 class="summary-title">Ваш заказ</h3>

                    <div class="order-items" data-bind="foreach: selectedItems()">
                        <div class="order-item">
                            <img data-bind="attr: {src: image(), alt: name()}" onerror="this.onerror=null; this.src='/assets/img/product_empty.jpg';">
                            <div class="item-info">
                                <h4 data-bind="text: name()"></h4>
                                <p class="item-quantity" data-bind="text: formattedQuantity()"></p>
                            </div>
                            <div class="item-price" data-bind="text: formattedTotal()"></div>
                        </div>
                    </div>
                    
                    <!-- ko if: items().length === 0 -->
                    <div class="order-item">
                        <p>Корзина пуста</p>
                    </div>
                    <!-- /ko -->

                    <div class="promo-code">
                        <input type="text" placeholder="Промокод или сертификат" id="promoInput" data-bind="value: promocode_input, valueUpdate: 'afterkeydown', enable: !promocode_applied()">
                        <button class="btn-apply" data-bind="click: applyPromoCode, enable: promocode_input().length > 0 && !promocode_applied()">Применить</button>
                        <!-- ko if: promocode_message -->
                        <div class="promo-message" data-bind="text: promocode_message, css: {success: promocode_applied(), error: !promocode_applied()}"></div>
                        <!-- /ko -->
                        <!-- ko if: promocode_applied -->
                        <div class="promo-applied">
                            <span>Промокод применен</span>
                            <button class="btn-remove-promo" data-bind="click: removePromoCode">×</button>
                        </div>
                        <!-- /ko -->
                    </div>

                    <div class="summary-details">
                        <div class="summary-row">
                            <span data-bind="text: 'Товары ' + formattedItemsCount()"></span>
                            <span class="summary-value" data-bind="text: formattedItemsTotal()"></span>
                        </div>
                        <!-- ko if: discountTotal() > 0 -->
                        <div class="summary-row">
                            <span>Скидка</span>
                            <span class="summary-value discount" data-bind="text: formattedDiscountTotal()"></span>
                        </div>
                        <!-- /ko -->
                        <div class="summary-row">
                            <span>Доставка</span>
                            <span class="summary-value free" data-bind="text: formattedDeliveryPrice()"></span>
                        </div>
                        <div class="summary-row total">
                            <span>Итого</span>
                            <span class="summary-value" data-bind="text: formattedGrandTotal()"></span>
                        </div>
                    </div>

                    <button class="checkout-btn" id="checkoutBtn" data-bind="enable: canCheckout">Оформить заказ</button>

                    <p class="checkout-agreement">
                        Нажимая кнопку, вы соглашаетесь с <a href="#">условиями обработки персональных данных</a> и <a href="#">правилами продажи</a>
                    </p>
                </div>
            </aside>
        </div>
    </div>
</main>


<!-- Map Popup -->
<div id="map-popup" class="map-popup">
    <div class="map-popup-overlay"></div>
    <div class="map-popup-content">
        <button class="map-popup-close" id="map-popup-close">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M18 6L6 18M6 6l12 12" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            </svg>
        </button>
        <div id="map"></div>
    </div>
</div>

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
<script src="/assets/sfera/js/checkout.js"></script>
<!-- cart-viewmodel.js уже подключен глобально в scripts.tpl (загружен в head) -->

<script>
/*
    if (navigator.geolocation) {
        // console.log('Геолокация доступна');
        navigator.geolocation.getCurrentPosition(function(position) {
            // Get the coordinates of the current position.
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            // console.log(lat); // console.log(lng);
        });
    } else {
        // console.log('Геолокация не доступна');
    }
*/

    var PointModel = {
        constructor: function(){
            var self = this;
            self.pickuppoint = ko.observable(false);
            self.PointWorkHours = ko.observable(false);
            self.Photo = ko.observable(false);
            self.WorkBreak = ko.observable(false);
            self.pickpoint = ko.pureComputed({
                read: function () {
                    return self.pickuppoint;
                }
            });
            ko.computed(function(){
                if (!ko.computedContext.isInitial())
                    return;
            });
            return self;
        }
    };
    var model_pickpoint = Object.create(PointModel).constructor();
    $(document).ready(function(){
        if($('.address-selector')[0])
            ko.applyBindings(model_pickpoint, $('.address-selector')[0]);
    });

    var Map = {
        map: null,
        _init: false,
        placemark: null,
        blueCollection: null,
        clusterer: null,
        points: null,
        geoObjects: null,
        geolocation: null,

        init: function () {
            if (this._init)
                return false;
            let defPoint = [55.755814, 37.617635]
            let selectPointId;
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    // console.log('Геолокация доступна');

                    // Get the coordinates of the current position.
                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    defPoint = [lat,lng];
                    // console.log(lat);
                    // console.log(lng);

                }, function(err) {
                    // console.log('Геолокация не доступна');
                    console.warn(`ERROR(${err.code}): ${err.message}`);
                });
            }
            else {
                // console.log('Геолокация не доступна');
            }

            let selectPoint = JSON.parse(localStorage.getItem('pickpoint_data'));
            // console.log('selectPoint = ',selectPoint);
            this.map = new ymaps.Map("map", {
                center: selectPoint || defPoint,
                zoom: 11,
                controls: ['zoomControl', 'fullscreenControl','searchControl','geolocationControl']
            }, {
                minZoom: 7,
                maxZoom: 16
            }),
                this.clusterer = new ymaps.Clusterer({

                    preset: 'islands#invertedBlackClusterIcons',
                    hasBalloon:false,
                    groupByCoordinates: false,
                    clusterDisableClickZoom: true,
                    clusterHideIconOnBalloonOpen: false,
                    geoObjectHideIconOnBalloonOpen: false
                }),

                getPointData = function (pnts) {

                    ~~*
                    var pnt;

                    $.ajax({
                        type: 'POST',
                        url: window.location.pathname,
                        dataType: 'json',
                        data: {
                            task: 'get_pickpoint_data',
                            points: pnts
                        },
                        async: false,
                        cache: false,
                        error: function (jqXHR, textStatus) {
                            // console.log("Нет связи с сервером: " + textStatus);
                        },
                        success: function (data) {
                            // console.log(data);
                            pnt = data.point_data;
                        }
                    });


                    return {
                        balloonContentHeader: '<font size=3><b>' + pnt.name + '</b></font>',
                        balloonContentBody: '<p>' + pnt.contact.first_name + '</p><p>Телефон:  ' + pnt.contact.phone + '</p>',
                        balloonContentFooter: '<p>' + pnt.address.comment + '</p>',
                        clusterCaption: 'метка <strong>' + pnt.name + '</strong>'
                    };
                *~

                    return {
                        balloonContentHeader: '',
                        balloonContentBody: pnts[0],
                        balloonContentFooter: '',
                        clusterCaption: ''
                    };
                },

                getPointOptions = function () {
                    return {
                        preset: 'islands#blackCircleDotIcon',
                        openBalloonOnClick: false //true
                    };
                },
                this.geolocation = ymaps.geolocation,
                this.points = [],
                this.geoObjects = [];


            // определяем шаблон вывода суммы в иконке кластера
            /**/
            const MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
                "<span style='color: #FFF;'>{{ properties.geoObjects.length }}</span>"
            );


            this.clusterer.options.set({
                gridSize: 80,
                mapAutoPan: false,
                clusterDisableClickZoom: true,
                clusterIconContentLayout: MyIconContentLayout,
                clusterBalloonContentLayout: "cluster#balloonAccordion"//,
                //clusterIconLayout: 'default#pieChart',
                //clusterIconPieChartRadius: 20,
                //clusterIconPieChartCoreRadius: 20,
                //clusterIconPieChartStrokeWidth: 0,
                //iconPieChartCoreFillStyle: '#2d2d2d',

                //clusterIconColor: "#7851A9"
            });


            this.map.events.add('boundschange', function (event) {
                var newBounds = event.get('newBounds');
                // console.log('Новые координаты карты:', newBounds);
                // Здесь можно выполнить ваш код для получения объектов
                $.ajax({
                    type: 'POST',
                    url: window.location.pathname,
                    dataType: 'json',
                    data: {
                        task: 'get_pickpoint_list',
                        bounds: newBounds
                    },
                    async: false,
                    cache: false,
                    error: function (jqXHR, textStatus) {
                        // console.log("Нет связи с сервером: " + textStatus);
                    },
                    success: function (data) {
                        // console.log(data);
                        Map.points.length = 0;

                        for (var i = 0, len = data.points.length; i < len; i++) {
                            //Map.createPlacemark(data.points[i]);
                            Map.points.push([parseFloat(data.points[i].la),parseFloat(data.points[i].lo)]);
                        }
                        // console.log(Map.points);

                        Map.geoObjects = [];
                        let pointOptions = getPointOptions();
                        for(var i = 0, len = Map.points.length; i < len; i++) {

                            var pnts = Map.points[i];
                            //console.log(pnts);

                            var placemark =  new ymaps.Placemark(Map.points[i], null ,pointOptions);
                            //placemark.setBalloonOptions({ mapAutoPan: false });


                            placemark.events.add('click', function (e) {

                                var coords = e.get('target').geometry.getCoordinates();
                                // console.log(coords);
                                //console.log(e.get('target')['properties'].get('balloonContent'));


                                $.ajax({
                                    type: 'POST',
                                    url: window.location.pathname,
                                    dataType: 'json',
                                    data: {
                                        task: 'get_pickpoint_data',
                                        coords: coords
                                    },
                                    async: false,
                                    cache: false,
                                    error: function (jqXHR, textStatus) {
                                        // console.log("Нет связи с сервером: " + textStatus);
                                    },
                                    success: function (data) {
                                        // console.log(data);
                                        model_pickpoint.pickuppoint(data.point_data);

                                        //selectPoint = coords;
                                        localStorage.setItem('pickpoint_data', JSON.stringify(coords));
                                        localStorage.setItem('pickpoint_address', data.point_data.address.full_address);
                                        $('.js-map-address').val(data.point_data.address.full_address);
                                        $('#head-map-address').text(data.point_data.address.full_address);
                                        $('#chosen_address_message').html('Выбран пункт выдачи: ' + data.point_data.address.full_address + ', тел: ' + data.point_data.contact.phone + '<br><span>' + data.point_data.address.comment  + '</span><div style="clear:both;"></div>');
                                        var myPlacemark = e.get('target');

                                        myPlacemark.properties.set('balloonContent', 'Выбран пункт выдачи:<br>'+data.point_data.address.full_address+ ', тел: ' + data.point_data.contact.phone + '<br><span>' + data.point_data.address.comment  + '</span><div style="clear:both;"></div>');
                                        myPlacemark.balloon.open();
                                        pickpoint_choosen = true;

                                    }
                                });
                            });/**/


                            Map.geoObjects[i] = placemark;
                        }
/*
                        if(selectPoint){

                            coords = selectPoint;
                            $.ajax({
                                type: 'POST',
                                url: window.location.pathname,
                                dataType: 'json',
                                data: {
                                    task: 'get_pickpoint_data',
                                    coords: coords
                                },
                                async: false,
                                cache: false,
                                error: function (jqXHR, textStatus) {
                                    // console.log("Нет связи с сервером: " + textStatus);
                                },
                                success: function (data) {
                                    // console.log(data);
                                    model_pickpoint.pickuppoint();
                                    model_pickpoint.pickuppoint(data.point_data);
                                    //$('.js-map-address').val(data.point_data.address.full_address);
                                    //$('#chosen_address_message').html('Выбран пункт выдачи: ' + data.point_data.address.full_address + ', тел: ' + data.point_data.contact.phone + '<br><span>' + data.point_data.address.comment  + '</span><div style="clear:both;"></div>');
                                    pickpoint_choosen = true;

                                }
                            });
                        }
*/

                        Map.clusterer.removeAll();
                        Map.clusterer.add(Map.geoObjects);

                        Map.map.geoObjects.removeAll();
                        Map.map.geoObjects.add(Map.clusterer);
                    }
                });
            });



            this._init = true;

        },

        suggest: function (onsuccess) {

            if (!pickpoint_choosen) {

                $('.js-map-address').each(function () {
                    var suggest = new ymaps.SuggestView(this);
                    suggest.events.add('select', function (e) {
                        var myGeocoder = ymaps.geocode(e.get('item').value);

                        if (onsuccess) {
                            onsuccess(myGeocoder);
                        }
                    });
                });
            }
        },

        createPlacemark: function (pickpoint) {
            var coords = [];
            coords.push(pickpoint.la);
            coords.push(pickpoint.lo);

            var p = new ymaps.Placemark(coords, null, {
                preset: 'islands#blueIcon',
                draggable: false
            });

            p.name = pickpoint.id;

            p.events.add('click', function () {
                pickpoint_choosen = true;

                model_pickpoint.pickuppoint(pickpoint);
                model_pickpoint.PointWorkHours(JSON.parse(pickpoint.PickupPointWorkHours));
                model_pickpoint.Photo(JSON.parse(pickpoint.Photo));
                model_pickpoint.WorkBreak(pickpoint.WorkBreak.split(';'));

                $.ajax({
                    type: 'POST',
                    url: window.location.pathname,
                    dataType: 'json',
                    data: {
                        task: 'calc_pickpoint_cost',
                        pickpoint: pickpoint
                    },
                    async: false,
                    cache: false,
                    error: function (jqXHR, textStatus) {
                        // console.log("Нет связи с сервером: " + textStatus);
                    },
                    success: function (data) {
                        // console.log(data);
                        delivery_cost = data.result ? data.delivery_cost : 0;
                        $('#deliveryCost')[0].innerHTML = delivery_cost;
                        updateTotalPrice()
                    }
                });

                $('#chosen_address_message').html('Выбран адрес пункта выдачи: ' + pickpoint.Address + '<a href="#" class="items__more-btn" style="float: right; " onclick="show_pickpoint(); return false;"><span>Показать</span></a><div style="clear:both;"></div>');
            });

            this.map.geoObjects.add(p);
            return p;
        },

        placemarkToMap: function (coords) {
            var self = this;
            this.map.panTo(coords).then(function () { self.map.setZoom(14); });
        },

        order: function () {
            var self = this;

            if(!pickpoint_choosen){

                var $inputSuggest = $('.js-map-address');
                var getAddress = function(coords) {
                    ymaps.geocode(coords).then(function (res) {
                        var firstGeoObject = res.geoObjects.get(0);
                        $inputSuggest.val(firstGeoObject.properties.get('name')).focus();
                        self.placemark.properties.set({
                            iconCaption: firstGeoObject.properties.get('name'),
                        });
                        //initSuggest();
                    });
                };

                this.init();

                this.suggest(function (geocoder) {
                    geocoder.then(function (res) {
                        self.placemarkToMap(res.geoObjects.get(0).geometry.getCoordinates());
                        self.placemark.properties.set('iconCaption', e.get('item').displayName);
                    });
                });
            }


            this.map.events.add('click', function (e) {
                var coords = e.get('coords');

                //self.placemarkToMap(coords);
                self.placemark.events.add('dragend', function () {
                    var p = self.placemark;
                    self.map.panTo(p.geometry.getCoordinates());
                    getAddress(p.geometry.getCoordinates(), p);
                });
                getAddress(coords);
            });
        }
    }

    function show_pickpoint() {
        $('[data-remodal-id=pickpoint]').remodal().open();
    }

    // Обработка формы оформления заказа
    document.addEventListener('DOMContentLoaded', function() {
        var checkoutBtn = document.getElementById('checkoutBtn');
        if (!checkoutBtn) return;

        checkoutBtn.addEventListener('click', function(e) {
            e.preventDefault();

            // Проверяем, что корзина не пуста
            if (typeof model_cart === 'undefined' || model_cart.items().length === 0) {
                alert('Корзина пуста');
                return;
            }

            // Собираем данные формы
            var formData = new FormData();
            formData.append('create_order', '1');
            formData.append('recipientName', document.getElementById('recipientName').value);
            formData.append('recipientPhone', document.getElementById('recipientPhone').value);
            formData.append('recipientEmail', document.getElementById('recipientEmail').value);
            formData.append('orderComment', document.getElementById('orderComment').value);

            // Способ доставки
            var deliveryRadio = document.querySelector('input[name="delivery"]:checked');
            if (deliveryRadio) {
                formData.append('delivery', deliveryRadio.value);
            }

            // Способ оплаты
            var paymentRadio = document.querySelector('input[name="payment"]:checked');
            if (paymentRadio) {
                formData.append('payment', paymentRadio.value);
            }

            // Блокируем кнопку
            checkoutBtn.disabled = true;
            checkoutBtn.textContent = 'Оформление...';

            // Отправляем запрос
            fetch('/checkout/', {
                method: 'POST',
                body: formData
            })
            .then(function(response) {
                return response.json();
            })
            .then(function(data) {
                if (data.success) {
                    // Перенаправляем на страницу благодарности
                    //window.location.href = data.redirect || '/thankyoupage/';
                } else {
                    //alert(data.message || 'Ошибка при оформлении заказа');
                    checkoutBtn.disabled = false;
                    checkoutBtn.textContent = 'Оформить заказ';
                }
            })
            .catch(function(error) {
                console.error('Error:', error);
                //alert('Произошла ошибка при оформлении заказа');
                checkoutBtn.disabled = false;
                checkoutBtn.textContent = 'Оформить заказ';
            });
        });

        // Обновление цены доставки при изменении способа доставки
        var deliveryRadios = document.querySelectorAll('input[name="delivery"]');
        deliveryRadios.forEach(function(radio) {
            radio.addEventListener('change', function() {
                if (typeof model_cart !== 'undefined') {
                    model_cart.update_delivery_price(this.value);
                }
            });
        });

        // Инициализируем цену доставки по умолчанию
        var defaultDelivery = document.querySelector('input[name="delivery"]:checked');
        if (defaultDelivery && typeof model_cart !== 'undefined') {
            model_cart.update_delivery_price(defaultDelivery.value);
        }


        // Add new address button - Map Popup
        const addAddressBtn = document.querySelector('.add-address-btn');
        const mapPopup = document.getElementById('map-popup');
        const mapPopupClose = document.getElementById('map-popup-close');
        const mapPopupOverlay = document.querySelector('.map-popup-overlay');
        let mapInitialized = false;
        let myMap = null;

        addAddressBtn.addEventListener('click', function() {
            openMapPopup();
        });

        function openMapPopup() {
            mapPopup.classList.add('active');
            document.body.style.overflow = 'hidden';

            if (!mapInitialized && typeof ymaps !== 'undefined') {
                ymaps.ready(initMap);
            }
        }

        function closeMapPopup() {
            mapPopup.classList.remove('active');
            document.body.style.overflow = '';
        }

        function initMap() {
            if (mapInitialized) return;


            ymaps.ready(function () {
                Map.init();
                Map.map.options.set('maxAnimationZoomDifference', Infinity);
                Map.map.setZoom(12, {duration: 500}).then(() => {/* console.log('yay'); */});

            });

           /*
            myMap = new ymaps.Map('map', {
                center: [55.751574, 37.573856],
                zoom: 12,
                controls: ['zoomControl', 'searchControl', 'geolocationControl']
            });

            myMap.events.add('click', function(e) {
                const coords = e.get('coords');

                myMap.geoObjects.removeAll();

                const placemark = new ymaps.Placemark(coords, {}, {
                    preset: 'islands#blueDotIcon'
                });
                myMap.geoObjects.add(placemark);

                ymaps.geocode(coords).then(function(res) {
                    const firstGeoObject = res.geoObjects.get(0);
                    const address = firstGeoObject.getAddressLine();
                    showNotification('Адрес: ' + address, 'info');
                });
            });
            */

            mapInitialized = true;
        }

        mapPopupClose.addEventListener('click', closeMapPopup);
        mapPopupOverlay.addEventListener('click', closeMapPopup);

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && mapPopup.classList.contains('active')) {
                closeMapPopup();
            }
        });

    });

    // Обновление модели корзины после загрузки страницы (если данные изменились)
    // Это нужно на случай, если server_cart был обновлен после инициализации модели
    if (typeof model_cart !== 'undefined' && typeof server_cart !== 'undefined' && server_cart.data) {
        // console.log('=== Updating cart model from server_cart.data ===');
        // console.log('server_cart.data:', server_cart.data);
        // console.log('Items count in server_cart.data:', Object.keys(server_cart.data.items || {}).length);
        
        // Обновляем корзину через ko.mapping
        var currentCart = model_cart.cart();
        var updatedCart = ko.mapping.fromJS(server_cart.data, {}, currentCart);
        model_cart.cart(updatedCart);
        
        // console.log('Cart model updated. Items count:', model_cart.items().length);
        // console.log('===============================================');
        
        // Убеждаемся, что bindings применены к .order-summary
        // Используем setTimeout, чтобы дать время для обновления observable
        setTimeout(function() {
            var $orderSummary = $('.checkout-sidebar .order-summary');
            if ($orderSummary.length > 0) {
                // console.log('=== Checking .order-summary bindings ===');
                // console.log('Items count in model:', model_cart.items().length);
                // console.log('Has bindings:', ko.dataFor($orderSummary[0]) !== undefined);
                
                if (ko.dataFor($orderSummary[0]) === undefined) {
                    // console.log('Applying bindings to .order-summary after model update');
                    ko.applyBindings(model_cart, $orderSummary[0]);
                } else {
                    // console.log('Bindings already applied to .order-summary');
                    // Принудительно обновляем все computed observables
                    ko.tasks.runEarly();
                }
                // console.log('==========================================');
            }
        }, 200);
    }

</script>

<style>
.promo-message {
    margin-top: 8px;
    padding: 8px;
    border-radius: 4px;
    font-size: 14px;
}
.promo-message.success {
    background: #d4edda;
    color: #155724;
}
.promo-message.error {
    background: #f8d7da;
    color: #721c24;
}
.promo-applied {
    margin-top: 8px;
    padding: 8px;
    background: #d4edda;
    color: #155724;
    border-radius: 4px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.btn-remove-promo {
    background: none;
    border: none;
    color: #155724;
    font-size: 20px;
    cursor: pointer;
    padding: 0;
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-remove-promo:hover {
    background: rgba(0,0,0,0.1);
    border-radius: 50%;
}
</style>
</body>
</html>