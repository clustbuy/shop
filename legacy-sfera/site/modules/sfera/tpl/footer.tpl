<!-- Mobile Bottom Navigation -->

<style>
    @media (max-width: 894px) {
        .dj5_11 {
            display: none;
        }
        .mobile-bottom-nav {
            display: flex;
        }
    }

    @media (min-width: 895px) {
        .mobile-bottom-nav {
            display: none;
        }
    }

</style>

<nav class="mobile-bottom-nav">
    <a href="/" class="mobile-bottom-nav-item active">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
            <polyline points="9 22 9 12 15 12 15 22"></polyline>
        </svg>
        <span>Главная</span>
    </a>

    <a href="/catalog/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="3" y="3" width="7" height="7"></rect>
            <rect x="14" y="3" width="7" height="7"></rect>
            <rect x="14" y="14" width="7" height="7"></rect>
            <rect x="3" y="14" width="7" height="7"></rect>
        </svg>
        <span>Каталог</span>
    </a>

    <a href="/favorites/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
        </svg>
        <span>Избранное</span>
        <span class="mobile-nav-badge favorites-counter" data-bind="text: formattedCount, visible: isVisible"></span>
    </a>

    <a href="/cart/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
        </svg>
        <span>Корзина</span>
        <span class="mobile-nav-badge mobile-cart-counter" data-bind="text: formattedCount, visible: isVisible"></span>
    </a>

    <a href="#" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
        </svg>
        <span>Профиль</span>
    </a>
</nav>

