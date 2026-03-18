<header class="dn3" data-widget="header" style="background-color:#ffffff;">
	<div id="stickyHeader" class="n3d">
		<a target="_self" href="/" class="a5g d0u n5d"><img elementtiming="lcp_eltiming_header-2856575-default-1" loading="lazy" fetchpriority="low" src="/images/logo.svg" alt="Ru.Market" class="b9414-a"></a>

		<div data-replace-layout-path="[1][0]" class="n4d">
			<div class="ld0" data-widget="catalogMenu">
				<!---->
				<div class="a2429-a">
					<a href="/categories/" class="a2429-a4" style="border-radius:8px;">
						<span class="a2429-b1 a2429-b6" style="border-radius:8px;">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
								<path fill="currentColor" d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm2 0a1 1 0 0 1 1-1h12a1 1 0 1 1 0 2H8a1 1 0 0 1-1-1Zm0 6a1 1 0 0 1 1-1h12a1 1 0 1 1 0 2H8a1 1 0 0 1-1-1Zm1 5a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H8Zm-4-4a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm1 5a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"></path>
							</svg><span class="a2429-e7">Каталог</span></span>
					</a>
				</div>
				<!---->

			</div>
		</div>
		<div data-replace-layout-path="[1][1]" class="dn5">
			<div data-widget="searchBarDesktop">
				<!---->
				<div class="w0x search-bar-wrapper">
					<!---->

					<form id="search-input" action="/search/" method="get" class="x0w">


						
						<div class="wx1">

							~~*
							<div class="ww3" data-remodal-target="search-modal" data-bind="css: { active: cur_cat_name() !== 'Везде'}">
								<span title="Везде" class="ww4 tsBtsBody400SmallodyM" data-bind="text: cur_cat_name">Везде</span>
								<span class="w4w default">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16">
										<path fill="currentColor" d="m4 6 4 5 4-5H4Z"></path>
									</svg>
								</span>
								<span class="w4w active" data-bind="click: set_def_cat, clickBubble: false">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16">
										<path fill="currentColor" d="M8 16c4.964 0 8-3.036 8-8s-3.036-8-8-8-8 3.036-8 8 3.036 8 8 8ZM6.85 5.594 8 6.743l1.15-1.15a.889.889 0 1 1 1.256 1.258L9.257 8l1.15 1.15a.889.889 0 1 1-1.258 1.256L8 9.257l-1.15 1.15a.889.889 0 1 1-1.256-1.258L6.743 8l-1.15-1.15a.889.889 0 0 1 1.258-1.256Z"></path>
									</svg>
								</span>
							</div>
							*~


							<div class="w1x">
								<input name="category" type="hidden" data-bind="value: cur_cat_guid" value="">
								<input placeholder="поиск" type="text" name="query" autocapitalize="off" autocomplete="off" autocorrect="off" spellcheck="false" maxlength="255" class="xw1 tsBody500Medium" id="search-popup" value="~~$search_string~">
								<input readonly="readonly" class="wx2 xw1 tsBody500Medium">
								<!---->
							</div>
						</div>
						



						<div class="w2x a2429-a a2429-a3">
							<button tabindex="0" type="submit" aria-label="Поиск" class="a2429-a4 a2429-a3" style="border-radius:6px;">
								<span class="a2429-b1 a2429-e3 a2429-f0 a2429-a3" style="border-radius:6px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="a2429-e9">
										<path fill="currentColor" d="M11 5a6 6 0 1 0 0 12 6 6 0 0 0 0-12Zm-8 6a8 8 0 1 1 14.281 4.955l4.419 4.33a1 1 0 1 1-1.4 1.43l-4.444-4.357A8 8 0 0 1 3 11Z"></path>
									</svg><span class="a2429-e7"></span></span>
							</button>
						</div>
					</form>

                      ~~*
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
                      *~



				</div>
			</div>
		</div>
		<!---->
		<!---->
		<div data-replace-layout-path="[1][2]" class="d5n">

			~~*
			<div class="oi2" data-widget="profileLogo">
				<div class="d4147-a">
					<a target="_self" href="/my/main" class="a5g t9d i2o"><span class="tsBodyControl300XSmall du du0">0</span>
					<img src="/images/user-icon.svg" width="24" height="24"/>
					<span class="ud">Кабинет</span></a>
				</div>
			</div>

			<div class="d4147-a ft3" data-widget="orderInfo">
				<a target="_self" href="/my/orderlist" class="a5g t9d"><span class="tsBodyControl300XSmall du du0">0</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
					<path fill="currentColor" d="M12.486 1.126a1 1 0 0 0-.972 0l-9 5A1 1 0 0 0 2 7v9.98a1.003 1.003 0 0 0 .515.894l9 5a1 1 0 0 0 .989-.01l8.982-4.99A1 1 0 0 0 22 17V7a1 1 0 0 0-.514-.874l-9-5ZM11 20.3l-7-3.888V8.7l2 1.11V13a1 1 0 1 0 2 0v-2.078l3 1.666v7.713ZM7.5 8.356 5.06 7 12 3.144 14.441 4.5l-6.94 3.856ZM9.56 9.5l6.94-3.856L18.941 7l-6.94 3.856L9.558 9.5ZM13 20.3v-7.712L20 8.7v7.712L13 20.3Z"></path>
				</svg><span class="ud">Заказы</span></a>
			</div>

			
			<a target="_self" href="/my/favorites" class="a5g t9d" data-widget="favoriteCounter"><span class="tsBodyControl300XSmall du du0">0</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
				<path fill="currentColor" d="M7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Zm5 17c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Z"></path>
			</svg><span class="ud">Избранное</span></a>
			*~

			<a target="_self" href="/cart/" id="head_cart"  class="a5g t9d to_cart" data-widget="headerIcon">
				<span class="tsBodyControl300XSmall du total_cart_amount"  style="display: none" data-bind="visible: (total_cart_amount() != 0), text: total_cart_amount">0</span>
                <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" width="24px" height="23px" version="1.1" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd"
                     viewBox="0 0 21 21"
                     xmlns:xlink="http://www.w3.org/1999/xlink">
             <defs>
                 <style type="text/css">
                     <![CDATA[
                     .str0 {stroke:#FEFEFE;stroke-width:0.927608}
                     .fil0 {fill:#2B2A29}
                     ]]>
                 </style>
             </defs>
                    <g id="Слой_x0020_1">
                        <metadata id="CorelCorpID_0Corel-Layer"/>
                        <path class="fil0 str0" d="M20 4c1,0 1,1 1,1l-3 9c0,1 -2,2 -3,2l-10 0c-1,0 -2,-1 -2,-3l0 -6 0 -3 2 0 15 0zm-2 3l-2 6c0,0 -1,0 -1,0l-10 0 0 -6 13 0z"/>
                        <path class="fil0" d="M16 19c0,-1 -1,-2 -2,-2l-2 0 0 2c0,1 1,2 2,2 1,0 2,-1 2,-2z"/>
                        <path class="fil0" d="M5 17c1,0 2,1 2,2 0,1 -1,2 -2,2 -1,0 -2,-1 -2,-2l0 -2 2 0z"/>
                        <path class="fil0" d="M0 0l6 0 0 0c1,0 2,1 2,2l0 1 -6 0c-1,0 -2,-1 -2,-2l0 -1z"/>
                    </g>
            </svg>
                <span class="ud">Корзина</span></a>

		</div>
	</div>

    <script>console.log('model_cart = ',model_cart);</script>
	~~mod path="market/" mod_name="menu" tpl="top_menu"~



    ~~mod path="market/" mod_name="menu" tpl="filter_search"~


</header>

~~*debug*~