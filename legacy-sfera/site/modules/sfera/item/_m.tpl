<html lang="ru">
<head>
    <script nonce="">
        performance.mark('html_head_start');
    </script>
    <meta charset="utf-8">
    <title>~~$item.title~</title>
    <meta name="description" content="~~$item.description~">
    <meta name="keywords" content="~~$item.keywords~">
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

            ~~include file="market/tpl/`$smarty.const.TPL`/addressBookBarWeb.tpl"~

            <div  class="container b4 b6" >


                <div style="position:fixed;right:0;bottom:0;left:0;z-index:499;" data-widget="webContainerFixed">
                    <div data-replace-layout-path="[4][0][1][0]">
                        <div data-replace-layout-path="[4][0][1][0][0][0]" class="s1k k3s sk4 s5k k2s" style="padding:8px  16px;width:auto;" data-widget="webPdpGrid">
                            <div class="jt9" data-widget="webAddToCart">
                                <div class="jr3">
                                    <div class="d4147-a j9t">
                                        <div class="jt7 tj7">

                                            <div class="d4147-a j7t">
                                                <div class="j5t a2429-a a2429-a3">
                                                    <a tabindex="0" onclick="a2c('~~$item.guid~'); return;" class="a2429-a4 a2429-a3" style="border-radius:10px;">
                                                        <span class="a2429-b1 a2429-b3 a2429-e2 a2429-a3" style="border-radius:10px;"><span class="a2429-e7">Добавить в корзину</span></span>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div><!---->
                                </div>
                            </div>
                        </div>

                        ~~include file="market/tpl/`$smarty.const.TPL`/stickyContainer.tpl"~
                    </div>
                </div>

                ~~mod path="market/" mod_name="breadcrumbs" tpl="item" node=`$item.node`~

                <div data-replace-layout-path="[9][0]" class="container b4 b6" data-widget="container">
                    <div style="display:none;" data-widget="webProductMainWidget"></div>


                    <div data-replace-layout-path="[4][0][2][0]" class="s1k ks8 s3k ks5 k6s" style="width:auto;" data-widget="webPdpGrid">
                        <div data-replace-layout-path="[4][0][2][0][0][0]" class="s1k s2k s3k sk4" style="width:auto;" data-widget="webPdpGrid">


                            ~~*
                            <div data-replace-layout-path="[4][0][2][0][0][0][1][0]" class="s1k s2k k3s s4k ks6" style="width:auto;" data-widget="webPdpGrid">
                                <div class="d4147-a" data-widget="webAddToFavorite">
                                    <div class="j0u a2429-a">
                                        <button tabindex="0" type="button" aria-label="Добавить в избранное" class="a2429-a4">
						<span class="a2429-b1 a2429-c5 a2429-f0">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
								<path fill="currentColor" d="M7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Zm5 17c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Z"></path>
							</svg><span class="a2429-e7"></span></span>
                                        </button>
                                    </div>
                                </div>
                                <div class="j4s" data-widget="webSharingButton">
                                    <div class="lu3">
                                        <div class="a2429-a">
                                            <button tabindex="0" type="button" aria-label="Поделиться" class="a2429-a4">
							<span class="a2429-b1 a2429-c5 a2429-f0">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
									<path fill="currentColor" d="M11.293 1.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1-1.414 1.414L13 4.414V13a1 1 0 1 1-2 0V4.414L9.707 5.707a1 1 0 0 1-1.414-1.414l3-3ZM3 11a3 3 0 0 1 3-3h2a1 1 0 0 1 0 2H6a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-8a1 1 0 0 0-1-1h-2a1 1 0 1 1 0-2h2a3 3 0 0 1 3 3v8a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3v-8Z"></path>
								</svg><span class="a2429-e7"></span></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            *~


                        </div>
                        <div data-widget="webMobGallery">
                            <div class="x1k" style="padding-top: 117.801%;">
                                <div class="xk3">
                                    <div class="jp6">
                                        <div>

                                            <style>


                                                .swiper {
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
                                                    display: block;
                                                    width: 100%;
                                                    height: 100%;
                                                    object-fit: cover;
                                                }
                                            </style>

                                            <!-- Swiper -->
                                            <div class="swiper itemSwiper">
                                                <div class="swiper-wrapper">

                                                    ~~foreach from=$item.gallery item=img~
                                                    <div class="swiper-slide"><img loading="lazy" fetchpriority="low" src="https://ru.market/i/~~$item.guid~/400/~~$img.img_name~.jpg" class="c9-a"></div>
                                                    ~~/foreach~


                                                </div>
                                                <div class="swiper-pagination"></div>
                                            </div>

                                            ~~*
                                            <!-- Swiper JS -->
                                            <script src="/js/swiper/swiper-bundle.min.js"></script>
                                            *~

                                            <!-- Initialize Swiper -->
                                            <script>
                                                var swiper = new Swiper(".itemSwiper", {
                                                    pagination: {
                                                        el: ".swiper-pagination",
                                                    },
                                                });
                                            </script>



                                            <!---->
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <!---->
                        </div>

                        ~~*
                        <div class="sj4" data-widget="webMarketingLabels">
                            <div class="uk ku0">
                                <div class="k9t ku">
                                    <div tabindex="1" class="tk9 b411-a0 b411-a6" style="background-color:#F91155;color:#FFFFFF;">
                                        <div class="b411-b">
                                            <div title="−40%" class="b411-b0 tsBodyControl300XSmall">
                                                −40%
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                </div>
                                <div class="k9t ku">
                                    <div tabindex="1" class="tk9 b411-a0 b411-a6 b411-a1 b411-a8 b411-a9" style="background-color:#EBF7FF;color:#005BFF;">
                                        <div class="b411-b">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: var(--cbPrimaryColor);">
                                                <path fill="currentColor" d="M10 4c0-1.333-.438-2-1.667-2C8 2 6.9 3.592 6.667 4 5.333 6.333 5.333 6.333 5.333 8.333v2.334c0 2 .668 2.666 2.671 2.666h.668c2.39 0 3.999-1.333 4.333-3.333.333-2 1.009-4-1.662-4h-2.01S10 5 10 4Zm-5.333 6c0-2.778 0-3.333-1-3.333s-1 .555-1 3.333 0 3.333 1 3.333 1-.555 1-3.333Z"></path>
                                            </svg>
                                            <div title="Цена что надо" class="b411-b0 tsBodyControl300XSmall">
                                                Цена что надо
                                            </div>
                                        </div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-a3" style="color:#005BFF;">
                                            <path fill="currentColor" d="M6.293 4.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1 0 1.414l-3 3a1 1 0 0 1-1.414-1.414L8.586 8 6.293 5.707a1 1 0 0 1 0-1.414Z"></path>
                                        </svg><div class="b411-a" style="background-color:#005BFF;"></div>
                                    </div>
                                    <!---->
                                </div>
                                <div class="k9t ku">
                                    <div tabindex="1" class="tk9 b411-a0 b411-a6" style="background-color:#FFFAE8;color:#F0A000;">
                                        <div class="b411-b">
                                            <div title="Хит" class="b411-b0 tsBodyControl300XSmall">
                                                Хит
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                        </div>
                        *~


                        <div class="xk7" data-widget="webMobProductHeading">
                            <h1 style="max-height: 52px; -webkit-line-clamp: 2;"> ~~$item.title~ </h1>
                        </div>

                        <div class="r8l" data-widget="webSale">
                            <div class="lr9">
                                <!---->
                                <div class="sl0">
                                    <div class="s0l">
                                        <div class="ls1">
                                            <div data-replace-layout-path="[4][0][2][0][5][0]">
                                                <div params="[object Object]" class="ol7 o7l" data-widget="webPrice">
                                                    <!---->
                                                    <div class="ol6">
                                                        <!---->
                                                        <!---->
                                                        <div class="ol9 pl2 pl4">
                                                            <div class="lp2">
                                                                <div class="l2p">
                                                                    <span class="l0p pl0 lp3 p4l">~~$item.cost|price~&thinsp;₽</span><!---->

                                                                    ~~*<span class="pl p0l l9o p2l l3p">3&thinsp;590&thinsp;₽</span><!---->
                                                                    *~
                                                                </div>
                                                                <div class="pl1">
                                                                    <!---->
                                                                </div>
                                                            </div>
                                                            <!---->
                                                        </div>
                                                        <!---->
                                                    </div>
                                                    <!---->
                                                    <!---->
                                                    <div>
                                                        <!---->
                                                    </div>
                                                    <!---->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    ~~*
                                    <div class="l1s">
                                        <div data-replace-layout-path="[4][0][2][0][5][1]">
                                            <div class="s9d" style="height:8px;" data-widget="separator"></div><div class="s9d" style="height:1px;background-color:rgba(204, 214, 228, 0.6);" data-widget="separator"></div><div class="s9d" style="height:8px;" data-widget="separator"></div><a href="https://www.ozon.ru/section/limit" data-widget="webInstallmentPurchase">
                                                <div class="kt5">
                                                    <span class="t3k">420&thinsp;₽</span>
                                                    <div class="k5t">
                                                        <span>× 6 месяцев</span><span>в ClustBUY Рассрочку</span>
                                                    </div>
                                                    <div class="k0t tk5" style="display: none;"></div>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="k4t">
                                                        <path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
                                                    </svg>
                                                </div></a>
                                        </div>
                                    </div>
                                </div>
                                *~


                                ~~*
                                <div class="sl">
                                    <div data-replace-layout-path="[4][0][2][0][5][2]">
                                        <div class="d4147-a rj0" data-widget="foundCheaperText">
                                            <div class="a2429-a a2429-a3">
                                                <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:12px;">
								<span class="a2429-b1 a2429-c3 a2429-e2 a2429-a3" style="border-radius:12px;">
									<div class="r0j">
										<div class="jr1">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" data-v-ae310be8="">
												<path fill="currentColor" d="m10.707 5.707-4 4a1 1 0 1 1-1.414-1.414l4-4a1 1 0 0 1 1.414 1.414ZM7 5a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm3 5a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"></path><path fill="currentColor" d="M0 10a4.002 4.002 0 0 0 3 3.874V15a1 1 0 0 0 1.447.894l3.156-1.577A3 3 0 0 1 8.944 14H11a5 5 0 0 0 5-5V5a5 5 0 0 0-5-5H5a5 5 0 0 0-5 5v5Zm2-5a3 3 0 0 1 3-3h6a3 3 0 0 1 3 3v4a3 3 0 0 1-3 3H8.944a5 5 0 0 0-2.236.528L5 13.382V13a1 1 0 0 0-1-1 2 2 0 0 1-2-2V5Z"></path>
											</svg>
										</div>
										<div class="j1r">
											Хочу скидку
										</div>
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="rj1">
											<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
										</svg>
									</div></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                *~

                                <!---->
                                <!---->
                            </div>
                        </div>
                    </div>




                    ~~*
                    <div data-replace-layout-path="[9][0][0][0]" class="s1k ks8 s3k ks5 k6s" style="width:auto;" data-widget="webPdpGrid">
                        <div class="r6j" data-widget="webMarketingMarks">
                            <span title="Наиболее популярный, хорошо продающийся на OZON.ru товар" class="jr7" style="color:#FF8400;background-color:#FFFFFF;border-color:#FF8400;">Бестселлер</span>
                        </div>
                    </div>
                    *~

                    <!---->
                    <div style="min-height:0px;" data-widget="paginator">
                        <div data-widget-disallow="[9][0][2]" class="">


                            ~~*
                            <div class="s1k ks8 s3k ks5 k6s" data-widget="webPdpGrid" style="width: auto;">
                                <div class="s9d" data-widget="separator" style="height: 8px;"></div>
                                <div class="sj4" data-widget="webAspects">
                                    <div class="ju6 jr3">
                                        <div class="oj4 oj3 j6u ju7">
                                            <div class="m6j">
                                                <span class="a0k"><span class="ak1">Цвет: </span><span>белый</span></span>
                                            </div>
                                            <div class="j1o">
                                                <div class="d4147-a o1j">
                                                    <div class="l4j jl5 a2429-a a2429-a3">
                                                        <a href="/product/setevoe-zaryadnoe-ustroystvo-dorten-3-port-usb-65-vt-blok-pitaniya-s-funktsiey-bystroy-902351008/?advert=2Hx9tX5lyRvONVxSHUH8PbErNq6ZcJRNdm0LVDaEKk_XU42lhnLk_MZj-sxjw95EIIf6CFZU0VD8vOLN7nbtS_5wurNfeJxjRKVu7Oi9-nbuKPoJvE_eOUZqKJ5QKn80NKBgkmihqOwcf7_d-1DPpEvV39BT9EOp4r_doQX6hO5R7ZpZFiIajTZPhqxf5SVqad3Y4ixRLkc&amp;avtc=1&amp;avte=2&amp;avts=1699848426&amp;from_sku=902351008&amp;from_url=https%253A%252F%252Fwww.ozon.ru%252Fst%252Fservice-worker%252F1.0.39.js&amp;oos_search=false&amp;sh=Wf9yEaUwIw&amp;start_page_id=7fd26f730a70d5e81f990b09af22a60b" class="a2429-a4 a2429-a3" style="border-radius: 6px;">
                                                            <div class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius: 6px;">
                                                                <div title="белый" class="jl3 j3l lj4 j2o">
                                                                    <div class="j7o jl4">
                                                                        <svg width="32" height="32" viewBox="0 0 32 32">
                                                                            <circle cx="16" cy="16" r="16" fill="#ffffff"></circle>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </div></a>
                                                    </div>
                                                </div>
                                                <div class="d4147-a o1j">
                                                    <div class="l4j a2429-a a2429-a3">
                                                        <a href="/product/setevoe-zaryadnoe-ustroystvo-dorten-3-port-usb-65-vt-blok-pitaniya-s-funktsiey-bystroy-902399790/?advert=2Hx9tX5lyRvONVxSHUH8PbErNq6ZcJRNdm0LVDaEKk_XU42lhnLk_MZj-sxjw95EIIf6CFZU0VD8vOLN7nbtS_5wurNfeJxjRKVu7Oi9-nbuKPoJvE_eOUZqKJ5QKn80NKBgkmihqOwcf7_d-1DPpEvV39BT9EOp4r_doQX6hO5R7ZpZFiIajTZPhqxf5SVqad3Y4ixRLkc&amp;avtc=1&amp;avte=2&amp;avts=1699848426&amp;from_sku=902351008&amp;from_url=https%253A%252F%252Fwww.ozon.ru%252Fst%252Fservice-worker%252F1.0.39.js&amp;oos_search=false&amp;sh=Wf9yEaUwIw&amp;start_page_id=7fd26f730a70d5e81f990b09af22a60b" class="a2429-a4 a2429-a3" style="border-radius: 6px;">
                                                            <div class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius: 6px;">
                                                                <div title="черный" class="jl3 j3l lj4 j2o">
                                                                    <div class="j7o jl4">
                                                                        <svg width="32" height="32" viewBox="0 0 32 32">
                                                                            <circle cx="16" cy="16" r="16" fill="#000000"></circle>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </div></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!----><!---->
                                    </div>
                                </div>
                                <div class="s1k s3k sk4" data-widget="webPdpGrid" style="width: auto;">
                                    <div id="customBlock" data-widget="customBlock">
                                        <div>
                                            <style>
                                                @import url('https://cdn2.ozone.ru/s3/cblocks/pdp-characteristics/0.0.1/app-main-62012907c38963efbd8a.css');
                                            </style>
                                        </div>
                                        <div data-custom-block="pdp-characteristics:0.0.1">
                                            <a style="da2-a" href="#section-description">Характеристики</a>
                                        </div>
                                    </div>
                                    <div class="uj" data-widget="webAddToCompare">
                                        <div class="ju0 a2429-a">
                                            <button tabindex="0" type="button" aria-label="Add to compare" class="a2429-a4">
								<span class="a2429-b1 a2429-c5">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
										<path fill="currentColor" d="M3 5a1 1 0 0 0 0 2h7a1 1 0 1 0 0-2H3Zm0 6a1 1 0 1 0 0 2h12a1 1 0 1 0 0-2H3Zm14 3a1 1 0 1 1 2 0v3h3a1 1 0 1 1 0 2h-3v3a1 1 0 1 1-2 0v-3h-3a1 1 0 1 1 0-2h3v-3ZM2 18a1 1 0 0 1 1-1h7a1 1 0 1 1 0 2H3a1 1 0 0 1-1-1Z"></path>
									</svg><span class="a2429-e7">Добавить к сравнению</span></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="a2429-a a2429-a3" data-widget="webOneClickButton">
                                    <button tabindex="0" type="button" class="a2429-a4 a2429-a3 a2429-b0" style="border-radius: 12px;">
                                        <span class="a2429-b1 a2429-c a2429-b7 a2429-e2 a2429-a3" style="border-radius: 12px;"><span class="a2429-e7">Купить в один клик</span></span>
                                    </button>
                                </div>
                                <div class="w7j jw8" data-widget="webCollections">
                                    <div class="j6w">
                                        <div class="b7a wj6">
                                            <span class="tsHeadline500Medium">Серия от бренда</span>
                                        </div>
                                        <!---->
                                    </div>
                                    <div class="a3148-a wj8">
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/setevoe-zaryadnoe-ustroystvo-dorten-3-port-usb-100-vt-blok-pitaniya-s-funktsiey-bystroy-902511975/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-y/6616818610.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>2&thinsp;406&thinsp;₽</span>&nbsp;</span><span class="sj2">4&thinsp;990&thinsp;₽</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/setevoe-zaryadnoe-ustroystvo-dorten-2-port-usb-smart-id-12w-wall-quick-charger-2-4a-belyy-759259843/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-o/6619840332.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>392&thinsp;₽</span>&nbsp;</span><span class="sj2">590&thinsp;₽</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/kabel-micro-usb-dlya-zaryadki-telefona-2-metra-metallic-series-provod-mikro-yusb-2m-chernyy-860328713/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-l/6626809209.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>614&thinsp;₽</span>&nbsp;</span><span class="sj2">650&thinsp;₽</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/avtomobilnoe-zaryadnoe-ustroystvo-dorten-3-port-usb-dlya-telefonov-30-vt-s-funktsiey-790574470/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-w/6625176152.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>541&thinsp;₽</span>&nbsp;</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/kabel-usb-c-dlya-zaryadki-telefona-2-metra-metallic-series-provod-yusb-2m-chernyy-761082027/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-u/6628107846.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>366&thinsp;₽</span>&nbsp;</span><span class="sj2">790&thinsp;₽</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/kabel-dorten-usb-c-100vt-5a-dlya-zaryadki-i-peredachi-dannyh-2-metra-tetron-series-provod-yusb-755695036/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-x/6628193529.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>670&thinsp;₽</span>&nbsp;</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/kabel-usb-dlya-zaryadki-telefona-dorten-lighting-2-metra-metallic-series-provod-yusb-2m-chernyy-755568381/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-c/6626998704.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>335&thinsp;₽</span>&nbsp;</span><span class="sj2">750&thinsp;₽</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                        <div class="w6j a3148-a1">
                                            <div class="a2429-a">
                                                <a href="/product/kabel-usb-c-dlya-zaryadki-telefona-60-vt-1-2-metra-metallic-series-provod-yusb-1-2m-serebristyy-791658857/?prev_collection=17685122&amp;oos_search=false" class="a2429-a4" style="border-radius: 8px;">
                                                    <div class="a2429-b1 a2429-d6 a2429-f0" style="border-radius: 8px;">
                                                        <div><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-v/6626826787.jpg" class="jw7 b9414-a">
                                                            <div class="j7w sj1 s3j sj3">
                                                                <span class="s1j"><span>414&thinsp;₽</span>&nbsp;</span><span class="sj2">790&thinsp;₽</span>
                                                            </div>
                                                        </div>
                                                    </div></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                </div>
                            </div>
                            *~



                            ~~*
                            <div class="ul lu0" data-widget="webSeparator" style="height: 8px; background-color: rgb(245, 247, 250);">
                                <div class="l0u">
                                    <div class="l1u" style="box-shadow: rgb(245, 247, 250) -20px 20px 0px 0px;"></div>
                                </div>
                                <div class="ul0">
                                    <div class="l1u" style="box-shadow: rgb(245, 247, 250) 20px 20px 0px 0px;"></div>
                                </div>
                                <div class="u0l">
                                    <div class="l1u" style="box-shadow: rgb(245, 247, 250) -20px -20px 0px 0px;"></div>
                                </div>
                                <div class="lu1">
                                    <div class="l1u" style="box-shadow: rgb(245, 247, 250) 20px -20px 0px 0px;"></div>
                                </div>
                            </div>
                            *~



                            <div class="s1k ks8 s3k ks5 k6s" data-widget="webPdpGrid" style="width: auto;">
                                <div class="sj4" data-widget="webDescription">
                                    <div id="section-description">
                                        <h2 class="pk4">Описание</h2>
                                        <div>

                                            ~~$item.description|replace:'•':'<br />&nbsp;&nbsp;•&nbsp;'~

                                        </div>
                                    </div>
                                </div>
                                <div id="customBlock" data-widget="customBlock">
                                    <div>
                                        <style>
                                            @import url('https://cdn2.ozone.ru/s3/cblocks/pdp-characteristics-tab/0.0.1/app-main-e75095bfe78bb0155e32.css');
                                        </style>
                                    </div>
                                    <div data-custom-block="pdp-characteristics-tab:0.0.1">
                                        <div id="tab-characteristics" class="d2a-a"></div>
                                    </div>
                                </div>

                                <div class="sj4" data-widget="webCharacteristics">
                                    <div id="section-description" class="j9v">
                                        <div class="vj7">
                                            <h2 class="wj">Характеристики</h2>

                                        </div>
                                        <div class="">

                                            <div class="j8v">
                                                <div class="v8j jv9">
                                                    Общие
                                                </div>
                                                <div class="vj8">



                                                    ~~foreach from=$item.params item=param~
                                                    ~~if $param.CATEGORY == "S" && $param.PROPERTY_NAME !='Страна производства' ~
                                                    <dl class="wj1">

                                                        <dt class="wj0">
                                                            <span class="jw1">~~$param.PROPERTY_NAME~</span>
                                                        </dt>
                                                        <dd class="w0j">
                                                            ~~$param.PROPERTY_VALUE~
                                                        </dd>
                                                    </dl>
                                                    ~~/if~
                                                    ~~/foreach~



                                                </div>
                                            </div>


                                            <div class="j8v">
                                                <div class="v8j jv9">
                                                    Комплектация
                                                </div>
                                                <div class="vj8">

                                                    ~~foreach from=$item.params item=param~
                                                    ~~if $param.CATEGORY == "I"~
                                                    <dl class="wj1">

                                                        <dt class="wj0">
                                                            <span class="jw1">~~$param.PROPERTY_NAME~</span>
                                                        </dt>
                                                        <dd class="w0j">
                                                            ~~$param.PROPERTY_VALUE~
                                                        </dd>
                                                    </dl>
                                                    ~~/if~
                                                    ~~/foreach~

                                                </div>
                                            </div>


                                        </div>



                                        <div class="vj9">
                                            <div class="undefined a2429-a">
                                                <button tabindex="0" type="button" class="a2429-a4">
									<span class="a2429-b1 a2429-c5 a2429-f0">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9" style="color: var(--cbPrimaryColor); transform: rotate(-90deg);">
											<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
										</svg><span class="a2429-e7"></span></span>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="jw">Информация о технических характеристиках, комплекте поставки, стране изготовления, внешнем виде и цвете товара носит справочный характер и основывается на последних доступных к моменту публикации сведениях</small>
                                    </div>
                                    ~~**~

                                </div>

                                ~~*
                                <div class="ul lu0" data-widget="webSeparator" style="height: 8px; background-color: rgb(245, 247, 250);">
                                    <div class="l0u">
                                        <div class="l1u" style="box-shadow: rgb(245, 247, 250) -20px 20px 0px 0px;"></div>
                                    </div>
                                    <div class="ul0">
                                        <div class="l1u" style="box-shadow: rgb(245, 247, 250) 20px 20px 0px 0px;"></div>
                                    </div>
                                    <div class="u0l">
                                        <div class="l1u" style="box-shadow: rgb(245, 247, 250) -20px -20px 0px 0px;"></div>
                                    </div>
                                    <div class="lu1">
                                        <div class="l1u" style="box-shadow: rgb(245, 247, 250) 20px -20px 0px 0px;"></div>
                                    </div>
                                </div>
                                <div class="jr3">
                                    <div class="ko8 kp1">
                                        <h2 class="k8o">Информация о доставке</h2>
                                        <div class="o8k kp">
                                            <div class="k9o a2429-a a2429-a3">
                                                <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius: 8px;">
									<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius: 8px;">
										<div class="j8o">
											<div class="oj8">
												<div class="jo6 oj6">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
														<path fill="currentColor" d="M12 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10Zm-3 5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Z"></path><path fill="currentColor" d="M12 1a9 9 0 0 0-9 9c0 2.514 1.136 4.848 2.699 6.942 1.565 2.099 3.631 4.05 5.643 5.81a1 1 0 0 0 1.316 0c2.012-1.76 4.078-3.711 5.644-5.81C19.864 14.848 21 12.514 21 10a9 9 0 0 0-9-9Zm-7 9a7 7 0 0 1 14 0c0 1.904-.864 3.82-2.302 5.746-1.275 1.71-2.945 3.353-4.698 4.92-1.753-1.567-3.423-3.21-4.699-4.92C5.864 13.82 5 11.904 5 10Z"></path>
													</svg>
												</div>
											</div><span class="a0k jo9"><span>улица Бориса Пастернака, 14</span>
												<br>
												<span class="a1k">Со склада Ozon, Московская Область</span></span>
											<div class="j9o">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="o9j">
													<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
												</svg>
											</div>
										</div></span>
                                                </button>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="o8k kp0">
                                            <div class="ko9"></div>
                                            <!---->
                                        </div>
                                        <div class="o8k kp">
                                            <div class="jo6 oj6 ok9 ok9">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                                    <path fill="currentColor" d="m11 13.586 4.293-4.293a1 1 0 1 1 1.414 1.414l-5 5a.997.997 0 0 1-1.414 0l-3-3a1 1 0 1 1 1.414-1.414L11 13.586Z"></path><path fill="currentColor" d="M1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12Zm11-9a9 9 0 1 0 0 18 9 9 0 0 0 0-18Z"></path>
                                                </svg>
                                            </div>
                                            <span class="a0k"><span>В наличии</span><span class="ak2"> — осталось 9 штук!</span></span><!---->
                                        </div>
                                        <div class="o8k kp0">
                                            <div class="ko9"></div>
                                            <!---->
                                        </div>
                                        <div class="o8k">
                                            <!---->
                                            <span class="a0k"><span>Курьером ClustBUY</span>
								<br>
								<span class="a1k">Послезавтра, 17 ноября</span><span class="a1k"> — </span><span class="k1a">149&thinsp;₽</span></span><!---->
                                        </div>
                                        <div class="o8k">
                                            <!---->
                                            <span class="a0k"><span>Пункты выдачи и постаматы</span>
								<br>
								<span class="a1k">Послезавтра, 17 ноября</span><span class="a1k"> — </span><span class="a1k">бесплатно</span></span><!---->
                                        </div>
                                        <!---->
                                        <!---->
                                    </div><!---->
                                </div>
                                *~



                            </div>
                        </div>
                        <!---->
                        <!---->
                    </div>
                </div>

                <div class="s9d" style="height:100px;" data-widget="separator"></div>


            </div>
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
<script>
    var Items = ~~$items_json~;
</script>

<script nonce="">
    performance.mark('body_html_parsed');
    console.log(performance.getEntriesByType('mark'));
</script>
</body>
</html>