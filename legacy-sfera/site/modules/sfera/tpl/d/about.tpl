<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta charset="utf-8">
		<title>О нас</title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="format-detection" content="telephone=no">
		<meta name="mobile-web-app-capable" content="yes">
		<link rel="stylesheet" type="text/css" href="/assets/css/libs.css">
		<link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css">
		<link rel="stylesheet" type="text/css" href="/assets/css/app.css">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

		<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->

		<style>
			html,
			body {
			height: 100%;
			}
			.wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100%;
			}
			.content {
			flex: 1 0 auto;
			}

			a.cart {
			width: 21px;
			height: 21px;
			background: url(/images/ico-cart.svg) no-repeat;
			background-size: 100% 100%;
			}
			.counter {
			position: absolute;
			top: 4px;
			right: -8px;
			border-radius: 16px;
			border: 2px solid #fff;
			height: 20px;
			min-width: 8px;
			padding: 0 4px;
			background: #ec5a1e;
			color: #fff;
			font: 11px/16px 'PT Sans Narrow',serif;
			text-align: center;
			}

			.header__search {
			padding-left: 15px;
			}

			@media only screen and (max-width: 940px) {
			.header__search {
			padding-left: 0;
			}
			}

			@media only screen and (max-width: 480px) {
			.header__search {
			display: none;
			position: absolute;
			top: 100%;
			left: 0;
			width: 100%;
			}
			}

			.header__search .search:before {
			display: none;
			}

			@media only screen and (max-width: 760px) {
			.header__search .search__input {
			padding-top: 7px;
			padding-bottom: 7px;
			}
			}

			@media only screen and (max-width: 480px) {
			.header__search .search__input {
			border-radius: 0;
			}
			}

			@media only screen and (max-width: 480px) {
			.header__search .search__submit {
			display: none;
			}
			}

			@media only screen and (max-width: 480px) {
			.header__search .search__close {
			display: block;
			}
			}

			.search .awesomplete > ul {
			border-top: 0;
			}

			.search .awesomplete > ul > li {
			text-decoration: none;
			padding: 0;
			border-bottom: 1px solid rgba(0, 0, 0, 0.3);
			}

			.search .awesomplete > ul > li:last-child {
			border-bottom: 0;
			}

			.product-ac {
			padding: 15px 10px;
			}

			.product-ac__inn {
			table-layout: fixed;
			}

			.product-ac__inn > * {
			vertical-align: top;
			}

			.product-ac__photo {
			width: 80px;
			padding-right: 20px;
			}

			@media only screen and (max-width: 640px) {
			.product-ac__photo {
			width: 50px;
			padding-right: 10px;
			}
			}

			.product-ac__img {
			display: inline-block;
			max-width: 100%;
			width: 100%;
			}

			.product-ac__name {
			max-width: 350px;
			font-size: 14px;
			-o-text-overflow: clip;
			text-overflow: clip;
			display: inline-block;
			white-space: normal;
			overflow: visible;
			line-height: 1.3;
			}

			@media only screen and (max-width: 640px) {
			.product-ac__name {
			font-size: 12px;
			}
			}

			.product-ac .price, .product-ac .bx-soa-cart-total-line-total .bx-soa-cart-d, .bx-soa-cart-total-line-total .product-ac .bx-soa-cart-d {
			display: block;
			font-size: 16px;
			}

			@media only screen and (max-width: 640px) {
			.product-ac .price, .product-ac .bx-soa-cart-total-line-total .bx-soa-cart-d, .bx-soa-cart-total-line-total .product-ac .bx-soa-cart-d {
			font-size: 14px;
			}
			}

			.item-grid__name, .product-ac__name {
			font-size: 16px;
			color: #2f2f2f;
			font-weight: 300;
			margin-bottom: 5px;
			-webkit-transition: all ease .3s;
			-o-transition: all ease .3s;
			transition: all ease .3s;
			display: inline-block;
			white-space: nowrap;
			overflow: hidden;
			-o-text-overflow: ellipsis;
			text-overflow: ellipsis;
			width: 100%;
			padding-left: 5px;
			}

			@media only screen and (max-width: 480px) {
			.item-grid__name, .product-ac__name {
			font-size: 16px;
			margin-bottom: 3px;
			}
			}

			.item-grid__name:hover, .product-ac__name:hover {
			color: #d22262;
			text-decoration: underline;
			}

			i.icon-user:before {
			width: 21px;
			content: " ";
			background: url(/assets/img/user-profile.svg) no-repeat;
			position: absolute;
			left: 0px;
			top: -2px;
			height: 17px;
			background-size: 100% 100%;
			}

			/*кастомные стили*/
			.p-about__title {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: 900;
			font-size: 25px;
			line-height: 30px;
			margin-bottom: 20px;									/* identical to box height, or 120% */
			color: #48BE7A;
			}

			.sub1 {

			margin-bottom: 36px;

			font-family: var(--mainFont);
			font-style: normal;
			font-weight: 500;
			font-size: 18px;
			line-height: 30px;
			/* or 167% */

			color: #4A484E;
			}

			.custom-p {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: 500;
			font-size: 21px;
			line-height: 30px;

			margin-bottom: 26px;

			color: #4A484E;

			}

			.green {
			color: #48BE7A;
			}

			.custom-t {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: bold;
			font-size: 18px;
			line-height: 28px;
			margin-bottom: 40px;
			}

			.custom-t p {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: normal;
			font-size: 18px;
			line-height: 28px;
			/* or 156% */
			margin-bottom: 14px;

			color: #4A484E;
			}

			.custom-img {
			vertical-align: top;
			}

			.custom-t-title {
			text-align: center;
			font-size: 25px;
			margin: 37px;
			}

			.d-flex {
			display: flex;
			flex-wrap: wrap;
			justify-content: space-around;
			margin-bottom: 70px;
			}

			.d-flex-center {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			margin-bottom: 70px;
			}

			.d-flex div {
			display: inline-block;
			max-width: 206px;
			margin-bottom: 40px;
			}

			.d-flex div img {
			border-radius: 2%;
			margin-bottom: 20px;
			}

			.d-flex div p {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: normal;
			font-size: 20px;
			line-height: 30px;
			/* identical to box height, or 120% */

			text-align: center;

			color: #4A484E;
			}

			.logo-glass {
			max-width: 36px;
			}

			.d-flex .text {

			padding: 20px;
			border: 1px solid black;
			display: inline-block;
			}

			.d-flex	.text p {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: normal;
			font-size: 14px;
			line-height: 25px;
			text-align: left;

			color: #4A484E;
			}

			.order-about {
			width: 213px;
			border: 1px solid #E3DFE1;
			border-radius: 6px;
			}

			.d-flex-center .order-about {
			margin: 0 1.1%;

			}

			.order-sellers .order-about {
			height: 270px;
			}

			.order-agents .order-about {
			height: 190px;
			margin-bottom: 2%;
			}

			.order-agents {
			margin: 0;
			}

			.d-flex	 .order-about p,
			.d-flex-center .order-about p {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: normal;
			font-size: 14px;
			line-height: 25px;
			/* or 179% */
			margin: 0 15px;
			text-align: center;

			color: #4A484E;
			}

			.d-flex	.numeral-div,
			.d-flex-center	.numeral-div {
			width: 213px;
			height: 50px;
			display: flex;
			align-items: center;
			text-align: center;
			justify-content: center;
			margin: 0;

			}

			.d-flex	.numeral,
			.d-flex-center	.numeral {
			display: inline;
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: 900;
			font-size: 18px;
			line-height: 25px;
			width: 36px;
			height: 25px;
			margin: 0;
			}

			.icons-div {
			max-width: 200px;
			margin: 69px auto;
			}

			.slogan-border {
			margin: 0 auto;
			width: 50px;
			border-top: 1px solid #c4c4c4;
			}

			.slogan {
			margin-top: 67px;
			margin-bottom: 115px;
			}

			#mission {
			margin: 0;
			}

			#photo {
			margin: 0;
			}

			#photo .d-flex {
			margin: 0;
			}

			.text-weight {
			margin-bottom: 21px;
			font-weight: 400;
			font-style: italic;
			}

			#services {
			margin-bottom: 49px;
			}

			#services .custom-height-1 .p-about__features-right .custom-t {
			margin: 0;
			}

			#services .custom-height-1 .d-flex {

			margin: 0;
			}

			#services > div:nth-child(3) > div.p-about__features-right > div.d-flex > div {
			margin: 0;
			}

			#blocks > div.d-flex.order-sellers {
			margin: 0;
			}

			#services > div:nth-child(2) > div.p-about__features-right > div.p-about__text.custom-t > p {
			font-family: var(--mainFont);
			font-style: normal;
			font-weight: 500;
			font-size: 18px;
			line-height: 30px;
			/* or 167% */

			color: #4A484E;
			}

			body > .up-btn {
			bottom: 100px;
			}
			@media only screen and (max-width: 320px) {
			body p,
			body div {
			text-align: center;

			}

			.logo_small {
			display: none;
			}
			#mission > div.p-about__features > div.p-about__features-right > div.p-about__text.custom-t > p:nth-child(1) {
			margin: 0;
			}

			.block {
			w: 30px;
			}
			}

			.content{
			padding-top: 30px;
			}
			}
			@media only screen and (max-width: 760px) {
			#mission:hover ~ .block {
			padding-top: 30px;
			}
			}

			.content {
			padding-top: 30px;
			}
			}
		</style>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {

				$("[data-toggle='location-dropdown']").click(function(e) {
					$(".location-dropdown").toggleClass("hidden");
					e.stopPropagation();
				});

			});
		</script>
	</head>

	<body>
		<div class="loader">
			<div class="loader__inn">
				<img alt="" src="/assets/img/loader.svg" style="width:120px;">
				</div>
			</div>
		<div class="m-nav js-m-nav">
			<div class="m-nav__group">
				<a href="#login" class="m-nav__link m-nav__link--icon"><i  class="icon-user "></i>Авторизация</a>
		</div>
			<div class="m-nav__group">
				<a href="#" class="m-nav__link m-nav__location js-location-select-toggle"> <span>Город:</span> Москва </a>
			</div>
			<div class="m-nav__group">
				~~include file='market/tpl/m-nav__catalog.tpl'~
			</div>

		</div>
		<div class="location-select js-location-select">
			<div class="l-wrapper">
				<div class="location-select__inn">
					<div class="location-select__header js-location-header">
						<div class="title h1">
							Выберите ваш город
						</div>
						<div class="location-select__search">
							<form autocomplete="off" class="search">
								<input type="text" class="search__input" placeholder="Введите область, регион или населенный пункт">
							</form>
						</div>
						<a href="#" class="location-select__close close-btn js-location-close">Закрыть</a>
					</div>
					<div class="location-select__block js-custom-scroll js-location-list">
						<div class="location-select__cells">
							<ul class="location-select__list">
								<li>
									<a class="location-select__link location-select__link--bold" href="#">Москва</a>
								</li>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="fast-view js-fast-view">
			<div class="fast-view__inn">
				<div class="fast-view__container">
					<div class="fast-view__prev">
						<a href="#" class="fast-view__item js-fast-view-prev">
						<div class="fast-view__item-inn">
							<div class="title h2">
								Сумка David Jones
							</div>
							<div class="fast-view__item-img">
								<img src="https://www.poobienaidoos.co.za/wp-content/uploads/2017/04/BA5335-657-1.jpg">
							</div>
						</div> </a>
					</div>
					<a href="#" class="close-btn fast-view__close js-fast-view-close"><span>Закрыть</span></a>
					<div class="fast-view__block">
						<div class="fast-view__header">
							<div class="fast-view__title">
								<div class="title h2">
									Сумка Nike
								</div>
							</div>
							<div class="fast-view__soc">
								<a data-toggle=".js-fast-view-soc" href="#" class="js-toggle"> <i  class="ticon ticon-share "></i> </a>
								<ul class="soc-share js-fast-view-soc">
									<li class="soc-share__item">
										<a href="#" class="soc-share__link soc-share__link--fill soc-share__link--vk"><span>0</span></a>
									</li>
									<li class="soc-share__item">
										<a href="#" class="soc-share__link soc-share__link--fill soc-share__link--fb"><span>234</span></a>
									</li>
									<li class="soc-share__item">
										<a href="#" class="soc-share__link soc-share__link--fill soc-share__link--tw"><span>18</span></a>
									</li>
									<li class="soc-share__item">
										<a href="#" class="soc-share__link soc-share__link--fill soc-share__link--inst"><span>385</span></a>
									</li>
								</ul>
							</div>
						</div>
						<div class="fast-view__main">
							<div class="fast-view__main-left">
								<div class="rate">
									<div class="rate__inn">
										<div class="rate__stars r1">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="rate__count">
											(12)
										</div>
									</div>
								</div>
								<div class="fast-view__gallery">
									<div data-size="big" data-theme="discount" title="Успей купить!" class="item-badge item-badge--discount js-tooltip"></div>
									<div class="item-gallery">
										<div class="item-gallery__carousel carousel">
											<div>
												<div class="swiper-container js-item-gallery">
													<div class="swiper-wrapper">
														<div class="swiper-slide"><img data-zoom-image="https://media2.24aul.ru/imgs/58e24830231ede5c4c69cdac/sumka-sportivnayadorozhnayadlya-trenirovok-nike-1-9403732.jpg" src="https://media2.24aul.ru/imgs/58e24830231ede5c4c69cdac/sumka-sportivnayadorozhnayadlya-trenirovok-nike-1-9403732.jpg">
														</div>
														<div class="swiper-slide"><img data-zoom-image="https://www.poobienaidoos.co.za/wp-content/uploads/2017/04/BA5335-657-1.jpg" src="https://www.poobienaidoos.co.za/wp-content/uploads/2017/04/BA5335-657-1.jpg">
														</div>
														<div class="swiper-slide"><img data-zoom-image="http://www.zappos.com/images/z/3/1/7/1/6/6/3171661-p-4x.jpg" src="http://www.zappos.com/images/z/3/1/7/1/6/6/3171661-p-4x.jpg">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="item-gallery__thumbs">
											<div class="swiper-container js-item-gallery-thumbs">
												<div class="swiper-wrapper">
													<div class="swiper-slide"><img src="https://media2.24aul.ru/imgs/58e24830231ede5c4c69cdac/sumka-sportivnayadorozhnayadlya-trenirovok-nike-1-9403732.jpg">
													</div>
													<div class="swiper-slide"><img src="https://www.poobienaidoos.co.za/wp-content/uploads/2017/04/BA5335-657-1.jpg">
													</div>
													<div class="swiper-slide"><img src="http://www.zappos.com/images/z/3/1/7/1/6/6/3171661-p-4x.jpg">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="fast-view__main-right">
								<div class="item-meta">
									<div class="item-meta__inn">
										<div class="item-meta__group">
											<div class="item-meta__prices">
												<span class="price price--hot">99 999 р.</span><span class="price price--old">120 000 р.</span>
											</div>
											<div class="item-meta__actions">
												<div class="item-meta__actions-inn">
													<div class="item-meta__actions-cart">
														<a href="#" class="btn btn--vinous item-meta__cart"> <i  class="ticon ticon-cart "></i> Добавить в корзину</a>
													</div>
													<div class="item-meta__actions-fav">
														<a href="#" class="btn btn--icon btn--vinous btn--outline item-meta__fav"> <i  class="ticon ticon-favorite "></i> </a>
													</div>
												</div>
											</div>
											<div class="item-meta__links">
												<div class="item-meta__links-inn">
													<div class="item-meta__links-click">
														<a href="#" class="link"><span>Оформить в 1 клик</span></a>
													</div>
													<div class="item-meta__links-delivery">
														<a href="#" class="link"> <i  class="ticon ticon-truck "></i> <span>Бесплатная доставка при 1 покупке</span></a>
													</div>
												</div>
											</div>
											<div class="item-meta__sizes">
												<span class="item-meta__label">Размер</span>
												<div class="item-meta__sizes-inn">
													<div class="item-meta__sizes-action">
														<div class="size-switchers">
															<div class="size-switchers__inn">
																<label class="size-switchers__label">
																	<input type="radio" name="size" value="S">
																	<span class="size-switchers__item">S</span> </label><label class="size-switchers__label">
																	<input type="radio" name="size" value="M">
																	<span class="size-switchers__item">M</span> </label><label class="size-switchers__label">
																	<input type="radio" name="size" value="L">
																	<span class="size-switchers__item">L</span> </label><label class="size-switchers__label">
																	<input type="radio" name="size" value="X">
																	<span class="size-switchers__item">X</span> </label><label class="size-switchers__label">
																	<input type="radio" name="size" value="XL">
																	<span class="size-switchers__item">XL</span> </label>
															</div>
														</div>
													</div>
													<div class="item-meta__sizes-help">
														<a class="link" href="#"><span>Таблица размеров</span></a>
													</div>
												</div>
											</div>
										</div>
										<div class="item-meta__group">
											<div class="item-meta__colors">
												<div class="item-meta__label">
													Цвет
												</div>
												<div class="color-switchers">
													<div class="color-switchers__inn">
														<label class="color-switchers__label">
															<input type="radio" name="color" value="#ff343d">
															<span style="background: #ff343d;" class="color-switchers__item">#ff343d</span> </label><label class="color-switchers__label">
															<input type="radio" name="color" value="#1f1f1f">
															<span style="background: #1f1f1f;" class="color-switchers__item">#1f1f1f</span> </label><label class="color-switchers__label">
															<input type="radio" name="color" value="#444fdd">
															<span style="background: #444fdd;" class="color-switchers__item">#444fdd</span> </label><label class="color-switchers__label">
															<input type="radio" name="color" value="#eaeaea">
															<span style="background: #eaeaea;" class="color-switchers__item">#eaeaea</span> </label>
													</div>
												</div>
											</div>
										</div>
										<div class="item-meta__group">
											<div class="desc-tabs js-tabs">
												<ul class="desc-tabs__menu">
													<li data-el="bar" class="desc-tabs__bar"></li>
													<li class="desc-tabs__item is-active">
														<a data-el="tab" href="#desc_tab_1" class="desc-tabs__link">Описание</a>
													</li>
													<li class="desc-tabs__item">
														<a data-el="tab" href="#desc_tab_2" class="desc-tabs__link">Характеристики</a>
													</li>
													<li class="desc-tabs__item">
														<a data-el="tab" href="#desc_tab_2" class="desc-tabs__link">Доставка</a>
													</li>
												</ul>
												<div class="desc-tabs__content">
													<div data-el="pane" id="desc_tab_1" class="desc-tabs__pane is-active">
														<div class="text">
															<p>
																Сумка-дафл Nike Brasilia (средний размер) выполнена из невероятно прочной ткани для переноски спортивной экипировки. Внутренние карманы помогают держать вещи в порядке, а отделение для обуви позволяет хранить влажную экипировку
																отдельно от сухой. Прочная водонепроницаемая ткань дна защищает экипировку от влаги. Вместительное и универсальное основное отделение.
															</p>
														</div>
													</div>
													<div data-el="pane" id="desc_tab_2" class="desc-tabs__pane">
														<div class="text">
															<p>

															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="fast-view__related">
							<div class="items">
								<div class="items__header">
									<div class="items__title">
										<div class="title h2">
											Похожие товары
										</div>
									</div>
								</div>
								<div class="items__list">
									<div class="items__cell">
										<div class="item-grid  js-item  js-item-grid item-grid--simple">
											<div class="item-grid__inn">
												<div class="item-grid__photo">
													<a href="#"><img alt="David Jones" class="item-grid__img js-item-main-img" src="/assets/img/items/1.png"></a>
												</div>
												<a href="#" class="item-grid__name">David Jones</a>
												<div class="item-grid__category">
													Сумка дорожная
												</div>
												<div class="item-grid__actions">
													<div class="item-grid__actions-left">
														<span class="price">9 000 р.</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="items__cell">
										<div class="item-grid  js-item  js-item-grid item-grid--simple">
											<div data-size="big" data-theme="discount" title="Успей купить!" class="item-badge item-badge--discount js-tooltip"></div>
											<div class="item-grid__inn">
												<div class="item-grid__photo">
													<a href="#"><img alt="Casio" class="item-grid__img js-item-main-img" src="/assets/img/items/2.png"></a>
												</div>
												<a href="#" class="item-grid__name">Casio</a>
												<div class="item-grid__category">
													Часы
												</div>
												<div class="item-grid__actions">
													<div class="item-grid__actions-left">
														<span class="price price--hot">4 990 р.</span><span class="price price--old">46 900 р.</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="items__cell">
										<div class="item-grid  js-item  js-item-grid item-grid--simple">
											<div class="item-grid__inn">
												<div class="item-grid__photo">
													<a href="#"><img alt="Salomon" class="item-grid__img js-item-main-img" src="/assets/img/items/3.png"></a>
												</div>
												<a href="#" class="item-grid__name">Salomon</a>
												<div class="item-grid__category">
													Сумка поясная
												</div>
												<div class="item-grid__actions">
													<div class="item-grid__actions-left">
														<span class="price">3 500 р.</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="items__cell">
										<div class="item-grid  js-item  js-item-grid item-grid--simple">
											<div data-size="big" data-theme="new" title="Новое поступление!" class="item-badge item-badge--new js-tooltip"></div>
											<div class="item-grid__inn">
												<div class="item-grid__photo">
													<a href="#"><img alt="Coccinelle" class="item-grid__img js-item-main-img" src="/assets/img/items/4.png"></a>
												</div>
												<a href="#" class="item-grid__name">Coccinelle</a>
												<div class="item-grid__category">
													Сумка
												</div>
												<div class="item-grid__actions">
													<div class="item-grid__actions-left">
														<span class="price">45 000 р.</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="fast-view__next">
						<a href="#" class="fast-view__item js-fast-view-next">
						<div class="fast-view__item-inn">
							<div class="title h2">
								Сумка David Jones
							</div>
							<div class="fast-view__item-img">
								<img src="https://www.poobienaidoos.co.za/wp-content/uploads/2017/04/BA5335-657-1.jpg">
							</div>
						</div> </a>
					</div>
				</div>
			</div>
		</div>

		<div class="modal remodal md-login" data-remodal-id="login">
			<button class="modal__close close-btn" data-remodal-action="close">
				Закрыть
			</button>
			<div class="login-tabs js-tabs">
				<!-- <ul class="login-tabs__menu">
				<li class="login-tabs__item is-active">
				<a data-el="tab" href="#login_tab" class="login-tabs__link"><span>Я уже тут</span></a>
				</li>
				<li class="login-tabs__item">
				<a data-el="tab" href="#register_tab" class="login-tabs__link"><span>Хочу к вам</span></a>
				</li>
				</ul> -->
				<div class="login-tabs__panes">
					<!-- <div data-el="pane" id="login_tab" class="login-tabs__pane">
					<div class="md-login__social">
					<a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
					href="#"></a>
					</div>
					<div class="md-login__or">
					или
					</div>
					<form autocomplete="off" class="md-login__form">
					<div class="form-row">
					<div class="complex-input complex-input--icon js-complex-input">
					<label class="complex-input__label">E-mail</label>
					<div class="complex-input__icon">
					<i class="ticon ticon-user-1 "></i>
					</div>
					<div class="complex-input__input">
					<input type="email" class="input">
					</div>
					</div>
					</div>
					<div class="form-row">
					<div class="complex-input complex-input--icon password-input js-complex-input">
					<label class="complex-input__label">Пароль</label>
					<div class="complex-input__icon">
					<i class="ticon ticon-lock "></i>
					</div>
					<div class="complex-input__input">
					<input type="password" class="input js-toggle-password">
					</div>
					<div class="password-input__block">
					<div class="password-input__forgot">
					<a href="#">Забыли пароль?</a>
					</div>
					<a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn"><i></i></a>
					</div>
					</div>
					</div>
					<div class="form-row">
					<button type="submit" class="btn btn--pink btn--lg">
					<i style="font-size: 19px;" class="ticon ticon-key "></i>
					Войти
					</button>
					</div>
					</form>
					</div> -->
					<div data-el="pane" id="register_tab" class="login-tabs__pane is-active">
						<!-- <div class="md-login__social">
						<a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
						href="#"></a>
						</div>
						<div class="md-login__or">
						или
						</div> -->
						<form autocomplete="off" class="md-login__form js-example-form">
							<!-- <div class="form-row">

							<div class="complex-input complex-input--icon is-valid js-complex-input">
							<label class="complex-input__label">E-mail</label>
							<div class="complex-input__icon">
							<i class="ticon ticon-user-1 "></i>
							</div>
							<div class="complex-input__input">
							<input type="email" class="input">
							</div>
							</div>
							<label class="switcher ">
							<div class="switcher__inn">
							<div class="switcher__toggle">
							<input  type="checkbox" class="js-switchery ">
							</div>
							<div class="switcher__label">
							Подписаться на новости
							</div>
							</div> </label>
							</div> -->
							<!-- <div class="form-row">
							<div class="complex-input js-complex-input">
							<label class="complex-input__label">Фамилия</label>
							<div class="complex-input__input">
							<input data-error="Введите фамилию на русском языке" type="text" class="input" name="second_name">
							</div>
							</div>
							</div> -->
							<!-- <div class="form-row">
							<div class="complex-input js-complex-input">
							<label class="complex-input__label">Имя</label>
							<div class="complex-input__input">
							<input type="text" class="input">
							</div>
							</div>
							</div> -->
							<!-- <div class="form-row">
							<div class="gender-select">
							<div class="gender-select__inn">
							<div class="gender-select__label">
							Пол:
							</div>
							<div class="gender-select__item">
							<label class="gender-select__checkbox">
							<input type="radio" name="gender" value="man">
							<span class="gender-select__checkbox-item"> <i  class="ticon ticon-man "></i> </span> </label>
							</div>
							<div class="gender-select__item">
							<label class="gender-select__checkbox">
							<input type="radio" name="gender" value="woman">
							<span class="gender-select__checkbox-item"> <i  class="ticon ticon-woman "></i> </span> </label>
							</div>
							</div>
							</div>
							</div> -->
							<!-- <div class="form-row">
							<div class="row">
							<div class="col-sm-3">
							<select data-placeholder="День" class="select">
							<option></option>

							<option>1</option>

							</select>
							</div>
							<div class="col-sm-5">
							<select data-placeholder="Месяц" class="select">
							<option></option>

							<option>Январь</option>

							</select>
							</div>
							<div class="col-sm-4">
							<select data-placeholder="Год" class="select">
							<option></option>

							<option>1900</option>

							</select>
							</div>
							</div>
							</div> -->
							<div class="form-row">

								<div class="input-row text-reg">
									ИНН
								</div>
								<div class="input-row">

									<div class="input-row__cell input-row__cell--border-left ">
										<input type="text" id="inn" class="input js-inn-mask" placeholder="___-___-___-___">
									</div>
								</div>

							</div>

							<div class="form-row">
								<div class="input-row text-reg">
									Телефон
								</div>
								<div class="input-row">
									<div class="input-row__cell input-row__icon">
										+7
									</div>
									<!-- <div class="input-row__cell input-row__cell--border text-center" style="width: 80px;">
									<select class="select">

									<option>+7</option>

									</select>
									</div> -->

									<div class="input-row__cell">
										<input type="text" class="input js-phone-mask" placeholder="(___) ___-__-__">
									</div>
								</div>

							</div>
							<div class="form-row">
								<button type="submit" class="btn btn--pink btn--lg">
									Зарегистрироваться
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<a href="#" class="up-btn js-up-btn">Наверх</a>
		<div class="l-main js-main">
			<header class="header js-header">
				<div class="header__inn">

