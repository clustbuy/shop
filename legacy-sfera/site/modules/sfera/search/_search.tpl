<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <title>Результаты поиска по интернет-магазину Ru.Market</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="mobile-web-app-capable" content="yes">
        
    ~~include file="market/tpl/favicon.tpl"~

    <link rel="stylesheet" type="text/css" href="/assets/css/libs.css">
    <link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/app.css">
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

        attach_component_item({
            class_target: '.items__cell',
            class_inside_target: '.item-grid__actions',
            viewmode: 'main',
            lazyload: true,
            params: {
                show_controls: 1
            }
        });
    </script>

</head>

<body>
    <div class="loader">
        <div class="loader__inn">
            <img alt="" src="/assets/img/loader.gif" style="width:120px;">
        </div>
    </div>
    <div class="m-nav js-m-nav">
        <div class="m-nav__group">
            <a href="#login" class="m-nav__link m-nav__link--icon"><i  class="ticon ticon-user"></i>Авторизация</a>
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
                                <a class="location-select__link location-select__link--bold js-location-close" data-toggle='location-dropdown' href="#">Москва</a>
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
                ~~include file="market/tpl/top_bar.tpl"~ ~~include file="market/tpl/header__wrapper.tpl"~
            </div>
        </header>

        <div class="l-content">
            <div class="l-wrapper">
                <!--div class="brands" style="text-align: left;">
                    <div class="brands__inn">
                        <div class="brands__item">
                            <a href="/brand/~~$brand.id~/" class="brand-item">
                                <div class="brand-item__inn">
                                    <div class="brand-item__photo">
                                        <img src="/assets/img/brands/~~$brand.img~" class="brand-item__img">
                                    </div>
                                    <span class="brand-item__name">~~$brand.name~</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div-->


~~*print_r what=$items*~
~~*debug*~

                <div class="items items--action">
                    <div class="items__header">
                        <div class="items__title">
                            <div class="title h1">
                                Найдено товаров: ~~$items|@count_number~
                            </div>
                        </div>
                    </div>


                    ~~*
                    <div class="items__header">
                        <form method="post" action="~~$canonical_url~">
                            ~~foreach from=$filters.common item=filter~
                            <div class="items__sort">
                                ~~foreach from=$filter.values item=value name=filter_value~
                                <input class="items__link items__sort-link~~if $value == $filter.active || ($filter.active == '' && $smarty.foreach.filter_value.index == 0)~ is-active~~/if~" name="~~$filter.name~" type="submit" value="~~$value~">
                                ~~/foreach~
                            </div>
                            ~~/foreach~
                        </form>
                    </div>
                    *~


                    <div class="items__list">
                        ~~foreach from=$items item=item~
                        <div class="items__cell" id="item~~$item.guid~" data-id="~~$item.guid~">
                            <div class="item-grid">
                   
                              ~~if $item.wholesale_amount > 1~
                              <div data-size="big" data-theme="opt" class="item-badge item-badge--opt js-tooltip" data-tooltipped="" aria-describedby="tippy-tooltip-2" data-original-title="заказ кратно ~~$item.wholesale_amount~" style="
    width: 47px;
    height: 47px;
    line-height: 47px;
    text-align: center;
    display: inline-block;
    color: #fff;
    background: #f33535;
    font-size: 20px!important;
    ">~~$item.wholesale_amount~шт</div>
                              ~~/if~
                              
                                           
                                <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                        <a href="/~~$item.node~/~~$item.guid~/"><img alt="~~$item.title~" class="item-grid__img js-item-main-img" src="~~$item.img_url~"></a>

                                        ~~if isset($item.gallery) && count($item.gallery)>1~
                                        <div class="item-grid__carousel carousel">
                                            <div class="swiper-container js-item-gallery-carousel">
                                                <div class="swiper-wrapper">
                                                    ~~foreach from=$item.gallery item=photo~
                                                    <div class="swiper-slide">
                                                        <div class="item-grid__carousel-item js-item-carousel-image"><img alt="~~$item.name~" src="~~$photo~">
                                                        </div>
                                                    </div>
                                                    ~~/foreach~
                                                </div>
                                            </div>
                                        </div>
                                        ~~/if~

                                    </div>
                                    <a href="/~~$item.node~/~~$item.guid~/" class="item-grid__name">~~$item.title~</a>
                                    <div class="item-grid__category">
                                      ~~if $item.wholesale_amount > 1~ Цена за ~~if $item.pack>1~упаковку (~~$item.pack~шт)~~else~единицу~~/if~: ~~$item.cost~ ₽~~/if~
                                    </div>                                    
                                    <div class="item-grid__category">
                                        ~~$item.item_type~
                                    </div>

                                    <div class="item-grid__actions"></div>
                                </div>
                            </div>
                        </div>
                        ~~foreachelse~
                            <h2>Нет товаров</h2>
                        ~~/foreach~
                    </div>
                    <!--div class="catalog-items__nav">
                        <div class="catalog-items__nav-pagination">
                            <div class="pager">
                                <ul class="pagination">
                                    ~~foreach from=$pagination.print_pages item=page~ ~~if $page.is_last~
                                    <li class="pagination__item pagination__item--dots"></li>
                                    ~~/if~

                                    <li class="pagination__item ~~if $page.is_current~is-active~~/if~ ~~if $page.is_first~is-first~~/if~ ~~if $page.is_last~is-last~~/if~">
                                        <a href="~~$page.path~" class="pagination__link">~~$page.num~</a>
                                    </li>

                                    ~~if $page.is_first~
                                    <li class="pagination__item pagination__item--dots"></li>
                                    ~~/if~
                                    ~~/foreach~
                                </ul>
                                <div class="pager__info">
                                    <div class="pager__info-inn">
                                        ~~if $pagination.prev~
                                        <div class="pager__info-btn">
                                            <a href="~~$pagination.prev.path~" class="prev-btn">Предыдущая</a>
                                        </div>
                                        ~~/if~
                                        ~~if $pagination.total_items~
                                        <div class="pager__info-total">
                                            Результаты: ~~$pagination.total_printed_items~ из ~~$pagination.total_items~
                                        </div>
                                        ~~/if~
                                        ~~if $pagination.next~
                                        <div class="pager__info-btn">
                                            <a href="~~$pagination.next.path~" class="next-btn">Следующая</a>
                                        </div>
                                        ~~/if~
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div-->
                </div>

            </div>
        </div>


        ~~include file='market/tpl/footer.tpl'~


    </div>

    ~~include file='market/tpl/bottom_script.tpl'~
</body>

</html>