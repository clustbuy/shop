<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta charset="utf-8">
		<title>Заказ оформлен</title>

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
	</head>

	<body>
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
				<a href="#login" class="m-nav__link m-nav__link--icon"> Авторизация </a>
			</div>
			<div class="m-nav__group">
				<a href="#" class="m-nav__link m-nav__location js-location-select-toggle"> <span>Город:</span> Москва </a>
			</div>
			<div class="m-nav__group">
				~~include file='market/tpl/m-nav__catalog.tpl'~
			</div>
			<div class="m-nav__group">
				<a href="#" class="m-nav__link">Контакты</a>
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
										<div class="rate__stars r3">
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

					~~include file='tpl/header__wrapper.tpl'~

					~~include file='tpl/nav__js-nav.tpl'~

				</div>
			</header>
			<div class="l-content">
				<div class="l-wrapper">
					<div class="p-complete">
						<div class="p-complete__header">
							<div class="p-complete__header-inn">
								<div class="p-complete__header-left">
									<div class="p-complete__title title h1">
										Заказ успешно оформлен!
									</div>
								</div>
								<div class="p-complete__header-right">
									<div class="p-complete__num">
										Номер заказа: 21231231
									</div>
								</div>
							</div>
						</div>
						<div class="p-complete__thanks">
							<div class="p-complete__subtitle">
								Спасибо. Мы свяжемся с вами в ближайшее время.
							</div>
							<div class="text">
								<p>
									Мы обрабатываем ваш заказ и вскоре отправим вас сообщение по его потверждению.
								</p>
							</div>
						</div>
						<div class="p-complete__cabinet">
							<div class="p-complete__cabinet-inn">
								<div class="p-complete__cabinet-left">
									<div class="title h4">
										Вам создан личный кабинет
									</div>
									<div class="p-complete__cabinet-info">
										<div class="p-complete__cabinet-item p-complete__cabinet-text">
											Логин: <span class="text-style2">ivanovi4</span>
										</div>
										<div class="p-complete__cabinet-item p-complete__cabinet-text">
											Пароль: <span class="text-style2">fwerwr$#4343</span>
										</div>
									</div>
									<label class="switcher switcher--md">
										<div class="switcher__inn">
											<div class="switcher__toggle">
												<input  type="checkbox" class="js-switchery ">
											</div>
											<div class="switcher__label">
												Выслать по SMS
											</div>
										</div> </label>
								</div>
								<div class="p-complete__cabinet-right">
									<span class="p-complete__cabinet-text">Письмо с потверждением заказа отправлено на maxkkdjj@mail.ru</span>
								</div>
							</div>
						</div>
						<div class="p-complete__info">
							<div class="p-complete__info-inn">
								<div class="p-complete__info-left">
									<div class="p-complete__subtitle">
										Информация о заказе
									</div>
									<div class="order-info">
										<dl class="order-info__row">
											<dt class="order-info__label">
												Способы получения
											</dt>
											<dd class="order-info__value">
												Доставка курьером
											</dd>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Куда доставить
											</dt>
											<dd class="order-info__value">
												Россия, г. Москва, ул. Чапаева, д.61, кв.789
											</dd>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Сумма заказа
											</dt>
											<dd class="order-info__value">
												500 р.
											</dd>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Стоимость доставки
											</dt>
											<div class="order-info__value">
												300 р.
											</div>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Итого
											</dt>
											<dd class="order-info__value">
												9800 р.
											</dd>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Способ оплаты
											</dt>
											<dd class="order-info__value">
												Наличные курьеру
											</dd>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Электронная почта
											</dt>
											<dd class="order-info__value">
												maxkkdjj@mail.ru
											</dd>
										</dl>
										<dl class="order-info__row">
											<dt class="order-info__label">
												Телефон
											</dt>
											<dd class="order-info__value">
												+7 945 332 33 41
											</dd>
										</dl>
									</div>
								</div>
								<div class="p-complete__info-right">
									<div class="p-complete__subtitle">
										Товары в заказе
									</div>
									<div class="item-order">
										<div class="item-order__inn">
											<div class="item-order__photo">
												<a href="#"><img class="item-order__img" src="/assets/img/items/1.png"></a>
											</div>
											<div class="item-order__info">
												<a href="#" class="item-order__name">Сумка дорожная David Jones</a>
												<div class="item-order__count">
													1 шт.
												</div>
											</div>
											<div class="item-order__price">
												9000 р.
											</div>
										</div>
									</div>
									<div class="item-order">
										<div class="item-order__inn">
											<div class="item-order__photo">
												<a href="#"><img class="item-order__img" src="/assets/img/items/2.png"></a>
											</div>
											<div class="item-order__info">
												<a href="#" class="item-order__name">Часы Casio</a>
												<div class="item-order__count">
													1 шт.
												</div>
											</div>
											<div class="item-order__price">
												4990 р.
											</div>
										</div>
									</div>
									<div class="item-order">
										<div class="item-order__inn">
											<div class="item-order__photo">
												<a href="#"><img class="item-order__img" src="/assets/img/items/3.png"></a>
											</div>
											<div class="item-order__info">
												<a href="#" class="item-order__name">Сумка поясная Salomon</a>
												<div class="item-order__count">
													1 шт.
												</div>
											</div>
											<div class="item-order__price">
												3500 р.
											</div>
										</div>
									</div>
									<div class="item-order">
										<div class="item-order__inn">
											<div class="item-order__photo">
												<a href="#"><img class="item-order__img" src="/assets/img/items/4.png"></a>
											</div>
											<div class="item-order__info">
												<a href="#" class="item-order__name">Сумка Coccinelle</a>
												<div class="item-order__count">
													1 шт.
												</div>
											</div>
											<div class="item-order__price">
												45000 р.
											</div>
										</div>
									</div>
									<div class="item-order">
										<div class="item-order__inn">
											<div class="item-order__photo">
												<a href="#"><img class="item-order__img" src="/assets/img/items/5.png"></a>
											</div>
											<div class="item-order__info">
												<a href="#" class="item-order__name">Ремень Tommy Hilfiger</a>
												<div class="item-order__count">
													1 шт.
												</div>
											</div>
											<div class="item-order__price">
												99000 р.
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="p-complete__btns">
							<div class="p-complete__btns-inn">
								<div class="p-complete__btns-item">
									<a href="#" class="btn btn--vinous btn--outline">Вернуться в каталог</a>
								</div>
								<div class="p-complete__btns-item">
									<a href="#" class="btn btn--vinous">Мои заказы</a>
								</div>
								<div class="p-complete__btns-item">
									<a href="#" class="btn btn--pink">Распечатать заказ</a>
								</div>
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