<div class="header__wrapper">
  <div class="l-wrapper">
    <div class="header__row">
      <div class="header__nav-toggle">
        <a href="#" class="hamburger hamburger--spin js-nav-toggle"><span>Каталог</span></a>
      </div>
      	<div class="header__logo-mobile">
			<a href="/">
			<div class="logo logo--no-icon">
				<div class="logo__inn">
				<div class="logo__text"><img alt="" src="/assets/img/logo-text.svg">
				</div>
				</div>
			</div> </a>
		</div>
		<div class="header__logo">
			<a href="/">
			<div class="header__logo-default">
				<div class="logo ">
				<div class="logo__inn">
					<div class="logo__icon">
					<img alt="ru.market" src="/assets/img/logo-small.svg"  style="width:62px;">
					</div>
					<div class="logo__text"><img alt="ru.market" src="/assets/img/logo-text.svg" style="height:38`px;">
					</div>
				</div>
				</div>
			</div>
			<div class="header__logo-small">
				<div class="logo logo--sm">
				<div class="logo__inn">
					<div class="logo__icon">
					<img alt="ru.market" src="/assets/img/logo-small.svg">
					</div>
					<div class="logo__text"><img alt="ru.market" src="/assets/img/logo-text.svg">
					</div>
				</div>
				</div>
			</div> </a>
		</div>

      <div class="header__search js-search">
        <form autocomplete="off" class="search">
          <input type="text" class="search__input" placeholder="Поиск товара или бренда">
          <button type="submit" class="search__submit"></button>
          <a href="#" class="search__close js-search-close"></a>
        </form>
      </div>
      <div class="header__btn header__srch">
        <a class="js-search-toggle" href="#"> <i  class="ticon ticon-loupe "></i> </a>
      </div>

      <div class="header__btn header__cart dropdown">
        	<a href="/cart/" class="cart to_cart"></a><span class="counter total_cart_amount" data-bind="text: total_cart_amount">39</span>
        <div class="dropdown__block cart-dropdown">
          <div class="cart-dropdown__items">
            <div class="item-cart">
              <div class="item-cart__inn">
                <div class="item-cart__photo">
                  <div class="item-cart__img">
                    <a href="#"><img src="/assets/img/items/1.png"></a>
                  </div>
                </div>
                <div class="item-cart__info">
                  <a href="#" class="item-cart__name">David Jones</a><span class="item-cart__price price">9 000 р.</span>
                </div>
                <div class="item-cart__remove">
                  <a href="#" class="remove-btn js-item-remove"><i></i></a>
                </div>
              </div>
            </div>
            <div class="item-cart">
              <div class="item-cart__inn">
                <div class="item-cart__photo">
                  <div class="item-cart__img">
                    <a href="#"><img src="/assets/img/items/2.png"></a>
                  </div>
                </div>
                <div class="item-cart__info">
                  <a href="#" class="item-cart__name">Casio</a><span class="item-cart__price price">4 990 р.</span>
                </div>
                <div class="item-cart__remove">
                  <a href="#" class="remove-btn js-item-remove"><i></i></a>
                </div>
              </div>
            </div>
            <div class="item-cart">
              <div class="item-cart__inn">
                <div class="item-cart__photo">
                  <div class="item-cart__img">
                    <a href="#"><img src="/assets/img/items/3.png"></a>
                  </div>
                </div>
                <div class="item-cart__info">
                  <a href="#" class="item-cart__name">Salomon</a><span class="item-cart__price price">3 500 р.</span>
                </div>
                <div class="item-cart__remove">
                  <a href="#" class="remove-btn js-item-remove"><i></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="cart-dropdown__footer">
            <div class="cart-dropdown__total">
              Итого: 9 999 р.
            </div>
            <a href="#" class="cart-dropdown__btn btn btn--pink">Перейти в корзину</a>
          </div>
        </div>
      </div>
      <div class="header__btn header__cabinet dropdown">
        <a class="js-dropdown-toggle" href="#"> <i  class="ticon ticon-user "></i> </a>
        <div class="dropdown__block cabinet-dropdown">
          <div class="cabinet-dropdown__login">
            <a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a><a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>

