<!DOCTYPE html>
<html lang="ru">
~~include file="market/tpl/`$smarty.const.TPL`/index/head.tpl"~

<body>

~~mod path="market/" mod_name="cart" tpl="md-cart"~


	<div id="__ozon">
		<div id="layoutPage" class="a0 a1">
			<div data-replace-layout-path="[0]" class="b0" style="width:auto;" data-widget="blockVertical">
				~~include file="market/tpl/`$smarty.const.TPL`/index/header.tpl"~
				<div data-replace-layout-path="[4][0]" class="container b4" data-widget="container">

					~~$body~


					~~include file="market/tpl/`$smarty.const.TPL`/footer.tpl"~
				</div>
			</div>
			<div>
				<div class="an2">
				</div>
			</div>
		</div>
	</div>
	~~include file='market/tpl/bottom_script.tpl'~



    <style>
        .b6131-a {
            bottom: 0;
            left: 0;
            outline: none;
            overflow: hidden;
            position: fixed;
            top: 0;
            width: 100vw;
            z-index: 1000;
        }
        .b6131-a0 {
            background-color: rgba(3,8,13,.24);
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
        }
        .b6131-a2 {
            -ms-scroll-chaining: none;
            -webkit-overflow-scrolling: touch;
            height: 100%;
            overflow-y: auto;
            overscroll-behavior: contain;
            position: relative;
        }
        .b6131-a4 {
            align-items: center;
        }

        .b6131-a3 {
            align-items: flex-start;
            display: flex;
            justify-content: center;
            min-height: calc(100vh - env(safe-area-inset-top, 0) - env(safe-area-inset-bottom, 0));
        }
        .b6131-b .b6131-a5 {
            background-color: transparent;
            max-width: none;
            min-width: 0;
            padding: 0;
        }

        .b6131-a5.b6131-a7 {
            border-radius: 32px;
            padding: 46px;
        }
        .b6131-a5 {
            background-color: #fff;
            box-sizing: border-box;
            margin: 50px 0;
            max-width: 960px;
            min-width: 392px;
            position: relative;
        }
        .b6131-b1.b6131-a7 {
            right: 18px;
            top: 46px!important;
            float: right;
        }
        .b6131-b1 {
            position: absolute;
            z-index: 5;
        }

        .ag17-a5 {
            border-radius: 50%!important;
        }
        .ag17-a2 {
            height: 32px!important;
            min-width: 32px!important;
        }
        .ag17-a0 {
            -webkit-touch-callout: none;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            align-items: center;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background: transparent;
            border: none;
            border-radius: 8px;
            box-sizing: border-box;
            color: inherit;
            cursor: pointer;
            display: inline-flex;
            font-family: GTEestiPro,arial,sans-serif;
            font-size: inherit;
            font-weight: inherit;
            height: 44px;
            justify-content: center;
            margin: 0;
            min-width: 44px;
            padding: 0;
            position: relative;
            text-decoration: none;
            transition: transform .1s cubic-bezier(.55,0,1,.45);
            white-space: normal;
        }
        .ag17-a {
            border-radius: inherit;
            bottom: 0;
            left: 0;
            opacity: 0;
            position: absolute;
            right: 0;
            top: 0;
            z-index: 1;
        }

        .b6131-b .b6131-a5>div {
            border-radius: inherit;
        }

        .la4 {
            background: #fff;
            min-height: 100px;
            min-width: 288px;
        }
        .b2 {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }



        .n7a.an8 {
            max-height: 80vh;
        }
        .n7a {
            display: flex;
            flex-direction: column;
            max-width: 436px;
        }

        .n7a, .na7 {
            position: relative;
        }
        .n7a, .na7 {
            position: relative;
        }
        .na7 {
            border-radius: 20px 20px 0 0;
            flex-shrink: 0;
            overflow: hidden;
        }
        .an9 {
            padding: 40px 48px 0;
        }
        .ba9 {
            align-items: center;
            box-sizing: border-box;
            display: flex;
            width: 100%;
            word-break: break-word;
        }
        .tsHeadline600Medium {
            font-size: 27px;
            font-weight: 700;
            letter-spacing: .4px;
        }
        .tsHeadline600Medium {
            line-height: 30px;
        }
        .n7a.o0a .n9a {
            overflow: overlay;
        }
        .a0o, .ao0, .oa0:not(:first-child) {
            margin-top: 16px;
        }
        .a2n.an7 {
            border-radius: 6px;
        }

        .a2n.na2, .a2n.na2:hover {
            border-color: var(--theme-rmcolor);
        }
        .a2n {
            border: 2px solid rgba(204,214,228,.6);
            border-radius: 3px;
            box-sizing: border-box;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            position: relative;
        }
        .a3n {
            display: flex;
            position: relative;
        }
        .na3 {
            flex-grow: 1;
        }
        .a2n.an7 .a6n, .a2n.an7 .n3a, .a2n.an7 .na6 {
            padding-right: 48px;
        }
        .n3a.an4 {
            padding-right: 48px;
        }
        .n3a {
            color: #070707;
            display: flex;
            justify-content: space-between;
            padding: 16px 0 0 16px;
        }

        .a2n.an7 .na4 {
            margin-bottom: 8px;
        }
        .na4 {
            align-items: center;
            display: flex;
            font-size: 16px;
            font-weight: 700;
            line-height: 20px;
            margin-bottom: 12px;
        }
        .ba9 {
            align-items: center;
            box-sizing: border-box;
            display: flex;
            width: 100%;
            word-break: break-word;
        }
        .tsBody500Large, .tsBody500Medium {
            font-size: 16px;
            font-weight: 400;
            letter-spacing: .2px;
        }
        .tsBody500Medium {
            line-height: 24px;
        }
        .an6 {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
            justify-content: space-between;
        }
        .a2n.an7 .a6n, .a2n.an7 .n3a, .a2n.an7 .na6 {
            padding-right: 48px;
        }

        .a6n {
            padding: 0 16px 16px;
        }
        .a2n.an7 .n6a {
            margin: 0;
            padding: 0;
        }

        .n6a {
            margin-bottom: 8px;
            padding-left: 36px;
        }
        .tsBody400Small {
            line-height: 20px;
        }

        .tsBody400Large, .tsBody400Small {
            font-size: 14px;
            font-weight: 400;
            letter-spacing: .2px;
        }
        .a2n.an7 .a5n {
            right: 8px;
        }

        .a5n {
            height: 24px;
            position: absolute;
            right: 16px;
            top: 14px;
        }
        .d4155-a {
            display: inline-flex;
        }
        .a2n.an7 .a4n {
            color: rgba(0,26,52,.6);
        }

        .a4n {
            color: #070707;
            height: 24px;
            width: 24px;
        }
        .a0o, .ao0, .oa0:not(:first-child) {
            margin-top: 16px;
        }

        .a2n.an7 {
            border-radius: 6px;
        }
        .a2n {
            border: 2px solid rgba(204,214,228,.6);
            border-radius: 3px;
            box-sizing: border-box;
            cursor: pointer;
            display: flex;
            flex-direction: column;
            position: relative;
        }
        .a3n {
            display: flex;
            position: relative;
        }
        .na3 {
            flex-grow: 1;
        }
        .a2n.an7 .a5n {
            right: 8px;
        }
        .a5n {
            height: 24px;
            position: absolute;
            right: 16px;
            top: 14px;
        }
        .d4155-a {
            display: inline-flex;
        }

        .b6131-a3:after {
            content: "";
            display: block;
            font-size: 0;
            min-height: inherit;
        }
        .b237-b2 {
            border-radius: 12px;
            padding: 16px 24px;
        }

        .b237-a4 {
            width: 100%;
        }
        .b237-a0, .b237-a1 {
            align-items: center;
            justify-content: center;
        }
        .b237-a0 {
            -webkit-touch-callout: none;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background: transparent;
            border: none;
            border-radius: 8px;
            box-sizing: border-box;
            color: inherit;
            cursor: pointer;
            display: inline-flex;
            font-family: GTEestiPro,arial,sans-serif;
            font-size: inherit;
            font-weight: inherit;
            margin: 0;
            overflow: hidden;
            padding: 10px 16px;
            position: relative;
            text-align: center;
            text-decoration: none;
        }
        .na9 {
            flex-shrink: 0;
            padding: 16px 48px 40px;
        }
        .n9a {
            margin-top: 16px;
            overflow: auto;
            padding: 0 48px;
        }
        .b6131-b1.b6131-a7 {
            right: 18px;
            top: 18px;
        }

        .b6131-b1 {
            position: absolute;
            z-index: 5;
        }
        .ag17-a5 {
            border-radius: 50%;
        }
        .ag17-a2 {
            height: 32px;
            min-width: 32px;
        }
        .ag17-a0 {
            -webkit-touch-callout: none;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            align-items: center;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background: transparent;
            border: none;
            border-radius: 8px;
            box-sizing: border-box;
            color: inherit;
            cursor: pointer;
            display: inline-flex;
            font-family: GTEestiPro,arial,sans-serif;
            font-size: inherit;
            font-weight: inherit;
            height: 44px;
            justify-content: center;
            margin: 0;
            min-width: 44px;
            padding: 0;
            position: relative;
            text-decoration: none;
            transition: transform .1s cubic-bezier(.55,0,1,.45);
            white-space: normal;
        }





    </style>

    <div class="vue-portal-target" style="display:none;">
    <div tabindex="-1" class="b6131-a b6131-b">
        <div class="b6131-a0"></div>
        <div class="b6131-a2" style="overflow-y: auto;">
            <div class="b6131-a3 b6131-a4" style="padding-right: 19px;">
                <div class="b6131-a5 b6131-a7">
                    <button class="b6131-b1 b6131-a7 ag17-a0 ag17-a5 ag17-a2" style="background: rgba(204, 214, 228, 0.6); color: rgb(255, 255, 255);">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="ag17-b1">
                            <path fill="currentColor" d="M2.533 2.533a1.25 1.25 0 0 1 1.768 0l3.7 3.7 3.699-3.7A1.25 1.25 0 0 1 13.467 4.3L9.767 8l3.7 3.7a1.25 1.25 0 1 1-1.767 1.767L8 9.767l-3.7 3.7A1.25 1.25 0 1 1 2.534 11.7l3.7-3.7-3.7-3.7a1.25 1.25 0 0 1 0-1.767"></path>
                        </svg><div class="ag17-a" style="background-color: rgb(255, 255, 255);"></div>
                    </button>
                    <div style="clear:both;"></div>
                    <div data-widget="modalLayout" class="la4">
                        <div class="b2 al5" data-widget="blockVertical" style="width: auto;">
                            <div data-widget="commonAddressBook">
                                <div class="n7a an8 o0a">
                                    <div class="na7">
                                        <!---->
                                        <div class="an9">
                                            <div>
                                                <div class="ba9" style="color: rgb(0, 26, 52);">
                                                    <span class="tsHeadline600Medium">Выберите адрес доставки</span>
                                                </div>
                                            </div>
                                            <!---->
                                        </div>
                                    </div>
                                    <div class="n9a">
                                        <!---->
                                        <!---->
                                        <div class="a0o">



                                            ~~*
                                            <div class="a2n na2 an7 oa0">
                                                <div class="a3n">
                                                    <!---->
                                                    <div class="na3">
                                                        <header class="n3a an4">
                                                            <div class="na4">
                                                                <!---->
                                                                <div class="ba9">
                                                                    <span class="tsBody500Medium">Пункт ClustBUY</span>
                                                                </div>
                                                            </div>
                                                        </header>
                                                        <div class="an6">
                                                            <div class="a6n">
                                                                <div class="ba9 n6a" style="color: rgb(7, 7, 7);">
                                                                    <span class="tsBody400Small">Москва, </span>
                                                                </div>
                                                                <div class="ba9 n6a" style="color: rgba(0, 26, 52, 0.6);">
                                                                    <span class="tsBody400Small">Срок хранения заказа – 7&nbsp;дней</span>
                                                                </div>
                                                            </div>
                                                            <!---->
                                                        </div>
                                                    </div>
                                                    <div class="d4155-a a5n">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a4n">
                                                            <path fill="currentColor" d="M10 6a2 2 0 1 0 4 0 2 2 0 0 0-4 0m0 12a2 2 0 1 0 4 0 2 2 0 0 0-4 0m2-4a2 2 0 1 1 0-4 2 2 0 0 1 0 4"></path>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                            *~


                                        </div>
                                    </div>
                                    <div class="na9">
                                        <button class="b237-a0 b237-b2 b237-a4" style="background: rgba(0, 150, 255, 0.08); color: var(--cbPrimaryColor);">
                                            <div class="b237-a1">
                                                <div class="b237-a7">
                                                    <span class="b237-a8 tsBodyControl500Medium">Добавить</span><span class="tsCompact400Small b237-b">адрес доставки, пункт выдачи, постамат</span>
                                                </div>
                                            </div><div class="b237-a" style="background-color: var(--cbPrimaryColor);"></div>
                                        </button>
                                    </div>
                                </div>
                                <!---->
                                <!---->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>