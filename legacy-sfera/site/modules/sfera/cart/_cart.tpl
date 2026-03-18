<!DOCTYPE html>
<html lang="ru">

	<head>
		<title>Корзина</title>
		<meta charset="utf-8">

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="format-detection" content="telephone=no">
		<meta name="mobile-web-app-capable" content="yes">


		~~include file="market/tpl/favicon.tpl"~


		<link rel="stylesheet" type="text/css" href="/assets/css/libs.css">
		<link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css">
		<link rel="stylesheet" type="text/css" href="/assets/css/app.css">
		<link rel="stylesheet" href="/js/toastr/toastr.min.css">
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
			async function applyDiscount() {
				model_cart.promocode_input($('#promocode').val())
				await model_cart.try2apply_promocode()
			}
		</script>
		~~include file="tpl/js.tpl"~
		<script>
		var Items = ~~$cart_items~;
		</script>

		<style>

			.less-more{margin:0 10px 15px 0}
			.less-more{margin:0;float:left;min-width:95px;}
			.less-more{font:700 16px/36px Arial,Helvetica,sans-serif;color:#000;margin:0 0 0 0px}
			.less-more>a{box-shadow:0 3px 0 0 #e6e6e6;border-radius:50%;cursor:pointer;font:400 14px/32px 'Roboto Slab','Times New Roman',serif;color:#000;border:1px solid #e6e6e6;border-bottom-color:#f7f7f7;background:#fff;background:-moz-linear-gradient(top,#fff 0,#eee 100%);background:-webkit-linear-gradient(top,#fff 0,#eee 100%);background:linear-gradient(to bottom,#fff 0,#eee 100%);float:left;padding:0 10px;font-size:20px;font-weight:400}
			.less-more>a>.minus-ico,.less-more>a>.plus-ico{display:inline-block;vertical-align:top;padding:8px 9px 7px;margin:8px 0 0}
			.less-more>a:hover{border-bottom-color:#f3f3f3;background:#fff;background:-moz-linear-gradient(top,#fff 0,#e6e6e6 100%);background:-webkit-linear-gradient(top,#fff 0,#e6e6e6 100%);background:linear-gradient(to bottom,#fff 0,#e6e6e6 100%)}
			.less-more>a:active{position:relative;top:3px;border-color:#e6e6e6;box-shadow:0 0 20px 0 #e6e6e6 inset}
			.less-more>a>.plus-ico{background:url(/images/ico-plus.svg) 50% 50% no-repeat;background-size:8px 8px}
			.less-more>a>.minus-ico{background:url(/images/ico-minus.svg) 50% 50% no-repeat;background-size:8px 2px}
			.less-more>a.plus{border-radius:0 10px 10px 0;line-height:30px;padding:0 4.5px}
			.less-more>a.minus{border-radius:10px 0 0 10px;line-height:30px;padding:0 4.5px}
			.less-more .amount{box-shadow:0 3px 0 0 #e6e6e6;cursor:pointer;color:#000;padding-top:1px;padding-bottom:2px;margin:0;background:#fff;border:0;border-top:1px solid #e6e6e6;width:35px;border-radius:0;text-align:center;float:left;font:500 16px/28px 'PT Sans'}
			.less-more .amount:focus{border:1px solid #23acec;box-shadow:0 0 4px 1px #bde6f9;margin-bottom:-1px}




		</style>


	</head>

	<body>
		<div class="loader">
			<div class="loader__inn">
				<img alt="" src="/assets/img/loader.gif" style="width:120px;">
			</div>
		</div>
		<div class="m-nav js-m-nav">
			~~*
			<div class="m-nav__group">
				<a href="#login" class="m-nav__link m-nav__link--icon"> Авторизация </a>
			</div>
			<div class="m-nav__group">
				<a href="#" class="m-nav__link m-nav__location js-location-select-toggle"> <span>Город:</span> Москва </a>
			</div>
			*~
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
		<div class="modal remodal md-login" data-remodal-id="login">
			<button class="modal__close close-btn" data-remodal-action="close">
				Закрыть
			</button>
			<div class="login-tabs js-tabs">
				<ul class="login-tabs__menu">
					<li class="login-tabs__item is-active">
						<a data-el="tab" href="#login_tab" class="login-tabs__link"><span>Вход</span></a>
					</li>
					<li class="login-tabs__item">
						<a data-el="tab" href="#register_tab" class="login-tabs__link"><span>Регистрация</span></a>
					</li>
				</ul>
				<div class="login-tabs__panes">
					<div data-el="pane" id="login_tab" class="login-tabs__pane is-active">
						<!--div class="md-login__social">
							<a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
							href="#"></a>
						</div>
						<div class="md-login__or">
							или
						</div-->
						<form autocomplete="off" class="md-login__form">
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
								<button type="submit" class="btn btn--pink btn--lg">Войти</button>
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
								<button type="submit" class="btn btn--pink btn--lg">Зарегистрироваться</button>
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

		<a href="#" class="up-btn js-up-btn">Наверх</a>

		<div class="l-main js-main wrapper">
			<header class="header js-header">
				<div class="header__inn">
					~~include file="market/tpl/top_bar.tpl"~
					~~include file="market/tpl/header__wrapper.tpl"~
				</div>
			</header>
			<div class="l-content">
				<div class="l-wrapper">
					<div class="p-cart">
						<div class="back-link">
							<a href="/" class="link">Вернуться к выбору</a>
						</div>
						<div class="l-order">
							<div class="l-order__inn">
								<div class="l-order__main">
									<div class="title h1">
										Ваша корзина
									</div>
									<div class="cart-wrap">
										<div class="cart-body">
											<!-- ko foreach: cart().items() -->
											<span data-bind="html: (console.log(guid()))"></span>~~**~
											<span data-bind="html: (console.log(Items))"></span>~~**~


											<div class="item-click item-click--row item-click--border cart-row"
												 data-bind="attr: {guid: guid()}"
											>
												<a href="#" class="remove-btn item-click__remove js-item-remove"
												   data-bind="click: $root.remove_from_cart.bind($data, guid())"
												><i></i></a>
												<div class="item-click__inn">
													<div class="item-click__photo">
														<a data-bind="attr: {href: $root.full_link($data, $data)}"> <img class="item-click__img" data-bind="attr:{src: Items[guid()].img_url}"> </a>
													</div>
													<div class="item-click__info">
														<div class="item-click__row">
															<div>
																<div class="item-click__id">
																	#<span data-bind="text: Items[guid()].art"></span>
																</div>

																<a class="item-click__name"
																   data-bind="text: Items[guid()].title, attr: {href: $root.full_link($data, $data)}">
																</a>



															</div>

															~~*<span data-bind='text:product_amount()'></span>*
															<span data-bind='text:product_price()'></span>
															*~

					                                        <div class="item-click__num">
					                                            <table>
					                                                <tr>
					                                                    <td>
					                                                        <div class="less-more" style="margin:0 auto;">
					                                                            <a class="minus" href="#" data-bind="click: $root.amount_minus.bind($data, guid())"><span class="minus-ico"></span></a>

					                                                            <input type="text" class="amount" data-bind="textInput: product_amount, event: {change: $root.validate_amount.bind(guid(), $data) }" ~~*readonly*~ />

					                                                            <a class="plus" href="#" data-bind="click: $root.amount_plus.bind(guid(), $data)"><span class="plus-ico"></span></a>
					                                                        </div>
					                                                    </td>
					                                                </tr>
					                                            </table>
					                                        </div>



															<div class="item-click__price">
																<div class="price">
																	<span class="js-item-click-price "
																		  data-bind="text:Math.round(Number(Items[guid()].cost*product_amount()) * 100) / 100"
																	></span> ₽
																</div>
															</div>




														</div>
													</div>
												</div>
											</div>
											<!-- /ko -->



										</div>
									</div>
								</div>
								<div class="l-order__aside">
									<div class="bg-block">
										<div class="bg-block__group p-cart__total">


											~~**~
											<div class="p-cart__total-label">
												Итого товаров : <span class="" data-bind="text: total_cart_amount()"></span>  без учета <span>доставки:</span><br>

												<!-- ko if: discount() > 0 -->
												<div>Скидка по промокоду: <span data-bind="text: discount() + '%'"></span></div>
												<!-- /ko -->

											</div>

											<div class="price">
												<span class="" data-bind="text: numberWithSpaces(total_cart_sum())"></span> ₽
											</div>


											<a href="/order/" class="btn btn--vinous btn--lg ">Оформить заказ</a>
										</div>


										
										<div class="bg-block__group">
											<a href="#" onclick="$('.promo-input').show(); $(this).remove(); return false;" class="link"> <i  class="ticon ticon-discount-2 text-red"></i> <span>У меня есть промокод на скидку</span></a>
											<div class="promo-input">
												<div class="promo-input__label">
													Введите промокод
												</div>
												<div class="promo-input__inn">
													<div class="promo-input__left">
														<input id="promocode" type="text" class="promo-input__input promo" placeholder="Промокод">
													</div>
													<div class="promo-input__right">
														<button class="promo-input__btn" onclick="applyDiscount()">
															ОК
														</button>
													</div>
												</div>
											</div>
										</div>


										
									</div>
									
									<div class="bg-block discount_block" style="display:none;">
										<div class="bg-block__group">
											<div class="bonus-box">
												<div class="bonus-box__text">
													Скидка : <span>0</span> <span>₽</span>
												</div>
												<!--a href="#" class="link"><span>Зачем нужны бонусные рубли?</span></a-->
											</div>
										</div>
									</div>

									<div class="bg-block discount_message animate-gradient" style="display:none;">
										<div class="bg-block__group">
											<div class="">
												<div class="bonus-box__text discount_message_text">
													
												</div>
												<!--a href="#" class="link"><span>Зачем нужны бонусные рубли?</span></a-->
											</div>
										</div>
									</div>

									<style>
									.animate-gradient {
										font-weight: bold;
										font-size: 18px;
										padding: 20px;
										text-align: center;
										color: #FFFFFF;
										background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
										background-size: 400% 400%;
										animation: animate_gradient 5s ease infinite;
									}
									.animate-gradient:hover {
										animation: none;
									}
									 
									@keyframes animate_gradient {
										0% {
											background-position: 0% 50%;
										}
										50% {
											background-position: 100% 50%;
										}
										100% {
											background-position: 0% 50%;
										}
									}
									</style>

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
