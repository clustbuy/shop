<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta charset="utf-8">
		<title>~~$item.title~</title>

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
		<script>
		var Items = ~~$items_json~;
		</script>
	</head>

	<body>
		<div class="loader">
			<div class="loader__inn">
				<div class="wikimoda animate">
					<span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span><span class="wikimoda__dot"></span>
				</div>
			</div>
		</div>

		<div class="m-nav js-m-nav">

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

		<a href="#" class="up-btn js-up-btn">Наверх</a>
		<div class="l-main js-main">

			<header class="header js-header">
				<div class="header__inn">

					~~include file="market/tpl/top_bar.tpl"~
					~~include file="market/tpl/header__wrapper.tpl"~

				</div>
			</header>

			<div class="l-content">
				<div class="modal remodal md-click" data-remodal-id="click">
					<button class="modal__close close-btn" data-remodal-action="close">
						Закрыть
					</button>
					<form autocomplete="off" class="js-example-form">
						<div class="title h1">
							Оформить в 1 клик
						</div>
						<div class="item-click">
							<div class="item-click__inn">
								<div class="item-click__photo">
									<a href="#"> <img class="item-click__img" src="~~$item.img_url~"> </a>
								</div>
								<div class="item-click__info">
									<a href="#" class="item-click__name">~~$item.name~</a>
									<div class="item-click__num">
										<div class="item-count js-item-count" data-price="~~$item.cost~" data-max="11">
											<input type="hidden" value="1">
											<button type="button" data-el="minus" class="item-count__minus">
												-
											</button>
											<div class="item-count__num">
												<span data-el="num">1</span> шт.
											</div>
											<button type="button" data-el="plus" class="item-count__plus">
												+
											</button>
										</div>
										<div class="item-click__stock">
											На складе: > 20 шт.
										</div>
									</div>
									<div class="price">
										<span class="js-item-click-price js-odometer">~~$item.cost~</span> р.
									</div>
								</div>
							</div>
						</div>
						<div class="md-click__form">
							<div class="form-row">
								<div class="complex-input js-complex-input">
									<label class="complex-input__label">Имя</label>
									<div class="complex-input__input">
										<input data-error="Неправильное имя" type="text" class="input">
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="input-row">
									<div class="input-row__cell input-row__icon">
										<i class="ticon ticon-mobile "></i>
									</div>
									<div class="input-row__cell input-row__cell--border text-center" style="width: 80px;">
										<select class="select">

											<option>+7</option>

											<option>+38</option>

											<option>+375</option>

										</select>
									</div>
									<div class="input-row__cell">
										<div class="complex-input js-complex-input">
											<div class="complex-input__input">
												<input type="text" class="input js-phone-mask" placeholder="(___) ___-__-__">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-row">
								<button type="submit" class="btn btn--lg btn--vinous">
									Оформить заказ
								</button>
							</div>
							<div class="form-row">
								<div class="text">
									<p>
										В ближайшее время наш менеджер свяжется с Вами для уточнения всех деталей заказа.
									</p>
								</div>
							</div>
						</div>
					</form>
				</div>


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

					<span data-bind="html: (console.log(guid()))"></span>~~**~

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
					<!-- /ko -->

					<div class="md-cart__bottom">
						<div class="md-cart__bottom-left">

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


				<div class="item">
					<div class="l-wrapper">
						<div class="item__top">
							<div class="item__top-left">
								<ul class="breadcrumbs">
									<li class="breadcrumbs__item">
										<a href="/" class="breadcrumbs__link">Каталог</a>
									</li>
									<li class="breadcrumbs__item">
										<a href="/~~$c_data.current.name~" class="breadcrumbs__link">~~$c_data.current.title~</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="item__title">
							<div class="title h1">
								~~$item.title~
							</div>

						</div>
						<div class="item__header">
							<div class="item__header-right">
								<div>
									<div class="item__header-id">
										<div class="item__id">
											#~~$item.art~
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="item__main" data-id="~~$item.guid~" id="item~~$item.guid~">
							<div class="item__main-left">
								<div class="item-gallery">
									<div class="item-gallery__carousel carousel">
										<a href="#" class="item-gallery__full js-item-gallery-full"></a>
										<div>
											<div class="swiper-container js-item-gallery">
												<div class="swiper-wrapper">

													<div class="swiper-slide"><img data-zoom-image="~~$item.img_url~" src="~~$item.img_url~" style="height:450px;"></div>
													~~foreach from=$item.gallery item=photo~
													<div class="swiper-slide"><img data-zoom-image="~~$photo~" src="~~$photo~" style="height:450px;"></div>
													~~/foreach~
													
												</div>
											</div>
										</div>
									</div>
									~~if isset($item.gallery) && count($item.gallery)>0~
									<div class="item-gallery__thumbs">
										<div class="swiper-container js-item-gallery-thumbs">
											<div class="swiper-wrapper">
												

												<div class="swiper-slide"><img alt="~~$item.title~" class="item-grid__img js-item-main-img" src="~~$item.img_url~" alt=""></div>

												~~foreach from=$item.gallery item=photo~
												<div class="swiper-slide"><img src="~~$photo~"></div>
												~~/foreach~
											</div>
										</div>
									</div>
									~~/if~
								</div>
							</div>
							<div class="item__main-right">

								<div class="item-meta">
									<div class="item-meta__inn">
										<div class="item-meta__group">


											<div class="item-meta__actions">


												
												<div class="item-meta__actions-inn">
													<div class="item-meta__actions-cart">
														<a href="#cart" class="btn btn--vinous item-meta__cart waves-effect waves-light" onclick="a2c(); return;"> <i class="ticon ticon-cart "></i> Добавить в корзину</a>
													</div>
													<div class="item-meta__actions-fav">
														<a href="#" class="btn btn--icon btn--vinous btn--outline item-meta__fav waves-effect waves-light"> <i class="ticon ticon-favorite "></i> </a>
													</div>
												</div>
												


											</div>


										</div>

										<div class="item-meta__group">
											<div class="item-meta__colors">
												<div class="item-meta__label">

													~~foreach from=$item.params item=param~

													~~if $param.0 != "Страна производства"~
													~~$param.0~: ~~$param.1~<br>
													~~/if~

													~~/foreach~ 
													

												</div>

											</div>
										</div>


									</div>
								</div>





							</div>
						</div>

					</div>
					~~if $item.parameters || $item.description~
					<div class="l-wrapper">
						<div class="item__tabs">
							<div data-el="tabs" class="desc-tabs js-tabs">
								<ul class="desc-tabs__menu">
									<li data-el="bar" class="desc-tabs__bar"></li>
									~~assign var="hasActiveTab" value="false"~
									~~if $item.description~
									<li class="desc-tabs__item ~~if $hasActiveTab=="false"~is-active ~~assign var="hasActiveTab" value="true"~~~/if~">
										<a data-el="tab" href="#desc_tab_1" class="desc-tabs__link">Описание</a>
									</li>
									~~/if~
									~~if $item.parameters~
									<li class="desc-tabs__item ~~if $hasActiveTab=="false"~is-active ~~assign var="hasActiveTab" value="true"~~~/if~">
										<a data-el="tab" href="#desc_tab_2" class="desc-tabs__link">Характеристики</a>
									</li>
									~~/if~
								</ul>
								<div class="desc-tabs__content">
									~~assign var="hasActiveDescTab" value="false"~
									~~if $item.description~
									<div data-el="pane" id="desc_tab_1" class="desc-tabs__pane ~~if $hasActiveDescTab=="false"~is-active ~~assign var="hasActiveDescTab" value="true"~~~/if~">
										<div class="text">
											<p>~~$item.description~<p>
										</div>
										~~*
										<div class="item__desc">
											<div class="item__desc-left"></div>
											<div class="item__desc-right"></div>
										</div>
										*~
									</div>
									~~/if~
									~~if $item.parameters~
									<div data-el="pane" id="desc_tab_2" class="desc-tabs__pane ~~if $hasActiveDescTab=="false"~is-active ~~assign var="hasActiveDescTab" value="true"~~~/if~">
										<div class="text">
											~~if $item.parameters~
												<div class="table-chars">
													~~foreach from=$item.parameters item=param name=param~
														~~if $smarty.foreach.param.first~<div class="table-chars__cell">~~/if~
															~~math equation="t/2" t=$smarty.foreach.param.total assign=half~
															~~if ($half|ceil) == $smarty.foreach.param.index~</div><div class="table-chars__cell">~~/if~
															<dl>
															<dt>~~$param.title~</dt>
															<dd>
																~~foreach from=$param.values item=value name=value~~~if $smarty.foreach.value.index > 0~, ~~/if~~~$value.value~~~if $value.measure~ ~~$value.measure~~~/if~~~/foreach~
															</dd>
														</dl>
														~~if $smarty.foreach.param.last~</div>~~/if~
													~~/foreach~
												</div>
											~~/if~
										</div>
									</div>
									~~/if~
								</div>
							</div>
						</div>
					</div>
					~~/if~
				</div>
			</div>

			~~include file='market/tpl/footer.tpl'~

		</div>

		~~include file='market/tpl/bottom_script.tpl'~

<script>

function a2c()
{
	var pars = {
		task: 'put_item',
		item: JSON.stringify({
			guid: ~~$item.guid~,
			product_price: '~~$item.cost~',
			product_amount: 1
		})
	};	
	console.log(pars);

	$.ajax({
		type: "POST",
		url: '/cart/',
		data: pars,
		dataType: "json",
		success: function (data, textStatus) {
			var items = (function () {
				var results = [];
				for (var key in data.items) {
					if (!data.items.hasOwnProperty(key)) continue;
					results.push(data.items[key]);
				}
				return results;
			})();
			model_cart.update_items(items);
		},
		error: function () {
		}
	});

}


</script> 

	</body>

</html>
