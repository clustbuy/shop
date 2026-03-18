<!DOCTYPE html>
<html lang="ru">
<head>
    <script nonce="">
        performance.mark('html_head_start');
    </script>
    <meta charset="utf-8">
    <title>Розничные и мелко-оптовые закупки со склада</title>
    <meta name="description" content="Ru.Market - сервис заказа товаров мелким оптом и в розницу со складов раньше перекупщиков. Наличие товаров синхронизировано с программой склада. Экономьте, приобретая товары мелким оптом и в розницу. Организуйте совместные закупки.">



    <meta nonce="" name="viewport" data-hid="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, initial-scale=1.0">
    <meta name="google" content="notranslate">
    <meta name="format-detection" content="telephone=no"/>
    <meta name="mobile-web-app-capable" content="yes"/>
    ~~include file="market/tpl/favicon.tpl"~
    <link rel="stylesheet" type="text/css" href="/assets/css/libs.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/app.css"/>

    <link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css"/>

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
    ~~include file="tpl/js.tpl"~


    ~~include file="market/tpl/`$smarty.const.TPL`/index/head.tpl"~

    <!-- Подключаем библиотеки -->
    <script src="//comet-server.ru/CometServerApi.js" type="text/javascript"></script>

    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script>
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "3000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    </script>
    <style>
        #toast-container > .toast-info {
            background-image: none;
            background-color: #09b4f6;
            color: #ffffff!important;
            color: black;
        }
        #toast-container > .toast-error {
            background-image: none;
            background-color: #f91155;
            color: red;
        }
    </style>


</head>
<body class="clickup-chrome-ext_installed" style="overflow-anchor: none;" cz-shortcut-listen="true">

<div id="__ozon">

    <div id="layoutPage" class="a0 a2">

        <div data-replace-layout-path="[0]" class="b0 b2" style="width:auto;" data-widget="blockVertical">

            <div data-replace-layout-path="[0][0]" ~~*class="e3"*~ style="top:0;z-index:12;" data-widget="stickyContainer">
                <div class="a5g h4e" data-widget="webToAppBanner">
                    <a href="/">
                        <img alt="" src="/images/logo.svg" style="height:18px;">
                    </a>
                    <noindex style="margin-left: auto;">
                        <span></span>
                    </noindex>
                    <div class="e5h a2429-a hidden">
                    </div>
                </div>
            </div>

            ~~include file="market/tpl/`$smarty.const.TPL`/navBar.tpl"~
            <style>
                swiper-container {
                    width: 100%;
                    height: 100%;
                }

                swiper-slide {
                    text-align: center;
                    font-size: 18px;
                    background: #fff;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                swiper-slide img {
                    display: block;
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }


            </style>
            <style>
                .swiper {
                    background-color: white;
                    padding-bottom: 16px;
                    width: 100%;
                    height: 100%;
                }

                .swiper-slide {
                    text-align: center;
                    font-size: 18px;
                    background: #fff;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .swiper-slide img {
                    border-radius: 16px;
                    display: block;
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .swiper-block {
                    display: flex;
                    justify-content: space-around;
                }

                .swiper-pagination {
                    background-color: white;
                    bottom: 4px !important;
                }

                .swiper-pagination-bullet-active {
                    background-color: var(--theme-rmcolor);
                }

                swiper-container {
                    width: 100%;
                    height: 100%;
                }

                swiper-slide {
                    text-align: center;
                    font-size: 18px;
                    background: #fff;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                swiper-slide img {
                    display: block;
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }


                .swiper-horizontal>.swiper-pagination-bullets .swiper-pagination-bullet, .swiper-pagination-horizontal.swiper-pagination-bullets .swiper-pagination-bullet {
                    margin: 0 var(--swiper-pagination-bullet-horizontal-gap, 2px)!important;
                }
                .swiper-pagination-bullet {
                    width: var(--swiper-pagination-bullet-width, var(--swiper-pagination-bullet-size, 4px))!important;
                    height: var(--swiper-pagination-bullet-height, var(--swiper-pagination-bullet-size, 4px))!important;
                }

            </style>

            ~~mod path="market/" mod_name='showcase' node_id=10390652 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10392695 quantity=6~

            ~~mod path="market/" mod_name='showcase' node_id=10390810 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10391714 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10390803 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10391183 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10391661 quantity=6~

            ~~mod path="market/" mod_name='showcase' node_id=10391906 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10391758 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10390928 quantity=6~

            ~~mod path="market/" mod_name='showcase' node_id=10391625 quantity=6~
            ~~mod path="market/" mod_name='showcase' node_id=10390973 quantity=6~



            ~~include file="market/item/tpl/`$smarty.const.TPL`/footer.tpl"~
            ~~include file="market/tpl/`$smarty.const.TPL`/stickyContainer.tpl"~

        </div>
        <div>
            <div class="an2 a2n" style="bottom: 66px;">
            </div>
        </div>
    </div>
</div>
~~mod path="market/" mod_name="menu" tpl="m_menu"~
~~include file='market/tpl/bottom_script.tpl'~
</body>
</html>