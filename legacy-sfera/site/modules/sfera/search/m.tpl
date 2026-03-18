<!DOCTYPE html>
<html lang="ru">
<head>
    <script nonce="">
        performance.mark('html_head_start');
    </script>
    <meta charset="utf-8">
    <title>Поиск - Cкладской магазин ru.market</title>
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

            <div  class="container b6" >


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


                ~~mod path="market/" mod_name="breadcrumbs" tpl="category" node=`$category.SECTION_PARENT_ID`~
                <div class="i8e xk7" >
                    <h1 style="max-height: 52px; -webkit-line-clamp: 2;"> ~~$category.SECTION_NAME~ </h1>
                </div>
                <div class="er4" data-widget="megaPaginator">
                    <!---->
                    <div data-replace-layout-path="[8][0]" id="paginatorContent">
                        <div class="widget-search-result-container j2j" data-widget="searchResultsV2">
                            <div class="jj3 container-items">



                                ~~include file="market/category/`$smarty.const.TPL`/items.tpl"~


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
                                </style>

                                <script>

                                    var Items = ~~$items~;

                                    // main items swiper
                                    //initSwiper();
                                </script>



                            </div>

                            <div id="showmore-triger" data-page="~~$numPage~" data-max="~~$totalPages~"></div>
                        </div>
                    </div>
                    <!---->

                </div>

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
                        /*height: 100%;*/
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

                <script>

                    var Items = ~~$items~;
                    $('.swiper-thumbnails').each((index, element) => {
                        initSwiper();
                    });

                    // main items swiper
                    initSwiper();
                    var block_show = false;

                    function scrollMore(){
                        var $target = $('#showmore-triger');

                        if (block_show) {
                            return false;
                        }

                        var wt = $(window).scrollTop();
                        var wh = $(window).height();
                        var et = $target.offset().top;
                        var eh = $target.outerHeight();
                        var dh = $(document).height();

                        if (wt + wh >= et || wh + wt == dh || eh + et < wh){
                            var page = $target.attr('data-page');
                            page++;
                            block_show = true;

                            $.ajax({
                                url: "/category/~~$categoryId~/page/"+page,
                                dataType: 'html',
                                error: function (jqXHR, textStatus) {
                                    console.log("Нет связи с сервером: " + textStatus);
                                },
                                success: function(data){
                                    $('.container-items').append(data);
                                    block_show = false;
                                    initSwiper();
                                }
                            });

                            $target.attr('data-page', page);
                            if (page ==  $target.attr('data-max')) {
                                $target.remove();
                            }
                        }
                    }

                    $(window).scroll(function(){
                        scrollMore();
                    });

                    $(document).ready(function(){
                        scrollMore();
                    });
                </script>


            </div>

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
