<!doctype html>
<html lang="en-US" class="no-js" itemtype="https://schema.org/WebPage" itemscope>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>~~$smarty.const.S_TITLE~</title>


    ~~include file='elilife/tpl/head.tpl'~


</head>

<body class="page-template-default page page-id-51 logged-in wp-embed-responsive theme-avanam woocommerce-checkout woocommerce-page woocommerce-order-received woocommerce-js color-switch-light has-dark-logo woocommerce-active product-style-1 products-no-gutter footer-on-bottom link-style-no-underline content-title-style-above content-width-normal content-style-unboxed content-vertical-padding-show non-transparent-header mobile-non-transparent-header base-elementor-colors elementor-default elementor-kit-54 e--ua-blink e--ua-chrome e--ua-webkit">

~~*debug*~

<div id="wrapper" class="site wp-site-blocks">
    <a class="skip-link screen-reader-text scroll-ignore" href="#main">Skip to content</a>

    ~~include file='elilife/tpl/header.tpl'~

    <div id="inner-wrap" class="wrap hfeed bt-clear">
        <section role="banner" class="entry-hero page-hero-section entry-hero-layout-standard">
            <div class="entry-hero-container-inner">
                <div class="hero-section-overlay"></div>
                <div class="hero-container site-container">
                    <header class="entry-header page-title title-align-inherit title-tablet-align-inherit title-mobile-align-inherit">
                        <nav id="base-breadcrumbs" aria-label="Breadcrumbs"  class="base-breadcrumbs">
                            <div class="base-breadcrumb-container">
                                <span><a href="/" itemprop="url" class="base-bc-home" ><span>Главная</span></a></span><span class="bc-delimiter">/</span><span class="base-bread-current">Оформление</span>
                            </div>
                        </nav><h1 class="entry-title">Оформление заказа</h1>
                    </header><!-- .entry-header -->
                </div>
            </div>
        </section><!-- .entry-hero -->
        <div id="primary" class="content-area">
            <div class="content-container site-container">
                <main id="main" class="site-main" role="main">
                    <div class="content-wrap">
                        <article id="post-51" class="entry content-bg single-entry post-footer-area-boxed post-51 page type-page status-publish hentry">
                            <div class="entry-content-wrap">

                                <div class="entry-content single-content">
                                    <div class="woocommerce">
                                        <div class="woocommerce-notices-wrapper"></div>

                                        <div style="/*display:none;*/" class="tinkoff cart">


                                            <form class="payform-tbank" name="payform-tbank" id="payform-tbank">

                                                <input class="payform-tbank-row" type="hidden" name="terminalkey" value="1733753750611">
                                                <input class="payform-tbank-row" type="hidden" name="frame" value="false">
                                                <input class="payform-tbank-row" type="hidden" name="language" value="ru">
                                                <input class="payform-tbank-row" type="hidden" name="receipt" value="">

                                                <input class="payform-tbank-row" type="hidden" placeholder="Сумма заказа" name="amount" required  data-bind="textInput: total_cart_sum()">
                                                <input class="payform-tbank-row" type="hidden" placeholder="Номер заказа" name="order"  value="~~$order.data.order_code~">
                                                <input
                                                        class="payform-tbank-row"
                                                        type="hidden"
                                                        placeholder="Описание заказа"
                                                        name="description"
                                                        value="~~foreach from=$cart.items item=ci~~~$ci.title~. ~~/foreach~"
                                                >
                                                <input class="payform-tbank-row" type="hidden" placeholder="ФИО плательщика" name="name" value="~~$order.name~">
                                                <input class="payform-tbank-row" type="hidden" placeholder="E-mail" name="email" value="~~$order.email~">
                                                <input class="payform-tbank-row" type="hidden" placeholder="Контактный телефон" name="phone" value="~~$order.phone~">


                                                <input class="payform-tbank-row payform-tbank-btn" type="hidden" value="Оплатить">
                                            </form>
                                        </div>


                                        ~~*
                                        <div class="woocommerce-form-login-toggle">

                                            <div class="woocommerce-info">
                                                Returning customer? <a href="#" class="showlogin">Click here to login</a>
                                            </div>
                                        </div>


                                        <form class="woocommerce-form woocommerce-form-login login" method="post" style="display:none;">

                                            <p>
                                                If you have shopped with us before, please enter your details below. If you are a new customer, please proceed to the Billing section.
                                            </p>

                                            <p class="form-row form-row-first">
                                                <label for="username">Username or email&nbsp;<span class="required">*</span></label>
                                                <input type="text" class="input-text" name="username" id="username" autocomplete="username" />
                                            </p>
                                            <p class="form-row form-row-last">
                                                <label for="password">Password&nbsp;<span class="required">*</span></label>
                                                <input class="input-text woocommerce-Input" type="password" name="password" id="password" autocomplete="current-password" />
                                            </p>
                                            <div class="clear"></div>

                                            <p class="form-row">
                                                <label class="woocommerce-form__label woocommerce-form__label-for-checkbox woocommerce-form-login__rememberme">
                                                    <input class="woocommerce-form__input woocommerce-form__input-checkbox" name="rememberme" type="checkbox" id="rememberme" value="forever" />
                                                    <span>Remember me</span> </label>
                                                <input type="hidden" id="woocommerce-login-nonce" name="woocommerce-login-nonce" value="36ff57040f" />
                                                <input type="hidden" name="_wp_http_referer" value="/wordpress/WCM05/WCM050122/checkout/" />
                                                <input type="hidden" name="redirect" value="/checkout/" />
                                                <button type="submit" class="woocommerce-button button woocommerce-form-login__submit" name="login" value="Login">
                                                    Login
                                                </button>
                                            </p>
                                            <p class="lost_password">
                                                <a href="/my-account/lost-password/">Lost your password?</a>
                                            </p>

                                            <div class="clear"></div>

                                        </form>
                                        <div class="woocommerce-notices-wrapper"></div>


                                        <div id="base-coupon-modal" class="base-coupone-pro-modal bt-m-animate-in-fadeup bt-m-animate-out-fadeout" aria-hidden="true">
                                            <div id="bt-coupon-modal-overlay" class="bt-coupon-modal-overlay" tabindex="-1">
                                                <div class="bt-modal-container bt-modal-height-auto bt-close-position-inside" role="dialog" aria-modal="true">
                                                    <button class="bt-coupon-modal-close" aria-label="Close Modal" data-modal-close="true">
                                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" xmlns="http://www.w3.org/2000/svg" strokewidth="2" strokelinecap="round" strokelinejoin="round">
                                                            <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line>
                                                        </svg>
                                                    </button>
                                                    <div id="base-coupon-modal-content" class="bt-modal-content">
                                                        <form class="bt_checkout_coupon woocommerce-form-coupon" method="post">
                                                            <p>
                                                                If you have a promo code, please apply it below.
                                                            </p>

                                                            <p class="form-row form-row-first">
                                                                <input type="text" name="coupon_code" class="input-text" placeholder="Promo code" id="coupon_code" value="" />
                                                            </p>

                                                            <p class="form-row form-row-last">
                                                                <button type="submit" class="button" name="apply_coupon" value="Apply Code">
                                                                    Apply Code
                                                                </button>
                                                            </p>

                                                            <div class="clear"></div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        *~



                                        <form id="order_form" method="post" class="checkout woocommerce-checkout" action="/checkout/" enctype="multipart/form-data">


                                            <div class="col2-set" id="customer_details">
                                                <div class="col-1">
                                                    <div class="woocommerce-billing-fields">

                                                        <h3>Данные для оформления заказа</h3>

                                                        <div class="woocommerce-billing-fields__field-wrapper">
                                                            <p class="form-row form-row-first validate-required" id="billing_first_name_field" data-priority="">
                                                                <label for="billing_first_name" class="">Ваше имя&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="text" class="input-text " name="billing_first_name" id="billing_first_name" placeholder=""  value="" autocomplete="given-name" />
																		</span>
                                                            </p>
                                                            <p class="form-row form-row-last" id="billing_last_name_field" data-priority="1">
                                                                <label for="billing_last_name" class="">Фамилия&nbsp;<span class="optional">(опционально)</span></label><span class="woocommerce-input-wrapper">
																			<input type="text" class="input-text " name="billing_last_name" id="billing_last_name" placeholder=""  value="" autocomplete="family-name" />
																		</span>
                                                            </p>
                                                            <p class="form-row form-row-wide validate-required validate-phone" id="billing_phone_field" data-priority="2">
                                                                <label for="billing_phone" class="">Номер телефона&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="tel" class="input-text " name="billing_phone" id="billing_phone" placeholder=""  value="" autocomplete="tel" />
																		</span>
                                                            </p>

                                                            ~~*
                                                            <p class="form-row form-row-wide address-field update_totals_on_change validate-required" id="billing_country_field" data-priority="4">
                                                                <label for="billing_country" class="">Country / Region&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<select name="billing_country" id="billing_country" class="country_to_state country_select " autocomplete="country" data-placeholder="Select a country / region&hellip;" data-label="Country / Region">
																				<option value="">Select a country / region&hellip;</option><option value="AF" >Afghanistan</option><option value="AX" >Åland Islands</option><option value="AL" >Albania</option><option value="DZ" >Algeria</option><option value="AS" >American Samoa</option><option value="AD" >Andorra</option><option value="AO" >Angola</option><option value="AI" >Anguilla</option><option value="AQ" >Antarctica</option><option value="AG" >Antigua and Barbuda</option><option value="AR" >Argentina</option><option value="AM" >Armenia</option><option value="AW" >Aruba</option><option value="AU" >Australia</option><option value="AT" >Austria</option><option value="AZ" >Azerbaijan</option><option value="BS" >Bahamas</option><option value="BH" >Bahrain</option><option value="BD" >Bangladesh</option><option value="BB" >Barbados</option><option value="BY" >Belarus</option><option value="PW" >Belau</option><option value="BE" >Belgium</option><option value="BZ" >Belize</option><option value="BJ" >Benin</option><option value="BM" >Bermuda</option><option value="BT" >Bhutan</option><option value="BO" >Bolivia</option><option value="BQ" >Bonaire, Saint Eustatius and Saba</option><option value="BA" >Bosnia and Herzegovina</option><option value="BW" >Botswana</option><option value="BV" >Bouvet Island</option><option value="BR" >Brazil</option><option value="IO" >British Indian Ocean Territory</option><option value="BN" >Brunei</option><option value="BG" >Bulgaria</option><option value="BF" >Burkina Faso</option><option value="BI" >Burundi</option><option value="KH" >Cambodia</option><option value="CM" >Cameroon</option><option value="CA" >Canada</option><option value="CV" >Cape Verde</option><option value="KY" >Cayman Islands</option><option value="CF" >Central African Republic</option><option value="TD" >Chad</option><option value="CL" >Chile</option><option value="CN" >China</option><option value="CX" >Christmas Island</option><option value="CC" >Cocos (Keeling) Islands</option><option value="CO" >Colombia</option><option value="KM" >Comoros</option><option value="CG" >Congo (Brazzaville)</option><option value="CD" >Congo (Kinshasa)</option><option value="CK" >Cook Islands</option><option value="CR" >Costa Rica</option><option value="HR" >Croatia</option><option value="CU" >Cuba</option><option value="CW" >Cura&ccedil;ao</option><option value="CY" >Cyprus</option><option value="CZ" >Czech Republic</option><option value="DK" >Denmark</option><option value="DJ" >Djibouti</option><option value="DM" >Dominica</option><option value="DO" >Dominican Republic</option><option value="EC" >Ecuador</option><option value="EG" >Egypt</option><option value="SV" >El Salvador</option><option value="GQ" >Equatorial Guinea</option><option value="ER" >Eritrea</option><option value="EE" >Estonia</option><option value="SZ" >Eswatini</option><option value="ET" >Ethiopia</option><option value="FK" >Falkland Islands</option><option value="FO" >Faroe Islands</option><option value="FJ" >Fiji</option><option value="FI" >Finland</option><option value="FR" >France</option><option value="GF" >French Guiana</option><option value="PF" >French Polynesia</option><option value="TF" >French Southern Territories</option><option value="GA" >Gabon</option><option value="GM" >Gambia</option><option value="GE" >Georgia</option><option value="DE" >Germany</option><option value="GH" >Ghana</option><option value="GI" >Gibraltar</option><option value="GR" >Greece</option><option value="GL" >Greenland</option><option value="GD" >Grenada</option><option value="GP" >Guadeloupe</option><option value="GU" >Guam</option><option value="GT" >Guatemala</option><option value="GG" >Guernsey</option><option value="GN" >Guinea</option><option value="GW" >Guinea-Bissau</option><option value="GY" >Guyana</option><option value="HT" >Haiti</option><option value="HM" >Heard Island and McDonald Islands</option><option value="HN" >Honduras</option><option value="HK" >Hong Kong</option><option value="HU" >Hungary</option><option value="IS" >Iceland</option><option value="IN"  selected='selected'>India</option><option value="ID" >Indonesia</option><option value="IR" >Iran</option><option value="IQ" >Iraq</option><option value="IE" >Ireland</option><option value="IM" >Isle of Man</option><option value="IL" >Israel</option><option value="IT" >Italy</option><option value="CI" >Ivory Coast</option><option value="JM" >Jamaica</option><option value="JP" >Japan</option><option value="JE" >Jersey</option><option value="JO" >Jordan</option><option value="KZ" >Kazakhstan</option><option value="KE" >Kenya</option><option value="KI" >Kiribati</option><option value="KW" >Kuwait</option><option value="KG" >Kyrgyzstan</option><option value="LA" >Laos</option><option value="LV" >Latvia</option><option value="LB" >Lebanon</option><option value="LS" >Lesotho</option><option value="LR" >Liberia</option><option value="LY" >Libya</option><option value="LI" >Liechtenstein</option><option value="LT" >Lithuania</option><option value="LU" >Luxembourg</option><option value="MO" >Macao</option><option value="MG" >Madagascar</option><option value="MW" >Malawi</option><option value="MY" >Malaysia</option><option value="MV" >Maldives</option><option value="ML" >Mali</option><option value="MT" >Malta</option><option value="MH" >Marshall Islands</option><option value="MQ" >Martinique</option><option value="MR" >Mauritania</option><option value="MU" >Mauritius</option><option value="YT" >Mayotte</option><option value="MX" >Mexico</option><option value="FM" >Micronesia</option><option value="MD" >Moldova</option><option value="MC" >Monaco</option><option value="MN" >Mongolia</option><option value="ME" >Montenegro</option><option value="MS" >Montserrat</option><option value="MA" >Morocco</option><option value="MZ" >Mozambique</option><option value="MM" >Myanmar</option><option value="NA" >Namibia</option><option value="NR" >Nauru</option><option value="NP" >Nepal</option><option value="NL" >Netherlands</option><option value="NC" >New Caledonia</option><option value="NZ" >New Zealand</option><option value="NI" >Nicaragua</option><option value="NE" >Niger</option><option value="NG" >Nigeria</option><option value="NU" >Niue</option><option value="NF" >Norfolk Island</option><option value="KP" >North Korea</option><option value="MK" >North Macedonia</option><option value="MP" >Northern Mariana Islands</option><option value="NO" >Norway</option><option value="OM" >Oman</option><option value="PK" >Pakistan</option><option value="PS" >Palestinian Territory</option><option value="PA" >Panama</option><option value="PG" >Papua New Guinea</option><option value="PY" >Paraguay</option><option value="PE" >Peru</option><option value="PH" >Philippines</option><option value="PN" >Pitcairn</option><option value="PL" >Poland</option><option value="PT" >Portugal</option><option value="PR" >Puerto Rico</option><option value="QA" >Qatar</option><option value="RE" >Reunion</option><option value="RO" >Romania</option><option value="RU" >Russia</option><option value="RW" >Rwanda</option><option value="ST" >S&atilde;o Tom&eacute; and Pr&iacute;ncipe</option><option value="BL" >Saint Barth&eacute;lemy</option><option value="SH" >Saint Helena</option><option value="KN" >Saint Kitts and Nevis</option><option value="LC" >Saint Lucia</option><option value="SX" >Saint Martin (Dutch part)</option><option value="MF" >Saint Martin (French part)</option><option value="PM" >Saint Pierre and Miquelon</option><option value="VC" >Saint Vincent and the Grenadines</option><option value="WS" >Samoa</option><option value="SM" >San Marino</option><option value="SA" >Saudi Arabia</option><option value="SN" >Senegal</option><option value="RS" >Serbia</option><option value="SC" >Seychelles</option><option value="SL" >Sierra Leone</option><option value="SG" >Singapore</option><option value="SK" >Slovakia</option><option value="SI" >Slovenia</option><option value="SB" >Solomon Islands</option><option value="SO" >Somalia</option><option value="ZA" >South Africa</option><option value="GS" >South Georgia/Sandwich Islands</option><option value="KR" >South Korea</option><option value="SS" >South Sudan</option><option value="ES" >Spain</option><option value="LK" >Sri Lanka</option><option value="SD" >Sudan</option><option value="SR" >Suriname</option><option value="SJ" >Svalbard and Jan Mayen</option><option value="SE" >Sweden</option><option value="CH" >Switzerland</option><option value="SY" >Syria</option><option value="TW" >Taiwan</option><option value="TJ" >Tajikistan</option><option value="TZ" >Tanzania</option><option value="TH" >Thailand</option><option value="TL" >Timor-Leste</option><option value="TG" >Togo</option><option value="TK" >Tokelau</option><option value="TO" >Tonga</option><option value="TT" >Trinidad and Tobago</option><option value="TN" >Tunisia</option><option value="TR" >Turkey</option><option value="TM" >Turkmenistan</option><option value="TC" >Turks and Caicos Islands</option><option value="TV" >Tuvalu</option><option value="UG" >Uganda</option><option value="UA" >Ukraine</option><option value="AE" >United Arab Emirates</option><option value="GB" >United Kingdom (UK)</option><option value="US" >United States (US)</option><option value="UM" >United States (US) Minor Outlying Islands</option><option value="UY" >Uruguay</option><option value="UZ" >Uzbekistan</option><option value="VU" >Vanuatu</option><option value="VA" >Vatican</option><option value="VE" >Venezuela</option><option value="VN" >Vietnam</option><option value="VG" >Virgin Islands (British)</option><option value="VI" >Virgin Islands (US)</option><option value="WF" >Wallis and Futuna</option><option value="EH" >Western Sahara</option><option value="YE" >Yemen</option><option value="ZM" >Zambia</option><option value="ZW" >Zimbabwe</option>
																			</select>
																			<noscript>
																				<button type="submit" name="woocommerce_checkout_update_totals" value="Update country / region">
																					Update country / region
																				</button>
																			</noscript></span>
                                                            </p>
                                                            <p class="form-row form-row-wide address-field validate-required" id="billing_address_1_field" data-priority="5">
                                                                <label for="billing_address_1" class="">Address&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="text" class="input-text " name="billing_address_1" id="billing_address_1" placeholder="House number, Area and Street"  value="" autocomplete="address-line1" />
																		</span>
                                                            </p>
                                                            <p class="form-row form-row-wide address-field validate-required validate-state" id="billing_state_field" data-priority="8">
                                                                <label for="billing_state" class="">State / County&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<select name="billing_state" id="billing_state" class="state_select " autocomplete="address-level1" data-placeholder="Select an option&hellip;"  data-input-classes="" data-label="State / County">
																				<option value="">Select an option&hellip;</option><option value="AP" >Andhra Pradesh</option><option value="AR" >Arunachal Pradesh</option><option value="AS" >Assam</option><option value="BR" >Bihar</option><option value="CT" >Chhattisgarh</option><option value="GA" >Goa</option><option value="GJ"  selected='selected'>Gujarat</option><option value="HR" >Haryana</option><option value="HP" >Himachal Pradesh</option><option value="JK" >Jammu and Kashmir</option><option value="JH" >Jharkhand</option><option value="KA" >Karnataka</option><option value="KL" >Kerala</option><option value="LA" >Ladakh</option><option value="MP" >Madhya Pradesh</option><option value="MH" >Maharashtra</option><option value="MN" >Manipur</option><option value="ML" >Meghalaya</option><option value="MZ" >Mizoram</option><option value="NL" >Nagaland</option><option value="OR" >Odisha</option><option value="PB" >Punjab</option><option value="RJ" >Rajasthan</option><option value="SK" >Sikkim</option><option value="TN" >Tamil Nadu</option><option value="TS" >Telangana</option><option value="TR" >Tripura</option><option value="UK" >Uttarakhand</option><option value="UP" >Uttar Pradesh</option><option value="WB" >West Bengal</option><option value="AN" >Andaman and Nicobar Islands</option><option value="CH" >Chandigarh</option><option value="DN" >Dadra and Nagar Haveli</option><option value="DD" >Daman and Diu</option><option value="DL" >Delhi</option><option value="LD" >Lakshadeep</option><option value="PY" >Pondicherry (Puducherry)</option>
																			</select></span>
                                                            </p>
                                                            <p class="form-row form-row-wide address-field validate-required validate-postcode" id="billing_postcode_field" data-priority="9">
                                                                <label for="billing_postcode" class="">Postcode / ZIP&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="text" class="input-text " name="billing_postcode" id="billing_postcode" placeholder=""  value="" autocomplete="postal-code" />
																		</span>
                                                            </p>
                                                            *~

                                                            <p class="form-row form-row-wide validate-required validate-email" id="billing_email_field" data-priority="10">
                                                                <label for="billing_email" class="">Email адрес&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="email" class="input-text " name="billing_email" id="billing_email" placeholder=""  value="" autocomplete="email" />
																		</span>
                                                            </p>
                                                        </div>


                                                    </div>


                                                    ~~*



                                                    <div class="woocommerce-account-fields">

                                                        <p class="form-row form-row-wide create-account">
                                                            <label class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
                                                                <input class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox" id="createaccount"  type="checkbox" name="createaccount" value="1" />
                                                                <span>Create an account?</span> </label>
                                                        </p>

                                                        <div class="create-account">
                                                            <p class="form-row validate-required" id="account_username_field" data-priority="">
                                                                <label for="account_username" class="">Account username&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="text" class="input-text " name="account_username" id="account_username" placeholder="Username"  value="" autocomplete="username" />
																		</span>
                                                            </p>
                                                            <p class="form-row validate-required" id="account_password_field" data-priority="">
                                                                <label for="account_password" class="">Create account password&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																			<input type="password" class="input-text " name="account_password" id="account_password" placeholder="Password"  value="" autocomplete="new-password" />
																		</span>
                                                            </p>
                                                            <div class="clear"></div>
                                                        </div>

                                                    </div>
                                                    *~
                                                </div>

                                                ~~*
                                                <div class="col-2">
                                                    <div class="woocommerce-shipping-fields">

                                                        <h3 id="ship-to-different-address"><label class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
                                                                <input id="ship-to-different-address-checkbox" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox"  type="checkbox" name="ship_to_different_address" value="1" />
                                                                <span>Ship to a different address?</span> </label></h3>

                                                        <div class="shipping_address">

                                                            <div class="woocommerce-shipping-fields__field-wrapper">
                                                                <p class="form-row form-row-first validate-required" id="shipping_first_name_field" data-priority="">
                                                                    <label for="shipping_first_name" class="">First name&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																				<input type="text" class="input-text " name="shipping_first_name" id="shipping_first_name" placeholder=""  value="" autocomplete="given-name" />
																			</span>
                                                                </p>
                                                                <p class="form-row form-row-last" id="shipping_last_name_field" data-priority="1">
                                                                    <label for="shipping_last_name" class="">Last name&nbsp;<span class="optional">(optional)</span></label><span class="woocommerce-input-wrapper">
																				<input type="text" class="input-text " name="shipping_last_name" id="shipping_last_name" placeholder=""  value="" autocomplete="family-name" />
																			</span>
                                                                </p>
                                                                <p class="form-row form-row-wide validate-required" id="shipping_address_type_field" data-priority="3">
                                                                    <label for="shipping_address_type_Home" class="">Address Type&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																				<input type="radio" class="input-radio " value="Home" name="shipping_address_type"  id="shipping_address_type_Home" />
																				<label for="shipping_address_type_Home" class="radio ">Home</label>
																				<input type="radio" class="input-radio " value="Office" name="shipping_address_type"  id="shipping_address_type_Office" />
																				<label for="shipping_address_type_Office" class="radio ">Office</label></span>
                                                                </p>
                                                                <p class="form-row form-row-wide address-field update_totals_on_change validate-required" id="shipping_country_field" data-priority="4">
                                                                    <label for="shipping_country" class="">Country / Region&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																				<select name="shipping_country" id="shipping_country" class="country_to_state country_select " autocomplete="country" data-placeholder="Select a country / region&hellip;" data-label="Country / Region">
																					<option value="">Select a country / region&hellip;</option><option value="AF" >Afghanistan</option><option value="AX" >Åland Islands</option><option value="AL" >Albania</option><option value="DZ" >Algeria</option><option value="AS" >American Samoa</option><option value="AD" >Andorra</option><option value="AO" >Angola</option><option value="AI" >Anguilla</option><option value="AQ" >Antarctica</option><option value="AG" >Antigua and Barbuda</option><option value="AR" >Argentina</option><option value="AM" >Armenia</option><option value="AW" >Aruba</option><option value="AU" >Australia</option><option value="AT" >Austria</option><option value="AZ" >Azerbaijan</option><option value="BS" >Bahamas</option><option value="BH" >Bahrain</option><option value="BD" >Bangladesh</option><option value="BB" >Barbados</option><option value="BY" >Belarus</option><option value="PW" >Belau</option><option value="BE" >Belgium</option><option value="BZ" >Belize</option><option value="BJ" >Benin</option><option value="BM" >Bermuda</option><option value="BT" >Bhutan</option><option value="BO" >Bolivia</option><option value="BQ" >Bonaire, Saint Eustatius and Saba</option><option value="BA" >Bosnia and Herzegovina</option><option value="BW" >Botswana</option><option value="BV" >Bouvet Island</option><option value="BR" >Brazil</option><option value="IO" >British Indian Ocean Territory</option><option value="BN" >Brunei</option><option value="BG" >Bulgaria</option><option value="BF" >Burkina Faso</option><option value="BI" >Burundi</option><option value="KH" >Cambodia</option><option value="CM" >Cameroon</option><option value="CA" >Canada</option><option value="CV" >Cape Verde</option><option value="KY" >Cayman Islands</option><option value="CF" >Central African Republic</option><option value="TD" >Chad</option><option value="CL" >Chile</option><option value="CN" >China</option><option value="CX" >Christmas Island</option><option value="CC" >Cocos (Keeling) Islands</option><option value="CO" >Colombia</option><option value="KM" >Comoros</option><option value="CG" >Congo (Brazzaville)</option><option value="CD" >Congo (Kinshasa)</option><option value="CK" >Cook Islands</option><option value="CR" >Costa Rica</option><option value="HR" >Croatia</option><option value="CU" >Cuba</option><option value="CW" >Cura&ccedil;ao</option><option value="CY" >Cyprus</option><option value="CZ" >Czech Republic</option><option value="DK" >Denmark</option><option value="DJ" >Djibouti</option><option value="DM" >Dominica</option><option value="DO" >Dominican Republic</option><option value="EC" >Ecuador</option><option value="EG" >Egypt</option><option value="SV" >El Salvador</option><option value="GQ" >Equatorial Guinea</option><option value="ER" >Eritrea</option><option value="EE" >Estonia</option><option value="SZ" >Eswatini</option><option value="ET" >Ethiopia</option><option value="FK" >Falkland Islands</option><option value="FO" >Faroe Islands</option><option value="FJ" >Fiji</option><option value="FI" >Finland</option><option value="FR" >France</option><option value="GF" >French Guiana</option><option value="PF" >French Polynesia</option><option value="TF" >French Southern Territories</option><option value="GA" >Gabon</option><option value="GM" >Gambia</option><option value="GE" >Georgia</option><option value="DE" >Germany</option><option value="GH" >Ghana</option><option value="GI" >Gibraltar</option><option value="GR" >Greece</option><option value="GL" >Greenland</option><option value="GD" >Grenada</option><option value="GP" >Guadeloupe</option><option value="GU" >Guam</option><option value="GT" >Guatemala</option><option value="GG" >Guernsey</option><option value="GN" >Guinea</option><option value="GW" >Guinea-Bissau</option><option value="GY" >Guyana</option><option value="HT" >Haiti</option><option value="HM" >Heard Island and McDonald Islands</option><option value="HN" >Honduras</option><option value="HK" >Hong Kong</option><option value="HU" >Hungary</option><option value="IS" >Iceland</option><option value="IN"  selected='selected'>India</option><option value="ID" >Indonesia</option><option value="IR" >Iran</option><option value="IQ" >Iraq</option><option value="IE" >Ireland</option><option value="IM" >Isle of Man</option><option value="IL" >Israel</option><option value="IT" >Italy</option><option value="CI" >Ivory Coast</option><option value="JM" >Jamaica</option><option value="JP" >Japan</option><option value="JE" >Jersey</option><option value="JO" >Jordan</option><option value="KZ" >Kazakhstan</option><option value="KE" >Kenya</option><option value="KI" >Kiribati</option><option value="KW" >Kuwait</option><option value="KG" >Kyrgyzstan</option><option value="LA" >Laos</option><option value="LV" >Latvia</option><option value="LB" >Lebanon</option><option value="LS" >Lesotho</option><option value="LR" >Liberia</option><option value="LY" >Libya</option><option value="LI" >Liechtenstein</option><option value="LT" >Lithuania</option><option value="LU" >Luxembourg</option><option value="MO" >Macao</option><option value="MG" >Madagascar</option><option value="MW" >Malawi</option><option value="MY" >Malaysia</option><option value="MV" >Maldives</option><option value="ML" >Mali</option><option value="MT" >Malta</option><option value="MH" >Marshall Islands</option><option value="MQ" >Martinique</option><option value="MR" >Mauritania</option><option value="MU" >Mauritius</option><option value="YT" >Mayotte</option><option value="MX" >Mexico</option><option value="FM" >Micronesia</option><option value="MD" >Moldova</option><option value="MC" >Monaco</option><option value="MN" >Mongolia</option><option value="ME" >Montenegro</option><option value="MS" >Montserrat</option><option value="MA" >Morocco</option><option value="MZ" >Mozambique</option><option value="MM" >Myanmar</option><option value="NA" >Namibia</option><option value="NR" >Nauru</option><option value="NP" >Nepal</option><option value="NL" >Netherlands</option><option value="NC" >New Caledonia</option><option value="NZ" >New Zealand</option><option value="NI" >Nicaragua</option><option value="NE" >Niger</option><option value="NG" >Nigeria</option><option value="NU" >Niue</option><option value="NF" >Norfolk Island</option><option value="KP" >North Korea</option><option value="MK" >North Macedonia</option><option value="MP" >Northern Mariana Islands</option><option value="NO" >Norway</option><option value="OM" >Oman</option><option value="PK" >Pakistan</option><option value="PS" >Palestinian Territory</option><option value="PA" >Panama</option><option value="PG" >Papua New Guinea</option><option value="PY" >Paraguay</option><option value="PE" >Peru</option><option value="PH" >Philippines</option><option value="PN" >Pitcairn</option><option value="PL" >Poland</option><option value="PT" >Portugal</option><option value="PR" >Puerto Rico</option><option value="QA" >Qatar</option><option value="RE" >Reunion</option><option value="RO" >Romania</option><option value="RU" >Russia</option><option value="RW" >Rwanda</option><option value="ST" >S&atilde;o Tom&eacute; and Pr&iacute;ncipe</option><option value="BL" >Saint Barth&eacute;lemy</option><option value="SH" >Saint Helena</option><option value="KN" >Saint Kitts and Nevis</option><option value="LC" >Saint Lucia</option><option value="SX" >Saint Martin (Dutch part)</option><option value="MF" >Saint Martin (French part)</option><option value="PM" >Saint Pierre and Miquelon</option><option value="VC" >Saint Vincent and the Grenadines</option><option value="WS" >Samoa</option><option value="SM" >San Marino</option><option value="SA" >Saudi Arabia</option><option value="SN" >Senegal</option><option value="RS" >Serbia</option><option value="SC" >Seychelles</option><option value="SL" >Sierra Leone</option><option value="SG" >Singapore</option><option value="SK" >Slovakia</option><option value="SI" >Slovenia</option><option value="SB" >Solomon Islands</option><option value="SO" >Somalia</option><option value="ZA" >South Africa</option><option value="GS" >South Georgia/Sandwich Islands</option><option value="KR" >South Korea</option><option value="SS" >South Sudan</option><option value="ES" >Spain</option><option value="LK" >Sri Lanka</option><option value="SD" >Sudan</option><option value="SR" >Suriname</option><option value="SJ" >Svalbard and Jan Mayen</option><option value="SE" >Sweden</option><option value="CH" >Switzerland</option><option value="SY" >Syria</option><option value="TW" >Taiwan</option><option value="TJ" >Tajikistan</option><option value="TZ" >Tanzania</option><option value="TH" >Thailand</option><option value="TL" >Timor-Leste</option><option value="TG" >Togo</option><option value="TK" >Tokelau</option><option value="TO" >Tonga</option><option value="TT" >Trinidad and Tobago</option><option value="TN" >Tunisia</option><option value="TR" >Turkey</option><option value="TM" >Turkmenistan</option><option value="TC" >Turks and Caicos Islands</option><option value="TV" >Tuvalu</option><option value="UG" >Uganda</option><option value="UA" >Ukraine</option><option value="AE" >United Arab Emirates</option><option value="GB" >United Kingdom (UK)</option><option value="US" >United States (US)</option><option value="UM" >United States (US) Minor Outlying Islands</option><option value="UY" >Uruguay</option><option value="UZ" >Uzbekistan</option><option value="VU" >Vanuatu</option><option value="VA" >Vatican</option><option value="VE" >Venezuela</option><option value="VN" >Vietnam</option><option value="VG" >Virgin Islands (British)</option><option value="VI" >Virgin Islands (US)</option><option value="WF" >Wallis and Futuna</option><option value="EH" >Western Sahara</option><option value="YE" >Yemen</option><option value="ZM" >Zambia</option><option value="ZW" >Zimbabwe</option>
																				</select>
																				<noscript>
																					<button type="submit" name="woocommerce_checkout_update_totals" value="Update country / region">
																						Update country / region
																					</button>
																				</noscript></span>
                                                                </p>
                                                                <p class="form-row form-row-wide address-field validate-required" id="shipping_address_1_field" data-priority="5">
                                                                    <label for="shipping_address_1" class="">Delivery Address&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																				<input type="text" class="input-text " name="shipping_address_1" id="shipping_address_1" placeholder="House/Office number, Area and Street"  value="" autocomplete="address-line1" />
																			</span>
                                                                </p>
                                                                <p class="form-row form-row-wide address-field validate-required validate-state" id="shipping_state_field" data-priority="8">
                                                                    <label for="shipping_state" class="">State / County&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																				<select name="shipping_state" id="shipping_state" class="state_select " autocomplete="address-level1" data-placeholder="Select an option&hellip;"  data-input-classes="" data-label="State / County">
																					<option value="">Select an option&hellip;</option><option value="AP" >Andhra Pradesh</option><option value="AR" >Arunachal Pradesh</option><option value="AS" >Assam</option><option value="BR" >Bihar</option><option value="CT" >Chhattisgarh</option><option value="GA" >Goa</option><option value="GJ"  selected='selected'>Gujarat</option><option value="HR" >Haryana</option><option value="HP" >Himachal Pradesh</option><option value="JK" >Jammu and Kashmir</option><option value="JH" >Jharkhand</option><option value="KA" >Karnataka</option><option value="KL" >Kerala</option><option value="LA" >Ladakh</option><option value="MP" >Madhya Pradesh</option><option value="MH" >Maharashtra</option><option value="MN" >Manipur</option><option value="ML" >Meghalaya</option><option value="MZ" >Mizoram</option><option value="NL" >Nagaland</option><option value="OR" >Odisha</option><option value="PB" >Punjab</option><option value="RJ" >Rajasthan</option><option value="SK" >Sikkim</option><option value="TN" >Tamil Nadu</option><option value="TS" >Telangana</option><option value="TR" >Tripura</option><option value="UK" >Uttarakhand</option><option value="UP" >Uttar Pradesh</option><option value="WB" >West Bengal</option><option value="AN" >Andaman and Nicobar Islands</option><option value="CH" >Chandigarh</option><option value="DN" >Dadra and Nagar Haveli</option><option value="DD" >Daman and Diu</option><option value="DL" >Delhi</option><option value="LD" >Lakshadeep</option><option value="PY" >Pondicherry (Puducherry)</option>
																				</select></span>
                                                                </p>
                                                                <p class="form-row form-row-wide address-field validate-required validate-postcode" id="shipping_postcode_field" data-priority="9">
                                                                    <label for="shipping_postcode" class="">Postcode / ZIP&nbsp;<abbr class="required" title="required">*</abbr></label><span class="woocommerce-input-wrapper">
																				<input type="text" class="input-text " name="shipping_postcode" id="shipping_postcode" placeholder=""  value="" autocomplete="postal-code" />
																			</span>
                                                                </p>
                                                            </div>

                                                        </div>

                                                    </div>
                                                    <div class="woocommerce-additional-fields">

                                                        <div class="woocommerce-additional-fields__field-wrapper">
                                                            <p class="form-row notes" id="order_comments_field" data-priority="">
                                                                <label for="order_comments" class="">Order notes&nbsp;<span class="optional">(optional)</span></label><span class="woocommerce-input-wrapper">																			<textarea name="order_comments" class="input-text " id="order_comments" placeholder="Notes about your order, e.g. special notes for delivery."  rows="2" cols="5"></textarea></span>
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                                *~

                                            </div>

                                            <wc-order-attribution-inputs></wc-order-attribution-inputs>

                                            <h3 id="order_review_heading">Ваш заказ</h3>

                                            <div id="order_review" class="woocommerce-checkout-review-order cart">
                                                <table class="shop_table woocommerce-checkout-review-order-table">
                                                    <thead>
                                                    <tr>
                                                        <th class="product-name">Наименование</th>
                                                        <th class="product-total">Стоимость</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    <!-- ko foreach: cart().items() -->
                                                    <tr class="cart_item">
                                                        <td class="product-name" > <span  data-bind="text: title()"></span>&nbsp; <strong class="product-quantity">&times;&nbsp;<span  data-bind="text: product_amount()"></span></strong></td>
                                                        <td class="product-total"><span class="woocommerce-Price-amount amount">
																		<bdi data-bind="text:numberWithSpaces(Number(cost()*product_amount()))+ ' ₽'">

																		</bdi></span></td>
                                                    </tr>
                                                    <!-- /ko -->

                                                    </tbody>
                                                    <tfoot>

                                                    ~~*
                                                    <tr class="cart-subtotal">
                                                        <th>Subtotal</th>
                                                        <td><span class="woocommerce-Price-amount amount">
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
                                                            </ul></td>
                                                    </tr>
                                                    *~

                                                    <tr class="order-total">
                                                        <th>Итого</th>
                                                        <td><strong><span class="woocommerce-Price-amount amount">
																		<bdi data-bind="text: numberWithSpaces(total_cart_sum()) + ' ₽'">

																		</bdi></span></strong></td>
                                                    </tr>

                                                    </tfoot>
                                                </table>

                                                ~~*
                                                <p class="coupon_inner_checkout">
                                                    Have a promo code? <a class="coupon-modal-link">Click here to enter your code.</a>
                                                </p>
                                                *~
                                                <div id="payment" class="woocommerce-checkout-payment">
                                                    <ul class="wc_payment_methods payment_methods methods">
                                                        <li class="wc_payment_method payment_method_bacs">
                                                            <input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="bacs"  checked='checked' data-order_button_text="" />

                                                            <label for="payment_method_bacs"> Безопасная оплата через сервис Т-банка </label>
                                                            <div class="payment_box payment_method_bacs" >
                                                                <p>
                                                                    По кнопке "оплатить", откроется страница сервиса Т-банка где можно выбрать удобный вид оплаты и оплатить заказ.
                                                                </p>
                                                            </div>
                                                        </li>

                                                        ~~*
                                                        <li class="wc_payment_method payment_method_cheque">
                                                            <input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="cheque"  data-order_button_text="" />

                                                            <label for="payment_method_cheque"> Check payments </label>
                                                            <div class="payment_box payment_method_cheque" style="display:none;">
                                                                <p>
                                                                    Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.
                                                                </p>
                                                            </div>
                                                        </li>
                                                        <li class="wc_payment_method payment_method_cod">
                                                            <input id="payment_method_cod" type="radio" class="input-radio" name="payment_method" value="cod"  data-order_button_text="" />

                                                            <label for="payment_method_cod"> Cash on delivery </label>
                                                            <div class="payment_box payment_method_cod" style="display:none;">
                                                                <p>
                                                                    Pay with cash upon delivery.
                                                                </p>
                                                            </div>
                                                        </li>
                                                        *~

                                                    </ul>

                                                    <div class="form-row place-order">

                                                        ~~*
                                                        <noscript>
                                                            Since your browser does not support JavaScript, or it is disabled, please ensure you click the <em>Update Totals</em> button before placing your order. You may be charged more than the amount stated above if you fail to do so.
                                                            <br/>
                                                            <button type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="Update totals">
                                                                Update totals
                                                            </button>
                                                        </noscript>

                                                        <div class="woocommerce-terms-and-conditions-wrapper">
                                                            <div class="woocommerce-privacy-policy-text">
                                                                <p>
                                                                    Ваши персональные данные будут использованы только для процесса осуществления вашего заказа. Описание находится в документе по этой <a href="/privacy-policy/" class="woocommerce-privacy-policy-link" target="_blank">ссылке</a>.
                                                                </p>
                                                            </div>
                                                            <div class="woocommerce-terms-and-conditions" style="display: none; max-height: 200px; overflow: auto;">
                                                                <h2 class="wp-block-heading">Who we are</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>Our website address is: http://example.com
                                                                </p>
                                                                <h2 class="wp-block-heading">Comments</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.
                                                                </p>
                                                                <p>
                                                                    An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.
                                                                </p>
                                                                <h2 class="wp-block-heading">Media</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.
                                                                </p>
                                                                <h2 class="wp-block-heading">Cookies</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.
                                                                </p>
                                                                <p>
                                                                    If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.
                                                                </p>
                                                                <p>
                                                                    When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.
                                                                </p>
                                                                <p>
                                                                    If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.
                                                                </p>
                                                                <h2 class="wp-block-heading">Embedded content from other websites</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.
                                                                </p>
                                                                <p>
                                                                    These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.
                                                                </p>
                                                                <h2 class="wp-block-heading">Who we share your data with</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.
                                                                </p>
                                                                <h2 class="wp-block-heading">How long we retain your data</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.
                                                                </p>
                                                                <p>
                                                                    For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.
                                                                </p>
                                                                <h2 class="wp-block-heading">What rights you have over your data</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.
                                                                </p>
                                                                <h2 class="wp-block-heading">Where your data is sent</h2>
                                                                <p>
                                                                    <strong class="privacy-policy-tutorial">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.
                                                                </p>
                                                            </div>
                                                            <p class="form-row validate-required">
                                                                <label class="woocommerce-form__label woocommerce-form__label-for-checkbox checkbox">
                                                                    <input type="checkbox" class="woocommerce-form__input woocommerce-form__input-checkbox input-checkbox" name="terms"  id="terms" />
                                                                    <span class="woocommerce-terms-and-conditions-checkbox-text">I have read and agree to the website <a href="/privacy-policy/" class="woocommerce-terms-and-conditions-link" target="_blank">terms and conditions</a></span>&nbsp;<abbr class="required" title="required">*</abbr> </label>
                                                                <input type="hidden" name="terms-field" value="1" />
                                                            </p>
                                                        </div>
                                                        *~

                                                        <button type="button"  class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="Place order" data-value="Place order">
                                                            Оплатить
                                                        </button>

                                                        <input type="hidden" id="woocommerce-process-checkout-nonce" name="woocommerce-process-checkout-nonce" value="475170846c" />
                                                        <input type="hidden" name="_wp_http_referer" value="/checkout/" />
                                                    </div>
                                                </div>
                                            </div>

                                        </form>

                                    </div>
                                </div><!-- .entry-content -->
                            </div>
                        </article><!-- #post-51 -->

                    </div>
                </main><!-- #main -->
            </div>
        </div><!-- #primary -->
    </div><!-- #inner-wrap -->

    ~~include file='elilife/tpl/footer.tpl'~<!-- #colophon -->

