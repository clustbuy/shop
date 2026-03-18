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
            <div class="header__logo-mobile header__logo-alt">
              <a href=".">
                <div class="logo logo--no-icon">
                  <div class="logo__inn">
                    <div class="logo__text"><img alt="" src="/assets/img/logo-text.svg">
                    </div>
                  </div>
                </div> </a>
              </div>
              <div class="header__logo header__logo-alt">
                <a href=".">
                  <div class="header__logo-default">
                    <div class="logo ">
                      <div class="logo__inn">
                        <!--div class="logo__icon">
                        <img alt="" src="/assets/img/logo-small.svg">
                      </div-->
                      <div class="logo__text"><img alt="" src="/assets/img/logo-text.svg">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="header__logo-small">
                  <div class="logo logo--sm">
                    <div class="logo__inn">
                      <div class="logo__icon">
                        <img alt="" src="/assets/img/logo-small.svg">
                      </div>
                      <div class="logo__text"><img alt="" src="/assets/img/logo-text.svg">
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
