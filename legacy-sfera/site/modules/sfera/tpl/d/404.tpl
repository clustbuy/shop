<!DOCTYPE html>
<html lang="ru">
<head>

    <meta charset="utf-8">

    <title>404 | Cкладской магазин ru.market</title>
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
            ~~include file="market/tpl/`$smarty.const.TPL`/index/header.tpl"~
            <div data-replace-layout-path="[4][0]" class="container b4" data-widget="container">




                <style>
                    .index_errorPage_XIs6l {
                        margin: 45px auto;
                        text-align: center;
                        max-width: 500px;
                    }
                    .index_content_UfRTv {
                        height: 100%;
                    }
                    .index_num_M4IN4, .index_title_W51wQ {
                        font-family: Inter, Arial, Helvetica, sans-serif;
                        font-weight: 600;
                        letter-spacing: normal;
                    }
                    .index_num_M4IN4 {
                        debug-font-name: heading800;
                        font-size: 40px;
                        line-height: 48px;
                        font-variant-numeric: normal;
                        color: var(--theme-rmcolor);
                    }
                    .index_title_W51wQ {
                        debug-font-name: heading400;
                        font-size: 24px;
                        line-height: 30px;
                        font-variant-numeric: normal;
                        margin: 0 0 22px;
                    }
                    .index_body_eL87m {
                        margin: 28px 0 0;
                    }
                    .custom-button__size_normal_veTtr {
                        padding: 7px 15px;
                    }

                    .custom-button__theme_primary_TXTTD {
                        color: #ffffff;
                        background-color: var(--theme-rmcolor);
                    }
                    .custom-button_button_IXR-u {
                        debug-font-name: body500true;
                        font-family: Inter, Arial, Helvetica, sans-serif;
                        font-weight: 600;
                        font-size: 15px;
                        line-height: 24px;
                        letter-spacing: 0;
                        font-variant-numeric: normal;
                        position: relative;
                        display: inline-flex;
                        text-align: center;
                        border: 1px solid transparent;
                        border-radius: 3px;
                        box-sizing: border-box;
                        text-decoration: none;
                        cursor: pointer;
                        outline: none;
                        transition-property: color, background-color, border-color;
                        transition-duration: .3s;
                        align-items: center;
                        min-width: 0;
                    }
                    .custom-button_textAlignCenter_bzRCa {
                        justify-content: center;
                    }
                </style>


                <div class="index_content_UfRTv">
                    <div class="index_errorPage_XIs6l">
                        <div class="index_num_M4IN4">
                            404
                        </div>
                        <div class="index_title_W51wQ">
                            Страница не найдена
                        </div>
                        <div class="index_message_8MHOM">
                            Ошибка могла произойти по следующим причинам:
                        </div>
                        <div class="index_message_8MHOM">
                            <br>
                        </div>
                        <div class="index_message_8MHOM">
                            Неверный адрес, либо запрашиваемая страница удалена
                        </div>
                        <div class="index_body_eL87m">
                            <button class="custom-button_button_IXR-u custom-button__theme_primary_TXTTD custom-button__size_normal_veTtr custom-button_textAlignCenter_bzRCa">
                                <a href="/" class="custom-button_text_XwzZz" style="color:#ffffff">На главную</a>
                            </button>
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <div>
            <div class="an2">
            </div>
        </div>

        ~~include file="market/tpl/`$smarty.const.TPL`/footer.tpl"~

    </div>
</div>

~~include file='market/tpl/bottom_script.tpl'~

</body>
</html>