</div><!-- #wrapper -->

~~include file='elilife/tpl/bottom_script_template.tpl'~
~~include file='elilife/tpl/bottom_script.tpl'~

<script src="https://securepay.tinkoff.ru/html/payForm/js/tinkoff_v2.js"></script>
<script type="text/javascript">

    const TPF = document.getElementById("payform-tbank");

    TPF.addEventListener("submit", function (e) {
        e.preventDefault();
        const {description, amount, email, phone, receipt} = TPF;

        if (receipt) {
            if (!email.value && !phone.value)
                return alert("Поле E-mail или Phone не должно быть пустым");

            TPF.receipt.value = JSON.stringify({
                "EmailCompany": "info@elilife.ru",
                "Taxation": "patent",
                "FfdVersion": "1.2",
                "Items": [
                    {
                        "Name": description.value || "Оплата",
                        "Price": Math.round(amount.value * 100),
                        "Quantity": 1.00,
                        "Amount": Math.round(amount.value * 100),
                        "PaymentMethod": "full_prepayment",
                        "PaymentObject": "service",
                        "Tax": "none",
                        "MeasurementUnit": "pc"
                    }
                ]
            });
        }
        pay(TPF);
    })
</script>

<script>


    $("#place_order").on('click', function(e) {
        e.preventDefault();

        const form = document.getElementById('order_form');
        const form_data = new FormData(form);
        var error = 0;


        // var phone_prefix    = form_data.get('phone_prefix');    // +7
        var phone           = form_data.get('billing_phone');           // (964) 535-13-31
        // var receive_sms     = form_data.get('receive_sms');     // on
        var email           = form_data.get('billing_email');           //
        var first_name             = form_data.get('billing_first_name');             //
        var last_name             = form_data.get('billing_last_name');             //
        // var pvz_address     = form_data.get('pvz_address');     // город Москва, станция метро
        // var delivery_type   = form_data.get('delivery_type');   // 4
        // var order_notes     = form_data.get('order_notes');     //
        // var pay_type        = form_data.get('pay_type');        // card

        console.log('first_name' + first_name );

        if(first_name.length==0)
        {
            error = 1;
            Swal.fire("Напишите имя");
        }

        if(phone.length==0)
        {
            error = 1;
            Swal.fire("Отсутствует номер телефона");
            //toastr.error('Отсутствует номер телефона');
        }

        if(email.length>0)
        {
            var email_regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if(!email_regex.test(email)){
                error = 1;
                Swal.fire("Исправьте email");
                //toastr.error('Исправить email');
            }

        }

        console.log(error);

        if (error != 0) {
            e.preventDefault();
            return false;
        }
        else {

            // Получение элементов формы payform-tbank
            const targetForm = document.getElementById('payform-tbank');

            // Заполнение полей:
            //targetForm.amount.value = "~~$order.data.pay_sum~"; // Если нужно передать данные из order_form сюда, замените на соответствующее поле
            //targetForm.order.value = order_code; // Передача номера заказа <button class="citation-flag" data-index="10">
            //targetForm.description.value = description; // Передача описания <button class="citation-flag" data-index="3">
            targetForm.name.value = first_name + ' ' + last_name; // Указание ФИО <button class="citation-flag" data-index="10">
            targetForm.email.value = email;
            targetForm.phone.value = phone;

            const event = new Event('submit', { bubbles: true });
            TPF.dispatchEvent(event);
        }


    });
</script>


</body>
</html>
