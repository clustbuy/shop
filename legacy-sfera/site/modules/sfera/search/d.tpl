<!doctype html>
<html lang="en-US" class="no-js" itemtype="https://schema.org/WebPage" itemscope>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>~~$smarty.const.S_TITLE~</title>


    ~~include file='market/tpl/head.tpl'~



</head>

<body class="archive search search-results post-type-archive post-type-archive-product logged-in wp-embed-responsive theme-avanam woocommerce-shop woocommerce woocommerce-page woocommerce-js color-switch-light has-dark-logo woocommerce-active product-style-1 products-no-gutter hfeed footer-on-bottom hide-focus-outline link-style-no-underline has-sidebar has-left-sidebar content-title-style-above content-width-normal content-style-unboxed content-vertical-padding-show non-transparent-header mobile-non-transparent-header base-elementor-colors tax-woo-product elementor-default elementor-kit-54 e--ua-blink e--ua-chrome e--ua-webkit header-is-fixed">

~~*debug*~

<div id="wrapper" class="site wp-site-blocks">
    <a class="skip-link screen-reader-text scroll-ignore" href="#main">Skip to content</a>

    ~~include file='market/tpl/header.tpl'~


    <div id="inner-wrap" class="wrap hfeed bt-clear">
        <section role="banner" class="entry-hero product-archive-hero-section entry-hero-layout-standard">
            <div class="entry-hero-container-inner">
                <div class="hero-section-overlay"></div>
                <div class="hero-container site-container">
                    <header class="entry-header product-archive-title title-align-inherit title-tablet-align-inherit title-mobile-align-inherit">
                        ~~mod path="market/" mod_name="breadcrumbs" tpl="category" node=`$category.parent_id`~
                        <h1 class="page-title archive-title">~~$category.title~</h1>
                    </header><!-- .entry-header -->
                </div>
            </div>
        </section><!-- .entry-hero -->
        <div id="primary" class="content-area">
            <div class="content-container site-container">
                <main id="main" class="site-main" role="main">
                    <header class="woocommerce-products-header">

                    </header>
                    <div class="woocommerce-notices-wrapper"></div>
                    <div id="sticky_filter" class="base-shop-top-row">
                        <div class="base-shop-top-item base-woo-offcanvas-filter-area filter-toggle-open-container vs-lg-false vs-md-true vs-sm-true">
                            <button id="filter-toggle" class="filter-toggle-open drawer-toggle filter-toggle-style-default" aria-label="Open panel" data-toggle-target="#filter-drawer" data-toggle-body-class="showing-filter-drawer" aria-expanded="false" data-set-focus=".filter-toggle-close">
							<span class="filter-toggle-icon"><span class="base-svg-iconset">
									<svg class="base-svg-icon base-list-filter-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
										<title>Filter</title><path d="M6 12.984v-1.969h12v1.969h-12zM3 6h18v2.016h-18v-2.016zM9.984 18v-2.016h4.031v2.016h-4.031z"></path>
									</svg></span></span>
                                <span class="filter-toggle-label">Filter</span>
                            </button>
                        </div>

                        ~~*
                        <div class="base-shop-top-item base-woo-results-count">
                            <p class="woocommerce-result-count">
                                Товаров в категории: <span class="result">~~$totalCount~</span>
                            </p>
                        </div>
                        *~

                        <div class="base-shop-top-item base-woo-ordering">

                            ~~*
                            <form class="woocommerce-ordering" method="get">


                                <select name="orderby" class="orderby" aria-label="Shop order">
                                    <option value="menu_order"  selected='selected'>Default sorting</option>
                                    <option value="popularity" >Sort by popularity</option>
                                    <option value="rating" >Sort by average rating</option>
                                    <option value="date" >Sort by latest</option>
                                    <option value="price" >Sort by price: low to high</option>
                                    <option value="price-desc" >Sort by price: high to low</option>
                                </select>
                                <input type="hidden" name="paged" value="1" />
                            </form>
                            *~

                        </div>
                        <div class="base-shop-top-item base-woo-toggle">
                            <div class="base-product-toggle-container base-product-toggle-outer">
                                <button title="Grid View" class="base-toggle-shop-layout base-toggle-grid toggle-active" data-archive-toggle="grid">
								<span class="base-svg-iconset">
									<svg class="base-svg-icon base-grid-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
										<title>Grid</title><rect x="3.25" y="1.75" width="1.5" height="12.5" rx="0.75" fill="currentColor"></rect><rect x="7.25" y="1.75" width="1.5" height="12.5" rx="0.75" fill="currentColor"></rect><rect x="11.25" y="1.75" width="1.5" height="12.5" rx="0.75" fill="currentColor"></rect>
									</svg></span>
                                </button>

                                ~~*
                                <button title="List View" class="base-toggle-shop-layout base-toggle-list" data-archive-toggle="list">
								<span class="base-svg-iconset">
									<svg class="base-svg-icon base-list-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
										<title>List</title><rect x="15.25" y="4.25" width="1.5" height="12.5" rx="0.75" transform="rotate(90 15.25 4.25)" fill="currentColor"></rect><rect x="15.25" y="8.25" width="1.5" height="12.5" rx="0.75" transform="rotate(90 15.25 8.25)" fill="currentColor"></rect><rect x="15.25" y="12.25" width="1.5" height="12.5" rx="0.75" transform="rotate(90 15.25 12.25)" fill="currentColor"></rect>
									</svg></span>
                                </button>
                                *~

                            </div>
                        </div>
                    </div>
                    <div id="active-filters-bar" class="active-filters-bar">
                        <div class="active-filters-list"></div>
                    </div>
                    <ul class="products content-wrap product-archive grid-cols grid-ss-col-2 grid-sm-col-3 grid-lg-col-4 woo-archive-action-visible woo-archive-btn-button woo-archive-loop align-buttons-bottom  woo-archive-image-hover-fade">

                        ~~foreach from=$items_r item=i~
                        <li class="shimmer entry content-bg loop-entry product type-product post-214 status-publish first instock product_cat-aviator-watches product_cat-bucket-hat product_cat-denim-skirt product_cat-electronics product_cat-goggles product_cat-retro-fashion product_cat-smart-watches product_cat-watches has-post-thumbnail sale featured shipping-taxable purchasable product-type-variable has-default-attributes  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                            <div class="product-thumbnail">
                                <a href="/product/~~$i.guid~/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="~~$i.title~">
                                    ~~*
                                    <div class="product-onsale">
                                        <span aria-hidden="true" class="onsale ">-9%</span>
                                        <span class="screen-reader-text">Product on sale</span>
                                    </div>
                                    *~

                                    <img loading="lazy" width="300" height="300" src="~~$i.img_url~" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" decoding="async" srcset="~~$i.img_url~ 300w, ~~$i.img_url~ 150w, ~~$i.img_url~ 768w, ~~$i.img_url~ 205w, ~~$i.img_url~ 600w, ~~$i.img_url~ 100w, ~~$i.img_url~ 96w, ~~$i.img_url~ 460w, ~~$i.img_url~ 120w, ~~$i.img_url~ 60w, ~~$i.img_url~ 236w, ~~$i.img_url~ 118w, ~~$i.img_url~ 296w, ~~$i.img_url~ 148w, ~~$i.img_url~ 1000w" sizes="(max-width: 300px) 100vw, 300px" />
                                    <img loading="lazy" width="300" height="300" src="~~$i.img_url~" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" decoding="async" srcset="~~$i.img_url~ 300w, ~~$i.img_url~ 150w, ~~$i.img_url~ 768w, ~~$i.img_url~ 205w, ~~$i.img_url~ 600w, ~~$i.img_url~ 100w, ~~$i.img_url~ 96w, ~~$i.img_url~ 460w, ~~$i.img_url~ 236w, ~~$i.img_url~ 118w, ~~$i.img_url~ 296w, ~~$i.img_url~ 148w, ~~$i.img_url~ 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                <div class="product-actions">
                                    ~~*
                                    <button class="woosw-btn woosw-btn-214 woosw-btn-has-icon woosw-btn-icon-text" data-id="214" data-product_name="~~$i.title~" data-product_image="~~$i.img_url~" aria-label="Add to wishlist">
                                        <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                    </button>
                                    <button class="woosc-btn woosc-btn-214  woosc-btn-has-icon woosc-btn-icon-text" data-id="214" data-product_name="~~$i.title~" data-product_image="~~$i.img_url~">
                                        <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                    </button>
                                    *~

                                    <button class="woosq-btn woosq-btn-214 woosq-btn-has-icon woosq-btn-icon-text" data-id="214" data-effect="mfp-3d-unfold" data-context="default">
                                        <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                    </button>
                                </div>
                            </div>
                            <div class="product-details content-bg entry-content-wrap">
                                <h2 class="woocommerce-loop-product__title"><a href="/product/~~$i.guid~/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">~~$i.title~</a></h2>

                                ~~*
                                <div class="star-rating-block">
                                    <div class="star-rating">
                                        <span style="width:100%"><strong class="rating">5.00</strong> out of 5</span>
                                    </div>
                                </div>
                                *~

                                <span class="price">
                                    <span class="woocommerce-Price-amount amount">
                                        <bdi>
                                            ~~$i.cost|price~ ₽
                                        </bdi>
                                    </span>
                                </span>
                                <div class="product-excerpt">
                                    <p>
                                        ~~$i.description~
                                    </p>
                                </div>
                                <div class="product-action-wrap style-button">
                                    <a onclick="a2c('~~$i.guid~'); return false;"  data-quantity="1" class="button product_type_variable add_to_cart_button default" data-product_id="214" data-product_sku="KOD-SDN-353" aria-label="Select options for &ldquo;~~$i.title~&rdquo;" aria-describedby="This product has multiple variants. The options may be chosen on the product page" rel="nofollow"><span class="add-to-cart-icon">
									<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" fill="currentColor" version="1.1">
										<g id="surface1">
											<path d="M 14.527344 2.125 C 14.414062 2.183594 14.257812 2.324219 14.179688 2.433594 C 14.054688 2.617188 14.039062 2.667969 14.039062 2.996094 C 14.039062 3.3125 14.054688 3.378906 14.164062 3.542969 C 14.234375 3.640625 14.371094 3.777344 14.46875 3.84375 L 14.644531 3.960938 L 16.613281 3.976562 L 18.582031 3.988281 L 14.382812 8.195312 C 9.941406 12.632812 9.984375 12.585938 9.984375 13.007812 C 9.984375 13.203125 10.121094 13.550781 10.257812 13.707031 C 10.378906 13.847656 10.785156 14.015625 10.992188 14.015625 C 11.417969 14.011719 11.371094 14.054688 15.804688 9.617188 L 20.011719 5.417969 L 20.023438 7.386719 L 20.039062 9.355469 L 20.15625 9.53125 C 20.222656 9.628906 20.359375 9.765625 20.457031 9.835938 C 20.621094 9.945312 20.6875 9.960938 21 9.960938 C 21.3125 9.960938 21.378906 9.945312 21.542969 9.835938 C 21.640625 9.765625 21.777344 9.628906 21.84375 9.53125 L 21.960938 9.355469 L 21.960938 2.640625 L 21.835938 2.457031 C 21.765625 2.359375 21.628906 2.222656 21.53125 2.15625 L 21.355469 2.039062 L 18.046875 2.023438 L 14.738281 2.015625 Z M 14.527344 2.125 "/>
											<path d="M 4.777344 4.035156 C 3.488281 4.226562 2.433594 5.183594 2.105469 6.460938 C 2.019531 6.796875 2.015625 7.035156 2.015625 13.003906 C 2.015625 19.914062 1.996094 19.460938 2.351562 20.203125 C 2.507812 20.53125 2.621094 20.675781 2.972656 21.027344 C 3.324219 21.378906 3.46875 21.492188 3.796875 21.648438 C 4.539062 22.003906 4.085938 21.984375 10.996094 21.984375 C 16.960938 21.984375 17.203125 21.980469 17.539062 21.894531 C 18.6875 21.601562 19.550781 20.75 19.902344 19.566406 C 19.976562 19.3125 19.988281 18.945312 20.007812 15.515625 C 20.015625 13.4375 20.007812 11.628906 19.992188 11.5 C 19.929688 11.011719 19.566406 10.648438 19.078125 10.601562 C 18.683594 10.566406 18.355469 10.738281 18.132812 11.101562 L 18.023438 11.273438 L 18 15.1875 C 17.976562 19.09375 17.976562 19.101562 17.875 19.292969 C 17.738281 19.546875 17.503906 19.773438 17.25 19.894531 L 17.039062 19.992188 L 4.945312 19.992188 L 4.726562 19.882812 C 4.472656 19.757812 4.199219 19.476562 4.085938 19.222656 C 4.011719 19.070312 4.007812 18.53125 4.007812 13.007812 L 4.007812 6.960938 L 4.105469 6.75 C 4.226562 6.496094 4.453125 6.261719 4.707031 6.125 C 4.898438 6.023438 4.921875 6.023438 8.347656 6 L 11.792969 5.976562 L 11.992188 5.84375 C 12.273438 5.664062 12.425781 5.40625 12.453125 5.078125 C 12.488281 4.703125 12.308594 4.355469 11.976562 4.148438 L 11.75 4.007812 L 8.394531 4.003906 C 6.546875 4 4.921875 4.011719 4.777344 4.035156 Z M 4.777344 4.035156 "/>
										</g>
									</svg></span><span class="cart-text">В корзину</span><span class="base-svg-iconset svg-baseline">
									<svg aria-hidden="true" class="base-svg-icon base-arrow-right-alt-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="27" height="28" viewBox="0 0 27 28">
										<title>Continue</title><path d="M27 13.953c0 0.141-0.063 0.281-0.156 0.375l-6 5.531c-0.156 0.141-0.359 0.172-0.547 0.094-0.172-0.078-0.297-0.25-0.297-0.453v-3.5h-19.5c-0.281 0-0.5-0.219-0.5-0.5v-3c0-0.281 0.219-0.5 0.5-0.5h19.5v-3.5c0-0.203 0.109-0.375 0.297-0.453s0.391-0.047 0.547 0.078l6 5.469c0.094 0.094 0.156 0.219 0.156 0.359v0z"></path>
									</svg></span><span class="base-svg-iconset svg-baseline">
									<svg class="base-svg-icon base-spinner-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
										<title>Loading</title><path d="M16 6h-6l2.243-2.243c-1.133-1.133-2.64-1.757-4.243-1.757s-3.109 0.624-4.243 1.757c-1.133 1.133-1.757 2.64-1.757 4.243s0.624 3.109 1.757 4.243c1.133 1.133 2.64 1.757 4.243 1.757s3.109-0.624 4.243-1.757c0.095-0.095 0.185-0.192 0.273-0.292l1.505 1.317c-1.466 1.674-3.62 2.732-6.020 2.732-4.418 0-8-3.582-8-8s3.582-8 8-8c2.209 0 4.209 0.896 5.656 2.344l2.343-2.344v6z"></path>
									</svg></span><span class="base-svg-iconset svg-baseline">
									<svg class="base-svg-icon base-check-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
										<title>Done</title><path d="M14 2.5l-8.5 8.5-3.5-3.5-1.5 1.5 5 5 10-10z"></path>
									</svg></span></a>
                                </div>
                            </div>
                        </li>
                        ~~/foreach~

                    </ul>
                    <style>
                        .bt-loader-ellips {
                            font-size: 20px;
                            position: relative;
                            width: 4em;
                            height: 1em;
                            margin: 10px auto
                        }
                        .bt-loader-ellips__dot {
                            display: block;
                            width: 0.7em;
                            height: 0.7em;
                            border-radius: .5em;
                            background: var(--global-palette6);
                            position: absolute;
                            animation-duration: .5s;
                            animation-timing-function: ease;
                            animation-iteration-count: infinite
                        }
                        .bt-loader-ellips__dot:nth-child(1), .bt-loader-ellips__dot:nth-child(2) {
                            left: 0
                        }
                        .bt-loader-ellips__dot:nth-child(3) {
                            left: 1.5em
                        }
                        .bt-loader-ellips__dot:nth-child(4) {
                            left: 3em
                        }@keyframes loaderReveal{
                             from {
                                 transform: scale(.001)
                             }
                             to {
                                 transform: scale(1)
                             }}@keyframes
                               loaderSlide {to{
                                transform: translateX(1.5em)
                            }}
                        .bt-loader-ellips__dot:nth-child(1) {
                            animation-name: loaderReveal
                        }
                        .bt-loader-ellips__dot:nth-child(2), .bt-loader-ellips__dot:nth-child(3) {
                            animation-name: loaderSlide
                        }
                        .bt-loader-ellips__dot:nth-child(4) {
                            animation-name: loaderReveal;
                            animation-direction: reverse
                        }
                        .page-load-status {
                            display: none;
                            padding-top: 20px;
                            text-align: center;
                            color: var(--global-palette4);
                        }
                    </style>
                    <div class="page-load-status">
                        <ul class="products ajax-load content-wrap product-archive grid-cols grid-ss-col-2 grid-sm-col-3 grid-lg-col-4">
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                            <li class="shimmer entry content-bg loop-entry product">
                                <div class="product-thumbnail">
                                    <image width="300" height="300"/>
                                </div>
                            </li>
                        </ul>
                        <div class="bt-loader-ellips infinite-scroll-request">
                            <span class="bt-loader-ellips__dot"></span><span class="bt-loader-ellips__dot"></span><span class="bt-loader-ellips__dot"></span><span class="bt-loader-ellips__dot"></span>
                        </div>
                        <p class="infinite-scroll-last">
                            End of content
                        </p>
                        <p class="infinite-scroll-error">
                            End of content
                        </p>
                    </div>
                    <div class="clearfix" style="clear:both;">

                        ~~*
                        Lorem Ipsum is a type of placeholder text that has been used in the printing and typesetting industry for centuries. Its origins date back to a scrambled passage from "De Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. Despite its ancient origins, Lorem Ipsum remains a popular tool in modern design and publishing. The text itself is a garbled version of Latin, with words altered or removed to make it nonsensical, yet it has a more or less normal distribution of letters, making it resemble standard English.
                        *~
                    </div>
                </main>

                ~~if $cat_menu|@count >0~
                <aside id="secondary" role="complementary" class="primary-sidebar widget-area sidebar-slug-sidebar-woocommerce-shop sidebar-link-style-normal">
                    <div class="sidebar-inner-wrap">



                        <div id="tmcore-wp-widget-product-categories-layered-nav-3" class=" widget-scrollable widget tmcore-wp-widget-product-categories-layered-nav tmcore-wp-widget-filter">
                            <input type="hidden" class="widget-instance" data-name="TemplateMelaCore_WP_Widget_Product_Categories_Layered_Nav" data-instance="{&quot;title&quot;:&quot;Shop By Categories&quot;,&quot;orderby&quot;:&quot;name&quot;,&quot;display_type&quot;:&quot;list&quot;,&quot;list_style&quot;:&quot;normal&quot;,&quot;items_count&quot;:&quot;on&quot;,&quot;show_hierarchy&quot;:0,&quot;enable_scrollable&quot;:1,&quot;enable_collapsed&quot;:0}"/>
                            <span class="gamma widget-title">Подкатегории</span>
                            <div class="widget-content" >
                                <div class="widget-content-inner">
                                    <ul class="show-display-list show-items-count-on list-style-normal">

                                        ~~foreach from=$cat_menu.all item=cm~
                                        <li class="wc-layered-nav-term">
                                            <a href="/category/~~$cm.id~/" class="item-link">~~$cm.title~</a>
                                        </li>
                                        ~~/foreach~


                                    </ul>
                                </div>
                            </div>
                        </div>




                        ~~*include file="market/category/widgets/product-highlight.tpl"*~
                        ~~*include file="market/category/widgets/product-layered-nav.tpl"*~
                        ~~*include file="market/category/widgets/product-price-filter.tpl"*~
                        ~~*include file="market/category/widgets/product-rating-filter.tpl"*~

                    </div>
                </aside><!-- #secondary -->
                ~~/if~

            </div>
        </div>
    </div><!-- #inner-wrap -->

    ~~include file='market/tpl/footer.tpl'~<!-- #colophon -->

</div><!-- #wrapper -->

~~include file='market/tpl/bottom_script_template.tpl'~
~~include file='market/tpl/bottom_script.tpl'~

</body>
</html>