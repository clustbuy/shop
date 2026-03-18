<style>
    .order-step__inn button {
        margin-left: 0px;
        background: #4099FD;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
        font: 400 17px/41px "Roboto Slab", "Times New Roman", serif;
        padding: 0;
        text-align: center;
        width: 50%;
    }
</style>

<div class="p-order">
    <div class="back-link">

    </div>
    <div class="l-order">
        <div class="l-order__inn">
            <form autocomplete="off" class="l-order__main" method="POST" action="/order/" id="order_form">
                <input type="hidden" name="tpl" value="order_complete"/>
                <div class="title h1">
                    Оформление заказа
                </div>


                <div class="order-step">
                    <div class="order-step__header">
                        <div class="order-step__header-inn">
                            <div class="order-step__header-icon">
                                <div class="order-step__icon"> <i class="ticon ticon-location-1 "></i> </div>
                            </div>
                            <div class="order-step__header-title">
                                <div class="order-step__title">Адрес получения</div>
                            </div>
                            <div class="order-step__header-edit js-order-step-edit"><a href="#" class="order-step__edit">Изменить</a> </div>
                        </div>
                    </div>

                    <div class="order-step__inn"  style="display: block;">


                        <div class="form-row">
                            <div id="map"></div>
                        </div>

                    </div>
                </div>


                <div id="chosen_address_message" class="border-block p-order__items"  style="padding-top: 16px;    margin: 16px auto 16px !important;">

                </div>

                <div class="order-step">
                    <div class="order-step__header">
                        <div class="order-step__header-inn">
                            <div class="order-step__header-icon">
                                <div class="order-step__icon">
                                    <i class="ticon ticon-user-2 "></i>
                                </div>
                            </div>
                            <div class="order-step__header-title">
                                <div class="order-step__title">
                                    Контактная информация
                                </div>
                            </div>
                            <div class="order-step__header-edit js-order-step-edit">
                                <a href="#" class="order-step__edit">Изменить</a>
                            </div>
                        </div>
                    </div>
                    <div class="order-step__inn" style="display: block;">

                        <div class="form-row">
                            <div class="complex-input  js-complex-input-customer_name">
                                <div class="complex-input__required"></div>
                                <input type="hidden" name="phone_prefix" id="phone_prefix"  value="+7">
                                <input name="phone" type="text" id="phone" class="input js-phone-mask"
                                       placeholder="+7 (___) ___-__-__" autocomplete="off">
                            </div>
                        </div>


                        <div class="form-row">
                            <div class="complex-input  js-complex-input-customer_name">
                                <div class="complex-input__required"></div>
                                <label class="complex-input__label">Имя</label>
                                <input name="customer_name" type="text" class="input" >
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="complex-input js-complex-input-email">
                                <div class="complex-input"></div>
                                <label class="complex-input__label">E-mail</label>
                                <input name="email" type="text" id="email" class="input">
                            </div>
                        </div>

                    </div>
                </div>


            </form>
            <aside class="l-order__aside cart">
                <div class="bg-block js-order-total">
                    <input type="text" name="total_cart_sum" id="total_cart_sum" data-bind="textInput: total_cart_sum()"
                           style="display:none;"/>
                    <div class="bg-block js-order-total">
                        <div class="bg-block__group p-order__total">
                          <div class="p-order__total-title">Итого</div>
                          <div class="order-info">
                            <dl class="order-info__row"> <dt class="order-info__label">Бонусных рублей</dt>
                              <dd class="order-info__value"><span class="text-style2">0 р.</span></dd>
                            </dl>
                            <dl class="order-info__row"> <dt class="order-info__label">Стоимость</dt>
                              <dd class="order-info__value"><span class="" data-bind="text: total_cart_sum()"></span> р.</dd>
                            </dl>
                            <dl class="order-info__row"> <dt class="order-info__label">Доставка</dt>
                                <dd class="order-info__value"><span id="deliveryCost"></span> р.</dd>
                            </dl>
                            <dl class="order-info__row"> <dt class="order-info__label">Всего к оплате</dt>
                              <dd class="order-info__value">
                                <div class="price"><span id="totalPrice"></span> р.</div>
                              </dd>
                            </dl>
                          </div> <button type="submit"
                                         class="btn btn--vinous item-meta__cart waves-effect waves-light"
                                         id="confirm-btn">Отправить заказ</button>
                        </div>
                        <div class="bg-block__group">
                            <a href="#" onclick="$('.promo-input').show(); $(this).remove(); return false;"
                               class="link"> <i class="ticon ticon-discount-2 text-red"></i> <span>У меня есть промокод на скидку</span></a>
                            <div class="promo-input">
                                <div class="promo-input__label">
                                    Введите промокод
                                </div>
                                <div class="promo-input__inn">
                                    <div class="promo-input__left">
                                        <input id="promocode" type="text" class="promo-input__input promo"
                                               placeholder="Промокод">
                                    </div>
                                    <div class="promo-input__right">
                                        <button class="promo-input__btn" onclick="applyDiscount()">
                                            ОК
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="border-block p-order__items">
                    <!-- ko foreach: cart().items() -->
                    <div class="item-order">
                        <div class="item-order__inn">
                            <div class="item-order__photo">
                                <a data-bind="attr: {href: `/product/${guid()}`}"><img width="40" height="40"
                                                 data-bind="attr: {src: gallery()[0]}"/></a>
                            </div>
                            <div class="item-order__info">
                                <a class="item-order__name"
                                   data-bind="text: title, attr: {href: `/product/${guid()}`} "></a>
                            </div>
                        </div>
                    </div>
                    <!-- /ko -->


                    <div class="p-order__items-edit">
                        <a href="#cart" class="link"><span>Изменить</span></a>
                    </div>
                </div>
                 <div style="display:none;" class="tinkoff">
                    <form name="TinkoffPayForm" id="TinkoffPayForm">
                        <input type="text" name="terminalkey" value="1681890199570">
                        <input type="text" name="frame" value="false">
                        <input type="text" name="language" value="ru">
                        <input type="hidden" name="receipt" value="">
                        <input type="text" id="amount" placeholder="Сумма заказа" name="amount">
                        <input type="text" id="order" placeholder="Номер заказа" name="order">
                        <input type="text" id="description" placeholder="Описание заказа" name="description">
                        <input type="text" id="phone" placeholder="Контактный телефон" name="phone">
                    </form>
                </div>
            </aside>
        </div>
    </div>