~~*
<nav class="nav js-nav">
  <div class="l-wrapper">
    <div class="nav__bar js-nav-bar"></div>
    <ul class="nav__list">
      <li class="nav__item js-catalog-toggle">
        <a class="nav__link nav__link--sub" href="#"><span>Сумки</span></a>
      </li>

    </ul>
  </div>
</nav>
*~

<div class="catalog js-catalog">
  <div class="catalog__inn">
    <div class="l-wrapper">
      <div class="catalog__content">
        <a href="#" class="catalog__close close-btn js-catalog-close">Закрыть</a>
        <div class="catalog__title">
          Женские часы
        </div>
        <div class="catalog__content-inn">
          <div class="catalog__categories">
            <ul class="categories-menu">
              <li class="categories-menu__item">
                <div class="categories-menu__item-inn">
                  <a href="#" class="categories-menu__link">Клатчи</a>
                  <div class="categories-menu__count">
                    99
                  </div>
                </div>
              </li>

              <li class="categories-menu__item categories-menu__item--sub">
                <div class="categories-menu__item-inn">
                  <a href="#" class="categories-menu__link">Рюкзаки и мешки</a>
                  <div class="categories-menu__count">
                    99
                  </div>
                </div>
                <ul class="categories-menu__sub">
                  <li class="categories-menu__item">
                    <div class="categories-menu__item-inn">
                      <a href="#" class="categories-menu__link">Мешки для обуви</a>
                      <div class="categories-menu__count">
                        99
                      </div>
                    </div>
                  </li>

                </ul>
              </li>
              <li class="categories-menu__item categories-menu__item--sub">
                <div class="categories-menu__item-inn">
                  <a href="#" class="categories-menu__link">Саквояжи и дорожные сумки</a>
                  <div class="categories-menu__count">
                    99
                  </div>
                </div>
                <ul class="categories-menu__sub">
                  <li class="categories-menu__item">
                    <div class="categories-menu__item-inn">
                      <a href="#" class="categories-menu__link">Дорожные сумки</a>
                      <div class="categories-menu__count">
                        99
                      </div>
                    </div>
                  </li>

                </ul>
              </li>
              <li class="categories-menu__item">
                <div class="categories-menu__item-inn">
                  <a href="#" class="categories-menu__link">Сумочки</a>
                  <div class="categories-menu__count">
                    99
                  </div>
                </div>
              </li>

            </ul>
          </div>
          <div class="catalog__brands">
            <ul class="categories-menu">
              <li class="categories-menu__title">
                Бренды
              </li>
              <li class="categories-menu__item">
                <a href="#" class="categories-menu__link">Adidas</a>
                <div class="categories-menu__count">
                  99
                </div>
              </li>

              <li class="categories-menu__item">
                <a href="#" class="categories-menu__link categories-menu__link--more">Все бренды</a>
              </li>
            </ul>
          </div>
          <div class="catalog__best">
            <div class="hot-items">
              <div class="hot-items__inn">
                <div class="hot-items__header">
                  <div class="hot-items__title">
                    Лучшее предложение
                  </div>
                </div>
                <div class="item-hot js-item">
                  <div class="item-hot__inn">
                    <div class="item-hot__photo">
                      <a href="#"><img alt="Jennyfer" class="item-hot__img js-item-main-img" src="/assets/img/items/6.png"></a>
                    </div>
                    <div class="item-hot__info">
                      <a href="#" class="item-hot__name">Jennyfer</a><span class="item-hot__category">Ремень</span>
                      <div class="item-hot__prices item-hot__prices--inline">
                        <div class="item-hot__prices-new">
                          <span class="price price--hot">120 000 р.</span>
                        </div>
                        <div class="item-hot__prices-old">
                          <span class="price price--old">999 999 руб.</span>
                        </div>
                      </div>
                      <div class="item-hot__actions">
                        <div>
                          <a href="#" class="cart-btn js-cart-add "></a>
                        </div>
                        <div>
                          <a href="#" class="fav-btn js-fav-add "></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

				</div>
			</header>
			<div class="l-content">
				<div class="l-wrapper">

					<div class="main-carousel carousel">
						<div class="swiper-container js-index-carousel">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="main-carousel__item"><img src="/images/about/bg.png">
									</div>
								</div>
								<!--span>Станьте поставщиком для крупных предприятий по всей стране</span--> 
							</div>
						</div>
						<div class="main-carousel__indicator js-index-carousel-indicator">
							<span></span>
						</div>
					</div>

					<div class="p-about">
						<div class="p-about__inn">
							<div class="p-about__left">

								~~*
								<section id="mission" class="p-about__section">
									<div class="container block"></div>
									<div class="p-about__title">
										Ru.MARKET <span class="logo_small">-</span>
									</div>
									<div class="p-about__sub sub1" >
										Интернет - платформа товаров и услуг, которая берет на себя задачу привлечения клиентов, высвобождая продавцу время на качественное обслуживание. В планах подключить около 2 000 товарно-сервисных предприятий.
										Сотрудничество с разработанной силами МТПП онлайн-платформой “Бизнес - маркет”.
									</div>

									<div class="p-about__features">
										<div class="p-about__features-left custom-img">
											<svg width="48" height="35" viewBox="0 0 48 35" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" clip-rule="evenodd" d="M0 16.6807V15.6233C0.026387 15.6233 0.184709 14.4337 0.211096 14.3015C0.290257 13.905 0.448579 13.4292 0.580514 13.0855C0.949932 12.266 1.24019 11.7373 1.76793 11.0764C2.77063 9.88686 3.95805 9.0145 5.43572 8.24789C8.15358 6.87326 12.2963 6.02734 16.5183 6.02734H16.8877C21.2415 6.02734 24.8302 6.71465 28.2341 7.58701C29.1576 7.82493 29.8701 8.06284 30.7145 8.32719C31.4005 8.53867 32.4296 8.88233 33.0629 9.17311C33.8017 9.51677 34.5406 9.80755 35.2794 10.1248C35.6488 10.3098 37.1265 11.1557 37.3904 11.2086V12.081C37.0473 12.0017 35.8335 11.3937 35.3849 11.2086C34.7253 10.9707 33.9073 10.5742 33.274 10.3891C32.9837 10.3098 32.4824 10.1512 32.1921 10.0455C31.8491 9.88686 31.4797 9.80755 31.0839 9.70181C30.3714 9.4639 29.5798 9.22598 28.8146 9.04094C27.1786 8.67085 25.7273 8.35363 23.933 8.06284C22.4026 7.82493 20.2652 7.56058 18.5501 7.56058H16.7557C13.2727 7.56058 9.49932 8.30076 7.25642 9.4639C5.91068 10.1512 4.98714 10.7328 4.0636 11.8166C3.35115 12.6361 2.48038 14.2486 2.48038 15.7026V16.337C2.48038 17.8438 3.32476 19.4828 4.03721 20.3816C4.48579 20.9103 4.90798 21.3861 5.43572 21.8355C5.69959 22.047 6.91339 22.9193 7.20365 22.9986V25.4042C6.64952 25.3513 4.96075 24.3733 4.51217 24.056C3.72057 23.5273 3.00812 22.8929 2.40122 22.1791C1.68877 21.3597 1.31935 20.7781 0.817997 19.7736C0.606901 19.3242 0.474966 18.8748 0.290257 18.3725C0.237483 18.161 0 16.7071 0 16.6807Z" fill="#48BE7A"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M15.6477 10.5479H31.8492C32.1395 10.5479 32.3506 10.7593 32.377 11.0501L34.0394 27.6778C34.0658 27.9686 33.9338 28.1536 33.6436 28.1536L14.1436 28.0743C13.8797 28.0743 13.7742 27.8099 13.8006 27.5192L15.1463 11.0501C15.1727 10.7593 15.3838 10.5479 15.6477 10.5479Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M23.8538 4.01855C27.2313 4.01855 29.9756 8.2746 29.9756 13.5087C29.9756 14.011 30.1603 14.5397 29.8964 14.9627C29.4742 15.7293 28.6035 15.65 28.6562 14.8569C29.1048 8.61825 26.1495 5.15526 23.8274 5.15526C21.4526 5.15526 18.7084 8.40677 19.025 14.8834C19.0514 15.6235 18.2334 15.6235 17.8112 14.9362C17.5473 14.5397 17.732 13.9846 17.732 13.5087C17.732 8.2746 20.4763 4.01855 23.8538 4.01855Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M47.7606 23.0252V24.1883C47.7606 26.2767 46.8634 28.1007 45.9663 29.3432C44.9372 30.7707 43.5651 31.6166 42.0082 32.5154C40.768 33.2291 38.2613 34.0222 36.5725 34.3394C34.4879 34.7095 32.4034 35.0003 29.8966 35.0003H28.6564C20.9778 35.0003 13.1408 32.9383 8.12732 30.5063V27.1755C9.47306 27.8364 11.1618 28.7087 12.7187 29.1581C13.0617 29.2374 13.5894 29.4489 13.9325 29.5811C14.381 29.7133 14.8032 29.819 15.2254 29.9776C15.8587 30.1891 17.1517 30.5063 17.8641 30.6649C18.7613 30.85 19.632 31.0614 20.6084 31.2465C21.5847 31.4315 22.4818 31.5373 23.5109 31.6959C24.4609 31.8545 25.5691 31.9074 26.5982 31.9602C27.6537 32.0395 28.7356 32.066 29.8966 32.066H30.1341C34.2241 32.066 38.1029 31.4844 40.8208 30.242C43.4595 29.0259 45.8871 26.779 45.8871 23.2102V22.893C45.8871 21.2012 45.333 19.9059 44.8052 18.6898C44.5678 18.1611 44.1456 17.4738 43.8025 16.998C43.5914 16.7072 43.4331 16.5222 43.1956 16.2314C43.0109 15.9935 42.6943 15.7291 42.5623 15.5176V14.3545C43.1956 14.751 43.8553 15.5176 44.383 16.0199C44.9899 16.6015 45.4649 17.2623 45.9663 17.9497C46.7051 18.9806 47.7606 21.3598 47.7606 23.0252Z" fill="#48BE7A"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M8.65466 10.4951L8.94491 11.3939H9.92123L9.12962 11.9755L9.44627 12.8743L8.65466 12.3191L7.86305 12.8743L8.1533 11.9755L7.36169 11.3939H8.33801L8.65466 10.4951Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M40.1347 11.9746L40.4513 12.847H41.5068L40.6624 13.4021L40.9791 14.3009L40.1347 13.7458L39.2903 14.3009L39.607 13.4021L38.7626 12.847H39.8181L40.1347 11.9746Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M23.7217 0L24.0119 0.872357H24.9882L24.1966 1.42749L24.5133 2.29985L23.7217 1.77115L22.9301 2.29985L23.2203 1.42749L22.4287 0.872357H23.405L23.7217 0Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M13.1142 1.87695L13.4045 2.74931H14.3544L13.5892 3.27801L13.8794 4.12393L13.1142 3.59523L12.349 4.12393L12.6392 3.27801L11.874 2.74931H12.824L13.1142 1.87695Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M33.1948 3.27832L33.5114 4.17711H34.5669L33.7225 4.73225L34.0392 5.63104L33.1948 5.0759L32.324 5.63104L32.667 4.73225L31.7963 4.17711H32.8517L33.1948 3.27832Z" fill="#141515"/>
												<path fill-rule="evenodd" clip-rule="evenodd" d="M40.4777 24.3991H40.8735C41.0582 24.3991 41.1638 24.3462 41.2429 24.2933C41.3221 24.2405 41.3485 24.1876 41.3485 24.0819C41.3485 24.029 41.3221 23.9761 41.2957 23.9232C41.2693 23.8704 41.2166 23.8439 41.1638 23.8175C41.111 23.7911 41.0055 23.7911 40.8471 23.7911H40.4777V24.3991ZM40.1611 25.5093V23.5267H40.8471C41.0582 23.5267 41.2429 23.5267 41.3485 23.5796C41.454 23.606 41.5332 23.6853 41.586 23.7646C41.6388 23.8439 41.6915 23.9497 41.6915 24.0554C41.6915 24.214 41.6388 24.3198 41.5332 24.4255C41.4277 24.5313 41.2957 24.6106 41.111 24.6106C41.1902 24.637 41.2429 24.6899 41.2957 24.7163C41.3749 24.7956 41.454 24.9278 41.586 25.1128L41.8235 25.5093H41.4277L41.2429 25.1921C41.111 24.9542 41.0055 24.7956 40.9263 24.7163C40.8471 24.6899 40.768 24.6634 40.6624 24.6634H40.4777V25.5093H40.1611ZM40.9527 22.9451C40.7152 22.9451 40.4513 22.998 40.2138 23.1302C39.95 23.2624 39.7653 23.4739 39.6333 23.7118C39.5014 23.9497 39.4222 24.214 39.4222 24.4784C39.4222 24.7427 39.5014 25.0071 39.6333 25.245C39.7653 25.4829 39.95 25.6944 40.1875 25.8266C40.4513 25.9587 40.6888 26.0116 40.9527 26.0116C41.2166 26.0116 41.4804 25.9587 41.7179 25.8266C41.9818 25.6944 42.1665 25.4829 42.2984 25.245C42.4304 25.0071 42.5095 24.7427 42.5095 24.4784C42.5095 24.214 42.4304 23.9497 42.2984 23.7118C42.1665 23.4739 41.9554 23.2624 41.7179 23.1302C41.4804 22.998 41.2166 22.9451 40.9527 22.9451ZM40.9527 22.6279C41.2693 22.6279 41.586 22.7072 41.8762 22.8658C42.1665 23.0245 42.404 23.2624 42.5623 23.5532C42.7206 23.8439 42.7998 24.1612 42.7998 24.4784C42.7998 24.7956 42.7206 25.1128 42.5623 25.4036C42.404 25.6944 42.1665 25.9323 41.8762 26.0909C41.586 26.2495 41.2693 26.3288 40.9527 26.3288C40.636 26.3288 40.3458 26.2495 40.0555 26.0909C39.7653 25.9323 39.5278 25.6944 39.3695 25.4036C39.2111 25.1128 39.1056 24.7956 39.1056 24.4784C39.1056 24.1612 39.2111 23.8439 39.3695 23.5532C39.5278 23.2624 39.7653 23.0245 40.0555 22.8658C40.3458 22.7072 40.6624 22.6279 40.9527 22.6279Z" fill="#48BE7A"/>
											</svg>

										</div>
										<div class="p-about__features-right">
											<div class="p-about__features-title custom-p">
												Каждый кто имеет домен <a href="#" class="green">.ru</a> может открыть интернет магазин, добавив к своему домену <a href="#" class="green">.market</a>
											</div>
											<div class="p-about__text custom-t">
												<p>
													<a href="#" class="green">site.ru</a> – сайт
												</p>
												<p>
													<a href="#" class="green">site.ru.market</a> - интернет магазин
												</p>
												<p>
													Для обозначения магазина на визитках и других рекламных носителях можно просто добавить  к имени домена (в зоне ru)  .market для входа в магазин.
												</p>
												<p>
													Сайт магазина может быть стилизован под текущий дизайн основного сайта и его можно рекламировать.
												</p>
											</div>
										</div>
									</div>

								</section>
								*~

								<section id="photo" class="p-about__section">
									<div class="p-about__text custom-t  custom-t-title">
										<h3> Продавайте любые товары для компаний и организаций!</h3>
									</div>
									<div class="d-flex justify-content-around">
										<div class="img">
											<img src="/images/about/soda.png" alt="">
											<p>
												ХИМИЯ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/hardware.png" alt="">
											<p>
												МЕТИЗЫ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/equipment.png" alt="">
											<p>
												ОБОРУДОВАНИЕ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/print.png" alt="">
											<p>
												ПОЛИГРАФИЯ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/textile.png" alt="">
											<p>
												ТКАНЬ
											</p>
										</div>
									</div>
								</section>

								<section id="photo" class="p-about__section">

									<div class="d-flex justify-content-around">
										<div class="img">
											<img src="/images/about/soda.png" alt="">
											<p>
												ХИМИЯ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/hardware.png" alt="">
											<p>
												МЕТИЗЫ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/equipment.png" alt="">
											<p>
												ОБОРУДОВАНИЕ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/print.png" alt="">
											<p>
												ПОЛИГРАФИЯ
											</p>
										</div>

										<div class="img">
											<img src="/images/about/textile.png" alt="">
											<p>
												ТКАНЬ
											</p>
										</div>
									</div>
								</section>

								<section id="services" class="p-about__section">
									<div class="p-about__features">
										<div class="p-about__features-left custom-img">
											<div class="logo-glass logo_small">
												<svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
													<rect width="36" height="36" fill="url(#pattern0)"/>
													<defs>
														<pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1" height="1">
															<use xlink:href="#image0" transform="translate(-0.015625) scale(0.00520833)"/>
														</pattern>
														<image id="image0" width="198" height="192" xlink:href="data:image/png;base64,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"/>
													</defs>
												</svg>

											</div>
										</div>
										<div class="p-about__features-right">
											<div class="p-about__features-title custom-p text-weight">
												Индексация всех параметров товаров позволяют эффективно использовать поиск и отбор по специфическим фильтрам
											</div>
											<div class="p-about__text custom-t">

											</div>

										</div>
									</div>

									<div class="p-about__features custom-height-1">
										<div class="p-about__features-left custom-img">
											<div class="logo-glass logo_small">
												<svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
													<rect width="36" height="36" fill="#535A60"/>
												</svg>
											</div>
										</div>
										<div class="p-about__features-right">
											<div class="p-about__features-title custom-p text-weight">
												Что включено в сервис?
											</div>
											<div class="p-about__text custom-t">

											</div>
										</div>
									</div>
									<div class="p-about__features  custom-height-1">
										<!--
										<div class="p-about__features-left custom-img">
										<div class="logo-glass logo_small">
										<svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
										<rect width="36" height="36" fill="#535A60"/>
										</svg>

										</div>
										</div>
										<div class="p-about__features-right">
										<div class="p-about__features-title custom-p text-weight">
										Дополнительно можно купить
										</div>
										<div class="d-flex">
										<div class="text">
										<p>- Наполнение магазина списком товаров/услуг;</p>
										<p>	- Индивидуальный стиль магазина;</p>
										</div>

										<div class="text">
										<p>- Социальные кнопки;</p>
										<p>- Слайдер с рекламными баннерами на первой странице магазина;</p>
										</div>

										<div class="text">
										<p>- Подключение программы чата с покупателями;</p>
										<p>- Сервис перезвоните мне;</p>
										</div>

										<div class="text">
										<p>- Прием онлайн оплаты за товар по карте* (списывается дополнительная комиссия);</p>
										<p>- Создание рекламных баннеров для CPA сетей.</p>
										</div>
										</div>
										</div> -->
									</div>
								</section>

								<!-- <section id="blocks" class="p-about__section">
								<div class="p-about__text custom-t  custom-t-title">Порядок работы с продавцами:</div>
								<div  class="d-flex order-sellers">
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 1 -</div></div>
								<p>Для активации магазина продавец пополняет внутренний счет на сумму не менее чем на 10 000 руб.;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 2 -</div></div>
								<p>При поступлении заказа со счета продавца списывается комиссия и заказ передается продавцу;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 3 -</div></div>
								<p>В случае отказа покупателя от покупки или в случае возврата товара продавцу, размер комиссии возвращается на внутренний счет за расчетный период;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 4 -</div></div>
								<p>Продавец обновляет остатки продукции через административный кабинет. При нулевых остатках выставляется отметка, блокируется покупка, товар исключается из поиска;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 5 -</div></div>
								<p>В случае нулевого баланса на внутреннем счете магазин продавца переводится в режим передачи посетителей на магазины схожей тематики.;</p>
								</div>
								</div>

								<div class="p-about__text custom-t  custom-t-title">Работа с агентами:</div>
								<div  class="d-flex order-agents">
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 1 -</div></div>
								<p>Все расходы на общение агент осуществляет за свой счет.;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 2 -</div></div>
								<p>При пополнении счета продавцом при регистрации агент сразу получает уведомление;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 3 -</div></div>
								<p>Расчет осуществляется на основании агентского договора.;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 4 -</div></div>
								<p>Срок расчета с агентом будет максимально коротким;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 5 -</div></div>
								<p>Агент не имеет права вносить денежные средства за регистрацию продавца;</p>
								</div>
								</div>

								<div  class="d-flex-center order-agents">
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 6 -</div></div>
								<p>Все расходы на общение агент осуществляет за свой счет.;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 7 -</div></div>
								<p>Агенту выдается идентификационный код и адрес страницы для регистрации продавца;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 8 -</div></div>
								<p>Агент может работать удалённо;</p>
								</div>
								<div class="order-about">
								<div class="numeral-div"><div class="numeral green">- 9 -</div></div>
								<p>В случае множественной регистрации продавца сумма вознаграждения делится между агентами поровну;</p>
								</div>
								</div>
								</section> -->

								<section id="icons" class="p-about__section">
									<div class="row icons-div">
										<a href="#"><img src="\assets\img\about\3.png" alt=""></a>
									</div>
									<div class="p-about__text custom-t  custom-t-title slogan-border"></div>
									<div class="p-about__text custom-t  custom-t-title slogan">
										Регистрируйте новый источник заказов!
									</div>
									<div class="p-about__text custom-t  custom-t-title slogan">
										<a  style="color:#48BE7A;" href="mailto:info@ru.market">info@ru.market</a>
										<br><br>
										<a  style="color:#48BE7A;" href="tel:79675553131">+7 967 555 -3131</a> 
									</div>
								</section>
							</div>

						</div>
					</div>
				</div>
			</div>

			~~include file='market/tpl/footer.tpl'~


		</div>

		~~include file='market/tpl/bottom_script.tpl'~
	</body>

</html>
