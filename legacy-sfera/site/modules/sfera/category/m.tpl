<!DOCTYPE html>
<html lang="ru">
<head>
    <script nonce="">
        performance.mark('html_head_start');
    </script>
    <meta charset="utf-8">

    <title>~~$category.title~ ~~if $numPage > 1~| Страница ~~$numPage~ ~~/if~</title>

    <meta nonce="" name="viewport" data-hid="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, initial-scale=1.0">
    <meta name="google" content="notranslate">
    <meta name="format-detection" content="telephone=no"/>
    <meta name="mobile-web-app-capable" content="yes"/>

    <meta name="description" content="~~$category.title~ (~~$totalCount~ товар~~$totalCount|fins~) ~~if $numPage > 1~| Страница ~~$numPage~ ~~/if~ | Купить товары с доставкой в пункт выдачи рядом с домом. Доставка по Москве и Московской области включена в стоимость товаров. Используйте бонусный счет для оплаты следующих заказов. Складской магазин ru.market"/>

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

            <div  class="container b4 b6" >


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


                      <script>
                          var Items = [];
                      </script>

                    ~~include file="market/category/`$smarty.const.TPL`/items.tpl"~

                    ~~*
                    <div class="ix9 i9x iy0">
                      <a href="/product/blok-pitaniya-s-razemom-type-c-65w-dlya-asus-zenbook-ux425ja-ux425ea-ux325ja-s-ux391ua-s-ux391fa-179171365/?advert=J_lmMIEd_IjNgaGakxc5QVGm59GN6kMY_0HgZ2ko6T7luMwn8xjFXUTyTZpsPzAdNLucRFWm3-f-GrlQ32ezzqr-Rx29PqbEvNCpZk4EEB1P0ikIzgCfzHNVnGNFGpTqxT9iT66pIUhGGjOoXjAlnqd8EMjKProXhaNQfDP78vq3a06F8fjrzaIUTCkuM-6vkidiUGT3g__QAiBMWmVbjYoVJjS9TguKpu6f5IN7acJppN8b_t-7dIr0zt6pYa6dIKMxaIAnYt8YnyGJNGthy3tcozxWhdWTNd_tIIwNtRRnFJxOQpqsmyftTrLfkJetemhQqwvyUVr1vUqDbU8&amp;avtc=1&amp;avte=2&amp;avts=1700889011&amp;keywords=%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0+%D0%B4%D0%BB%D1%8F+%D0%BD%D0%BE%D1%83%D1%82%D0%B1%D1%83%D0%BA%D0%B0+asus+type+c" data-prerender="true" class="v5i tile-hover-target i7v">
                      <div highfetchpriority="true" class="i4v vi4">
                        <div class="vi7">
                          <div class="v7i"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-9/wc350/6135581481.jpg" class="b9414-a">
                          </div>
                          <!---->
                          <div class="v1i vi2">
                            <span class="iv2 i2v"></span><span class="iv2"></span><span class="iv2"></span>
                          </div>
                        </div>
                        <div class="v6i"></div>
                        <section class="h9a ai">
                          <div class="ia ai0">
                            <div tabindex="1" class="a0i b411-a0 b411-a5 b411-a1" style="background-color:#5B51DE;color:#FFFFFF;">
                              <div class="b411-b">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: rgb(255, 255, 255);">
                                  <path fill="currentColor" d="M10 9.333c0-.333 0-.666-.667-.666H6.667V10h2.666C10 10 10 9.667 10 9.333Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333c-1 0-1.334.333-1.334 1.333v4c0 1 .334 1.333 1.41 1.333h1.943c.318 0 .633 0 .911-.023.281-.023.589-.074.868-.214.303-.151.539-.39.686-.721.137-.308.182-.663.182-1.042s-.045-.734-.182-1.041a1.44 1.44 0 0 0-.686-.722c-.28-.14-.587-.19-.868-.214-.278-.023-.593-.023-.911-.023h-2.02V6H10a.667.667 0 1 0 0-1.333H6.667Z" clip-rule="evenodd"></path>
                                </svg>
                                <div title="50 баллов за отзыв" class="b411-b0 tsBodyAccent250Caption">
                                  50 баллов за отзыв
                                </div>
                              </div>
                            </div>
                            <div tabindex="1" class="a0i ia0 b411-a0 b411-a5 b411-a1" style="background-image:linear-gradient(90deg, #FD0950 0%, #1F0F13 100%);background-color:#1F0F13;color:#ffffff;">
                              <div class="b411-b">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: rgb(255, 255, 255);">
                                  <path fill="currentColor" d="M8 2.065c-2-.643-.667 3.71-2 3.71-.667 0-.806-1.258-1.339-1.258C3.994 4.517 2 6.56 2 9.13 2 11.474 3.333 14 6 14c.667 0 1-.212.625-.62-1.875-2.044-1.358-4.042-.63-3.808.94.302 1.823 1.779 2.557-1.35.186-.847.653-.622 1.266 0 .921.932 1.402 2.94-.36 5.157-.291.367.209.621 1.021.621C12.23 14 14 12.106 14 9.13c0-4.004-4-6.423-6-7.065Z"></path>
                                </svg>
                                <div title="ЧЁРНАЯ ПЯТНИЦА" class="b411-b0 tsBodyAccent250Caption">
                                  ЧЁРНАЯ ПЯТНИЦА
                                </div>
                              </div>
                            </div>
                          </div>
                        </section>
                      </div></a>
                      <div class="iy">
                        <div class="vi i0v c3118-a c3118-b7" style="padding-bottom:4px;">
                          <div class="c3118-a0">
                            <span class="c3118-a1 tsHeadline400Small c3118-b9" >1 383 ₽</span><span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-left:4px;margin-right:4px;">5 210 ₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a6 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−73%</span>
                          </div>
                        </div>
                        <div class="e6136-a e6136-a3 vi">
                          <span class="e6136-a4" style="color:rgba(0, 0, 0, 1);">Осталось 998 шт</span>
                          <div class="e6136-a0">
                            <div class="e6136-a1" style="background-color:rgba(0, 26, 52, 0.2);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(249, 17, 85, 1);width:99%;"></div>
                          </div>
                        </div><a href="/product/blok-pitaniya-s-razemom-type-c-65w-dlya-asus-zenbook-ux425ja-ux425ea-ux325ja-s-ux391ua-s-ux391fa-179171365/?advert=J_lmMIEd_IjNgaGakxc5QVGm59GN6kMY_0HgZ2ko6T7luMwn8xjFXUTyTZpsPzAdNLucRFWm3-f-GrlQ32ezzqr-Rx29PqbEvNCpZk4EEB1P0ikIzgCfzHNVnGNFGpTqxT9iT66pIUhGGjOoXjAlnqd8EMjKProXhaNQfDP78vq3a06F8fjrzaIUTCkuM-6vkidiUGT3g__QAiBMWmVbjYoVJjS9TguKpu6f5IN7acJppN8b_t-7dIr0zt6pYa6dIKMxaIAnYt8YnyGJNGthy3tcozxWhdWTNd_tIIwNtRRnFJxOQpqsmyftTrLfkJetemhQqwvyUVr1vUqDbU8&amp;avtc=1&amp;avte=2&amp;avts=1700889011&amp;keywords=%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0+%D0%B4%D0%BB%D1%8F+%D0%BD%D0%BE%D1%83%D1%82%D0%B1%D1%83%D0%BA%D0%B0+asus+type+c" class="tile-hover-target vi vi0">
                        <div class="b7a ab9 ba9 vi">
                          <span class="tsBody400Small">Блок питания с разъемом Type-C (65W) для Asus ZenBook UX425JA / UX425EA / UX325JA / S UX391UA / S UX391FA / UX490UA ( ADP-65DW A )</span>
                        </div></a>
                        <div class="vi">
                          <div class="t2 t3 t4 tsCaptionBold" style="text-align:left;">
                            <span class="t7">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgb(255, 168, 0);">
                                <path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
                              </svg><span style="color:rgba(0, 26, 52, 0.6);">4.8 </span></span><span class="t7">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgba(0, 26, 52, 0.4);">
                                <path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
                              </svg><span style="color:rgba(0, 26, 52, 0.6);">127&nbsp;отзывов</span></span>
                          </div>
                        </div>
                        <div class="iv9 w0i iw0">
                          <div class="iw wi0 wi">
                            <div class="f f1 f4 i9v">
                              <div class="e9 a2429-a a2429-a3">
                                <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
                                  <span class="a2429-b1 a2429-e2 a2429-a3" style="border-radius:8px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
                                      <path fill="currentColor" d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288-.25.288-.185.732-.056 1.619l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813.939-.812 1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064l1.21-3.024Zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0Zm2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834Z"></path>
                                    </svg><span class="a2429-e7 a2429-f2">28 ноября</span></span>
                                </button>
                              </div>
                              <span class="e4" style="background-color:#ffffff;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="e5" style="color: rgb(255, 184, 0);">
                                  <path fill="currentColor" d="M21 12c0 5.584-3.416 9-9 9s-9-3.416-9-9 3.416-9 9-9 9 3.416 9 9ZM7.557 9.6c-.566 0-.56 1.6-.556 3.023V13c0 2 .835 3 5 3s4.997-1 4.997-3l.001-.377c.005-1.423.01-3.023-.556-3.023-.376 0-.707.592-1.01 1.135-.145.259-.284.507-.418.673-.238.296-.345.342-.533-.091l-.064-.148C14.005 10.21 13.052 8 12 8s-2.005 2.21-2.418 3.169l-.064.148c-.188.433-.295.387-.533.091-.134-.166-.273-.414-.418-.673-.303-.543-.634-1.135-1.01-1.135Z"></path>
                                </svg></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="i3y yi3">
                        <div class="d4147-a iy4">
                          <button class="a6j">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
                              <path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
                            </svg>
                          </button>
                        </div>
                      </div>
                      <!---->
                    </div>

                    <div class="ix9 i9x iy0">
                      <a href="/product/hab-type-c-na-usb-3-0-hdmi-pd-hoco-hb14-perehodnik-dlya-macbook-pro-air-s-vozmozhnostyu-vyvoda-na-272299975/?advert=9Pz2hPqTfF_08HQGy0P4BA5rVCOfpjbHJrIH7H5E3Q0mjLaQTJAPvb1g3X3WlVDuLVRXJ_5G-a2RCVqLu0I9wj9-fySy_T_3z6rD0a_bvndZ9yNkWYbpvFWPQiVAhWHY35qN0fRhXU5QhTHDeJdMQU4nndj2_PqjEm1FGLUAtXMeYErP9o7_pLVrpLvAFTBt5lfzZ-1Ssfe97Ktiv2m4KuDDeV5hQ6_8PqfW59r-UecRWpKmXUN938sLxwB4k9bmG3_AdrmOe5Rb-zR3kRp4pEZpwgYXYS2KOUZb11zDG2An8QKvql_zQesBLCgeJJe1jXroe7vEY891Lr5E6jr_l4JJYA3c&amp;avtc=1&amp;avte=1&amp;avts=1700889011&amp;keywords=%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0+%D0%B4%D0%BB%D1%8F+%D0%BD%D0%BE%D1%83%D1%82%D0%B1%D1%83%D0%BA%D0%B0+asus+type+c" data-prerender="true" class="v5i tile-hover-target i7v">
                      <div highfetchpriority="true" class="i4v vi4">
                        <div class="vi7">
                          <div class="v7i"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-x/wc350/6828685521.jpg" class="b9414-a">
                          </div>
                          <!---->
                          <div class="v1i vi2">
                            <span class="iv2 i2v"></span><span class="iv2"></span><span class="iv2"></span><span class="iv2"></span><span class="iv2"></span><span class="iv2"></span>
                          </div>
                        </div>
                        <div class="v6i"></div>
                        <section class="h9a ai">
                          <div class="ia ai0">
                            <div tabindex="1" class="a0i b411-a0 b411-a5 b411-a1" style="background-color:#005BFF;color:#FFFFFF;">
                              <div class="b411-b">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: rgb(255, 255, 255);">
                                  <path fill="currentColor" d="M10 4c0-1.333-.438-2-1.667-2C8 2 6.9 3.592 6.667 4 5.333 6.333 5.333 6.333 5.333 8.333v2.334c0 2 .668 2.666 2.671 2.666h.668c2.39 0 3.999-1.333 4.333-3.333.333-2 1.009-4-1.662-4h-2.01S10 5 10 4Zm-5.333 6c0-2.778 0-3.333-1-3.333s-1 .555-1 3.333 0 3.333 1 3.333 1-.555 1-3.333Z"></path>
                                </svg>
                                <div title="Цена что надо" class="b411-b0 tsBodyAccent250Caption">
                                  Цена что надо
                                </div>
                              </div>
                            </div>
                          </div>
                        </section>
                      </div></a>
                      <div class="iy">
                        <div class="vi i0v c3118-a c3118-b3" style="padding-bottom:4px;">
                          <div class="c3118-a0">
                            <span class="c3118-a1 tsHeadline400Small c3118-b9">1 190 ₽</span><span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-left:4px;margin-right:4px;">1 290 ₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a6 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−7%</span>
                          </div>
                        </div>
                        <div class="vi">
                          <div class="t2 t3 t4 tsCaption" style="text-align:left;">
                            <span class="t7"><span style="color:rgba(0, 0, 0, 1);"><b>hoco</b></span></span>
                          </div>
                        </div><a href="/product/hab-type-c-na-usb-3-0-hdmi-pd-hoco-hb14-perehodnik-dlya-macbook-pro-air-s-vozmozhnostyu-vyvoda-na-272299975/?advert=9Pz2hPqTfF_08HQGy0P4BA5rVCOfpjbHJrIH7H5E3Q0mjLaQTJAPvb1g3X3WlVDuLVRXJ_5G-a2RCVqLu0I9wj9-fySy_T_3z6rD0a_bvndZ9yNkWYbpvFWPQiVAhWHY35qN0fRhXU5QhTHDeJdMQU4nndj2_PqjEm1FGLUAtXMeYErP9o7_pLVrpLvAFTBt5lfzZ-1Ssfe97Ktiv2m4KuDDeV5hQ6_8PqfW59r-UecRWpKmXUN938sLxwB4k9bmG3_AdrmOe5Rb-zR3kRp4pEZpwgYXYS2KOUZb11zDG2An8QKvql_zQesBLCgeJJe1jXroe7vEY891Lr5E6jr_l4JJYA3c&amp;avtc=1&amp;avte=1&amp;avts=1700889011&amp;keywords=%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0+%D0%B4%D0%BB%D1%8F+%D0%BD%D0%BE%D1%83%D1%82%D0%B1%D1%83%D0%BA%D0%B0+asus+type+c" class="tile-hover-target vi vi0">
                        <div class="b7a ab9 ba9 vi">
                          <span class="tsBody400Small">Хаб Type-C на USB 3.0 + HDMI + PD HOCO HB14 переходник для Macbook Pro Air с возможностью вывода на экран и зарядкой адаптер</span>
                        </div></a>
                        <div class="vi">
                          <div class="t2 t3 t4 tsCaptionBold" style="text-align:left;">
                            <span class="t7">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgb(255, 168, 0);">
                                <path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
                              </svg><span style="color:rgba(0, 26, 52, 0.6);">4.6 </span></span><span class="t7">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgba(0, 26, 52, 0.4);">
                                <path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
                              </svg><span style="color:rgba(0, 26, 52, 0.6);">476&nbsp;отзывов</span></span>
                          </div>
                        </div>
                        <div class="iv9 w0i">
                          <div class="v9i wi0 wi">
                            <div class="f f1 f4 i9v">
                              <div class="e9 a2429-a a2429-a3">
                                <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
                                  <span class="a2429-b1 a2429-b9 a2429-e2 a2429-a3" style="border-radius:8px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
                                      <path fill="currentColor" d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288-.25.288-.185.732-.056 1.619l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813.939-.812 1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064l1.21-3.024Zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0Zm2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834Z"></path>
                                    </svg><span class="a2429-e7 a2429-f2">За час</span></span>
                                </button>
                              </div>
                              <span class="e4" style="background-color:#ffffff;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="e7" style="color: rgb(255, 184, 0);">
                                  <path fill="currentColor" d="M21 12c0 5.584-3.416 9-9 9s-9-3.416-9-9 3.416-9 9-9 9 3.416 9 9ZM7.557 9.6c-.566 0-.56 1.6-.556 3.023V13c0 2 .835 3 5 3s4.997-1 4.997-3l.001-.377c.005-1.423.01-3.023-.556-3.023-.376 0-.707.592-1.01 1.135-.145.259-.284.507-.418.673-.238.296-.345.342-.533-.091l-.064-.148C14.005 10.21 13.052 8 12 8s-2.005 2.21-2.418 3.169l-.064.148c-.188.433-.295.387-.533.091-.134-.166-.273-.414-.418-.673-.303-.543-.634-1.135-1.01-1.135Z"></path>
                                </svg></span>
                            </div>
                          </div>
                          <div class="iw wi0 wi">
                            <div class="f f1 f4 i9v">
                              <div class="e9 a2429-a a2429-a3">
                                <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
                                  <span class="a2429-b1 a2429-e2 a2429-a3" style="border-radius:8px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
                                      <path fill="currentColor" d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288-.25.288-.185.732-.056 1.619l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813.939-.812 1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064l1.21-3.024Zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0Zm2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834Z"></path>
                                    </svg><span class="a2429-e7 a2429-f2">Завтра</span></span>
                                </button>
                              </div>
                              <span class="e4" style="background-color:#ffffff;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="e5" style="color: rgb(255, 184, 0);">
                                  <path fill="currentColor" d="M21 12c0 5.584-3.416 9-9 9s-9-3.416-9-9 3.416-9 9-9 9 3.416 9 9ZM7.557 9.6c-.566 0-.56 1.6-.556 3.023V13c0 2 .835 3 5 3s4.997-1 4.997-3l.001-.377c.005-1.423.01-3.023-.556-3.023-.376 0-.707.592-1.01 1.135-.145.259-.284.507-.418.673-.238.296-.345.342-.533-.091l-.064-.148C14.005 10.21 13.052 8 12 8s-2.005 2.21-2.418 3.169l-.064.148c-.188.433-.295.387-.533.091-.134-.166-.273-.414-.418-.673-.303-.543-.634-1.135-1.01-1.135Z"></path>
                                </svg></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="i3y yi3">
                        <div class="d4147-a iy4">
                          <button class="a6j">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
                              <path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
                            </svg>
                          </button>
                        </div>
                      </div>
                      <!---->
                    </div>

                    <div class="ix9 i9x iy0 tile-link-hovered">
                      <a href="/product/blok-pitaniya-setevoy-adapter-dlya-noutbukov-asus-5v-9v-15v-3a-20v-2-25a-type-c-45w-oem-249531998/?asb=g08vYx4fhqciYw3EMgSTvvSVyXxhcXKPhJUOTOnSZX0s9qqlJHqLNkGoM39Pqjro&amp;asb2=HDX-i01d-HN_0QmNIpYXLKAqanKKl_ZSv0-WildEi-Im4gDDdqWGf9kUlqg-PRgEWfen84Apfu-YXT-p6wZ9gGFhr9exi_gwknP0k07b9cTZWQYpnKFRU-r39z6t4BBCCujZXoJ_ngnA7nCbJ8GNYZxpw4tPcJ6czBBEgGlccOs&amp;avtc=1&amp;avte=4&amp;avts=1700889011&amp;keywords=%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0+%D0%B4%D0%BB%D1%8F+%D0%BD%D0%BE%D1%83%D1%82%D0%B1%D1%83%D0%BA%D0%B0+asus+type+c" data-prerender="true" class="v5i tile-hover-target i7v">
                      <div class="i4v vi4">
                        <div class="vi7">
                          <div class="v7i"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-r/wc350/6229956615.jpg" class="b9414-a">
                          </div>
                          <!---->
                          <div class="v1i vi2">
                            <span class="iv2 i2v"></span><span class="iv2"></span><span class="iv2"></span><span class="iv2"></span><span class="iv2"></span><span class="iv2"></span>
                          </div>
                        </div>
                        <div class="v6i"></div>
                        <section class="h9a ai">
                          <div class="ia ai0">
                            <div tabindex="1" class="a0i b411-a0 b411-a5 b411-a1" style="background-color: rgb(91, 81, 222); color: rgb(255, 255, 255);">
                              <div class="b411-b">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: rgb(255, 255, 255);">
                                  <path fill="currentColor" d="M10 9.333c0-.333 0-.666-.667-.666H6.667V10h2.666C10 10 10 9.667 10 9.333Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333c-1 0-1.334.333-1.334 1.333v4c0 1 .334 1.333 1.41 1.333h1.943c.318 0 .633 0 .911-.023.281-.023.589-.074.868-.214.303-.151.539-.39.686-.721.137-.308.182-.663.182-1.042s-.045-.734-.182-1.041a1.44 1.44 0 0 0-.686-.722c-.28-.14-.587-.19-.868-.214-.278-.023-.593-.023-.911-.023h-2.02V6H10a.667.667 0 1 0 0-1.333H6.667Z" clip-rule="evenodd"></path>
                                </svg>
                                <div title="150 баллов за отзыв" class="b411-b0 tsBodyAccent250Caption">
                                  150 баллов за отзыв
                                </div>
                              </div>
                            </div>
                            <div tabindex="1" class="a0i ia0 b411-a0 b411-a5 b411-a1" style="background-image: linear-gradient(90deg, rgb(253, 9, 80) 0%, rgb(31, 15, 19) 100%); background-color: rgb(31, 15, 19); color: rgb(255, 255, 255);">
                              <div class="b411-b">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: rgb(255, 255, 255);">
                                  <path fill="currentColor" d="M8 2.065c-2-.643-.667 3.71-2 3.71-.667 0-.806-1.258-1.339-1.258C3.994 4.517 2 6.56 2 9.13 2 11.474 3.333 14 6 14c.667 0 1-.212.625-.62-1.875-2.044-1.358-4.042-.63-3.808.94.302 1.823 1.779 2.557-1.35.186-.847.653-.622 1.266 0 .921.932 1.402 2.94-.36 5.157-.291.367.209.621 1.021.621C12.23 14 14 12.106 14 9.13c0-4.004-4-6.423-6-7.065Z"></path>
                                </svg>
                                <div title="ЧЁРНАЯ ПЯТНИЦА" class="b411-b0 tsBodyAccent250Caption">
                                  ЧЁРНАЯ ПЯТНИЦА
                                </div>
                              </div>
                            </div>
                          </div>
                        </section>
                      </div></a>
                      <div class="iy">
                        <div class="vi i0v c3118-a c3118-b7" style="padding-bottom: 4px;">
                          <div class="c3118-a0">
                            <span class="c3118-a1 tsHeadline400Small c3118-b9" style="background-image: linear-gradient(225deg, rgb(248, 17, 85) 0%, rgb(248, 17, 85) 100%);">871 ₽</span><span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-left: 4px; margin-right: 4px;">1 242 ₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a6 c3118-b1" style="background: rgb(255, 255, 255);"><div class="c3118-b" style="background-image: url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−30%</span>
                          </div>
                        </div>
                        <div class="e6136-a e6136-a3 vi">
                          <span class="e6136-a4" style="color: rgb(0, 0, 0);">Осталось 59 шт</span>
                          <div class="e6136-a0">
                            <div class="e6136-a1" style="background-color: rgba(0, 26, 52, 0.2); opacity: 1;"></div><div class="e6136-a2" style="background-color: rgb(249, 17, 85); width: 98%;"></div>
                          </div>
                        </div><a href="/product/blok-pitaniya-setevoy-adapter-dlya-noutbukov-asus-5v-9v-15v-3a-20v-2-25a-type-c-45w-oem-249531998/?asb=g08vYx4fhqciYw3EMgSTvvSVyXxhcXKPhJUOTOnSZX0s9qqlJHqLNkGoM39Pqjro&amp;asb2=HDX-i01d-HN_0QmNIpYXLKAqanKKl_ZSv0-WildEi-Im4gDDdqWGf9kUlqg-PRgEWfen84Apfu-YXT-p6wZ9gGFhr9exi_gwknP0k07b9cTZWQYpnKFRU-r39z6t4BBCCujZXoJ_ngnA7nCbJ8GNYZxpw4tPcJ6czBBEgGlccOs&amp;avtc=1&amp;avte=4&amp;avts=1700889011&amp;keywords=%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0+%D0%B4%D0%BB%D1%8F+%D0%BD%D0%BE%D1%83%D1%82%D0%B1%D1%83%D0%BA%D0%B0+asus+type+c" class="tile-hover-target vi vi0">
                        <div class="b7a ab9 ba9 vi">
                          <span class="tsBody400Small">Блок питания / сетевой адаптер / зарядка / ADL-45A1, ADP-45EW C / LA45NM150 для ноутбуков Asus T303UA-GN043T, T305CA, UX390UA, HP Elite x2 1012 G1 5V, 9V, 15V 3A, 20V 2.25A 45W (Type-C) OEM тип VB</span>
                        </div></a>
                        <div class="vi">
                          <div class="t2 t3 t4 tsCaptionBold" style="text-align: left;">
                            <span class="t7">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgb(255, 168, 0);">
                                <path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
                              </svg><span style="color: rgba(0, 26, 52, 0.6);">5.0 </span></span><span class="t7">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgba(0, 26, 52, 0.4);">
                                <path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
                              </svg><span style="color: rgba(0, 26, 52, 0.6);">5&nbsp;отзывов</span></span>
                          </div>
                        </div>
                        <div class="iv9 w0i iw0">
                          <div class="iw wi0 wi">
                            <div class="f f1 f4 i9v">
                              <div class="e9 a2429-a a2429-a3">
                                <button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius: 8px;">
                                  <span class="a2429-b1 a2429-e2 a2429-a3" style="border-radius: 8px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
                                      <path fill="currentColor" d="M6.274 2.476a.833.833 0 0 0-1.548-.619L3.27 5.5h-.842c-.897 0-1.345 0-1.594.288-.25.288-.185.732-.056 1.619l.226 1.553c.396 2.721.594 4.082 1.533 4.894.94.813 2.314.813 5.064.813h.8c2.75 0 4.125 0 5.064-.813.939-.812 1.137-2.173 1.533-4.894l.226-1.553c.129-.887.193-1.33-.056-1.619-.25-.288-.697-.288-1.594-.288h-.842l-1.457-3.643a.833.833 0 1 0-1.548.62l1.21 3.023H5.064l1.21-3.024Zm.893 7.19v1.667a.833.833 0 1 1-1.667 0V9.667a.833.833 0 1 1 1.667 0Zm2.5-.833c.46 0 .833.373.833.834v1.666a.833.833 0 1 1-1.667 0V9.667c0-.46.373-.834.834-.834Z"></path>
                                    </svg><span class="a2429-e7 a2429-f2">Завтра</span></span>
                                </button>
                              </div>
                              <span class="e4" style="background-color: rgb(255, 255, 255);">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="e5" style="color: rgb(255, 184, 0);">
                                  <path fill="currentColor" d="M21 12c0 5.584-3.416 9-9 9s-9-3.416-9-9 3.416-9 9-9 9 3.416 9 9ZM7.557 9.6c-.566 0-.56 1.6-.556 3.023V13c0 2 .835 3 5 3s4.997-1 4.997-3l.001-.377c.005-1.423.01-3.023-.556-3.023-.376 0-.707.592-1.01 1.135-.145.259-.284.507-.418.673-.238.296-.345.342-.533-.091l-.064-.148C14.005 10.21 13.052 8 12 8s-2.005 2.21-2.418 3.169l-.064.148c-.188.433-.295.387-.533.091-.134-.166-.273-.414-.418-.673-.303-.543-.634-1.135-1.01-1.135Z"></path>
                                </svg></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="i3y yi3">
                        <div class="d4147-a iy4">
                          <button class="a6j">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
                              <path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
                            </svg>
                          </button>
                        </div>
                      </div>
                      <!---->
                    </div>
                    *~

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
                //scrollMore();
              });

              $(document).ready(function(){
                //scrollMore();
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