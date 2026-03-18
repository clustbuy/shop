<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <link rel="profile" href="http://gmpg.org/xfn/11">
        <link rel="pingback" href="/xmlrpc.php">

        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Корзина</title>


        ~~include file='market/tpl/head.tpl'~


    </head>

    <body class="home page-template page-template-elementor_header_footer page page-id-22 theme-kava woocommerce-no-js layout-fullwidth blog-default woocommerce-active jet-desktop-menu-active elementor-default elementor-template-full-width elementor-kit-16 elementor-page elementor-page-22">

    <div id="header">
        <a href="#menu"><span></span></a>
    </div>


    <div id="page" class="site">
            <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

            ~~include file="market/tpl/header.tpl"~

            <div id="content" class="site-content ">

                <div class="site-content__wrap container">
                    <div class="row">

                        <div id="primary" class="col-xs-12">

                            <main id="main" class="site-main">
                                <article id="post-8" class="post-8 page type-page status-publish hentry">

                                    <header class="page-header">
                                        <h1 class="page-title">Корзина</h1>
                                    </header><!-- .page-header -->

                                    <div class="page-content">
                                        <div class="woocommerce">
                                            ~~*
                                            <div class="woocommerce-notices-wrapper">
                                                <div class="woocommerce-message" role="alert">
                                                    Корзина обновлена
                                                </div>
                                            </div>
                                            *~

                                            <form class="woocommerce-cart-form" action="https://ld-wp73.template-help.com/woocommerce/prod_29431/v1/cart/" method="post">

                                                <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th class="product-remove">&nbsp;</th>
                                                        <th class="product-thumbnail">&nbsp;</th>
                                                        <th class="product-name">Наименование</th>
                                                        <th class="product-price">Цена</th>
                                                        <th class="product-quantity">К-во</th>
                                                        <th class="product-subtotal">Сумма</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

<!-- ko foreach: cart().items() -->
<tr class="woocommerce-cart-form__cart-item cart_item">

    <td class="product-remove"><a  data-bind="click: $root.remove_from_cart.bind($data, guid())"  class="remove" aria-label="Remove this item" data-product_id="515" data-product_sku="N/A">×</a></td>

    <td class="product-thumbnail"><a  target="_blank" data-bind="attr: {href: `/product/${guid()}`}"><img width="300" height="300"  data-bind="attr:{src: `${img_url()}`, srcset: `${img_url()}  300w, ${img_url()}  100w`}"  class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="image" ~~*srcset="$url 300w, $url 100w, $url 150w, $url 370w, $url 512w, $url 570w"*~ sizes="(max-width: 300px) 100vw, 300px"></a></td>

    <td class="product-name" data-title="Product"><a target="_blank" data-bind="attr: {href: `/product/${guid()}`}" ><span  data-bind="text: title()"></span></a></td>

    <td class="product-price" data-title="Price"><span class="woocommerce-Price-amount amount"  data-bind="text: cost() + ' ₽'"></span></td>

    <td class="product-quantity" data-title="Quantity">
        <div class="quantity">
            <label class="screen-reader-text" for="quantity_674f60571d5fc" ></label>
            <input
                    data-bind="textInput: product_amount(), valueUpdate: 'afterkeydown', event: {change: $root.validate_amount.bind($data, guid()) }"
                    style="width: 80px;"
                    type="number"
                    id="quantity_674f60571d5fc"
                    class="input-text qty text"
                    value=""
                    min="1"
                    size="4"
                    placeholder=""
                    inputmode="numeric">
        </div></td>

    <td class="product-subtotal" data-title="Subtotal"><span class="woocommerce-Price-amount amount" data-bind="text:Math.round(Number(cost()*(product_amount())))+ ' ₽'"></span></td>
</tr>
<!-- /ko -->

                                                    ~~*
                                                    <tr>
                                                        <td colspan="6" class="actions">
                                                            <div class="coupon">
                                                                <label for="coupon_code">Coupon:</label>
                                                                <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code">
                                                                <button type="submit" class="button" name="apply_coupon" value="Apply coupon">
                                                                    Apply coupon
                                                                </button>
                                                            </div>
                                                            <button type="submit" class="button" name="update_cart" value="Update cart" disabled="" aria-disabled="true">
                                                                Update cart
                                                            </button>
                                                            <input type="hidden" id="woocommerce-cart-nonce" name="woocommerce-cart-nonce" value="987739d263">
                                                            <input type="hidden" name="_wp_http_referer" value="/woocommerce/prod_29431/v1/cart/">
                                                        </td>
                                                    </tr>
                                                    *~

                                                    </tbody>
                                                </table>
                                            </form>

                                            <div class="cart cart-collaterals">
                                                <div class="cart_totals">

                                                    <h2>Итого:</h2>


                                                    <table cellspacing="0" class="shop_table shop_table_responsive">

                                                        <tbody>
                                                        <tr class="cart-subtotal">
                                                            <th></th>
                                                            <td data-title="Subtotal"><span class="woocommerce-Price-amount amount"  data-bind="text: total_cart_sum() + ' ₽'"></span></td>
                                                        </tr>

                                                        <tr class="order-total">
                                                            ~~*<th>Сумма</th>
                                                            <td data-title="Total"><strong><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">$</span>52.50</span></strong></td>
                                                            *~
                                                        </tr>

                                                        </tbody>
                                                    </table>


                                                    <div class="wc-proceed-to-checkout">

                                                        <a href="/checkout/" class="checkout-button button alt wc-forward"> Перейти к оформлению</a>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div><!-- .page-content -->

                                </article><!-- #post-8 -->
                            </main><!-- #main -->

                        </div><!-- #primary -->

                    </div>
                </div>

            </div><!-- #content -->

            ~~*
            <div id="content" class="site-content ">

                <div class="site-content__wrap container">
                    <div class="row">

                        <div id="primary" class="col-xs-12">

                            <main id="main" class="site-main">
                                <article id="post-8" class="post-8 page type-page status-publish hentry">

                                    <header class="page-header">
                                        <h1 class="page-title">Корзина</h1>
                                    </header><!-- .page-header -->

                                    <div class="page-content">
                                        <div class="woocommerce">
                                            <div class="woocommerce-notices-wrapper"></div>
                                            <p class="cart-empty woocommerce-info">
                                                Корзина пуста
                                            </p>
                                            <p class="return-to-shop">
                                                <a class="button wc-backward" href="/"> Вернуться на главную </a>
                                            </p>
                                        </div>
                                    </div><!-- .page-content -->

                                </article><!-- #post-8 -->
                            </main><!-- #main -->

                        </div><!-- #primary -->

                    </div>
                </div>

            </div><!-- #content -->
            *~


            ~~include file="market/tpl/footer.tpl"~

        </div><!-- #page -->


        ~~*include file="market/tpl/bottom_script_template.tpl"*~
        ~~*include file="market/tpl/bottom_social.tpl"*~
        ~~include file="market/tpl/bottom_script.tpl"~
    </body>
</html>
