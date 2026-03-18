<style>
    .elementor-widget-wrap-mymenu
    {
        display: flex; /* Используем Flexbox */
        flex-wrap: wrap; /* Разрешаем перенос строк */
        gap: 20px; /* Отступ между элементами */
        padding: 20px; /* Внутренние отступы контейнера */
        box-sizing: border-box;
    }
    .elementor-section-mybox
     {
        flex: 1 1 calc(50% - 20px); /* Каждый блок занимает 1/3 ширины контейнера */
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        box-sizing: border-box;
     }
    </style>


<ul id="vertical-menu" class="menu">

    ~~foreach from=$cat_menu item=cm~
    <li id="menu-item-298" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-298 base-menu-mega-enabled base-menu-mega-width-custom base-menu-mega-columns-1 base-menu-mega-layout-equal">
        <a href="/category/~~$cm.id~/">
            <span class="nav-drop-title-wrap">~~$cm.title~
                <span class="dropdown-nav-toggle"><span class="base-svg-iconset svg-baseline">
                    <svg aria-hidden="true" class="base-svg-icon base-arrow-down-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <title>Expand</title><path d="M5.293 9.707l6 6c0.391 0.391 1.024 0.391 1.414 0l6-6c0.391-0.391 0.391-1.024 0-1.414s-1.024-0.391-1.414 0l-5.293 5.293-5.293-5.293c-0.391-0.391-1.024-0.391-1.414 0s-0.391 1.024 0 1.414z"></path>
                    </svg>
                    </span>
                </span>
            </span>
        </a>
        ~~if $cm.childrens|@count > 0~
        <ul class="sub-menu" >
            <li id="menu-item-306" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-306">
                <!-- [element-102] -->
                <div data-elementor-type="wp-post" data-elementor-id="102" class="elementor elementor-102">
                    <section class="elementor-section elementor-top-section elementor-element elementor-element-4ae009a elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="4ae009a" data-element_type="section">
                        <div class="elementor-container elementor-column-gap-no">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-c0385b3" data-id="c0385b3" data-element_type="column">
                                <div class="elementor-widget-wrap-mymenu elementor-element-populated">


                                    ~~foreach from=$cm.childrens item=cs~
                                    <section class="elementor-section-mybox elementor-section elementor-inner-section elementor-element elementor-element-8c80820 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="8c80820" data-element_type="section">
                                        <div class="elementor-container elementor-column-gap-no">



                                            <div class="~~*elementor-column elementor-col-33*~ elementor-inner-column elementor-element elementor-element-0213609" data-id="0213609" data-element_type="column">
                                                <div class="elementor-widget-wrap elementor-element-populated">
                                                    <div  style="width:unset;" class="elementor-element elementor-element-37674c6 product-cat-style-1 elementor-widget elementor-widget-tmcore-product-categories" data-id="37674c6" data-element_type="widget" data-widget_type="tmcore-product-categories.default">
                                                        <div class="elementor-widget-container">

                                                            <div class="product-cat">

                                                                <div class="cat-image"></div>

                                                                <div class="cat-title">
                                                                    <a href="/category/~~$cs.id~/" title="~~$cs.title~">~~$cs.title~</a>
                                                                </div>

                                                                ~~if $cs.childrens|@count > 0~
                                                                <ul class="sub-categories">
                                                                    ~~foreach from=$cm.childrens item=cs2~
                                                                    <li>
                                                                        <a href=" /category/~~$cs2.id~/">~~$cs2.title~</a>
                                                                    </li>
                                                                    ~~/foreach~
                                                                </ul>
                                                                ~~/if~

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                        </div>
                                    </section>
                                    ~~/foreach~

                                    ~~*
                                    <section class="elementor-section elementor-inner-section elementor-element elementor-element-5e138a3 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="5e138a3" data-element_type="section">


                                        <div class="elementor-container elementor-column-gap-no">


                                            <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-cfa7580" data-id="cfa7580" data-element_type="column">
                                                <div class="elementor-widget-wrap elementor-element-populated">
                                                    <div class="elementor-element elementor-element-539e2b9 product-cat-style-1 elementor-widget elementor-widget-tmcore-product-categories" data-id="539e2b9" data-element_type="widget" data-widget_type="tmcore-product-categories.default">
                                                        <div class="elementor-widget-container">

                                                            <div class="product-cat">

                                                                <div class="cat-image"></div>

                                                                <div class="cat-title">
                                                                    <a href="/product-category/jewellery/" title="Jewellery"> Jewellery </a>
                                                                </div>

                                                                <ul class="sub-categories">
                                                                    <li>
                                                                        <a href=" /product-category/jewellery/diamond-cluster/">Diamond Cluster</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/jewellery/drop-earrings/">Drop Earrings</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/jewellery/earrings/">Earrings</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/jewellery/necklace/">Necklace</a>
                                                                    </li>
                                                                </ul>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-1bed1ce" data-id="1bed1ce" data-element_type="column">
                                                <div class="elementor-widget-wrap elementor-element-populated">
                                                    <div class="elementor-element elementor-element-09078b6 product-cat-style-1 elementor-widget elementor-widget-tmcore-product-categories" data-id="09078b6" data-element_type="widget" data-widget_type="tmcore-product-categories.default">
                                                        <div class="elementor-widget-container">

                                                            <div class="product-cat">

                                                                <div class="cat-image"></div>

                                                                <div class="cat-title">
                                                                    <a href="/product-category/retro-fashion/" title="Retro Fashion"> Retro Fashion </a>
                                                                </div>

                                                                <ul class="sub-categories">
                                                                    <li>
                                                                        <a href=" /product-category/retro-fashion/bucket-hat/">Bucket Hat</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/retro-fashion/denim-skirt/">Denim Skirt</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/retro-fashion/shimmer/">Shimmer</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/retro-fashion/tie-dye/">Tie-Dye</a>
                                                                    </li>
                                                                </ul>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-23f9286" data-id="23f9286" data-element_type="column">
                                                <div class="elementor-widget-wrap elementor-element-populated">
                                                    <div class="elementor-element elementor-element-4d409bf product-cat-style-1 elementor-widget elementor-widget-tmcore-product-categories" data-id="4d409bf" data-element_type="widget" data-widget_type="tmcore-product-categories.default">
                                                        <div class="elementor-widget-container">

                                                            <div class="product-cat">

                                                                <div class="cat-image"></div>

                                                                <div class="cat-title">
                                                                    <a href="/product-category/watches/" title="Watches"> Watches </a>
                                                                </div>

                                                                <ul class="sub-categories">
                                                                    <li>
                                                                        <a href=" /product-category/watches/aviator-watches/">Aviator Watches</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/watches/goggles/">Goggles</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/watches/hybrid-watches/">Hybrid Watches</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href=" /product-category/watches/smart-watches/">Smart Watches</a>
                                                                    </li>
                                                                </ul>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                    </section>
                                    *~


                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- [/element-102] -->
            </li>
        </ul>
        ~~/if~
    </li>
    ~~/foreach~

    ~~*
    <li id="menu-item-303" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-303">
        <a href="/product-category/retro-fashion/">Retro Fashion</a>
    </li>
    <li id="menu-item-301" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-301 base-menu-mega-enabled base-menu-mega-width-custom base-menu-mega-columns-1 base-menu-mega-layout-equal">
        <a href="/product-category/furniture/"><span class="nav-drop-title-wrap">Furniture<span class="dropdown-nav-toggle"><span class="base-svg-iconset svg-baseline">
																<svg aria-hidden="true" class="base-svg-icon base-arrow-down-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
																	<title>Expand</title><path d="M5.293 9.707l6 6c0.391 0.391 1.024 0.391 1.414 0l6-6c0.391-0.391 0.391-1.024 0-1.414s-1.024-0.391-1.414 0l-5.293 5.293-5.293-5.293c-0.391-0.391-1.024-0.391-1.414 0s-0.391 1.024 0 1.414z"></path>
																</svg></span></span></span></a>
        <ul class="sub-menu">
            <li id="menu-item-307" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-307">
                <!-- [element-317] -->
                <div data-elementor-type="wp-post" data-elementor-id="317" class="elementor elementor-317">
                    <section class="elementor-section elementor-top-section elementor-element elementor-element-3eb1e79 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="3eb1e79" data-element_type="section">
                        <div class="elementor-container elementor-column-gap-no">
                            <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-c337f5c" data-id="c337f5c" data-element_type="column" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
                                <div class="elementor-widget-wrap elementor-element-populated">
                                    <div class="elementor-element elementor-element-ea63942 elementor-widget elementor-widget-heading" data-id="ea63942" data-element_type="widget" data-widget_type="heading.default">
                                        <div class="elementor-widget-container">
                                            <style>
                                                /*! elementor - v3.21.0 - 25-04-2024 */
                                                .elementor-heading-title {
                                                    padding: 0;
                                                    margin: 0;
                                                    line-height: 1
                                                }
                                                .elementor-widget-heading .elementor-heading-title[class*=elementor-size-] > a {
                                                    color: inherit;
                                                    font-size: inherit;
                                                    line-height: inherit
                                                }
                                                .elementor-widget-heading .elementor-heading-title.elementor-size-small {
                                                    font-size: 15px
                                                }
                                                .elementor-widget-heading .elementor-heading-title.elementor-size-medium {
                                                    font-size: 19px
                                                }
                                                .elementor-widget-heading .elementor-heading-title.elementor-size-large {
                                                    font-size: 29px
                                                }
                                                .elementor-widget-heading .elementor-heading-title.elementor-size-xl {
                                                    font-size: 39px
                                                }
                                                .elementor-widget-heading .elementor-heading-title.elementor-size-xxl {
                                                    font-size: 59px
                                                }
                                            </style><h6 class="elementor-heading-title elementor-size-default">Furniture & Jewellery</h6>
                                        </div>
                                    </div>
                                    <div class="elementor-element elementor-element-62def49 elementor-widget elementor-widget-tmcore-products" data-id="62def49" data-element_type="widget" data-widget_type="tmcore-products.default">
                                        <div class="elementor-widget-container">
                                            <div class="woocommerce columns-2  products-list products-list-1 woocommerce-product-list columns-laptop-1 columns-tablet-2 columns-mobile-1">
                                                <ul class="products content-wrap product-archive grid-cols grid-sm-col-2 grid-lg-col-2 woo-archive-action-visible woo-archive-btn-button align-buttons-bottom  woo-archive-image-hover-fade">
                                                    <li>

                                                        <a href="/product/bottle-grinder-set-ceramic-spice-mill-2-pcs/"> <img fetchpriority="high" width="300" height="300" src="/wp-content/uploads/2024/01/17-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" decoding="async" srcset="/wp-content/uploads/2024/01/17-300x300.jpg 300w, /wp-content/uploads/2024/01/17-150x150.jpg 150w, /wp-content/uploads/2024/01/17-768x768.jpg 768w, /wp-content/uploads/2024/01/17-205x205.jpg 205w, /wp-content/uploads/2024/01/17-600x600.jpg 600w, /wp-content/uploads/2024/01/17-100x100.jpg 100w, /wp-content/uploads/2024/01/17-96x96.jpg 96w, /wp-content/uploads/2024/01/17-460x460.jpg 460w, /wp-content/uploads/2024/01/17-236x236.jpg 236w, /wp-content/uploads/2024/01/17-118x118.jpg 118w, /wp-content/uploads/2024/01/17-296x296.jpg 296w, /wp-content/uploads/2024/01/17-148x148.jpg 148w, /wp-content/uploads/2024/01/17.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /> <span class="product-title">Bottle Grinder Set Ceramic Spice Mill 2 Pcs</span> </a>

                                                        <span class="woocommerce-Price-amount amount">
																										<bdi>
																											<span class="woocommerce-Price-currencySymbol">&#36;</span>28
																										</bdi></span>
                                                    </li>
                                                    <li>

                                                        <a href="/product/umi-chindi-puffy-stool-for-living-room/"> <img width="300" height="300" src="/wp-content/uploads/2024/01/20-1-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" decoding="async" srcset="/wp-content/uploads/2024/01/20-1-300x300.jpg 300w, /wp-content/uploads/2024/01/20-1-150x150.jpg 150w, /wp-content/uploads/2024/01/20-1-768x768.jpg 768w, /wp-content/uploads/2024/01/20-1-205x205.jpg 205w, /wp-content/uploads/2024/01/20-1-600x600.jpg 600w, /wp-content/uploads/2024/01/20-1-100x100.jpg 100w, /wp-content/uploads/2024/01/20-1-96x96.jpg 96w, /wp-content/uploads/2024/01/20-1-460x460.jpg 460w, /wp-content/uploads/2024/01/20-1-236x236.jpg 236w, /wp-content/uploads/2024/01/20-1-118x118.jpg 118w, /wp-content/uploads/2024/01/20-1-296x296.jpg 296w, /wp-content/uploads/2024/01/20-1-148x148.jpg 148w, /wp-content/uploads/2024/01/20-1.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /> <span class="product-title">Umi Chindi Puffy Stool for Living Room</span> </a>

                                                        <span class="woocommerce-Price-amount amount">
																										<bdi>
																											<span class="woocommerce-Price-currencySymbol">&#36;</span>37
																										</bdi></span>
                                                    </li>
                                                    <li>

                                                        <a href="/product/velvet-sofa-button-tufted-couch-with-2-pillows/"> <img width="300" height="300" src="/wp-content/uploads/2024/01/19-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" decoding="async" srcset="/wp-content/uploads/2024/01/19-300x300.jpg 300w, /wp-content/uploads/2024/01/19-150x150.jpg 150w, /wp-content/uploads/2024/01/19-768x768.jpg 768w, /wp-content/uploads/2024/01/19-205x205.jpg 205w, /wp-content/uploads/2024/01/19-600x600.jpg 600w, /wp-content/uploads/2024/01/19-100x100.jpg 100w, /wp-content/uploads/2024/01/19-96x96.jpg 96w, /wp-content/uploads/2024/01/19-460x460.jpg 460w, /wp-content/uploads/2024/01/19-236x236.jpg 236w, /wp-content/uploads/2024/01/19-118x118.jpg 118w, /wp-content/uploads/2024/01/19-296x296.jpg 296w, /wp-content/uploads/2024/01/19-148x148.jpg 148w, /wp-content/uploads/2024/01/19.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /> <span class="product-title">Velvet Sofa, Button Tufted Couch With 2 Pillows</span> </a>

                                                        <del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																											<bdi>
																												<span class="woocommerce-Price-currencySymbol">&#36;</span>520
																											</bdi></span></del><span class="screen-reader-text">Original price was: &#036;520.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																											<bdi>
																												<span class="woocommerce-Price-currencySymbol">&#36;</span>500
																											</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;500.</span>
                                                    </li>
                                                    <li>

                                                        <a href="/product/latest-ferm-living-post-storage-cabinet/"> <img loading="lazy" width="300" height="300" src="/wp-content/uploads/2024/01/18-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" decoding="async" srcset="/wp-content/uploads/2024/01/18-300x300.jpg 300w, /wp-content/uploads/2024/01/18-150x150.jpg 150w, /wp-content/uploads/2024/01/18-768x768.jpg 768w, /wp-content/uploads/2024/01/18-205x205.jpg 205w, /wp-content/uploads/2024/01/18-600x600.jpg 600w, /wp-content/uploads/2024/01/18-100x100.jpg 100w, /wp-content/uploads/2024/01/18-96x96.jpg 96w, /wp-content/uploads/2024/01/18-460x460.jpg 460w, /wp-content/uploads/2024/01/18-236x236.jpg 236w, /wp-content/uploads/2024/01/18-118x118.jpg 118w, /wp-content/uploads/2024/01/18-296x296.jpg 296w, /wp-content/uploads/2024/01/18-148x148.jpg 148w, /wp-content/uploads/2024/01/18.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /> <span class="product-title">Latest Ferm Living Post Storage Cabinet</span> </a>

                                                        <del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																											<bdi>
																												<span class="woocommerce-Price-currencySymbol">&#36;</span>93
																											</bdi></span></del><span class="screen-reader-text">Original price was: &#036;93.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																											<bdi>
																												<span class="woocommerce-Price-currencySymbol">&#36;</span>89
																											</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;89.</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- [/element-317] -->
            </li>
        </ul>
    </li>
    <li id="menu-item-302" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-302">
        <a href="/product-category/electronics/">Electronics</a>
    </li>
    <li id="menu-item-300" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-300">
        <a href="/product-category/jewellery/">Jewellery</a>
    </li>
    <li id="menu-item-299" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-299 base-menu-mega-enabled base-menu-mega-width-custom base-menu-mega-columns-1 base-menu-mega-layout-equal">
        <a href="/product-category/watches/"><span class="nav-drop-title-wrap">Watches<span class="dropdown-nav-toggle"><span class="base-svg-iconset svg-baseline">
																<svg aria-hidden="true" class="base-svg-icon base-arrow-down-svg" fill="currentColor" version="1.1" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
																	<title>Expand</title><path d="M5.293 9.707l6 6c0.391 0.391 1.024 0.391 1.414 0l6-6c0.391-0.391 0.391-1.024 0-1.414s-1.024-0.391-1.414 0l-5.293 5.293-5.293-5.293c-0.391-0.391-1.024-0.391-1.414 0s-0.391 1.024 0 1.414z"></path>
																</svg></span></span></span></a>
        <ul class="sub-menu">
            <li id="menu-item-311" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-311">
                <a href="/product-category/watches/smart-watches/">Smart Watches</a>
            </li>
            <li id="menu-item-312" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-312">
                <a href="/product-category/watches/hybrid-watches/">Hybrid Watches</a>
            </li>
            <li id="menu-item-313" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-313">
                <a href="/product-category/watches/goggles/">Goggles</a>
            </li>
            <li id="menu-item-305" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-305">
                <a href="/product-category/fashion/">Fashion</a>
            </li>
            <li id="menu-item-315" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-315">
                <a href="/product-category/electronics/tablet/">Tablet</a>
            </li>
        </ul>
    </li>
    <li id="menu-item-304" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-304">
        <a href="/product-category/jewellery/">Jewellery</a>
    </li>
    <li id="menu-item-314" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-314">
        <a href="/product-category/furniture/poufs/">Poufs</a>
    </li>
    <li id="menu-item-1664" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1664">
        <a href="/product-category/electronics/mobile/">Mobile</a>
    </li>
    <li id="menu-item-1665" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1665">
        <a href="/product-category/fashion/shoes/">Shoes</a>
    </li>
    <li id="menu-item-1666" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1666">
        <a href="/product-category/jewellery/necklace/">Necklace</a>
    </li>
    *~

</ul>