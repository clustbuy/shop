<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="ltr" lang="ru" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="ltr" lang="ru" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="ltr" lang="ru"><!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Элилайф</title>


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

                        <div class="woocommerce-notices-wrapper"></div>
                        <div id="product-515" class="post-515 product type-product status-publish has-post-thumbnail product_cat-accessories product_cat-apparel first instock sale shipping-taxable purchasable product-type-variable">
                            <div data-elementor-type="jet-woo-builder" data-elementor-id="513" class="elementor elementor-513" data-elementor-settings="[]">
                                <div class="elementor-inner">
                                    <div class="elementor-section-wrap">
                                        <section class="elementor-element elementor-element-6d8ecbe elementor-section-boxed elementor-section-height-default elementor-section-height-default elementor-section elementor-top-section" data-id="6d8ecbe" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                            <div class="elementor-container elementor-column-gap-default">
                                                <div class="elementor-row">
                                                    <div class="elementor-element elementor-element-7ad307d elementor-column elementor-col-50 elementor-top-column" data-id="7ad307d" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                                        <div class="elementor-column-wrap  elementor-element-populated">
                                                            <div class="elementor-widget-wrap">
                                                                <div class="elementor-element elementor-element-c80652a jet-woo-product-gallery__trigger--top-left elementor-widget elementor-widget-jet-woo-product-gallery-slider" data-id="c80652a" data-element_type="widget" data-widget_type="jet-woo-product-gallery-slider.default">
                                                                    <div class="elementor-widget-container">




                                                                        <!-- Главный слайдер -->
                                                                        <div class="swiper main-slider">
                                                                            <div class="swiper-wrapper" style="/*height: 50px;*/">
                                                                                ~~foreach from=$item.gallery item=g~
                                                                                <div class="swiper-slide"><img src="~~$g.url~" alt=""></div>
                                                                                ~~/foreach~

                                                                            </div>
                                                                        </div>

                                                                        <!-- Миниатюрный слайдер -->
                                                                        <div class="swiper thumbnail-slider">
                                                                            <div class="swiper-wrapper" style="height: 100px;">
                                                                                ~~foreach from=$item.gallery item=g~
                                                                                <div class="swiper-slide"><img src="~~$g.url~"  style="width:250px;" alt=""></div>
                                                                                ~~/foreach~

                                                                            </div>
                                                                        </div>



                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="elementor-element elementor-element-b54dd66 elementor-column elementor-col-50 elementor-top-column" data-id="b54dd66" data-element_type="column">
                                                        <div class="elementor-column-wrap  elementor-element-populated">
                                                            <div class="elementor-widget-wrap">




                                                                <div class="elementor-element elementor-element-8e33bbb elementor-widget elementor-widget-jet-single-title" data-id="8e33bbb" data-element_type="widget" data-widget_type="jet-single-title.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-jet-single-title jet-woo-builder">
                                                                            <h1 class="product_title entry-title">~~$item.title~</h1>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="elementor-element elementor-element-4c33eaf elementor-widget elementor-widget-jet-single-price" data-id="4c33eaf" data-element_type="widget" data-widget_type="jet-single-price.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-jet-single-price jet-woo-builder">
                                                                            <p class="price">
                                                                                <ins><span class="woocommerce-Price-amount amount">~~$item.cost|price~ ₽ </span></ins>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                ~~*
                                                                <div class="elementor-element elementor-element-0143154 elementor-widget elementor-widget-jet-single-excerpt" data-id="0143154" data-element_type="widget" data-widget_type="jet-single-excerpt.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-jet-single-excerpt jet-woo-builder">
                                                                            <div class="woocommerce-product-details__short-description">
                                                                                <p>
                                                                                    ~~$item.description~
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                *~
                                                                <div class="elementor-element elementor-element-6233e18 elementor-widget elementor-widget-jet-single-add-to-cart" data-id="6233e18" data-element_type="widget" data-widget_type="jet-single-add-to-cart.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-jet-single-add-to-cart jet-woo-builder">

                                                                                ~~*
                                                                                <table class="variations" cellspacing="0">
                                                                                    <tbody>
                                                                                    <tr>
                                                                                        <td class="label"><label for="pa_size">size:</label></td>
                                                                                        <td class="value">
                                                                                            <select id="pa_size" class="" name="attribute_pa_size" data-attribute_name="attribute_pa_size" data-show_option_none="yes">
                                                                                                <option value="">Choose an option</option><option value="10cm20cm40cm"  selected='selected'>10cm*20cm*40cm</option><option value="20cm30cm50cm" >20cm*30cm*50cm</option><option value="30cm40cm60cm" >30cm*40cm*60cm</option>
                                                                                            </select><a class="reset_variations" href="#">Clear</a></td>
                                                                                    </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                                *~

                                                                                <div class="single_variation_wrap">
                                                                                    <div class="woocommerce-variation single_variation"></div>
                                                                                    <div class="woocommerce-variation-add-to-cart variations_button">

                                                                                        <div class="quantity">
                                                                                            <label class="screen-reader-text" for="quantity_67948a535a687">~~$item.title~</label>
                                                                                            <input
                                                                                                    type="number"
                                                                                                    id="quantity_67948a535a687"
                                                                                                    class="input-text qty text"
                                                                                                    step="1"
                                                                                                    min="1"
                                                                                                    max=""
                                                                                                    name="quantity"
                                                                                                    value="1"
                                                                                                    title="Qty"
                                                                                                    size="4"
                                                                                                    placeholder=""
                                                                                                    inputmode="numeric" />
                                                                                        </div>

                                                                                        <a onclick="a2c('~~$item.guid~'); return;"  class="\/ajax\/ button alt">
                                                                                            в корзину
                                                                                        </a>


                                                                                    </div>
                                                                                </div>


                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                ~~*
                                                                <div class="elementor-element elementor-element-148161a elementor-widget__width-auto elementor-widget elementor-widget-jet-wishlist-button" data-id="148161a" data-element_type="widget" data-widget_type="jet-wishlist-button.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="jet-wishlist-button jet-cw">
                                                                            <div class="jet-wishlist-button__container">
                                                                                <a href="#" class="jet-wishlist-button__link jet-wishlist-button__link--icon-left" data-widget-type="jet-wishlist-button" data-product-id="515" data-widget-id="148161a"> <div class="jet-wishlist-button__plane jet-wishlist-button__plane-normal"></div> <div class="jet-wishlist-button__plane jet-wishlist-button__plane-added"></div>
                                                                                    <div class="jet-wishlist-button__state jet-wishlist-button__state-normal">
																							<span class="jet-wishlist-button__icon jet-cw-icon">
																								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20">
																									<path fill-rule="evenodd" clip-rule="evenodd" d="M10.0227 2.90774C10.0227 2.90774 9.86513 2.75078 9.59254 2.52293C8.86979 1.91881 7.33822 0.816405 5.78987 0.820323C2.40363 0.828891 -8.19396e-05 3.81588 2.09496e-09 6.81143C0.000206475 14.3589 10.0227 19.1797 10.0227 19.1797C10.0227 19.1797 20 14.3589 20 6.81143C20 3.81588 17.6417 0.820331 14.2555 0.820323C12.4302 0.820319 10.9016 2.06312 10.2986 2.63082C10.1201 2.79885 10.0227 2.90774 10.0227 2.90774ZM10.0214 17.8579C9.77362 17.7231 9.44671 17.5384 9.06437 17.3065C8.1627 16.7597 6.96562 15.9579 5.77425 14.9363C3.34387 12.8522 1.17196 10.0583 1.17188 6.8114C1.17181 4.36183 3.14838 1.99889 5.79284 1.99219C6.51016 1.99038 7.33021 2.35813 8.06035 2.84005C8.40726 3.06903 8.698 3.29979 8.90126 3.47293C9.00228 3.55898 9.0801 3.62943 9.13074 3.67647C9.15602 3.69995 9.17441 3.71748 9.1854 3.72808C9.1909 3.73337 9.19453 3.73692 9.19625 3.7386L9.19628 3.73863L9.19683 3.73917L9.19737 3.7397L9.19739 3.73972L10.0716 4.61076L10.8936 3.69185C10.8932 3.69231 10.8932 3.69228 10.8936 3.69179C10.8937 3.69168 10.8939 3.69154 10.894 3.69138C10.8951 3.69014 10.8976 3.68745 10.9014 3.68341C10.9099 3.67427 10.925 3.65825 10.9464 3.63633C10.9892 3.59241 11.0567 3.5253 11.1462 3.4427C11.3263 3.27646 11.5893 3.05325 11.9138 2.8311C12.5829 2.37321 13.4076 1.9922 14.2555 1.9922C16.8833 1.9922 18.8281 4.34601 18.8281 6.81143C18.8281 10.0606 16.6649 12.8548 14.2465 14.938C13.0607 15.9594 11.8693 16.761 10.9719 17.3077C10.5924 17.539 10.2678 17.7232 10.0214 17.8579Z"></path>
																								</svg></span><span class="jet-wishlist-button__label">Add To Wishlist</span>
                                                                                    </div>
                                                                                    <div class="jet-wishlist-button__state jet-wishlist-button__state-added">
																							<span class="jet-wishlist-button__icon jet-cw-icon">
																								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="14" viewBox="0 0 20 14">
																									<path fill-rule="evenodd" clip-rule="evenodd" d="M20 1.02776L8.09433 14L0 5.18055L0.943261 4.15279L8.09433 11.9445L19.0567 0L20 1.02776Z"></path>
																								</svg></span><span class="jet-wishlist-button__label">View Wishlist</span>
                                                                                    </div> </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                *~

                                                                <div class="elementor-element elementor-element-0ae4097 elementor-widget elementor-widget-jet-single-meta" data-id="0ae4097" data-element_type="widget" data-widget_type="jet-single-meta.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-jet-single-meta jet-woo-builder">
                                                                            <div class="product_meta">

                                                                                <span class="sku_wrapper">Артикул: <span class="sku">~~$item.art~</span></span>

                                                                                ~~*
                                                                                <span class="posted_in">Категории: <a href="https://ld-wp73.template-help.com/woocommerce/prod_29431/v1/product-category/accessories/" rel="tag">Accessories</a>, <a href="https://ld-wp73.template-help.com/woocommerce/prod_29431/v1/product-category/apparel/" rel="tag">Apparel</a></span>
                                                                                *~

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="elementor-element elementor-element-c20fc5e tabs-single-wrap elementor-tabs-view-top elementor-tabs-controls-left elementor-widget elementor-widget-jet-single-tabs" data-id="c20fc5e" data-element_type="widget" data-widget_type="jet-single-tabs.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-jet-single-tabs jet-woo-builder">
                                                                            <div class="jet-single-tabs__wrap">

                                                                                <table class="woocommerce-product-attributes shop_attributes">

                                                                                    ~~foreach from=$item.params item=p~
                                                                                    <tr class="woocommerce-product-attributes-item woocommerce-product-attributes-item--attribute_pa_size">
                                                                                        <th class="woocommerce-product-attributes-item__label" style="text-align:left;">~~$p.title~ :</th>
                                                                                        <td class="woocommerce-product-attributes-item__value">
                                                                                            <p>
                                                                                                ~~$p.val~
                                                                                            </p></td>
                                                                                    </tr>
                                                                                    ~~/foreach~
                                                                                </table>



                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                        <section class="elementor-element elementor-element-3b59775 elementor-section-full_width elementor-section-height-default elementor-section-height-default elementor-section elementor-top-section" data-id="3b59775" data-element_type="section">
                                            <div class="elementor-container elementor-column-gap-default">
                                                <div class="elementor-row">
                                                    <div class="elementor-element elementor-element-d9e9fcf elementor-column elementor-col-100 elementor-top-column" data-id="d9e9fcf" data-element_type="column">
                                                        <div class="elementor-column-wrap  elementor-element-populated">
                                                            <div class="elementor-widget-wrap">
                                                                <div class="elementor-element elementor-element-94bd2ff elementor-widget elementor-widget-divider" data-id="94bd2ff" data-element_type="widget" data-widget_type="divider.default">
                                                                    <div class="elementor-widget-container">
                                                                        <div class="elementor-divider">
                                                                            <span class="elementor-divider-separator"> </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </main><!-- #main -->
                </div><!-- #primary -->

            </div>
        </div>

    </div><!-- #content -->


    ~~include file="market/tpl/footer.tpl"~

</div><!-- #page -->
~~*debug*~

<script>
    var Items = ~~$items_json~;
</script>

~~include file="market/tpl/bottom_script.tpl"~


</body>
</html>