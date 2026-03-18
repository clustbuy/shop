<!DOCTYPE html>
<html lang="ru">
<head>

    <meta charset="utf-8">

    <title>Клубный гипермаркет //ru.market - Моя корзина</title>
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

    ~~include file="market/cart/cart_head.tpl"~

    <link rel="stylesheet" type="text/css" href="/assets/css/uw-desktop-sku-grid.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/pdp-all-description-v3.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/vendor-pdp-rich-annotation-renderer.css"/>

</head>
<body>

<div id="__ozon">
    <div id="layoutPage" class="a0 a1" style="background-color:#f2f3f5;">
        <div data-replace-layout-path="[0]" class="b0" style="width:auto;" data-widget="blockVertical">
            ~~*include file="market/tpl/`$smarty.const.TPL`/index/header.tpl"*~


            <style>
                [data-tui-theme] tui-root>.t-root-scrollbar,tui-root{display:block}
                .additional[_ngcontent-ng-c3813920883]:empty,.bill-item_skeleton[_ngcontent-ng-c1198523064]:nth-child(n+4),.checkout-notification[_ngcontent-ng-c669369259]:before,[tuiDropdownButton][tuiDropdownButton]{display:none}
                .button-secondary-black[_ngcontent-ng-c854462051],.dialog-button[_ngcontent-ng-c3031445874]{--tui-link:var(--tui-text-01);--tui-link-hover:var(--tui-text-01)}
                .action[_ngcontent-ng-c3813920883],.radio[_ngcontent-ng-c3410533622]{--tui-primary:#407be0;--tui-primary-hover:#3268d8;--tui-primary-active:#1e5aca;--tui-primary-text:#fff}body{height:100%;min-height:100%;text-rendering:optimizeLegibility;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}body,html{-webkit-overflow-scrolling:touch;margin:0;padding:0px !important;}@supports (-webkit-hyphens:none) and (text-align-last:right){:after{content:none}}:root{--tui-font-heading:tuiHeading,-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;--tui-font-heading-1:bold 3.125rem/3.5rem var(--tui-font-heading);--tui-font-heading-2:bold 2.75rem/3rem var(--tui-font-heading);--tui-font-heading-3:500 2.25rem/2.5rem var(--tui-font-heading);--tui-font-heading-4:500 1.75rem/2rem var(--tui-font-heading);--tui-font-heading-5:500 1.5rem/1.75rem var(--tui-font-heading);--tui-font-heading-6:500 1.25rem/1.5rem var(--tui-font-heading);--tui-font-text:tuiText,-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;--tui-font-text-xl:normal 1.1875rem/1.75rem var(--tui-font-text);--tui-font-text-l:normal 1.0625rem/1.75rem var(--tui-font-text);--tui-font-text-l-2:normal 1.0625rem/1.5rem var(--tui-font-text);--tui-font-text-m:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-m-2:normal .9375rem/1.25rem var(--tui-font-text);--tui-font-text-s:normal .8125rem/1.25rem var(--tui-font-text);--tui-font-text-s-2:normal .8125rem/1rem var(--tui-font-text);--tui-font-text-xs:normal .6875rem/1rem var(--tui-font-text);--tui-radius-xs:.25rem;--tui-radius-s:.375rem;--tui-radius-m:.5rem;--tui-radius-l:.75rem;--tui-radius-xl:1.5rem;--tui-height-xs:1.5rem;--tui-height-s:2rem;--tui-height-m:2.75rem;--tui-height-l:3.5rem;--tui-padding-s:.75rem;--tui-padding-m:.75rem;--tui-padding-l:1rem;--tui-disabled-opacity:.56;--tui-autofill:#fff5c0;--tui-base-01:#fff;--tui-base-02:#f6f7f8;--tui-base-03:#eaecee;--tui-base-04:#dddfe0;--tui-base-05:#c7c9cc;--tui-base-06:#9299a2;--tui-base-07:#5c636b;--tui-base-08:#333;--tui-base-09:#000;--tui-primary:#ffdd2d;--tui-primary-hover:#fcc521;--tui-primary-active:#fab619;--tui-primary-text:rgba(0, 0, 0, .8);--tui-secondary:#ecf1f7;--tui-secondary-hover:#e4ebf3;--tui-secondary-active:#dde4ed;--tui-accent:#428bf9;--tui-accent-hover:#336fee;--tui-accent-active:#1f50ba;--tui-accent-text:#fff;--tui-selection:rgba(255, 221, 45, .32);--tui-focus:rgba(51, 51, 51, .48);--tui-clear:rgba(0, 0, 0, .04);--tui-clear-disabled:rgba(0, 0, 0, .02);--tui-clear-hover:rgba(0, 0, 0, .08);--tui-clear-active:rgba(0, 0, 0, .12);--tui-clear-inverse:rgba(255, 255, 255, .16);--tui-clear-inverse-hover:rgba(255, 255, 255, .24);--tui-clear-inverse-active:rgba(255, 255, 255, .4);--tui-error-fill:#f52222;--tui-error-bg:rgba(224, 31, 25, .12);--tui-error-bg-hover:rgba(224, 31, 25, .16);--tui-success-fill:#00b92d;--tui-success-bg:rgba(0, 185, 45, .12);--tui-success-bg-hover:rgba(0, 185, 45, .24);--tui-warning-fill:#fab619;--tui-warning-bg:rgba(250, 182, 25, .12);--tui-warning-bg-hover:rgba(250, 182, 25, .24);--tui-info-fill:#428bf9;--tui-info-bg:rgba(66, 139, 249, .12);--tui-info-bg-hover:rgba(66, 139, 249, .24);--tui-neutral-fill:#79818c;--tui-neutral-bg:rgba(121, 129, 140, .12);--tui-neutral-bg-hover:rgba(121, 129, 140, .24);--tui-text-01:rgba(0, 0, 0, .8);--tui-text-02:rgba(0, 0, 0, .54);--tui-text-03:rgba(0, 0, 0, .4);--tui-link:#336fee;--tui-link-hover:#1f50ba;--tui-positive:#00a127;--tui-positive-hover:#00701b;--tui-negative:#e31c1c;--tui-negative-hover:#a00707;--tui-error-fill-night:#fb4040;--tui-error-bg-night:rgba(251, 64, 64, .48);--tui-error-bg-night-hover:rgba(251, 64, 64, .28);--tui-success-fill-night:#10d952;--tui-success-bg-night:rgba(16, 217, 82, .48);--tui-success-bg-night-hover:rgba(16, 217, 82, .28);--tui-warning-fill-night:#fab619;--tui-warning-bg-night:rgba(250, 182, 25, .48);--tui-warning-bg-night-hover:rgba(250, 182, 25, .28);--tui-info-fill-night:#428bf9;--tui-info-bg-night:rgba(66, 139, 249, .48);--tui-info-bg-night-hover:rgba(66, 139, 249, .32);--tui-neutral-fill-night:#959ba4;--tui-neutral-bg-night:rgba(149, 155, 164, .48);--tui-neutral-bg-night-hover:rgba(149, 155, 164, .32);--tui-autofill-night:#554a2a;--tui-elevation-01:#fff;--tui-elevation-02:#fff;--tui-text-01-night:rgba(255, 255, 255, .88);--tui-text-02-night:rgba(255, 255, 255, .72);--tui-text-03-night:rgba(255, 255, 255, .5);--tui-link-night:#428bf9;--tui-link-night-hover:#336fee;--tui-positive-night:#10d952;--tui-positive-night-hover:#00a127;--tui-negative-night:#fb4040;--tui-negative-night-hover:#e31c1c;--tui-support-01:#ffd450;--tui-support-02:#ffb74c;--tui-support-03:#f8a34d;--tui-support-04:#ff8863;--tui-support-05:#ee805d;--tui-support-06:#ff7b76;--tui-support-07:#ff78a7;--tui-support-08:#d45d8c;--tui-support-09:#bc71c9;--tui-support-10:#a381ff;--tui-support-11:#8f75d1;--tui-support-12:#7caeff;--tui-support-13:#65a7e0;--tui-support-14:#4dc3f7;--tui-support-15:#4bd0e1;--tui-support-16:#4eb6c2;--tui-support-17:#4fbdb2;--tui-support-18:#4da197;--tui-support-19:#73b077;--tui-support-20:#81c785;--tui-support-21:#aed57f;--tui-chart-0:var(--tui-primary);--tui-chart-1:var(--tui-support-13);--tui-chart-2:var(--tui-support-21);--tui-chart-3:var(--tui-support-11);--tui-chart-4:var(--tui-base-05);--tui-shadow:0 .25rem 1.5rem rgba(0, 0, 0, .12);--tui-shadow-hover:0 .75rem 2.25rem rgba(0, 0, 0, .2);--tui-shadow-dropdown:0 1.5rem 1rem rgba(0, 0, 0, .03),0 .75rem .75rem rgba(0, 0, 0, .04),0 .25rem .375rem rgba(0, 0, 0, .05);--tui-shadow-modal:0 1.125rem 1.875rem rgba(0, 0, 0, .48);--tui-shadow-sidebar:.25rem 0 1.5rem rgba(0, 0, 0, .12);--tui-shadow-navigation:0 .125rem 1rem rgba(0, 0, 0, .08);--tui-shadow-sheet:0 -1rem 1.75rem rgba(0, 0, 0, .24);--swiper-theme-color:#007aff}
                .tui-zero-scrollbar,[_nghost-ng-c3687942756]:not(._legacy){scrollbar-width:none;-ms-overflow-style:none}
                .tui-zero-scrollbar::-webkit-scrollbar,.tui-zero-scrollbar::-webkit-scrollbar-thumb,html::-webkit-scrollbar,html::-webkit-scrollbar-thumb{display:none}body[data-tui-theme]{font:var(--tui-font-text-s);color:var(--tui-text-01);background:var(--tui-base-01);margin:0}tui-root{position:relative;flex:1;-webkit-tap-highlight-color:transparent}tui-root>.t-root-scrollbar{position:fixed;top:0;left:0;bottom:0;right:0;display:none;margin:0}
                .t-root-content{height:100%;isolation:isolate;transform:translateY(var(--t-root-top))}
                .t-overscroll-none{overscroll-behavior:none}
                .bnpl-notification-container[_ngcontent-ng-c415270188],.dialog-content[_ngcontent-ng-c3031445874],.sme-devtools-host__container{display:flex;flex-direction:column}
                .sme-devtools-host__container button{border-radius:0}
                .sme-devtools-host__container button:not(:last-child){margin-bottom:-2px}
                .sme-devtools-host__container button:first-of-type{border-top-right-radius:var(--tui-radius-m)}
                .sme-devtools-host__container button:last-of-type{border-bottom-right-radius:var(--tui-radius-m)}[_nghost-ng-c2912582407]:before{content:"";display:block;overflow:hidden}
                .t-position-fixed-offset[_ngcontent-ng-c2912582407]{position:fixed;left:0;top:0;pointer-events:none;visibility:hidden;width:100%;height:100%}
                .t-dialog[_ngcontent-ng-c869960046],.t-overlay[_ngcontent-ng-c869960046]{position:fixed;top:0;left:0;right:0;bottom:0;display:flex;align-items:flex-start;outline:0;overflow:auto;scrollbar-width:none;-ms-overflow-style:none}
                .t-dialog.ng-animating[_ngcontent-ng-c869960046],.t-overlay.ng-animating[_ngcontent-ng-c869960046]{overflow:clip}
                .t-dialog[_ngcontent-ng-c869960046]::-webkit-scrollbar,.t-dialog[_ngcontent-ng-c869960046]::-webkit-scrollbar-thumb,.t-overlay[_ngcontent-ng-c869960046]::-webkit-scrollbar,.t-overlay[_ngcontent-ng-c869960046]::-webkit-scrollbar-thumb{display:none}
                .t-dialog[_ngcontent-ng-c869960046]{bottom:auto;height:100%}
                .t-overlay[_ngcontent-ng-c869960046]{height:100%;pointer-events:none;touch-action:none;opacity:0;letter-spacing:normal;transition:opacity var(--tui-duration, .3s),letter-spacing .01s;background:rgba(0,0,0,.75);-webkit-backdrop-filter:var(--tui-backdrop,none);backdrop-filter:var(--tui-backdrop,none)}
                .t-overlay_visible[_ngcontent-ng-c869960046]{opacity:1;letter-spacing:1px}
                .t-dialog[_ngcontent-ng-c869960046]:last-of-type{z-index:1}
                .t-scrollbars[_ngcontent-ng-c869960046]{position:fixed;top:0;left:0;right:0;bottom:0;margin:0;color:#747474}tui-alert-host>.t-wrapper>*{pointer-events:auto}
                .t-bar[_ngcontent-ng-c2790313665]{position:absolute;right:0;bottom:0;pointer-events:auto;animation:tuiFadeIn var(--tui-duration,.3s) ease-in-out}
                .t-bar_vertical[_ngcontent-ng-c2790313665]{top:0;width:.875rem}
                .t-bar_horizontal[_ngcontent-ng-c2790313665]{left:0;height:.875rem}
                .t-bar_has-horizontal[_ngcontent-ng-c2790313665]{bottom:.5rem}
                .t-bar_has-vertical[_ngcontent-ng-c2790313665]{right:.5rem}
                .t-thumb[_ngcontent-ng-c2790313665]{position:absolute;border-radius:6.25 rem;border:.25rem solid transparent;cursor:pointer;pointer-events:auto;-webkit-user-select:none;-moz-user-select:none;user-select:none;background:padding-box content-box currentColor;box-sizing:border-box;transition:all var(--tui-duration, .3s) ease-in-out;transition-property:width,height,opacity;opacity:.2}
                .back-button[_ngcontent-ng-c3643179673],.block[_ngcontent-ng-c970684605],.item.item.item[_ngcontent-ng-c3410533622]:hover .icon[_ngcontent-ng-c3410533622],.item.item.item_active[_ngcontent-ng-c3410533622] .icon[_ngcontent-ng-c3410533622],.item[_ngcontent-ng-c3410533622],.profile-button[_ngcontent-ng-c3551443402],[_nghost-ng-c3813920883]:not(._loading .content-wrapper[_ngcontent-ng-c3813920883],._disabled)._selected[_nghost-ng-c3813920883] .content-wrapper[_ngcontent-ng-c3813920883],[_nghost-ng-c3813920883]:not(._loading .content-wrapper[_ngcontent-ng-c3813920883],._disabled)[_nghost-ng-c3813920883]:hover .content-wrapper[_ngcontent-ng-c3813920883],[_nghost-ng-c3813920883]:not(._loading .icon[_ngcontent-ng-c3813920883],._disabled)._selected[_nghost-ng-c3813920883] .icon[_ngcontent-ng-c3813920883],[_nghost-ng-c3813920883]:not(._loading .icon[_ngcontent-ng-c3813920883],._disabled)[_nghost-ng-c3813920883]:hover .icon[_ngcontent-ng-c3813920883]{background-color:var(--tui-base-01)}
                .t-thumb[_ngcontent-ng-c2790313665]:hover{opacity:.24}
                .t-thumb[_ngcontent-ng-c2790313665]:active{opacity:.48}
                .t-bar_vertical[_ngcontent-ng-c2790313665] .t-thumb[_ngcontent-ng-c2790313665]{right:0;width:.75rem;min-height:1.25 rem}
                .item[_ngcontent-ng-c3410533622]+.item[_ngcontent-ng-c3410533622]:before,[ui-interactive-block]+[ui-interactive-block]:not(._loading):before{left:76px;right:16px;transition-property:background-color;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;content:"";pointer-events:none}
                .t-bar_vertical[_ngcontent-ng-c2790313665] .t-thumb[_ngcontent-ng-c2790313665]:active,.t-bar_vertical[_ngcontent-ng-c2790313665]:hover .t-thumb[_ngcontent-ng-c2790313665]{width:.875rem}
                .t-bar_horizontal[_ngcontent-ng-c2790313665] .t-thumb[_ngcontent-ng-c2790313665]{bottom:0;height:.75rem;min-width:1.25 rem}
                .t-bar_horizontal[_ngcontent-ng-c2790313665] .t-thumb[_ngcontent-ng-c2790313665]:active,.t-bar_horizontal[_ngcontent-ng-c2790313665]:hover .t-thumb[_ngcontent-ng-c2790313665]{height:.875rem}@media screen and (max-width:47.9625em){:root{--tui-font-heading:-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;--tui-font-text:-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;--tui-font-heading-1:bold 1.5rem/1.75rem var(--tui-font-heading);--tui-font-heading-2:bold 1.5rem/1.75rem var(--tui-font-heading);--tui-font-heading-3:bold 1.5rem/1.75rem var(--tui-font-heading);--tui-font-heading-4:bold 1.25rem/1.5rem var(--tui-font-heading);--tui-font-heading-5:bold 1.0625rem/1.5rem var(--tui-font-heading);--tui-font-heading-6:bold 1.0625rem/1.5rem var(--tui-font-heading);--tui-font-text-xl:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-l:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-l-2:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-m:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-m-2:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-s:normal .8125rem/1.25rem var(--tui-font-text);--tui-font-text-s-2:normal .8125rem/1.25rem var(--tui-font-text);--tui-font-text-xs:normal .6875rem/1rem var(--tui-font-text)}[_nghost-ng-c2115795410]{--tui-font-heading-4:500 1.75 rem/2 rem var(--tui-font-heading);--tui-font-heading-5:500 1.5 rem/1.75 rem var(--tui-font-heading);--tui-font-heading:tuiHeading,-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;--tui-font-text-m:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text:tuiText,-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;padding-top:16px}
                    .navigation[_ngcontent-ng-c925702217]{margin-bottom:1 rem}}
                .container[_ngcontent-ng-c925702217],.layout[_ngcontent-ng-c2115795410]{flex-grow:1;min-height:0}
                .navigation[_ngcontent-ng-c925702217]{position:relative;display:flex;align-items:center;justify-content:space-between;padding:8px 0}
                .back[_ngcontent-ng-c925702217],.icon-wrapper[_ngcontent-ng-c3813920883]{flex-shrink:0}
                .logo_cart{display:flex;align-items:center;margin-right:.75rem;margin-left:.75rem}
                .user[_ngcontent-ng-c925702217]{flex-shrink:0;width:32px}
                .section[_ngcontent-ng-c925702217]:not(:empty)+.section[_ngcontent-ng-c925702217]{margin-top:.75rem}
                .aside[_ngcontent-ng-c925702217]{position:sticky;top:24px;bottom:24px;width:100%}
                .footer[_ngcontent-ng-c925702217]{display:flex;flex-direction:column;align-items:center;justify-content:center;padding:6px 0;box-sizing:border-box}@media screen and (max-width:47.9625em){.section[_ngcontent-ng-c925702217]{margin:0 -1 rem}
                    .footer[_ngcontent-ng-c925702217]{margin-top:.75rem}
                    .recipient-select[_ngcontent-ng-c3661152795] ui-dot-list[_ngcontent-ng-c3661152795] ui-dot-list-item[_ngcontent-ng-c3661152795]{display:block;overflow:hidden;white-space:nowrap;text-overflow:ellipsis}}
                .payment-panel-adaptive[_ngcontent-ng-c925702217]{box-shadow:var(--tui-shadow);position:sticky;bottom:0;z-index:1;flex-shrink:0;border-top-left-radius:var(--tui-radius-xl);border-top-right-radius:var(--tui-radius-xl);margin-top:.75rem;background-color:var(--tui-base-01)}
                .dropdown[_ngcontent-ng-c3551443402]{width:294px;padding:20px}
                .dropdown__title[_ngcontent-ng-c3551443402],.header-amount[_ngcontent-ng-c674970233]{font:var(--tui-font-heading-4)}
                .container[_ngcontent-ng-c3410533622],.dialog-list[_ngcontent-ng-c3031445874],.dropdown__list[_ngcontent-ng-c3551443402]{margin-right:-1 rem;margin-left:-1 rem}
                .bnpl-button[_ngcontent-ng-c3273487754],.bnpl-button[_ngcontent-ng-c3475083018],.dropdown__logout-button[_ngcontent-ng-c3551443402],.payment-button[_ngcontent-ng-c28093078]{width:100%}
                .checkout-notification[_ngcontent-ng-c669369259]{border-radius:var(--tui-radius-l)}
                .checkout-notification__title[_ngcontent-ng-c669369259]{font-weight:600;margin-bottom:4px}
                .checkout-notification__icon[_ngcontent-ng-c669369259]{width:20px;height:20px}
                .card-carousel[_ngcontent-ng-c3410533622]{margin-right:-.25rem;margin-left:-.25rem;margin-bottom:.5rem}
                .item[_ngcontent-ng-c3410533622]{transition-property:background-color;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;position:relative;display:flex;align-items:center;padding:12px 16px;box-sizing:border-box;border-radius:1 rem;cursor:pointer}
                .item[_ngcontent-ng-c3410533622]+.item[_ngcontent-ng-c3410533622]:before{position:absolute;top:0;height:1px;background-color:var(--tui-base-03)}
                .item.item.item[_ngcontent-ng-c3410533622]:hover:before,.item.item.item_active[_ngcontent-ng-c3410533622]:before,.item[_ngcontent-ng-c3410533622]:hover+.item[_ngcontent-ng-c3410533622]:before,.item_active[_ngcontent-ng-c3410533622]+.item[_ngcontent-ng-c3410533622]:before,[ui-interactive-block]+[ui-interactive-block]._selected:before,[ui-interactive-block]._selected+[ui-interactive-block]:before,[ui-interactive-block]:hover+[ui-interactive-block]:before{background-color:transparent}
                .item.item.item[_ngcontent-ng-c3410533622]:hover,.item.item.item_active[_ngcontent-ng-c3410533622]{background-color:var(--tui-base-02)}
                .icon-wrapper[_ngcontent-ng-c3410533622]{flex-shrink:0;margin-right:12px}
                .content-wrapper[_ngcontent-ng-c3813920883],.icon[_ngcontent-ng-c3410533622],.icon[_ngcontent-ng-c3813920883]{transition-property:background-color;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;border-radius:var(--tui-radius-l)}
                .text[_ngcontent-ng-c3410533622],.text[_ngcontent-ng-c3813920883]{display:flex;flex-direction:column;justify-content:center;flex-grow:1;min-width:0}
                .title[_ngcontent-ng-c3410533622]{font:var(--tui-font-text-m);font-weight:700}
                .description[_ngcontent-ng-c3410533622]{margin-top:4px;font:var(--tui-font-text-s);color:var(--tui-text-02)}
                .radio[_ngcontent-ng-c3410533622]{flex-shrink:0;margin-left:12px;margin-right:20px}
                .agreement-info-container[_ngcontent-ng-c3992331613],.error[_ngcontent-ng-c3188841248],.error[_ngcontent-ng-c3315253020],.error[_ngcontent-ng-c3661152795]{text-align:left}
                .recipient-select[_ngcontent-ng-c3661152795]{--interactive-block-background-color:var(--tui-base-02)}
                .recipient-select[_ngcontent-ng-c3661152795]:hover{--interactive-block-background-hover-color:var(--tui-base-03)}
                .delivery-address-icon[_ngcontent-ng-c3031445874],.delivery-address-icon[_ngcontent-ng-c433070423],.delivery-point-offer-icon[_ngcontent-ng-c3030627054],.header-brand-empty[_ngcontent-ng-c674970233],.recipient-select[_ngcontent-ng-c3661152795] tui-svg[_ngcontent-ng-c3661152795]{color:var(--tui-base-06)}
                .recipient-select[_ngcontent-ng-c3661152795] ui-dot-list[_ngcontent-ng-c3661152795]{text-overflow:ellipsis;white-space:nowrap;display:flex;flex-direction:column}
                ._loading[_ngcontent-ng-c3661152795]{height:72px;border-radius:1 rem}
                .link[_ngcontent-ng-c3992331613]{color:var(--tui-text-01);text-decoration:none}
                .link[_ngcontent-ng-c3992331613]:hover,.note[_ngcontent-ng-c3273487754],.note[_ngcontent-ng-c715471357],[data-mode=onLight][_nghost-ng-c2749805289]{color:var(--tui-text-02)}
                .icon[_ngcontent-ng-c1785451307]{width:105px;height:10px}
                .lock[_ngcontent-ng-c1193020237]{width:16px;height:16px;margin-right:8px;color:var(--tui-positive)}
                .date[_ngcontent-ng-c3240143128],.delivery-address-title[_ngcontent-ng-c3031445874],.delivery-address-title[_ngcontent-ng-c433070423],.delivery-point-offer-title[_ngcontent-ng-c3030627054],.header-discount[_ngcontent-ng-c674970233],.text[_ngcontent-ng-c1193020237]{font:var(--tui-font-text-s);color:var(--tui-text-02)}
                .t-src[_ngcontent-ng-c189367467]{display:flex;width:100%;height:100%;align-items:center;justify-content:center}
                .allow-overflow[_ngcontent-ng-c3188841248],.t-svg[_ngcontent-ng-c189367467]{overflow:visible}[data-shape=rounded][_nghost-ng-c3926154569]{border-radius:6.25rem}[data-size=xs][_nghost-ng-c3926154569]{height:var(--tui-height-xs);font-weight:400}[data-size=xs][data-shape=square][_nghost-ng-c3926154569],[data-size=xs][tuiIconButton][_nghost-ng-c3926154569]{width:var(--tui-height-xs)}[data-size=s][_nghost-ng-c3926154569]{height:var(--tui-height-s);font-weight:400}[data-size=s][data-shape=square][_nghost-ng-c3926154569],[data-size=s][tuiIconButton][_nghost-ng-c3926154569]{width:var(--tui-height-s)}[data-size=m][_nghost-ng-c3926154569]{height:var(--tui-height-m);font:var(--tui-font-text-m);font-weight:700}[data-size=m][data-shape=square][_nghost-ng-c3926154569],[data-size=m][tuiIconButton][_nghost-ng-c3926154569]{width:var(--tui-height-m)}[data-size=l][_nghost-ng-c3926154569]{height:var(--tui-height-l);font:var(--tui-font-text-m);font-weight:700}[data-size=l][data-shape=square][_nghost-ng-c3926154569],[data-size=l][tuiIconButton][_nghost-ng-c3926154569]{width:var(--tui-height-l)}[data-size=xl][_nghost-ng-c3926154569]{height:3.75rem;font:var(--tui-font-text-m);font-weight:700}[data-size=xl][data-shape=square][_nghost-ng-c3926154569],[data-size=xl][tuiIconButton][_nghost-ng-c3926154569]{width:3.75rem}[tuiIconButton][_nghost-ng-c3926154569]{font-size:0!important}[tuiIconButton][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569],[tuiIconButton][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569]{margin:0!important}
                .t-loader[_ngcontent-ng-c3926154569]{position:absolute;top:0;left:0;width:100%;height:100%;cursor:default}
                .t-left[_ngcontent-ng-c3926154569]{margin-right:.5rem}[data-size=s][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569]{margin-right:.375rem}
                .t-icon_left[_ngcontent-ng-c2749805289],[data-size=xs][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569]{margin-right:.25rem}
                .t-right[_ngcontent-ng-c3926154569]{margin:0 -.25rem 0 .25rem}[data-size=s][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569]{margin:0 -.25rem 0 .375rem}[data-size=xs][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569]{margin:0 -.125rem 0 .25rem}
                .t-icon[_ngcontent-ng-c3926154569]{display:flex;max-width:100%;max-height:100%;align-items:center;justify-content:center}
                .t-left[_ngcontent-ng-c3926154569],.t-right[_ngcontent-ng-c3926154569]{display:flex;align-items:center;justify-content:center;width:1.5rem;height:1.5rem}[data-size=s][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569],[data-size=s][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569],[data-size=xs][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569],[data-size=xs][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569]{width:1rem;height:1rem}[tuiIconButton][data-appearance=icon][data-size=s][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569],[tuiIconButton][data-appearance=icon][data-size=s][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569],[tuiIconButton][data-appearance=link][data-size=s][_nghost-ng-c3926154569] .t-left[_ngcontent-ng-c3926154569],[tuiIconButton][data-appearance=link][data-size=s][_nghost-ng-c3926154569] .t-right[_ngcontent-ng-c3926154569]{width:1.5rem;height:1.5rem}
                .t-wrapper[_ngcontent-ng-c3926154569]{box-sizing:border-box;cursor:pointer;isolation:isolate}[data-size=xs][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]{padding:0 var(--tui-padding,.375rem)}[data-size=xs][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]:after{border-width:1px}[data-size=s][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]{padding:0 var(--tui-padding,.75rem)}[data-size=m][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]{padding:0 var(--tui-padding,1.5rem)}[data-size=l][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]{padding:0 var(--tui-padding,2.25rem)}[data-size=xl][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]{padding:0 var(--tui-padding,2.5rem)}
                .swiper,[data-shape=square][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569],[tuiIconButton][_nghost-ng-c3926154569] .t-wrapper[_ngcontent-ng-c3926154569]{padding:0}
                .t-content[_ngcontent-ng-c3926154569]{display:flex;height:100%;align-items:center;justify-content:center;text-align:center}
                ._loading[_nghost-ng-c3926154569] .t-content[_ngcontent-ng-c3926154569]{opacity:0}
                .t-wrapper[_ngcontent-ng-c3846851089]{border-radius:inherit;height:inherit;flex:1 1 auto;width:100%}
                .t-content_delegated[_ngcontent-ng-c3687942756],.t-dropdown[_ngcontent-ng-c3846851089],[_nghost-ng-c1831095548]:not(._expandable)._label-outside .t-box[_ngcontent-ng-c1831095548]{height:100%}
                .t-primitive[_ngcontent-ng-c3846851089]{padding:1 rem}
                .block[_ngcontent-ng-c970684605]{padding:20px;box-sizing:border-box;border-radius:var(--tui-radius-xl);display:flex;flex-direction:column;min-height:0}
                .title[_ngcontent-ng-c970684605]{margin-bottom:1 rem;font:var(--tui-font-heading-4)}[ui-interactive-block]+[ui-interactive-block]:not(._loading):before{position:absolute;top:0;height:1px;background-color:var(--tui-base-03);z-index:1}[ui-interactive-block][ui-interactive-block]:has(>._selected):before{background-color:transparent}
                .delivery-address-field[_ngcontent-ng-c3031445874]{transition-property:background-color;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;display:flex;align-items:center;width:100%;padding:6px 12px;box-sizing:border-box;border-radius:var(--tui-radius-l);background-color:var(--tui-base-02);cursor:pointer}
                .delivery-address-field[_ngcontent-ng-c3031445874]:hover,.delivery-address-field[_ngcontent-ng-c433070423]:hover,.delivery-point-offer-field[_ngcontent-ng-c3030627054]:hover{background-color:var(--tui-base-03)}
                .delivery-address-context[_ngcontent-ng-c3031445874],.delivery-address-context[_ngcontent-ng-c433070423],.delivery-point-offer-context[_ngcontent-ng-c3030627054]{flex-grow:1;min-width:0;padding:0 4px}
                .delivery-address-description[_ngcontent-ng-c3031445874],.delivery-address-description[_ngcontent-ng-c433070423],.delivery-point-offer-description[_ngcontent-ng-c3030627054],.post-office-address__value[_ngcontent-ng-c3315253020]{font:var(--tui-font-text-m)}
                .delivery-load-error[_ngcontent-ng-c3031445874],.notification[_ngcontent-ng-c3031445874]{margin-top:20px}
                .bnpl-warning-notification-icon[_ngcontent-ng-c415270188],.offer-warning-notification[_ngcontent-ng-c3030627054],.offer-warning-notification[_ngcontent-ng-c3031445874]{height:20px;width:20px}
                .dialog-close[_ngcontent-ng-c3031445874]{position:absolute;top:8px;right:8px;z-index:1}
                .dialog-scroll[_ngcontent-ng-c3031445874]{margin-bottom:-24px;margin:-24px -1.5 rem}@media screen and (max-width:47.9625em){.recipient-select[_ngcontent-ng-c3661152795] ui-dot-list[_ngcontent-ng-c3661152795] ui-dot-list-item[_ngcontent-ng-c3661152795]:after{display:none}
                    .dialog-scroll[_ngcontent-ng-c3031445874]{max-height:100 vh}
                    .dialog[_ngcontent-ng-c3031445874]{--tui-font-heading-4:500 1.75 rem/2 rem var(--tui-font-heading);--tui-font-heading:tuiHeading,-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif;--tui-font-text-m:normal .9375rem/1.5rem var(--tui-font-text);--tui-font-text-s:normal .8125rem/1.25rem var(--tui-font-text);--tui-font-text:tuiText,-apple-system,"BlinkMacSystemFont",system-ui,"Roboto","Segoe UI","Helvetica Neue",sans-serif}}
                .dialog[_ngcontent-ng-c3031445874]{display:flex;flex-direction:column;padding:0 1.5 rem}@media screen and (min-width:48em){[_nghost-ng-c2115795410]{padding-top:40px;padding-bottom:40px}
                    .navigation[_ngcontent-ng-c925702217]{margin-bottom:2 rem}
                    .footer[_ngcontent-ng-c925702217]{margin-top:1.5 rem}
                    .recipient-select[_ngcontent-ng-c3661152795] ui-dot-list[_ngcontent-ng-c3661152795]{display:block}
                    .dialog-scroll[_ngcontent-ng-c3031445874]{max-height:calc(100vh - 96px)}
                    .dialog[_ngcontent-ng-c3031445874]{padding-top:20px}}
                .dialog-title[_ngcontent-ng-c3031445874]{flex-shrink:0;margin-bottom:20px;font:var(--tui-font-heading-4)}
                ._overflow[_nghost-ng-c188569483],.dialog-item[_ngcontent-ng-c3031445874]{overflow:hidden}
                .dialog-item._selected[_ngcontent-ng-c3031445874] .dialog-item-edit[_ngcontent-ng-c3031445874],.dialog-item[_ngcontent-ng-c3031445874]:hover .dialog-item-edit[_ngcontent-ng-c3031445874],.scroll-shadow_bottom-active[_ngcontent-ng-c854462051]:after,.scroll-shadow_top-active[_ngcontent-ng-c854462051]:before{opacity:1}
                .dialog-item._selected[_ngcontent-ng-c3031445874] .dialog-item-actions[_ngcontent-ng-c3031445874]{transform:translate(0)}
                .dialog-item._selected.dialog-item._selected[_ngcontent-ng-c3031445874] .dialog-item-toggle[_ngcontent-ng-c3031445874]{width:1.5 rem;opacity:1}
                .basket-dialog-item[_ngcontent-ng-c854462051]+.basket-dialog-item[_ngcontent-ng-c854462051],.bill-item[_ngcontent-ng-c1198523064]+.basket-dialog-item[_ngcontent-ng-c1198523064],.dialog-item-text-additional[_ngcontent-ng-c3031445874],.scroll-shadow-list-additional[_ngcontent-ng-c854462051]{margin-top:8px}
                .dialog-item-actions[_ngcontent-ng-c3031445874]{transition-property:transform;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;position:relative;display:flex;align-items:center;transform:translate(1.25rem)}
                .dialog-item-edit[_ngcontent-ng-c3031445874]{transition-property:opacity;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;opacity:0;--tui-text-01:var(--tui-base-06)}
                .dialog-item-toggle.dialog-item-toggle[_ngcontent-ng-c3031445874]{transition-property:all;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;width:0;opacity:0}
                .dialog-actions[_ngcontent-ng-c3031445874]{position:sticky;bottom:0;display:flex;gap:12px;padding-top:20px;padding-bottom:20px;background-color:var(--tui-base-01)}
                .dialog-button[_ngcontent-ng-c3031445874]{flex:1 1 0;border-radius:var(--tui-radius-l)}
                .add-delivery-address[_ngcontent-ng-c433070423]{display:flex;flex-direction:column;row-gap:8px}
                .add-delivery-address_only-adaptive[_ngcontent-ng-c433070423] .add-delivery-address-row_adaptive[_ngcontent-ng-c433070423],.swiper-vertical>.swiper-wrapper{flex-direction:column}
                .add-delivery-address-dropdown.add-delivery-address-dropdown[_ngcontent-ng-c433070423]{min-height:24px;height:24px;margin:10px;border-radius:var(--tui-radius-xl)}
                .add-delivery-address-row[_ngcontent-ng-c433070423]{display:flex;gap:8px}@media screen and (max-width:79.9625em){.add-delivery-address-row_adaptive[_ngcontent-ng-c433070423]{flex-direction:column}}
                .add-delivery-address-row-half[_ngcontent-ng-c433070423]{flex:1 1 0;min-width:0}
                .skeleton[_ngcontent-ng-c3030627054],.skeleton[_ngcontent-ng-c433070423]{max-height:56px}
                .block[_ngcontent-ng-c3497817990]{--top-offset:120px;--bottom-offset:20px;display:flex;flex-direction:column}@media screen and (max-height:640px){.block[_ngcontent-ng-c3497817990]{max-height:600px}}@media screen and (min-height:641px){.block[_ngcontent-ng-c3497817990]{max-height:calc(100vh - var(--top-offset) - var(--bottom-offset))}}
                .basket-products[_ngcontent-ng-c3497817990]{display:flex;flex-direction:column;min-height:0}
                .header[_ngcontent-ng-c674970233]{display:flex;height:52px;align-items:center;text-align:right}
                .header-brand[_ngcontent-ng-c674970233]{flex-shrink:0;margin-right:8px}
                .header-content[_ngcontent-ng-c674970233]{flex-grow:1;min-width:0}
                .header-amount.tui-skeleton[_ngcontent-ng-c674970233]{width:124px;height:24px;margin-top:4px;margin-left:auto;border-radius:var(--tui-radius-l)}
                .header-additional[_ngcontent-ng-c674970233]{display:flex;justify-content:flex-end}
                .header-additional.tui-skeleton[_ngcontent-ng-c674970233]{width:124px;height:12px;margin-top:8px;margin-left:auto;margin-bottom:4px;border-radius:var(--tui-radius-l)}
                .header-difference[_ngcontent-ng-c674970233]{margin-left:8px;font:var(--tui-font-text-s);color:var(--tui-positive)}
                .t-icon[_ngcontent-ng-c3938566849],.t-text[_ngcontent-ng-c3938566849]{color:var(--tui-avatar-color,var(--tui-text-01))}
                .scroll-shadow[_ngcontent-ng-c854462051]{position:relative;display:flex;flex-direction:column;min-height:0}
                .scroll-shadow[_ngcontent-ng-c854462051]:after,.scroll-shadow[_ngcontent-ng-c854462051]:before{transition-property:opacity;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;content:"";position:absolute;left:0;right:0;z-index:1;height:48px;opacity:0;pointer-events:none}
                .scroll-shadow[_ngcontent-ng-c854462051]:before{top:0;background:linear-gradient(180deg,var(--tui-base-01) 0,rgba(255,255,255,0) 100%)}
                .scroll-shadow[_ngcontent-ng-c854462051]:after{bottom:0;background:linear-gradient(180deg,rgba(255,255,255,0) 0,var(--tui-base-01) 100%)}
                .scroll-shadow-list[_ngcontent-ng-c854462051]{margin-right:-16px}
                .scroll-shadow-expand[_ngcontent-ng-c854462051]{width:100%;margin-top:12px}
                .logo[_ngcontent-ng-c3031497316]{background-image:linear-gradient(45deg,var(--tui-base-02) 0,var(--tui-base-02) 100%);border:1px solid rgba(0,16,36,.12);flex-shrink:0;--tui-avatar-color:var(--tui-base-06)}
                .logo.fallback[_ngcontent-ng-c3031497316]{background-image:none;border:none}[data-size=xs][_nghost-ng-c3938566849]{font:var(--tui-font-text-s);width:1.5 rem;height:1.5 rem}[data-size=s][_nghost-ng-c3938566849]{font:var(--tui-font-text-m);width:2 rem;height:2 rem}[data-size=m][_nghost-ng-c3938566849]{font:var(--tui-font-text-l);width:3 rem;height:3 rem}[data-size=l][_nghost-ng-c3938566849]{font:var(--tui-font-heading-5);width:4 rem;height:4 rem;border-radius:var(--tui-radius-xl)}[data-size=xl][_nghost-ng-c3938566849]{font:var(--tui-font-heading-3);width:6 rem;height:6 rem;border-radius:var(--tui-radius-xl)}[data-size=xxl][_nghost-ng-c3938566849]{font:var(--tui-font-heading-1);width:9 rem;height:9 rem;border-radius:var(--tui-radius-l)}[new][data-size=xxs][_nghost-ng-c3938566849]{width:1.5 rem;height:1.5 rem;border-radius:var(--tui-radius-s)}[new][data-size=xxs][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=xxs][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(.58)}[new][data-size=xs][_nghost-ng-c3938566849]{width:2 rem;height:2 rem;border-radius:var(--tui-radius-s)}[new][data-size=xs][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=xs][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(.83)}[new][data-size=s][_nghost-ng-c3938566849]{width:2.5 rem;height:2.5 rem;border-radius:calc(1.5 * var(--tui-radius-s))}
                .t-mark_visible[_ngcontent-ng-c2819176039],[data-size=s][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[data-size=xs][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=m][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=s][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=s][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(1)}[new][data-size=m][_nghost-ng-c3938566849]{width:3 rem;height:3 rem;border-radius:calc(2 * var(--tui-radius-s))}[new][data-size=m][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(1.17)}[new][data-size=l][_nghost-ng-c3938566849]{width:4 rem;height:4 rem;border-radius:calc(2 * var(--tui-radius-s))}[new][data-size=l][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(1.67)}[new][data-size=xl][_nghost-ng-c3938566849]{width:6 rem;height:6 rem;border-radius:calc(3 * var(--tui-radius-s))}[new][data-size=xl][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=xl][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(2.33)}[new][data-size=xxl][_nghost-ng-c3938566849]{width:8 rem;height:8 rem;border-radius:calc(4 * var(--tui-radius-s))}[new][data-size=xxl][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=xxl][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(3.33)}
                ._has-avatar[_nghost-ng-c3938566849],[_nghost-ng-c3813920883]:not(._loading:before,._disabled)._selected[_nghost-ng-c3813920883]:before,[_nghost-ng-c3813920883]:not(._loading:before,._disabled)[_nghost-ng-c3813920883]:hover:before{background-color:transparent}
                ._rounded[_nghost-ng-c3938566849]{border-radius:100%!important}
                .tui-avatar-stack{display:flex;width:-webkit-min-content;width:min-content}
                .tui-avatar-stack [data-size=xs][_nghost-ng-c3938566849],.tui-avatar-stack[data-size=xs][_nghost-ng-c3938566849]{margin-right:-.625rem;box-shadow:0 0 0 1px var(--tui-avatar-border,var(--tui-base-01))}
                .tui-avatar-stack [data-size=s][_nghost-ng-c3938566849],.tui-avatar-stack[data-size=s][_nghost-ng-c3938566849]{margin-right:-.875rem;box-shadow:0 0 0 1px var(--tui-avatar-border,var(--tui-base-01))}
                .tui-avatar-stack [data-size=m][_nghost-ng-c3938566849],.tui-avatar-stack[data-size=m][_nghost-ng-c3938566849]{margin-right:-1.25 rem;box-shadow:0 0 0 2px var(--tui-avatar-border,var(--tui-base-01))}
                .tui-avatar-stack [data-size=l][_nghost-ng-c3938566849],.tui-avatar-stack[data-size=l][_nghost-ng-c3938566849]{margin-right:-1.625 rem;box-shadow:0 0 0 2px var(--tui-avatar-border,var(--tui-base-01))}
                .tui-avatar-stack [data-size=xl][_nghost-ng-c3938566849],.tui-avatar-stack[data-size=xl][_nghost-ng-c3938566849]{margin-right:-2.25 rem;box-shadow:0 0 0 3px var(--tui-avatar-border,var(--tui-base-01))}
                .tui-avatar-stack [data-size=xxl][_nghost-ng-c3938566849],.tui-avatar-stack[data-size=xxl][_nghost-ng-c3938566849]{margin-right:-3.375 rem;box-shadow:0 0 0 3px var(--tui-avatar-border,var(--tui-base-01))}
                .t-image[_ngcontent-ng-c3938566849]{width:100%;height:100%;object-fit:cover}
                .t-icon[_ngcontent-ng-c3938566849]{position:absolute;top:0;left:0;width:100%;height:100%}[data-size=xs][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(.5)}[data-size=m][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(1.6)}[data-size=l][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[data-size=l][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(2)}[data-size=xl][_nghost-ng-c3938566849] .t-icon[_ngcontent-ng-c3938566849]{transform:scale(3.2)}[_nghost-ng-c3687942756]:not(._legacy)::-webkit-scrollbar,[_nghost-ng-c3687942756]:not(._legacy)::-webkit-scrollbar-thumb{background:0 0;width:0;height:0}
                ._legacy[_nghost-ng-c3687942756]{overflow:overlay}@media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution:.001dpcm){._legacy[_nghost-ng-c3687942756]::-webkit-scrollbar,._legacy[_nghost-ng-c3687942756]::-webkit-scrollbar-thumb{width:1rem;height:1rem;border-radius:6.25rem;background-clip:padding-box;border:.375rem solid transparent}
                    ._legacy[_nghost-ng-c3687942756]::-webkit-scrollbar{background-color:transparent}
                    ._legacy[_nghost-ng-c3687942756]::-webkit-scrollbar-thumb{background-color:var(--tui-clear-hover)}
                    ._legacy[_nghost-ng-c3687942756]::-webkit-scrollbar-thumb:hover{background-color:var(--tui-clear-active)}
                    ._legacy[_nghost-ng-c3687942756]::-webkit-scrollbar-thumb:active{background-color:var(--tui-text-03)}}
                .t-content[_ngcontent-ng-c3687942756]{isolation:isolate;flex:1;flex-basis:auto;width:100%;height:-webkit-max-content;height:max-content}
                .t-bars[_ngcontent-ng-c3687942756],[data-mode=onLight]._active[_nghost-ng-c2749805289],[data-mode=onLight]._pseudo[_nghost-ng-c2749805289],[data-mode=onLight][_nghost-ng-c2749805289]:hover,[data-size=l]._focused[_nghost-ng-c1831095548]:not(._label-outside) .t-placeholder[_ngcontent-ng-c1831095548],[data-size=l]._focused[_nghost-ng-c2584186082]:not(._label-outside) .t-placeholder[_ngcontent-ng-c2584186082],[data-size=m]._focused[_nghost-ng-c1831095548]:not(._label-outside) .t-placeholder[_ngcontent-ng-c1831095548],[data-size=m]._focused[_nghost-ng-c2584186082]:not(._label-outside) .t-placeholder[_ngcontent-ng-c2584186082]{color:var(--tui-text-01)}
                ._expanded[_nghost-ng-c188569483]{opacity:1;transform:translate(0)}
                ._loading[_nghost-ng-c188569483]{opacity:.99}
                .t-wrapper[_ngcontent-ng-c188569483]:after,.t-wrapper[_ngcontent-ng-c188569483]:before{content:"";display:table}[_nghost-ng-c3813920883]:not(._loading,._disabled)._selected[_nghost-ng-c3813920883],[_nghost-ng-c3813920883]:not(._loading,._disabled)[_nghost-ng-c3813920883]:hover{background-color:var(--interactive-block-background-hover-color)}
                ._disabled[_nghost-ng-c3813920883] .content-wrapper[_ngcontent-ng-c3813920883],._disabled[_nghost-ng-c3813920883] .icon[_ngcontent-ng-c3813920883]{background-color:var(--tui-base-02)!important}[_nghost-ng-c3813920883]:not(._loading)._selected .additional[_ngcontent-ng-c3813920883]{margin-top:1.25 rem}
                ._disabled[_nghost-ng-c1831095548] .t-cleaner[_ngcontent-ng-c1831095548],._disabled[_nghost-ng-c2361927615],._disabled[_nghost-ng-c2584186082] .t-cleaner[_ngcontent-ng-c2584186082],._disabled[_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082],._disabled[_nghost-ng-c3600615812] -shadowcsshost,._loading[_nghost-ng-c3813920883],._readonly[_nghost-ng-c1831095548] .t-cleaner[_ngcontent-ng-c1831095548],._readonly[_nghost-ng-c2584186082] .t-cleaner[_ngcontent-ng-c2584186082],._readonly[_nghost-ng-c2819176039],.t-input tui-primitive-textfield._disabled[_nghost-ng-c2584186082],.t-input tui-text-area._disabled[_nghost-ng-c2584186082],.t-input tui-textarea._disabled[_nghost-ng-c2584186082],[_nghost-ng-c3600615812] tui-primitive-textfield._disabled[_nghost-ng-c3600615812],[_nghost-ng-c3600615812] tui-text-area._disabled[_nghost-ng-c3600615812],[_nghost-ng-c3600615812] tui-textarea._disabled[_nghost-ng-c3600615812],tui-primitive-textfield._disabled [_nghost-ng-c2584186082],tui-primitive-textfield._disabled [_nghost-ng-c3600615812],tui-text-area._disabled [_nghost-ng-c2584186082],tui-text-area._disabled [_nghost-ng-c3600615812],tui-textarea._disabled [_nghost-ng-c2584186082],tui-textarea._disabled [_nghost-ng-c3600615812]{pointer-events:none}
                .title[_ngcontent-ng-c3813920883]{font:var(--tui-font-text-m);font-weight:700;display:flex;flex-direction:row}
                .title-info[_ngcontent-ng-c3813920883]{align-self:center;display:flex;margin-left:.5rem}
                .description[_ngcontent-ng-c3813920883]{font:var(--tui-font-text-s);color:var(--tui-text-02);overflow:hidden}
                .description[_ngcontent-ng-c3813920883]:not(:empty){margin-top:.25rem}
                .action[_ngcontent-ng-c3813920883]{flex-shrink:0}
                .container[_ngcontent-ng-c3813920883]{--tui-skeleton-radius:16px}
                .header[_ngcontent-ng-c3813920883],.t-icons[_ngcontent-ng-c2584186082]{display:flex;align-items:center}
                .additional[_ngcontent-ng-c3813920883]{transition-property:margin;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out}
                .dark-icon[_nghost-ng-c3813920883] .icon[_ngcontent-ng-c3813920883]{color:#0010248f}
                .content-wrapper[_ngcontent-ng-c3813920883]{background-color:var(--tui-base-02);width:3 rem;height:3 rem;display:flex;justify-content:center;align-items:center}[data-size=xs][_nghost-ng-c2379132606],[new][data-size=xs][_nghost-ng-c2379132606]{width:2 rem;height:2 rem}[data-size=s][_nghost-ng-c2379132606],[new][data-size=m][_nghost-ng-c2379132606]{width:3 rem;height:3 rem}[data-size=m][_nghost-ng-c2379132606],[new][data-size=l][_nghost-ng-c2379132606]{width:4 rem;height:4 rem}[data-size=l][_nghost-ng-c2379132606],[new][data-size=xl][_nghost-ng-c2379132606]{width:6 rem;height:6 rem}[data-size=xl][_nghost-ng-c2379132606],[new][data-size=xxl][_nghost-ng-c2379132606]{width:8 rem;height:8 rem}
                .t-icon[_ngcontent-ng-c2379132606],[data-size=l][_nghost-ng-c2819176039],[new][data-size=xxs][_nghost-ng-c2379132606]{width:1.5 rem;height:1.5 rem}[new][data-size=s][_nghost-ng-c2379132606]{width:2.5 rem;height:2.5 rem}[data-size=m][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606],[new][data-size=l][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606]{transform:scale(1.33)}[data-mode=onDark][_nghost-ng-c2379132606]:not([data-marker-mode]){color:var(--tui-base-01);background-color:var(--tui-clear-inverse)}[data-marker-mode=primary][_nghost-ng-c2379132606]{color:var(--tui-primary-text);background-color:var(--tui-primary)}[data-marker-mode=white][_nghost-ng-c2379132606]{color:var(--tui-text-03);background-color:var(--tui-base-01)}[data-marker-mode=warning][_nghost-ng-c2379132606]{color:var(--tui-warning-fill);background-color:var(--tui-warning-bg)}[data-marker-mode=secondary][_nghost-ng-c2379132606]{color:var(--tui-base-01);background-color:var(--tui-info-fill)}[data-marker-mode=error][_nghost-ng-c2379132606]{color:var(--tui-error-fill);background-color:var(--tui-error-bg)}[data-marker-mode=success][_nghost-ng-c2379132606]{color:var(--tui-success-fill);background-color:var(--tui-success-bg)}[data-marker-mode=link][_nghost-ng-c2379132606]{transition-property:color;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;color:var(--tui-link);background-color:var(--tui-secondary)}
                .swiper-slide,.swiper-wrapper{transition-property:transform}a[data-marker-mode=link][_nghost-ng-c2379132606],button[data-marker-mode=link][_nghost-ng-c2379132606]{cursor:pointer}a[data-marker-mode=link][_nghost-ng-c2379132606]:hover,button[data-marker-mode=link][_nghost-ng-c2379132606]:hover{color:var(--tui-link-hover);background-color:var(--tui-secondary-hover)}a[data-marker-mode=link][_nghost-ng-c2379132606]:active,button[data-marker-mode=link][_nghost-ng-c2379132606]:active{color:var(--tui-link-hover);background-color:var(--tui-secondary-active)}[data-size=xl][_nghost-ng-c2379132606] .t-icon[_ngcontent-ng-c2379132606]{transform:scale(2.67)}[_nghost-ng-c2749805289]:hover{color:var(--tui-link-hover)}[_nghost-ng-c2749805289]:disabled{opacity:var(--tui-disabled-opacity);cursor:default}[data-mode=onLight]._pseudo[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{-webkit-text-decoration-color:rgba(0,0,0,.48);text-decoration-color:#0000007a}
                ._focused[_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],._focused[_nghost-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],[data-mode=onLight]._pseudo._active[_nghost-ng-c2749805289],[data-mode=onLight]._pseudo[_nghost-ng-c2749805289]:hover,[data-size=l]._focused._label-outside[_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=l]._focused._label-outside[_nghost-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],[data-size=m]._focused._label-outside[_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=m]._focused._label-outside[_nghost-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082]{color:var(--tui-text-03)}
                .t-message-text_light[_ngcontent-ng-c1243713230],[data-mode=onLight][data-host-mode=negative][_nghost-ng-c2749805289]{color:var(--tui-negative-night)}[data-mode=onLight][data-host-mode=negative]._active[_nghost-ng-c2749805289],[data-mode=onLight][data-host-mode=negative][_nghost-ng-c2749805289]:active,[data-mode=onLight][data-host-mode=negative][_nghost-ng-c2749805289]:hover{color:var(--tui-negative-night-hover)}[data-mode=onDark]._pseudo._active[_nghost-ng-c2749805289],[data-mode=onDark]._pseudo[_nghost-ng-c2749805289]:active,[data-mode=onDark]._pseudo[_nghost-ng-c2749805289]:hover,[data-mode=onDark][_nghost-ng-c2749805289]{color:var(--tui-text-03-night)}
                .courier-optimal-badge[_ngcontent-ng-c3741844988] .badge-icon[_ngcontent-ng-c3741844988],[data-mode=onDark]._active[_nghost-ng-c2749805289],[data-mode=onDark]._pseudo[_nghost-ng-c2749805289],[data-mode=onDark][_nghost-ng-c1831095548],[data-mode=onDark][_nghost-ng-c2749805289]:active,[data-mode=onDark][_nghost-ng-c2749805289]:hover,[data-size=l]._focused[_nghost-ng-c1831095548]:not(._label-outside) [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=l]._focused[_nghost-ng-c2584186082]:not(._label-outside) [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],[data-size=m]._focused[_nghost-ng-c1831095548]:not(._label-outside) [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=m]._focused[_nghost-ng-c2584186082]:not(._label-outside) [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],tui-primitive-textfield [tuiWrapper][data-mode=onDark] [_nghost-ng-c3283209209] .t-postfix[_ngcontent-ng-c3283209209],tui-primitive-textfield [tuiWrapper][data-mode=onDark] [_nghost-ng-c3283209209] .t-prefix[_ngcontent-ng-c3283209209],tui-primitive-textfield [tuiWrapper][data-mode=onDark][_nghost-ng-c3283209209] .t-postfix[_ngcontent-ng-c3283209209],tui-primitive-textfield [tuiWrapper][data-mode=onDark][_nghost-ng-c3283209209] .t-prefix[_ngcontent-ng-c3283209209]{color:var(--tui-text-01-night)}[data-mode=onDark]._pseudo[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{-webkit-text-decoration-color:rgba(255,255,255,.48);text-decoration-color:#ffffff7a}[data-mode=onDark][data-host-mode=positive][_nghost-ng-c2749805289]{color:var(--tui-positive-night)}[data-mode=onDark][data-host-mode=positive]._active[_nghost-ng-c2749805289],[data-mode=onDark][data-host-mode=positive][_nghost-ng-c2749805289]:active,[data-mode=onDark][data-host-mode=positive][_nghost-ng-c2749805289]:hover{color:var(--tui-positive-night-hover)}
                ._red[_nghost-ng-c888909534],[data-host-mode=negative][_nghost-ng-c2749805289]{color:var(--tui-negative)}[data-host-mode=negative][_nghost-ng-c2749805289]:hover{color:var(--tui-negative-hover)}[data-host-mode=negative]._pseudo[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{-webkit-text-decoration-color:rgba(222,76,30,.48);text-decoration-color:#de4c1e7a}
                ._green[_nghost-ng-c888909534],[data-host-mode=positive][_nghost-ng-c2749805289]{color:var(--tui-positive)}[data-host-mode=positive][_nghost-ng-c2749805289]:hover{color:var(--tui-positive-hover)}[data-host-mode=positive]._pseudo[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{-webkit-text-decoration-color:rgba(58,169,129,.48);text-decoration-color:#3aa9817a}
                ._focus-visible[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{background:var(--tui-selection)}[data-mode=onLight]._focus-visible[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{background:var(--tui-clear);color:var(--tui-text-01)}[data-mode=onDark]._focus-visible[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{background:var(--tui-clear-inverse);color:var(--tui-text-01-night)}[data-host-mode=positive]._focus-visible[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{background:var(--tui-success-bg)}[data-host-mode=negative]._focus-visible[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{background:var(--tui-error-bg)}
                ._pseudo[_nghost-ng-c2749805289] .t-content[_ngcontent-ng-c2749805289]{padding-bottom:.15em;-webkit-text-decoration:underline dashed rgba(51,111,238,.48);text-decoration:underline dashed rgba(51,111,238,.48);text-underline-offset:.2em;text-decoration-thickness:.7px}
                .t-icon[_ngcontent-ng-c2749805289]{transition-property:transform;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;width:var(--tui-link-icon-size,1.5rem);height:var(--tui-link-icon-size,1.5rem);margin-top:-.125rem}
                .payment-bar-skeleton[_ngcontent-ng-c3240143128]+.payment-bar-skeleton[_ngcontent-ng-c3240143128],.payment-container[_ngcontent-ng-c3240143128]+.payment-container[_ngcontent-ng-c3240143128],.t-icon_right[_ngcontent-ng-c2749805289]{margin-left:.25rem}
                ._icon-rotated[_nghost-ng-c2749805289] .t-icon[_ngcontent-ng-c2749805289]{transform:rotate(180deg)}
                .header[_ngcontent-ng-c3273487754]{display:flex;height:40px;align-items:center;text-align:left;justify-content:space-between;margin-bottom:.5rem}
                .icon[_ngcontent-ng-c3273487754]{background-color:var(--tui-text-01);color:var(--tui-base-01);max-width:40px;max-height:40px}
                .title[_ngcontent-ng-c3273487754]{border-radius:10px;font:var(--tui-font-heading-6)}
                .bnpl-button__label[_ngcontent-ng-c3475083018]{font-size:13px;font-weight:500;line-height:20px}
                .bnpl-button__icon[_ngcontent-ng-c3475083018]{width:101px;margin-left:8px}
                .container[_ngcontent-ng-c3030627054],.container[_ngcontent-ng-c3315253020]{margin-right:-1 rem;margin-left:-1 rem;margin-top:20px}
                .delivery-textarea.delivery-textarea[_ngcontent-ng-c3188841248],.delivery-textarea.delivery-textarea[_ngcontent-ng-c3315253020]{--tui-secondary:var(--tui-base-01);--tui-secondary-hover:var(--tui-base-01);--tui-textarea-height:0;min-height:56px;border-radius:16px}
                .post-office-address[_ngcontent-ng-c3315253020]{margin-bottom:.5rem;border:1px solid rgba(36,74,127,.08);padding:.5rem 1 rem;border-radius:1 rem}
                .post-office-address__label[_ngcontent-ng-c3315253020]{display:block;font:var(--tui-font-text-s);color:var(--tui-text-02)}
                .post-office-address__value._loading[_ngcontent-ng-c3315253020]{display:block;width:100%}
                .delivery-textarea[_ngcontent-ng-c3188841248]{margin-top:1 rem}
                .courier-offer-container[_ngcontent-ng-c3188841248]{margin-bottom:16px;padding:0 4px}
                .courier-button[_ngcontent-ng-c3188841248]{font:var(--tui-font-text-s-2);width:100%}
                .bill-item[_ngcontent-ng-c1198523064]{display:flex;column-gap:8px;margin-right:16px}
                .bill-title[_ngcontent-ng-c1198523064]{display:flex;flex-grow:1;margin-right:auto;min-width:0;color:var(--tui-text-02);font:var(--tui-font-text-s);pointer-events:none}
                .bill-title.tui-skeleton[_ngcontent-ng-c1198523064]{flex-grow:0;margin-right:auto}
                .bill-money.tui-skeleton[_ngcontent-ng-c1198523064],.bill-title.tui-skeleton[_ngcontent-ng-c1198523064]{width:124px;height:12px;border-radius:var(--tui-radius-l);margin-top:4px;margin-bottom:4px}
                .bill-money.tui-skeleton_text[_ngcontent-ng-c1198523064]:before,.bill-title.tui-skeleton_text[_ngcontent-ng-c1198523064]:before{max-height:12px;display:block;overflow:hidden}
                .bill-count[_ngcontent-ng-c1198523064]{flex-shrink:0;margin-left:4px;font:var(--tui-font-text-s)}
                .bill-money[_ngcontent-ng-c1198523064]{flex-shrink:0;font:var(--tui-font-text-s);text-align:right}
                .t-input[_ngcontent-ng-c2584186082],.t-textfield[_ngcontent-ng-c2361927615]{text-align:inherit;border-radius:inherit}:host{position:relative;margin-left:auto;margin-right:auto;z-index:1}
                .swiper{margin-left:auto;margin-right:auto;position:relative;overflow:hidden;overflow:clip;list-style:none;z-index:1;display:block}
                .swiper-wrapper{position:relative;width:100%;height:100%;z-index:1;display:flex;transition-timing-function:var(--swiper-wrapper-transition-timing-function,initial);box-sizing:content-box}
                .swiper-android .swiper-slide,.swiper-ios .swiper-slide,.swiper-wrapper{transform:translateZ(0)}
                .swiper-horizontal{touch-action:pan-y}
                .swiper-vertical{touch-action:pan-x}
                .swiper-slide{flex-shrink:0;width:100%;height:100%;position:relative;display:block}
                ._autofilled._label-outside[_nghost-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],._autofilled[_nghost-ng-c2584186082] .t-value-decoration[_ngcontent-ng-c2584186082]:not(.t-has-value),._autofilled[data-size=s][_nghost-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],.swiper-slide-invisible-blank{visibility:hidden}
                .swiper-autoheight,.swiper-autoheight .swiper-slide{height:auto}
                .swiper-autoheight .swiper-wrapper{align-items:flex-start;transition-property:transform,height}
                .swiper-backface-hidden .swiper-slide{transform:translateZ(0);backface-visibility:hidden}
                .swiper-3d,.swiper-3d.swiper-css-mode .swiper-wrapper{perspective:1200px}
                .swiper-3d .swiper-cube-shadow,.swiper-3d .swiper-slide,.swiper-3d .swiper-wrapper{transform-style:preserve-3d}
                .swiper-css-mode>.swiper-wrapper{overflow:auto;scrollbar-width:none;-ms-overflow-style:none}
                .swiper-css-mode>.swiper-wrapper::-webkit-scrollbar{display:none}
                .swiper-css-mode>.swiper-wrapper>.swiper-slide{scroll-snap-align:start start}
                .swiper-css-mode.swiper-horizontal>.swiper-wrapper{scroll-snap-type:x mandatory}
                .swiper-css-mode.swiper-vertical>.swiper-wrapper{scroll-snap-type:y mandatory}
                .swiper-css-mode.swiper-free-mode>.swiper-wrapper{scroll-snap-type:none}
                .swiper-css-mode.swiper-free-mode>.swiper-wrapper>.swiper-slide{scroll-snap-align:none}
                .swiper-css-mode.swiper-centered>.swiper-wrapper:before{content:"";flex-shrink:0;order:9999}
                .swiper-css-mode.swiper-centered>.swiper-wrapper>.swiper-slide{scroll-snap-align:center center;scroll-snap-stop:always}
                .swiper-css-mode.swiper-centered.swiper-horizontal>.swiper-wrapper>.swiper-slide:first-child{margin-inline-start:var(--swiper-centered-offset-before)}
                .swiper-css-mode.swiper-centered.swiper-horizontal>.swiper-wrapper:before{height:100%;min-height:1px;width:var(--swiper-centered-offset-after)}
                .swiper-css-mode.swiper-centered.swiper-vertical>.swiper-wrapper>.swiper-slide:first-child{margin-block-start:var(--swiper-centered-offset-before)}
                .swiper-css-mode.swiper-centered.swiper-vertical>.swiper-wrapper:before{width:100%;min-width:1px;height:var(--swiper-centered-offset-after)}
                .swiper-3d .swiper-slide-shadow,.swiper-3d .swiper-slide-shadow-bottom,.swiper-3d .swiper-slide-shadow-left,.swiper-3d .swiper-slide-shadow-right,.swiper-3d .swiper-slide-shadow-top{position:absolute;left:0;top:0;width:100%;height:100%;pointer-events:none;z-index:10}
                .swiper-3d .swiper-slide-shadow{background:#00000026}
                .swiper-3d .swiper-slide-shadow-left{background-image:linear-gradient(to left,#00000080,#0000)}
                .swiper-3d .swiper-slide-shadow-right{background-image:linear-gradient(to right,#00000080,#0000)}
                .swiper-3d .swiper-slide-shadow-top{background-image:linear-gradient(to top,#00000080,#0000)}
                .swiper-3d .swiper-slide-shadow-bottom{background-image:linear-gradient(to bottom,#00000080,#0000)}
                .swiper-lazy-preloader{width:42px;height:42px;position:absolute;left:50%;top:50%;margin-left:-21px;margin-top:-21px;z-index:10;transform-origin:50%;box-sizing:border-box;border:4px solid var(--swiper-preloader-color,var(--swiper-theme-color));border-radius:50%;border-top-color:transparent}
                .swiper-watch-progress .swiper-slide-visible .swiper-lazy-preloader,.swiper:not(.swiper-watch-progress) .swiper-lazy-preloader{animation:1s linear infinite swiper-preloader-spin}
                .swiper-lazy-preloader-white{--swiper-preloader-color:#fff}
                .swiper-lazy-preloader-black{--swiper-preloader-color:#000}@keyframes swiper-preloader-spin{0%{transform:rotate(0)}to{transform:rotate(360deg)}}:host{display:block;padding:8px 16px;width:100%;height:72px}
                .cards-carousel .card{transition-property:opacity;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;color:var(--tui-base-01);background-color:var(--tui-base-07);transform:scale(1.75);cursor:pointer!important;-webkit-user-select:none;user-select:none;will-change:opacity}
                .cards-carousel .swiper-slide{display:flex;align-items:center;justify-content:center}
                .cards-carousel .card-inner{display:flex;align-items:center;justify-content:center;height:100%;width:100%}
                .cards-carousel .card-wrapper{position:relative;flex-shrink:0;width:84px;height:56px;padding:5px;border:3px solid transparent;border-radius:var(--tui-radius-l)}
                .cards-carousel .card-wrapper_active{border-color:var(--tui-info-fill);pointer-events:none;cursor:default}
                .cards-carousel .card-add,.delivery-point-offer-field[_ngcontent-ng-c3030627054]{transition-property:background-color;cursor:pointer;display:flex;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out}
                .cards-carousel .card-add{align-items:center;justify-content:center;height:100%;width:100%;border-radius:var(--tui-radius-l);color:var(--tui-neutral-fill);background-color:#24427f0f;will-change:background-color}@media screen and (min-width:64em){.cards-carousel .card-wrapper:hover .card{opacity:.7}
                    .cards-carousel .card-add:hover{background-color:#24427f1f}}[data-size=s][_nghost-ng-c2097418220]{width:2 rem;height:1.5 rem}[data-size=m][_nghost-ng-c2097418220]{width:3 rem;height:2 rem}[_nghost-ng-c2097418220]:before{position:absolute;top:0;left:0;width:100%;height:100%;content:"";box-shadow:inset 0 0 0 1px;border-radius:inherit;color:var(--tui-clear)}
                ._active[_nghost-ng-c2097418220]{box-shadow:0 0 0 1px var(--tui-base-01)}
                .t-front[_ngcontent-ng-c2097418220]{position:absolute;top:0;left:0;width:100%;height:100%;-webkit-backface-visibility:hidden;backface-visibility:hidden}
                .t-brand-logo[_ngcontent-ng-c2097418220]{position:absolute;top:.1875rem;left:.125rem;height:.875rem;width:.875rem}
                .t-number[_ngcontent-ng-c2097418220]{position:absolute;right:.25rem;display:flex;justify-content:center;align-items:center}[data-size=s][_nghost-ng-c2097418220] .t-number[_ngcontent-ng-c2097418220]{top:.125rem;height:.625rem;width:1.1875 rem;font-size:.5rem}[data-size=m][_nghost-ng-c2097418220] .t-number[_ngcontent-ng-c2097418220]{top:.1875rem;height:.875rem;width:1.5 rem;font-size:.625rem}
                .t-payment-system-logo[_ngcontent-ng-c2097418220]{position:absolute;right:.25rem;bottom:-.5rem;width:2 rem;height:2 rem;transform:scale(.5);transform-origin:right}
                .t-back[_ngcontent-ng-c2097418220]{position:absolute;top:0;left:0;width:100%;height:100%;-webkit-backface-visibility:hidden;backface-visibility:hidden;transform:rotateY(180deg) translateZ(1px);background-color:var(--tui-base-05);border-radius:var(--tui-radius-xs)}
                .t-back[_ngcontent-ng-c2097418220]:after{content:"";position:absolute;top:20%;left:0;right:0;height:20%;background-color:var(--tui-base-06)}
                .delivery-point-offer-field[_ngcontent-ng-c3030627054]{align-items:center;width:100%;padding:6px 12px;box-sizing:border-box;border-radius:var(--tui-radius-l);background-color:var(--tui-base-01);margin-top:-.5rem}
                .delivery-point-description[_ngcontent-ng-c3030627054]{overflow:visible;white-space:normal;-webkit-line-clamp:2}
                .notification-container[_ngcontent-ng-c3030627054]{display:flex;gap:4px;flex-direction:column}tui-notification.notification[_ngcontent-ng-c3030627054]{background-color:var(--tui-warning-bg)}
                .delivery-point-button[_ngcontent-ng-c3030627054]{margin-top:-.5rem}
                .notification-error[_ngcontent-ng-c3030627054]{border-radius:16px}
                .notification-error[_ngcontent-ng-c3030627054]:before,.t-input[_ngcontent-ng-c1831095548]:not(:last-of-type),.t-input[_ngcontent-ng-c2584186082]:not(:first-child){display:none}
                .notification-error-container[_ngcontent-ng-c3030627054]{display:flex;gap:12px;flex-direction:column}
                .empty[_ngcontent-ng-c3030627054]{visibility:hidden;height:0}
                .t-hosted[_ngcontent-ng-c2361927615]{display:block;border-radius:inherit}[data-size=s][_nghost-ng-c2584186082]{--tui-height:var(--tui-height-s)}[data-size=m][_nghost-ng-c2584186082]{--tui-height:var(--tui-height-m)}[data-size=l][_nghost-ng-c2584186082]{--tui-height:var(--tui-height-l);font:var(--tui-font-text-m);line-height:1.25 rem}
                .t-input[_ngcontent-ng-c2584186082]{font:var(--tui-font-text-s);color:var(--tui-text-01);padding:0;margin:0;background:0 0;font-size:inherit;line-height:inherit;font-weight:inherit;color:inherit;caret-color:currentColor;outline:0;-webkit-appearance:none;-moz-appearance:none;appearance:none;word-break:keep-all;-webkit-text-fill-color:currentColor;position:absolute;top:0;left:0;width:100%;height:100%;border:0 solid transparent;border-inline-start-width:var(--border-start,0);border-inline-end-width:var(--border-end,0);text-indent:var(--text-indent);box-sizing:border-box;white-space:nowrap;overflow:hidden;text-transform:inherit;resize:none}
                .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill,.t-input[_ngcontent-ng-c2584186082]:-webkit-autofill:focus,.t-input[_ngcontent-ng-c2584186082]:-webkit-autofill:hover{caret-color:var(--tui-base-09);border-radius:inherit;color:inherit!important;background-color:transparent!important;-webkit-text-fill-color:var(--tui-text-01)!important;border-color:var(--tui-autofill);-webkit-box-shadow:0 0 0 100 rem var(--tui-autofill) inset!important}
                .t-input[inputMode=none][_ngcontent-ng-c2584186082],[inputMode=none][_nghost-ng-c3600615812]{caret-color:transparent}
                .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill,.t-input[_ngcontent-ng-c2584186082]:-webkit-autofill:first-line{font-size:inherit;line-height:inherit}
                .t-input[_ngcontent-ng-c2584186082]::-webkit-caps-lock-indicator,.t-input[_ngcontent-ng-c2584186082]::-webkit-contacts-auto-fill-button,.t-input[_ngcontent-ng-c2584186082]::-webkit-credentials-auto-fill-button,.t-input[_ngcontent-ng-c2584186082]::-webkit-credit-card-auto-fill-button,.t-input[_ngcontent-ng-c2584186082]::-webkit-strong-password-auto-fill-button{content:none!important;position:absolute;left:-62.4375 rem;top:-62.4375 rem;z-index:-999;display:none!important;background:0 0!important;pointer-events:none!important}
                .t-input[_ngcontent-ng-c2584186082]::placeholder{color:var(--tui-text-03);opacity:0}
                ._focused[_nghost-ng-c2584186082]:not(._readonly) .t-input[_ngcontent-ng-c2584186082]::placeholder,tui-primitive-textfield._focused:not(._readonly) [_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder,tui-primitive-textfield._focused:not(._readonly)[_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder,tui-text-area._focused:not(._readonly) [_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder,tui-text-area._focused:not(._readonly)[_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder,tui-textarea._focused:not(._readonly) [_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder,tui-textarea._focused:not(._readonly)[_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder{opacity:1}
                .t-input [tuiWrapper][data-mode=onDark][_nghost-ng-c2584186082]:-webkit-autofill,.t-input [tuiWrapper][data-mode=onDark][_nghost-ng-c2584186082]:-webkit-autofill:focus,.t-input [tuiWrapper][data-mode=onDark][_nghost-ng-c2584186082]:-webkit-autofill:hover,[tuiWrapper][data-mode=onDark] [_nghost-ng-c2584186082]:-webkit-autofill,[tuiWrapper][data-mode=onDark] [_nghost-ng-c2584186082]:-webkit-autofill:focus,[tuiWrapper][data-mode=onDark] [_nghost-ng-c2584186082]:-webkit-autofill:hover,[tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill,[tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill:focus,[tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill:hover{caret-color:var(--tui-base-09);border-radius:inherit;color:inherit!important;background-color:transparent!important;-webkit-text-fill-color:var(--tui-text-01-night)!important;border-color:var(--tui-autofill-night);-webkit-box-shadow:0 0 0 100 rem var(--tui-autofill-night) inset!important}
                .t-input [tuiWrapper][data-mode=onDark][_nghost-ng-c2584186082]::placeholder,[tuiWrapper][data-mode=onDark] [_nghost-ng-c2584186082]::placeholder,[tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082]::placeholder{color:var(--tui-text-03-night)}
                .t-input tui-primitive-textfield[data-size="s"][_nghost-ng-c2584186082]:not(tui-primitive-textfield),.t-input tui-text-area[data-size="s"][_nghost-ng-c2584186082]:not(tui-text-area),.t-input tui-textarea[data-size="s"][_nghost-ng-c2584186082]:not(tui-textarea),[_nghost-ng-c3600615812] tui-primitive-textfield[data-size="s"][_nghost-ng-c3600615812]:not(tui-primitive-textfield),[_nghost-ng-c3600615812] tui-text-area[data-size="s"][_nghost-ng-c3600615812]:not(tui-text-area),[_nghost-ng-c3600615812] tui-textarea[data-size="s"][_nghost-ng-c3600615812]:not(tui-textarea),[data-size=s][_nghost-ng-c2584186082] .t-content[_ngcontent-ng-c2584186082],[data-size=s][_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082],[data-size=s][_nghost-ng-c3600615812] -shadowcsshost,tui-primitive-textfield[data-size="s"] [_nghost-ng-c2584186082]:not(tui-primitive-textfield),tui-primitive-textfield[data-size="s"] [_nghost-ng-c3600615812]:not(tui-primitive-textfield),tui-text-area[data-size="s"] [_nghost-ng-c2584186082]:not(tui-text-area),tui-text-area[data-size="s"] [_nghost-ng-c3600615812]:not(tui-text-area),tui-textarea[data-size="s"] [_nghost-ng-c2584186082]:not(tui-textarea),tui-textarea[data-size="s"] [_nghost-ng-c3600615812]:not(tui-textarea){padding:0 var(--tui-padding-s)}
                .t-input tui-primitive-textfield[data-size="m"][_nghost-ng-c2584186082]:not(tui-primitive-textfield),.t-input tui-text-area[data-size="m"][_nghost-ng-c2584186082]:not(tui-text-area),.t-input tui-textarea[data-size="m"][_nghost-ng-c2584186082]:not(tui-textarea),[_nghost-ng-c3600615812] tui-primitive-textfield[data-size="m"][_nghost-ng-c3600615812]:not(tui-primitive-textfield),[_nghost-ng-c3600615812] tui-text-area[data-size="m"][_nghost-ng-c3600615812]:not(tui-text-area),[_nghost-ng-c3600615812] tui-textarea[data-size="m"][_nghost-ng-c3600615812]:not(tui-textarea),[data-size=m][_nghost-ng-c2584186082] .t-content[_ngcontent-ng-c2584186082],[data-size=m][_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082],[data-size=m][_nghost-ng-c3600615812] -shadowcsshost,tui-primitive-textfield[data-size="m"] [_nghost-ng-c2584186082]:not(tui-primitive-textfield),tui-primitive-textfield[data-size="m"] [_nghost-ng-c3600615812]:not(tui-primitive-textfield),tui-text-area[data-size="m"] [_nghost-ng-c2584186082]:not(tui-text-area),tui-text-area[data-size="m"] [_nghost-ng-c3600615812]:not(tui-text-area),tui-textarea[data-size="m"] [_nghost-ng-c2584186082]:not(tui-textarea),tui-textarea[data-size="m"] [_nghost-ng-c3600615812]:not(tui-textarea){padding:0 var(--tui-padding-m)}
                .t-input tui-primitive-textfield[data-size="l"][_nghost-ng-c2584186082]:not(tui-primitive-textfield),.t-input tui-text-area[data-size="l"][_nghost-ng-c2584186082]:not(tui-text-area),.t-input tui-textarea[data-size="l"][_nghost-ng-c2584186082]:not(tui-textarea),[_nghost-ng-c3600615812] tui-primitive-textfield[data-size="l"][_nghost-ng-c3600615812]:not(tui-primitive-textfield),[_nghost-ng-c3600615812] tui-text-area[data-size="l"][_nghost-ng-c3600615812]:not(tui-text-area),[_nghost-ng-c3600615812] tui-textarea[data-size="l"][_nghost-ng-c3600615812]:not(tui-textarea),[data-size=l][_nghost-ng-c2584186082] .t-content[_ngcontent-ng-c2584186082],[data-size=l][_nghost-ng-c2584186082] .t-input[_ngcontent-ng-c2584186082],[data-size=l][_nghost-ng-c3600615812] -shadowcsshost,tui-primitive-textfield[data-size="l"] [_nghost-ng-c2584186082]:not(tui-primitive-textfield),tui-primitive-textfield[data-size="l"] [_nghost-ng-c3600615812]:not(tui-primitive-textfield),tui-text-area[data-size="l"] [_nghost-ng-c2584186082]:not(tui-text-area),tui-text-area[data-size="l"] [_nghost-ng-c3600615812]:not(tui-text-area),tui-textarea[data-size="l"] [_nghost-ng-c2584186082]:not(tui-textarea),tui-textarea[data-size="l"] [_nghost-ng-c3600615812]:not(tui-textarea){padding:0 var(--tui-padding-l)}
                .t-input tui-primitive-textfield[data-size="l"]:not(._label-outside)[_nghost-ng-c2584186082]:not(tui-primitive-textfield),[_nghost-ng-c3600615812] tui-primitive-textfield[data-size="l"]:not(._label-outside)[_nghost-ng-c3600615812]:not(tui-primitive-textfield),[data-size=l][_nghost-ng-c2584186082]:not(._label-outside) .t-input[_ngcontent-ng-c2584186082],[data-size=l][_nghost-ng-c3600615812]:not(._label-outside) -shadowcsshost,tui-primitive-textfield[data-size="l"]:not(._label-outside) [_nghost-ng-c2584186082]:not(tui-primitive-textfield),tui-primitive-textfield[data-size="l"]:not(._label-outside) [_nghost-ng-c3600615812]:not(tui-primitive-textfield){padding-top:1.25 rem}
                .t-input tui-primitive-textfield[data-size="m"]:not(._label-outside)[_nghost-ng-c2584186082]:not(tui-primitive-textfield),[_nghost-ng-c3600615812] tui-primitive-textfield[data-size="m"]:not(._label-outside)[_nghost-ng-c3600615812]:not(tui-primitive-textfield),[data-size=m][_nghost-ng-c2584186082]:not(._label-outside) .t-input[_ngcontent-ng-c2584186082],[data-size=m][_nghost-ng-c3600615812]:not(._label-outside) -shadowcsshost,tui-primitive-textfield[data-size="m"]:not(._label-outside) [_nghost-ng-c2584186082]:not(tui-primitive-textfield),tui-primitive-textfield[data-size="m"]:not(._label-outside) [_nghost-ng-c3600615812]:not(tui-primitive-textfield){padding-top:1 rem}[data-size=l][_nghost-ng-c2584186082]:not(._label-outside) .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill+.t-content[_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082]{font-size:.8156rem;transform:translateY(-.625rem)}[data-size=m][_nghost-ng-c2584186082]:not(._label-outside) .t-input[_ngcontent-ng-c2584186082]:-webkit-autofill+.t-content[_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082]{font-size:.69rem;transform:translateY(-.5rem)}
                ._hidden[_nghost-ng-c2584186082] input.t-input[_ngcontent-ng-c2584186082],._hidden[_nghost-ng-c3600615812] input[_ngcontent-ng-c3600615812],.t-input tui-primitive-textfield._hidden[_nghost-ng-c2584186082],[_nghost-ng-c3600615812] tui-primitive-textfield._hidden[_nghost-ng-c3600615812],tui-primitive-textfield._hidden [_nghost-ng-c2584186082],tui-primitive-textfield._hidden [_nghost-ng-c3600615812]{opacity:0;text-indent:-10em;-webkit-user-select:none}
                .t-content[_ngcontent-ng-c2584186082]{display:flex;height:100%;width:100%;box-sizing:border-box;align-items:center;overflow:hidden}
                .t-wrapper[_ngcontent-ng-c2584186082]{flex:1;min-width:0;-webkit-padding-end:.25rem;padding-inline-end:.25rem}
                .t-placeholder[_ngcontent-ng-c2584186082]{transition-property:transform,font-size,color,letter-spacing;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:block;width:100%;-webkit-user-select:none;-moz-user-select:none;user-select:none;font:var(--tui-font-text-s);color:var(--tui-text-02);pointer-events:none;will-change:transform;transform:translateY(0)}
                .t-cleaner[_ngcontent-ng-c2584186082],.t-icon[_ngcontent-ng-c2584186082]{width:1.5 rem;height:1.5 rem;position:relative;cursor:pointer;display:flex;box-sizing:border-box}
                .t-placeholder_raised[_ngcontent-ng-c1831095548],.t-placeholder_raised[_ngcontent-ng-c2584186082]{transform:translateY(-.625rem)}[data-size=m][_nghost-ng-c2584186082] .t-placeholder_raised[_ngcontent-ng-c2584186082]{font:var(--tui-font-text-xs);line-height:1.25 rem;transform:translateY(-.5rem);letter-spacing:.025rem}
                ._invalid[_nghost-ng-c1831095548]:not(._focused) .t-placeholder_raised[_ngcontent-ng-c1831095548],._invalid[_nghost-ng-c1831095548]:not(._focused):hover .t-placeholder_raised[_ngcontent-ng-c1831095548],._invalid[_nghost-ng-c2584186082]:not(._focused) .t-placeholder_raised[_ngcontent-ng-c2584186082],._invalid[_nghost-ng-c2584186082]:not(._focused):hover .t-placeholder_raised[_ngcontent-ng-c2584186082]{color:var(--tui-error-fill)}
                ._invalid[_nghost-ng-c1831095548]:not(._focused) [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder_raised[_ngcontent-ng-c1831095548],._invalid[_nghost-ng-c1831095548]:not(._focused):hover [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder_raised[_ngcontent-ng-c1831095548],._invalid[_nghost-ng-c2584186082]:not(._focused) [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder_raised[_ngcontent-ng-c2584186082],._invalid[_nghost-ng-c2584186082]:not(._focused):hover [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder_raised[_ngcontent-ng-c2584186082]{color:var(--tui-error-fill-night)}[data-size=l][_nghost-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082]{font:var(--tui-font-text-m);line-height:1.25 rem}[data-size=l][_nghost-ng-c1831095548] .t-placeholder_raised[_ngcontent-ng-c1831095548],[data-size=l][_nghost-ng-c2584186082] .t-placeholder_raised[_ngcontent-ng-c2584186082]{font-size:.8156rem}
                ._focused[_nghost-ng-c1831095548] [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],._focused[_nghost-ng-c2584186082] [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],[data-size=l]._focused._label-outside[_nghost-ng-c1831095548] [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=l]._focused._label-outside[_nghost-ng-c2584186082] [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],[data-size=m]._focused._label-outside[_nghost-ng-c1831095548] [tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=m]._focused._label-outside[_nghost-ng-c2584186082] [tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082],[tuiWrapper][data-mode=onDark][_ngcontent-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[tuiWrapper][data-mode=onDark][_ngcontent-ng-c2584186082] .t-placeholder[_ngcontent-ng-c2584186082]{color:var(--tui-text-02-night)}
                .t-cleaner[_ngcontent-ng-c2584186082]{align-items:center;justify-content:center;pointer-events:none;pointer-events:auto}
                .t-icon[_ngcontent-ng-c2584186082]{align-items:center;justify-content:center;pointer-events:none}[data-size=s][_nghost-ng-c2584186082] .t-icon_left[_ngcontent-ng-c2584186082]{-webkit-margin-start:-.375rem;margin-inline-start:-.375rem}[data-size=m][_nghost-ng-c2584186082] .t-icon_left[_ngcontent-ng-c2584186082]{-webkit-margin-start:-.125rem;margin-inline-start:-.125rem;-webkit-margin-end:.375rem;margin-inline-end:.375rem}[data-size=l][_nghost-ng-c2584186082] .t-icon_left[_ngcontent-ng-c2584186082]{-webkit-margin-end:.75rem;margin-inline-end:.75rem}[data-size=m][_nghost-ng-c2584186082] .t-icons[_ngcontent-ng-c2584186082]{-webkit-margin-end:-.125rem;margin-inline-end:-.125rem}[data-size=s][_nghost-ng-c2584186082] .t-icons[_ngcontent-ng-c2584186082]{-webkit-margin-end:-.375rem;margin-inline-end:-.375rem}
                .t-icons[_ngcontent-ng-c1831095548]>[_ngcontent-ng-c1831095548]:not(:first-child),[_nghost-ng-c2584186082]:not([data-size="s"]) .t-icons[_ngcontent-ng-c2584186082]>[_ngcontent-ng-c2584186082]:not(:first-child){-webkit-margin-start:.25rem;margin-inline-start:.25rem}
                .t-custom-content[_ngcontent-ng-c2584186082]{position:relative;display:flex;align-items:center;justify-content:center;min-width:2 rem;height:2 rem;pointer-events:none}
                .t-custom-icon[_ngcontent-ng-c2584186082]{width:2 rem;height:100%}[data-size][_nghost-ng-c2584186082] .t-input_template[_ngcontent-ng-c2584186082]{display:flex;width:calc(100% - 1rem);max-width:calc(100% - 1rem);align-items:center;pointer-events:none;-webkit-padding-end:0;padding-inline-end:0}
                ._filler[_nghost-ng-c3283209209],.t-text-template[_ngcontent-ng-c2584186082]{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
                .t-wrapper-value-decoration[_ngcontent-ng-c2584186082]{position:relative;pointer-events:none}input.tui-autofill{transition:box-shadow .01s}
                ._table[_nghost-ng-c3283209209]{position:static;margin-top:0}tui-primitive-textfield [tuiWrapper][data-mode=onDark] [_nghost-ng-c3283209209]{color:var(--tui-text-03-night)}tui-primitive-textfield[data-size="m"]:not(._label-outside) [_nghost-ng-c3283209209]{line-height:calc(var(--tui-height) - .25rem)}
                .t-ghost[_ngcontent-ng-c3283209209]{visibility:hidden;white-space:pre;text-overflow:clip}
                .t-postfix[_ngcontent-ng-c3283209209],.t-prefix[_ngcontent-ng-c3283209209]{white-space:pre;color:var(--tui-text-01)}
                .t-filler[_ngcontent-ng-c3283209209]{max-width:100%;white-space:nowrap}[data-size=m][_nghost-ng-c2819176039]{width:1 rem;height:1 rem}
                .t-mark[_ngcontent-ng-c2819176039]{transition-property:transform;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;position:absolute;background-color:currentColor;border-radius:100%;transform:scale(0)}
                .t-input[_ngcontent-ng-c1831095548],.t-native[_ngcontent-ng-c2819176039]{border-radius:inherit;caret-color:currentColor;word-break:keep-all;-webkit-text-fill-color:currentColor;outline:0;left:0}[data-size=m][_nghost-ng-c2819176039] .t-mark[_ngcontent-ng-c2819176039]{margin:.25rem;width:.5rem;height:.5rem}[data-size=l][_nghost-ng-c2819176039] .t-mark[_ngcontent-ng-c2819176039]{margin:.4375rem;width:.625rem;height:.625rem}
                .t-native[_ngcontent-ng-c2819176039]{padding:0;margin:0;border-width:0;background:0 0;font-size:inherit;line-height:inherit;font-weight:inherit;color:inherit;-webkit-appearance:none;-moz-appearance:none;appearance:none;position:absolute;top:0;width:100%;height:100%;opacity:0;cursor:pointer}
                .t-native[_ngcontent-ng-c2819176039]:-webkit-autofill,.t-native[_ngcontent-ng-c2819176039]:-webkit-autofill:focus,.t-native[_ngcontent-ng-c2819176039]:-webkit-autofill:hover{caret-color:var(--tui-base-09);border-radius:inherit;color:inherit!important;background-color:transparent!important;-webkit-text-fill-color:var(--tui-text-01)!important;border-color:var(--tui-autofill);-webkit-box-shadow:0 0 0 100 rem var(--tui-autofill) inset!important}
                ._disabled[_nghost-ng-c2819176039] .t-native[_ngcontent-ng-c2819176039]{cursor:default}
                .courier-offer[_ngcontent-ng-c3741844988]{display:flex;flex-direction:column;justify-content:center;height:100%;position:relative;margin:0 -16px}
                .courier-checkmark[_ngcontent-ng-c3741844988]{color:var(--tui-text-02);margin-right:12px;width:32px;height:32px}
                .courier-checkmark__mobile[_ngcontent-ng-c3741844988]{margin-right:14px;width:24px;height:24px}
                .courier-cheapest-badge[_ngcontent-ng-c3741844988]{color:var(--tui-base-09);background-color:var(--tui-primary)}
                .courier-fastest-badge[_ngcontent-ng-c3741844988]{background-color:var(--tui-link-night)}
                .courier-optimal-badge[_ngcontent-ng-c3741844988]{background-color:#00ad2a}
                .badge-icon[_ngcontent-ng-c3741844988]{max-width:10px;max-height:10px;margin-right:2px;position:relative;top:1px}
                .icon[_ngcontent-ng-c3741844988]{border-radius:0;max-width:26px;max-height:26px;background:0 0;--tui-avatar-color:#0010248f}tui-badge[size=xs].courier-badge[_ngcontent-ng-c3741844988]{border-radius:100px;padding-bottom:2px}[data-size=s][_nghost-ng-c1831095548]{--tui-height:var(--tui-height-s);--tui-textarea-height:4.5625rem;font:var(--tui-font-text-s)}[data-size=m][_nghost-ng-c1831095548]{--tui-height:var(--tui-height-m);--tui-textarea-height:5.5rem;font:var(--tui-font-text-s)}[data-size=l][_nghost-ng-c1831095548]{--tui-height:var(--tui-height-l);--tui-textarea-height:6.75rem;font:var(--tui-font-text-m)}[data-size=m]._has-counter[_nghost-ng-c1831095548]{--tui-textarea-height:6.625rem}[data-size=l]._has-counter[_nghost-ng-c1831095548]{--tui-textarea-height:7.875rem}
                .t-outline[_ngcontent-ng-c1831095548]{min-height:inherit}
                .t-content[_ngcontent-ng-c1831095548]{display:block;margin-top:0;margin-bottom:0;min-height:inherit;box-sizing:border-box;overflow:hidden;cursor:text}
                ._disabled[_nghost-ng-c1831095548] .t-content[_ngcontent-ng-c1831095548]{cursor:auto;opacity:var(--tui-disabled-opacity)}[_nghost-ng-c1831095548]:not(._expandable) .t-content[_ngcontent-ng-c1831095548]{position:absolute;top:0;left:0;bottom:1px;right:0;min-height:auto}
                ._has-counter[_nghost-ng-c1831095548]:not(._expandable) .t-content[_ngcontent-ng-c1831095548]{bottom:1.6875rem}
                ._label-outside._has-counter[_nghost-ng-c1831095548]:not(._expandable) .t-content[_ngcontent-ng-c1831095548]{bottom:1rem}
                .t-wrapper[_ngcontent-ng-c1831095548]{position:relative;width:100%;height:100%;min-height:inherit;box-sizing:border-box;padding:calc((var(--tui-height) - 1.25rem)/ 2) 0}[data-size=l]._label-outside[_nghost-ng-c1831095548] .t-wrapper[_ngcontent-ng-c1831095548]{padding:calc((var(--tui-height) - 1.5rem)/ 2) 0}[data-size=m][_nghost-ng-c1831095548]:not(._label-outside) .t-wrapper[_ngcontent-ng-c1831095548]{padding:calc((var(--tui-height) - 2.25rem)/ 2) 0}[data-size=l][_nghost-ng-c1831095548]:not(._label-outside) .t-wrapper[_ngcontent-ng-c1831095548]{padding:calc((var(--tui-height) - 2.625rem)/ 2) 0}table [data-size=m]._label-outside[_nghost-ng-c1831095548] .t-wrapper[_ngcontent-ng-c1831095548],table[data-size=m]._label-outside[_nghost-ng-c1831095548] .t-wrapper[_ngcontent-ng-c1831095548]{padding-bottom:.75rem}table [data-size=l]._label-outside[_nghost-ng-c1831095548] .t-wrapper[_ngcontent-ng-c1831095548],table[data-size=l]._label-outside[_nghost-ng-c1831095548] .t-wrapper[_ngcontent-ng-c1831095548]{padding-bottom:1rem}
                .t-input-wrapper[_ngcontent-ng-c1831095548]{min-height:inherit;width:100%;flex:1}
                .t-relative[_ngcontent-ng-c1831095548]{position:relative;min-height:inherit}
                .t-box[_ngcontent-ng-c1831095548]{display:flex;min-height:calc(100% - 1rem);width:100%}[_nghost-ng-c1831095548]:not(._expandable) .t-box[_ngcontent-ng-c1831095548]{height:calc(100% - 1rem)}
                ._has-counter._expandable[_nghost-ng-c1831095548] .t-box[_ngcontent-ng-c1831095548]{margin-bottom:1.25rem}[data-size=m][_nghost-ng-c1831095548]:not(._label-outside) .t-box[_ngcontent-ng-c1831095548]{border-top:1rem solid transparent}[data-size=l][_nghost-ng-c1831095548]:not(._label-outside) .t-box[_ngcontent-ng-c1831095548]{border-top:1.25rem solid transparent}
                .t-pseudo-content[_ngcontent-ng-c1831095548]{white-space:pre-wrap;word-wrap:break-word;word-break:keep-all;pointer-events:none;color:transparent;overflow:hidden;border:0 solid transparent;border-inline-start-width:var(--border-start,0);border-inline-end-width:var(--border-end,0)}[data-size=m][_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548],[data-size=m][_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=m][_nghost-ng-c1831095548] .t-pseudo-content[_ngcontent-ng-c1831095548],[data-size=s][_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548],[data-size=s][_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=s][_nghost-ng-c1831095548] .t-pseudo-content[_ngcontent-ng-c1831095548]{padding:0 .75rem}[data-size=l][_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548],[data-size=l][_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548],[data-size=l][_nghost-ng-c1831095548] .t-pseudo-content[_ngcontent-ng-c1831095548]{padding:0 1rem}
                .t-pseudo-content__extra[_ngcontent-ng-c1831095548]{background-color:var(--tui-error-bg-night)}
                .t-input[_ngcontent-ng-c1831095548]{padding:0;margin:0;background:0 0;font-size:inherit;line-height:inherit;font-weight:inherit;color:inherit;-webkit-appearance:none;-moz-appearance:none;appearance:none;position:absolute;top:0;width:100%;height:100%;box-sizing:border-box;resize:none;overflow:hidden;border:0 solid transparent;border-inline-start-width:var(--border-start,0);border-inline-end-width:var(--border-end,0)}
                .t-input[_ngcontent-ng-c1831095548]:-webkit-autofill,.t-input[_ngcontent-ng-c1831095548]:-webkit-autofill:focus,.t-input[_ngcontent-ng-c1831095548]:-webkit-autofill:hover{caret-color:var(--tui-base-09);border-radius:inherit;color:inherit!important;background-color:transparent!important;-webkit-text-fill-color:var(--tui-text-01)!important;border-color:var(--tui-autofill);-webkit-box-shadow:0 0 0 100rem var(--tui-autofill) inset!important}
                .t-input[_ngcontent-ng-c1831095548]::placeholder{color:var(--tui-text-03);opacity:0}[data-mode=onDark][_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548]::placeholder{color:var(--tui-text-03-night)}
                ._focused[_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548]:not(:-moz-read-only)::placeholder{opacity:1}
                ._focused[_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548]:not(:read-only)::placeholder{opacity:1}[data-mode=onDark]._disabled[_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548],[data-mode=onDark][_nghost-ng-c1831095548] .t-counter[_ngcontent-ng-c1831095548]{color:var(--tui-text-03-night)}@supports (-webkit-marquee-repetition:infinite) and (object-fit:fill){._ios[_nghost-ng-c1831095548] .t-input[_ngcontent-ng-c1831095548]{padding-left:.8125rem}}
                .t-placeholder[_ngcontent-ng-c1831095548]{transition-property:transform,font-size,color,letter-spacing;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:block;width:100%;-webkit-user-select:none;-moz-user-select:none;user-select:none;font:var(--tui-font-text-s);color:var(--tui-text-02);pointer-events:none;will-change:transform;transform:translateY(0);position:absolute;top:calc(var(--tui-height)/ 2 - .625rem);left:0;max-width:100%;border:0 solid transparent;border-inline-start-width:var(--border-start,0);border-inline-end-width:var(--border-end,0);box-sizing:border-box}@supports (-webkit-hyphens:none){.t-placeholder[_ngcontent-ng-c1831095548],.t-placeholder[_ngcontent-ng-c2584186082]{will-change:unset;transition-property:transform,color,letter-spacing}}[data-size=m][_nghost-ng-c1831095548] .t-placeholder_raised[_ngcontent-ng-c1831095548]{font:var(--tui-font-text-xs);line-height:1.25rem;transform:translateY(-.5rem);letter-spacing:.025rem}[data-size=l][_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548]{font:var(--tui-font-text-m);line-height:1.25rem}
                ._label-outside[_nghost-ng-c1831095548] .t-placeholder[_ngcontent-ng-c1831095548]{overflow:initial;height:auto;white-space:initial}
                .t-icons[_ngcontent-ng-c1831095548]{position:absolute;top:0;left:0;bottom:0;right:0;display:flex;justify-content:flex-end;pointer-events:none;padding:calc((var(--tui-height) - 1.5rem)/ 2) 1rem}
                .t-cleaner[_ngcontent-ng-c1831095548],.t-icon[_ngcontent-ng-c1831095548]{position:relative;display:flex;width:1.5rem;height:1.5rem;box-sizing:border-box;cursor:pointer;pointer-events:none}[data-size=m][_nghost-ng-c1831095548] .t-icons[_ngcontent-ng-c1831095548]{padding:calc((var(--tui-height) - 1.5rem)/ 2) .625rem}
                .t-icon[_ngcontent-ng-c1831095548]{align-items:center;justify-content:center}
                .t-icon_left[_ngcontent-ng-c1831095548]{-webkit-margin-end:auto;margin-inline-end:auto}
                .t-cleaner[_ngcontent-ng-c1831095548]{align-items:center;justify-content:center;pointer-events:auto}
                .t-caret[_ngcontent-ng-c1831095548]{display:inline-block;height:1rem;width:0}
                .t-counter[_ngcontent-ng-c1831095548]{position:absolute;right:.75rem;bottom:.5rem;font:var(--tui-font-text-s);pointer-events:none;margin-top:auto;text-align:right;color:var(--tui-text-03)}[_nghost-ng-c3600615812]:-webkit-autofill,[_nghost-ng-c3600615812]:-webkit-autofill:focus,[_nghost-ng-c3600615812]:-webkit-autofill:hover{caret-color:var(--tui-base-09);border-radius:inherit;color:inherit!important;background-color:transparent!important;-webkit-text-fill-color:var(--tui-text-01)!important;border-color:var(--tui-autofill);-webkit-box-shadow:0 0 0 100 rem var(--tui-autofill) inset!important}@supports (-webkit-touch-callout:none){.t-input[_ngcontent-ng-c2584186082]:active,.t-native[_ngcontent-ng-c2819176039]:active,[_nghost-ng-c3600615812]:active{font-size:1 rem}
                    .t-input[_ngcontent-ng-c1831095548]:active{font-size:1rem}}[_nghost-ng-c3600615812]:-webkit-autofill,[_nghost-ng-c3600615812]:-webkit-autofill:first-line{font-size:inherit;line-height:inherit}[_nghost-ng-c3600615812]::-webkit-caps-lock-indicator,[_nghost-ng-c3600615812]::-webkit-contacts-auto-fill-button,[_nghost-ng-c3600615812]::-webkit-credentials-auto-fill-button,[_nghost-ng-c3600615812]::-webkit-credit-card-auto-fill-button,[_nghost-ng-c3600615812]::-webkit-strong-password-auto-fill-button{content:none!important;position:absolute;left:-62.4375 rem;top:-62.4375 rem;z-index:-999;display:none!important;background:0 0!important;pointer-events:none!important}[_nghost-ng-c3600615812]::placeholder{color:var(--tui-text-03);opacity:0}
                ._focused[_nghost-ng-c3600615812]:not(._readonly) [_ngcontent-ng-c3600615812]::placeholder,tui-primitive-textfield._focused:not(._readonly) [_nghost-ng-c3600615812]::placeholder,tui-text-area._focused:not(._readonly) [_nghost-ng-c3600615812]::placeholder,tui-textarea._focused:not(._readonly) [_nghost-ng-c3600615812]::placeholder{opacity:1}[_nghost-ng-c3600615812] [tuiWrapper][data-mode=onDark][_nghost-ng-c3600615812]:-webkit-autofill,[_nghost-ng-c3600615812] [tuiWrapper][data-mode=onDark][_nghost-ng-c3600615812]:-webkit-autofill:focus,[_nghost-ng-c3600615812] [tuiWrapper][data-mode=onDark][_nghost-ng-c3600615812]:-webkit-autofill:hover,[tuiWrapper][data-mode=onDark] [_nghost-ng-c3600615812]:-webkit-autofill,[tuiWrapper][data-mode=onDark] [_nghost-ng-c3600615812]:-webkit-autofill:focus,[tuiWrapper][data-mode=onDark] [_nghost-ng-c3600615812]:-webkit-autofill:hover{caret-color:var(--tui-base-09);border-radius:inherit;color:inherit!important;background-color:transparent!important;-webkit-text-fill-color:var(--tui-text-01-night)!important;border-color:var(--tui-autofill-night);-webkit-box-shadow:0 0 0 100 rem var(--tui-autofill-night) inset!important}[_nghost-ng-c3600615812] [tuiWrapper][data-mode=onDark][_nghost-ng-c3600615812]::placeholder,[tuiWrapper][data-mode=onDark] [_nghost-ng-c3600615812]::placeholder{color:var(--tui-text-03-night)}[data-size=l][_nghost-ng-c3600615812]:not(._label-outside) [_ngcontent-ng-c3600615812]:-webkit-autofill+.t-content[_ngcontent-ng-c3600615812] .t-placeholder[_ngcontent-ng-c3600615812]{font-size:.8156rem;transform:translateY(-.625rem)}[data-size=m][_nghost-ng-c3600615812]:not(._label-outside) [_ngcontent-ng-c3600615812]:-webkit-autofill+.t-content[_ngcontent-ng-c3600615812] .t-placeholder[_ngcontent-ng-c3600615812]{font-size:.69rem;transform:translateY(-.5rem)}textarea[_nghost-ng-c3600615812]{white-space:pre-wrap}textarea[_nghost-ng-c3600615812] tui-text-area._ios[_nghost-ng-c3600615812],textarea[_nghost-ng-c3600615812] tui-textarea._ios[_nghost-ng-c3600615812],tui-text-area._ios [_nghost-ng-c3600615812],tui-textarea._ios [_nghost-ng-c3600615812]{padding-left:.8125rem}
                .t-message-text[_ngcontent-ng-c1243713230]{margin-top:.25rem;white-space:pre-line}
                .container[_ngcontent-ng-c3240143128]{display:flex;flex-direction:row}
                .payment-container[_ngcontent-ng-c3240143128]{flex-grow:1}
                .payment-bar[_ngcontent-ng-c3240143128]{height:7px;border-radius:10px;background-color:#24427f0f;margin-top:.5rem}
                .payment-money[_ngcontent-ng-c3240143128]{--tui-font-text-s-bold:bold .8125rem/1.25rem var(--tui-font-text);font:var(--tui-font-text-s-bold);color:var(--tui-text-02)}
                .skeleton-container[_ngcontent-ng-c3240143128]{width:100%;display:flex;flex-direction:column;margin-top:.25rem}
                .payment-bar-skeleton-container[_ngcontent-ng-c3240143128]{display:flex;font-display:row;margin-top:.25rem}
                .payment-bar-skeleton[_ngcontent-ng-c3240143128]{flex-grow:1;height:7px;border-radius:10px}
                .small-skeleton[_ngcontent-ng-c3240143128]{width:100%;height:12px;border-radius:10px;margin-bottom:.5rem}
                .full-skeleton[_ngcontent-ng-c3240143128]{width:100%;height:40px;border-radius:8px;margin-bottom:.25rem}
                .payment-bar-blue[_ngcontent-ng-c3240143128]{background-color:var(--tui-info-fill)}
                .payment-bar-orange[_ngcontent-ng-c3240143128]{background-color:var(--tui-warning-fill-night)}[_nghost-ng-c888909534]:not(._inherit-color) .t-lighter[_ngcontent-ng-c888909534]{opacity:var(--tui-disabled-opacity)}
                .t-container_reverse[_ngcontent-ng-c888909534]{display:inline-flex;flex-direction:row-reverse}
                ._initialized[_nghost-ng-c40548602]{transition-property:max-height;transition-duration:var(--tui-duration, .3s);transition-timing-function:ease-in-out}
                .t-wrapper[_ngcontent-ng-c40548602]{display:-webkit-box;-webkit-box-orient:vertical;overflow:hidden;overflow-wrap:anywhere}
                .t-wrapper[_ngcontent-ng-c40548602]>*{white-space:initial}
                .bnpl-warning-notification[_ngcontent-ng-c415270188]{margin-top:1 rem;margin-bottom:-1 rem}@media screen and (max-width:47.9625em){.dialog-top-bar[_ngcontent-ng-c3031445874]{position:sticky;top:0;left:0;right:0;z-index:2;height:24px;border-top-left-radius:var(--tui-radius-xl);border-top-right-radius:var(--tui-radius-xl);margin:0 -1.5 rem}
                    .dialog-top-bar[_ngcontent-ng-c3031445874]:before{content:"";position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width:32px;height:4px;border-radius:var(--tui-radius-l);background-color:var(--tui-base-06)}
                    .header-amount[_ngcontent-ng-c674970233]{font:var(--tui-font-heading-1)}
                    .bnpl-notification.notification[_ngcontent-ng-c415270188],.bnpl-warning-notification[_ngcontent-ng-c415270188]{margin-top:0;margin-bottom:1 rem}}
                .bnpl-info-button[_ngcontent-ng-c415270188]{width:100%;margin-top:.75rem;max-width:140px}
                .bnpl-mobile-notification[_ngcontent-ng-c415270188]{margin-bottom:1 rem}
                .bnpl-info-button-mobile[_ngcontent-ng-c415270188]{width:100%;margin-top:.5rem}
                .notification-info-icon[_ngcontent-ng-c415270188]{max-width:20px;max-height:20px;margin-right:.5rem;color:var(--tui-link)}
                .bnpl-card-notification[_ngcontent-ng-c415270188]{margin-top:1.5 rem}

                ~~*
                /*.dropbtn {
                    background-color: #3498DB;
                    color: white;
                    padding: 16px;
                    font-size: 16px;
                    border: none;
                    cursor: pointer;
                }

                .dropbtn:hover, .dropbtn:focus {
                    background-color: #2980B9;
                }*/

                .dropdown {
                    position: relative;
                    display: inline-block;
                }

                .dropdown-content {
                    display: none;
                    position: absolute;
                    background-color: #f1f1f1;
                    min-width: 160px;
                    right: 0px;
                    overflow: auto;
                    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                    z-index: 99999;
                    border-radius: 24px;
                }

                .dropdown-content a {
                    color: black;
                    padding: 12px 16px;
                    text-decoration: none;
                    display: block;
                }

                .dropdown a:hover {background-color: #ddd;}


                .show {display: block;}
                .hide {display: none;}

                *~
            </style>


            ~~*
            <script>


                function myDropdown() {
                    $("#myDropdown").toggle("show");
                }


                window.onclick = function(event){
                        if (document.getElementsByClassName('dropdown-content')[0].contains(event.target)){
                            // inside
                        } else{
                            // outside
                            if (!document.getElementsByClassName('dropbtn')[0].contains(event.target)) {
                                console.log('outside');
                                $("#myDropdown").css({"display":"none"});
                            }
                        }

                };

            </script>
            *~



            <div class="u9d dv" style="background-color:#f2f3f5;padding-bottom:40px;" data-widget="wallpaper">
                <!---->
                <div data-replace-layout-path="[2][0]" class="dv">
                    <div data-replace-layout-path="[2][0][0][0]" class="container b6" data-widget="container">

                        ~~*
                        <div >
                            <tui-dropdown-host _nghost-ng-c2912582407="">
                                <div class="t-root-content">
                                    <router-outlet _ngcontent-ng-c2035956=""></router-outlet>
                                    <checkout-ui-order _nghost-ng-c2115795410="" class="ng-star-inserted">
                                        <ui-layout-base _ngcontent-ng-c2115795410="" class="layout ng-star-inserted" _nghost-ng-c925702217="">
                                            <div _ngcontent-ng-c925702217="" class="tui-container tui-container_adaptive container ng-star-inserted">
                                                <div _ngcontent-ng-c925702217="" class="header">
                                                    <div _ngcontent-ng-c925702217="" class="navigation">
                                                        <div _ngcontent-ng-c925702217="" class="back">

                                                        </div>
                                                        <div _ngcontent-ng-c925702217="" class="logo_cart">
                                                            <ui-logo _ngcontent-ng-c925702217="" _nghost-ng-c1785451307="" style="text-align:center;">
                                                                <img src="/images/icons/ico-cart-24.svg" style="width:50px;"/>
                                                            </ui-logo>
                                                        </div>

                                                        <div _ngcontent-ng-c925702217="" class="user">

                                                            <div class="dropdown">




                                                                <checkout-ui-profile-dropdown _ngcontent-ng-c2115795410="" uilayoutbaseheaderright="" _nghost-ng-c3551443402="">
                                                                    <tui-hosted-dropdown _ngcontent-ng-c3551443402="" tuidropdownalign="right" automation-id="checkout-ui-profile-dropdown__dropdown" _nghost-ng-c3846851089="" class="ng-star-inserted">
                                                                        <div _ngcontent-ng-c3846851089="" tuiaccessorproxy="" tuidropdownopenmonitor="" class="t-wrapper ng-star-inserted">
                                                                            <button onclick="myDropdown(); return false;" _ngcontent-ng-c3551443402="" tuiiconbutton="" appearance="icon" size="s" shape="rounded" automation-id="checkout-ui-profile-dropdown__profile-button" icon="tuiIconTdsUserImpersonalSmallPragmatic" class="profile-button select-menu dropbtn" _nghost-ng-c3926154569="" tabindex="0" data-shape="rounded" data-size="s" data-appearance="icon">
                                                                                <!----><!---->
                                                                                <div _ngcontent-ng-c3926154569="" tuiwrapper="" class="t-wrapper" data-appearance="icon">
															<span _ngcontent-ng-c3926154569="" class="t-content"><span _ngcontent-ng-c3926154569="" class="t-left ng-star-inserted">
																	<tui-svg _ngcontent-ng-c3926154569="" class="t-icon ng-star-inserted" _nghost-ng-c189367467="">
																		<div _ngcontent-ng-c189367467="" class="t-src ng-star-inserted">
																			<svg width="100%" height="100%" style="max-height: 16px" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16">
																				<path fill="currentColor" d="M8 6C6.89543 6 6 5.10457 6 4C6 2.89543 6.89543 2 8 2C9.10457 2 10 2.89543 10 4C10 5.10457 9.10457 6 8 6ZM4 4C4 1.79086 5.79086 0 8 0C10.2091 0 12 1.79086 12 4C12 6.20914 10.2091 8 8 8C5.79086 8 4 6.20914 4 4ZM3 13.6667C3 12.1939 4.19391 11 5.66667 11H10.3333C11.8061 11 13 12.1939 13 13.6667V14H3V13.6667ZM1 13.6667C1 11.0893 3.08934 9 5.66667 9H10.3333C12.9107 9 15 11.0893 15 13.6667V14V16H13H3H1V14V13.6667Z" clip-rule="evenodd" fill-rule="evenodd"></path>
																			</svg>
																		</div><!----><!----><!----><!---->
																	</tui-svg><!----></span><!----><!----></span><!---->
                                                                                </div>
                                                                            </button><!---->
                                                                        </div><!---->
                                                                    </tui-hosted-dropdown><!----><!---->
                                                                </checkout-ui-profile-dropdown>



                                                                <div id="myDropdown" class="dropdown-content">
                                                                    <a href="#" onclick="window.location.href='#cart_login'; return false;">Вход в аккаунт</a>
                                                                </div>
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>
                                                <ui-order-error-notification _ngcontent-ng-c2115795410="" uilayoutbaseerrornotification="" _nghost-ng-c669369259="">
                                                    <!----><!---->
                                                </ui-order-error-notification>


                                            </div><!----><!----><!----><!---->
                                        </ui-layout-base><!---->
                                    </checkout-ui-order><!---->
                                    <sme-devtools-host _ngcontent-ng-c2035956="" class="sme-devtools-host">
                                        <!----><!---->
                                    </sme-devtools-host>
                                </div><!---->
                                <tui-dialog-host _nghost-ng-c869960046="" class="ng-tns-c869960046-0 ng-star-inserted">
                                    <!----><div _ngcontent-ng-c869960046="" class="t-overlay ng-tns-c869960046-0 ng-star-inserted"></div><!---->
                                </tui-dialog-host><!---->
                                <tui-alert-host class="ng-tns-c574476958-1 ng-star-inserted">
                                    <div class="t-wrapper ng-tns-c574476958-1 ng-trigger ng-trigger-tuiParentAnimation ng-star-inserted">
                                        <!---->
                                    </div><!---->
                                </tui-alert-host><!----><!---->
                            </tui-dropdown-host><!---->
                        </div>
                        *~

                        <div data-replace-layout-path="[1][0][2][0][3][0]" class="d8" data-widget="row">
                            <div data-replace-layout-path="[1][0][2][0][3][0][0][0]" class="c4" data-widget="column">
                                <div class="jb5" data-widget="header">
                                    <div class="bj6">
                                        <div class="jb6 j6b">
                                            <div class="bj7 b7j">
                                                Корзина
                                                <!---->
                                            </div>
                                            <div class="j7b cart" >
                                                <span  data-bind="text: total_cart_amount"></span>
                                            </div>
                                        </div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div data-replace-layout-path="[1][0][2][0][4][0]" class="d8" data-widget="row">
                            <div data-replace-layout-path="[1][0][2][0][4][0][0][0]" class="d3 c4" data-widget="column">
                                <div data-replace-layout-path="[1][0][2][0][4][0][0][0][0][0]" class="d8" data-widget="row">
                                    <div data-replace-layout-path="[1][0][2][0][4][0][0][0][0][0][0][0]" class="c4 cart" data-widget="column">


                                        ~~*
                                        <!-- ko if: total_cart_amount() > 0 -->
                                        <div class="bj jb0" data-widget="controls">
                                            <div class="jb">
                                                <label class="a400-a a400-a4 a400-a8 j0b">
                                                    <input type="checkbox" name="" checked="checked" class="a400-a2">
                                                    <div class="a400-a5">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" color="#fff" class="a400-a3">
                                                            <path fill="currentColor" d="M12.707 5.293a1 1 0 0 1 0 1.414l-5 5a1 1 0 0 1-1.414 0l-3-3a1 1 0 0 1 1.414-1.414L7 9.586l4.293-4.293a1 1 0 0 1 1.414 0"></path>
                                                        </svg>
                                                    </div>
                                                    <div class="a400-a0">
                                                        Выбрать все
                                                    </div></label>
                                                <button class="bj1 b1j ga00-a undefined" style="color:rgba(249, 17, 85, 1);">
                                                    <div class="ga00-a2 tsBodyControl400Small">
                                                        Удалить выбранные
                                                    </div>
                                                </button>
                                            </div>
                                            <div class="">
                                                <button class="ga00-a undefined">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="ga00-a0 ga00-a1">
                                                        <path fill="currentColor" d="M7.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1-1.414 1.414L9 4.414V9a1 1 0 1 1-2 0V4.414l-.293.293a1 1 0 0 1-1.414-1.414zM2 9a3 3 0 0 1 3-3 1 1 0 0 1 0 2 1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1 1 1 0 1 1 0-2 3 3 0 0 1 3 3v3a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3z"></path>
                                                    </svg>
                                                    <div class="ga00-a2 tsBodyControl400Small">
                                                        Поделиться
                                                    </div>
                                                </button>
                                                <!---->
                                                <!---->
                                            </div>
                                            <!---->
                                            <!---->
                                        </div>
                                        <!-- /ko -->
                                        *~


                                        <div data-widget="paginator">
                                            <div data-replace-layout-path="[1][0][2][0][4][0][0][0][0][0][0][0][1][0]">


                                                <!-- ko if: total_cart_amount() > 0 -->
                                                <div class="rmp0b rmb2p rmpb2 rmp1b rmbp3 rmp2b" data-widget="split">


                                                    <div class="rmb3p rmp4b" style="background-color:#F2F5F9;">
                                                        <div class="rmbp5 rmp3b">
                                                            <div class="rma8b rmba9 rmac rmpb3" style="color:#001a34;">
                                                                <span class="tsBodyControl500Medium">Товары</span>
                                                            </div>
                                                            <!---->
                                                        </div>
                                                        <div class="rmb5p">
                                                            <!---->
                                                            <!---->
                                                        </div>
                                                        <!---->
                                                    </div>



                                                    <!-- ko foreach: cart().items() -->
                                                    <div class="b5o ob5">
                                                        <div class="o5b">
                                                            <div class="b6o">
                                                                <div class="bo7">
                                                                    <div class="bp">
                                                                        <div class="n4b bn5">


                                                                            ~~*
                                                                            <div class="bo8 ob8">
                                                                                <label class="a400-a a400-a4 a400-a8">
                                                                                    <input type="checkbox" name="" checked="checked" class="a400-a2">
                                                                                    <div class="a400-a5">
                                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" color="#fff" class="a400-a3">
                                                                                            <path fill="currentColor" d="M12.707 5.293a1 1 0 0 1 0 1.414l-5 5a1 1 0 0 1-1.414 0l-3-3a1 1 0 0 1 1.414-1.414L7 9.586l4.293-4.293a1 1 0 0 1 1.414 0"></path>
                                                                                        </svg>
                                                                                    </div> <!----></label>
                                                                            </div>
                                                                            *~

                                                                            <a class="nb5 n5b" target="_blank" data-bind="attr: {href: `/product/${guid()}`}" >
                                                                                <div class="bm9 b9m"><img loading="lazy" fetchpriority="low" alt="productImage" class="m9b b900-a"  data-bind="attr:{src: `https://ru.market/i/${guid()}/400/1.jpg`}"  /><!---->
                                                                                </div>

                                                                            </a>
                                                                            <div class="nb5 b6n">
                                                                                <a class="tsBody400Small b7n">
                                                                                    <hr class="m8b nb7" style="height:8px;">
                                                                                    <div class="a8b ba9 ca nb7" style="color:#001a34;">
                                                                                        <a class="nb5 n5b" target="_blank" data-bind="attr: {href: `/product/${guid()}`}" ><span class="tsBody400Small" data-bind="text: title()"></span></a>
                                                                                    </div>
                                                                                    <hr class="m8b nb7" style="height:8px;">

                                                                                    <!-- ko if: min() > 1 -->
                                                                                    <div class="a8b ba9 b9a b8m nb7" style="color:#808d9a;">
                                                                                        <span class="tsBody400Small">(минимальный заказ: <span data-bind="text: min()"></span>~~*&nbsp;<span data-bind="text: measure()"></span>*~,</span>
                                                                                    </div>
                                                                                    <div class="a8b ba9 b9a b8m nb7" style="color:#808d9a;">
                                                                                        <span class="tsBody400Small">к-во ~~*в заказе может быть только *~кратно минимальному)</span>
                                                                                    </div>
                                                                                    <!-- /ko -->


                                                                                </a>
                                                                                <div class="b5n">
                                                                                    <!---->
                                                                                    <!---->
                                                                                    <div class="n6b">
                                                                                        <div class="b3m">
                                                                                            <!---->
                                                                                            <!---->

                                                                                            ~~*
                                                                                            <button class="m3b rmag00-a0 rmag00-a2" style="background:rgba(0, 48, 120, 0.039);color:rgba(0, 26, 52, 1);">
                                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="rmag00-b1">
                                                                                                    <path fill="currentColor" d="M16 6.022C16 3.457 14.052 1.5 11.5 1.5c-1.432 0-2.665.799-3.5 1.926C7.165 2.299 5.932 1.5 4.5 1.5 1.948 1.5 0 3.457 0 6.022c0 2.457 1.66 4.415 3.241 5.743 1.617 1.358 3.387 2.258 4.062 2.577.444.21.95.21 1.394 0 .675-.32 2.445-1.219 4.062-2.577C14.339 10.437 16 8.479 16 6.022"></path>
                                                                                                </svg><div class="rmag00-a" style="background-color:rgba(0, 26, 52, 1);"></div>
                                                                                            </button>
                                                                                            *~


                                                                                            ~~*
                                                                                            <button class="m3b b200-a0 b200-b1" style="background:rgba(0, 48, 120, 0.039);color:rgba(7, 7, 7, 1);">
                                                                                                <div class="b200-a1">
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b200-b0" style="color: rgb(0, 26, 52);">
                                                                                                        <path fill="currentColor" d="M4.932 3.64C3.705 4.886.638 8 3.092 8.996l2.454.997c1.227.498 1.227.498.981 1.744l-.368 1.868c-.859 4.36 3.682 0 4.909-1.245s4.294-4.36 1.84-5.357l-2.454-.996c-1.227-.498-1.227-.498-1.022-1.744.088-.539.272-1.246.409-1.868.958-4.36-3.682 0-4.909 1.245"></path>
                                                                                                    </svg>
                                                                                                    <div class="b200-a8 tsBodyControl400Small">
                                                                                                        Купить
                                                                                                    </div>
                                                                                                </div><div class="b200-a" style="background-color:rgba(7, 7, 7, 1);"></div>
                                                                                            </button>
                                                                                            *~


                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="nb5 nb6">
                                                                                <div class="m7b">
                                                                                    <div class="bm8 c300-a c300-b6">
                                                                                        <div class="c300-a0">
                                                                                            <span class="c300-a1 tsHeadline400Small c300-c0" style="margin-right:4px;"  data-bind="text:Math.round(Number(cost()*(product_amount()/min())))+ ' ₽'"></span><span class="tsBodyControl300XSmall c300-a2 c300-a6 c300-b1 c300-a3" style="background:#FFF;"><div class="c300-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
                                                                                        </div>
                                                                                    </div>

                                                                                    ~~*
                                                                                    <div class="bm8 c300-a c300-b5">
                                                                                        <div class="c300-a0">
                                                                                            <span class="c300-a1 tsBodyAccent300XSmall c300-c0">2 797 ₽</span><span class="c300-a1 tsBodyControl300XSmall c300-b0" style="margin-left:4px;margin-right:4px;">14 004 ₽</span><span class="tsBodyControl300XSmall c300-a2 c300-a4 c300-b1 c300-a3" style="background:#FFF;"><div class="c300-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    *~


                                                                                </div>

                                                                                <!-- ko if: bonus() > 0 -->

                                                                                <hr class="m8b" style="height:8px;">
                                                                                <div class="a8b ba9 b9a b8m" style="color:#001a34;">
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a9b" style="color: rgb(0, 26, 52);">
                                                                                        <path fill="currentColor" d="M6 5a3 3 0 1 0 0 6 3 3 0 0 0 0-6M1 8a5 5 0 1 1 10 0A5 5 0 0 1 1 8m10.134-3.966a1 1 0 0 1 1.367-.364A5 5 0 0 1 15 8a5 5 0 0 1-2.5 4.33 1 1 0 1 1-1-1.73c.899-.52 1.5-1.49 1.5-2.6a3 3 0 0 0-1.5-2.6 1 1 0 0 1-.366-1.366"></path>
                                                                                    </svg><span class="tsBody400Small" data-bind="text: bonus()*product_amount()/$data.min() + ' ₽'"></span>
                                                                                </div>
                                                                                <!-- /ko -->

                                                                                <hr class="m8b" style="height:8px;">
                                                                                <button  data-bind="click: $root.remove_from_cart.bind($data, guid())" class="m3b rmag00-a0 rmag00-a2" style="background:rgba(0, 48, 120, 0.039);color:rgba(0, 26, 52, 1);">
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="rmag00-b1">
                                                                                        <path fill="currentColor" d="m4.888 3.035.275-.826A2.5 2.5 0 0 1 7.535.5h.93a2.5 2.5 0 0 1 2.372 1.71l.275.825c2.267.09 3.555.406 3.555 1.527 0 .938-.417.938-1.25.938H2.583c-.833 0-1.25 0-1.25-.937 0-1.122 1.288-1.438 3.555-1.528m1.856-.299-.088.266Q7.295 3 8 3t1.345.002l-.089-.266a.83.83 0 0 0-.79-.57h-.931a.83.83 0 0 0-.79.57M2.167 7.167c0-.6.416-.834.833-.834h10c.417 0 .833.235.833.834 0 6.666-.416 8.333-5.833 8.333s-5.833-1.667-5.833-8.333m4.166 1.666a.833.833 0 0 0-.833.834v1.666a.833.833 0 1 0 1.667 0V9.667a.833.833 0 0 0-.834-.834m4.167.834a.833.833 0 1 0-1.667 0v1.666a.833.833 0 1 0 1.667 0z"></path>
                                                                                    </svg><div class="rmag00-a" style="background-color:rgba(0, 26, 52, 1);"></div>
                                                                                </button>


                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!---->
                                                            </div>
                                                            <div class="bo8 b8o">
                                                                <div>
                                                                    <div class="bn8">



                                                                        <button class="rmb8n rmag00-a0 rmag00-a7 rmag00-a2" data-bind="click: $root.amount_minus.bind($data, guid())">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="rmag00-b1">
                                                                                <path fill="currentColor" d="M5 11a1 1 0 1 0 0 2h14a1 1 0 1 0 0-2z"></path>
                                                                            </svg><div class="rmag00-a rmag00-b3"></div>
                                                                        </button>
                                                                        <div inputmode="numeric" pattern="[0-9]*" min="1" max="3" class="rmf00-a rmf00-a5 rmf00-b6 rmf00-b7 rmn8b">
                                                                            <div class="rmf00-b0">
                                                                                <input  data-bind="textInput: product_amount(), valueUpdate: 'afterkeydown', event: {change: $root.validate_amount.bind($data, guid()) }"  inputmode="numeric" pattern="[0-9]*" min="1" max="3" type="number" name="" maxlength="4" value="1" class="rmd00-a rmd00-a1 rmn9b">
                                                                                <!---->
                                                                                <!---->
                                                                                <div class="rmf00-a2 rmf00-a5">
                                                                                    <!---->
                                                                                    <!---->
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <button class="rmnb8 rmag00-a0 rmag00-a7 rmag00-a2" data-bind="click: $root.amount_plus.bind($data, guid())">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="rmag00-b1">
                                                                                <path fill="currentColor" d="M12 4a1 1 0 0 0-1 1v6H5a1 1 0 1 0 0 2h6v6a1 1 0 1 0 2 0v-6h6a1 1 0 1 0 0-2h-6V5a1 1 0 0 0-1-1"></path>
                                                                            </svg><div class="rmag00-a"></div>
                                                                        </button>
                                                                        <!---->

                                                                    </div>

                                                                    ~~*
                                                                    <div class="b9n">
                                                                        <div class="a8b" style="color:#f91155;">
                                                                            <span class="tsBody300XSmall">Скоро закончится</span>
                                                                        </div>
                                                                    </div>
                                                                    *~

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!---->
                                                    </div>
                                                    <!-- /ko -->


                                                </div>
                                                <!-- /ko -->



                                            </div>
                                            <!---->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div data-replace-layout-path="[1][0][2][0][4][0][1][0]" class="d c4 cart" data-widget="column">
                                <div data-replace-layout-path="[1][0][2][0][4][0][1][0][0][0]" class="e0" style="top:32px;" data-widget="stickyContainer">
                                    <section class="b2r rb2" data-widget="total">
                                        <div class="r2b">
                                            <div class="bq br3">
                                                <!---->
                                                <button class="b200-a0 b200-b2 b200-a4" style="background:rgba(16, 196, 76, 1);color:#ffffff;" ~~*onclick="window.location.href = '/order/'; return false;"*~ data-bind="click: $root.send2order.bind($data)" >
                                                    <div class="b200-a1">
                                                        <div class="b200-a8 tsBodyControl500Medium">
                                                            Перейти к оформлению
                                                        </div>
                                                    </div><div class="b200-a" style="background-color:#ffffff;"></div>
                                                </button>
                                                <div class="qb0">
                                                    <div class="aa6 aa8">
                                                        <div class="b1a">
                                                            <div class="ab2" style="color:#707F8D;">
                                                                <span class="a2b">Доступные способы и время доставки можно выбрать при оформлении заказа</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="bq5">
                                                <div class="qb5">
                                                    <span class="q5b"> Ваша корзина </span><span class="bq6"> товаров: <span data-bind="text: total_cart_amount()"></span>&nbsp;•&nbsp;<span data-bind="text: cart_weight() + ' кг '"></span> </span>
                                                </div>
                                                <div class="q1b">
                                                    <div class="bq2">
                                                        <span class="b2q"><span>Товары (<b data-bind="text: total_cart_amount()"></b>)</span> <!----></span><!---->
                                                        <!---->
                                                    </div>
                                                    <div>
                                                        <!---->
                                                        <span class="q2b" data-bind="text: cart_sum() + ' ₽'"></span>
                                                    </div>
                                                </div>

                                                <div class="q1b">
                                                    <div class="bq2">
                                                        <span class="b2q"><span>Бонусов к списанию</span> <!----></span><!---->

                                                        <!-- ko if: model_cart.cart().user == 'undefined' -->
                                                        <button class="ga00-a undefined" style="text-align:left;" onclick="window.location.href='#cart_login';">
                                                            <div class="ga00-a2 ">
                                                                Войти для отображния<br>бонусов на балансе
                                                            </div>
                                                        </button>
                                                        <!-- /ko -->

                                                    </div>

                                                    <div>
                                                        <!---->
                                                        <span class="q2b"><span style="color: #09b4f6;" data-bind="text: cart_discount() + ' ₽'"></span></span>
                                                    </div>
                                                </div>
                                                <div class="b6q">
                                                    <span> Итого <!----></span><span style="color:#10C44C;" data-bind="text: total_cart_sum() + ' ₽'"></span>
                                                </div>
                                                <div class="b3q">
                                                    <span class="q3b"><span>
                                                            <div class="a8b ba9 b9a bq4" style="color:rgba(0, 26, 52, 0.6);">
                                                                <span class="tsBody400Small">К зачислению на бонусный счёт</span>
                                                            </div> <!----></span> <!----> <!----> <!----></span>
                                                    <div class="b4q">
                                                        <div class="a8b ba9 b9a" style="color:rgba(0, 26, 52, 0.6);">
                                                            <span class="tsBodyControl400Small"  data-bind="text: cart_bonus() + ' ₽'"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!---->
                                            </div>
                                            <!---->
                                        </div>

                                    </section>

                                    <div class="d4m" style="height:24px;" data-widget="separator"></div>

                                </div>
                            </div>
                        </div>





                    </div>
                </div>
            </div>



        </div>

        ~~include file="market/tpl/`$smarty.const.TPL`/footer.tpl"~


        <div>
            <div class="an2">
            </div>
        </div>
    </div>
</div>


~~include file='market/tpl/bottom_script.tpl'~



</body>
</html>