</div>

<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<script>

function notificationme(){
toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "100",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "show",
            "hideMethod": "hide"
        };
toastr.info('MY MESSAGE!');
}
</script>

<script>

if (navigator.geolocation) {
  console.log('Геолокация доступна');
}
else {
  console.log('Геолокация не доступна');
}

    navigator.geolocation.getCurrentPosition(function(position) {

        // Get the coordinates of the current position.
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        console.log(lat);
        console.log(lng);

    });

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
            if($('.balloon-pvz')[0])
                ko.applyBindings(model_pickpoint, $('.balloon-pvz')[0]);
    });

    function updateTotalPrice() {
        $('#totalPrice')[0].innerHTML = (Number(model_cart.total_cart_sum() * 100) + Number(delivery_cost * 100)) / 100;
        Tinkoff_pay_form.amount.value = (Number(model_cart.total_cart_sum() * 100) + Number(delivery_cost * 100)) / 100;
    }

    async function applyDiscount() {
        model_cart.promocode_input($('#promocode').val())
        await model_cart.try2apply_promocode().then(() => updateTotalPrice())
    }

    var phone_num = '';
    var code_checked = 0;
    var pickpoint_choosen = false;
    var delivery_cost = 0;
    var Tinkoff_pay_form = document.getElementById('TinkoffPayForm');


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
                    console.log('Геолокация доступна');

                    // Get the coordinates of the current position.
                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    defPoint = [lat,lng];
                    console.log(lat);
                    console.log(lng);

                }, function(err) {
                    console.log('Геолокация не доступна');
                    console.warn(`ERROR(${err.code}): ${err.message}`);
                });
            }
            else {
                console.log('Геолокация не доступна');
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
                        console.log("Нет связи с сервером: " + textStatus);
                    },
                    success: function (data) {
                        console.log(data);
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
                console.log('Новые координаты карты:', newBounds);
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
                        console.log("Нет связи с сервером: " + textStatus);
                    },
                    success: function (data) {
                        console.log(data);
                        Map.points.length = 0;

                        for (var i = 0, len = data.points.length; i < len; i++) {
                            //Map.createPlacemark(data.points[i]);
                            Map.points.push([parseFloat(data.points[i].la),parseFloat(data.points[i].lo)]);
                        }
                        console.log(Map.points);

                        Map.geoObjects = [];
                        let pointOptions = getPointOptions();
                        for(var i = 0, len = Map.points.length; i < len; i++) {

                            var pnts = Map.points[i];
                            //console.log(pnts);

                            var placemark =  new ymaps.Placemark(Map.points[i], null ,pointOptions);
                            //placemark.setBalloonOptions({ mapAutoPan: false });

                            
                            placemark.events.add('click', function (e) {
                                    
                                    var coords = e.get('target').geometry.getCoordinates();
                                    console.log(coords);
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
                                            console.log("Нет связи с сервером: " + textStatus);
                                        },
                                        success: function (data) {
                                            console.log(data);
                                            selectPoint = coords;
                                            localStorage.setItem('pickpoint_data', JSON.stringify(coords));
                                            localStorage.setItem('pickpoint_address', data.point_data.address.full_address);
                                            $('.js-map-address').val(data.point_data.address.full_address);
                                            $('#head-map-address').text(data.point_data.address.full_address);
                                            $('#chosen_address_message').html('Выбран пункт выдачи: ' + data.point_data.address.full_address + ', тел: ' + data.point_data.contact.phone + '<br><span>' + data.point_data.address.comment  + '</span><div style="clear:both;"></div>');
                                            var myPlacemark = e.get('target');

                                            myPlacemark.properties.set('balloonContent', 'Выбран пункт выдачи:<br>'+data.point_data.address.full_address);
                                            myPlacemark.balloon.open();
                                            pickpoint_choosen = true;

                                        }
                                    });
                            });/**/


                            Map.geoObjects[i] = placemark;
                        }

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
                                    console.log("Нет связи с сервером: " + textStatus);
                                },
                                success: function (data) {
                                    console.log(data);
                                    $('.js-map-address').val(data.point_data.address.full_address);
                                    $('#chosen_address_message').html('Выбран пункт выдачи: ' + data.point_data.address.full_address + ', тел: ' + data.point_data.contact.phone + '<br><span>' + data.point_data.address.comment  + '</span><div style="clear:both;"></div>');
                                    pickpoint_choosen = true;

                                }
                            });
                        }

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
                        console.log("Нет связи с сервером: " + textStatus);
                    },
                    success: function (data) {
                        console.log(data);
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

    function tinkoffPayFunction() {
        let form = Tinkoff_pay_form;
        let name = `Оплата заказа номер ${form.order.value}`;
        let amount = form.amount.value * 100;
        let phone = form.phone.value;

        if (amount === 0 || !phone) {
            alert("Неправильная сумма или не указан телефон");
            return false
        }

        form.receipt.value = JSON.stringify({
            "Phone": phone,
            "EmailCompany": "info@ru.market",
            "Taxation": "osn",
            "Items": [
                {
                    "Name": name,
                    "Price": amount,
                    "Quantity": 1.00,
                    "Amount": amount,
                    "PaymentMethod": "full_prepayment",
                    "PaymentObject": "commodity",
                    "Tax": "vat20"
                }
            ]
        });

        pay(form);
    }

    function check_phone_num() {
        const form = document.getElementById('order_form');
        const form_data = new FormData(form);
        var phone_prefix    = form_data.get('phone_prefix'); // +7
        var phone = form_data.get('phone');                  // (964) 535-13-31

        var phone_regex = /^([(]{1}9\d\d[)]{0,}){0,}\ (\d\d\d)[\s|-]?[\s|-]?(\d\d)[\s|-]?(\d\d)$/;
        if (!phone_regex.test(phone)) {
            toastr.error('Исправьте номер телефона');
            return false;
        }

        phone_num = phone_prefix.replace('+', '') + phone.replace(/\D/g, '');
    }


    $(document).ready(function () {
        $('#deliveryCost')[0].innerHTML = 0
        $('#totalPrice')[0].innerHTML = model_cart.total_cart_sum()
        Tinkoff_pay_form.amount.value = number_format($('#total_cart_sum').val(), 2, '.', '');

        ymaps.ready(function () {
            Map.init();
            Map.map.options.set('maxAnimationZoomDifference', Infinity);
            Map.map.setZoom(12, {duration: 500}).then(() => console.log('yay'));

        })


        $("#confirm-btn").on('click', function (e) {

            var error = 0;

            const form = document.getElementById('order_form');
            const form_data = new FormData(form);

            var phone_prefix = form_data.get('phone_prefix');    // +7
            var phone = form_data.get('phone');           // (964) 535-13-31
            var email           = form_data.get('email').trim();    //
            var customer_name   = form_data.get('customer_name').trim();

            if (phone.length == 0) {
                error = 1;
                toastr.error('Отсутствует номер телефона');
            }

            if (pickpoint_choosen == false) {
                error = 1;
                toastr.error('Не выбран пункт доставки');
            }

            if(customer_name.length>0)
            {
                var customer_name_regex = /([А-ЯЁ][а-яё]+[\-\s]?)/;
                if(!customer_name_regex.test(customer_name)){
                    error = 1;
                    toastr.error('Напишите корректное имя');
                } else if (customer_name.length > 150) {
                     error = 1;
                     toastr.error('Имя длиннее 150 символов.');
                }

            }

            if (error === 1) {

                console.log('Ошибка  error === 1 ');
                return false;
            }

            $.ajax({
                type: 'POST',
                url: window.location.pathname,
                dataType: 'json',
                data: {
                    task: 'order_complete',
                    phone: phone_prefix.replace('+', '') + phone.replace(/\D/g, ''),
                    fio: customer_name,
                    email: email
                },
                async: true,
                cache: false,
                error: function (jqXHR, textStatus) {
                    console.log("Нет связи с сервером: " + textStatus);
                },
                success: function (data) {
                    if (data.result) {
                        const form = document.getElementById('order_form');
                        const form_data = new FormData(form);
                        Tinkoff_pay_form.order.value = data.order_id;
                        Tinkoff_pay_form.phone.value = form_data.get('phone');

                        tinkoffPayFunction()
                    } else {
                        toastr.error(data.error);
                    }
                }
            });
        });
    });

    (function () {

        $('.js-complex-input-customer_name').each(function () {
            var $parent = $(this);
            $parent.prepend('<span class="complex-input__status"></span>')
            $parent.find('input, textarea').focus(function () {
                $parent.addClass('is-focus');
                $parent.find('.complex-input__error').fadeOut(null, function () { $(this).remove(); })
            }).focusout(function () {

                $parent.removeClass('is-focus');

                if (this.name === 'customer_name'){
                    var customer_name = this.value.trim();

                                if(customer_name.length>0)
                                {
                                    var customer_name_regex = /^([А-ЯЁA-Z][а-яёa-z]+[\-\s]?){1,3}$/;
                                    if(!customer_name_regex.test(customer_name)){
                                        error = 1;
                                        toastr.error('Напишите корректное имя');
                                        $parent.addClass('is-not-empty').removeClass('is-valid');
                                    } else if (customer_name.length > 150) {
                                        error = 1;
                                        toastr.error('Имя длиннее 150 символов.');
                                    }
                                    else
                                    {
                                        $parent.addClass('is-not-empty').addClass('is-valid');
                                    }

                                }
                                else{
                                    $parent.removeClass('is-not-empty').removeClass('is-valid');
                                }
                }
            });
        });

        $('.js-complex-input-email').each(function () {
            var $parent = $(this);
            $parent.prepend('<span class="complex-input__status"></span>')
            $parent.find('input, textarea').focus(function () {
                $parent.addClass('is-focus');
                $parent.find('.complex-input__error').fadeOut(null, function () { $(this).remove(); })
            }).focusout(function () {

                $parent.removeClass('is-focus');

                if (this.name === 'email'){
                    var email = this.value.trim();

                                if(email.length>0)
                                {
                                    var email_regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                                    if(!email_regex.test(email)){
                                        error = 1;
                                        toastr.error('Исправьте email');
                                        $parent.addClass('is-not-empty').removeClass('is-valid');
                                    }
                                    else
                                    {
                                        $parent.addClass('is-not-empty').addClass('is-valid');
                                    }

                                }
                                else{
                                    $parent.removeClass('is-not-empty').removeClass('is-valid');
                                }
                }


            });
        });

        $('.js-complex-input-phone').each(function () {
            const $parent = $(this);
            $parent.prepend('<span class="complex-input__status"></span>')
            $parent.find('input, textarea').focus(function () {
                $parent.addClass('is-focus');
                $parent.find('.complex-input__error').fadeOut(null, function () { $(this).remove(); })
            }).focusout(function () {
                check_phone_num();
            });
        });
    })();



</script>

