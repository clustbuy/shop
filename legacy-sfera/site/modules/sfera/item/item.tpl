<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="utf-8">
		<title>Ru.Market - онлайн-гипермаркет с прямой доставкой со склада</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<meta name="format-detection" content="telephone=no"/>
		<meta name="mobile-web-app-capable" content="yes"/>
		~~include file="market/tpl/favicon.tpl"~
		<link rel="stylesheet" type="text/css" href="/assets/css/libs.css"/>
		<link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css"/>
		<link rel="stylesheet" type="text/css" href="/assets/css/app.css"/>
		

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
			$(document).ready(function() {

				$("[data-toggle='location-dropdown']").click(function(e) {
					$(".location-dropdown").toggleClass("hidden");
					e.stopPropagation();
				});
			});
		</script>
		~~include file="tpl/js.tpl"~

		~~if $config.mobile >0 ~
			~~include file="market/tpl/css/product_m.tpl"~
		~~else~
			~~include file="market/tpl/css/product_d.tpl"~
			<link rel="stylesheet" type="text/css" href="/assets/css/uw-desktop-sku-grid.css"/>
			<link rel="stylesheet" type="text/css" href="/assets/css/pdp-all-description-v3.css"/>
		~~/if~
		


	</head>

	<body>

		<div class="modal remodal md-cart" data-remodal-id="cart">
			<button class="modal__close close-btn" data-remodal-action="close">
				Закрыть
			</button>
			<div class="title h1">
				Товар добавлен в корзину
			</div>
			<div class="md-cart__header">
				<div class="md-cart__header-left">
					<div class="text">
						Всего товаров в корзине <a class="link link--ul" href="/cart/"><b data-bind="text: total_cart_amount"></b></a>
					</div>
				</div>
				<div class="md-cart__header-right">
					<div class="text">
						До окончания резерва осталось
						<div class="bg-countdown">
							<span data-countdown="~~$now.year~/~~$now.month~/~~$now.day~ 23:59:59" class="js-countdown"></span>
						</div>
					</div>
				</div>
			</div>

			<!-- ko foreach: cart().items() -->
			~~*
			<span data-bind="html: (console.log(guid()))"></span>

			<a href="#" class="remove-btn item-click__remove js-item-remove"
			data-bind="click: $root.remove_from_cart.bind($data, guid())"
			><i></i></a>

			<div class="item-click item-click--row">
				<div class="item-click__inn">
					<div class="item-click__photo">
						<a data-bind="attr: {href: $root.full_link($data, $data)}"> <img class="item-click__img" data-bind="attr:{src: Items[guid()].img_url}"> </a>
					</div>
					<div class="item-click__info">
						<div class="item-click__row">
							<div>
								<a class="item-click__name" data-bind="text: Items[guid()].title, attr: {href: $root.full_link($data, $data)}"></a>
							</div>
							<div class="item-click__num">
								<div class="item-count js-item-count js-itemd-cart-count" data-price="2790" data-max="11">
									<button type="button" data-el="minus" class="item-count__minus" data-bind="click: $root.amount_minus.bind($data, guid())">
										-
									</button>
									<div class="item-count__num">
										<input type="text" data-el="num" data-bind="textInput: product_amount" />
									</div>
									<button type="button" data-el="plus" class="item-count__plus" data-bind="click: $root.amount_plus.bind(guid(), $data)">
										+
									</button>
								</div>
							</div>
							<div class="item-click__price">
								<div class="price">
									<span class="js-item-click-price js-odometer" data-bind="text:Math.round(Number(Items[guid()].cost*product_amount()))"></span> ₽
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			*~
			<!-- /ko -->

			<div class="md-cart__bottom">
				<div class="md-cart__bottom-left">
					a>
				</div>
				<div class="md-cart__bottom-center">
					<div class="progress-bar js-cart-progress-bar" data-to="1500">
						<div class="progress-bar__row">
							<div class="progress-bar__from">
								0
							</div>
							<div class="progress-bar__p">
								<div class="progress-bar__line">
									<div data-el="bar" style="width: 70%;" class="progress-bar__bar"></div>
								</div>
							</div>
							<div class="progress-bar__to">
								1500 ₽
							</div>
						</div>
						<div class="progress-bar__hint">
							Осталось <b><span data-el="left">780</span> руб.</b> для бесплатной доставки
						</div>
					</div>
				</div>
				<div class="md-cart__bottom-right">
					<a href="/order/" class="btn btn--vinous">Оформить заказ</a>
				</div>
			</div>
		</div>

		<div id="__ozon">



			<div id="layoutPage" class="a0 a2">
				<div data-replace-layout-path="[0]" class="b0 b2" style="width:auto;" data-widget="blockVertical">

					~~if $config.mobile >0 ~
						~~include file="market/tpl/mobile/header.tpl"~
		            ~~else~
						~~include file="market/tpl/desktop/header.tpl"~
		            ~~/if~

					~~*
					<div class="p5d" data-widget="navigationSlider">
						<div class="pd7">
							<div class="a3148-a2">
								<div class="a3148-a3">
									<div class="a3148-a4" style="transition-duration:300ms;transform:translateX(0px);">
										<div class="d6p a3148-a1">
											<a target="_blank" href="/highlight/preseyl-11-11-1212999/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/1e/tc3/wc100/pre_11_i.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Pre-sale 11.11
											</div></a><a target="_blank" href="https://finance.ru.market/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/1d/t1e/wc100/ozb_i.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Карта ClustBUY Банка
											</div></a><a target="_blank" href="/travel/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/69/taa/wc100/ic_service_travel.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Билеты, Отели, Туры
											</div></a><a target="_blank" href="https://www.ru.market/highlight/tovary-kampanii-rasprodazha-stoka-auto-1024701/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/a9/tef/wc100/ls_i.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Ликвидация
											</div></a><a target="_blank" href="/highlight/globalpromo/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/65/tb0/wc100/3.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Акции и скидки
											</div></a>
										</div>
										<div class="d6p a3148-a1">
											<a target="_blank" href="/buyAgain/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/1c/t73/wc100/all_for_for_you.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Всё для вас
											</div></a><a target="_blank" href="/category/zhenskaya-odezhda-7501/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/df/tfc/wc100/apparel-i-2.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Одежда и обувь
											</div></a><a target="_blank" href="/category/dom-i-sad-14500/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/60/tf5/wc100/ic_xs_category_household_1.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Дом и сад
											</div></a><a target="_blank" href="/category/elektronika-15500/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/43/t52/wc100/ic_category_electronics_1.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Электроника
											</div></a><a target="_blank" href="/partpayment/limit/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/3e/t98/wc100/rassroch_i_1.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Рассрочка от Ozon
											</div></a>
										</div>
										<div class="d6p a3148-a1">
											<a target="_blank" href="/premium/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/a1/t8d/wc100/ic_service_premium.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												ClustBUY Premium
											</div></a><a target="_blank" href="/product/elektronnyy-podarochnyy-sertifikat-million-podarkov-3000-ozon-135382627/?perehod=navigationb2capp" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/77/t13/wc100/ic_service_gift_cards4.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Сертификаты
											</div></a><a target="_blank" href="/highlight/express/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/af/tf1/wc100/ic_express.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Доставка от 1 часа
											</div></a><a target="_blank" href="/highlight/ozon-global/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/fd/t0a/wc100/ic_service_global_2.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Из-за рубежа
											</div></a><a target="_blank" href="/special/care/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/e6/t03/wc100/care_n.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												ClustBUY Забота
											</div></a>
										</div>
										<div class="d6p a3148-a1">
											<a target="_blank" href="https://seller.ru.market/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/7c/t1f/wc100/ic_service_ozon_seller.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												Стать продавцом
											</div></a><a target="_blank" href="https://www.ru.market/business/" rel="noopener" class="a5g pd6" style="width:20%;">
											<div class="p7d">
												<div class="u1d d8p">
													<div class="du3"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/cms/35/t74/wc100/ic_service_b2b.png" class="ud3 b9414-a">
													</div>
												</div>
											</div>
											<div class="tsBody300XSmall pd8 p8d">
												ClustBUY для бизнеса
											</div></a>
										</div>
									</div>
								</div>
							</div>
							<div class="p6d">
								<span class="dp7 d7p"></span><span class="dp7"></span><span class="dp7"></span><span class="dp7"></span>
							</div>
						</div>
					</div>

					<div class="s9d" style="height:8px;background-color:rgba(255, 255, 255, 1);" data-widget="separator"></div>

					<div class="me0" style="height:4px;background:rgba(245, 247, 250, 1);" data-widget="islandSeparator">
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;left:0;">
							<g clip-path="#island-topLeft">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-topLeft">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;right:0;transform:scale(-1, 1);">
							<g clip-path="#island-topRight">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-topRight">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
					</div>

					<div class="me0" style="height:4px;background:rgba(245, 247, 250, 1);" data-widget="islandSeparator">
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;left:0;transform:scale(1, -1);">
							<g clip-path="#island-bottomLeft">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-bottomLeft">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;right:0;transform:scale(-1, -1);">
							<g clip-path="#island-bottomRight">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-bottomRight">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
					</div>

					<div data-replace-layout-path="[7][0]" class="container b4 b6" data-widget="container">
						<div class="s9d" style="height:12px;" data-widget="separator"></div>
						<div class="n6b n7b n9b b7n" data-widget="blackFridayCounter"><img elementtiming="lcp_eltiming_blackFridayCounter-3288209-default-1" loading="lazy" fetchpriority="high" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc400/286_counter_mobile_backgroundAnnouncement_f19662ef-99d2-48ef-900d-d8d9efaf9c33.png" class="nb8 b9414-a">
							<div class="n8b"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc400/286_counter_mobile_logoAnnouncement_f19662ef-99d2-48ef-900d-d8d9efaf9c33.png" class="bn9 b9414-a">
								<div class="nb9" style="justify-content:space-between;">
									<div class="b9n tsBodyControl300XSmall" style="background-color:#001A34;color:#FFFFFF;">
										<span class="n5b"> 2&nbsp;дня </span>
										<div class="bo">
											до старта
										</div>
									</div>
									<div class="ob">
										<div class="b0o">
											<!---->
											<div class="ob0">
												Для Premium с 30.10
											</div>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="o0b">
												<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
											</svg>
										</div>
										<!---->
									</div>
								</div>
							</div>
							<!---->
						</div><div class="s9d" style="height:12px;" data-widget="separator"></div>
						<div class="bp2 b2p" data-widget="hammers">
							<div class="o5b bo7 o7b">
								<div class="ob5">
									<div class="b7o"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc150/286_widget_settings_hammers_announcement_mobile_logo_f014f503-bd98-4e8e-94af-6c3c177131d3.png" class="o6b b9414-a"><!---->
									</div>
									<div class="ob7">
										<div class="b7a tsBody400Small ob6" style="color:rgba(0, 26, 52, 0.6);">
											<span class="tsBody400Small">31.10 в 00:00 мск</span>
										</div>
										<div class="bo8">
											<!---->
											<div class="a2429-a ob8 b8o">
												<button tabindex="0" type="button" class="a2429-a4" style="border-radius:8px;">
													<span class="a2429-b1 a2429-c a2429-f0" style="border-radius:8px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9" style="color: var(--cbPrimaryColor);">
															<path fill="currentColor" d="M4.614 14.418c-.171-.244-.159-.602.139-.585 0 0 1 .157 2.247.157 1.261 0 2.247-.156 2.247-.156.297-.021.313.313.146.558C8.94 15.055 7.953 15.5 7 15.5c-.94 0-1.93-.434-2.386-1.082Zm8.219-12.251c.46 0 .834.373.834.833v.833h.833a.833.833 0 1 1 0 1.667h-.833v.833a.833.833 0 1 1-1.667 0V5.5h-.833a.833.833 0 0 1 0-1.667H12V3c0-.46.373-.833.833-.833Z"></path><path fill="currentColor" d="M7 .5c.46 0 .833.373.833.833a5.7 5.7 0 0 1 .834.15c.833.217.833.635.58 1.061a4.167 4.167 0 0 0 3.586 6.29c.417 0 .834 0 .834.833C13.667 11.333 11.174 13 7 13 2.826 13 .333 11.333.333 9.667c0-.88.366-1.346.75-1.836.162-.206.327-.417.47-.664.233-.407.378-.962.537-1.568l.005-.02c.453-1.732 1.026-3.92 4.072-4.246C6.167.873 6.54.5 7 .5Z"></path>
														</svg><span class="a2429-e7"></span></span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="p2b">
								<div class="o8b bo9">
									<a target="_blank" href="/product/sapogi-nordman-817172147/?campaignId=286" rel="noopener" class="a5g b9o">
									<div class="ob9" style="opacity:1;">
										<div class="o9b bp"><img elementtiming="lcp_eltiming_hammers-3288211-default-1_0" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-3/wc200/6817008987.jpg" class="b9414-a">
										</div>
									</div> <!---->
									<div class="b0p bo9">
										<div class="pb0">
											<div tabindex="1" class="p0b b410-a0 b410-a6" style="background-color:rgba(245, 247, 250, 1);color:rgba(0, 26, 52, 1);">
												<div class="b410-b">
													<div title="1 шт. в руки" class="b410-b0 tsBodyControl300XSmall">
														1 шт. в руки
													</div>
												</div>
											</div>
										</div>
									</div></a><a target="_blank" href="/product/sapogi-nordman-817172147/?campaignId=286" rel="noopener" class="a5g bp1">
									<div class="pb1 c3118-a c3118-b5">
										<div class="c3118-a0">
											<span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-right:4px;">4&thinsp;999&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a4 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>-71%</span>
										</div>
									</div>
									<div class="b7a ab9 ba9 pb1" style="color:rgba(0, 26, 52, 0.4);">
										<span class="tsBodyControl300XSmall">Будет стоить</span>
									</div>
									<div class="pb1 c3118-a c3118-b5">
										<div class="c3118-a0">
											<span class="c3118-a1 tsBodyAccent400Small c3118-b9" style="margin-right:4px;">1&thinsp;499&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a5 c3118-b1 c3118-a3" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
										</div>
									</div>
									<div class="e6136-a e6136-a3 p1b tsCompact300XSmall e6136-a6">
										<span class="e6136-a4" style="color:rgba(0, 26, 52, 0.4);">1140 шт.</span>
										<div class="e6136-a0">
											<div class="e6136-a1"></div><div class="e6136-a2" style="width:100%;"></div>
										</div>
									</div></a>
								</div>
								<div class="o8b bo9">
									<a target="_blank" href="/product/kofe-rastvorimyy-monarch-original-400-g-258846372/?campaignId=286" rel="noopener" class="a5g b9o">
									<div class="ob9" style="opacity:1;">
										<div class="o9b bp"><img elementtiming="lcp_eltiming_hammers-3288211-default-1_1" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-j/wc200/6817009975.jpg" class="b9414-a">
										</div>
									</div> <!---->
									<div class="b0p bo9">
										<div class="pb0">
											<div tabindex="1" class="p0b b410-a0 b410-a6" style="background-color:rgba(245, 247, 250, 1);color:rgba(0, 26, 52, 1);">
												<div class="b410-b">
													<div title="1 шт. в руки" class="b410-b0 tsBodyControl300XSmall">
														1 шт. в руки
													</div>
												</div>
											</div>
										</div>
									</div></a><a target="_blank" href="/product/kofe-rastvorimyy-monarch-original-400-g-258846372/?campaignId=286" rel="noopener" class="a5g bp1">
									<div class="pb1 c3118-a c3118-b5">
										<div class="c3118-a0">
											<span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-right:4px;">1&thinsp;399&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a4 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>-58%</span>
										</div>
									</div>
									<div class="b7a ab9 ba9 pb1" style="color:rgba(0, 26, 52, 0.4);">
										<span class="tsBodyControl300XSmall">Будет стоить</span>
									</div>
									<div class="pb1 c3118-a c3118-b5">
										<div class="c3118-a0">
											<span class="c3118-a1 tsBodyAccent400Small c3118-b9" style="margin-right:4px;">599&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a5 c3118-b1 c3118-a3" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
										</div>
									</div>
									<div class="e6136-a e6136-a3 p1b tsCompact300XSmall e6136-a6">
										<span class="e6136-a4" style="color:rgba(0, 26, 52, 0.4);">5000 шт.</span>
										<div class="e6136-a0">
											<div class="e6136-a1" style="background-color:rgba(204, 214, 228, 0.6);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(204, 214, 228, 0.6);width:100%;"></div>
										</div>
									</div></a>
								</div>
								<div class="o8b bo9">
									<a target="_blank" href="/product/drel-shurupovert-zitrek-green12-ot-akkumulyatora-12-v-32-nm-1-akb-288958907/?campaignId=286" rel="noopener" class="a5g b9o">
									<div class="ob9" style="opacity:1;">
										<div class="o9b bp"><img elementtiming="lcp_eltiming_hammers-3288211-default-1_2" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-4/wc200/6817010140.jpg" class="b9414-a">
										</div>
									</div> <!---->
									<div class="b0p bo9">
										<div class="pb0">
											<div tabindex="1" class="p0b b410-a0 b410-a6" style="background-color:rgba(245, 247, 250, 1);color:rgba(0, 26, 52, 1);">
												<div class="b410-b">
													<div title="1 шт. в руки" class="b410-b0 tsBodyControl300XSmall">
														1 шт. в руки
													</div>
												</div>
											</div>
										</div>
									</div></a><a target="_blank" href="/product/drel-shurupovert-zitrek-green12-ot-akkumulyatora-12-v-32-nm-1-akb-288958907/?campaignId=286" rel="noopener" class="a5g bp1">
									<div class="pb1 c3118-a c3118-b5">
										<div class="c3118-a0">
											<span class="c3118-a1 tsBodyControl300XSmall c3118-b0" style="margin-right:4px;">1&thinsp;899&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a4 c3118-b1" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>-58%</span>
										</div>
									</div>
									<div class="b7a ab9 ba9 pb1" style="color:rgba(0, 26, 52, 0.4);">
										<span class="tsBodyControl300XSmall">Будет стоить</span>
									</div>
									<div class="pb1 c3118-a c3118-b5">
										<div class="c3118-a0">
											<span class="c3118-a1 tsBodyAccent400Small c3118-b9" style="margin-right:4px;">799&thinsp;₽</span><span class="tsBodyControl300XSmall c3118-a2 c3118-a5 c3118-b1 c3118-a3" style="background:#FFF;"><div class="c3118-b" style="background-image:url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div></span>
										</div>
									</div>
									<div class="e6136-a e6136-a3 p1b tsCompact300XSmall e6136-a6">
										<span class="e6136-a4" style="color:rgba(0, 26, 52, 0.4);">10000 шт.</span>
										<div class="e6136-a0">
											<div class="e6136-a1" style="background-color:rgba(204, 214, 228, 0.6);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(204, 214, 228, 0.6);width:100%;"></div>
										</div>
									</div></a>
								</div>
							</div>
							<div class="b5o">
								<div class="a2429-a a2429-a3">
									<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:10px;">
										<span class="a2429-b1 a2429-e0 a2429-b3 a2429-a3 a2429-b2" style="border-radius:10px;background:linear-gradient(to right, #2E7AFF 0%,#0B21F4 100%);"><span class="a2429-e7">Все товары Хот Сейл<span class="a2429-e8">Новинки каждый день</span></span></span>
									</button>
								</div>
							</div>
						</div>
					</div>

					<div class="s9d" style="height:16px;background-color:rgba(255, 255, 255, 1);" data-widget="separator"></div>

					<div class="me0" style="height:8px;background:rgba(245, 247, 250, 1);" data-widget="islandSeparator">
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;left:0;">
							<g clip-path="#island-topLeft">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-topLeft">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="top:-24px;right:0;transform:scale(-1, 1);">
							<g clip-path="#island-topRight">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-topRight">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;left:0;transform:scale(1, -1);">
							<g clip-path="#island-bottomLeft">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-bottomLeft">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
						<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="m0e" style="bottom:-24px;right:0;transform:scale(-1, -1);">
							<g clip-path="#island-bottomRight">
								<path fill="rgba(245, 247, 250, 1)" fill-rule="evenodd" clip-rule="evenodd" d="M372.384 10.896C375 5.762 375-.96 375-14.4V24h-37.828c13.061 0 19.663-.037 24.724-2.616a23.999 23.999 0 0 0 10.488-10.488ZM37.828 24h299.344H37.828ZM0 24h37.828c-13.061 0-19.663-.037-24.724-2.616A24 24 0 0 1 2.616 10.896C0 5.762 0-.96 0-14.4V24Z"></path>
							</g>
							<defs>
								<clipPath id="#island-bottomRight">
									<path fill="transparent" d="M0 0h24v24H0z"></path>
								</clipPath>
							</defs>
						</svg>
					</div>
					*~

					~~if $config.mobile >0 ~
					<div class="s9d" style="height:8px;" data-widget="separator"></div><div class="s9d" style="height:2px;" data-widget="separator"></div>
					<div data-replace-layout-path="[4][0]" class="container b4 b6" data-widget="container">
						<div style="display:none;" data-widget="webProductMainWidget"></div>
						<div style="position:fixed;right:0;bottom:0;left:0;z-index:499;" data-widget="webContainerFixed">
							<div data-replace-layout-path="[4][0][1][0]">
								<nav class="d1n" data-widget="mobileHeader">
									<div class="dn0">
										<a target="_self" href="/" class="a5g d0n"><span class="dn">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
												<path fill="currentColor" d="M12.664 1.253a1 1 0 0 0-1.328 0l-9 8A1 1 0 0 0 2 10v10a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-6a2 2 0 1 1 4 0v6a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V10a1 1 0 0 0-.336-.747l-9-8ZM16 19v-5a4 4 0 0 0-8 0v5H4v-8.55l8-7.112 8 7.111V19h-4Z"></path>
											</svg><span class="nd0" style="display:none;"> 0 </span> <!----></span><span class="nd">Главная</span></a><a target="_self" href="/category/" class="a5g d0n"><span class="dn">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
												<path fill="currentColor" fill-rule="evenodd" d="M8 9.5a7.5 7.5 0 1 1 11.738 6.189l3.143 5.837a1 1 0 1 1-1.762.948l-3.168-5.884A7.5 7.5 0 0 1 8 9.5ZM15.5 4a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11Z" clip-rule="evenodd"></path><path fill="currentColor" d="M2 9a1 1 0 0 0 0 2h3a1 1 0 1 0 0-2H2Zm0 5a1 1 0 1 0 0 2h4a1 1 0 1 0 0-2H2Zm0 5a1 1 0 1 0 0 2h9a1 1 0 1 0 0-2H2Z"></path>
											</svg><span class="nd0" style="display:none;"> 0 </span> <!----></span><span class="nd">Каталог</span></a><a target="_self" href="/cart" class="a5g d0n"><span class="dn">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
												<path fill="currentColor" d="M6 6a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2h4a1 1 0 0 1 .986 1.164l-1.582 9.494A4 4 0 0 1 17.46 22H6.54a4 4 0 0 1-3.945-3.342L1.014 9.164A1 1 0 0 1 2 8h4V6Zm2 2h5a1 1 0 1 1 0 2H3.18l1.389 8.329A2 2 0 0 0 6.54 20h10.92a2 2 0 0 0 1.972-1.671L20.82 10H17a1 1 0 0 1-1-1V6a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2Z"></path>
											</svg><span class="nd0" style=""> 2 </span> <!----></span><span class="nd">Корзина</span></a><a target="_self" href="/my/favorites/" class="a5g d0n"><span class="dn">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
												<path fill="currentColor" d="M7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Zm5 17c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Z"></path>
											</svg><span class="nd0" style="display:none;"> 0 </span> <!----></span><span class="nd">Избранное</span></a><a target="_self" href="/my/main/" class="a5g d0n"><span class="dn">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
												<path fill="currentColor" d="M8 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-8.3 4.286c.016.015.185.165.5.323.376.187.971.391 1.8.391.829 0 1.425-.204 1.8-.391.175-.088.355-.19.5-.323a1 1 0 0 1 1.407 1.421C15.587 16.827 14.357 18 12 18c-2.358 0-3.587-1.173-3.707-1.293A1 1 0 0 1 9.7 15.286Z"></path><path fill="currentColor" d="M11 2a1 1 0 0 1 1-1c6.075 0 11 4.925 11 11s-4.925 11-11 11S1 18.075 1 12a11 11 0 0 1 6.23-9.914 1 1 0 0 1 1.36.524c.292.72.69 1.565 1.362 2.233C10.592 5.481 11.524 6 13 6a1 1 0 1 1 0 2c-2.024 0-3.458-.743-4.459-1.74-.6-.596-1.027-1.267-1.34-1.875A9 9 0 1 0 12 3a1 1 0 0 1-1.001-1Z"></path>
											</svg><span class="nd0" style="display:none;"> 0 </span> <!----></span><span class="nd">Мой ClustBUY</span></a>
									</div>
								</nav>
							</div>
						</div>
						<div data-replace-layout-path="[4][0][2][0]" class="p2k kp9 p4k kp6 k7p" style="width:auto;" data-widget="webPdpGrid">
							<div data-replace-layout-path="[4][0][2][0][0][0]" class="p2k p3k p4k pk5" style="width:auto;" data-widget="webPdpGrid">
								<div class="i8e" data-widget="breadCrumbs">
									<ol class="ei7">
										<li class="e7i">
											<a target="_self" href="/category/zaryadnye-ustroystva-dlya-noutbukov-15924/" class="a5g ei8"><span>Зарядные устройства</span></a>
											<meta content="1">
											<svg xmlns="http://www.w3.org/2000/svg" width="10" height="13" class="ie7">
												<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
											</svg>
										</li>
										<li class="e7i">
											<a target="_self" href="/category/zaryadnye-ustroystva-dlya-noutbukov-15924/86812567/" class="a5g ei8"><span>ZeepDeep</span></a>
											<meta content="2">
										</li>
									</ol>
								</div>
								<div data-replace-layout-path="[4][0][2][0][0][0][1][0]" class="p2k p3k k4p p5k kp7" style="width:auto;" data-widget="webPdpGrid">
									<div class="d4147-a" data-widget="webAddToFavorite">
										<div class="r1j a2429-a">
											<button tabindex="0" type="button" aria-label="Добавить в избранное" class="a2429-a4">
												<span class="a2429-b1 a2429-c5 a2429-f0">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
														<path fill="currentColor" d="M7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Zm5 17c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Z"></path>
													</svg><span class="a2429-e7"></span></span>
											</button>
										</div>
									</div>
									<div class="j6p" data-widget="webSharingButton">
										<div class="l2r">
											<div class="a2429-a">
												<button tabindex="0" type="button" aria-label="Поделиться" class="a2429-a4">
													<span class="a2429-b1 a2429-c5 a2429-f0">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
															<path fill="currentColor" d="M11.293 1.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1-1.414 1.414L13 4.414V13a1 1 0 1 1-2 0V4.414L9.707 5.707a1 1 0 0 1-1.414-1.414l3-3ZM3 11a3 3 0 0 1 3-3h2a1 1 0 0 1 0 2H6a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-8a1 1 0 0 0-1-1h-2a1 1 0 1 1 0-2h2a3 3 0 0 1 3 3v8a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3v-8Z"></path>
														</svg><span class="a2429-e7"></span></span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div data-widget="webMobGallery">
								<div class="ku1" style="padding-top: 117.801%;">
									<div class="u2k">
										<div class="jm8">
											<div class="jm4"><img elementtiming="lcp_eltiming_webMobGallery-2912987-default-1" data-lcp-name="webMobGallery-2912987-default-1" loading="eager" fetchpriority="high" src="https://ir.ozone.ru/s3/multimedia-x/wc500/6204696285.jpg" alt="Блок питания для ноутбука Asus ADL-65A1, 5.V 3A, 9V 3A, 15V 3A, 20V 3.25A, Type-C, 65W  #1" class="j4m b9414-a">
											</div>
										</div>
										<div class="k5u">
											<div data-index="0" class="u0k jn1 jn3 n1j">
												<div class="j1n">
													<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32">
														<path fill="currentColor" d="M16 4C6.118 4 4 6.118 4 16c0 .461.005.905.014 1.333-.014.667.428.922 1.32.164 1.884-1.604 4.16-2.83 6.666-2.83 1.582 0 3.049.55 4.334 1.318 1.33.794 1.438.682 2.352 0a6.637 6.637 0 0 1 3.98-1.318 6.63 6.63 0 0 1 3.575 1.038c1.759 1.12 1.756 1.202 1.756-.372C27.899 6.023 25.656 4 16 4Zm4 7.333a2 2 0 1 1-4 0 2 2 0 0 1 4 0Z"></path><path fill="currentColor" d="M12 17.333c1.054 0 2.125.41 3.157 1.058.843.53 1.008.946.876 2.276a6.65 6.65 0 0 0 2.133 5.585c1.834 1.68 1.834 1.62.215 1.697-.739.035-1.531.051-2.381.051-6.692 0-9.823-.971-11.148-4.667-.365-1.018-.211-1.293.481-2.107 1.7-1.998 4.049-3.893 6.667-3.893Z"></path><path fill="currentColor" d="M22.667 16a5.333 5.333 0 1 0 2.709 9.928l1.681 1.681a1.333 1.333 0 1 0 1.886-1.885l-1.681-1.681A5.333 5.333 0 0 0 22.667 16ZM20 21.333a2.667 2.667 0 1 1 5.333 0 2.667 2.667 0 0 1-5.333 0Z"></path>
													</svg>
												</div>
											</div>
										</div>
										<div class="ku4">
											<div data-widget-disallow="[4][0][2][0][1]"></div>
										</div>
									</div>
									<div class="u4k">
										<div class="uk">
											<div class="ku0" style="transform:translate(-0px);">
												<span class="k0u uk0"></span><span class="k0u"></span><span class="k0u"></span>
											</div>
										</div>
									</div>
								</div>
								<!---->
							</div>
							<div class="pj6" data-widget="webMarketingLabels">
								<div class="qk9 q9k">
									<div class="qk8 k9q">
										<div tabindex="1" class="q8k b410-a0 b410-a6" style="background-color:#F91155;color:#FFFFFF;">
											<div class="b410-b">
												<div title="-56%" class="b410-b0 tsBodyControl300XSmall">
													-56%
												</div>
											</div>
										</div>
										<!---->
									</div>
									<div class="qk8 k9q">
										<div class="d4147-a">
											<div tabindex="1" class="q8k b410-a0 b410-a6 b410-a1 b410-a8 b410-a9" style="background-color:#F2F1FD;color:#5B51DE;">
												<div class="b410-b">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color: rgb(91, 81, 222);">
														<path fill="currentColor" d="M10 9.333c0-.333 0-.666-.667-.666H6.667V10h2.666C10 10 10 9.667 10 9.333Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333c-1 0-1.334.333-1.334 1.333v4c0 1 .334 1.333 1.41 1.333h1.943c.318 0 .633 0 .911-.023.281-.023.589-.074.868-.214.303-.151.539-.39.686-.721.137-.308.182-.663.182-1.042s-.045-.734-.182-1.041a1.44 1.44 0 0 0-.686-.722c-.28-.14-.587-.19-.868-.214-.278-.023-.593-.023-.911-.023h-2.02V6H10a.667.667 0 1 0 0-1.333H6.667Z" clip-rule="evenodd"></path>
													</svg>
													<div title="70 баллов за отзыв" class="b410-b0 tsBodyControl300XSmall">
														70 баллов за отзыв
													</div>
												</div>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-a3" style="color:#5B51DE;">
													<path fill="currentColor" d="M6.293 4.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1 0 1.414l-3 3a1 1 0 0 1-1.414-1.414L8.586 8 6.293 5.707a1 1 0 0 1 0-1.414Z"></path>
												</svg><div class="b410-a" style="background-color:#5B51DE;"></div>
											</div>
										</div>
										<!---->
									</div>
									<div class="qk8 k9q">
										<div class="d4147-a">
											<div tabindex="1" class="q8k b410-a0 b410-a6 b410-a1 b410-a8 b410-a9" style="background-color:#F2F1FD;color:#5B51DE;">
												<div class="b410-b">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color: rgb(91, 81, 222);">
														<path fill="currentColor" d="M6.667 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333a3.333 3.333 0 1 0 0 6.667 3.333 3.333 0 0 0 0-6.667ZM11 5.114a.667.667 0 0 0-.668 1.154 1.998 1.998 0 0 1 0 3.465.667.667 0 0 0 .668 1.155 3.333 3.333 0 0 0 0-5.774Z" clip-rule="evenodd"></path>
													</svg>
													<div title="87 бонусов" class="b410-b0 tsBodyControl300XSmall">
														87 бонусов
													</div>
												</div>
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-a3" style="color:#5B51DE;">
													<path fill="currentColor" d="M6.293 4.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1 0 1.414l-3 3a1 1 0 0 1-1.414-1.414L8.586 8 6.293 5.707a1 1 0 0 1 0-1.414Z"></path>
												</svg><div class="b410-a" style="background-color:#5B51DE;"></div>
											</div>
										</div>
										<!---->
									</div>
								</div>
							</div>
							<div class="u6k" data-widget="webMobProductHeading">
								<h1 style="max-height: 52px; -webkit-line-clamp: 2;"> Блок питания для ноутбука Asus ADL-65A1, 5.V 3A, 9V 3A, 15V 3A, 20V 3.25A, Type-C, 65W </h1>
								<div class="ku7">
									<span class="k7u">ещё</span>
								</div>
							</div>
							<div class="lo8" data-widget="webSale">
								<div class="l8o">
									<!---->
									<div class="pl">
										<div class="lp0">
											<div class="l0p">
												<div data-replace-layout-path="[4][0][2][0][5][0]">
													<div params="[object Object]" class="l3l ll4" data-widget="webPrice">
														<!---->
														<div class="l1l">
															<div class="zk7 k9z a2429-a a2429-a3">
																<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
																	<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius:8px;">
																		<div class="mj">
																			<div class="jm0 j0m">
																				<div class="z7k">
																					<div class="kz8 k7z">
																						<span class="l0l zk9">1&thinsp;201&thinsp;₽</span><!---->
																					</div>
																					<span class="zk8 k7z ll">c ClustBUY Картой</span>
																				</div>
																			</div>
																			<div class="m0j jm1">
																				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="j1m m1j">
																					<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
																				</svg>
																			</div>
																		</div></span>
																</button>
															</div>
															<!---->
															<div class="l7l l3m m1l">
																<div class="l1m">
																	<div class="ml1">
																		<span class="lm ml l2m ml3">1&thinsp;251&thinsp;₽</span><!---->
																		<span class="ll9 lm0 ll7 lm2 ml2">2&thinsp;728&thinsp;₽</span><!---->
																	</div>
																	<div class="m0l">
																		<span class="ll9 l9l lm2">без ClustBUY Карты</span>
																	</div>
																</div>
																<!---->
															</div>
															<!---->
														</div>
														<!---->
														<!---->
														<div>
															<!---->
														</div>
														<!---->
													</div>
												</div>
											</div>
										</div>
										<div class="pl0">
											<div data-replace-layout-path="[4][0][2][0][5][1]">
												<div class="s9d" style="height:8px;" data-widget="separator"></div>
												<div class="k7w wk7 a2429-a a2429-a3" data-widget="webPriceDecreasedCompact">
													<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
														<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius:8px;">
															<div class="mj">
																<div class="jm0">
																	<div class="kw6">
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="k6w">
																			<path fill="currentColor" d="M5.333.095C1.014.485 0 2.308 0 7.998 0 14.222.889 16 8 16s8-1.778 8-8.002c0-5.78-1.014-7.512-5.333-7.903-1.778-.16-1.778-.366-1.778 1.679v7.113l2.133-1.6a.889.889 0 1 1 1.067 1.422l-3.556 2.668a.889.889 0 0 1-1.066 0L3.91 8.709a.89.89 0 0 1 1.067-1.422l2.133 1.6V1.774c0-2.045 0-1.84-1.778-1.679Z"></path>
																		</svg>
																		<span class="a0k w6k"><span style="color:;">Стало дешевле</span></span>
																	</div>
																</div>
																<div class="m0j">
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="j1m">
																		<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
																	</svg>
																</div>
															</div></span>
													</button>
												</div><div class="s9d" style="height:8px;" data-widget="separator"></div><div class="s9d" style="height:1px;background-color:rgba(204, 214, 228, 0.6);" data-widget="separator"></div><div class="s9d" style="height:8px;" data-widget="separator"></div><a href="https://www.ru.market/section/limit" data-widget="webInstallmentPurchase">
												<div class="kq6">
													<span class="q4k">234&thinsp;₽</span>
													<div class="k6q">
														<span>× 6 месяцев</span><span>в ClustBUY Рассрочку</span>
													</div>
													<div class="k1q qk6" style="display: none;"></div>
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="k5q">
														<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
													</svg>
												</div></a>
											</div>
										</div>
									</div>
									<!---->
									<!---->
									<!---->
								</div>
							</div>
						</div>
					</div><div class="s9d" style="height:16px;" data-widget="separator"></div>
					<div data-replace-layout-path="[7][0]" class="container b4 b6" data-widget="container">
						<div class="ql9 q9l" style="height:8px;background-color:rgba(245, 247, 250, 1);" data-widget="webSeparator">
							<div class="lr">
								<div class="rl0" style="box-shadow:-20px 20px 0 0 rgba(245, 247, 250, 1);"></div>
							</div>
							<div class="rl">
								<div class="rl0" style="box-shadow:20px 20px 0 0 rgba(245, 247, 250, 1);"></div>
							</div>
							<div class="lr0">
								<div class="rl0" style="box-shadow:-20px -20px 0 0 rgba(245, 247, 250, 1);"></div>
							</div>
							<div class="l0r">
								<div class="rl0" style="box-shadow:20px -20px 0 0 rgba(245, 247, 250, 1);"></div>
							</div>
						</div>
					</div><div class="s9d" style="height:16px;" data-widget="separator"></div>
					<div data-replace-layout-path="[9][0]" class="container b4 b6" data-widget="container">
						<!----><!---->
						<div style="min-height:0px;" data-widget="paginator">
							<div data-widget-disallow="[9][0][2]" class="">
								<div class="p2k kp9 p4k kp6 k7p" data-widget="webPdpGrid" style="width: auto;">
									<div class="pj6" data-widget="webDescription">
										<div id="section-description">
											<h2 class="mk5">Описание</h2>
											<div>
												<!---->
												<div class="undefined">
													<div class="mk2" style="">
														<div class="ra-a1">
															Данный блок питания (зарядка) для ноутбука изготовлен и высококачественных материалов, что позволяет обеспечить надежность, безопасность и длительное время использования. Для того, чтобы приобрести нужный Вам товар, сверьте все технические характеристики с Вашим старым блоком питания.
															<br>
															Если сомневаетесь в том, подойдет ли данный товар к Вашему ноутбуку, Вы можете уточнить совместимость, задав нам вопрос в разделе "Отзывы и вопросы о товаре". Мы обязательно проверим и поможем в выборе подходящего товара.
															<br>
															А еще товар отгружается в стандартную службу доставки ClustBUY с нашего склада уже спустя 6 часов после заказа.
															<br>
															<br>
															● Подходит для: Asus.
															<br>
															● Напряжение: 20V.
															<br>
															● Разъем: Type-C.
															<br>
															● Сила тока: 3.25A.
															<br>
															● Мощность: 65W.
														</div>
													</div>
													<!---->
													<!---->
												</div>
												<!---->
											</div>
										</div>
									</div>
									<div id="customBlock" data-widget="customBlock">
										<div>
											<style>
												@import url('https://cdn2.ozone.ru/s3/cblocks/pdp-characteristics-tab/0.0.1/app-main-e75095bfe78bb0155e32.css');
											</style>
										</div>
										<div data-custom-block="pdp-characteristics-tab:0.0.1">
											<div id="tab-characteristics" class="d2a-a"></div>
										</div>
									</div>
									<div class="pj6" data-widget="webDescription">
										<div id="section-description">
											<!---->
											<div class="undefined">
												<div class="mk2" style="">
													<div class="ra-a1">
														<h3>Список совместимых устройств</h3>
														<p>
															Asus B9440UA GV0433R, Asus Deluxe UX490UA, Dell 7370, Dell XPS 12 9250, HP 13-v006ur, HP Elite x2 1012 G1, HP Folio G1, HP Pro 13 G1, HP x2 10-p001ur, HP x2 10-p002ur, Lenovo 910-13ikb, Lenovo yoga 920-13ikb
														</p><h3>Комплектация</h3>
														<p>
															блок питания, сетевой кабель
														</p>
													</div>
												</div>
												<!---->
												<!---->
											</div>
										</div>
									</div>
									<div class="pj6" data-widget="webCharacteristics">
										<div id="section-description" class="j0t">
											<div class="js9">
												<h2 class="j1t"><a href="https://www.ru.market/product/blok-pitaniya-dlya-noutbuka-asus-adl-65a1-5-v-3a-9v-3a-15v-3a-20v-3-25a-type-c-65w-447576013/features/" class="s8j">Характеристики</a></h2>
											</div>
											<div class="">
												<div class="s9j">
													<div class="tj jt0">
														Общие
													</div>
													<div class="jt">
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Гарантийный срок
																	<div class="jo4 j3t">
																		<div class="a2429-a">
																			<button tabindex="0" type="button" class="a2429-a4">
																				<span class="a2429-b1 a2429-c5 a2429-f0">
																					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9" style="color: rgba(0, 26, 52, 0.2);">
																						<path fill="currentColor" d="M8 0c4.964 0 8 3.036 8 8s-3.036 8-8 8-8-3.036-8-8 3.036-8 8-8Zm-.889 11.556a.889.889 0 0 0 1.778 0V8A.889.889 0 0 0 7.11 8v3.556ZM8.89 4.444a.889.889 0 1 0-1.778 0 .889.889 0 0 0 1.778 0Z"></path>
																					</svg><span class="a2429-e7"></span></span>
																			</button>
																		</div>
																	</div></span>
															</dt>
															<dd class="j2t">
																1 год
															</dd>
														</dl>
													</div>
												</div>
												<div class="s9j">
													<div class="tj">
														Дополнительные
													</div>
													<div class="jt">
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Тип</span>
															</dt>
															<dd class="j2t">
																Блок питания для ноутбука
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Подходит для</span>
															</dt>
															<dd class="j2t">
																<a href="/category/bloki-pitaniya-dlya-noutbukov-asus/">ASUS</a>
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Выходное напряжение, В</span>
															</dt>
															<dd class="j2t">
																20
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Макс. выходной ток, А</span>
															</dt>
															<dd class="j2t">
																3.25
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Макс. выходная мощность, Вт</span>
															</dt>
															<dd class="j2t">
																65
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Выходной коннектор</span>
															</dt>
															<dd class="j2t">
																USB тип C (штекер)
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Входной коннектор</span>
															</dt>
															<dd class="j2t">
																Сетевая вилка
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Страна-изготовитель</span>
															</dt>
															<dd class="j2t">
																Китай
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Цвет</span>
															</dt>
															<dd class="j2t">
																Черный
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Партномер</span>
															</dt>
															<dd class="j2t">
																ADP-65UD B
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Назначение</span>
															</dt>
															<dd class="j2t">
																Для ноутбуков
															</dd>
														</dl>
														<dl class="jt3">
															<dt class="jt2">
																<span class="tj2">Вес товара, г</span>
															</dt>
															<dd class="j2t">
																285
															</dd>
														</dl>
													</div>
												</div>
											</div><small class="jt1">Информация о технических характеристиках, комплекте поставки, стране изготовления, внешнем виде и цвете товара носит справочный характер и основывается на последних доступных к моменту публикации сведениях</small>
										</div>
									</div>
									<div class="ql9 q9l" data-widget="webSeparator" style="height: 8px; background-color: rgb(245, 247, 250);">
										<div class="lr">
											<div class="rl0" style="box-shadow: rgb(245, 247, 250) -20px 20px 0px 0px;"></div>
										</div>
										<div class="rl">
											<div class="rl0" style="box-shadow: rgb(245, 247, 250) 20px 20px 0px 0px;"></div>
										</div>
										<div class="lr0">
											<div class="rl0" style="box-shadow: rgb(245, 247, 250) -20px -20px 0px 0px;"></div>
										</div>
										<div class="l0r">
											<div class="rl0" style="box-shadow: rgb(245, 247, 250) 20px -20px 0px 0px;"></div>
										</div>
									</div>
									<div class="jo5">
										<div class="kl9 km2">
											<h2 class="k9l">Информация о доставке</h2>
											<div class="l9k mk0">
												<div class="mk a2429-a a2429-a3">
													<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius: 8px;">
														<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius: 8px;">
															<div class="mj">
																<div class="jm0">
																	<div class="jl8 lj8">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
																			<path fill="currentColor" d="M12 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10Zm-3 5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Z"></path><path fill="currentColor" d="M12 1a9 9 0 0 0-9 9c0 2.514 1.136 4.848 2.699 6.942 1.565 2.099 3.631 4.05 5.643 5.81a1 1 0 0 0 1.316 0c2.012-1.76 4.078-3.711 5.644-5.81C19.864 14.848 21 12.514 21 10a9 9 0 0 0-9-9Zm-7 9a7 7 0 0 1 14 0c0 1.904-.864 3.82-2.302 5.746-1.275 1.71-2.945 3.353-4.698 4.92-1.753-1.567-3.423-3.21-4.699-4.92C5.864 13.82 5 11.904 5 10Z"></path>
																		</svg>
																	</div>
																</div><span class="a0k mj0"><span>улица Бориса Пастернака, 14</span>
																	<br>
																	<span class="a1k">Со склада продавца, Москва</span></span>
																<div class="m0j">
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="j1m">
																		<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
																	</svg>
																</div>
															</div></span>
													</button>
												</div>
												<!---->
											</div>
											<div class="l9k km1">
												<div class="km"></div>
												<!---->
											</div>
											<div class="l9k">
												<!---->
												<span class="a0k"><span>Курьером ClustBUY</span>
													<br>
													<span class="a1k">12 ноября</span><span class="a1k"> — </span><span class="k1a">149&thinsp;₽</span></span><!---->
											</div>
											<div class="l9k">
												<!---->
												<span class="a0k"><span>Пункты выдачи и постаматы</span>
													<br>
													<span class="a1k">13 ноября</span><span class="a1k"> — </span><span class="a1k">бесплатно</span></span><!---->
											</div>
											<!---->
											<!---->
										</div><!---->
									</div>
								</div>
								<div data-widget="paginator" style="min-height: 0px;">
									<div class="">
										<div class="s9d" data-widget="separator" style="height: 16px;"></div>
									</div>
									<!---->
									<!---->
								</div>
							</div>
							<!---->
							<!---->
						</div>
					</div><div class="s9d" style="height:100px;" data-widget="separator"></div>

					~~else~

					<div style="display:none;" data-widget="webProductMainWidget"></div>
					<div data-replace-layout-path="[4][0]" class="container b4" data-widget="container">
						<div data-replace-layout-path="[4][0][0][0]" class="e0" data-widget="row">
							<div data-replace-layout-path="[4][0][0][0][0][0]" class="c7" data-widget="column">
								<div data-replace-layout-path="[4][0][0][0][0][0][0][0]" class="p2k p4k pk5 kp7" style="width:auto;" data-widget="webPdpGrid">
									<div class="" data-widget="breadCrumbs">
										<ol class="ei7">
											<li class="e7i">
												<span class="a5g ei8"><span>Электроника</span></span>
												<meta content="1">
												<svg xmlns="http://www.w3.org/2000/svg" width="10" height="13" class="ie7">
													<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
												</svg>
											</li>
											<li class="e7i">
												<span class="a5g ei8"><span>Ноутбуки, планшеты и электронные книги</span></span>
												<meta content="2">
												<svg xmlns="http://www.w3.org/2000/svg" width="10" height="13" class="ie7">
													<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
												</svg>
											</li>
											<li class="e7i">
												<a target="_self" href="/category/zaryadnye-ustroystva-dlya-noutbukov-15924/" class="a5g ei8"><span>Зарядные устройства</span></a>
												<meta content="3">
												<svg xmlns="http://www.w3.org/2000/svg" width="10" height="13" class="ie7">
													<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
												</svg>
											</li>
											<li class="e7i">
												<a target="_self" href="/category/zaryadnye-ustroystva-dlya-noutbukov-15924/86812567/" class="a5g ei8"><span>ZeepDeep</span></a>
												<meta content="4">
											</li>
										</ol>
									</div>
								</div><div class="s9d" style="height:10px;" data-widget="separator"></div>
							</div>
						</div>
						<div data-replace-layout-path="[4][0][1][0]" class="e0" data-widget="row">
							<div data-replace-layout-path="[4][0][1][0][0][0]" class="c7" data-widget="column">
								<div data-replace-layout-path="[4][0][1][0][0][0][0][0]" class="p2k kp9 p4k kp6 kp7" style="width:auto;" data-widget="webPdpGrid">
									<div data-replace-layout-path="[4][0][1][0][0][0][0][0][0][0]" class="p2k kp9 kp7" style="width:auto;" data-widget="webPdpGrid">
										<div data-widget="webProductHeading">
											<h1 class="m4l">~~$item.title~</h1>
										</div>
									</div>
									<div data-replace-layout-path="[4][0][1][0][0][0][0][0][1][0]" class="p2k p4k pk5 pk7" style="width:auto;" data-widget="webPdpGrid">
										<div data-replace-layout-path="[4][0][1][0][0][0][0][0][1][0][0][0]" class="p2k pk5 pk7" style="width:auto;" data-widget="webPdpGrid">
											<div data-replace-layout-path="[4][0][1][0][0][0][0][0][1][0][0][0][0][0]" class="p2k pk5 pk7" style="width:auto;" data-widget="webPdpGrid">
												<div data-widget="webReviewProductScore">
													<div class="r9y">
														<div class="pv4">
															<div class="e1317-a e1317-a0 p4v">
																<div class="e1317-a1 e1317-a2">
																	<div class="e1317-a9 e1317-a2"></div>
																	<div class="e1317-b e1317-a2" style="width:100%;"></div>
																</div>
																<!---->
															</div>
															<div class="a2429-a">
																<a href="/product/blok-pitaniya-dlya-noutbuka-asus-adl-65a1-5-v-3a-9v-3a-15v-3a-20v-3-25a-type-c-65w-447576013/reviews/" title="6&nbsp;отзывов" class="a2429-a4 a2429-b0">
																<div class="a2429-b1 a2429-c5">
																	<div class="a2429-e7">
																		6&nbsp;отзывов
																	</div>
																</div></a>
															</div>
														</div>
													</div>
												</div>
												<div class="rr3" data-widget="webQuestionCount">
													<div class="a2429-a">
														<a href="https://www.ru.market/product/blok-pitaniya-dlya-noutbuka-asus-adl-65a1-5-v-3a-9v-3a-15v-3a-20v-3-25a-type-c-65w-447576013/questions/" title="1 вопрос" class="a2429-a4 a2429-b0">
														<div class="a2429-b1 a2429-c5">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
																<path fill="currentColor" d="M9 10a1 1 0 1 1-1.016-1 1 1 0 0 1-.231-1.969l.004-.001.038-.011a2.9 2.9 0 0 0 .675-.304C8.853 6.475 9 6.239 9 6a1 1 0 1 0-2 0 1 1 0 0 1-2 0 3 3 0 1 1 6 0c0 1.26-.853 2.025-1.47 2.41a4.897 4.897 0 0 1-1.154.522A1.26 1.26 0 0 1 8.015 9 1 1 0 0 1 9 10Z"></path><path fill="currentColor" d="M0 10a4.002 4.002 0 0 0 3 3.874V15a1 1 0 0 0 1.447.894l3.156-1.577A3 3 0 0 1 8.944 14H11a5 5 0 0 0 5-5V5a5 5 0 0 0-5-5H5a5 5 0 0 0-5 5v5Zm2-5a3 3 0 0 1 3-3h6a3 3 0 0 1 3 3v4a3 3 0 0 1-3 3H8.944a5 5 0 0 0-2.236.528L5 13.382V13a1 1 0 0 0-1-1 2 2 0 0 1-2-2V5Z"></path>
															</svg>
															<div class="a2429-e7">
																1 вопрос
															</div>
														</div></a>
													</div>
												</div>
											</div>
											<div class="d4147-a" data-widget="webAddToFavorite">
												<div class="r1j a2429-a">
													<button tabindex="0" type="button" aria-label="Добавить в избранное" class="a2429-a4">
														<span class="a2429-b1 a2429-c5">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
																<path fill="currentColor" d="M16 6.522C16 3.957 14.052 2 11.5 2c-1.432 0-2.665.799-3.5 1.926C7.165 2.799 5.932 2 4.5 2 1.948 2 0 3.957 0 6.522c0 2.457 1.66 4.415 3.241 5.743 1.617 1.358 3.387 2.258 4.062 2.577.444.21.95.21 1.394 0 .675-.32 2.445-1.219 4.062-2.577C14.339 10.937 16 8.979 16 6.522Zm-7.719 6.287a.547.547 0 0 1-.562 0c-.763-.39-2.035-1.11-3.195-2.086C3.06 9.494 2 8.051 2 6.522 2 5.067 3.052 4.01 4.5 4.01c.802 0 1.416.473 1.888 1.105.26.348.475.736.633 1.142.161.41.482.767.979.767s.818-.356.979-.767c.158-.406.373-.794.634-1.142.471-.632 1.085-1.105 1.887-1.105 1.448 0 2.5 1.057 2.5 2.512 0 1.53-1.06 2.972-2.524 4.201-1.16.975-2.432 1.695-3.195 2.086Z"></path>
															</svg><span class="a2429-e7">В избранное</span></span>
													</button>
												</div>
											</div>
											<div class="r0j" data-widget="webAddToCompare">
												<div class="jr1 a2429-a">
													<button tabindex="0" type="button" aria-label="Add to compare" class="a2429-a4">
														<span class="a2429-b1 a2429-c5">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
																<path fill="currentColor" d="M1 3a1 1 0 0 1 1-1h4a1 1 0 1 1 0 2H2a1 1 0 0 1-1-1Zm0 4a1 1 0 0 1 1-1h8a1 1 0 1 1 0 2H2a1 1 0 0 1-1-1Zm0 4a1 1 0 0 1 1-1h4a1 1 0 1 1 0 2H2a1 1 0 0 1-1-1Zm12-3a1 1 0 0 1 1 1v1h1a1 1 0 1 1 0 2h-1v1a1 1 0 1 1-2 0v-1h-1a1 1 0 1 1 0-2h1V9a1 1 0 0 1 1-1Z"></path>
															</svg><span class="a2429-e7">Добавить к сравнению</span></span>
													</button>
												</div>
											</div>
											<div class="j6p" data-widget="webSharingButton">
												<div class="d4147-a">
													<div class="a2429-a">
														<button tabindex="0" type="button" aria-label="Поделиться" class="a2429-a4">
															<span class="a2429-b1 a2429-c5">
																<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
																	<path fill="currentColor" d="M7.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1-1.414 1.414L9 4.414V9a1 1 0 1 1-2 0V4.414l-.293.293a1 1 0 0 1-1.414-1.414l2-2ZM2 9a3 3 0 0 1 3-3 1 1 0 0 1 0 2 1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1 1 1 0 1 1 0-2 3 3 0 0 1 3 3v3a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V9Z"></path>
																</svg><span class="a2429-e7">Поделиться</span></span>
														</button>
													</div>
												</div>
											</div>
										</div><span class="mk6 km7" data-widget="webDetailSKU">Код<span class="k7m"> товара</span>: 447576013</span>
									</div><div class="s9d" style="height:1px;background-color:#d6dbe0;" data-widget="separator"></div>
								</div>
							</div>
						</div>
						<div data-replace-layout-path="[4][0][2][0]" class="p2k kp8" style="width:100%;" data-widget="webPdpGrid">
							<div data-replace-layout-path="[4][0][2][0][0][0]" class="p2k kp9 p7k" style="width:calc(100% - 372px);" data-widget="webPdpGrid">
								<div data-replace-layout-path="[4][0][2][0][0][0][0][0]" class="e0" data-widget="row">
									<div data-replace-layout-path="[4][0][2][0][0][0][0][0][0][0]" class="d5 c7" data-widget="column">
										<div data-replace-layout-path="[4][0][2][0][0][0][0][0][0][0][0][0]" class="e3" style="top:64px;bottom:15px;" data-widget="stickyContainer">
											<div class="s9d" style="height:32px;" data-widget="separator"></div>
											<div data-widget="webGallery">
												<div class="k3o">
													<div class="ko5">
														<div class="jm8">
															<div class="jm4"><img elementtiming="lcp_eltiming_webGallery-1748176-default-1" data-lcp-name="webGallery-1748176-default-1" loading="eager" fetchpriority="high" src="~~$item.gallery.0~" alt="~~$item.title~" class="j4m b9414-a">
															</div>
														</div>
														<div class="ko6">
															<div data-replace-layout-path="[4][0][2][0][0][0][0][0][0][0][0][0][1][0]">
																<div class="pj6" data-widget="webMarketingLabels">
																	<div class="qk9">
																		<div class="qk8 k9q">
																			<div tabindex="1" class="q8k b410-a0" style="background-color:#F91155;color:#FFFFFF;">
																				<div class="b410-b">
																					<div title="-56%" class="b410-b0 tsBodyControl400Small">
																						-56%
																					</div>
																				</div>
																			</div>
																			<!---->
																		</div>
																		<div class="qk8 k9q">
																			<div class="d4147-a">
																				<div tabindex="1" class="q8k b410-a0 b410-a1 b410-a8 b410-a9" style="background-color:#F2F1FD;color:#5B51DE;">
																					<div class="b410-b">
																						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color:#5B51DE;">
																							<path fill="currentColor" d="M10 9.333c0-.333 0-.666-.667-.666H6.667V10h2.666C10 10 10 9.667 10 9.333Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333c-1 0-1.334.333-1.334 1.333v4c0 1 .334 1.333 1.41 1.333h1.943c.318 0 .633 0 .911-.023.281-.023.589-.074.868-.214.303-.151.539-.39.686-.721.137-.308.182-.663.182-1.042s-.045-.734-.182-1.041a1.44 1.44 0 0 0-.686-.722c-.28-.14-.587-.19-.868-.214-.278-.023-.593-.023-.911-.023h-2.02V6H10a.667.667 0 1 0 0-1.333H6.667Z" clip-rule="evenodd"></path>
																						</svg>
																						<div title="70 баллов за отзыв" class="b410-b0 tsBodyControl400Small">
																							70 баллов за отзыв
																						</div>
																					</div>
																					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-a3" style="color:#5B51DE;">
																						<path fill="currentColor" d="M6.293 4.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1 0 1.414l-3 3a1 1 0 0 1-1.414-1.414L8.586 8 6.293 5.707a1 1 0 0 1 0-1.414Z"></path>
																					</svg><div class="b410-a" style="background-color:#5B51DE;"></div>
																				</div>
																			</div>
																			<!---->
																		</div>
																		<div class="qk8 k9q">
																			<div class="d4147-a">
																				<div tabindex="1" class="q8k b410-a0 b410-a1 b410-a8 b410-a9" style="background-color:#F2F1FD;color:#5B51DE;">
																					<div class="b410-b">
																						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color: rgb(91, 81, 222);">
																							<path fill="currentColor" d="M6.667 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333a3.333 3.333 0 1 0 0 6.667 3.333 3.333 0 0 0 0-6.667ZM11 5.114a.667.667 0 0 0-.668 1.154 1.998 1.998 0 0 1 0 3.465.667.667 0 0 0 .668 1.155 3.333 3.333 0 0 0 0-5.774Z" clip-rule="evenodd"></path>
																						</svg>
																						<div title="87 бонусов" class="b410-b0 tsBodyControl400Small">
																							87 бонусов
																						</div>
																					</div>
																					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-a3" style="color:#5B51DE;">
																						<path fill="currentColor" d="M6.293 4.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1 0 1.414l-3 3a1 1 0 0 1-1.414-1.414L8.586 8 6.293 5.707a1 1 0 0 1 0-1.414Z"></path>
																					</svg><div class="b410-a" style="background-color:#5B51DE;"></div>
																				</div>
																			</div>
																			<!---->
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="k5o">
															<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32">
																<path fill="currentColor" d="M16 4C6.118 4 4 6.118 4 16c0 .461.005.905.014 1.333-.014.667.428.922 1.32.164 1.884-1.604 4.16-2.83 6.666-2.83 1.582 0 3.049.55 4.334 1.318 1.33.794 1.438.682 2.352 0a6.637 6.637 0 0 1 3.98-1.318 6.63 6.63 0 0 1 3.575 1.038c1.759 1.12 1.756 1.202 1.756-.372C27.899 6.023 25.656 4 16 4Zm4 7.333a2 2 0 1 1-4 0 2 2 0 0 1 4 0Z"></path><path fill="currentColor" d="M12 17.333c1.054 0 2.125.41 3.157 1.058.843.53 1.008.946.876 2.276a6.65 6.65 0 0 0 2.133 5.585c1.834 1.68 1.834 1.62.215 1.697-.739.035-1.531.051-2.381.051-6.692 0-9.823-.971-11.148-4.667-.365-1.018-.211-1.293.481-2.107 1.7-1.998 4.049-3.893 6.667-3.893Z"></path><path fill="currentColor" d="M22.667 16a5.333 5.333 0 1 0 2.709 9.928l1.681 1.681a1.333 1.333 0 1 0 1.886-1.885l-1.681-1.681A5.333 5.333 0 0 0 22.667 16ZM20 21.333a2.667 2.667 0 1 1 5.333 0 2.667 2.667 0 0 1-5.333 0Z"></path>
															</svg>
														</div>
													</div>
													<div class="ok3">
														<div class="o3k">
															<div class="ok8">
																<div data-index="0" class="jn nj">
																	<div class="jn0"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-x/wc50/6204696285.jpg" srcset="https://ir.ozone.ru/s3/multimedia-x/wc100/6204696285.jpg 2x" class="b9414-a">
																	</div>
																</div>
																<div data-index="1" class="jn">
																	<div class="jn0"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-l/wc50/6204696201.jpg" srcset="https://ir.ozone.ru/s3/multimedia-l/wc100/6204696201.jpg 2x" class="b9414-a">
																	</div>
																</div>
																<div data-index="2" class="jn">
																	<div class="jn0"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-7/wc50/6204696223.jpg" srcset="https://ir.ozone.ru/s3/multimedia-7/wc100/6204696223.jpg 2x" class="b9414-a">
																	</div>
																</div>
															</div>
														</div>
														<div>
															<div class=""></div>
														</div>
													</div>
												</div>
												<!---->
											</div>
										</div>
									</div>
									<div data-replace-layout-path="[4][0][2][0][0][0][0][0][1][0]" class="c7" data-widget="column">
										<div data-replace-layout-path="[4][0][2][0][0][0][0][0][1][0][0][0]" class="p2k kp9 kp6 p7k" style="width:auto;" data-widget="webPdpGrid">
											<div class="s9d" style="height:8px;" data-widget="separator"></div>
											<div data-replace-layout-path="[4][0][2][0][0][0][0][0][1][0][0][0][1][0]" class="p2k kp9 kp6 p7k" style="width:auto;" data-widget="webPdpGrid">
												<div class="pj6" data-widget="webCharacteristics">
													<div>
														<div>
															<div class="s9j">
																<div class="jt">
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Тип</span>
																		</dt>
																		<dd class="j2t">
																			Блок питания для ноутбука
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Подходит для</span>
																		</dt>
																		<dd class="j2t">
																			<a href="/category/bloki-pitaniya-dlya-noutbukov-asus/">ASUS</a>
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Выходное напряжение, В</span>
																		</dt>
																		<dd class="j2t">
																			20
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Макс. выходной ток, А</span>
																		</dt>
																		<dd class="j2t">
																			3.25
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Макс. выходная мощность, Вт</span>
																		</dt>
																		<dd class="j2t">
																			65
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Выходной коннектор</span>
																		</dt>
																		<dd class="j2t">
																			USB тип C (штекер)
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Входной коннектор</span>
																		</dt>
																		<dd class="j2t">
																			Сетевая вилка
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Страна-изготовитель</span>
																		</dt>
																		<dd class="j2t">
																			Китай
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Цвет</span>
																		</dt>
																		<dd class="j2t">
																			Черный
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Партномер</span>
																		</dt>
																		<dd class="j2t">
																			ADP-65UD B
																		</dd>
																	</dl>
																</div>
															</div>
														</div><a target="_self" href="#section-description--offset-140" class="t1j">Перейти к описанию</a>
													</div>
												</div>
												<div data-replace-layout-path="[4][0][2][0][0][0][0][0][1][0][0][0][1][0][1][0]" class="e0" data-widget="row">
													<div data-widget-disallow="[4][0][2][0][0][0][0][0][1][0][0][0][1][0][1][0][0]" class="d7 c7 c9" data-widget="column"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="custom-html desktop" data-widget="customHtml">
									<div></div>
									<div class="custom-html__container">
										<span id="short-product-info-trigger-new"></span>
									</div>
								</div>
							</div>
							<div data-replace-layout-path="[4][0][2][0][1][0]" class="p2k kp9 kp6 k6p" style="width:340px;" data-widget="webPdpGrid">
								<div class="s9d" style="height:16px;" data-widget="separator"></div>
								<div data-replace-layout-path="[4][0][2][0][1][0][1][0]" class="p2k kp9 kp6 pk6" style="padding:8px  0px;width:340px;" data-widget="webPdpGrid">
									<div class="bp3 p3b" data-widget="blackFridayStatus"><img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc75/293_sale_bigPromo_logo_5a7bb155-ca41-4ff0-8b56-2899eb52fd84.png" srcset="https://ir.ozone.ru/s3/blackfriday-widgets-api-images/img/wc150/293_sale_bigPromo_logo_5a7bb155-ca41-4ff0-8b56-2899eb52fd84.png 2x" class="pb3 b9414-a">
										<div class="b4p">
											<div class="pb4">
												<div class="b5p">
													<!---->
													<div class="b7a ab9 a9b" style="color:rgba(0, 0, 0, 1);margin-bottom:4px;">
														<span class="tsBodyControl400Small">Распродажа 11.11</span>
													</div>
													<div class="b7a ab9 a9b" style="color:rgba(0, 26, 52, 0.6);">
														<span class="tsBodyControl400Small">уже идёт</span>
													</div>
													<!---->
												</div>
												<div class="pb5">
													<div class="b6p">
														<span>
															<div class="p7b" style="height:40px;">
																<div class="b8p pb8" style="background-color:#F81155;width:auto;">
																	<div style="color:rgba(255, 255, 255, 1);font-size:20px;" class="">
																		5 дней
																	</div>
																</div>
															</div> <!----></span>
														<div class="b7a ab9 a9b pb6" style="color:#F81155;">
															<span class="tsBodyControl500Medium">осталось</span>
														</div>
													</div>
													<!---->
													<!---->
												</div>
											</div>
											<!---->
										</div>
									</div>
									<div class="ol5 o7l" data-widget="webSale">
										<div class="lo7 ol7">
											<div class="o5l">
												<div data-replace-layout-path="[4][0][2][0][1][0][1][0][1][0]">
													<div params="[object Object]" class="l3l" data-widget="webPrice">
														<!---->
														<div class="l1l">
															<div class="zk7 a2429-a a2429-a3">
																<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
																	<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius:8px;">
																		<div class="mj">
																			<div class="jm0 j0m">
																				<div class="z7k">
																					<div class="kz8 k7z">
																						<span class="l0l z8k">1&thinsp;201&thinsp;₽</span><!---->
																					</div>
																					<span class="zk8 k7z">c ClustBUY Картой</span>
																				</div>
																			</div>
																			<div class="m0j jm1">
																				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="j1m">
																					<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
																				</svg>
																			</div>
																		</div></span>
																</button>
															</div>
															<!---->
															<div class="l7l l3m">
																<div class="l1m">
																	<div class="ml1">
																		<span class="lm ml ml3">1&thinsp;251&thinsp;₽</span><!---->
																		<span class="ll9 lm0 ll7 l9l">2&thinsp;728&thinsp;₽</span><!---->
																	</div>
																	<div class="m0l">
																		<span class="ll9 l9l">без ClustBUY Карты</span>
																	</div>
																</div>
																<!---->
															</div>
															<!---->
														</div>
														<!---->
														<!---->
														<div>
															<!---->
														</div>
														<!---->
													</div>
												</div>
											</div>
											<div class="ol6">
												<div data-replace-layout-path="[4][0][2][0][1][0][1][0][1][1]">
													<div class="k7w a2429-a a2429-a3" data-widget="webPriceDecreasedCompact">
														<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:8px;">
															<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius:8px;">
																<div class="mj">
																	<div class="jm0">
																		<div class="kw6">
																			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="k6w">
																				<path fill="currentColor" d="M5.333.095C1.014.485 0 2.308 0 7.998 0 14.222.889 16 8 16s8-1.778 8-8.002c0-5.78-1.014-7.512-5.333-7.903-1.778-.16-1.778-.366-1.778 1.679v7.113l2.133-1.6a.889.889 0 1 1 1.067 1.422l-3.556 2.668a.889.889 0 0 1-1.066 0L3.91 8.709a.89.89 0 0 1 1.067-1.422l2.133 1.6V1.774c0-2.045 0-1.84-1.778-1.679Z"></path>
																			</svg>
																			<span class="a0k w6k"><span style="color:;">Стало дешевле</span></span>
																		</div>
																	</div>
																	<div class="m0j">
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="j1m">
																			<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
																		</svg>
																	</div>
																</div></span>
														</button>
													</div><a href="https://www.ru.market/section/limit" data-widget="webInstallmentPurchase">
													<div class="kq3">
														<span class="qk2">234&thinsp;₽</span>
														<div class="k3q">
															<span>× 6 месяцев</span><span>в ClustBUY Рассрочку</span>
														</div>
														<div class="k1q" style="display: none;"></div>
													</div></a>
												</div>
											</div>
											<!---->
											<div class="o6l">
												<div data-replace-layout-path="[4][0][2][0][1][0][1][0][1][2]">
													<div class="jr0" data-widget="webAddToCart">
														<div class="jo5">
															<div class="d4147-a j0r">
																<div class="qj8">
																	<div class="d4147-a q8j">
																		<div class="q6j a2429-a a2429-a3">
																			<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius:12px;">
																				<span class="a2429-b1 a2429-b7 a2429-e2 a2429-a3" style="border-radius:12px;"><span class="a2429-e7">Добавить в корзину</span></span>
																			</button>
																		</div>
																	</div>
																	<div class="j7q">
																		<div class="j8q">
																			<span class="a0k"><span>Доставка </span><span class="k0a">12 ноября</span></span>
																		</div>
																	</div>
																</div>
															</div><!---->
														</div>
													</div>
												</div>
											</div>
										</div>
										<!---->
									</div>
								</div>
								<div data-replace-layout-path="[4][0][2][0][1][0][2][0]" class="p2k kp9 kp6 p7k" style="padding:12px  0px;width:auto;" data-widget="webPdpGrid">
									<div data-replace-layout-path="[4][0][2][0][1][0][2][0][0][0]" class="p2k pk6" style="width:auto;" data-widget="webPdpGrid"></div>
									<div class="jo5">
										<div class="kl9">
											<h2 class="k9l">Информация о доставке</h2>
											<div class="l9k mk0">
												<div class="mk a2429-a a2429-a3">
													<button tabindex="0" type="button" class="a2429-a4 a2429-a3" style="border-radius: 8px;">
														<span class="a2429-b1 a2429-d6 a2429-f0 a2429-a3" style="border-radius: 8px;">
															<div class="mj">
																<div class="jm0">
																	<div class="jl8 lj8">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
																			<path fill="currentColor" d="M12 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10Zm-3 5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Z"></path><path fill="currentColor" d="M12 1a9 9 0 0 0-9 9c0 2.514 1.136 4.848 2.699 6.942 1.565 2.099 3.631 4.05 5.643 5.81a1 1 0 0 0 1.316 0c2.012-1.76 4.078-3.711 5.644-5.81C19.864 14.848 21 12.514 21 10a9 9 0 0 0-9-9Zm-7 9a7 7 0 0 1 14 0c0 1.904-.864 3.82-2.302 5.746-1.275 1.71-2.945 3.353-4.698 4.92-1.753-1.567-3.423-3.21-4.699-4.92C5.864 13.82 5 11.904 5 10Z"></path>
																		</svg>
																	</div>
																</div><span class="a0k mj0"><span>Москва</span>
																	<br>
																	<span class="a1k">Со склада продавца, Москва</span></span>
																<div class="m0j">
																	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="j1m">
																		<path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
																	</svg>
																</div>
															</div></span>
													</button>
												</div>
												<!---->
											</div>
											<div class="l9k km1">
												<div class="km"></div>
												<!---->
											</div>
											<div class="l9k">
												<!---->
												<span class="a0k"><span>Курьером ClustBUY</span>
													<br>
													<span class="a1k">12 ноября</span><span class="a1k"> — </span><span class="k1a">149&thinsp;₽</span></span><!---->
											</div>
											<div class="l9k">
												<!---->
												<span class="a0k"><span>Пункты выдачи и постаматы</span>
													<br>
													<span class="a1k">12 ноября</span><span class="a1k"> — </span><span class="a1k">бесплатно</span></span><!---->
											</div>
											<!---->
											<!---->
										</div><!---->
									</div>
								</div>
							</div>
						</div>
					</div><div class="pj6" data-widget="webStickyProducts"></div>
					<div style="min-height: 0px; content-visibility: auto;" data-widget="paginator">
						<div data-widget-disallow="[6]" class="">
							<div class="container b4" data-widget="container">
								<div class="p2k kp9 kp6 k8p" data-widget="webPdpGrid" style="width: calc(100%);">
									<div class="s9d" data-widget="separator" style="height: 16px;"></div>
									<div class="q1w" data-widget="webListPhotos">
										<!---->
									</div>
								</div>
								<div class="p2k kp9 kp6 k7p" data-widget="webPdpGrid" style="width: auto;">
									<div class="e0" data-widget="row">
										<div class="d7 c7" data-widget="column">
											<div class="p2k kp9 kp6 k8p" data-widget="webPdpGrid" style="width: auto;">
												<div class="pj6" data-widget="webDescription">
													<div id="section-description">
														<h2 class="mk5">Описание</h2>
														<div>
															<!---->
															<div class="">
																<div class="mk2" style="">
																	<div class="ra-a1">
																		~~$item.params.0.PROPERTY_VALUE~
																	</div>
																</div>
																<!---->
																<!---->
															</div>
															<!---->
														</div>
													</div>
												</div>
												<div class="pj6" data-widget="webDescription">
													<div id="section-description">
														<!---->
														<div class="">
															<div class="mk2" style="">
																<div class="ra-a1">
																	<h3>Список совместимых устройств</h3>
																	<p>
																		Asus B9440UA GV0433R, Asus Deluxe UX490UA, Dell 7370, Dell XPS 12 9250, HP 13-v006ur, HP Elite x2 1012 G1, HP Folio G1, HP Pro 13 G1, HP x2 10-p001ur, HP x2 10-p002ur, Lenovo 910-13ikb, Lenovo yoga 920-13ikb
																	</p><h3>Комплектация</h3>
																	<p>
																		блок питания, сетевой кабель
																	</p>
																</div>
															</div>
															<!---->
															<!---->
														</div>
													</div>
												</div>
												<div class="pj6" data-widget="webCharacteristics">
													<div id="section-characteristics" class="">
														<div class="js9">
															<h2 class="j1t"><a href="https://www.ru.market/product/blok-pitaniya-dlya-noutbuka-asus-adl-65a1-5-v-3a-9v-3a-15v-3a-20v-3-25a-type-c-65w-447576013/features/" class="s8j">Характеристики</a></h2>
															<div class="j9s">
																<div>
																	<div class="r0j" data-widget="webAddToCompare">
																		<div class="jr1 a2429-a">
																			<button tabindex="0" type="button" aria-label="Add to compare" class="a2429-a4" style="border-radius: 8px;">
																				<span class="a2429-b1 a2429-c" style="border-radius: 8px;">
																					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9">
																						<path fill="currentColor" d="M1 3a1 1 0 0 1 1-1h4a1 1 0 1 1 0 2H2a1 1 0 0 1-1-1Zm0 4a1 1 0 0 1 1-1h8a1 1 0 1 1 0 2H2a1 1 0 0 1-1-1Zm0 4a1 1 0 0 1 1-1h4a1 1 0 1 1 0 2H2a1 1 0 0 1-1-1Zm12-3a1 1 0 0 1 1 1v1h1a1 1 0 1 1 0 2h-1v1a1 1 0 1 1-2 0v-1h-1a1 1 0 1 1 0-2h1V9a1 1 0 0 1 1-1Z"></path>
																					</svg><span class="a2429-e7">Добавить к сравнению</span></span>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="">
															<div class="s9j">
																<div class="tj jt0">
																	Общие
																</div>
																<div style="width: calc(50%);">
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Гарантийный срок
																				<div class="d4147-a o3j j3t">
																					<div class="a2429-a">
																						<button tabindex="0" type="button" class="a2429-a4">
																							<span class="a2429-b1 a2429-c5 a2429-f0">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="a2429-e9" style="color: rgba(0, 26, 52, 0.2);">
																									<path fill="currentColor" d="M8 0c4.964 0 8 3.036 8 8s-3.036 8-8 8-8-3.036-8-8 3.036-8 8-8Zm-.889 11.556a.889.889 0 0 0 1.778 0V8A.889.889 0 0 0 7.11 8v3.556ZM8.89 4.444a.889.889 0 1 0-1.778 0 .889.889 0 0 0 1.778 0Z"></path>
																								</svg><span class="a2429-e7"></span></span>
																						</button>
																					</div>
																				</div></span>
																		</dt>
																		<dd class="j2t">
																			1 год
																		</dd>
																	</dl>
																</div>
															</div>
															<div class="s9j">
																<div class="tj">
																	Дополнительные
																</div>
																<div style="width: calc(50%);">
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Тип</span>
																		</dt>
																		<dd class="j2t">
																			Блок питания для ноутбука
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Подходит для</span>
																		</dt>
																		<dd class="j2t">
																			<a href="/category/bloki-pitaniya-dlya-noutbukov-asus/">ASUS</a>
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Выходное напряжение, В</span>
																		</dt>
																		<dd class="j2t">
																			20
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Макс. выходной ток, А</span>
																		</dt>
																		<dd class="j2t">
																			3.25
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Макс. выходная мощность, Вт</span>
																		</dt>
																		<dd class="j2t">
																			65
																		</dd>
																	</dl>
																</div>
																<div style="width: calc(50%);">
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Входной коннектор</span>
																		</dt>
																		<dd class="j2t">
																			Сетевая вилка
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Страна-изготовитель</span>
																		</dt>
																		<dd class="j2t">
																			Китай
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Цвет</span>
																		</dt>
																		<dd class="j2t">
																			Черный
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Партномер</span>
																		</dt>
																		<dd class="j2t">
																			ADP-65UD B
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Назначение</span>
																		</dt>
																		<dd class="j2t">
																			Для ноутбуков
																		</dd>
																	</dl>
																	<dl class="jt3">
																		<dt class="jt2">
																			<span class="tj2">Вес товара, г</span>
																		</dt>
																		<dd class="j2t">
																			285
																		</dd>
																	</dl>
																</div>
															</div>
														</div><small class="jt1">Информация о технических характеристиках, комплекте поставки, стране изготовления, внешнем виде и цвете товара носит справочный характер и основывается на последних доступных к моменту публикации сведениях</small>
													</div>
												</div><!---->
											</div>
										</div><div class="d1 c7" data-widget="column"></div>
									</div><div id="comments" data-widget="webAnchor"></div>
									<div data-widget="paginator" style="min-height: 0px;">
										<div class="">
											<div data-widget="webReviewTabs">
												<div></div>
												<div style="">
													<div class="e0" data-widget="row">
														<div class="d5 c7" data-widget="column">
															<div data-widget="paginator" style="min-height: 0px;">
																<div class="">
																	<div class="" data-widget="webListReviews">
																		<!---->
																		<!---->
																		<!---->
																		<!---->
																	</div>
																	<div class="a8cc" data-widget="skuGrid">
																		<div class="a5cd ca5d">
																			<div class="cda5">
																				<div class="a5g ga5 cd5a tsHeadline600Medium">
																					<span>Рекомендуем также</span>
																				</div>
																			</div>
																		</div>
																		<div class="cac8">
																			<div class="i8a a9i j1a ca8c c8ac">
																				<div class="j5a i7a">
																					<div class="d4147-a aj6" tile-id="447576062" on-click-action="function () { [native code] }">
																						<button class="a6j">
																							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
																								<path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
																							</svg>
																						</button>
																					</div>
																					<!---->
																					<!---->
																				</div>
																				<a target="_self" href="/product/blok-pitaniya-dlya-noutbuka-lenovo-ideapad-310-15isk-310-15abr-510s-14isk-510s-13ikb-yoga-510-447576062/?advert=aTejCCPf-8X-LiqJYT7BLvjblr4oNbVnZA0fmOEtf83mcr4Od7Idy3Dd108qB0ZfIWw_WjncgEWxplrpBdoQLHuJhFflFv7rAKXTEO9y6fhTkKscdmGzcgDx1h_2MwxPhsflM4jYYdX5UdqdfC72BlEyuDYJ6__NCNbTWxFQHdmr7vi_EMwOcizNpzPOAWWz1YbyuvVjcA&amp;avtc=1&amp;avte=1&amp;avts=1699541483" class="a5g aj2 i9a ai8">
																				<div class="i5a ai6">
																					<div class="ai2" type="">
																						<div class="ai3 a4i">
																							<div class="i4a"><img elementtiming="lcp_eltiming_undefined" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-y/wc400/6204696538.jpg" srcset="https://ir.ozone.ru/s3/multimedia-y/wc800/6204696538.jpg 2x" alt="Блок питания для ноутбука Lenovo IdeaPad 310-15ISK, 310-15ABR, 510S-14ISK, 510S-13IKB, YOGA 510-14ISK, YOGA 710-15IKB, YOGA 710-15IKB, 20V, 3.25A, 65W 4.0х1.7 Рекомендуем также" class="b9414-a">
																							</div>
																						</div>
																						<!---->
																					</div>
																				</div> <!----> <!----> <!----> <!----> <!----> <!----></a>
																				<div class="ia8">
																					<a target="_self" href="/product/blok-pitaniya-dlya-noutbuka-lenovo-ideapad-310-15isk-310-15abr-510s-14isk-510s-13ikb-yoga-510-447576062/?advert=aTejCCPf-8X-LiqJYT7BLvjblr4oNbVnZA0fmOEtf83mcr4Od7Idy3Dd108qB0ZfIWw_WjncgEWxplrpBdoQLHuJhFflFv7rAKXTEO9y6fhTkKscdmGzcgDx1h_2MwxPhsflM4jYYdX5UdqdfC72BlEyuDYJ6__NCNbTWxFQHdmr7vi_EMwOcizNpzPOAWWz1YbyuvVjcA&amp;avtc=1&amp;avte=1&amp;avts=1699541483" class="a5g aj2">
																					<div class="ja1">
																						<div class="a4j c3118-a c3118-b3" style="padding-bottom: 4px;">
																							<div class="c3118-a0">
																								<span class="c3118-a1 tsHeadline500Medium c3118-b9">1&thinsp;395&thinsp;₽</span><span class="c3118-a1 tsBodyControl400Small c3118-b0" style="margin-left: 4px; margin-right: 4px;">2&thinsp;232&thinsp;₽</span><span class="tsBodyControl400Small c3118-a2 c3118-a7 c3118-b1" style="background: rgb(255, 255, 255);"><div class="c3118-b" style="background-image: url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−37%</span>
																							</div>
																						</div>
																						<div class="b7a ab9 ba9 a3j">
																							<span class="tsBody500Medium">Блок питания для ноутбука Lenovo IdeaPad 310-15ISK, 310-15ABR, 510S-14ISK, 510S-13IKB, YOGA 510-14ISK, YOGA 710-15IKB, YOGA 710-15IKB, 20V, 3.25A, 65W 4.0х1.7</span>
																						</div>
																						<div class="t2 t3 t4 tsBodyMBold" style="text-align: left;">
																							<span class="t7">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgb(255, 168, 0);">
																									<path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
																								</svg><span style="color: rgba(0, 26, 52, 0.6);">4.1 </span></span><span class="t7">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgba(0, 26, 52, 0.4);">
																									<path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
																								</svg><span style="color: rgba(0, 26, 52, 0.6);">6&nbsp;отзывов</span></span>
																						</div>
																					</div></a><!---->
																					<!---->
																				</div>
																			</div>
																			<div class="i8a a9i j1a ca8c c8ac">
																				<div class="j5a i7a">
																					<div class="d4147-a aj6" tile-id="178392182" on-click-action="function () { [native code] }">
																						<button class="a6j">
																							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
																								<path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
																							</svg>
																						</button>
																					</div>
																					<!---->
																					<!---->
																				</div>
																				<a target="_self" href="/product/blok-pitaniya-zeepdeep-adp-120zb-dlya-noutbuka-asus-g50v-g50vt-19v-6-32a-120w-5-5h2-5-s-kabelem-178392182/?advert=jLb7tlYtPzTUJ8PZtUOPvjgAVfZBe9Nku0dMI8wSityedQ-agPvT2lRxdJQaatEDrwMnKEovUYDlFcI6xXvJYNHxn-9CxHWbP1iNfXFYN1GbiF-gxb0Jc-36JUE0z8vnOyqFhqB2OBiIW804GOjQIh41IQBfsJuVa5V1-bUlE_5tNQ4r0udPIiI-XsO4pVFJ3HHQQfQ&amp;avtc=1&amp;avte=1&amp;avts=1699541483" class="a5g aj2 i9a ai8">
																				<div class="i5a ai6">
																					<div class="ai2" type="">
																						<div class="ai3 a4i">
																							<div class="i4a"><img elementtiming="lcp_eltiming_undefined" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-p/wc400/6204694549.jpg" srcset="https://ir.ozone.ru/s3/multimedia-p/wc800/6204694549.jpg 2x" alt="Блок питания ZeepDeep (ADP-120ZB) для ноутбука Asus G50V, G50Vt, 19V, 6.32A, 120W, 5.5х2.5 с кабелем Рекомендуем также" class="b9414-a">
																							</div>
																						</div>
																						<!---->
																					</div>
																				</div> <!----> <!---->
																				<section class="h9a">
																					<div class="ia ai0">
																						<div tabindex="1" class="a0i b410-a0 b410-a1" style="background-image: linear-gradient(90deg, rgb(1, 92, 255) 0%, rgb(248, 17, 85) 100%); background-color: rgb(248, 17, 85); color: rgb(255, 255, 255);">
																							<div class="b410-b">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color: rgb(255, 255, 255);">
																									<path fill="currentColor" fill-rule="evenodd" d="M9.722 1.903a1.316 1.316 0 0 0-1.593-.234l-.682.383a1.323 1.323 0 0 1-.876.148l-.77-.138c-.59-.105-1.177.2-1.427.744l-.327.71a1.31 1.31 0 0 1-.622.633l-.705.34c-.54.261-.834.853-.717 1.439l.154.765c.06.298.013.608-.13.877l-.37.688a1.308 1.308 0 0 0 .266 1.583l.575.528c.225.206.37.484.411.786l.106.773a1.31 1.31 0 0 0 1.15 1.123l.776.09c.304.035.585.174.796.394l.541.562c.415.431 1.07.528 1.593.234l.682-.383c.266-.149.576-.201.876-.148l.77.138c.59.105 1.177-.2 1.427-.744l.327-.71c.127-.277.348-.5.622-.633l.705-.34c.54-.261.834-.853.717-1.439l-.154-.765a1.309 1.309 0 0 1 .13-.877l.37-.688a1.308 1.308 0 0 0-.266-1.583l-.575-.528a1.308 1.308 0 0 1-.411-.786l-.106-.773a1.31 1.31 0 0 0-1.15-1.123l-.776-.09a1.314 1.314 0 0 1-.796-.394l-.541-.562Zm3.005 7.287-1.053.3-.79-3.07-.123.035-.276-1.074 1.176-.336 1.066 4.145Zm-2.96.843 1.053-.3-1.066-4.145-1.176.336.276 1.074.123-.035.79 3.07Zm-3.398.969 1.053-.3-1.066-4.145-1.176.335.276 1.075.124-.035.79 3.07Zm-.854.243-1.053.3-.79-3.07-.123.035-.276-1.074 1.176-.335 1.066 4.144Zm2.873-2.142a.732.732 0 0 0 .324-.953.667.667 0 0 0-.907-.339.732.732 0 0 0-.324.952c.16.357.567.509.907.34Z" clip-rule="evenodd"></path>
																								</svg>
																								<div title="Распродажа" class="b410-b0 tsBodyControl400Small">
																									Распродажа
																								</div>
																							</div>
																						</div>
																					</div>
																				</section> <!----> <!----> <!----></a>
																				<div class="ia8">
																					<a target="_self" href="/product/blok-pitaniya-zeepdeep-adp-120zb-dlya-noutbuka-asus-g50v-g50vt-19v-6-32a-120w-5-5h2-5-s-kabelem-178392182/?advert=jLb7tlYtPzTUJ8PZtUOPvjgAVfZBe9Nku0dMI8wSityedQ-agPvT2lRxdJQaatEDrwMnKEovUYDlFcI6xXvJYNHxn-9CxHWbP1iNfXFYN1GbiF-gxb0Jc-36JUE0z8vnOyqFhqB2OBiIW804GOjQIh41IQBfsJuVa5V1-bUlE_5tNQ4r0udPIiI-XsO4pVFJ3HHQQfQ&amp;avtc=1&amp;avte=1&amp;avts=1699541483" class="a5g aj2">
																					<div class="ja1">
																						<div class="a4j c3118-a c3118-b7" style="padding-bottom: 4px;">
																							<div class="c3118-a0">
																								<span class="c3118-a1 tsHeadline500Medium c3118-b9" style="background-image: linear-gradient(225deg, rgb(248, 17, 85) 0%, rgb(248, 17, 85) 100%);">1&thinsp;406&thinsp;₽</span><span class="c3118-a1 tsBodyControl400Small c3118-b0" style="margin-left: 4px; margin-right: 4px;">2&thinsp;830&thinsp;₽</span><span class="tsBodyControl400Small c3118-a2 c3118-a7 c3118-b1" style="background: rgb(255, 255, 255);"><div class="c3118-b" style="background-image: url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−50%</span>
																							</div>
																						</div>
																						<div class="b7a ab9 ba9 a3j">
																							<span class="tsBody500Medium">Блок питания ZeepDeep (ADP-120ZB) для ноутбука Asus G50V, G50Vt, 19V, 6.32A, 120W, 5.5х2.5 с кабелем</span>
																						</div>
																						<div class="t2 t3 t4 tsBodyMBold" style="text-align: left;">
																							<span class="t7">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgb(255, 168, 0);">
																									<path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
																								</svg><span style="color: rgba(0, 26, 52, 0.6);">4.7 </span></span><span class="t7">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgba(0, 26, 52, 0.4);">
																									<path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
																								</svg><span style="color: rgba(0, 26, 52, 0.6);">88&nbsp;отзывов</span></span>
																						</div>
																					</div></a><!---->
																					<!---->
																				</div>
																			</div>
																			<div class="i8a a9i j1a ca8c c8ac">
																				<div class="j5a i7a">
																					<div class="d4147-a aj6" tile-id="447572207" on-click-action="function () { [native code] }">
																						<button class="a6j">
																							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
																								<path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
																							</svg>
																						</button>
																					</div>
																					<!---->
																					<!---->
																				</div>
																				<a target="_self" href="/product/blok-pitaniya-dlya-noutbuka-acer-19v-7-1a-135w-5-5x1-7-447572207/?advert=hmNakp2dNlPOxuPoDLF4f0kdLeViTqwftOp6aAqRHCr4j_xC7FAJMnQyrH3KlgTzARunD4JrQ3i-Xx_yCOLdMOe8vtbk8UBCxw-hy9wcUCKTPi02SGy-ppyCuqHzzA1JsUEVRAGJ-NnSq4cKmO88i16ChYKGEqFIrUAG-HvjV8IWkNdLlUP0o9siFygouAEvp2stMib4vg&amp;avtc=1&amp;avte=2&amp;avts=1699541483" class="a5g aj2 i9a ai8">
																				<div class="i5a ai6">
																					<div class="ai2" type="">
																						<div class="ai3 a4i">
																							<div class="i4a"><img elementtiming="lcp_eltiming_undefined" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-r/wc400/6204696783.jpg" srcset="https://ir.ozone.ru/s3/multimedia-r/wc800/6204696783.jpg 2x" alt="Блок питания для ноутбука Acer 19V 7.1A, 135W, 5.5x1.7 Рекомендуем также" class="b9414-a">
																							</div>
																						</div>
																						<!---->
																					</div>
																				</div> <!----> <!---->
																				<section class="h9a">
																					<div class="ia ai0">
																						<div tabindex="1" class="a0i b410-a0 b410-a1" style="background-image: linear-gradient(90deg, rgb(1, 92, 255) 0%, rgb(248, 17, 85) 100%); background-color: rgb(248, 17, 85); color: rgb(255, 255, 255);">
																							<div class="b410-b">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color: rgb(255, 255, 255);">
																									<path fill="currentColor" fill-rule="evenodd" d="M9.722 1.903a1.316 1.316 0 0 0-1.593-.234l-.682.383a1.323 1.323 0 0 1-.876.148l-.77-.138c-.59-.105-1.177.2-1.427.744l-.327.71a1.31 1.31 0 0 1-.622.633l-.705.34c-.54.261-.834.853-.717 1.439l.154.765c.06.298.013.608-.13.877l-.37.688a1.308 1.308 0 0 0 .266 1.583l.575.528c.225.206.37.484.411.786l.106.773a1.31 1.31 0 0 0 1.15 1.123l.776.09c.304.035.585.174.796.394l.541.562c.415.431 1.07.528 1.593.234l.682-.383c.266-.149.576-.201.876-.148l.77.138c.59.105 1.177-.2 1.427-.744l.327-.71c.127-.277.348-.5.622-.633l.705-.34c.54-.261.834-.853.717-1.439l-.154-.765a1.309 1.309 0 0 1 .13-.877l.37-.688a1.308 1.308 0 0 0-.266-1.583l-.575-.528a1.308 1.308 0 0 1-.411-.786l-.106-.773a1.31 1.31 0 0 0-1.15-1.123l-.776-.09a1.314 1.314 0 0 1-.796-.394l-.541-.562Zm3.005 7.287-1.053.3-.79-3.07-.123.035-.276-1.074 1.176-.336 1.066 4.145Zm-2.96.843 1.053-.3-1.066-4.145-1.176.336.276 1.074.123-.035.79 3.07Zm-3.398.969 1.053-.3-1.066-4.145-1.176.335.276 1.075.124-.035.79 3.07Zm-.854.243-1.053.3-.79-3.07-.123.035-.276-1.074 1.176-.335 1.066 4.144Zm2.873-2.142a.732.732 0 0 0 .324-.953.667.667 0 0 0-.907-.339.732.732 0 0 0-.324.952c.16.357.567.509.907.34Z" clip-rule="evenodd"></path>
																								</svg>
																								<div title="Распродажа" class="b410-b0 tsBodyControl400Small">
																									Распродажа
																								</div>
																							</div>
																						</div>
																					</div>
																				</section> <!----> <!----> <!----></a>
																				<div class="ia8">
																					<a target="_self" href="/product/blok-pitaniya-dlya-noutbuka-acer-19v-7-1a-135w-5-5x1-7-447572207/?advert=hmNakp2dNlPOxuPoDLF4f0kdLeViTqwftOp6aAqRHCr4j_xC7FAJMnQyrH3KlgTzARunD4JrQ3i-Xx_yCOLdMOe8vtbk8UBCxw-hy9wcUCKTPi02SGy-ppyCuqHzzA1JsUEVRAGJ-NnSq4cKmO88i16ChYKGEqFIrUAG-HvjV8IWkNdLlUP0o9siFygouAEvp2stMib4vg&amp;avtc=1&amp;avte=2&amp;avts=1699541483" class="a5g aj2">
																					<div class="ja1">
																						<div class="a4j c3118-a c3118-b7" style="padding-bottom: 4px;">
																							<div class="c3118-a0">
																								<span class="c3118-a1 tsHeadline500Medium c3118-b9" style="background-image: linear-gradient(225deg, rgb(248, 17, 85) 0%, rgb(248, 17, 85) 100%);">1&thinsp;905&thinsp;₽</span><span class="c3118-a1 tsBodyControl400Small c3118-b0" style="margin-left: 4px; margin-right: 4px;">4&thinsp;452&thinsp;₽</span><span class="tsBodyControl400Small c3118-a2 c3118-a7 c3118-b1" style="background: rgb(255, 255, 255);"><div class="c3118-b" style="background-image: url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−57%</span>
																							</div>
																						</div>
																						<div class="b7a ab9 ba9 a3j">
																							<span class="tsBody500Medium">Блок питания для ноутбука Acer 19V 7.1A, 135W, 5.5x1.7</span>
																						</div>
																						<div class="t2 t3 t4 tsBodyMBold" style="text-align: left;">
																							<span class="t7">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgb(255, 168, 0);">
																									<path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
																								</svg><span style="color: rgba(0, 26, 52, 0.6);">4.7 </span></span><span class="t7">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgba(0, 26, 52, 0.4);">
																									<path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
																								</svg><span style="color: rgba(0, 26, 52, 0.6);">48&nbsp;отзывов</span></span>
																						</div>
																					</div></a><!---->
																					<!---->
																				</div>
																			</div>
																			<div class="i8a a9i j1a ca8c c8ac">
																				<div class="j5a i7a">
																					<div class="d4147-a aj6" tile-id="654611932" on-click-action="function () { [native code] }">
																						<button class="a6j">
																							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
																								<path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
																							</svg>
																						</button>
																					</div>
																					<!---->
																					<!---->
																				</div>
																				<a target="_self" href="/product/adapter-pitaniya-noutbuka-setevoy-pitatel-ad-041-universalnyy-5-5h2-5-65w-19v-3-42a-chernyy-654611932/?advert=5aVZZHqtUSSZecnWfIuT9lKb1BpcoEXkbvcMRYh74XTfHN2AIHCzRSaaW6Z_636KmCsgbQHUjRcWL3g-diMHtm0gYDVz1i7BK_8ue3LIP0l34VdbJUDxdS-fKqJQbpSeq95EIF0kP8k1T0zhMgAKQunw2iHX_hmWhqNaV2f_9UGfsBr6u3hNNYoTrutkqSZ2_a5I4Ehh5R3J&amp;avtc=1&amp;avte=2&amp;avts=1699541483" class="a5g aj2 i9a ai8">
																				<div class="i5a ai6">
																					<div class="ai2" type="">
																						<div class="ai3 a4i">
																							<div class="i4a"><img elementtiming="lcp_eltiming_undefined" loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-9/wc400/6376615485.jpg" srcset="https://ir.ozone.ru/s3/multimedia-9/wc800/6376615485.jpg 2x" alt="Адаптер питания ноутбука сетевой Pitatel AD-041 универсальный (5.5х2.5), 65W, 19V, 3.42A, черный Рекомендуем также" class="b9414-a">
																							</div>
																						</div>
																						<!---->
																					</div>
																				</div> <!----> <!---->
																				<section class="h9a">
																					<div class="ia ai0">
																						<div tabindex="1" class="a0i b410-a0 b410-a1" style="background-image: linear-gradient(90deg, rgb(1, 92, 255) 0%, rgb(248, 17, 85) 100%); background-color: rgb(248, 17, 85); color: rgb(255, 255, 255);">
																							<div class="b410-b">
																								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b410-b1" style="color: rgb(255, 255, 255);">
																									<path fill="currentColor" fill-rule="evenodd" d="M9.722 1.903a1.316 1.316 0 0 0-1.593-.234l-.682.383a1.323 1.323 0 0 1-.876.148l-.77-.138c-.59-.105-1.177.2-1.427.744l-.327.71a1.31 1.31 0 0 1-.622.633l-.705.34c-.54.261-.834.853-.717 1.439l.154.765c.06.298.013.608-.13.877l-.37.688a1.308 1.308 0 0 0 .266 1.583l.575.528c.225.206.37.484.411.786l.106.773a1.31 1.31 0 0 0 1.15 1.123l.776.09c.304.035.585.174.796.394l.541.562c.415.431 1.07.528 1.593.234l.682-.383c.266-.149.576-.201.876-.148l.77.138c.59.105 1.177-.2 1.427-.744l.327-.71c.127-.277.348-.5.622-.633l.705-.34c.54-.261.834-.853.717-1.439l-.154-.765a1.309 1.309 0 0 1 .13-.877l.37-.688a1.308 1.308 0 0 0-.266-1.583l-.575-.528a1.308 1.308 0 0 1-.411-.786l-.106-.773a1.31 1.31 0 0 0-1.15-1.123l-.776-.09a1.314 1.314 0 0 1-.796-.394l-.541-.562Zm3.005 7.287-1.053.3-.79-3.07-.123.035-.276-1.074 1.176-.336 1.066 4.145Zm-2.96.843 1.053-.3-1.066-4.145-1.176.336.276 1.074.123-.035.79 3.07Zm-3.398.969 1.053-.3-1.066-4.145-1.176.335.276 1.075.124-.035.79 3.07Zm-.854.243-1.053.3-.79-3.07-.123.035-.276-1.074 1.176-.335 1.066 4.144Zm2.873-2.142a.732.732 0 0 0 .324-.953.667.667 0 0 0-.907-.339.732.732 0 0 0-.324.952c.16.357.567.509.907.34Z" clip-rule="evenodd"></path>
																								</svg>
																								<div title="Распродажа" class="b410-b0 tsBodyControl400Small">
																									Распродажа
																								</div>
																							</div>
																						</div>
																					</div>
																				</section> <!----> <!----> <!----></a>
																				<div class="ia8">
																					<a target="_self" href="/product/adapter-pitaniya-noutbuka-setevoy-pitatel-ad-041-universalnyy-5-5h2-5-65w-19v-3-42a-chernyy-654611932/?advert=5aVZZHqtUSSZecnWfIuT9lKb1BpcoEXkbvcMRYh74XTfHN2AIHCzRSaaW6Z_636KmCsgbQHUjRcWL3g-diMHtm0gYDVz1i7BK_8ue3LIP0l34VdbJUDxdS-fKqJQbpSeq95EIF0kP8k1T0zhMgAKQunw2iHX_hmWhqNaV2f_9UGfsBr6u3hNNYoTrutkqSZ2_a5I4Ehh5R3J&amp;avtc=1&amp;avte=2&amp;avts=1699541483" class="a5g aj2">
																					<div class="ja1">
																						<div class="a4j c3118-a c3118-b7" style="padding-bottom: 4px;">
																							<div class="c3118-a0">
																								<span class="c3118-a1 tsHeadline500Medium c3118-b9" style="background-image: var(--rm-green);">883&thinsp;₽</span><span class="c3118-a1 tsBodyControl400Small c3118-b0" style="margin-left: 4px; margin-right: 4px;">1&thinsp;860&thinsp;₽</span><span class="tsBodyControl400Small c3118-a2 c3118-a7 c3118-b1" style="background: rgb(255, 255, 255);"><div class="c3118-b" style="background-image: url(&quot;data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 6 1' width='6' height='100%'><linearGradient id='gradient'><stop offset='0%' stop-color='%23fff' stop-opacity='0' /><stop offset='100%' stop-color='%23fff' stop-opacity='1' /></linearGradient><rect width='6' height='1' fill='url(%23gradient)' /></svg>&quot;);"></div>−53%</span>
																							</div>
																						</div>
																						<div class="e6136-a e6136-a5 a3j aj4">
																							<span class="e6136-a4" style="color: rgb(0, 0, 0);">Осталось 7 шт</span>
																							<div class="e6136-a0">
																								<div class="e6136-a1" style="background-color: rgba(0, 26, 52, 0.2); opacity: 1;"></div><div class="e6136-a2" style="background-color: rgb(249, 17, 85); width: 100%;"></div>
																							</div>
																						</div>
																						<div class="b7a ab9 ba9 a3j">
																							<span class="tsBody500Medium">Адаптер питания ноутбука сетевой Pitatel AD-041 универсальный (5.5х2.5), 65W, 19V, 3.42A, черный</span>
																						</div>
																					</div></a><!---->
																					<!---->
																				</div>
																			</div>
																		</div>
																		<!---->
																	</div>
																	<div class="" data-widget="webListReviews">
																		<!---->
																		<!---->
																		<!---->
																		<!---->
																		<!---->
																	</div><div class="s9d" data-widget="separator" style="height: 24px;"></div>
																</div>
																<!---->
																<!---->
															</div>
														</div>
													</div>
												</div>
												<div style="display: none;">
													<div class="e0" data-widget="row">
														<div class="d5 c7" data-widget="column">
															<div class="s9d" data-widget="separator" style="height: 24px;"></div>
															<div data-widget="webCreateQuestion">
																<form novalidate="novalidate" class="sq">
																	<!---->
																	<div class="q0s">
																		Задайте вопрос о товаре
																	</div>
																	<div class="sq0">
																		Вам ответит продавец, представитель бренда или пользователь, купивший этот товар. Пришлем уведомление, когда поступит ответ
																	</div>
																	<div class="s0q">
																		<div class="c8128-a">
																			<label class="c8128-a0"><!---->
																				<div class="f145-a f145-a5 f0145-a">
																					<div class="f145-b0">
																						<textarea maxlength="3000" rows="1" class="f0145-a0 f0145-a2 f0145-a1" style="max-height: 200px; height: 28px;"></textarea>
																						<!---->
																						<p class="f145-a0">
																							Напишите свой вопрос
																						</p>
																						<div class="f145-a2 f145-a5">
																							<!---->
																							<!---->
																						</div>
																					</div>
																				</div></label><!---->
																		</div>
																		<!---->
																	</div>
																	<!---->
																</form>
																<!---->
															</div><div class="s9d" data-widget="separator" style="height: 24px;"></div>
															<div class="" data-widget="webListQuestions">
																<!---->
																<!---->
																<!---->
																<!---->
															</div><div class="s9d" data-widget="separator" style="height: 60px;"></div>
														</div><div class="d0 c7" data-widget="column"></div>
														<div class="d1 c7" data-widget="column">
															<div class="s9d" data-widget="separator" style="height: 24px;"></div>
															<div class="sd2" data-widget="richTextWidget" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);">
																<h4><a id="____Ozon_0"></a>Как спросить о сервисе Ozon?</h4>
															</div>
															<div class="sd2" data-widget="richTextWidget" style="background-color: rgb(255, 255, 255); color: rgb(102, 102, 102);">
																<p>
																	О сервисе Ozon, доставке и состоянии заказа вы можете узнать в <a href="https://www.ru.market/my/orderlist" target="_blank">Личном кабинете</a> или в чате с <a href="https://www.ru.market/my/chat" target="_blank">Поддержкой ClustBUY</a>.
																</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div data-widget="paginator" style="min-height: 0px;">
												<div class=""></div>
												<!---->
												<!---->
											</div>
										</div>
										<!---->
										<!---->
									</div><div class="s9d" data-widget="separator"></div>
								</div>
							</div>
							<div class="e3" data-widget="stickyContainer" style="bottom: 0px; margin-top: auto; z-index: 999;">
								<div class="p2k p3k" data-widget="webPdpGrid" style="width: auto;">
									<div class="p2k p3k p6k" data-widget="webPdpGrid" style="padding: 8px; width: auto;">
										<div class="v1q" data-widget="webFeedbackForm">
											<!---->
											<div class="d4147-a">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="u6q">
													<path fill="currentColor" d="M12 8c-1.114 0-1.86.57-2.03 1.244a1 1 0 0 1-1.94-.488C8.496 6.909 10.298 6 12 6c1.139 0 2.137.344 2.865.984A3.315 3.315 0 0 1 16 9.5c0 1.232-.53 2.07-1.14 2.663-.178.172-.415.332-.66.499-.536.363-1.113.753-1.198 1.349-.077.535-.41.989-1.002.989-.552 0-1-.45-1-1.002.014-1.202.88-1.92 1.728-2.625.255-.212.51-.423.738-.645.32-.31.534-.66.534-1.228 0-.402-.159-.752-.456-1.014C13.24 8.22 12.74 8 12 8Zm0 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"></path><path fill="currentColor" d="M1 12C1 5.925 5.925 1 12 1s11 4.925 11 11-4.925 11-11 11S1 18.075 1 12Zm11-9a9 9 0 1 0 0 18 9 9 0 0 0 0-18Z"></path>
												</svg>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div data-widget="webReviewGallery">
								<!---->
							</div>
						</div>
						<!---->
						<!---->
					</div>

					~~/if~


					~~if $config.mobile >0 ~
						~~include file="market/tpl/mobile/footer.tpl"~
		            ~~else~
						~~include file="market/tpl/desktop/footer.tpl"~
		            ~~/if~

				</div>


				<div>
					<!---->
					<!---->
					<!---->
					<!---->
					<div class="an2 a2n" style="bottom: 66px;">
						<!---->
						<!---->
						<!---->
					</div>
					<!---->
				</div>
			</div>
		</div>

		~~include file='market/tpl/bottom_script.tpl'~

	</body>

</html>