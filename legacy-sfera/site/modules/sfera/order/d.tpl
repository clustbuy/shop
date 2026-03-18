<!DOCTYPE html>
<html lang="ru">
<head>

    <meta charset="utf-8">

    <title>Клубный гипермаркет //ru.market - Оформление заказа</title>
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

    ~~include file="market/order/order_head.tpl"~


    <script src="https://securepay.tinkoff.ru/html/payForm/js/tinkoff_v2.js"></script>


    <link rel="stylesheet" type="text/css" href="/assets/css/uw-desktop-sku-grid.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/pdp-all-description-v3.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/vendor-pdp-rich-annotation-renderer.css"/>

</head>
<body>


~~mod path="market/" mod_name="pickpoints" action="get_modal"~


<div id="__ozon">
    <div id="layoutPage" class="a0 a1">
        <div data-replace-layout-path="[0]" class="b0" style="width:auto;" data-widget="blockVertical">
            ~~include file="market/tpl/`$smarty.const.TPL`/index/header.tpl"~


            <div class="u9d dv" style="background-color:#f2f3f5;" data-widget="wallpaper">
                <!---->
                <div data-replace-layout-path="[2][0]" class="dv">
                    <div data-replace-layout-path="[2][0][0][0]" class="container b6" data-widget="container">
                        <div data-replace-layout-path="[2][0][0][0][0][0]" class="d8" data-widget="row">
                            <div data-widget-disallow="[2][0][0][0][0][0][0]" class="c7 c4" data-widget="column"></div>
                            <div data-replace-layout-path="[2][0][0][0][0][0][1][0]" class="d5 c4" data-widget="column">

                                ~~*
                                <div data-widget="backToCartButton">
                                    <a href="/cart" class="by6">Вернуться в корзину</a>
                                </div>
                                *~

                                <div class="z6b" data-widget="header">
                                    <h1 class="tsHeadline700XLarge"> Оформление заказа </h1><!---->
                                    <!---->
                                </div><div class="" style="height:16px;" data-widget="separator"></div>
                            </div><div data-widget-disallow="[2][0][0][0][0][0][2]" class="c7 c4" data-widget="column"></div>
                        </div>
                        <div data-replace-layout-path="[2][0][0][0][1][0]" class="d8" data-widget="row">
                            <div data-widget-disallow="[2][0][0][0][1][0][0]" class="c7 c4" data-widget="column"></div>
                            <div data-replace-layout-path="[2][0][0][0][1][0][1][0]" class="d1 c4" data-widget="column">
                                <div id="payment-info" class="bs9" data-widget="paymentInfoV2">
                                    <div class="bt">
                                        <div class="cd5">
                                            <div>
                                                <div class="a8b">
                                                    <span class="tsHeadline500Medium">Способы оплаты</span>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                        <div class="dc2">
                                            <div class="a300-a2">
                                                <div class="a300-a3">
                                                    <div class="a300-a4" style="transition-duration:300ms;transform:translateX(0px);">



                                                        <script>
                                                            function choose_sbp(obj)
                                                            {
                                                                console.log('choose_sbp');

                                                                if(model_cart.sbp()==0)
                                                                {
                                                                    model_cart.sbp(1);
                                                                    obj.addClass('sbp_payment');
                                                                }
                                                                else
                                                                {
                                                                    model_cart.sbp(1);
                                                                    obj.removeClass('sbp_payment');
                                                                }

                                                            }
                                                        </script>

                                                        <div class="cd3 a300-a1">
                                                            <div class="c0d" id="sbp_payment" onclick="choose_sbp($('#sbp_payment'));">
                                                                <!---->
                                                                <div class="c1d" style="background-image:url(https://cdn1.ozone.ru/graphics/payments/types/fast_pay/icon_v2.svg);">
                                                                    <div class="d1c">
                                                                        <!---->
                                                                    </div>
                                                                    <div class="cd2">
                                                                        <div>
                                                                            <div class="a8b" style="color:#001A34;">
                                                                                <span class="tsBody300XSmall"> </span>
                                                                            </div>
                                                                        </div>
                                                                        <!---->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="cd3 a300-a1">
                                                            <div action="[object Object]" trackinginfo="[object Object]" class="c0d">
                                                                <!---->
                                                                <div class="c1d" style="background-color:#FFFFFF;">
                                                                    <div class="d1c">
                                                                        <div class="c2d">
                                                                            <table>
                                                                                <tr>
                                                                                    <td><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 44 12" height="12" width="44">
                                                                                            <path fill-opacity="0.8" fill="black" d="M8.358 2.488V1.032H0.14V2.488H3.416V11H5.082V2.488H8.358ZM11.1219 2.558V1.032H9.52591V2.558H11.1219ZM11.1219 11V3.888H9.52591V11H11.1219ZM16.8306 3.72C15.8926 3.72 15.1506 4.168 14.7026 4.812H14.6746V3.888H13.1626V11H14.7586V7.052C14.7586 5.694 15.4726 5.008 16.3826 5.008C17.2786 5.008 17.8246 5.512 17.8246 6.786V11H19.4206V6.646C19.4206 4.7 18.4406 3.72 16.8306 3.72ZM27.8051 11L24.5291 7.136L27.4691 3.888H25.6071L23.0171 6.8H22.9891V1.032H21.3931V11H22.9891V7.556H23.0171L25.7891 11H27.8051ZM31.3761 3.678C29.2201 3.678 27.8621 5.134 27.8621 7.444C27.8621 9.754 29.2201 11.21 31.3761 11.21C33.5321 11.21 34.8761 9.754 34.8761 7.444C34.8761 5.134 33.5321 3.678 31.3761 3.678ZM31.3761 4.938C32.5101 4.938 33.2101 5.904 33.2101 7.444C33.2101 8.984 32.5101 9.95 31.3761 9.95C30.2421 9.95 29.5421 8.984 29.5421 7.444C29.5421 5.904 30.2421 4.938 31.3761 4.938ZM43.4742 2.152C43.6142 2.152 43.7682 2.18 43.8522 2.208V1.032C43.6562 0.99 43.3062 0.933999 43.0262 0.933999C41.6262 0.933999 40.8702 1.662 40.8702 3.132V3.888H38.3642V3.314C38.3642 2.474 38.7002 2.152 39.3862 2.152C39.5262 2.152 39.6802 2.18 39.7782 2.208V1.032C39.5682 0.99 39.2322 0.933999 38.9382 0.933999C37.5382 0.933999 36.7822 1.662 36.7822 3.132V3.888H35.5782V5.106H36.7822V11H38.3642V5.106H40.8702V11H42.4522V5.106H43.8242V3.888H42.4522V3.314C42.4522 2.474 42.7882 2.152 43.4742 2.152Z"></path>
                                                                                        </svg>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 50 22" height="22" width="50">
                                                                                            <rect fill="#333333" rx="10.5" height="21" width="50" y="0.5"></rect>
                                                                                            <g clip-path="url(#id_1573295880723_clip0_363_439)">
                                                                                                <path fill="white" d="M11.3602 4.58325C10.5291 4.58325 9.49661 5.09688 9.1118 5.45825L9.26306 5.80196C9.26306 5.80196 8.09135 5.81759 7.48742 6.20632C6.88349 6.59505 6.60811 6.85941 6.3107 7.48728C6.01288 7.50146 4.89621 7.97545 4.24951 8.45196C4.24951 8.45196 3.70594 10.5097 4.73545 11.3977L4.08557 12.2899C4.24951 12.8517 4.9573 13.4225 5.66072 13.4906C5.97723 13.8742 5.36331 14.6361 5.36331 14.6361C5.62321 15.461 7.37276 16.3677 8.41766 16.3677L8.27383 16.8534C8.27383 16.8534 9.4377 17.7009 11.3159 17.6217C12.9036 17.6732 14.1949 17.2941 14.5226 16.8534L14.3567 16.3677C15.8068 16.1516 16.9021 15.6788 17.5116 14.6752C17.5116 14.6752 17.0577 13.7211 17.2162 13.4818C17.9196 13.4137 18.5773 12.7209 18.7522 12.4183L18.1142 11.414C18.623 10.8424 18.9079 9.33436 18.5338 8.45196C17.8871 7.97545 16.7814 7.58797 16.4836 7.57378C16.3654 6.87664 15.6068 6.33161 15.6068 6.33161C14.8884 5.70686 13.5818 5.80196 13.5818 5.80196L13.688 5.45825C13.3549 5.08692 12.3031 4.58325 11.3602 4.58325Z"></path>
                                                                                                <path fill="#333333" d="M9.42235 6.53468C8.59083 6.32291 7.96397 6.61274 7.42161 7.01154C6.87814 7.41115 6.66367 7.92915 6.71136 8.1146C6.26694 7.93264 5.29117 8.49691 4.8267 8.76761C4.8267 8.76761 4.46727 10.5258 5.38611 11.2061C5.33834 11.6837 5.00144 12.257 4.8267 12.3643C5.12959 12.842 5.7714 12.9727 6.04323 12.8514C6.49756 13.4805 6.27803 14.3328 6.02562 14.6047C6.73176 15.2422 8.41657 15.5096 8.91007 15.5496C8.91007 15.5496 8.47567 14.5314 8.28171 13.6925C7.74566 11.3739 8.03418 8.48075 8.03418 8.48075C8.03418 8.48075 6.78204 9.93839 7.48001 13.4524C7.59786 14.0458 7.76441 14.673 7.76441 14.673C7.64827 14.6154 7.36487 14.6503 6.84377 14.3867C7.067 14.1463 6.971 12.7204 6.31333 12.0208C6.31333 12.0208 6.00041 12.1652 5.7707 12.0695C5.92524 11.9746 6.11823 11.3687 6.11823 10.905C5.37456 10.4605 5.45345 9.65698 5.49024 9.23444C5.85515 8.9975 6.50961 8.59473 7.33306 8.94637C7.31143 8.74693 7.36776 8.21608 7.5937 7.84433C7.5937 7.84433 7.86874 7.3658 8.48996 7.21567C9.11117 7.06555 9.42235 6.53468 9.42235 6.53468Z"></path>
                                                                                                <path fill="#333333" d="M13.4154 6.53468C14.2469 6.32291 14.8738 6.61274 15.4162 7.01154C15.9596 7.41115 16.1741 7.92915 16.1264 8.1146C16.5708 7.93264 17.5466 8.49691 18.0111 8.76761C18.0111 8.76761 18.3705 10.5258 17.4517 11.2061C17.4994 11.6837 17.8363 12.257 18.0111 12.3643C17.7082 12.842 17.0664 12.9727 16.7945 12.8514C16.3402 13.4805 16.5597 14.3328 16.8121 14.6047C16.106 15.2422 14.4212 15.5096 13.9277 15.5496C13.9277 15.5496 14.3621 14.5314 14.5561 13.6925C15.0921 11.3739 14.8036 8.48075 14.8036 8.48075C14.8036 8.48075 16.0557 9.93839 15.3578 13.4524C15.2399 14.0458 15.0734 14.673 15.0734 14.673C15.1895 14.6154 15.4729 14.6503 15.994 14.3867C15.7708 14.1463 15.8668 12.7204 16.5244 12.0208C16.5244 12.0208 16.8374 12.1652 17.0671 12.0695C16.9125 11.9746 16.7195 11.3687 16.7195 10.905C17.4632 10.4605 17.3843 9.65698 17.3475 9.23444C16.9826 8.9975 16.3282 8.59473 15.5047 8.94637C15.5263 8.74693 15.47 8.21608 15.2441 7.84433C15.2441 7.84433 14.969 7.3658 14.3478 7.21567C13.7266 7.06555 13.4154 6.53468 13.4154 6.53468Z"></path>
                                                                                                <path fill="#333333" d="M11.4867 7.88918C10.888 7.88702 10.0974 8.04637 10.0974 8.04637L9.85986 5.68169L11.4582 5.19861L12.9779 5.68169L12.8477 8.04637C12.8477 8.04637 12.0756 7.89129 11.4867 7.88918ZM11.4867 7.21511C11.1548 7.20638 10.7275 7.26625 10.7275 7.26625L10.6298 6.14589L11.4582 5.92125L12.2804 6.14589V7.26625C12.2804 7.26625 11.8256 7.22402 11.4867 7.21511Z" clip-rule="evenodd" fill-rule="evenodd"></path>
                                                                                                <path fill="#333333" d="M11.4106 16.8752C12.7941 16.8591 13.6798 16.4469 13.6798 16.4469L13.1389 14.7477C13.1389 14.7477 11.9781 15.0841 11.4189 15.0846C10.8597 15.0841 9.71733 14.7477 9.71733 14.7477L9.15802 16.4469C9.15802 16.4469 10.0271 16.8591 11.4106 16.8752ZM11.4189 16.3082C12.2066 16.305 12.6933 16.1434 12.9575 16.0363L12.8128 15.4539C12.4868 15.561 11.9211 15.6792 11.4189 15.6834C10.9167 15.6792 10.3475 15.591 10.0215 15.4839L9.89554 16.0363C10.1597 16.1434 10.6312 16.305 11.4189 16.3082Z" clip-rule="evenodd" fill-rule="evenodd"></path>
                                                                                                <path fill="#333333" d="M14.2194 8.79114H8.61829C8.66171 8.85165 8.83824 9.14555 8.90138 9.31513C8.96472 9.48525 9.01135 9.65685 9.01348 9.76262C9.01517 9.84636 9.02536 10.1063 9.03869 10.4461L9.03882 10.4494C9.06525 11.1233 9.10411 12.1139 9.11504 12.6991C9.11986 12.9573 9.17721 13.2995 9.3843 13.5794C9.59514 13.8643 9.95127 14.0711 10.5238 14.0711H10.9265C10.9662 14.0711 10.9936 14.0814 11.0153 14.0963C11.0384 14.1122 11.0598 14.1367 11.0812 14.1717C11.1029 14.2071 11.1254 14.2566 11.1464 14.3036C11.1655 14.3464 11.1869 14.3943 11.2121 14.4377C11.2207 14.4492 11.2553 14.4955 11.2877 14.5162C11.3222 14.5382 11.3654 14.5512 11.4189 14.5512C11.4734 14.5512 11.5171 14.5377 11.5519 14.5163C11.5846 14.4962 11.6174 14.4491 11.6266 14.4377C11.6527 14.3929 11.6788 14.3434 11.6979 14.2996C11.7184 14.2523 11.7388 14.2062 11.7599 14.1707C11.7807 14.1358 11.8014 14.1116 11.8238 14.096C11.8447 14.0814 11.8715 14.0712 11.9112 14.0712H12.3139C12.8864 14.0712 13.2426 13.8643 13.4534 13.5794C13.6605 13.2995 13.7178 12.9573 13.7227 12.6991C13.7336 12.114 13.7724 11.1234 13.7989 10.4495L13.799 10.4464C13.8123 10.1065 13.8225 9.84638 13.8242 9.76262C13.8263 9.65686 13.873 9.48526 13.9363 9.31513C13.9995 9.14555 14.176 8.85165 14.2194 8.79114ZM9.68433 9.58425C9.67767 9.54827 9.67042 9.51318 9.66292 9.48141H13.1906C13.1807 9.51652 13.1737 9.55175 13.1686 9.58483C13.1561 9.66676 13.1538 9.79851 13.1538 9.79851C13.1264 10.4878 13.0712 11.9233 13.0712 12.6373C13.0712 12.9319 12.9762 13.1224 12.8506 13.2384C12.7235 13.3559 12.5557 13.4057 12.3961 13.4007C12.3749 13.4 12.3323 13.3993 12.2869 13.3985C12.2262 13.3975 12.1603 13.3964 12.1339 13.3952C11.9734 13.3879 11.8175 13.3951 11.6819 13.4324C11.5835 13.4594 11.4932 13.5031 11.4201 13.5703C11.2491 13.4014 10.9733 13.327 10.6909 13.3399C10.6646 13.3411 10.592 13.3421 10.5247 13.3431C10.4728 13.3439 10.424 13.3446 10.402 13.3453C10.102 13.3548 9.79835 13.1065 9.79835 12.6373C9.79835 11.8574 9.7477 10.5481 9.7217 9.87618C9.7217 9.87618 9.70295 9.68469 9.68433 9.58425Z" clip-rule="evenodd" fill-rule="evenodd"></path>
                                                                                                <path fill="#FFDD2D" d="M9.65503 9.48145C9.66253 9.51322 9.66977 9.54831 9.67644 9.58429C9.69505 9.68473 9.7138 9.87622 9.7138 9.87622C9.7398 10.5481 9.79046 11.8574 9.79046 12.6374C9.79046 13.1065 10.0941 13.3549 10.3941 13.3453C10.4161 13.3446 10.4649 13.3439 10.5168 13.3432C10.5841 13.3422 10.6567 13.3411 10.683 13.3399C10.9654 13.327 11.2412 13.4014 11.4122 13.5703C11.4853 13.5031 11.5756 13.4595 11.674 13.4324C11.8096 13.3951 11.9655 13.3879 12.126 13.3953C12.1524 13.3965 12.2183 13.3976 12.279 13.3986C12.3244 13.3993 12.367 13.4 12.3882 13.4007C12.5478 13.4058 12.7156 13.3559 12.8427 13.2384C12.9683 13.1224 13.0634 12.932 13.0634 12.6374C13.0634 11.9233 13.1185 10.4878 13.1459 9.79855C13.1459 9.79855 13.1482 9.66679 13.1607 9.58487C13.1658 9.55178 13.1728 9.51656 13.1827 9.48145H9.65503Z"></path>
                                                                                            </g>
                                                                                            <path fill="white" d="M25.8498 7.72754H21.7523V14.2725H23.746V12.5125H25.8498C26.3448 12.5125 26.826 12.4988 27.2935 12.3475C28.201 12.0588 28.8748 11.2475 28.8748 10.1475C28.8748 9.04754 28.2148 8.25004 27.321 7.93379C26.826 7.75504 26.3585 7.72754 25.8498 7.72754ZM23.746 10.9725V9.30879H25.561C25.946 9.30879 26.166 9.35004 26.3448 9.41879C26.661 9.54254 26.8123 9.83129 26.8123 10.1338C26.8123 10.4638 26.6335 10.78 26.2898 10.89C26.1248 10.945 25.9323 10.9725 25.561 10.9725H23.746Z"></path>
                                                                                            <path fill="white" d="M31.7327 11.88L32.6815 9.24004H32.8327L33.7815 11.88H31.7327ZM31.2377 13.3238H34.2627L34.6477 14.2725H36.889L34.2077 7.72754H31.2927L28.6115 14.2725H30.8665L31.2377 13.3238Z"></path>
                                                                                            <path fill="white" d="M41.742 7.72754L40.1195 10.7113H40.0507L38.4145 7.72754H36.0907L39.047 12.54V14.2725H41.1095V12.375L43.9145 7.72754H41.742Z"></path>
                                                                                            <defs>
                                                                                                <clipPath id="id_1573295880723_clip0_363_439">
                                                                                                    <rect transform="translate(4.08557 3.66663)" fill="white" height="14.6667" width="14.6667"></rect>
                                                                                                </clipPath>
                                                                                            </defs>
                                                                                        </svg>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="cd3 a300-a1">
                                                            <div action="[object Object]" trackinginfo="[object Object]" class="c0d">
                                                                <!---->
                                                                <div class="c1d" style="background-image: url(/images/sber-logo-v3.svg); background-repeat: no-repeat; background-size:100px 65px;">
                                                                    <div class="d1c">
                                                                        <!---->
                                                                    </div>
                                                                    <div class="cd2">
                                                                        <div>
                                                                            <div class="a8b" style="color:#001A34;">
                                                                                <span class="tsBody300XSmall"> </span>
                                                                            </div>
                                                                        </div>
                                                                        <!---->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="cd3 a300-a1">
                                                            <div action="[object Object]" trackinginfo="[object Object]" class="c0d">
                                                                <!---->
                                                                <div class="c1d" style="background-color:#FFFFFF;">
                                                                    <div class="d1c">
                                                                        <div class="c2d" style="height: 0px;">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 50 24" height="24" width="50">
                                                                                <g clip-path="url(#id_416980133574_clip0_266_204513)">
                                                                                    <ellipse fill="#F23F1F" ry="10" rx="9.9661" cy="12" cx="10.4388"></ellipse>
                                                                                    <path fill="white" d="M11.7674 7.66599H10.8455C9.15557 7.66599 8.26668 8.52397 8.26668 9.78892C8.26668 11.2189 8.88121 11.8898 10.1432 12.7478L11.1857 13.4518L8.18985 17.9396H5.95117L8.63978 13.9248C7.09245 12.8138 6.22551 11.7359 6.22551 9.90992C6.22551 7.62199 7.81674 6.06006 10.8346 6.06006H13.8305V17.9286H11.7674V7.66599Z"></path>
                                                                                </g>
                                                                                <path fill="black" d="M25.0469 5.90234V17.8332H27.0846V13.5758H28.0782C30.7391 13.5758 32.4401 12.3227 32.4401 9.679C32.4401 7.27568 30.8572 5.90234 28.0951 5.90234H25.0469ZM28.0951 11.9622H27.0846V7.516H28.1624C29.5941 7.516 30.3687 8.1855 30.3687 9.679C30.3687 11.2412 29.5099 11.9622 28.0951 11.9622Z"></path>
                                                                                <path fill="black" d="M41.1148 17.8332L38.033 5.90234H35.4562L32.3574 17.8332H34.1089L34.7658 15.2238H38.3528L38.9929 17.8332H41.1148ZM35.1698 13.6102L36.5676 8.0825L37.9485 13.6102H35.1698Z"></path>
                                                                                <path fill="black" d="M49.3336 5.90234H47.4306L45.0222 10.8807L42.6308 5.90234H40.4414L43.877 12.7347V17.8332H45.9149V12.7347L49.3336 5.90234Z"></path>
                                                                                <defs>
                                                                                    <clipPath id="id_416980133574_clip0_266_204513">
                                                                                        <rect transform="translate(0.472656 2)" fill="white" height="20" width="19.9322"></rect>
                                                                                    </clipPath>
                                                                                </defs>
                                                                            </svg>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>

                                                ~~*
                                                <div class="a300-a8 a300-b0">
                                                    <div class="a300-a9 a300-b1 a300-b a200-a" style="margin:0 -23px;">
                                                        <button tabindex="0" disabled="disabled" type="button" aria-label="Previous slide" class="a200-a4 a200-a6 a200-a5" style="border-radius:50%;">
                                            <span class="a200-b1 a200-c9 a200-b3 a200-a6 a200-f0" style="border-radius:50%;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a200-e9" style="transform:rotate(180deg);">
                                                    <path fill="currentColor" d="M12.293 5.293a1 1 0 0 0 0 1.414L16.586 11H4a1 1 0 1 0 0 2h12.586l-4.293 4.293a1 1 0 0 0 1.414 1.414l6-6a1 1 0 0 0 0-1.414l-6-6a1 1 0 0 0-1.414 0"></path>
                                                </svg><span class="a200-e7"></span></span>
                                                        </button>
                                                    </div>
                                                    <div class="a300-a9 a300-b2 a200-a" style="margin:0 -23px;">
                                                        <button tabindex="0" type="button" aria-label="Next slide" class="a200-a4 a200-a5" style="border-radius:50%;">
                                            <span class="a200-b1 a200-c9 a200-b3 a200-f0" style="border-radius:50%;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a200-e9">
                                                    <path fill="currentColor" d="M12.293 5.293a1 1 0 0 0 0 1.414L16.586 11H4a1 1 0 1 0 0 2h12.586l-4.293 4.293a1 1 0 0 0 1.414 1.414l6-6a1 1 0 0 0 0-1.414l-6-6a1 1 0 0 0-1.414 0"></path>
                                                </svg><span class="a200-e7"></span></span>
                                                        </button>
                                                    </div>
                                                </div>
                                                *~

                                            </div>
                                        </div>
                                        <div class="c5d">
                                            <div class="dc5">
                                                <!---->
                                                <!---->
                                                <div type="annotation" class="d300-a g2 g3 d300-a9">
                                                    <div class="d300-a1">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="d300-a3" style="color: rgb(0, 26, 52);">
                                                            <path fill="currentColor" d="M10 11V7a1 1 0 0 1 1-1h2.5a3.5 3.5 0 1 1 0 7H12v1h3a1 1 0 1 1 0 2h-3v1a1 1 0 1 1-2 0v-1H9a1 1 0 1 1 0-2h1v-1H9a1 1 0 1 1 0-2zm2 0h1.5a1.5 1.5 0 0 0 0-3H12z"></path><path fill="currentColor" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1M3 12a9 9 0 1 1 18 0 9 9 0 0 1-18 0"></path>
                                                        </svg>
                                                        <div class="d300-a4">
                                                            <div>
                                                                <!---->
                                                                <p class="g0 tsBody400Small" style="color:;">
                                                                    Выбирайте СБП для применения дополнительной скидки в 3% от суммы заказа
                                                                </p>
                                                                ~~*
                                                                <div class="g1">
                                                                    <button type="button" class="ga00-a undefined">
                                                                        <div class="ga00-a2 tsBody300XSmall">
                                                                            Порядок действий
                                                                        </div>
                                                                    </button>
                                                                </div>
                                                                *~
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!---->
                                    </div>
                                    <!---->
                                    <!---->
                                </div><div class="" style="height:24px;" data-widget="separator"></div>
                                <section class="ce3" data-widget="rfbsSplitHeader">
                                    <div class="a8b" style="color:rgba(0, 26, 52, 0.6);">
                                        <span class="tsBodyControl400Small">ЯНДЕКС ДОСТАВКА</span>
                                    </div>
                                </section>
                                <section class="e1c" data-widget="rfbsAddressInfo">
                                    <div class="ec2">
                                        <div class="a8b ba9 b9a" style="color:rgba(0, 26, 52, 1);">
                                            <span class="tsHeadline500Medium">Способ получения</span>
                                        </div>
                                        <!---->
                                        <div class="e2c">
                                            <div class="e800-a">
                                                <div class="">
                                                    <div class="a200-a">
                                                        <button tabindex="0" type="button" class="a200-a4" style="border-radius:6px;">
                                                            <span class="a200-b1 a200-f0" style="border-radius:6px;">
                                                                <div class="e800-a6">
                                                                    <!---->
                                                                    <span style="">Самовывоз</span><!---->
                                                                </div>
                                                            </span>
                                                        </button>
                                                    </div>
                                                </div>
                                                ~~*
                                                <div class="">
                                                    <div class="a200-a">
                                                        <button tabindex="0" type="button" class="a200-a4" style="border-radius:6px;">
                                                            <span class="a200-b1 a200-c a200-f0" style="border-radius:6px;">
                                                                <div class="e800-a6">
                                                                    <!---->
                                                                    <span style="">Курьером</span><!---->
                                                                </div>
                                                            </span>
                                                        </button>
                                                    </div>
                                                </div>
                                                *~
                                                <!---->
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="bs5 sb6">
                                            <div class="j4">
                                                <div class="j8 j9" style="color:rgba(7, 7, 7, 1);width:24px;max-width:24px;max-height:24px;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                                        <path fill="currentColor" d="M12 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10m-3 5a3 3 0 1 1 6 0 3 3 0 0 1-6 0"></path><path fill="currentColor" d="M12 1a9 9 0 0 0-9 9c0 2.514 1.136 4.848 2.699 6.942 1.565 2.099 3.631 4.05 5.643 5.81a1 1 0 0 0 1.316 0c2.012-1.76 4.078-3.711 5.644-5.81C19.864 14.848 21 12.514 21 10a9 9 0 0 0-9-9m-7 9a7 7 0 0 1 14 0c0 1.904-.864 3.82-2.302 5.746-1.275 1.71-2.945 3.353-4.698 4.92-1.753-1.567-3.423-3.21-4.699-4.92C5.864 13.82 5 11.904 5 10"></path>
                                                    </svg>
                                                </div>
                                                <div class="k1 k5">
                                                    <div class="k6">
                                                        <div class="k9 tsBody500Medium" style="color:rgba(7, 7, 7, 1);">
                                                            <b>Пункт выдачи Яндекс</b>
                                                        </div>
                                                        <div class="tsBody400Small l3" style="color:rgba(7, 7, 7, 1);">
                                                            Москва, поселение Внуковское, улица Бориса Пастернака, 14

                                                            ~~*
                                                            <br>
                                                            <br>
                                                            Срок хранения заказа — 7&nbsp;дней.
                                                            <br>
                                                            Можно продлить хранение ещё на 7 дней после доставки в пункт выдачи
                                                            *~
                                                        </div>
                                                    </div>
                                                    <div class="l4">
                                                        <a href="#pickpoints"><span class="l9">Изменить</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="bs5 b5s b6s s6b">
                                            <hr type="separator" class="s4b" style="background-color:rgba(0, 48, 120, 0.039);margin-left:0px;margin-right:0px;">
                                        </div>


                                        <div class="" style="height:24px;" data-widget="separator"></div>



                                        <style>
                                            .f00-a.f00-b4.f00-a7 .f00-a0, .f00-a.f00-b4.f00-a8:not(.f00-b6) .f00-a0, .f00-a.f00-b7.f00-a7 .f00-a0, .f00-a.f00-b7.f00-a8:not(.f00-b6) .f00-a0 {
                                                background-color: hsla(0, 0%, 100%, 0);
                                                transform: translateY(-10px) scale(.75);
                                            }

                                            .f00-a.f00-a7 .f00-a0 {
                                                font-size: 16px;
                                                line-height: 20px;
                                                top: 12px;
                                            }
                                            .f00-a .f00-a0, .f00-a .f00-a1 {
                                                font-family: GTEestiPro, arial, sans-serif;
                                                margin: 0;
                                            }
                                            .f00-a .f00-a0 {
                                                color: #96a3ae;
                                                display: block;
                                                left: 10px;
                                                pointer-events: none;
                                                position: absolute;
                                                text-align: left;
                                                transform-origin: 0 0;
                                                transition: transform .2s cubic-bezier(.25,.8,.25,1);
                                                white-space: pre-wrap;
                                                will-change: transform;
                                            }
                                            </style>
                                        <div class="bs5 sb6">
                                            <div class="j4">
                                                <div class="j8 j9" style="color:rgba(7, 7, 7, 1);width:24px;max-width:24px;max-height:24px;">
                                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg"
                                                         width="24" height="24" viewBox="0 0 204.000000 204.000000"
                                                         preserveAspectRatio="xMidYMid meet">
                                                        <metadata>
                                                            Created by potrace 1.16, written by Peter Selinger 2001-2019
                                                        </metadata>
                                                        <g transform="translate(0.000000,204.000000) scale(0.100000,-0.100000)"
                                                           fill="#000000" stroke="none">
                                                            <path d="M913 1955 c-87 -19 -178 -70 -243 -136 -184 -186 -187 -486 -8 -675
                                                            102 -108 209 -154 358 -154 149 0 256 46 358 154 259 274 115 733 -255 811
                                                            -82 18 -129 18 -210 0z m248 -171 c69 -31 140 -102 172 -172 32 -69 31 -207
                                                            -3 -277 -34 -71 -116 -148 -185 -174 -126 -47 -266 -19 -358 72 -78 77 -101
                                                            131 -101 242 -1 106 18 157 85 230 102 110 252 141 390 79z"/>
                                                            <path d="M520 910 c-201 -72 -322 -258 -346 -532 -8 -96 2 -116 87 -159 145
                                                            -73 358 -122 606 -141 325 -24 698 33 912 141 81 41 96 70 87 168 -9 92 -38
                                                            206 -70 275 -52 110 -169 213 -283 248 -84 26 -113 25 -171 -4 -187 -94 -412
                                                            -98 -612 -11 -90 40 -131 43 -210 15z m191 -160 c181 -72 438 -71 620 0 123
                                                            49 261 -30 323 -186 31 -78 48 -172 34 -197 -27 -51 -263 -110 -516 -129 -249
                                                            -19 -536 11 -725 77 -101 35 -109 45 -96 123 25 157 112 284 215 316 66 20 85
                                                            19 145 -4z"/>
                                                        </g>
                                                    </svg>

                                                </div>
                                                <div class="k1 k5">
                                                    <div class="k6">

                                                        <form autocomplete="off" class="l-order__main" method="POST" action="/order/" id="order_form">

                                                            <div class="ea1c" data-widget="changePhone">
                                                            <!---->
                                                            <div class="k9 tsBody500Medium" style="color:rgba(7, 7, 7, 1);">
                                                                <b>Контакты</b>
                                                                <br><br>
                                                            </div>

                                                            <div class="c800-a ba6z aec2" autofocus="autofocus">

                                                                <label class="c800-a0"><!---->
                                                                <div class="f00-a f00-a5 f00-b6">
                                                                    <div class="f00-b0">
                                                                        <input type="text" name="phone" maxlength="20" class="d00-a d00-a3 d00-a4">
                                                                        <!---->
                                                                        <p class="f00-a0">Телефон</p>
                                                                        <div class="f00-a2 f00-a5">
                                                                            <!---->
                                                                            <!---->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                </label><!---->


                                                            </div>
                                                            <!---->
                                                            <div class="" style="height:24px;" data-widget="separator"></div>
                                                            <div class="c800-a ba6z aec2" autofocus="autofocus">

                                                                <label class="c800-a0"><!---->
                                                                    <div class="f00-a f00-a5 f00-b6">
                                                                        <div class="f00-b0">
                                                                            <input type="text" name="email" maxlength="150" class="d00-a d00-a3 d00-a4">
                                                                            <!---->
                                                                            <p class="f00-a0">Email</p>
                                                                            <div class="f00-a2 f00-a5">
                                                                                <!---->
                                                                                <!---->
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </label><!---->


                                                            </div>
                                                            <!---->

                                                            <div class="" style="height:24px;" data-widget="separator"></div>
                                                            <div class="c800-a ba6z aec2" autofocus="autofocus">

                                                                <label class="c800-a0"><!---->
                                                                    <div class="f00-a f00-a5 f00-b6">
                                                                        <div class="f00-b0">
                                                                            <input type="text" name="customer_name" maxlength="35" class="d00-a d00-a3 d00-a4">
                                                                            <!---->
                                                                            <p class="f00-a0">Ваше имя</p>
                                                                            <div class="f00-a2 f00-a5">
                                                                                <!---->
                                                                                <!---->
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </label><!---->


                                                            </div>
                                                            <!---->


                                                            ~~*
                                                            <div class="cae2">
                                                                <button type="submit" class="b200-a0 b200-b5 b200-b1 b200-a4">
                                                                    <div class="b200-a1">
                                                                        <div class="b200-a8 tsBodyControl400Small">
                                                                            Подтвердить
                                                                        </div>
                                                                    </div><div class="b200-a"></div>
                                                                </button>
                                                                <p qa-id="changePhoneSubmitButtonPrompt" class="ae2c tsBody400Small">
                                                                    Подтвердите код из СМС
                                                                </p>
                                                            </div>

                                                            <button class="a2ec ga00-a undefined">
                                                                <div class="ga00-a2 tsBodyControl400Small">
                                                                    Изменить с подтверждением
                                                                </div>
                                                            </button>
                                                            *~
                                                        </div>

                                                        </form>

                                                    </div>

                                                    <div class="l4">
                                                        ~~*<span class="l9">Изменить</span>*~
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="bs5 b5s b6s s6b">
                                            <hr type="separator" class="s4b" style="background-color:rgba(0, 48, 120, 0.039);margin-left:0px;margin-right:0px;">
                                        </div>


                                        ~~*
                                        <div class="bs5 sb6">
                                            <div class="j4 j5">
                                                <div class="j8 k0" style="color:rgba(7, 7, 7, 1);width:24px;max-width:24px;max-height:24px;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                                        <path fill="currentColor" d="M8 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0m10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m-8.3 4.286c.016.015.185.165.5.323.376.187.971.391 1.8.391s1.425-.204 1.8-.391c.175-.088.355-.19.5-.323a1 1 0 0 1 1.407 1.421C15.587 16.827 14.357 18 12 18c-2.358 0-3.587-1.173-3.707-1.293A1 1 0 0 1 9.7 15.286"></path><path fill="currentColor" d="M11 2a1 1 0 0 1 1-1c6.075 0 11 4.925 11 11s-4.925 11-11 11S1 18.075 1 12a11 11 0 0 1 6.23-9.914 1 1 0 0 1 1.36.524c.292.72.69 1.565 1.362 2.233C10.592 5.481 11.524 6 13 6a1 1 0 1 1 0 2c-2.024 0-3.458-.743-4.459-1.74-.6-.596-1.027-1.267-1.34-1.875A9 9 0 1 0 12 3a1 1 0 0 1-1.001-1"></path>
                                                    </svg>
                                                </div>
                                                <div class="k1">
                                                    <div class="k6 k8">
                                                        <div class="k9 tsBody500Medium l l1">
                                                            Игорь Карпов +79645351331
                                                        </div>
                                                    </div>
                                                    <div class="l4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="l7">
                                                            <path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8z"></path>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        *~


                                    </div>
                                </section><div class="" style="height:24px;" data-widget="separator"></div>
                                <div id="FBS-W1020000441304000-S1046044" class="e4c" data-widget="rfbsSplit">
                                    <div class="ec5">
                                        <div class="ec3">
                                            <div class="e3c ce4">
                                                <!---->
                                                <div class="a8b" style="">
                                                    <span class="tsHeadline500Medium">Ожидаемая дата доставки:&nbsp;7&nbsp;апреля, бесплатно</span>
                                                </div>
                                            </div>
                                            <!---->
                                            <!---->
                                        </div>
                                        <div class="a8b c6e cart" style="color:rgba(0, 26, 52, 0.6);">
                                            <span class="BodyM"> товаров: <span data-bind="text: total_cart_amount()"></span>&nbsp;•&nbsp;<span data-bind="text: cart_weight() + ' кг '"></span></span>
                                        </div>
                                    </div>
                                    <div class="a300-a2 cart">


                                        <!-- ko foreach: cart().items() -->

                                        <div class="a300-a3">
                                            <div class="a300-a4" style="transition-duration:300ms;transform:translateX(0px);">
                                                <div class="a300-a1" style="padding-left:24px;padding-right:24px;">
                                                    <div class="t4b" style="width:92px;height:92px;border:none;">
                                                        <a  target="_blank" data-bind="attr: {href: `/product/${guid()}/`}">
                                                        <img
                                                                loading="lazy"
                                                                fetchpriority="low"
                                                                data-bind="attr: {src: `https://ru.market/i/${guid()}/400/1.jpg`}"
                                                                src=""
                                                                srcset=""
                                                                class="b900-a">
                                                        </a>
                                                    </div>
                                                    <div class="a8b t5b" style="color:rgba(0, 26, 52, 0.6);">
                                                        <span class="tsBody300XSmall" data-bind="text: cost()+ ' ₽'"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- /ko -->

                                        <div class="a300-a8 a300-b0">
                                            ~~*
                                            <div class="a300-a9 a300-b1 a300-b a200-a" style="margin:0 -23px;">
                                                <button tabindex="0" disabled="disabled" type="button" aria-label="Previous slide" class="a200-a4 a200-a6 a200-a5" style="border-radius:50%;">
                                                    <span class="a200-b1 a200-c9 a200-b3 a200-a6 a200-f0" style="border-radius:50%;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a200-e9" style="transform:rotate(180deg);">
                                                    <path fill="currentColor" d="M12.293 5.293a1 1 0 0 0 0 1.414L16.586 11H4a1 1 0 1 0 0 2h12.586l-4.293 4.293a1 1 0 0 0 1.414 1.414l6-6a1 1 0 0 0 0-1.414l-6-6a1 1 0 0 0-1.414 0"></path>
                                                    </svg><span class="a200-e7"></span></span>
                                                </button>
                                            </div>
                                            <div class="a300-a9 a300-b2 a300-b a200-a" style="margin:0 -23px;">
                                                <button tabindex="0" disabled="disabled" type="button" aria-label="Next slide" class="a200-a4 a200-a6 a200-a5" style="border-radius:50%;">
                                                <span class="a200-b1 a200-c9 a200-b3 a200-a6 a200-f0" style="border-radius:50%;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a200-e9">
                                                        <path fill="currentColor" d="M12.293 5.293a1 1 0 0 0 0 1.414L16.586 11H4a1 1 0 1 0 0 2h12.586l-4.293 4.293a1 1 0 0 0 1.414 1.414l6-6a1 1 0 0 0 0-1.414l-6-6a1 1 0 0 0-1.414 0"></path>
                                                    </svg><span class="a200-e7"></span></span>
                                                </button>
                                            </div>
                                            *~
                                        </div>
                                    </div>
                                    <div>
                                        <div class="bs5 bs6">
                                            <div class="a8b">
                                                <span class="tsBodyControl500Medium">Доставка в Пункт выдачи Яндекс</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                    <div></div>
                                </div><!---->
                            </div>
                            <div data-replace-layout-path="[2][0][0][0][1][0][2][0]" class="d c4 cart" data-widget="column">
                                <div data-replace-layout-path="[2][0][0][0][1][0][2][0][0][0]" class="e0" style="top:32px;" data-widget="stickyContainer">
                                    <section class="br2" data-widget="total">
                                        <div class="rb2">
                                            <div class="p9b r2b">
                                                <!---->
                                                <button class="b200-a0 b200-b5 b200-b2 b200-a4" id="confirm-btn">
                                                    <div class="b200-a1">
                                                        <div class="b200-a8 tsBodyControl500Medium">
                                                            Продолжить
                                                        </div>
                                                    </div><div class="b200-a"></div>
                                                </button>
                                                <div class="b0q">
                                                    <div class="aa6 aa8">
                                                        <div class="b1a">
                                                            <div class="ab2" style="color:#808d9a;">
                                                                <span class="a2b">Нажимая на кнопку, вы соглашаетесь с <a href="https://ru.market/legal/personal-data/" target="_blank">Условиями обработки персональных данных</a>, а также с <a href="https://ru.market/common/pravila-prodayoi-i-rekvizity?country=RU" target="_blank">Условиями продажи</a></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="q4b">
                                                <div class="b5q">
                                                    <span class="qb5"> Ваш заказ </span><span class="q5b"> товаров: <span data-bind="text: total_cart_amount()"></span>&nbsp;•&nbsp;<span data-bind="text: cart_weight() + ' кг '"></span></span>
                                                </div>
                                                <div class="qb1">
                                                    <div class="q1b">
                                                        <span class="bq2"><span><span style="color: #001a34;">Товары</span></span> <!----></span><!---->
                                                        <!---->
                                                    </div>
                                                    <div>
                                                        <!---->
                                                        <span class="qb2"><span style="color: #001a34;" data-bind="text: cart_sum() + ' ₽'"></span></span>
                                                    </div>
                                                </div>
                                                <div class="qb1">
                                                    <div class="q1b">
                                                        <span class="bq2"><span><span style="color: #001a34;">Скидка</span></span> <!----></span><!---->

                                                        ~~*
                                                        <button class="ga00-a undefined">
                                                            <div class="ga00-a2 tsBodyControl400Small">
                                                                Подробнее
                                                            </div>
                                                        </button>
                                                        *~

                                                    </div>
                                                    <div>
                                                        <!---->
                                                        <span class="qb2"><span style="color: #f91155;"  data-bind="text: ' -' + cart_discount() + ' ₽'"></span></span>
                                                    </div>
                                                </div>
                                                <div class="qb1">
                                                    <div class="q1b">
                                                        <span class="bq2"><span><span style="color: #001a34;">Стоимость доставки</span></span> <!----></span><span><span style="color: #808d9a;">1&nbsp;отправление</span></span><!---->
                                                    </div>
                                                    <div>
                                                        <!---->
                                                        <span class="qb2"><span style="color: #3ac267;">Бесплатно</span></span>
                                                    </div>
                                                </div>
                                                <div class="bq6">
                                                    <span> Итого <!----></span><span  data-bind="text: total_cart_sum() + ' ₽'"></span>
                                                </div>
                                                <!---->
                                            </div>
                                            <!---->
                                        </div>

                                        ~~*
                                        <div class="bq8" style="display:none;">

                                            <!---->
                                            <div class="q8b">
                                                <div class="b9q">
                                                    <div class="qb9">
                                                        2 625 ₽
                                                    </div>
                                                    <div class="q9b">
                                                        <span style="color: #808d9a;">Начислим 78 бонусов</span>
                                                    </div>
                                                </div>
                                                <div class="br">
                                                    <!---->
                                                    <button class="b200-a0 b200-b5 b200-b1">
                                                        <div class="b200-a1">
                                                            <div class="b200-a8 tsBodyControl400Small">
                                                                Пополнить и оплатить
                                                            </div>
                                                        </div><div class="b200-a"></div>
                                                    </button>
                                                </div>
                                                <!---->
                                            </div>
                                            <!---->
                                        </div>
                                        <!---->

                                        *~

                                    </section>


                                    ~~*
                                    <div class="" style="height:24px;" data-widget="separator"></div>

                                    <div class="b3k" data-widget="totalScoresWeb">
                                        <div class="k2b bk3">
                                            <div>
                                                <div class="a8b k3b" style="color:rgba(7, 7, 7, 1);">
                                                    <span class="tsHeadline500Medium">Начислим 78 бонусов продавца</span>
                                                </div>
                                                <!---->
                                                <!---->
                                                <!---->
                                            </div>
                                            <div class="kb4">
                                                <button class="k4b bk5 ga00-a undefined">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="ga00-a0" style="color:rgba(0, 26, 52, 0.2);">
                                                        <path fill="currentColor" d="M3.414 5.65a1.25 1.25 0 0 1 1.765.094L8 8.878l2.82-3.134a1.25 1.25 0 1 1 1.86 1.672l-3.75 4.167a1.25 1.25 0 0 1-1.86 0L3.32 7.416a1.25 1.25 0 0 1 .094-1.765"></path>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="b4k">
                                            <div class="kb0 kb2">
                                                <div class="bk2">
                                                    Бонусы Апельсин
                                                    <div class="d400-a"></div>
                                                </div>
                                                <div class="b2k">
                                                    78
                                                    <div class="k0b" style="background-image: url(&quot;https://cdn1.ozone.ru/graphics/clustbuy/cart/score_svg/ic_s_bonus.svg&quot;);"></div>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                    </div>
                                    *~


                                    <div class="" style="height:24px;" data-widget="separator"></div>


                                    <div data-widget="discountCode">
                                        <div class="zb4">
                                            <div class="bz5">
                                                <div class="z4b b700-a b700-a5 tsBodyControl500Medium" style="color:rgba(7, 7, 7, 1);background:;">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" style="color: rgb(0, 26, 52); z-index: 2;">
                                                        <path fill="currentColor" d="M12 3a9 9 0 0 0-9 9c0 1.169.222 2.283.626 3.305a1 1 0 0 1-1.86.734A11 11 0 0 1 1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11a10.97 10.97 0 0 1-7.621-3.068 1.197 1.197 0 0 1-.016-1.71l10.93-10.93a1 1 0 1 1 1.414 1.415L6.382 19.032A8.96 8.96 0 0 0 12 21a9 9 0 1 0 0-18"></path><path fill="currentColor" d="M10 8.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m7 7a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"></path>
                                                    </svg>
                                                </div>
                                                <p class="zb5">
                                                    Введите промокод или сертификат
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b6z zb6">
                                                        <path fill="currentColor" d="M3.414 5.65a1.25 1.25 0 0 1 1.765.094L8 8.878l2.82-3.134a1.25 1.25 0 1 1 1.86 1.672l-3.75 4.167a1.25 1.25 0 0 1-1.86 0L3.32 7.416a1.25 1.25 0 0 1 .094-1.765"></path>
                                                    </svg>
                                                </p>
                                            </div>
                                            <form class="">
                                                <div class="c800-a zb3">
                                                    <label class="c800-a0"><!---->
                                                        <div class="f00-a f00-a5 f00-b6">
                                                            <div class="f00-b0">
                                                                <input type="text" name="" maxlength="" class="d00-a d00-a1 d00-a4">
                                                                <!---->
                                                                <p class="f00-a0">
                                                                    Введите код
                                                                </p>
                                                                <div class="f00-a2 f00-a5">
                                                                    <!---->
                                                                    <!---->
                                                                </div>
                                                            </div>
                                                        </div></label><!---->
                                                </div>
                                                <!---->
                                                <div class="bz4">
                                                    <button type="submit" class="b200-a0 b200-b5 b200-b1 b200-a4">
                                                        <div class="b200-a1">
                                                            <div class="b200-a8 tsBodyControl400Small">
                                                                Применить промокод
                                                            </div>
                                                        </div><div class="b200-a"></div>
                                                    </button>
                                                </div>
                                                <!---->
                                            </form>
                                            <!---->
                                        </div>
                                    </div>
                                </div>
                            </div><div data-widget-disallow="[2][0][0][0][1][0][3]" class="c7 c4" data-widget="column"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



        ~~include file="market/tpl/`$smarty.const.TPL`/footer.tpl"~



        <div>
            <div class="an2">

                <div style="/*display:none;*/" class="tinkoff">
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

            </div>
        </div>
    </div>
</div>
~~include file='market/tpl/bottom_script.tpl'~

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
        $('#totalPrice')[0].innerHTML = Number(model_cart.total_cart_sum();
        Tinkoff_pay_form.amount.value = Number(model_cart.total_cart_sum();
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
        //$('#deliveryCost')[0].innerHTML = 0
        //$('#totalPrice')[0].innerHTML = model_cart.total_cart_sum()
        Tinkoff_pay_form.amount.value = number_format(model_cart.total_cart_sum(), 2, '.', '');

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
                    phone: phone.replace(/\D/g, '').replace('+', ''),
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



</body>
</html>