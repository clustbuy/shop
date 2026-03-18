

<div class="header__wrapper">
  <div class="l-wrapper">


    <div class="header__row">
      <div class="header__logo-mobile">
        <a href="/">
        <div class="logo logo--no-icon">
          <div class="logo__inn">
            <div class="logo__text"><img alt="" src="/images/logo.svg" style="height:25px;">
            </div>
          </div>
        </div></a>
      </div>
    </div>



    <div class="header__row">



      <div class="header__logo">
        <a href="/">
        <div class="header__logo-default">
          <div class="logo ">
            <div class="logo__inn">

              <div class="logo__text"><img alt="ru.market" src="/images/logo.svg">
              </div>
            </div>
          </div>
        </div>
        <div class="header__logo-small">
          <div class="logo logo--sm">
            <div class="logo__inn">


              
              <div class="logo__text"><img alt="ru.market" src="/images/logo.svg">
              </div>


            </div>
          </div>
        </div>
        </a>
      </div>



      

      <div class="header__search js-search">
        <div id="title-search">
          <form autocomplete="off" class="search" onsubmit="if($(this).find('input').val().length == 0) return false;" action="/search/" method="post">
            <div class="awesomplete">
              <input type="text" id="title-search-input" name="query" class="search__input js-product-search" placeholder="поиск" autocomplete="off" aria-autocomplete="list" value="~~$search_string~">

              <div style="float:right;color: gray;margin: -31px 45px 0px 0px;">~~$smarty.session.total_items_text~</div>
              
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
            <button type="submit" class="search__submit"></button>
            <a href="#" class="search__close js-search-close"></a>
          </form>
        </div>
      </div>
      <div class="header__btn header__srch">
        <a class="js-search-toggle" href="#"> <i  class="ticon ticon-loupe "></i> </a>
      </div>

      <div class="header__btn header__favorite"> <a class="js-favs" href="/cart/">

      <i  class="counter total_cart_amount " data-bind="text: total_cart_amount">0</i>

      <!--span class="header__favorite-count">99</span-->
      </a> </div>
      <div class="header__btn header__cart dropdown">
        
          <a href="/cart/" class="cart to_cart">~~*<span class="counter total_cart_amount" data-bind="text: total_cart_amount">0</span>*~</a>

        <!--a class="js-dropdown-toggle js-cart" href="#"> <i  class="ticon ticon-cart "></i> <span class="header__cart-count">0</span> </a-->

      </div>
      ~~*
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
            <form autocomplete="off" class="search">
              <input type="search" class="search__input js-order-search" placeholder="Введите номер заказа">
            </form>
          </div>
        </div>
      </div>
      *~
    </div>
  </div>
</div>

<nav class="nav js-nav">
  <div class="l-wrapper">
    <div class="nav__bar js-nav-bar"></div>
    <ul class="nav__list">

~~foreach from=$c.tree item=i~<li class="nav__item js-catalog-toggle" id='~~$i.id~'><a class="nav__link nav__link--sub" href="#"><span>~~$i.title~</span></a></li>~~/foreach~

    </ul>
  </div>
</nav>

~~*debug*~

~~foreach from=$c.tree item=i~<div class="catalog js-catalog-~~$i.id~"><div class="catalog__inn"><div class="l-wrapper"><div class="catalog__content"><a href="#" class="catalog__close close-btn js-catalog-close">Закрыть</a><a href="/~~$i.name~/"><div class="catalog__title">~~$i.title~</div></a><div class="catalog__content-inn"><div class="catalog__categories"><ul class="categories-menu">~~foreach from=$i.nodes item=j~<li class="categories-menu__item categories-menu__item"><div class="categories-menu__item-inn"><a href="/~~$j.name~/" class="categories-menu__link categories-menu__title">~~$j.title~</a><div class="categories-menu__count">~~$j.items_count~</div></div><ul class="categories-menu__sub" style="margin-top: 20px;">~~foreach from=$j.nodes item=k~ ~~if $k.items_count > 0 ~<li class="categories-menu__item"><div class="categories-menu__item-inn"><a href="/~~$k.name~/" class="categories-menu__link">~~$k.title~</a><div class="categories-menu__count">~~$k.items_count~</div></div></li>~~/if~ ~~/foreach~</ul></li>~~/foreach~</ul></div></div></div></div></div></div>~~/foreach~

