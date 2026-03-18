<!DOCTYPE html>
<html lang="ru">
    <head>
    <meta charset="utf-8">
    <title>Ru.Market - онлайн-гипермаркет с прямой доставкой со склада</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="format-detection" content="telephone=no"/>
<meta name="mobile-web-app-capable" content="yes"/>
~~include file="market/tpl/favicon.tpl"~
    <link rel="stylesheet" type="text/css" href="/assets/css/libs.css"/>
<link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css"/>
<link rel="stylesheet" type="text/css" href="/assets/css/app.css"/>
<link rel="stylesheet" type="text/css" href="/assets/css/new.css"/>
<link rel="preconnect" href="https://fonts.gstatic.com"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"/>

<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){

    $("[data-toggle='location-dropdown']").click(function(e) {
        $(".location-dropdown").toggleClass("hidden");
        e.stopPropagation();
    });
});
</script>
~~include file="tpl/js.tpl"~
</head>

<body>

<div class="modal remodal md-cart" data-remodal-id="cart">
    <button class="modal__close close-btn" data-remodal-action="close">
        Закрыть
    </button>
    <div class="title h1">
        Товар добавлен в корзину
    </div>
    <div class="md-cart__header">
        <div class="md-cart__header-left">
            <div class="text">
                Всего товаров в корзине <a class="link link--ul" href="/cart/"><b data-bind="text: total_cart_amount"></b></a>
            </div>
        </div>
        <div class="md-cart__header-right">
            <div class="text">
                До окончания резерва осталось
                <div class="bg-countdown">
                    <span data-countdown="~~$now.year~/~~$now.month~/~~$now.day~ 23:59:59" class="js-countdown"></span>
                </div>
            </div>
        </div>
    </div>

    <!-- ko foreach: cart().items() -->
    ~~*
    <span data-bind="html: (console.log(guid()))"></span>

    <a href="#" class="remove-btn item-click__remove js-item-remove"
       data-bind="click: $root.remove_from_cart.bind($data, guid())"
    ><i></i></a>

    <div class="item-click item-click--row">
        <div class="item-click__inn">
            <div class="item-click__photo">
                <a data-bind="attr: {href: $root.full_link($data, $data)}"> <img class="item-click__img" data-bind="attr:{src: Items[guid()].img_url}"> </a>
            </div>
            <div class="item-click__info">
                <div class="item-click__row">
                    <div>
                        <a class="item-click__name" data-bind="text: Items[guid()].title, attr: {href: $root.full_link($data, $data)}"></a>
                    </div>
                    <div class="item-click__num">
                        <div class="item-count js-item-count js-itemd-cart-count" data-price="2790" data-max="11">
                            <button type="button" data-el="minus" class="item-count__minus" data-bind="click: $root.amount_minus.bind($data, guid())">
                                -
                            </button>
                            <div class="item-count__num">
                                <input type="text" data-el="num" data-bind="textInput: product_amount" />
                            </div>
                            <button type="button" data-el="plus" class="item-count__plus" data-bind="click: $root.amount_plus.bind(guid(), $data)">
                                +
                            </button>
                        </div>
                    </div>
                    <div class="item-click__price">
                        <div class="price">
                            <span class="js-item-click-price js-odometer" data-bind="text:Math.round(Number(Items[guid()].cost*product_amount()))"></span> ₽
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    *~
    <!-- /ko -->

    <div class="md-cart__bottom">
        <div class="md-cart__bottom-left">

        </div>
        <div class="md-cart__bottom-center">
            <div class="progress-bar js-cart-progress-bar" data-to="1500">
                <div class="progress-bar__row">
                    <div class="progress-bar__from">
                        0
                    </div>
                    <div class="progress-bar__p">
                        <div class="progress-bar__line">
                            <div data-el="bar" style="width: 70%;" class="progress-bar__bar"></div>
                        </div>
                    </div>
                    <div class="progress-bar__to">
                        1500 ₽
                    </div>
                </div>
                <div class="progress-bar__hint">
                    Осталось <b><span data-el="left">780</span> руб.</b> для бесплатной доставки
                </div>
            </div>
        </div>
        <div class="md-cart__bottom-right">
            <a href="/order/" class="btn btn--vinous">Оформить заказ</a>
        </div>
    </div>
