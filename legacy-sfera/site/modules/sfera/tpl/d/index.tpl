<!DOCTYPE html>
<html lang="ru">
<head>

    <meta charset="utf-8">

    <title>Розничные и мелко-оптовые закупки со склада</title>

    <meta name="description" content="Ru.Market - сервис заказа товаров мелким оптом и в розницу со складов раньше перекупщиков. Наличие товаров синхронизировано с программой склада. Экономьте, приобретая товары мелким оптом и в розницу. Организуйте совместные закупки.">


    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="mobile-web-app-capable" content="yes"/>
    ~~include file="market/tpl/favicon.tpl"~
    <link rel="stylesheet" type="text/css" href="/assets/css/libs.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/app.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css"/>

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

    ~~include file="market/tpl/`$smarty.const.TPL`/index/head.tpl"~


    <link rel="stylesheet" type="text/css" href="/assets/css/uw-desktop-sku-grid.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/pdp-all-description-v3.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/vendor-pdp-rich-annotation-renderer.css"/>


</head>
<body>



	<div id="__ozon">
		<div id="layoutPage" class="a0 a1">
			<div data-replace-layout-path="[0]" class="b0" style="width:auto;" data-widget="blockVertical">
				~~*include file="market/tpl/`$smarty.const.TPL`/index/topBar.tpl"*~
				~~include file="market/tpl/`$smarty.const.TPL`/index/header.tpl"~
				<div data-replace-layout-path="[4][0]" class="container b4" data-widget="container">

                    <div class="l-content dn3">
                        <div class="~~*l-wrapper*~">
                            <div class="main-carousel carousel">
                                <div class="swiper-container js-index-carousel">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <div class="main-carousel__item"><img src="/images/banners/siteheader3.jpg"></div>
                                        </div>

                                    </div>
                                </div>
                                <div class="main-carousel__indicator js-index-carousel-indicator"><span></span></div>
                            </div>
                        </div>
                    </div>

                    ~~*debug*~
                    <div class="a8cc dn3" data-widget="skuGrid" style="margin-bottom:0px!important; min-height:unset;">
                        <div class="a5cd ca5d">
                            <div class="cda5">
                                <div class="a5g ga5 cd5a tsHeadline600Medium">
                                    <h1 class="a5g ga5 cd5a tsHeadline600Medium">Розничные и мелко-оптовые закупки со склада</h1>
                                </div>
                            </div>
                        </div>
                    </div>


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

                    ~~mod path="market/" mod_name='showcase' node_id=10390652 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10392695 quantity=5~

                    ~~mod path="market/" mod_name='showcase' node_id=10390810 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10391714 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10390803 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10391183 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10391661 quantity=5~

                    ~~mod path="market/" mod_name='showcase' node_id=10391906 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10391758 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10390928 quantity=5~

                    ~~mod path="market/" mod_name='showcase' node_id=10391625 quantity=5~
                    ~~mod path="market/" mod_name='showcase' node_id=10390973 quantity=5~



					~~include file="market/tpl/`$smarty.const.TPL`/footer.tpl"~
				</div>
			</div>
			<div>
				<div class="an2">
				</div>
			</div>
		</div>
	</div>



<script data-skip-moving="true">var sbScript=document.createElement('script');sbScript.src='https://cdn2.searchbooster.net/scripts/widget/911a73c1-8559-45fc-8e50-e39ccb136b47/main.js';sbScript.setAttribute("data-sb-init-script", 1);sbScript.async=true;document.body.appendChild(sbScript);</script>


~~include file='market/tpl/bottom_script.tpl'~

</body>
</html>