<footer class="dj5_11" data-widget="footer" style="margin-top:0px;">


    <style nonce="" data-href="">
        .dj5_11 {
            background-color: #f5f7fa;
            flex-wrap: wrap;
            font-family: var(--mainFont);
            margin: 40px 0 0;
            width: 100%;

            .tsBody400Large, .tsBody500Small { font-weight: 400; letter-spacing: 0.2px; line-height: 22px; }
            .tsBody400Large { font-size: 14px; }
            .tsBodyControl500Medium { font-size: 16px; font-weight: 500; letter-spacing: 0.2px; line-height: 24px; }
            .b9100-a4 { height: 100%; overflow: hidden; position: relative; width: 100%; }
            .b9100-a4, .b9100-a5 { align-items: center; display: flex; justify-content: center; }
            .b9100-a5 { background-color: rgba(255, 255, 255, 0.6); inset: 0px; color: rgb(0, 26, 52); flex-direction: column; position: absolute; z-index: 1; }
            .b9100-a6 { margin-top: 4px; text-align: center; }
            .b9100-a { max-height: 100%; max-width: 100%; }
            .b9100-a0 { height: 100%; overflow: hidden; }
            .b9100-a1 { visibility: hidden; }
            .b9100-a2 { align-items: center; display: flex; justify-content: center; }
            .b9100-a3 { border-radius: 12px; display: inline-block; overflow: hidden; position: relative; }
            .b9100-a3::after { background-color: rgb(239, 243, 246); border-radius: 12px; content: ""; height: 100%; left: 0px; pointer-events: none; position: absolute; top: 0px; width: 100%; }
            .q4b012-a { transition-duration: ; transition-timing-function: ; transition-delay: ; transition-behavior: ; transition-property: color; }
            .q4b012-a0 { color: rgb(7, 7, 7); }
            .q4b012-a0[href]:hover { color: var(--cbPrimaryColor); cursor: pointer; }
            .q4b012-a1 { color: rgb(255, 255, 255); cursor: pointer; }
            .q4b012-a1[href]:hover { color: rgb(153, 163, 174); }
            .b2100-a { border-radius: inherit; inset: 0px; opacity: 0; position: absolute; z-index: 1; }
            .b2100-a0 { -webkit-font-smoothing: antialiased; appearance: none; background: transparent; border: none; border-radius: 8px; box-sizing: border-box; color: inherit; cursor: pointer; display: inline-flex; font-family: var(--mainFont); font-size: inherit; font-weight: inherit; margin: 0px; overflow: hidden; padding: 10px 16px; position: relative; text-align: center; text-decoration: none; }
            .b2100-a0 { -webkit-font-smoothing: antialiased; appearance: none; background: transparent; border: none; border-radius: 8px; box-sizing: border-box; color: inherit; cursor: pointer; display: inline-flex; font-family: var(--mainFont); font-size: inherit; font-weight: inherit; margin: 0px; overflow: hidden; padding: 10px 16px; position: relative; text-align: center; text-decoration: none; }
            .b2100-a0, .b2100-a1 { align-items: center; justify-content: center; }
            .b2100-a0, .b2100-a1 { align-items: center; justify-content: center; }
            .b2100-a0, .b2100-a1 { align-items: center; justify-content: center; }
            .b2100-a1 { display: flex; height: 24px; white-space: nowrap; width: 100%; }
            .b2100-a1 { display: flex; height: 24px; white-space: nowrap; width: 100%; }
            .b2100-a1.b2100-a2 { visibility: hidden; }
            .b2100-a1.b2100-a2 { visibility: hidden; }
            .b2100-a3 { align-items: center; inset: 0px; display: flex; justify-content: center; position: absolute; }
            .b2100-a4 { width: 100%; }
            .b2100-a4 { width: 100%; }
            .b2100-a2, .b2100-a5 { cursor: default; }
            .b2100-a6 .b2100-a1 { justify-content: space-between; }
            .b2100-a6 .b2100-a1 { justify-content: space-between; }
            .b2100-a7 { display: flex; flex-direction: column; overflow: hidden; }
            .b2100-a8 { display: block; }
            .b2100-a8 { display: block; }
            .b2100-a9 { margin-left: 8px; }
            .b2100-a8, .b2100-a9, .b2100-b { overflow: hidden; text-overflow: ellipsis; }
            .b2100-a8, .b2100-a9, .b2100-b { overflow: hidden; text-overflow: ellipsis; }
            .b2100-b0 { flex-shrink: 0; margin-right: 8px; }
            .b2100-b1 .b2100-a1 { height: 16px; }
            .b2100-b1 .b2100-a1 { height: 16px; }
            .b2100-b2.b2100-a6 { padding-right: 12px; }
            .b2100-b2 .b2100-a9.b2100-b3 { border-radius: 4px; padding: 4px 8px; }
            .b2100-b4.b2100-a6 { padding-right: 16px; }
            .b2100-b4 .b2100-a9.b2100-b3 { border-radius: 4px; padding: 8px 12px; }
            .b2100-b5 .b2100-b0 { color: rgba(245, 247, 250, 0.9); }
            .b2100-b5 .b2100-a9.b2100-b3 { background-color: rgba(255, 255, 255, 0.12); }
            .b2100-b5 .b2100-a { background-color: rgb(255, 255, 255); }
            .b2100-b6, .b2100-b6 .b2100-b0 { color: var(--cbPrimaryColor); }
            .b2100-b6 .b2100-a9.b2100-b3 { background-color: rgba(0, 150, 255, 0.08); }
            .b2100-b6 .b2100-a { background-color: var(--cbPrimaryColor); }
            .b2100-b7 .b2100-b0 { color: rgba(245, 247, 250, 0.9); }
            .b2100-b7 .b2100-a9.b2100-b3 { background-color: rgba(255, 255, 255, 0.16); }
            .b2100-b7 .b2100-a { background-color: rgb(255, 255, 255); }
            .b2100-b8, .b2100-b8 .b2100-b0 { color: rgb(241, 17, 126); }
            .b2100-b8 .b2100-a9.b2100-b3 { background-color: rgba(255, 121, 140, 0.08); }
            .b2100-b8 .b2100-a { background-color: rgb(241, 17, 126); }
            .b2100-b9, .b2100-b9 .b2100-b0 { color: rgb(245, 60, 20); }
            .b2100-b9 .b2100-a9.b2100-b3 { background-color: rgba(245, 60, 20, 0.06); }
            .b2100-b9 .b2100-a { background-color: rgb(245, 60, 20); }
            .b2100-a5 { background-color: rgba(0, 48, 120, 0.04); color: rgb(7, 7, 7); }
            .b2100-a5 .b2100-a8, .b2100-a5 .b2100-a9, .b2100-a5 .b2100-b, .b2100-a5 .b2100-b0 { opacity: 0.4; }
            .b2100-a5 .b2100-a8, .b2100-a5 .b2100-a9, .b2100-a5 .b2100-b, .b2100-a5 .b2100-b0 { opacity: 0.4; }
            .b2100-a5 .b2100-a8, .b2100-a5 .b2100-a9, .b2100-a5 .b2100-b, .b2100-a5 .b2100-b0 { opacity: 0.4; }
            .b2100-a5 .b2100-b0 { color: rgba(0, 26, 52, 0.4); }
            .b2100-a5 .b2100-b0 { color: rgba(0, 26, 52, 0.4); }
            .b2100-a5 .b2100-a9.b2100-b3 { background-color: rgba(7, 7, 7, 0.04); }
            .b2100-a5 .b2100-a { background-color: rgb(7, 7, 7); }
            .bq022-a { align-items: center; box-sizing: border-box; display: flex; width: 100%; word-break: break-word; }
            .bq022-a.bq022-a0 { display: inline; }
            .bq022-a.bq022-a1 { justify-content: center; text-align: center; }
            .bq022-a.bq022-a2 { justify-content: right; text-align: right; }
            .bq022-a3 { display: inline; flex-shrink: 0; margin-right: 4px; vertical-align: text-top; }
            .bq022-a4 { -webkit-box-orient: vertical; display: -webkit-box; overflow: hidden; text-overflow: ellipsis; }
            .bq022-a5 { -webkit-line-clamp: 1; word-break: break-all; min-height: auto !important; }
            .bq022-a6 { -webkit-line-clamp: 2; }
            .bq022-a7 { -webkit-line-clamp: 3; }
            .yc0_11 { background-repeat: no-repeat; height: 24px; width: 24px; }
            .y0c_11 { display: flex; min-width: 25%; }
            .cy1_11 { border-radius: 4px; display: inline-block; height: 24px; overflow: hidden; width: 24px; }
            .cy1_11:not(:last-child) { margin-right: 16px; }
            .cy1_11.c1y_11 { background-color: rgb(255, 255, 255); border-radius: 12px; height: 42px; position: relative; transition: background-color 0.2s; width: 42px; }
            .cy1_11.c1y_11 { background-color: rgb(255, 255, 255); border-radius: 12px; height: 42px; position: relative; transition: background-color 0.2s; width: 42px; }
            .cy1_11.c1y_11 .yc0_11 { left: 50%; position: absolute; top: 50%; transform: translate(-50%, -50%); transition: color 0.1s; color: rgb(7, 7, 7) !important; }
            .cy1_11.c1y_11 .yc0_11 { left: 50%; position: absolute; top: 50%; transform: translate(-50%, -50%); transition: color 0.1s; color: rgb(7, 7, 7) !important; }
            .cy1_11.c1y_11 .yc0_11 { left: 50%; position: absolute; top: 50%; transform: translate(-50%, -50%); transition: color 0.1s; color: rgb(7, 7, 7) !important; }
            .cy1_11.c1y_11:hover { background-color: var(--iconColor); }
            .cy1_11.c1y_11:hover { background-color: var(--iconColor); }
            .cy1_11.c1y_11:hover .yc0_11 { color: rgb(255, 255, 255) !important; }
            .cy1_11.c1y_11:hover .yc0_11 { color: rgb(255, 255, 255) !important; }
            .cy1_11.c1y_11:hover .yc0_11 { color: rgb(255, 255, 255) !important; }
            .cy1_11.yc1_11 { height: auto; }
            .w1c_11 { display: block; margin: 0px 0px 10px; }
            .jd5_11 { box-sizing: border-box; margin: 0px auto; max-width: 1280px; padding: 40px; width: 100%; }
            .j5d_11 { margin-right: 8px; transition: color 0.2s; }
            .dj6_11 { background-color: rgba(0, 48, 120, 0.04); border-radius: 12px; box-sizing: border-box; margin-bottom: 30px; padding: 20px 40px 20px 20px; }
            .d6j_11, .dj6_11 { display: flex; width: 100%; }
            .d6j_11, .dj6_11 { display: flex; width: 100%; }
            .d6j_11 { flex-wrap: wrap; gap: 55px; height: 24px; justify-content: flex-end; overflow: hidden; }
            .jd6_11 { align-items: center; color: rgb(7, 7, 7); display: flex; font-size: 16px; font-weight: 500; transition: color 0.2s; }
            .jd6_11:hover, .jd6_11:hover .j5d_11 { color: var(--cbPrimaryColor); }
            .jd6_11:hover, .jd6_11:hover .j5d_11 { color: var(--cbPrimaryColor); }
            .j6d_11 { flex-shrink: 0; margin-right: 50px; }
            .dj7_11 { width: 140px; }
            .d7j_11, .jd7_11 { display: flex; }
            .d7j_11, .jd7_11 { display: flex; }
            .jd7_11 { flex-direction: column; justify-content: space-between; width: 100%; }
            .j7d_11 { align-items: flex-end; display: flex; justify-content: flex-end; }
            .dj8_11 { color: rgba(0, 26, 52, 0.6); font-size: 12px; line-height: 16px; margin-bottom: 16px; margin-top: 24px; max-width: 272px; }
            .d8j_11 { margin-right: 40px; padding-top: 0px; min-width: auto !important; }
            .jd8_11 { color: rgb(153, 163, 174); }
            .j8d_11 { align-items: center; border: 1px solid rgba(0, 26, 52, 0.2); border-radius: 24px; box-sizing: border-box; display: flex; flex-direction: column; flex-shrink: 0; justify-content: center; margin-right: 60px; padding: 24px 23px; text-align: center; width: 300px; }
            .dj9_11 { border-radius: 16px; height: 190px; width: 190px; }
            .d9j_11 { color: rgba(0, 26, 52, 0.6); font-size: 16px; margin: 16px auto; max-width: 230px; }
            .jd9_11 { display: flex; gap: 16px; }
            .j9d_11 { border-radius: 12px; height: 42px; width: 42px; }
            .dk_11 { display: flex; justify-content: space-between; width: 100%; }
            .kd_11 { display: flex; flex-direction: column; width: 25%; }
            .dk0_11 { color: rgb(7, 7, 7); font-size: 16px; font-weight: 500; margin-bottom: 8px; }
            .d0k_11 { color: rgba(0, 26, 52, 0.6); font-size: 14px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
            .d0k_11:hover { color: var(--cbPrimaryColor); }
            .d0k_11:not(:last-child) { margin-bottom: 8px; }

    </style>
    <div class="jd5_11" >
        <div class="dj6_11" >
            <a target="_self" href="#" class="q4b012-a j6d_11" ><img loading="lazy" fetchpriority="low" src="/assets/sfera/img/logo/logo_dark.svg" alt="ClustBUY" crossorigin="anonymous" class="dj7_11 b9100-a" ></a>
            <div class="d6j_11" >


                <a target="_self" href="#" class="q4b012-a jd6_11" ><span class="jd8_11" style="color:;">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="j5d_11" >
					<path fill="currentColor" d="m21.867 15.127.244-.028a1 1 0 0 0 .889-.994V8a1 1 0 0 0-1-1h-3V6a5 5 0 0 0-5-5h-4a5 5 0 0 0-5 5v1H2a1 1 0 0 0-1 1v6.105a1 1 0 0 0 .889.994l.244.028.437 3.493A5 5 0 0 0 7.53 23h8.938a5 5 0 0 0 4.961-4.38zM7 6a3 3 0 0 1 3-3h4a3 3 0 0 1 3 3v2a1 1 0 0 0 1 1h3v4.211l-6 .67V13a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v.882l-6-.67V9h11a1 1 0 1 0 0-2H7zm4 9.01V14h2v2h-2zm-2 .884V17a1 1 0 0 0 1 1h4a1 1 0 0 0 1-1v-1.106l4.823-.539-.377 3.017A3 3 0 0 1 16.469 21H7.53a3 3 0 0 1-2.977-2.628l-.377-3.017z" ></path>
				</svg></span><span >Вакансии</span></a>

                <a target="_self" href="#" class="q4b012-a jd6_11" ><span class="jd8_11" style="color:;">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="j5d_11" >
					<path fill="currentColor" d="M8 2v1H6a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h12a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3h-2V2a1 1 0 1 0-2 0v1h-4V2a1 1 0 0 0-2 0M5 9V6a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V5h4v1a1 1 0 1 0 2 0V5h2a1 1 0 0 1 1 1v3zm0 2h14v7a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1z" ></path>
				</svg></span><span >События</span></a>

                <a target="_self" href="#" class="q4b012-a jd6_11" ><span class="jd8_11" style="color:;">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="j5d_11" >
					<path fill="currentColor" d="M11 3h6a5 5 0 0 1 3 9 7 7 0 0 0-7-7h-3a1 1 0 1 0 0 2h3a5 5 0 0 1 0 10h-3a1 1 0 0 0-.707.293L7 19.586v-1.669a1 1 0 0 0-.835-.986 5.002 5.002 0 0 1-.618-9.717 1 1 0 0 0 .667-.667A5 5 0 0 1 11 3m8.529 11.529A7.002 7.002 0 0 0 17 1h-6a7 7 0 0 0-6.529 4.471A7.002 7.002 0 0 0 5 18.71V22a1 1 0 0 0 1.707.707L10.414 19H13a7 7 0 0 0 6.529-4.471" ></path><path fill="currentColor" d="M7 12a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0" ></path>
				</svg></span><span >Поддержка</span></a>

            </div>
        </div>
        <div class="d7j_11" >

            <div class="jd7_11" >
                <div class="dk_11" >
                    <div class="kd_11" >
                        <span class="dk0_11" >ИЗДАТЕЛЬСТВО "ТВОРЧЕСКИЙ ЦЕНТР СФЕРА"</span>
                        <a title="Об издательстве" target="_self" href="#" class="q4b012-a d0k_11" >Об издательстве</a>

                    </div>

                    <div class="kd_11" >
                        <span class="dk0_11" >Покупателям</span>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Каталоги продукции</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Обучающие видео</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Оптовым клиентам</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Розничным покупателям</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Контакты</a>

                    </div>

                    <div class="kd_11" >
                        <span class="dk0_11" >Помощь</span>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Как купить</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Как оформить заказ</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Возврат</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Способы доставки</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Способы оплаты</a>
                        <a target="_self" href="#" class="q4b012-a d0k_11" >Обратная связь</a>

                    </div>
                </div>
                <div class="j7d_11" >
                    <div class="y0c_11 d8j_11" >

                        <a title="VK" target="_blank" href="#" rel="noopener" class="q4b012-a cy1_11 c1y_11" style="--icon-color: #4680C2; --iconColor: #4680C2;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="yc0_11" >
                                <path fill="currentColor" d="M3.406 3.406C2 4.812 2 7.075 2 11.6v.8c0 4.525 0 6.788 1.406 8.194S7.075 22 11.6 22h.8c4.525 0 6.788 0 8.194-1.406S22 16.925 22 12.4v-.8c0-4.525 0-6.788-1.406-8.194S16.925 2 12.4 2h-.8C7.075 2 4.812 2 3.406 3.406m1.969 4.677h2.283c.075 3.817 1.759 5.434 3.092 5.767V8.083h2.15v3.292c1.317-.142 2.7-1.642 3.167-3.292h2.15c-.359 2.034-1.859 3.534-2.925 4.15 1.066.5 2.775 1.809 3.425 4.175H16.35c-.508-1.583-1.775-2.808-3.45-2.975v2.975h-.258c-4.559 0-7.159-3.125-7.267-8.325" ></path>
                            </svg></a>

                        <a title="Одноклассники" target="_blank" href="#" rel="noopener" class="q4b012-a cy1_11 c1y_11" style="--icon-color: #fa8409; --iconColor: #fa8409;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="yc0_11" >
                                <path fill="currentColor" d="M11.953 12.329A5.42 5.42 0 0 1 8.21 10.82 5.07 5.07 0 0 1 6.651 7.2a5.13 5.13 0 0 1 1.553-3.648A5.48 5.48 0 0 1 11.953 2 5.5 5.5 0 0 1 14 2.395a5.3 5.3 0 0 1 1.73 1.13 5.1 5.1 0 0 1 1.144 1.69c.262.63.39 1.305.38 1.985a4.9 4.9 0 0 1-.385 1.973 5.1 5.1 0 0 1-1.148 1.672 5.3 5.3 0 0 1-1.73 1.11 5.4 5.4 0 0 1-2.038.373m0-7.266a2.25 2.25 0 0 0-1.589.65 2.1 2.1 0 0 0-.474.718 2.1 2.1 0 0 0-.146.84c-.005.279.05.555.16.812.111.258.275.49.482.684.207.193.453.344.722.442.27.098.557.141.845.128.285.006.57-.042.836-.143s.51-.25.715-.443c.205-.192.37-.422.482-.676.113-.254.173-.527.175-.804.01-.286-.04-.572-.146-.84a2.1 2.1 0 0 0-.474-.717 2.2 2.2 0 0 0-.726-.482 2.3 2.3 0 0 0-.862-.17m2.135 11.54 3.019 2.848c.14.136.251.297.327.474a1.42 1.42 0 0 1-.327 1.592c-.13.151-.294.273-.479.356a1.43 1.43 0 0 1-1.656-.356l-3.02-2.849-2.945 2.85a1.5 1.5 0 0 1-.505.326c-.19.073-.394.108-.599.1a1.8 1.8 0 0 1-1.104-.427 1.5 1.5 0 0 1-.328-.474 1.42 1.42 0 0 1 .328-1.591l3.092-2.85a15.6 15.6 0 0 1-3.166-1.353 1.56 1.56 0 0 1-.68-.934 1.5 1.5 0 0 1 .165-1.132c.112-.172.26-.32.433-.436a1.58 1.58 0 0 1 1.202-.233c.206.042.401.125.573.242a7.1 7.1 0 0 0 3.572.961 7.1 7.1 0 0 0 3.57-.961 1.58 1.58 0 0 1 1.2-.245c.206.04.402.12.576.236s.321.264.433.436c.21.335.28.734.198 1.117a1.55 1.55 0 0 1-.64.949 16.2 16.2 0 0 1-3.24 1.353" ></path>
                            </svg></a>

                        <a title="Telegram" target="_blank" href="#" rel="noopener" class="q4b012-a cy1_11 c1y_11" style="--icon-color: #2cb5f5; --iconColor: #2cb5f5;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="yc0_11" >
                                <path fill="currentColor" d="M3.375 10.888q8.054-3.387 10.74-4.466c5.114-2.053 6.177-2.41 6.87-2.422.152-.002.493.034.713.207a.74.74 0 0 1 .262.481c.025.139.055.454.031.7-.277 2.811-1.476 9.633-2.086 12.781-.259 1.333-.767 1.78-1.259 1.823-1.07.095-1.881-.682-2.917-1.338-1.621-1.025-2.537-1.664-4.11-2.665-1.818-1.156-.64-1.792.396-2.831.272-.272 4.984-4.41 5.075-4.785.011-.047.022-.221-.086-.314-.108-.092-.266-.06-.381-.036q-.244.054-7.768 4.957-1.102.73-1.997.712c-.658-.014-1.923-.359-2.863-.654-1.153-.362-2.07-.553-1.99-1.168q.062-.48 1.37-.982" ></path>
                            </svg></a>

                    </div>
                    <div >

                        <a target="_self" href="#" class="q4b012-a w1c_11 dj8_11" >
                            <div class="bq022-a" style="color:rgba(0, 26, 52, 0.6);">
                                <span class="tsBody400Large" >© 2025 Творческий Центр СФЕРА</span>
                            </div>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>
