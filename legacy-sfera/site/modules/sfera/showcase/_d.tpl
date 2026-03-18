<!doctype html>
<html lang="en-US" class="no-js" itemtype="https://schema.org/WebPage" itemscope>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>~~$smarty.const.S_TITLE~</title>


    ~~include file='market/tpl/head.tpl'~


</head>

<body class="home page-template-default page page-id-2 wp-embed-responsive theme-avanam woocommerce-no-js color-switch-light has-dark-logo woocommerce-active product-style-1 products-no-gutter footer-on-bottom hide-focus-outline link-style-no-underline content-title-style-hide content-width-normal content-style-unboxed content-vertical-padding-hide non-transparent-header mobile-non-transparent-header base-elementor-colors elementor-default elementor-kit-54 elementor-page elementor-page-2">

~~*debug*~

<div id="wrapper" class="site wp-site-blocks">
    <a class="skip-link screen-reader-text scroll-ignore" href="#main">Skip to content</a>

    ~~include file='market/tpl/header.tpl'~


    <div id="inner-wrap" class="wrap hfeed bt-clear">
        <div id="primary" class="content-area">
            <div class="content-container site-container">
                <main id="main" class="site-main" role="main">
                    <div class="woocommerce base-woo-messages-none-woo-pages woocommerce-notices-wrapper"></div>			<div class="content-wrap">
                        <article id="post-2" class="entry content-bg single-entry post-footer-area-boxed post-2 page type-page status-publish hentry">
                            <div class="entry-content-wrap">

                                <div class="entry-content single-content">
                                    <div data-elementor-type="wp-page" data-elementor-id="2" class="elementor elementor-2">
                                        ~~include file='market/tpl/sections/slider.tpl'~
                                        ~~include file='market/tpl/sections/conditions.tpl'~

                                        ~~mod path='market/' mod_name='random_products'~

                                        ~~include file='market/tpl/sections/page_banners.tpl'~ ~~*3 баннера в блоке*~

                                        ~~*include file='market/tpl/sections/featured_products.tpl'*~

                                        ~~*include file='market/tpl/sections/shop_by_categories.tpl'*~  ~~*Товары по категориям*~

                                        ~~*include file='market/tpl/sections/page_two_banners.tpl'*~  ~~*2 баннера в блоке*~

                                        ~~*include file='market/tpl/sections/deal_of_the_day.tpl'*~

                                        ~~*include file='market/tpl/sections/free_shipping_banner.tpl'*~ ~~*Баннер про бесплатную доставку*~

                                        ~~*include file='market/tpl/sections/category_items_showcase.tpl'*~  ~~*Товары по категориям*~

                                        ~~*include file='market/tpl/sections/page_full_width_banner.tpl'*~ ~~*Баннер на полную ширину*~

                                        ~~*include file='market/tpl/sections/best_selling_products.tpl'*~ ~~*Пользуются большим спросом*~

                                        ~~*include file='market/tpl/sections/what_our_clients_says.tpl'*~
                                        ~~*include file='market/tpl/sections/from_posts.tpl'*~
                                        ~~*include file='market/tpl/sections/shop_by_brands.tpl'*~

                                    </div>
                                </div><!-- .entry-content -->
                            </div>
                        </article><!-- #post-2 -->

                    </div>
                </main><!-- #main -->
            </div>
        </div><!-- #primary -->
    </div><!-- #inner-wrap -->
    ~~include file='market/tpl/footer.tpl'~

</div><!-- #wrapper -->

~~*include file='market/tpl/bottom_script_template.tpl'*~
~~*include file='market/tpl/bottom_script.tpl'*~

</body>
</html>
