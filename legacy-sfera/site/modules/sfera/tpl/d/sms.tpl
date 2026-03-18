<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta charset="utf-8">
		<title>Подтверждение телефона</title>

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
			html, body {
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
				font: 11px/16px 'PT Sans Narrow', serif;
				text-align: center;
			}

			.header__search {
				padding-left: 15px;
			}
			@font-face {
				font-family: "Roboto";
				font-style: normal;
				font-weight: 400;
				src: local("Roboto"), url("/assets/fonts/roboto/roboto.woff2") format("woff2"), url("/assets/fonts/roboto/roboto.woff") format("woff");
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

			/*custom style*/
			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > div.content > div > div > div > div.l-cabinet__aside {
				padding-top: 54px;
			}

			.content {
				padding: 0 40px;
			}

			.cabinet__text__menu {
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 13px;
				line-height: 15px;
				/* identical to box height, or 118% */
				color: #4A484E;
			}

			.text-reg {
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 26px;
				line-height: 26px;
				/* or 100% */

				text-align: center;
				color: black;
				margin-bottom: 20px
			}

			.cabinet__title {
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 30px;
				line-height: 34px;
				/* identical to box height, or 113% */

				color: #153772;
			}

			.reg__title {
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 25px;
				line-height: 35px;
				/* or 104% */

				display: flex;
				align-items: center;
				text-align: center;
				color: #4A484E;
				text-align: center;
			}

			.reg__text {
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 25px;
				line-height: 18px;
				/* or 129% */

				color: #FFFFFF;
			}

			.sms-title {
				text-align: center;
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 35px;
				line-height: 35px;
				color: black;
				margin-bottom: 20px;
			}

			.sms-border {
				margin: 0 auto;
				width: 25%;
				min-width: 360px;
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
			}

			.sms-border input {
				border: 1px solid #c2c2c2;
				border-radius: 6px;
				margin-bottom: 10px;
				height: 40px;
			}

			@media only screen and (max-width: 480px) {
				.password-input__forgot {
					position: static;
				}

			}

			#sms {
				padding-left: 35%;
				font-size: 22px;
				width: 200px;
				margin: 10px auto;
				font-family: var(--mainFont);
			}

			#sms-btn {
				margin: 40px auto 0 auto;
			}

			.sms-block {
				padding-top: 15%;
			}

			.reg__title__block {
				background: #EEEBED;
				border-radius: 6px;
				display: flex;
				justify-content: center;
				align-items: center;
				width: 100%;
				min-height: 154px;
				padding: 0 36px;
				margin-top: 67px;
				margin-bottom: 12px;
				min-width: 340px;
				max-width: 1000px;
			}

			.reg__btn {
				background: #48BE7A;
				border-radius: 6px;
				display: flex;
				justify-content: center;
				align-items: center;
				height: 70px;
				width: 200px;
				padding: 0 150px;
				margin-top: 60px;
			}

			.container-reg {
				flex-direction: column;
				justify-content: center;
				align-items: center;
				display: flex;
			}

			.l-content .input-row {
				min-width: 360px;
				max-width: 1000px;
				border-radius: 6px;
				margin-top: 40px;
				width: 50%;
			}

			.l-content .input-row__cell--border-left {
				border-radius: 6px;
			}

			.reg__input {
				z-index: 999;
				display: block;
				padding: 16px 14px;
				border: 1px solid #C2C2C2;
				border-radius: 6px;
				margin-top: 28px;
				min-width: 218px;
				width: 27%;
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 18px;
				line-height: 16px;
				height: 40px;
				/* or 160% */

				display: flex;
				align-items: center;
				text-indent: 10px;
				color: #B8B8B8;
			}

			.reg__input:focus {
				color: black;
			}

			@media only screen and (max-width: 640px) {
				.content {
					padding: 0 10px;
				}
			}
			.register-tabs__pane {
				border-radius: 6px;
			}

			#title-search-input {
				display: none;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__btn.header__cart.dropdown {
				display: none;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default {
				text-align: center;
				margin: 0 auto;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default > div > div > div {
				padding: 0;
				margin: 0 auto;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo {
				display: block;
				text-align: center;
				width: 300px;
				margin: 0 auto;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__search.js-search {
				padding: 0;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo-mobile {
				display: none;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div {
				padding-right: 93px;
				border-bottom: 1px solid #DDDDDD;
			}

			body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default > div > div {
				margin-bottom: 15px;
			}

			@media only screen and (max-width: 760px) {
				body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div {
					padding-right: 93px;
					border: none;
				}

				body > div.l-main.js-main.wrapper.slideout-panel.slideout-panel-left > header > div > div.header__wrapper > div > div > div.header__logo > a > div.header__logo-default > div > div {
					margin-top: 10px;
				}
			}

			#login_tab > form > div:nth-child(3) > button {
				width: 122px;
				height: 29px;
				padding: 0 17px;
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 14px;
				line-height: 18px;
				/* or 129% */

				display: flex;
				align-items: center;
				text-align: center;
				color: #FFFFFF;
				margin: 0 auto;
			}

			#login_tab > form > div:nth-child(2) > div > div.complex-input__input > input, #login_tab > form > div:nth-child(2) > div > label {
				font-family: var(--mainFont);
				font-style: normal;
				font-weight: normal;
				font-size: 15px;
				line-height: 16px;
				/* or 160% */

				display: flex;
				align-items: center;
				text-indent: 10px;
				color: #B8B8B8;
			}

			#login_tab > form > div:nth-child(2) > div > div.complex-input__input > input:focus {
				color: black;
				font-size: 15px;
			}

			body > div.l-main.js-main.slideout-panel.slideout-panel-left > header > div > div.header__wrapper.header__wrapper__border > div > div > div.header__btn.header__cabinet.dropdown > a {
				visibility: hidden;
			}

			#register_tab {
				border-radius: 6px;
			}

			.input-row__icon {
				color: black;
			}

			#register_tab > form > div.form-row.hidden-xs > div:nth-child(2) > div {
				border-radius: 6px;
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

	<body class="no-padding-right">

		<div class="loader">
			<div class="loader__inn">
				<div class="wikimoda animate">
					<span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span>
				</div>
			</div>
		</div>

		<div class="m-nav js-m-nav">
			<!-- <div class="m-nav__group">
			<a href="#login" class="m-nav__link m-nav__link--icon"> Авторизация </a>
			</div> -->
			<div class="m-nav__group">
				<a href="#" class="m-nav__link m-nav__location js-location-select-toggle"> <span>Город:</span> Москва </a>
			</div>
			<div class="m-nav__group">
				~~include file='market/tpl/m-nav__catalog.tpl'~
			</div>

			<div class="modal remodal md-login" data-remodal-id="confirmation" class="phone">
				<button class="modal__close close-btn" data-remodal-action="close">
					Закрыть
				</button>
				<div class="login-tabs js-tabs">

					<div class="login-tabs__panes">
						<div data-el="pane" id="login_tab" class="login-tabs__pane is-active register-tabs__pane">
							<!--div class="md-login__social">
							<a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
							href="#"></a>
							</div>
							<div class="md-login__or">
							или
							</div-->
							<form autocomplete="off" class="md-login__form">
								<div class="form-row">

								</div>
								<div class="form-row">
									<div class="complex-input complex-input--icon password-input js-complex-input">
										<label class="complex-input__label">Введите код из смс</label>
										<div class="complex-input__icon">

										</div>
										<div class="complex-input__input">
											<input type="text" class="input js-toggle-password-phone">
										</div>
										<div class="password-input__block">
											<div class="password-input__forgot">
												<a href="#">Отправить заново</a>
											</div>
											<!--<a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn"><i></i></a>-->
										</div>
									</div>
								</div>
								<div class="form-row">
									<button type="submit" class="btn btn--pink btn--lg ">
										Подтвердить
									</button>
								</div>
							</form>
						</div>
						<div data-el="pane" id="register_tab" class="login-tabs__pane">
							<!--div class="md-login__social">
							<a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
							href="#"></a>
							</div>
							<div class="md-login__or">
							или
							</div-->
							<form autocomplete="off" class="md-login__form js-example-form">

								<div class="form-row">
									<div class="input-row">
										<div class="input-row__cell input-row__icon">
											<i class="ticon ticon-mobile "></i>
										</div>
										<div class="input-row__cell input-row__cell--border text-center" style="width: 80px;">
											<select class="select">

												<option>+7</option>

											</select>
										</div>
										<div class="input-row__cell">
											<input type="text" class="input js-phone-mask" placeholder="(___) ___-__-__">
										</div>
									</div>
									<label class="switcher ">
										<div class="switcher__inn">
											<div class="switcher__toggle">
												<input  type="checkbox" class="js-switchery ">
											</div>
											<div class="switcher__label">
												Получать сервисные SMS уведоммления
											</div>
										</div> </label>
								</div>

								<!--div class="form-row hidden-xs">
								<div class="input-row password-row js-password-row">
								<div class="input-row__cell input-row__icon">
								<i class="ticon ticon-asterisk "></i>
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<div class="input-row__cell input-row__cell--tiny">
								<input class="input js-toggle-password" type="password">
								</div>
								<a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn input-row__cell"> <i></i> </a>
								</div>
								</div>
								<div class="form-row xvisible-sm">
								<div class="complex-input js-complex-input">
								<label class="complex-input__label">Пароль</label>
								<div class="complex-input__input">
								<input type="password" class="input">
								</div>
								</div>
								</div-->

								<div class="form-row">
									<button type="submit" class="btn btn--pink btn--lg">
										Зарегистрироваться
									</button>
								</div>
								<div class="form-row">
									<!--div class="text">
									Я соглашаюсь с условиями <a class="link link--ul" href="#">Публичной оферты</a>
									</div-->
								</div>
							</form>
						</div>
					</div>
				</div>
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
		<!-- изначально был в разметке кто он и зачем нужен не знаю -->

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
											(9)
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

					<div class="topbar">
						<div class="l-wrapper">
							<div class="topbar__inn">
								<div class="topbar__location dropdown">
									<a class="topbar__link topbar__link--dropdown js-dropdown-location js-dropdown-toggle" href="#"> <span class="js-positioned">Москва</span></a>
									<div class="dropdown__block location-dropdown" style="display:none;">
										<div class="location-dropdown__label">
											Вы действительно находитесь в г. Москва?
										</div>
										<div class="block-table block-table--fixed">
											<div>
												<a class="location-dropdown__link js-dropdown-close" href="#">Да, все верно</a>
											</div>
											<div class="text-right">
												<a class="location-dropdown__link js-location-select-toggle" href="#">Нет, сменить город</a>
											</div>
										</div>
									</div>
								</div>

								<div class="topbar__cabinet dropdown bonus">
									<!-- <a class="topbar__link topbar__link--dropdown  js-dropdown-toggle  js-bonus-target" href="#"> <span class="js-positioned">Мой кабинет</span></a> -->
									<div class="bonus__block">
										Дарим 500 руб. при регистрации <a href="#" class="bonus__close js-bonus-close">Закрыть</a>
									</div>
									<div class="dropdown__block cabinet-dropdown">
										<div class="cabinet-dropdown__login">
											<a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a><a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="header__wrapper header__wrapper__border">
						<div class="l-wrapper">
							<div class="header__row header-center">
								<div class="header__nav-toggle header__nav-toggle-left">
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

								<div class="header__nav-toggle hidden-v">
									<a href="#" class="hamburger hamburger--spin js-nav-toggle"><span>Каталог</span></a>
								</div>

								<div class="header__search js-search">
									<div id="title-search">
										<form autocomplete="off" class="search" onsubmit="if($(this).find('input').val().length == 0) return false;" action="/api/">
											<div class="awesomplete">
												<input type="text" id="title-search-input" name="q" class="search__input js-product-search" placeholder="" autocomplete="off" aria-autocomplete="list">

												<ul hidden="">

													<li aria-selected="false">
														<a href="/catalog/zhenskoe/chasy/chasy_1/236741-chasy_2/" class="product-ac">
														<div class="product-ac__inn">
															<div>
																<div class="product-ac__info">
																	<div class="product-ac__info-left">
																		<div class="product-ac__name" style="color:#2f2f2f;"></div>
																	</div>
																	<!--div class="product-ac__info-right"></div-->
																</div>
															</div>
														</div></a>
													</li>

												</ul>

												<span class="visually-hidden" role="status" aria-live="assertive" aria-relevant="additions"></span>
											</div>
											<!-- <button type="submit" class="search__submit"></button> кнопка поиск -->
											<a href="#" class="search__close js-search-close"></a>
										</form>
									</div>

								</div>

								<!--div class="header__search js-search">
								<form autocomplete="off" class="search">
								<input type="text" class="search__input" placeholder="Поиск товара или услуги">

								<button type="submit" class="search__submit"></button>
								<a href="#" class="search__close js-search-close"></a>
								</form>

								</div>

								<div class="header__btn header__srch">
								<a class="js-search-toggle" href="#"> <i  class="ticon ticon-loupe "></i> </a>
								</div-->

								<!--div class="header__btn header__favorite"> <a class="js-favs" href="#">

								<i  class="ticon ticon-favorite-fill "></i>

								<span class="header__favorite-count">99</span>
								</a> </div-->
								<!-- <div class="header__btn header__cart dropdown">

								<a href="/cart/" class="cart to_cart"></a><span class="counter total_cart_amount" data-bind="text: total_cart_amount">0</span> -->

								<!--a class="js-dropdown-toggle js-cart" href="#"> <i  class="ticon ticon-cart "></i> <span class="header__cart-count">0</span> </a-->

								<!-- </div> -->
								<div class="header__btn header__cabinet dropdown">
									<a class="js-dropdown-toggle" href="#"> <i  class="ticon ticon-user "></i> </a>
									<div class="dropdown__block cabinet-dropdown">
										<div class="cabinet-dropdown__login">
											<a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a><a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a>
										</div>
										<div class="cabinet-dropdown__search">
											<div class="cabinet-dropdown__search-label">
												Отследить заказ
											</div>
											<!-- <form autocomplete="off" class="search">
											<input type="search" class="search__input js-order-search" placeholder="Введите номер заказа">
											</form> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</header>
			<div class="l-content sms-block">
				<div class="l-wrapper">
					<div class="form-row">
						<div class="sms-border complex-input complex-input--icon password-input js-complex-input">

							<p class="sms-title">
								Введите код из sms
							</p>
							<div class="complex-input__input">
								<input type="text" class="inpu js-toggle-password-phone" id="sms" placeholder:"_-_-_-_">
							</div>
							<div class="password-input__block">
								<!--<a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn"><i></i></a>-->
							</div>
							<div class="password-input__forgot">
								<a href="#">Отправить заново</a>
							</div>
						</div>
						<div class="form-row">
							<button type="submit" class="btn btn--pink btn--lg reg__btn" id="sms-btn">
								Подтвердить
							</button>
						</div>
					</div>
				</div>
			</div>

			~~include file='market/tpl/footer.tpl'~


		</div>


		~~include file='market/tpl/bottom_script.tpl'~
		<script>
			$(function() {
				$("#sms").mask("9-9-9-9"), {
					placeholder : "_-_-_-_"
				};
			});
		</script>
	</body>

</html>
