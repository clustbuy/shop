<!doctype html>
<html lang="en-US" class="no-js" itemtype="https://schema.org/WebPage" itemscope>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>~~$smarty.const.S_TITLE~</title>


    ~~include file='market/tpl/head.tpl'~


</head>

<body class="page-template-default page page-id-50 wp-embed-responsive theme-avanam woocommerce-cart woocommerce-page woocommerce-no-js color-switch-light has-dark-logo woocommerce-active product-style-1 products-no-gutter footer-on-bottom hide-focus-outline link-style-no-underline content-title-style-above content-width-normal content-style-unboxed content-vertical-padding-show non-transparent-header mobile-non-transparent-header base-elementor-colors elementor-default elementor-kit-54">
<div id="wrapper" class="site wp-site-blocks">
    <a class="skip-link screen-reader-text scroll-ignore" href="#main">Skip to content</a>

    ~~include file='market/tpl/header.tpl'~

    <div id="inner-wrap" class="wrap hfeed bt-clear">

        <section role="banner" class="entry-hero page-hero-section entry-hero-layout-standard">
            <div class="entry-hero-container-inner">
                <div class="hero-section-overlay"></div>
                <div class="hero-container site-container">
                    <header class="entry-header page-title title-align-inherit title-tablet-align-inherit title-mobile-align-inherit">
                        <nav id="base-breadcrumbs" aria-label="Breadcrumbs"  class="base-breadcrumbs">
                            <div class="base-breadcrumb-container">
                                <span><a href="/" itemprop="url" class="base-bc-home" ><span>Главная</span></a></span>
                                <span class="bc-delimiter">/</span>
                                <span class="base-bread-current">Корзина</span>
                            </div>
                        </nav><h1 class="entry-title">Корзина</h1>
                    </header><!-- .entry-header -->
                </div>
            </div>
        </section><!-- .entry-hero -->
        <div id="primary" class="content-area">
            <div class="content-container site-container">
                <main id="main" class="site-main" role="main">
                    <div class="content-wrap">
                        <article id="post-50" class="entry content-bg single-entry post-footer-area-boxed post-50 page type-page status-publish hentry">
                            <div class="entry-content-wrap">

                                <div class="entry-content single-content">
                                    <div class="woocommerce">
                                        <div class="woocommerce-notices-wrapper"></div>
                                        <div class="base-woo-cart-form-wrap">
                                            <form class="woocommerce-cart-form" action="/cart/" method="post">

                                                ~~*
                                                <div class="cart-summary">
                                                    <h2>Cart Summary</h2>
                                                </div>
                                                *~

                                                <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th class="product-remove"><span class="screen-reader-text">Удалить</span></th>
                                                        <th class="product-thumbnail"><span class="screen-reader-text">Изображение</span></th>
                                                        <th class="product-name">Наименование</th>
                                                        <th class="product-price">Цена за единицу</th>
                                                        <th class="product-quantity">Кличество</th>
                                                        <th class="product-subtotal">Стоимость</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    ~~*
                                                    <div id="bt-woo-cart-notice-2267" class="bt-woo-cart-notice" style=" border-width:3px; border-style:solid; border-color:#aaaaaa; color:#444444; ">
                                                        <span class="bt-woo-cart-notice-message" style="">Use GET20OFF coupon code to get 20% off on minimum order above $100</span><a href="/cart/?coupon_code=GET20OFF" class="button" onMouseOver="this.style.background='#777777',this.style.color='#ffffff'" onMouseOut="this.style.background='#999999',this.style.color='#ffffff',this.style.borderColor='transparent'" style="background-color:#999999; color:#ffffff; border-color:transparent;  ">Apply Coupon</a>
                                                    </div>
                                                    *~

                                                    <!-- ko foreach: cart().items() -->
                                                    <tr class="woocommerce-cart-form__cart-item cart_item">

                                                        <td class="product-remove"><a  data-bind="click: $root.remove_from_cart.bind($data, guid())"  class="remove" aria-label="Удалить" data-product_id="253" data-product_sku="ZSA-HFG-434">&times;</a></td>

                                                        <td class="product-thumbnail">
                                                            <a data-bind="attr: {href: `/product/${guid()}`}" >
                                                                <img
                                                                        loading="lazy"
                                                                        decoding="async"
                                                                        width="300"
                                                                        height="300"
                                                                        class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail"
                                                                        alt=""
                                                                        data-bind="attr:{src: `${img_url()}`, srcset: `${img_url()}  300w, ${img_url()}  100w`}"
                                                                        sizes="(max-width: 300px) 100vw, 300px"
                                                                />
                                                            </a>
                                                        </td>

                                                        <td class="product-name" data-title="Product"><a  target="_blank" data-bind="attr: {href: `/product/${guid()}`}" ><span  data-bind="text: title()"></span></a></td>

                                                        <td class="product-price" data-title="Price" style="text-align: right;">
                                                            <span class="woocommerce-Price-amount amount">
															<bdi   data-bind="text: numberWithSpaces(cost()) + ' ₽'">

															</bdi>
                                                            </span>
                                                        </td>




                                                        <td class="product-quantity" data-title="Количество">
                                                            <div class="quantity ~~*spinners-added*~">

                                                                ~~*<input type="button" value="-" class="minus"  data-bind="click: $root.amount_minus.bind($data, guid())">*~
                                                                <label class="screen-reader-text" for="quantity_67a7abf693d52"  data-bind="text: title() + ' - количество'"></label>
                                                                <input
                                                                        data-bind="textInput: product_amount(), valueUpdate: 'afterkeydown', event: {change: $root.validate_amount.bind($data, guid()) }"
                                                                        type="number"
                                                                        id="quantity_67a7abf693d52"
                                                                        class="input-text qty text"
                                                                        name="quantity"
                                                                        value="1"
                                                                        aria-label="Количество"
                                                                        size="4"
                                                                        min="1"
                                                                        max="296"
                                                                        step="1"
                                                                        placeholder=""
                                                                        inputmode="numeric"
                                                                        autocomplete="off"
                                                                />
                                                                ~~*<input type="button" value="+" class="plus" data-bind="click: $root.amount_plus.bind(guid(), $data)">*~
                                                            </div>
                                                        </td>

                                                        <td class="product-subtotal" data-title="Subtotal"  style="text-align: right;">
                                                            <span class="woocommerce-Price-amount amount">
															<bdi  data-bind="text:numberWithSpaces(Number(cost()*product_amount()))+ ' ₽'">

															</bdi>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <!-- /ko -->
                                                    
                                                    
                                                    
                                                    ~~*
                                                    <tr>
                                                        <td colspan="6" class="actions">
                                                            <div class="coupon">
                                                                <label for="coupon_code" class="screen-reader-text">Coupon:</label>
                                                                <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code" />
                                                                <button type="submit" class="button" name="apply_coupon" value="Apply coupon">
                                                                    Apply coupon
                                                                </button>
                                                            </div>
                                                            <button type="submit" class="button" name="update_cart" value="Update cart">
                                                                Update cart
                                                            </button>
                                                            <input type="hidden" id="woocommerce-cart-nonce" name="woocommerce-cart-nonce" value="4a8414ca31" />
                                                            <input type="hidden" name="_wp_http_referer" value="/wordpress/WCM05/WCM050122/cart/" />
                                                        </td>
                                                    </tr>
                                                    *~

                                                    </tbody>
                                                </table>
                                            </form>

                                            <div class="cart-collaterals  cart">
                                                <div class="cart_totals ">

                                                    <h2>Всего в корзине</h2>

                                                    <table cellspacing="0" class="shop_table shop_table_responsive">
                                                        ~~*
                                                        <tr class="cart-subtotal">
                                                            <th>Subtotal</th>
                                                            <td data-title="Subtotal"><span class="woocommerce-Price-amount amount">
															<bdi>
																<span class="woocommerce-Price-currencySymbol">&#36;</span>550
															</bdi></span></td>
                                                        </tr>


                                                        <tr class="woocommerce-shipping-totals shipping">
                                                            <th>Shipping</th>
                                                            <td data-title="Shipping">
                                                                <ul id="shipping_method" class="woocommerce-shipping-methods">
                                                                    <li>
                                                                        <input type="radio" name="shipping_method[0]" data-index="0" id="shipping_method_0_free_shipping1" value="free_shipping:1" class="shipping_method"  checked='checked' />
                                                                        <label for="shipping_method_0_free_shipping1">Free shipping</label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="shipping_method[0]" data-index="0" id="shipping_method_0_local_pickup3" value="local_pickup:3" class="shipping_method"  />
                                                                        <label for="shipping_method_0_local_pickup3">Local pickup: <span class="woocommerce-Price-amount amount">
																		<bdi>
																			<span class="woocommerce-Price-currencySymbol">&#36;</span>5
																		</bdi></span></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" name="shipping_method[0]" data-index="0" id="shipping_method_0_flat_rate2" value="flat_rate:2" class="shipping_method"  />
                                                                        <label for="shipping_method_0_flat_rate2">Flat rate: <span class="woocommerce-Price-amount amount">
																		<bdi>
																			<span class="woocommerce-Price-currencySymbol">&#36;</span>10
																		</bdi></span></label>
                                                                    </li>
                                                                </ul>
                                                                <p class="woocommerce-shipping-destination">
                                                                    Shipping to <strong>Gujarat</strong>.
                                                                </p>
                                                                <form class="woocommerce-shipping-calculator" action="/cart/" method="post">

                                                                    <a href="#" class="shipping-calculator-button">Change address</a>
                                                                    <section class="shipping-calculator-form" style="display:none;">

                                                                        <p class="form-row form-row-wide" id="calc_shipping_country_field">
                                                                            <label for="calc_shipping_country" class="screen-reader-text">Country / region:</label>
                                                                            <select name="calc_shipping_country" id="calc_shipping_country" class="country_to_state country_select" rel="calc_shipping_state">
                                                                                <option value="default">Select a country / region&hellip;</option>
                                                                                <option value="AF">Afghanistan</option><option value="AX">Åland Islands</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AS">American Samoa</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AI">Anguilla</option><option value="AQ">Antarctica</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="PW">Belau</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BQ">Bonaire, Saint Eustatius and Saba</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos (Keeling) Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo (Brazzaville)</option><option value="CD">Congo (Kinshasa)</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CW">Cura&ccedil;ao</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="SZ">Eswatini</option><option value="ET">Ethiopia</option><option value="FK">Falkland Islands</option><option value="FO">Faroe Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GM">Gambia</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GG">Guernsey</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard Island and McDonald Islands</option><option value="HN">Honduras</option><option value="HK">Hong Kong</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN" selected='selected'>India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IM">Isle of Man</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="CI">Ivory Coast</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JE">Jersey</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macao</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="KP">North Korea</option><option value="MK">North Macedonia</option><option value="MP">Northern Mariana Islands</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PS">Palestinian Territory</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RE">Reunion</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="ST">S&atilde;o Tom&eacute; and Pr&iacute;ncipe</option><option value="BL">Saint Barth&eacute;lemy</option><option value="SH">Saint Helena</option><option value="KN">Saint Kitts and Nevis</option><option value="LC">Saint Lucia</option><option value="SX">Saint Martin (Dutch part)</option><option value="MF">Saint Martin (French part)</option><option value="PM">Saint Pierre and Miquelon</option><option value="VC">Saint Vincent and the Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia/Sandwich Islands</option><option value="KR">South Korea</option><option value="SS">South Sudan</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard and Jan Mayen</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="TL">Timor-Leste</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks and Caicos Islands</option><option value="TV">Tuvalu</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom (UK)</option><option value="US">United States (US)</option><option value="UM">United States (US) Minor Outlying Islands</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="VG">Virgin Islands (British)</option><option value="VI">Virgin Islands (US)</option><option value="WF">Wallis and Futuna</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option>
                                                                            </select>
                                                                        </p>

                                                                        <p class="form-row form-row-wide" id="calc_shipping_state_field">
																	<span> <label for="calc_shipping_state" class="screen-reader-text">State / County:</label>
																		<select name="calc_shipping_state" class="state_select" id="calc_shipping_state" data-placeholder="State / County">
																			<option value="">Select an option&hellip;</option>
																			<option value="AP" >Andhra Pradesh</option><option value="AR" >Arunachal Pradesh</option><option value="AS" >Assam</option><option value="BR" >Bihar</option><option value="CT" >Chhattisgarh</option><option value="GA" >Goa</option><option value="GJ"  selected='selected'>Gujarat</option><option value="HR" >Haryana</option><option value="HP" >Himachal Pradesh</option><option value="JK" >Jammu and Kashmir</option><option value="JH" >Jharkhand</option><option value="KA" >Karnataka</option><option value="KL" >Kerala</option><option value="LA" >Ladakh</option><option value="MP" >Madhya Pradesh</option><option value="MH" >Maharashtra</option><option value="MN" >Manipur</option><option value="ML" >Meghalaya</option><option value="MZ" >Mizoram</option><option value="NL" >Nagaland</option><option value="OR" >Odisha</option><option value="PB" >Punjab</option><option value="RJ" >Rajasthan</option><option value="SK" >Sikkim</option><option value="TN" >Tamil Nadu</option><option value="TS" >Telangana</option><option value="TR" >Tripura</option><option value="UK" >Uttarakhand</option><option value="UP" >Uttar Pradesh</option><option value="WB" >West Bengal</option><option value="AN" >Andaman and Nicobar Islands</option><option value="CH" >Chandigarh</option><option value="DN" >Dadra and Nagar Haveli</option><option value="DD" >Daman and Diu</option><option value="DL" >Delhi</option><option value="LD" >Lakshadeep</option><option value="PY" >Pondicherry (Puducherry)</option>
																		</select> </span>
                                                                        </p>

                                                                        <p class="form-row form-row-wide" id="calc_shipping_city_field">
                                                                            <label for="calc_shipping_city" class="screen-reader-text">City:</label>
                                                                            <input type="text" class="input-text" value="" placeholder="City" name="calc_shipping_city" id="calc_shipping_city" />
                                                                        </p>

                                                                        <p class="form-row form-row-wide" id="calc_shipping_postcode_field">
                                                                            <label for="calc_shipping_postcode" class="screen-reader-text">Postcode / ZIP:</label>
                                                                            <input type="text" class="input-text" value="" placeholder="Postcode / ZIP" name="calc_shipping_postcode" id="calc_shipping_postcode" />
                                                                        </p>

                                                                        <p>
                                                                            <button type="submit" name="calc_shipping" value="1" class="button">
                                                                                Update
                                                                            </button>
                                                                        </p>
                                                                        <input type="hidden" id="woocommerce-shipping-calculator-nonce" name="woocommerce-shipping-calculator-nonce" value="45baba32c0" />
                                                                        <input type="hidden" name="_wp_http_referer" value="/wordpress/WCM05/WCM050122/cart/" />
                                                                    </section>
                                                                </form></td>
                                                        </tr>
                                                        *~

                                                        <tr class="order-total">
                                                            <th>Сумма</th>
                                                            <td data-title="Total">
                                                                <strong>
                                                                    <span class="woocommerce-Price-amount amount" data-bind="text: numberWithSpaces(total_cart_sum()) + ' ₽'">

                                                                    </span>
                                                                </strong>
                                                            </td>
                                                        </tr>

                                                    </table>

                                                    <div class="wc-proceed-to-checkout">

                                                        <a href="/checkout/" class="checkout-button button alt wc-forward">Оформить</a>
                                                    </div>

                                                    <div class="coupon">

                                                        <form method="post" action="/invoice/" target="_blank">

                                                            <label for="coupon_code" class="screen-reader-text">ИНН:</label>
                                                            <input
                                                                    type="text"
                                                                    style="/*width:50%*/"
                                                                    name="inn"
                                                                    class="input-text"
                                                                    id="coupon_code"
                                                                    value=""
                                                                    placeholder="ИНН организации"
                                                            >
                                                            <button type="submit" class="button" name="make_order_invoice" value="Сформировать счёт">
                                                                Получить счёт
                                                            </button>

                                                        </form>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                        ~~*
                                        <div class="cross-sells">
                                            <h2>You may be interested in&hellip;</h2>

                                            <ul class="products content-wrap product-archive grid-cols grid-ss-col-2 grid-sm-col-3 grid-md-col-4 grid-lg-col-6 woo-archive-action-visible woo-archive-btn-button align-buttons-bottom  woo-archive-image-hover-fade">

                                                <li class="shimmer entry content-bg loop-entry product type-product post-252 status-publish first instock product_cat-electronics has-post-thumbnail sale featured shipping-taxable purchasable product-type-variable has-default-attributes  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                                                    <div class="product-thumbnail">
                                                        <a href="/product/iphone-13-128gb-blue-unlocked-premium/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="Iphone 13, 128GB, Blue- Unlocked Premium">
                                                            <div class="product-onsale">
                                                                <span aria-hidden="true" class="onsale ">-3%</span>
                                                                <span class="screen-reader-text">Product on sale</span>
                                                            </div> <img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-15-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" srcset="/wp-content/uploads/2024/01/02-15-300x300.jpg 300w, /wp-content/uploads/2024/01/02-15-150x150.jpg 150w, /wp-content/uploads/2024/01/02-15-768x768.jpg 768w, /wp-content/uploads/2024/01/02-15-205x205.jpg 205w, /wp-content/uploads/2024/01/02-15-600x600.jpg 600w, /wp-content/uploads/2024/01/02-15-100x100.jpg 100w, /wp-content/uploads/2024/01/02-15-96x96.jpg 96w, /wp-content/uploads/2024/01/02-15-460x460.jpg 460w, /wp-content/uploads/2024/01/02-15-120x120.jpg 120w, /wp-content/uploads/2024/01/02-15-60x60.jpg 60w, /wp-content/uploads/2024/01/02-15-236x236.jpg 236w, /wp-content/uploads/2024/01/02-15-118x118.jpg 118w, /wp-content/uploads/2024/01/02-15-296x296.jpg 296w, /wp-content/uploads/2024/01/02-15-148x148.jpg 148w, /wp-content/uploads/2024/01/02-15.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-16-300x300.jpg" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" srcset="/wp-content/uploads/2024/01/02-16-300x300.jpg 300w, /wp-content/uploads/2024/01/02-16-150x150.jpg 150w, /wp-content/uploads/2024/01/02-16-768x768.jpg 768w, /wp-content/uploads/2024/01/02-16-205x205.jpg 205w, /wp-content/uploads/2024/01/02-16-600x600.jpg 600w, /wp-content/uploads/2024/01/02-16-100x100.jpg 100w, /wp-content/uploads/2024/01/02-16-96x96.jpg 96w, /wp-content/uploads/2024/01/02-16-460x460.jpg 460w, /wp-content/uploads/2024/01/02-16-236x236.jpg 236w, /wp-content/uploads/2024/01/02-16-118x118.jpg 118w, /wp-content/uploads/2024/01/02-16-296x296.jpg 296w, /wp-content/uploads/2024/01/02-16-148x148.jpg 148w, /wp-content/uploads/2024/01/02-16.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                                        <div class="product-actions">
                                                            <button class="woosw-btn woosw-btn-252 woosw-btn-has-icon woosw-btn-icon-text" data-id="252" data-product_name="Iphone 13, 128GB, Blue- Unlocked Premium" data-product_image="/wp-content/uploads/2024/01/02-15-150x150.jpg" aria-label="Add to wishlist">
                                                                <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                                            </button>
                                                            <button class="woosc-btn woosc-btn-252  woosc-btn-has-icon woosc-btn-icon-text" data-id="252" data-product_name="Iphone 13, 128GB, Blue- Unlocked Premium" data-product_image="/wp-content/uploads/2024/01/02-15-150x150.jpg">
                                                                <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                                            </button>
                                                            <button class="woosq-btn woosq-btn-252 woosq-btn-has-icon woosq-btn-icon-text" data-id="252" data-effect="mfp-3d-unfold" data-context="default">
                                                                <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="product-details content-bg entry-content-wrap">
                                                        <h2 class="woocommerce-loop-product__title"><a href="/product/iphone-13-128gb-blue-unlocked-premium/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">Iphone 13, 128GB, Blue- Unlocked Premium</a></h2>
                                                        <div class="star-rating-block">
                                                            <div class="star-rating">
                                                                <span style="width:80%"><strong class="rating">4.00</strong> out of 5</span>
                                                            </div>
                                                        </div>
                                                        <span class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>299
																</bdi></span></del> <span class="screen-reader-text">Original price was: &#036;299.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>290
																</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;290.</span></span>
                                                        <div class="product-action-wrap style-button">
                                                            <a href="/product/iphone-13-128gb-blue-unlocked-premium/" data-quantity="1" class="button product_type_variable add_to_cart_button default" data-product_id="252" data-product_sku="CVN-SDF-364" aria-label="Select options for &ldquo;Iphone 13, 128GB, Blue- Unlocked Premium&rdquo;" aria-describedby="This product has multiple variants. The options may be chosen on the product page" rel="nofollow"><span class="add-to-cart-icon">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" fill="currentColor" version="1.1">
																<g id="surface1">
																	<path d="M 14.527344 2.125 C 14.414062 2.183594 14.257812 2.324219 14.179688 2.433594 C 14.054688 2.617188 14.039062 2.667969 14.039062 2.996094 C 14.039062 3.3125 14.054688 3.378906 14.164062 3.542969 C 14.234375 3.640625 14.371094 3.777344 14.46875 3.84375 L 14.644531 3.960938 L 16.613281 3.976562 L 18.582031 3.988281 L 14.382812 8.195312 C 9.941406 12.632812 9.984375 12.585938 9.984375 13.007812 C 9.984375 13.203125 10.121094 13.550781 10.257812 13.707031 C 10.378906 13.847656 10.785156 14.015625 10.992188 14.015625 C 11.417969 14.011719 11.371094 14.054688 15.804688 9.617188 L 20.011719 5.417969 L 20.023438 7.386719 L 20.039062 9.355469 L 20.15625 9.53125 C 20.222656 9.628906 20.359375 9.765625 20.457031 9.835938 C 20.621094 9.945312 20.6875 9.960938 21 9.960938 C 21.3125 9.960938 21.378906 9.945312 21.542969 9.835938 C 21.640625 9.765625 21.777344 9.628906 21.84375 9.53125 L 21.960938 9.355469 L 21.960938 2.640625 L 21.835938 2.457031 C 21.765625 2.359375 21.628906 2.222656 21.53125 2.15625 L 21.355469 2.039062 L 18.046875 2.023438 L 14.738281 2.015625 Z M 14.527344 2.125 "/>
																	<path d="M 4.777344 4.035156 C 3.488281 4.226562 2.433594 5.183594 2.105469 6.460938 C 2.019531 6.796875 2.015625 7.035156 2.015625 13.003906 C 2.015625 19.914062 1.996094 19.460938 2.351562 20.203125 C 2.507812 20.53125 2.621094 20.675781 2.972656 21.027344 C 3.324219 21.378906 3.46875 21.492188 3.796875 21.648438 C 4.539062 22.003906 4.085938 21.984375 10.996094 21.984375 C 16.960938 21.984375 17.203125 21.980469 17.539062 21.894531 C 18.6875 21.601562 19.550781 20.75 19.902344 19.566406 C 19.976562 19.3125 19.988281 18.945312 20.007812 15.515625 C 20.015625 13.4375 20.007812 11.628906 19.992188 11.5 C 19.929688 11.011719 19.566406 10.648438 19.078125 10.601562 C 18.683594 10.566406 18.355469 10.738281 18.132812 11.101562 L 18.023438 11.273438 L 18 15.1875 C 17.976562 19.09375 17.976562 19.101562 17.875 19.292969 C 17.738281 19.546875 17.503906 19.773438 17.25 19.894531 L 17.039062 19.992188 L 4.945312 19.992188 L 4.726562 19.882812 C 4.472656 19.757812 4.199219 19.476562 4.085938 19.222656 C 4.011719 19.070312 4.007812 18.53125 4.007812 13.007812 L 4.007812 6.960938 L 4.105469 6.75 C 4.226562 6.496094 4.453125 6.261719 4.707031 6.125 C 4.898438 6.023438 4.921875 6.023438 8.347656 6 L 11.792969 5.976562 L 11.992188 5.84375 C 12.273438 5.664062 12.425781 5.40625 12.453125 5.078125 C 12.488281 4.703125 12.308594 4.355469 11.976562 4.148438 L 11.75 4.007812 L 8.394531 4.003906 C 6.546875 4 4.921875 4.011719 4.777344 4.035156 Z M 4.777344 4.035156 "/>
																</g>
															</svg></span><span class="cart-text">Select options</span><span class="base-svg-iconset svg-baseline">
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

                                                <li class="shimmer entry content-bg loop-entry product type-product post-268 status-publish instock product_cat-aviator-watches product_cat-fashion product_cat-goggles product_cat-hybrid-watches product_cat-our-store product_cat-shimmer product_cat-smart-watches product_cat-tie-dye has-post-thumbnail sale featured shipping-taxable purchasable product-type-variable has-default-attributes  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                                                    <div class="product-thumbnail">
                                                        <a href="/product/nike-air-gold-pink-v-series-cast-and-crew-shoes/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="Nike Air Gold Pink V Series Cast and Crew Shoes">
                                                            <div class="product-onsale">
                                                                <span aria-hidden="true" class="onsale ">-3%</span>
                                                                <span class="screen-reader-text">Product on sale</span>
                                                            </div> <img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/03-8-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" srcset="/wp-content/uploads/2024/01/03-8-300x300.jpg 300w, /wp-content/uploads/2024/01/03-8-150x150.jpg 150w, /wp-content/uploads/2024/01/03-8-768x768.jpg 768w, /wp-content/uploads/2024/01/03-8-205x205.jpg 205w, /wp-content/uploads/2024/01/03-8-600x600.jpg 600w, /wp-content/uploads/2024/01/03-8-100x100.jpg 100w, /wp-content/uploads/2024/01/03-8-96x96.jpg 96w, /wp-content/uploads/2024/01/03-8-460x460.jpg 460w, /wp-content/uploads/2024/01/03-8-236x236.jpg 236w, /wp-content/uploads/2024/01/03-8-118x118.jpg 118w, /wp-content/uploads/2024/01/03-8-296x296.jpg 296w, /wp-content/uploads/2024/01/03-8-148x148.jpg 148w, /wp-content/uploads/2024/01/03-8.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-9-300x300.jpg" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" srcset="/wp-content/uploads/2024/01/02-9-300x300.jpg 300w, /wp-content/uploads/2024/01/02-9-150x150.jpg 150w, /wp-content/uploads/2024/01/02-9-768x768.jpg 768w, /wp-content/uploads/2024/01/02-9-205x205.jpg 205w, /wp-content/uploads/2024/01/02-9-600x600.jpg 600w, /wp-content/uploads/2024/01/02-9-100x100.jpg 100w, /wp-content/uploads/2024/01/02-9-96x96.jpg 96w, /wp-content/uploads/2024/01/02-9-460x460.jpg 460w, /wp-content/uploads/2024/01/02-9-236x236.jpg 236w, /wp-content/uploads/2024/01/02-9-118x118.jpg 118w, /wp-content/uploads/2024/01/02-9-296x296.jpg 296w, /wp-content/uploads/2024/01/02-9-148x148.jpg 148w, /wp-content/uploads/2024/01/02-9.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                                        <div class="product-actions">
                                                            <button class="woosw-btn woosw-btn-268 woosw-btn-has-icon woosw-btn-icon-text" data-id="268" data-product_name="Nike Air Gold Pink V Series Cast and Crew Shoes" data-product_image="/wp-content/uploads/2024/01/03-8-150x150.jpg" aria-label="Add to wishlist">
                                                                <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                                            </button>
                                                            <button class="woosc-btn woosc-btn-268  woosc-btn-has-icon woosc-btn-icon-text" data-id="268" data-product_name="Nike Air Gold Pink V Series Cast and Crew Shoes" data-product_image="/wp-content/uploads/2024/01/03-8-150x150.jpg">
                                                                <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                                            </button>
                                                            <button class="woosq-btn woosq-btn-268 woosq-btn-has-icon woosq-btn-icon-text" data-id="268" data-effect="mfp-3d-unfold" data-context="default">
                                                                <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="product-details content-bg entry-content-wrap">
                                                        <h2 class="woocommerce-loop-product__title"><a href="/product/nike-air-gold-pink-v-series-cast-and-crew-shoes/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">Nike Air Gold Pink V Series Cast and Crew Shoes</a></h2>
                                                        <div class="star-rating-block">
                                                            <div class="star-rating">
                                                                <span style="width:80%"><strong class="rating">4.00</strong> out of 5</span>
                                                            </div>
                                                        </div>
                                                        <span class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>31
																</bdi></span></del> <span class="screen-reader-text">Original price was: &#036;31.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>30
																</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;30.</span></span>
                                                        <div class="product-action-wrap style-button">
                                                            <a href="/product/nike-air-gold-pink-v-series-cast-and-crew-shoes/" data-quantity="1" class="button product_type_variable add_to_cart_button default" data-product_id="268" data-product_sku="HDF-GHD-546" aria-label="Select options for &ldquo;Nike Air Gold Pink V Series Cast and Crew Shoes&rdquo;" aria-describedby="This product has multiple variants. The options may be chosen on the product page" rel="nofollow"><span class="add-to-cart-icon">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" fill="currentColor" version="1.1">
																<g id="surface1">
																	<path d="M 14.527344 2.125 C 14.414062 2.183594 14.257812 2.324219 14.179688 2.433594 C 14.054688 2.617188 14.039062 2.667969 14.039062 2.996094 C 14.039062 3.3125 14.054688 3.378906 14.164062 3.542969 C 14.234375 3.640625 14.371094 3.777344 14.46875 3.84375 L 14.644531 3.960938 L 16.613281 3.976562 L 18.582031 3.988281 L 14.382812 8.195312 C 9.941406 12.632812 9.984375 12.585938 9.984375 13.007812 C 9.984375 13.203125 10.121094 13.550781 10.257812 13.707031 C 10.378906 13.847656 10.785156 14.015625 10.992188 14.015625 C 11.417969 14.011719 11.371094 14.054688 15.804688 9.617188 L 20.011719 5.417969 L 20.023438 7.386719 L 20.039062 9.355469 L 20.15625 9.53125 C 20.222656 9.628906 20.359375 9.765625 20.457031 9.835938 C 20.621094 9.945312 20.6875 9.960938 21 9.960938 C 21.3125 9.960938 21.378906 9.945312 21.542969 9.835938 C 21.640625 9.765625 21.777344 9.628906 21.84375 9.53125 L 21.960938 9.355469 L 21.960938 2.640625 L 21.835938 2.457031 C 21.765625 2.359375 21.628906 2.222656 21.53125 2.15625 L 21.355469 2.039062 L 18.046875 2.023438 L 14.738281 2.015625 Z M 14.527344 2.125 "/>
																	<path d="M 4.777344 4.035156 C 3.488281 4.226562 2.433594 5.183594 2.105469 6.460938 C 2.019531 6.796875 2.015625 7.035156 2.015625 13.003906 C 2.015625 19.914062 1.996094 19.460938 2.351562 20.203125 C 2.507812 20.53125 2.621094 20.675781 2.972656 21.027344 C 3.324219 21.378906 3.46875 21.492188 3.796875 21.648438 C 4.539062 22.003906 4.085938 21.984375 10.996094 21.984375 C 16.960938 21.984375 17.203125 21.980469 17.539062 21.894531 C 18.6875 21.601562 19.550781 20.75 19.902344 19.566406 C 19.976562 19.3125 19.988281 18.945312 20.007812 15.515625 C 20.015625 13.4375 20.007812 11.628906 19.992188 11.5 C 19.929688 11.011719 19.566406 10.648438 19.078125 10.601562 C 18.683594 10.566406 18.355469 10.738281 18.132812 11.101562 L 18.023438 11.273438 L 18 15.1875 C 17.976562 19.09375 17.976562 19.101562 17.875 19.292969 C 17.738281 19.546875 17.503906 19.773438 17.25 19.894531 L 17.039062 19.992188 L 4.945312 19.992188 L 4.726562 19.882812 C 4.472656 19.757812 4.199219 19.476562 4.085938 19.222656 C 4.011719 19.070312 4.007812 18.53125 4.007812 13.007812 L 4.007812 6.960938 L 4.105469 6.75 C 4.226562 6.496094 4.453125 6.261719 4.707031 6.125 C 4.898438 6.023438 4.921875 6.023438 8.347656 6 L 11.792969 5.976562 L 11.992188 5.84375 C 12.273438 5.664062 12.425781 5.40625 12.453125 5.078125 C 12.488281 4.703125 12.308594 4.355469 11.976562 4.148438 L 11.75 4.007812 L 8.394531 4.003906 C 6.546875 4 4.921875 4.011719 4.777344 4.035156 Z M 4.777344 4.035156 "/>
																</g>
															</svg></span><span class="cart-text">Select options</span><span class="base-svg-iconset svg-baseline">
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

                                                <li class="shimmer entry content-bg loop-entry product type-product post-254 status-publish instock product_cat-fashion product_cat-our-store product_cat-face-wash product_cat-shoes product_cat-t-shirt product_cat-tote-bag has-post-thumbnail sale shipping-taxable purchasable product-type-simple  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                                                    <div class="product-thumbnail">
                                                        <a href="/product/full-rim-fashionable-and-stylish-sunglasses/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="Full Rim Fashionable and Stylish Sunglasses">
                                                            <div class="product-onsale">
                                                                <span aria-hidden="true" class="onsale flash-sale">-5%</span>
                                                                <span class="screen-reader-text">Product on sale</span>
                                                            </div> <img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/04-12-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" srcset="/wp-content/uploads/2024/01/04-12-300x300.jpg 300w, /wp-content/uploads/2024/01/04-12-150x150.jpg 150w, /wp-content/uploads/2024/01/04-12-768x768.jpg 768w, /wp-content/uploads/2024/01/04-12-205x205.jpg 205w, /wp-content/uploads/2024/01/04-12-600x600.jpg 600w, /wp-content/uploads/2024/01/04-12-100x100.jpg 100w, /wp-content/uploads/2024/01/04-12-96x96.jpg 96w, /wp-content/uploads/2024/01/04-12-460x460.jpg 460w, /wp-content/uploads/2024/01/04-12-236x236.jpg 236w, /wp-content/uploads/2024/01/04-12-118x118.jpg 118w, /wp-content/uploads/2024/01/04-12-296x296.jpg 296w, /wp-content/uploads/2024/01/04-12-148x148.jpg 148w, /wp-content/uploads/2024/01/04-12.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-13-300x300.jpg" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" srcset="/wp-content/uploads/2024/01/02-13-300x300.jpg 300w, /wp-content/uploads/2024/01/02-13-150x150.jpg 150w, /wp-content/uploads/2024/01/02-13-768x768.jpg 768w, /wp-content/uploads/2024/01/02-13-205x205.jpg 205w, /wp-content/uploads/2024/01/02-13-600x600.jpg 600w, /wp-content/uploads/2024/01/02-13-100x100.jpg 100w, /wp-content/uploads/2024/01/02-13-96x96.jpg 96w, /wp-content/uploads/2024/01/02-13-460x460.jpg 460w, /wp-content/uploads/2024/01/02-13-236x236.jpg 236w, /wp-content/uploads/2024/01/02-13-118x118.jpg 118w, /wp-content/uploads/2024/01/02-13-296x296.jpg 296w, /wp-content/uploads/2024/01/02-13-148x148.jpg 148w, /wp-content/uploads/2024/01/02-13.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                                        <div class="product-actions">
                                                            <button class="woosw-btn woosw-btn-254 woosw-btn-has-icon woosw-btn-icon-text" data-id="254" data-product_name="Full Rim Fashionable and Stylish Sunglasses" data-product_image="/wp-content/uploads/2024/01/04-12-150x150.jpg" aria-label="Add to wishlist">
                                                                <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                                            </button>
                                                            <button class="woosc-btn woosc-btn-254  woosc-btn-has-icon woosc-btn-icon-text" data-id="254" data-product_name="Full Rim Fashionable and Stylish Sunglasses" data-product_image="/wp-content/uploads/2024/01/04-12-150x150.jpg">
                                                                <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                                            </button>
                                                            <button class="woosq-btn woosq-btn-254 woosq-btn-has-icon woosq-btn-icon-text" data-id="254" data-effect="mfp-3d-unfold" data-context="default">
                                                                <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="product-details content-bg entry-content-wrap">
                                                        <h2 class="woocommerce-loop-product__title"><a href="/product/full-rim-fashionable-and-stylish-sunglasses/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">Full Rim Fashionable and Stylish Sunglasses</a></h2>
                                                        <div class="star-rating-block">
                                                            <div class="star-rating">
                                                                <span style="width:100%"><strong class="rating">5.00</strong> out of 5</span>
                                                            </div>
                                                        </div>
                                                        <span class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>22
																</bdi></span></del> <span class="screen-reader-text">Original price was: &#036;22.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>21
																</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;21.</span></span>
                                                        <div class="product-action-wrap style-button">
                                                            <a href="?add-to-cart=254" data-quantity="1" class="button product_type_simple add_to_cart_button ajax_add_to_cart default" data-product_id="254" data-product_sku="KJL-FSD-563" aria-label="Add to cart: &ldquo;Full Rim Fashionable and Stylish Sunglasses&rdquo;" aria-describedby="" rel="nofollow"><span class="add-to-cart-icon">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="22px" height="22px" viewBox="0 0 22 22" fill="currentColor" version="1.1">
																<path d="M19.45 15.24a.86.86 0 00.848-.719l1.69-10.14a.86.86 0 00-.848-1H4.91L4.229.65A.86.86 0 003.395 0H.858a.86.86 0 100 1.719h1.865l.673 2.696L5.07 14.45v2.6a2.553 2.553 0 00-1.69 2.4A2.552 2.552 0 005.93 22c1.744 0 2.981-1.726 2.41-3.38h7.01c-.572 1.655.667 3.38 2.41 3.38a2.552 2.552 0 002.55-2.55 2.552 2.552 0 00-2.55-2.55H6.79v-1.66zm.676-10.141l-1.404 8.422H6.658L5.254 5.099zM6.76 19.45a.832.832 0 01-1.661 0 .832.832 0 011.661 0m11 .831a.832.832 0 010-1.661.832.832 0 010 1.661"></path>
															</svg></span><span class="cart-text">Add to cart</span><span class="base-svg-iconset svg-baseline">
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

                                                <li class="shimmer entry content-bg loop-entry product type-product post-270 status-publish instock product_cat-fashion product_cat-our-store product_cat-t-shirt product_cat-tote-bag has-post-thumbnail sale shipping-taxable purchasable product-type-variable has-default-attributes  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                                                    <div class="product-thumbnail">
                                                        <a href="/product/women-solid-round-neck-cotton-t-shirt/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="Women Solid Round Neck Cotton  T-Shirt">
                                                            <div class="product-onsale">
                                                                <span aria-hidden="true" class="onsale ">-6%</span>
                                                                <span class="screen-reader-text">Product on sale</span>
                                                            </div> <img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/01-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" srcset="/wp-content/uploads/2024/01/01-300x300.jpg 300w, /wp-content/uploads/2024/01/01-150x150.jpg 150w, /wp-content/uploads/2024/01/01-768x768.jpg 768w, /wp-content/uploads/2024/01/01-205x205.jpg 205w, /wp-content/uploads/2024/01/01-600x600.jpg 600w, /wp-content/uploads/2024/01/01-100x100.jpg 100w, /wp-content/uploads/2024/01/01-96x96.jpg 96w, /wp-content/uploads/2024/01/01-460x460.jpg 460w, /wp-content/uploads/2024/01/01-120x120.jpg 120w, /wp-content/uploads/2024/01/01-60x60.jpg 60w, /wp-content/uploads/2024/01/01-236x236.jpg 236w, /wp-content/uploads/2024/01/01-118x118.jpg 118w, /wp-content/uploads/2024/01/01-296x296.jpg 296w, /wp-content/uploads/2024/01/01-148x148.jpg 148w, /wp-content/uploads/2024/01/01.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-300x300.jpg" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" srcset="/wp-content/uploads/2024/01/02-300x300.jpg 300w, /wp-content/uploads/2024/01/02-150x150.jpg 150w, /wp-content/uploads/2024/01/02-768x768.jpg 768w, /wp-content/uploads/2024/01/02-205x205.jpg 205w, /wp-content/uploads/2024/01/02-600x600.jpg 600w, /wp-content/uploads/2024/01/02-100x100.jpg 100w, /wp-content/uploads/2024/01/02-96x96.jpg 96w, /wp-content/uploads/2024/01/02-460x460.jpg 460w, /wp-content/uploads/2024/01/02-236x236.jpg 236w, /wp-content/uploads/2024/01/02-118x118.jpg 118w, /wp-content/uploads/2024/01/02-296x296.jpg 296w, /wp-content/uploads/2024/01/02-148x148.jpg 148w, /wp-content/uploads/2024/01/02.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                                        <div class="product-actions">
                                                            <button class="woosw-btn woosw-btn-270 woosw-btn-has-icon woosw-btn-icon-text" data-id="270" data-product_name="Women Solid Round Neck Cotton  T-Shirt" data-product_image="/wp-content/uploads/2024/01/01-150x150.jpg" aria-label="Add to wishlist">
                                                                <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                                            </button>
                                                            <button class="woosc-btn woosc-btn-270  woosc-btn-has-icon woosc-btn-icon-text" data-id="270" data-product_name="Women Solid Round Neck Cotton  T-Shirt" data-product_image="/wp-content/uploads/2024/01/01-150x150.jpg">
                                                                <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                                            </button>
                                                            <button class="woosq-btn woosq-btn-270 woosq-btn-has-icon woosq-btn-icon-text" data-id="270" data-effect="mfp-3d-unfold" data-context="default">
                                                                <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="product-details content-bg entry-content-wrap">
                                                        <h2 class="woocommerce-loop-product__title"><a href="/product/women-solid-round-neck-cotton-t-shirt/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">Women Solid Round Neck Cotton  T-Shirt</a></h2>
                                                        <div class="star-rating-block">
                                                            <div class="star-rating">
                                                                <span style="width:100%"><strong class="rating">5.00</strong> out of 5</span>
                                                            </div>
                                                        </div>
                                                        <span class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>18
																</bdi></span></del> <span class="screen-reader-text">Original price was: &#036;18.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>17
																</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;17.</span></span>
                                                        <div class="product-action-wrap style-button">
                                                            <a href="/product/women-solid-round-neck-cotton-t-shirt/" data-quantity="1" class="button product_type_variable add_to_cart_button default" data-product_id="270" data-product_sku="AMD-PSJ-958" aria-label="Select options for &ldquo;Women Solid Round Neck Cotton  T-Shirt&rdquo;" aria-describedby="This product has multiple variants. The options may be chosen on the product page" rel="nofollow"><span class="add-to-cart-icon">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" fill="currentColor" version="1.1">
																<g id="surface1">
																	<path d="M 14.527344 2.125 C 14.414062 2.183594 14.257812 2.324219 14.179688 2.433594 C 14.054688 2.617188 14.039062 2.667969 14.039062 2.996094 C 14.039062 3.3125 14.054688 3.378906 14.164062 3.542969 C 14.234375 3.640625 14.371094 3.777344 14.46875 3.84375 L 14.644531 3.960938 L 16.613281 3.976562 L 18.582031 3.988281 L 14.382812 8.195312 C 9.941406 12.632812 9.984375 12.585938 9.984375 13.007812 C 9.984375 13.203125 10.121094 13.550781 10.257812 13.707031 C 10.378906 13.847656 10.785156 14.015625 10.992188 14.015625 C 11.417969 14.011719 11.371094 14.054688 15.804688 9.617188 L 20.011719 5.417969 L 20.023438 7.386719 L 20.039062 9.355469 L 20.15625 9.53125 C 20.222656 9.628906 20.359375 9.765625 20.457031 9.835938 C 20.621094 9.945312 20.6875 9.960938 21 9.960938 C 21.3125 9.960938 21.378906 9.945312 21.542969 9.835938 C 21.640625 9.765625 21.777344 9.628906 21.84375 9.53125 L 21.960938 9.355469 L 21.960938 2.640625 L 21.835938 2.457031 C 21.765625 2.359375 21.628906 2.222656 21.53125 2.15625 L 21.355469 2.039062 L 18.046875 2.023438 L 14.738281 2.015625 Z M 14.527344 2.125 "/>
																	<path d="M 4.777344 4.035156 C 3.488281 4.226562 2.433594 5.183594 2.105469 6.460938 C 2.019531 6.796875 2.015625 7.035156 2.015625 13.003906 C 2.015625 19.914062 1.996094 19.460938 2.351562 20.203125 C 2.507812 20.53125 2.621094 20.675781 2.972656 21.027344 C 3.324219 21.378906 3.46875 21.492188 3.796875 21.648438 C 4.539062 22.003906 4.085938 21.984375 10.996094 21.984375 C 16.960938 21.984375 17.203125 21.980469 17.539062 21.894531 C 18.6875 21.601562 19.550781 20.75 19.902344 19.566406 C 19.976562 19.3125 19.988281 18.945312 20.007812 15.515625 C 20.015625 13.4375 20.007812 11.628906 19.992188 11.5 C 19.929688 11.011719 19.566406 10.648438 19.078125 10.601562 C 18.683594 10.566406 18.355469 10.738281 18.132812 11.101562 L 18.023438 11.273438 L 18 15.1875 C 17.976562 19.09375 17.976562 19.101562 17.875 19.292969 C 17.738281 19.546875 17.503906 19.773438 17.25 19.894531 L 17.039062 19.992188 L 4.945312 19.992188 L 4.726562 19.882812 C 4.472656 19.757812 4.199219 19.476562 4.085938 19.222656 C 4.011719 19.070312 4.007812 18.53125 4.007812 13.007812 L 4.007812 6.960938 L 4.105469 6.75 C 4.226562 6.496094 4.453125 6.261719 4.707031 6.125 C 4.898438 6.023438 4.921875 6.023438 8.347656 6 L 11.792969 5.976562 L 11.992188 5.84375 C 12.273438 5.664062 12.425781 5.40625 12.453125 5.078125 C 12.488281 4.703125 12.308594 4.355469 11.976562 4.148438 L 11.75 4.007812 L 8.394531 4.003906 C 6.546875 4 4.921875 4.011719 4.777344 4.035156 Z M 4.777344 4.035156 "/>
																</g>
															</svg></span><span class="cart-text">Select options</span><span class="base-svg-iconset svg-baseline">
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

                                                <li class="shimmer entry content-bg loop-entry product type-product post-1056 status-publish instock product_cat-our-store product_cat-jewellery has-post-thumbnail sale shipping-taxable purchasable product-type-simple  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                                                    <div class="product-thumbnail">
                                                        <a href="/product/diamond-stud-eulla-earring-rose-gold/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="Diamond Stud Eulla Earring Rose Gold">
                                                            <div class="product-onsale">
                                                                <span aria-hidden="true" class="onsale flash-sale">-4%</span>
                                                                <span class="screen-reader-text">Product on sale</span>
                                                            </div> <img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/22-1-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" srcset="/wp-content/uploads/2024/01/22-1-300x300.jpg 300w, /wp-content/uploads/2024/01/22-1-150x150.jpg 150w, /wp-content/uploads/2024/01/22-1-768x768.jpg 768w, /wp-content/uploads/2024/01/22-1-600x600.jpg 600w, /wp-content/uploads/2024/01/22-1-100x100.jpg 100w, /wp-content/uploads/2024/01/22-1-96x96.jpg 96w, /wp-content/uploads/2024/01/22-1-460x460.jpg 460w, /wp-content/uploads/2024/01/22-1-236x236.jpg 236w, /wp-content/uploads/2024/01/22-1-118x118.jpg 118w, /wp-content/uploads/2024/01/22-1-296x296.jpg 296w, /wp-content/uploads/2024/01/22-1-148x148.jpg 148w, /wp-content/uploads/2024/01/22-1.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-55-300x300.jpg" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" srcset="/wp-content/uploads/2024/01/02-55-300x300.jpg 300w, /wp-content/uploads/2024/01/02-55-150x150.jpg 150w, /wp-content/uploads/2024/01/02-55-768x768.jpg 768w, /wp-content/uploads/2024/01/02-55-600x600.jpg 600w, /wp-content/uploads/2024/01/02-55-100x100.jpg 100w, /wp-content/uploads/2024/01/02-55-96x96.jpg 96w, /wp-content/uploads/2024/01/02-55-460x460.jpg 460w, /wp-content/uploads/2024/01/02-55-236x236.jpg 236w, /wp-content/uploads/2024/01/02-55-118x118.jpg 118w, /wp-content/uploads/2024/01/02-55-296x296.jpg 296w, /wp-content/uploads/2024/01/02-55-148x148.jpg 148w, /wp-content/uploads/2024/01/02-55.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                                        <div class="product-actions">
                                                            <button class="woosw-btn woosw-btn-1056 woosw-btn-has-icon woosw-btn-icon-text" data-id="1056" data-product_name="Diamond Stud Eulla Earring Rose Gold" data-product_image="/wp-content/uploads/2024/01/22-1-150x150.jpg" aria-label="Add to wishlist">
                                                                <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                                            </button>
                                                            <button class="woosc-btn woosc-btn-1056  woosc-btn-has-icon woosc-btn-icon-text" data-id="1056" data-product_name="Diamond Stud Eulla Earring Rose Gold" data-product_image="/wp-content/uploads/2024/01/22-1-150x150.jpg">
                                                                <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                                            </button>
                                                            <button class="woosq-btn woosq-btn-1056 woosq-btn-has-icon woosq-btn-icon-text" data-id="1056" data-effect="mfp-3d-unfold" data-context="default">
                                                                <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="product-details content-bg entry-content-wrap">
                                                        <h2 class="woocommerce-loop-product__title"><a href="/product/diamond-stud-eulla-earring-rose-gold/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">Diamond Stud Eulla Earring Rose Gold</a></h2>
                                                        <div class="star-rating-block">
                                                            <div class="star-rating">
                                                                <span style="width:0%"><strong class="rating">0</strong> out of 5</span>
                                                            </div>
                                                        </div>
                                                        <span class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>260
																</bdi></span></del> <span class="screen-reader-text">Original price was: &#036;260.</span><ins aria-hidden="true"><span class="woocommerce-Price-amount amount">
																<bdi>
																	<span class="woocommerce-Price-currencySymbol">&#36;</span>250
																</bdi></span></ins><span class="screen-reader-text">Current price is: &#036;250.</span></span>
                                                        <div class="product-action-wrap style-button">
                                                            <a href="?add-to-cart=1056" data-quantity="1" class="button product_type_simple add_to_cart_button ajax_add_to_cart default" data-product_id="1056" data-product_sku="FEC-BDS-123" aria-label="Add to cart: &ldquo;Diamond Stud Eulla Earring Rose Gold&rdquo;" aria-describedby="" rel="nofollow"><span class="add-to-cart-icon">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="22px" height="22px" viewBox="0 0 22 22" fill="currentColor" version="1.1">
																<path d="M19.45 15.24a.86.86 0 00.848-.719l1.69-10.14a.86.86 0 00-.848-1H4.91L4.229.65A.86.86 0 003.395 0H.858a.86.86 0 100 1.719h1.865l.673 2.696L5.07 14.45v2.6a2.553 2.553 0 00-1.69 2.4A2.552 2.552 0 005.93 22c1.744 0 2.981-1.726 2.41-3.38h7.01c-.572 1.655.667 3.38 2.41 3.38a2.552 2.552 0 002.55-2.55 2.552 2.552 0 00-2.55-2.55H6.79v-1.66zm.676-10.141l-1.404 8.422H6.658L5.254 5.099zM6.76 19.45a.832.832 0 01-1.661 0 .832.832 0 011.661 0m11 .831a.832.832 0 010-1.661.832.832 0 010 1.661"></path>
															</svg></span><span class="cart-text">Add to cart</span><span class="base-svg-iconset svg-baseline">
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

                                                <li class="shimmer entry content-bg loop-entry product type-product post-226 status-publish last instock product_cat-our-store product_cat-electronics has-post-thumbnail featured shipping-taxable purchasable product-type-variable has-default-attributes  cart-button-1 action-style-default product-hover-style1 image-hover-icon hover-right">
                                                    <div class="product-thumbnail">
                                                        <a href="/product/google-pixel-buds-pro-noise-canceling-earbuds/" class="woocommerce-loop-image-link woocommerce-LoopProduct-link woocommerce-loop-product__link product-has-hover-image"  aria-label="Google Pixel Buds Pro - Noise Canceling Earbuds"><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/03-16-300x300.jpg" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" srcset="/wp-content/uploads/2024/01/03-16-300x300.jpg 300w, /wp-content/uploads/2024/01/03-16-150x150.jpg 150w, /wp-content/uploads/2024/01/03-16-768x768.jpg 768w, /wp-content/uploads/2024/01/03-16-205x205.jpg 205w, /wp-content/uploads/2024/01/03-16-600x600.jpg 600w, /wp-content/uploads/2024/01/03-16-100x100.jpg 100w, /wp-content/uploads/2024/01/03-16-96x96.jpg 96w, /wp-content/uploads/2024/01/03-16-460x460.jpg 460w, /wp-content/uploads/2024/01/03-16-236x236.jpg 236w, /wp-content/uploads/2024/01/03-16-118x118.jpg 118w, /wp-content/uploads/2024/01/03-16-296x296.jpg 296w, /wp-content/uploads/2024/01/03-16-148x148.jpg 148w, /wp-content/uploads/2024/01/03-16.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /><img loading="lazy" decoding="async" width="300" height="300" src="/wp-content/uploads/2024/01/02-24-300x300.jpg" class="secondary-product-image attachment-woocommerce_thumbnail attachment-shop-catalog wp-post-image wp-post-image--secondary" alt="" title="02" srcset="/wp-content/uploads/2024/01/02-24-300x300.jpg 300w, /wp-content/uploads/2024/01/02-24-150x150.jpg 150w, /wp-content/uploads/2024/01/02-24-768x768.jpg 768w, /wp-content/uploads/2024/01/02-24-205x205.jpg 205w, /wp-content/uploads/2024/01/02-24-600x600.jpg 600w, /wp-content/uploads/2024/01/02-24-100x100.jpg 100w, /wp-content/uploads/2024/01/02-24-96x96.jpg 96w, /wp-content/uploads/2024/01/02-24-460x460.jpg 460w, /wp-content/uploads/2024/01/02-24-236x236.jpg 236w, /wp-content/uploads/2024/01/02-24-118x118.jpg 118w, /wp-content/uploads/2024/01/02-24-296x296.jpg 296w, /wp-content/uploads/2024/01/02-24-148x148.jpg 148w, /wp-content/uploads/2024/01/02-24.jpg 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                                                        <div class="product-actions">
                                                            <button class="woosw-btn woosw-btn-226 woosw-btn-has-icon woosw-btn-icon-text" data-id="226" data-product_name="Google Pixel Buds Pro - Noise Canceling Earbuds" data-product_image="/wp-content/uploads/2024/01/03-16-150x150.jpg" aria-label="Add to wishlist">
                                                                <span class="woosw-btn-icon woosw-icon-5"></span><span class="woosw-btn-text">Add to wishlist</span>
                                                            </button>
                                                            <button class="woosc-btn woosc-btn-226  woosc-btn-has-icon woosc-btn-icon-text" data-id="226" data-product_name="Google Pixel Buds Pro - Noise Canceling Earbuds" data-product_image="/wp-content/uploads/2024/01/03-16-150x150.jpg">
                                                                <span class="woosc-btn-icon woosc-icon-1"></span><span class="woosc-btn-text">Compare</span>
                                                            </button>
                                                            <button class="woosq-btn woosq-btn-226 woosq-btn-has-icon woosq-btn-icon-text" data-id="226" data-effect="mfp-3d-unfold" data-context="default">
                                                                <span class="woosq-btn-icon woosq-icon-1"></span><span class="woosq-btn-text">Quick view</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="product-details content-bg entry-content-wrap">
                                                        <h2 class="woocommerce-loop-product__title"><a href="/product/google-pixel-buds-pro-noise-canceling-earbuds/" class="woocommerce-LoopProduct-link-title woocommerce-loop-product__title_ink">Google Pixel Buds Pro - Noise Canceling Earbuds</a></h2>
                                                        <div class="star-rating-block">
                                                            <div class="star-rating">
                                                                <span style="width:100%"><strong class="rating">5.00</strong> out of 5</span>
                                                            </div>
                                                        </div>
                                                        <span class="price"><span class="woocommerce-Price-amount amount">
															<bdi>
																<span class="woocommerce-Price-currencySymbol">&#36;</span>45
															</bdi></span></span>
                                                        <div class="product-action-wrap style-button">
                                                            <a href="/product/google-pixel-buds-pro-noise-canceling-earbuds/" data-quantity="1" class="button product_type_variable add_to_cart_button default" data-product_id="226" data-product_sku="SDF-EWR-895" aria-label="Select options for &ldquo;Google Pixel Buds Pro - Noise Canceling Earbuds&rdquo;" aria-describedby="This product has multiple variants. The options may be chosen on the product page" rel="nofollow"><span class="add-to-cart-icon">
															<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" fill="currentColor" version="1.1">
																<g id="surface1">
																	<path d="M 14.527344 2.125 C 14.414062 2.183594 14.257812 2.324219 14.179688 2.433594 C 14.054688 2.617188 14.039062 2.667969 14.039062 2.996094 C 14.039062 3.3125 14.054688 3.378906 14.164062 3.542969 C 14.234375 3.640625 14.371094 3.777344 14.46875 3.84375 L 14.644531 3.960938 L 16.613281 3.976562 L 18.582031 3.988281 L 14.382812 8.195312 C 9.941406 12.632812 9.984375 12.585938 9.984375 13.007812 C 9.984375 13.203125 10.121094 13.550781 10.257812 13.707031 C 10.378906 13.847656 10.785156 14.015625 10.992188 14.015625 C 11.417969 14.011719 11.371094 14.054688 15.804688 9.617188 L 20.011719 5.417969 L 20.023438 7.386719 L 20.039062 9.355469 L 20.15625 9.53125 C 20.222656 9.628906 20.359375 9.765625 20.457031 9.835938 C 20.621094 9.945312 20.6875 9.960938 21 9.960938 C 21.3125 9.960938 21.378906 9.945312 21.542969 9.835938 C 21.640625 9.765625 21.777344 9.628906 21.84375 9.53125 L 21.960938 9.355469 L 21.960938 2.640625 L 21.835938 2.457031 C 21.765625 2.359375 21.628906 2.222656 21.53125 2.15625 L 21.355469 2.039062 L 18.046875 2.023438 L 14.738281 2.015625 Z M 14.527344 2.125 "/>
																	<path d="M 4.777344 4.035156 C 3.488281 4.226562 2.433594 5.183594 2.105469 6.460938 C 2.019531 6.796875 2.015625 7.035156 2.015625 13.003906 C 2.015625 19.914062 1.996094 19.460938 2.351562 20.203125 C 2.507812 20.53125 2.621094 20.675781 2.972656 21.027344 C 3.324219 21.378906 3.46875 21.492188 3.796875 21.648438 C 4.539062 22.003906 4.085938 21.984375 10.996094 21.984375 C 16.960938 21.984375 17.203125 21.980469 17.539062 21.894531 C 18.6875 21.601562 19.550781 20.75 19.902344 19.566406 C 19.976562 19.3125 19.988281 18.945312 20.007812 15.515625 C 20.015625 13.4375 20.007812 11.628906 19.992188 11.5 C 19.929688 11.011719 19.566406 10.648438 19.078125 10.601562 C 18.683594 10.566406 18.355469 10.738281 18.132812 11.101562 L 18.023438 11.273438 L 18 15.1875 C 17.976562 19.09375 17.976562 19.101562 17.875 19.292969 C 17.738281 19.546875 17.503906 19.773438 17.25 19.894531 L 17.039062 19.992188 L 4.945312 19.992188 L 4.726562 19.882812 C 4.472656 19.757812 4.199219 19.476562 4.085938 19.222656 C 4.011719 19.070312 4.007812 18.53125 4.007812 13.007812 L 4.007812 6.960938 L 4.105469 6.75 C 4.226562 6.496094 4.453125 6.261719 4.707031 6.125 C 4.898438 6.023438 4.921875 6.023438 8.347656 6 L 11.792969 5.976562 L 11.992188 5.84375 C 12.273438 5.664062 12.425781 5.40625 12.453125 5.078125 C 12.488281 4.703125 12.308594 4.355469 11.976562 4.148438 L 11.75 4.007812 L 8.394531 4.003906 C 6.546875 4 4.921875 4.011719 4.777344 4.035156 Z M 4.777344 4.035156 "/>
																</g>
															</svg></span><span class="cart-text">Select options</span><span class="base-svg-iconset svg-baseline">
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

                                            </ul>

                                        </div>
                                        *~

                                    </div>
                                </div><!-- .entry-content -->
                            </div>
                        </article><!-- #post-50 -->

                    </div>
                </main><!-- #main -->
            </div>
        </div><!-- #primary -->
    </div><!-- #inner-wrap -->

    ~~include file='market/tpl/footer.tpl'~


</div><!-- #wrapper -->

~~include file='market/tpl/bottom_script_template.tpl'~
~~include file='market/tpl/bottom_script.tpl'~

</body>
</html>
