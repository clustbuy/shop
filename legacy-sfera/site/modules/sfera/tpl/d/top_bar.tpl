					<div class="topbar">
						<div class="l-wrapper">
							<div class="topbar__inn">
								

								~~**~
								<div class="topbar__location dropdown">

									<a class="topbar__link topbar__link--dropdown js-dropdown-location js-dropdown-toggle" data-toggle='location-dropdown'  href="#"> <span class="js-positioned">Москва</span></a>

									<div class="dropdown__block location-dropdown hidden">
										<div class="location-dropdown__label">
											Вы действительно находитесь в г. Москва?
										</div>
										<div class="block-table block-table--fixed">
											<div>
												<a class="location-dropdown__link" data-toggle='location-dropdown' href="#">Да, все верно</a>
											</div>
											<div class="text-right">
												<a class="location-dropdown__link js-location-select-toggle" href="#">Нет, сменить город</a>
											</div>
										</div>
									</div>
								</div>
								
								<div class="topbar__contacts">
									
									~~*if $config.release == 'DEV'~
									  <span style="color:red;">~~$config.release~ </span>
									  &nbsp;
									  <a class="topbar__link" href="//seller.platform/"><span>Вход для поставщиков</span></a>
									~~else~
									<a class="topbar__link" href="https://seller.ru.market"><span>Вход для поставщиков</span></a>
									~~/if*~

								</div>
								<!--div class="topbar__delivery"> <a class="topbar__link" href="#">
								<i  class="ticon ticon-truck "></i>
								<span>Бесплатная доставка при первой покупке</span></a> </div-->
								<!--div class="topbar__day-item"> <a class="topbar__link" href="#">
								<i  class="ticon ticon-discount "></i>
								<span>Товар дня</span></a> </div-->
								~~*
								<div class="topbar__cabinet dropdown bonus">
									<a class="topbar__link topbar__link--dropdown  js-dropdown-toggle  js-bonus-target" href="#"> <i  class="ticon ticon-user "></i> <span class="js-positioned">Мой кабинет</span></a>
									<div class="bonus__block" style="display:none!important;">
										Дарим 500 руб. при регистрации <a href="#" class="bonus__close js-bonus-close">Закрыть</a>
									</div>
									<div class="dropdown__block cabinet-dropdown">
										<div class="cabinet-dropdown__login">
											<a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a><a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a>
										</div>
										<div class="cabinet-dropdown__search">
											<div class="cabinet-dropdown__search-label">
												Статус заявки
											</div>
											<form autocomplete="off" class="search">
												<input type="search" class="search__input js-order-search" placeholder="Введите номер заявки">
											</form>
										</div>
									</div>
								</div>
								*~



							</div>
						</div>
					</div>