</div>

<div id="__ozon">

    <div id="layoutPage" class="a0 a2">
        <div data-replace-layout-path="[0]" class="b0 b2" style="width:auto;" data-widget="blockVertical">
					<div data-replace-layout-path="[0][0]" ~~*class="e3"*~ style="top:0;z-index:12;" data-widget="stickyContainer">
						<div class="a5g h4e" data-widget="webToAppBanner">
								<a href="/">
									<img alt="" src="/images/logo.svg" style="height:32px;">
								</a>
								<noindex style="margin-left: auto;">
									<span></span>
								</noindex>
								<div class="e5h a2429-a hidden">
								</div>
						</div>
					</div>
            <div class="od2" data-widget="navBar">
                <div class="o2d"></div>
                <div class="do3">
                    <div data-replace-layout-path="[1][0]">
                        <div data-widget="searchBarMobile">
                            <div class="ww7">
                                <div class="w8w">
                                    <div class="ww9">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="w9w">
                                            <path fill="currentColor" d="M7 3a4 4 0 1 0 0 8 4 4 0 0 0 0-8ZM1 7a6 6 0 1 1 10.895 3.47l2.814 2.824a1 1 0 1 1-1.418 1.412l-2.808-2.82A6 6 0 0 1 1 7Z"></path>
                                        </svg>
                                        <input placeholder="поиск" autocapitalize="off" autocomplete="off" autocorrect="off" spellcheck="false" name="text" value="" class="wx">
                                        <!---->
                                    </div>
                                    <div data-widget-disallow="[1][0][0]"></div>
                                    <!---->
                                </div>
                                <div data-widget-disallow="[1][0][0]"></div>
                            </div>
                            <!---->
                        </div>
                    </div>
                </div>
                <div class="d3o">
                    <div data-replace-layout-path="[1][1]" class="od3">
                        <div class="vz0" data-widget="modalButton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <path fill="currentColor" d="M3 6a1 1 0 0 1 1-1h16a1 1 0 1 1 0 2H4a1 1 0 0 1-1-1Zm0 6a1 1 0 0 1 1-1h16a1 1 0 1 1 0 2H4a1 1 0 0 1-1-1Zm1 5a1 1 0 1 0 0 2h10a1 1 0 1 0 0-2H4Z"></path>
                            </svg>
                        </div>
                        <div class="e0m" data-widget="iconButton">
                            <div class="a2429-a">
                                <button tabindex="0" type="button" class="a2429-a4" style="border-radius:8px;">
									<span class="a2429-b1 a2429-c0 a2429-f0" style="border-radius:8px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9" style="color: rgb(0, 26, 52);">
											<path fill="currentColor" d="M13 15a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-3-6.5c0-.665.717-1.5 2-1.5s2 .835 2 1.5c0 .46-.108.626-.167.696-.084.101-.225.196-.554.343a7.19 7.19 0 0 1-.17.073c-.622.264-1.726.73-2.08 2.146a1 1 0 1 0 1.941.485c.106-.423.296-.508 1.009-.826l.117-.053c.358-.16.874-.407 1.274-.888.426-.511.63-1.167.63-1.976C16 6.404 14.03 5 12 5 9.97 5 8 6.404 8 8.5a1 1 0 0 0 2 0Z"></path><path fill="currentColor" d="M8 2a7 7 0 0 0-7 7v4a6.002 6.002 0 0 0 5 5.917V22a1 1 0 0 0 1.707.707L11.414 19H16.5a1 1 0 0 0 .297-.045A7.001 7.001 0 0 0 23 12V9a7 7 0 0 0-7-7H8Zm8 15h-5.003a.996.996 0 0 0-.697.286l-.008.008L8 19.586V18a1 1 0 0 0-1-1 4 4 0 0 1-4-4V9a5 5 0 0 1 5-5h8a5 5 0 0 1 5 5v3a5 5 0 0 1-5 5Z"></path>
										</svg><span class="a2429-e7"></span></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div data-addressbookbar="" class="ap5 p4a" data-widget="addressBookBarWeb">
                <div class="d4147-a pa4 p4a">
                    <div action="[object Object]" trackinginfo="[object Object]" class="pa2 pa3 p2a">
                        <div class="a3p a2429-a">
                            <button tabindex="0" type="button" class="a2429-a4" style="border-radius:8px;">
								<span class="a2429-b1 a2429-c0 a2429-f0" style="border-radius:8px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9" style="color: rgb(0, 26, 52);">
										<path fill="currentColor" d="M12 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10Zm-3 5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Z"></path><path fill="currentColor" d="M12 1a9 9 0 0 0-9 9c0 2.514 1.136 4.848 2.699 6.942 1.565 2.099 3.631 4.05 5.643 5.81a1 1 0 0 0 1.316 0c2.012-1.76 4.078-3.711 5.644-5.81C19.864 14.848 21 12.514 21 10a9 9 0 0 0-9-9Zm-7 9a7 7 0 0 1 14 0c0 1.904-.864 3.82-2.302 5.746-1.275 1.71-2.945 3.353-4.698 4.92-1.753-1.567-3.423-3.21-4.699-4.92C5.864 13.82 5 11.904 5 10Z"></path>
									</svg><span class="a2429-e7"></span></span>
                            </button>
                        </div>
                        <div data-content="" class="ap3 p2a">
                            <div class="p0a ap1 a1p ap4">
                                <div class="b7a p1a ap2" style="color:#001a34;">
                                    <span class="tsBody400Small">Москва</span>
                                </div>
                                <!---->
                            </div>
                            <!---->
                            <div class="p0a ap4">
                                <div class="b7a" style="color:#005bff;">
                                    <span class="tsBody400Small">Укажите адрес доставки</span>
                                </div>
                                <!---->
                            </div>
                        </div>
                        <!---->
                    </div>
                </div>
            </div>

            ~~*
            <div class="p5d" data-widget="navigationSlider">
                <div class="pd7">
                    <div class="a3148-a2">
                        <div class="a3148-a3">
                            <div class="a3148-a4" style="transition-duration:300ms;transform:translateX(0px);">
                                <div class="d6p a3148-a1">
                                    <a target="_blank" href="/highlight/preseyl-11-11-1212999/" rel="noopener" class="a5g pd6" style="width:20%;">
                                        <div class="p7d">
                                            <div class="u1d d8p">
                                                <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/1e/tc3/wc100/pre_11_i.png" class="ud3 b9414-a">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tsBody300XSmall pd8 p8d">
                                            Pre-sale 11.11
                                        </div></a><a target="_blank" href="https://finance.ozon.ru/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/1d/t1e/wc100/ozb_i.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Карта ClustBUY Банка
                                    </div></a><a target="_blank" href="/travel/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/69/taa/wc100/ic_service_travel.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Билеты, Отели, Туры
                                    </div></a><a target="_blank" href="https://www.ozon.ru/highlight/tovary-kampanii-rasprodazha-stoka-auto-1024701/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/a9/tef/wc100/ls_i.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Ликвидация
                                    </div></a><a target="_blank" href="/highlight/globalpromo/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/65/tb0/wc100/3.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Акции и скидки
                                    </div></a>
                                </div>
                                <div class="d6p a3148-a1">
                                    <a target="_blank" href="/buyAgain/" rel="noopener" class="a5g pd6" style="width:20%;">
                                        <div class="p7d">
                                            <div class="u1d d8p">
                                                <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/1c/t73/wc100/all_for_for_you.png" class="ud3 b9414-a">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tsBody300XSmall pd8 p8d">
                                            Всё для вас
                                        </div></a><a target="_blank" href="/category/zhenskaya-odezhda-7501/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/df/tfc/wc100/apparel-i-2.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Одежда и обувь
                                    </div></a><a target="_blank" href="/category/dom-i-sad-14500/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/60/tf5/wc100/ic_xs_category_household_1.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Дом и сад
                                    </div></a><a target="_blank" href="/category/elektronika-15500/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/43/t52/wc100/ic_category_electronics_1.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Электроника
                                    </div></a><a target="_blank" href="/partpayment/limit/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/3e/t98/wc100/rassroch_i_1.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Рассрочка от Ozon
                                    </div></a>
                                </div>
                                <div class="d6p a3148-a1">
                                    <a target="_blank" href="/premium/" rel="noopener" class="a5g pd6" style="width:20%;">
                                        <div class="p7d">
                                            <div class="u1d d8p">
                                                <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/a1/t8d/wc100/ic_service_premium.png" class="ud3 b9414-a">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tsBody300XSmall pd8 p8d">
                                            ClustBUY Premium
                                        </div></a><a target="_blank" href="/product/elektronnyy-podarochnyy-sertifikat-million-podarkov-3000-ozon-135382627/?perehod=navigationb2capp" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/77/t13/wc100/ic_service_gift_cards4.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Сертификаты
                                    </div></a><a target="_blank" href="/highlight/express/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/af/tf1/wc100/ic_express.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Доставка от 1 часа
                                    </div></a><a target="_blank" href="/highlight/ozon-global/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/fd/t0a/wc100/ic_service_global_2.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        Из-за рубежа
                                    </div></a><a target="_blank" href="/special/care/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/e6/t03/wc100/care_n.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        ClustBUY Забота
                                    </div></a>
                                </div>
                                <div class="d6p a3148-a1">
                                    <a target="_blank" href="https://seller.ozon.ru/" rel="noopener" class="a5g pd6" style="width:20%;">
                                        <div class="p7d">
                                            <div class="u1d d8p">
                                                <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/7c/t1f/wc100/ic_service_ozon_seller.png" class="ud3 b9414-a">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tsBody300XSmall pd8 p8d">
                                            Стать продавцом
                                        </div></a><a target="_blank" href="https://www.ozon.ru/business/" rel="noopener" class="a5g pd6" style="width:20%;">
                                    <div class="p7d">
                                        <div class="u1d d8p">
                                            <div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/35/t74/wc100/ic_service_b2b.png" class="ud3 b9414-a">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tsBody300XSmall pd8 p8d">
                                        ClustBUY для бизнеса
                                    </div></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p6d">
                        <span class="dp7 d7p"></span><span class="dp7"></span><span class="dp7"></span><span class="dp7"></span>
                    </div>
                </div>
            </div>

            <div class="s9d" style="height:8px;background-color:rgba(255, 255, 255, 1);" data-widget="separator"></div>

            <div class="me0" style="height:4px;background:rgba(245, 247, 250, 1);" data-widget="islandSeparator">
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;left:0;">
                    <g clip-path="#island-topLeft">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-topLeft">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;right:0;transform:scale(-1, 1);">
                    <g clip-path="#island-topRight">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-topRight">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
            </div>

            <div class="me0" style="height:4px;background:rgba(245, 247, 250, 1);" data-widget="islandSeparator">
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;left:0;transform:scale(1, -1);">
                    <g clip-path="#island-bottomLeft">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-bottomLeft">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;right:0;transform:scale(-1, -1);">
                    <g clip-path="#island-bottomRight">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-bottomRight">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
            </div>

            <div data-replace-layout-path="[7][0]" class="container b4 b6" data-widget="container">
                <div class="s9d" style="height:12px;" data-widget="separator"></div>
                <div class="n6b n7b n9b b7n" data-widget="blackFridayCounter"><img elementtiming="lcp_eltiming_blackFridayCounter-3288209-default-1" loading="lazy" fetchpriority="high" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc400/286_counter_mobile_backgroundAnnouncement_f19662ef-99d2-48ef-900d-d8d9efaf9c33.png" class="nb8 b9414-a">
                    <div class="n8b"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc400/286_counter_mobile_logoAnnouncement_f19662ef-99d2-48ef-900d-d8d9efaf9c33.png" class="bn9 b9414-a">
                        <div class="nb9" style="justify-content:space-between;">
                            <div class="b9n tsBodyControl300XSmall" style="background-color:#001A34;color:#FFFFFF;">
                                <span class="n5b"> 2&nbsp;дня </span>
                                <div class="bo">
                                    до старта
                                </div>
                            </div>
                            <div class="ob">
                                <div class="b0o">
                                    <!---->
                                    <div class="ob0">
                                        Для Premium с 30.10
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="o0b">
                                        <path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
                                    </svg>
                                </div>
                                <!---->
                            </div>
                        </div>
                    </div>
                    <!---->
                </div><div class="s9d" style="height:12px;" data-widget="separator"></div>
                <div class="bp2 b2p" data-widget="hammers">
                    <div class="o5b bo7 o7b">
                        <div class="ob5">
                            <div class="b7o"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc150/286_widget_settings_hammers_announcement_mobile_logo_f014f503-bd98-4e8e-94af-6c3c177131d3.png" class="o6b b9414-a"><!---->
                            </div>
                            <div class="ob7">
                                <div class="b7a tsBody400Small ob6" style="color:rgba(0, 26, 52, 0.6);">
                                    <span class="tsBody400Small">31.10 в 00:00 мск</span>
                                </div>
                                <div class="bo8">
                                    <!---->
                                    <div class="a2429-a ob8 b8o">
                                        <button tabindex="0" type="button" class="a2429-a4" style="border-radius:8px;">
											<span class="a2429-b1 a2429-c a2429-f0" style="border-radius:8px;">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9" style="color: var(--cbPrimaryColor);">
													<path fill="currentColor" d="M4.614 14.418c-.171-.244-.159-.602.139-.585 0 0 1 .157 2.247.157 1.261 0 2.247-.156 2.247-.156.297-.021.313.313.146.558C8.94 15.055 7.953 15.5 7 15.5c-.94 0-1.93-.434-2.386-1.082Zm8.219-12.251c.46 0 .834.373.834.833v.833h.833a.833.833 0 1 1 0 1.667h-.833v.833a.833.833 0 1 1-1.667 0V5.5h-.833a.833.833 0 0 1 0-1.667H12V3c0-.46.373-.833.833-.833Z"></path><path fill="currentColor" d="M7 .5c.46 0 .833.373.833.833a5.7 5.7 0 0 1 .834.15c.833.217.833.635.58 1.061a4.167 4.167 0 0 0 3.586 6.29c.417 0 .834 0 .834.833C13.667 11.333 11.174 13 7 13 2.826 13 .333 11.333.333 9.667c0-.88.366-1.346.75-1.836.162-.206.327-.417.47-.664.233-.407.378-.962.537-1.568l.005-.02c.453-1.732 1.026-3.92 4.072-4.246C6.167.873 6.54.5 7 .5Z"></path>
												</svg><span class="a2429-e7"></span></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p2b">
                        <div class="o8b bo9">
                            <a target="_blank" href="/product/sapogi-nordman-817172147/?campaignId=286" rel="noopener" class="a5g b9o">
                                <div class="ob9" style="opacity:1;">
                                    <div class="o9b bp"><img elementtiming="lcp_eltiming_hammers-3288211-default-1_0" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-3/wc200/6817008987.jpg" class="b9414-a">
                                    </div>
                                </div> <!---->
                                <div class="b0p bo9">
                                    <div class="pb0">
                                        <div tabindex="1" class="p0b b410-a0 b410-a6" style="background-color:rgba(245, 247, 250, 1);color:rgba(0, 26, 52, 1);">
                                            <div class="b410-b">
                                                <div title="1 шт. в руки" class="b410-b0 tsBodyControl300XSmall">
                                                    1 шт. в руки
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div></a><a target="_blank" href="/product/sapogi-nordman-817172147/?campaignId=286" rel="noopener" class="a5g bp1">
                            <div class="pb1 c3118-a c3118-b5">
                                <div class="c3118-a0">
                                    <span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-right:4px;">4&thinsp;999&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a4 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>-71%</span>
                                </div>
                            </div>
                            <div class="b7a ab9 ba9 pb1" style="color:rgba(0, 26, 52, 0.4);">
                                <span class="tsBodyControl300XSmall">Будет стоить</span>
                            </div>
                            <div class="pb1 c3118-a c3118-b5">
                                <div class="c3118-a0">
                                    <span class="c3118-a1 tsBodyAccent400Small c3118-b9" style="margin-right:4px;">1&thinsp;499&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a5 c3118-b1 c3118-a3" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
                                </div>
                            </div>
                            <div class="e6136-a e6136-a3 p1b tsCompact300XSmall e6136-a6">
                                <span class="e6136-a4" style="color:rgba(0, 26, 52, 0.4);">1140 шт.</span>
                                <div class="e6136-a0">
                                    <div class="e6136-a1" style="background-color:rgba(204, 214, 228, 0.6);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(204, 214, 228, 0.6);width:100%;"></div>
                                </div>
                            </div></a>
                        </div>
                        <div class="o8b bo9">
                            <a target="_blank" href="/product/kofe-rastvorimyy-monarch-original-400-g-258846372/?campaignId=286" rel="noopener" class="a5g b9o">
                                <div class="ob9" style="opacity:1;">
                                    <div class="o9b bp"><img elementtiming="lcp_eltiming_hammers-3288211-default-1_1" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-j/wc200/6817009975.jpg" class="b9414-a">
                                    </div>
                                </div> <!---->
                                <div class="b0p bo9">
                                    <div class="pb0">
                                        <div tabindex="1" class="p0b b410-a0 b410-a6" style="background-color:rgba(245, 247, 250, 1);color:rgba(0, 26, 52, 1);">
                                            <div class="b410-b">
                                                <div title="1 шт. в руки" class="b410-b0 tsBodyControl300XSmall">
                                                    1 шт. в руки
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div></a><a target="_blank" href="/product/kofe-rastvorimyy-monarch-original-400-g-258846372/?campaignId=286" rel="noopener" class="a5g bp1">
                            <div class="pb1 c3118-a c3118-b5">
                                <div class="c3118-a0">
                                    <span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-right:4px;">1&thinsp;399&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a4 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>-58%</span>
                                </div>
                            </div>
                            <div class="b7a ab9 ba9 pb1" style="color:rgba(0, 26, 52, 0.4);">
                                <span class="tsBodyControl300XSmall">Будет стоить</span>
                            </div>
                            <div class="pb1 c3118-a c3118-b5">
                                <div class="c3118-a0">
                                    <span class="c3118-a1 tsBodyAccent400Small c3118-b9" style="margin-right:4px;">599&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a5 c3118-b1 c3118-a3" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
                                </div>
                            </div>
                            <div class="e6136-a e6136-a3 p1b tsCompact300XSmall e6136-a6">
                                <span class="e6136-a4" style="color:rgba(0, 26, 52, 0.4);">5000 шт.</span>
                                <div class="e6136-a0">
                                    <div class="e6136-a1" style="background-color:rgba(204, 214, 228, 0.6);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(204, 214, 228, 0.6);width:100%;"></div>
                                </div>
                            </div></a>
                        </div>
                        <div class="o8b bo9">
                            <a target="_blank" href="/product/drel-shurupovert-zitrek-green12-ot-akkumulyatora-12-v-32-nm-1-akb-288958907/?campaignId=286" rel="noopener" class="a5g b9o">
                                <div class="ob9" style="opacity:1;">
                                    <div class="o9b bp"><img elementtiming="lcp_eltiming_hammers-3288211-default-1_2" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-4/wc200/6817010140.jpg" class="b9414-a">
                                    </div>
                                </div> <!---->
                                <div class="b0p bo9">
                                    <div class="pb0">
                                        <div tabindex="1" class="p0b b410-a0 b410-a6" style="background-color:rgba(245, 247, 250, 1);color:rgba(0, 26, 52, 1);">
                                            <div class="b410-b">
                                                <div title="1 шт. в руки" class="b410-b0 tsBodyControl300XSmall">
                                                    1 шт. в руки
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div></a><a target="_blank" href="/product/drel-shurupovert-zitrek-green12-ot-akkumulyatora-12-v-32-nm-1-akb-288958907/?campaignId=286" rel="noopener" class="a5g bp1">
                            <div class="pb1 c3118-a c3118-b5">
                                <div class="c3118-a0">
                                    <span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-right:4px;">1&thinsp;899&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a4 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>-58%</span>
                                </div>
                            </div>
                            <div class="b7a ab9 ba9 pb1" style="color:rgba(0, 26, 52, 0.4);">
                                <span class="tsBodyControl300XSmall">Будет стоить</span>
                            </div>
                            <div class="pb1 c3118-a c3118-b5">
                                <div class="c3118-a0">
                                    <span class="c3118-a1 tsBodyAccent400Small c3118-b9" style="margin-right:4px;">799&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a5 c3118-b1 c3118-a3" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
                                </div>
                            </div>
                            <div class="e6136-a e6136-a3 p1b tsCompact300XSmall e6136-a6">
                                <span class="e6136-a4" style="color:rgba(0, 26, 52, 0.4);">10000 шт.</span>
                                <div class="e6136-a0">
                                    <div class="e6136-a1" style="background-color:rgba(204, 214, 228, 0.6);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(204, 214, 228, 0.6);width:100%;"></div>
                                </div>
                            </div></a>
                        </div>
                    </div>
                    <div class="b5o">
                        <div class="a2429-a a2429-a3">
                            <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:10px;">
                                <span class="a2429-b1 a2429-e0 a2429-b3 a2429-a3 a2429-b2" style="border-radius:10px;background:linear-gradient(to right, #2E7AFF 0%,#0B21F4 100%);"><span class="a2429-e7">Все товары Хот Сейл<span class="a2429-e8">Новинки каждый день</span></span></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="s9d" style="height:16px;background-color:rgba(255, 255, 255, 1);" data-widget="separator"></div>


            <div class="me0" style="height:8px;background:rgba(245, 247, 250, 1);" data-widget="islandSeparator">
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;left:0;">
                    <g clip-path="#island-topLeft">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-topLeft">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;right:0;transform:scale(-1, 1);">
                    <g clip-path="#island-topRight">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-topRight">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;left:0;transform:scale(1, -1);">
                    <g clip-path="#island-bottomLeft">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-bottomLeft">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
                <svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;right:0;transform:scale(-1, -1);">
                    <g clip-path="#island-bottomRight">
                        <path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
                    </g>
                    <defs>
                        <clipPath id="#island-bottomRight">
                            <path fill="transparent" d="M0 0h24v24H0z"></path>
                        </clipPath>
                    </defs>
                </svg>
            </div>
            *~


            <div style="min-height:0px;" data-widget="paginator">


                ~~mod path="market/" mod_name='showcase' node_id=1~


            </div>


            ~~if $config.mobile >0 ~
            <div data-replace-layout-path="[19][0]" className="e3" style="bottom:0;margin-top:auto;z-index:150;"
                 data-widget="stickyContainer">
                <nav className="d1n" data-widget="mobileHeader">
                    <div className="dn0"><a target="_self" href="/" className="a5g d0n"><span className="dn"><svg
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path fill="currentColor"
                                                                                        d="M12.664 1.253a1 1 0 0 0-1.328 0l-9 8A1 1 0 0 0 2 10v10a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-6a2 2 0 1 1 4 0v6a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V10a1 1 0 0 0-.336-.747l-9-8ZM16 19v-5a4 4 0 0 0-8 0v5H4v-8.55l8-7.112 8 7.111V19h-4Z"></path></svg><span
                        className="nd0" style="display:none;">
      0
    </span> <!----></span><span className="nd">Главная</span></a><a target="_self" href="/category/"
                                                                    className="a5g d0n m9d"><span className="dn"><svg
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path fill="currentColor"
                                                                                        fill-rule="evenodd"
                                                                                        d="M8 9.5a7.5 7.5 0 1 1 11.738 6.189l3.143 5.837a1 1 0 1 1-1.762.948l-3.168-5.884A7.5 7.5 0 0 1 8 9.5ZM15.5 4a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11Z"
                                                                                        clip-rule="evenodd"></path><path
                        fill="currentColor"
                        d="M2 9a1 1 0 0 0 0 2h3a1 1 0 1 0 0-2H2Zm0 5a1 1 0 1 0 0 2h4a1 1 0 1 0 0-2H2Zm0 5a1 1 0 1 0 0 2h9a1 1 0 1 0 0-2H2Z"></path></svg><span
                        className="nd0" style="display:none;">
      0
    </span> <!----></span><span className="nd">Каталог</span></a><a target="_self" href="/cart"
                                                                    className="a5g d0n"><span className="dn"><svg
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path fill="currentColor"
                                                                                        d="M6 6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2h4a1 1 0 0 1 .986 1.164l-1.582 9.494A4 4 0 0 1 17.46 22H6.54a4 4 0 0 1-3.945-3.342L1.014 9.164A1 1 0 0 1 2 8h4V6Zm2 2h5a1 1 0 1 1 0 2H3.18l1.389 8.329A2 2 0 0 0 6.54 20h10.92a2 2 0 0 0 1.972-1.671L20.82 10H17a1 1 0 0 1-1-1V6a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2Z"></path></svg><span
                        className="nd0" style="">
      4
    </span> <!----></span><span className="nd">Корзина</span></a><a target="_self" href="/my/favorites/"
                                                                    className="a5g d0n"><span className="dn"><svg
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path fill="currentColor"
                                                                                        d="M7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Zm5 17c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Z"></path></svg><span
                        className="nd0" style="display:none;">
      0
    </span> <!----></span><span className="nd">Избранное</span></a><a target="_self" href="/my/main/"
                                                                      className="a5g d0n"><span className="dn"><svg
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path fill="currentColor"
                                                                                        d="M8 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-8.3 4.286c.016.015.185.165.5.323.376.187.971.391 1.8.391.829 0 1.425-.204 1.8-.391.175-.088.355-.19.5-.323a1 1 0 0 1 1.407 1.421C15.587 16.827 14.357 18 12 18c-2.358 0-3.587-1.173-3.707-1.293A1 1 0 0 1 9.7 15.286Z"></path><path
                        fill="currentColor"
                        d="M11 2a1 1 0 0 1 1-1c6.075 0 11 4.925 11 11s-4.925 11-11 11S1 18.075 1 12a11 11 0 0 1 6.23-9.914 1 1 0 0 1 1.36.524c.292.72.69 1.565 1.362 2.233C10.592 5.481 11.524 6 13 6a1 1 0 1 1 0 2c-2.024 0-3.458-.743-4.459-1.74-.6-.596-1.027-1.267-1.34-1.875A9 9 0 1 0 12 3a1 1 0 0 1-1.001-1Z"></path></svg><span
                        className="nd0" style="display:none;">
      0
    </span> <!----></span><span className="nd">Мой ClustBUY</span></a></div>
                </nav>
            </div>
            ~~else~
            footer

            ~~/if~
        </div>
        <div>
            <!---->
            <!---->
            <!---->
            <!---->
            <div class="an2 a2n" style="bottom: 66px;">
                <!---->
                <!---->
                <!---->
            </div>
            <!---->
        </div>
    </div>
</div>

~~include file='market/tpl/bottom_script.tpl'~

</body>

</html>