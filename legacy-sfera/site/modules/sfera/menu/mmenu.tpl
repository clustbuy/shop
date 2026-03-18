<nav id="menu">
    <div id="panel-menu">


        <ul>

            ~~foreach from=$cat_menu item=cm~
            <li>
                ~~if $cm.childrens|@count > 0~
                <span>~~$cm.title~</span>

                <ul>

                    ~~foreach from=$cm.childrens item=cs~
                    <li>
                        ~~if $cs.childrens|@count > 0~
                        <span>~~$cs.title~</span>

                        <ul>

                            ~~foreach from=$cm.childrens item=cs2~
                            <li><a href="/category/~~$cs2.id~/">~~$cs2.title~</a></li>
                            ~~/foreach~

                        </ul>
                        ~~else~
                        <a href="/category/~~$cs.id~/">~~$cs.title~</a>
                        ~~/if~
                    </li>
                    ~~/foreach~


                </ul>
                ~~else~
                <a href="/category/~~$cm.id~/">~~$cm.title~</a>
                ~~/if~
            </li>
            ~~/foreach~

        </ul>

    </div>

    <ul id="panel-account" data-mm-title="Аккаунт">
        <li><a href="#/">Профиль</a></li>
        <li><a href="#/">Настройки</a></li>
        <li><a href="#/">Активность</a></li>
        <li><a href="#/">Выход</a></li>
    </ul>

    <div id="panel-cart" data-mm-title="Корзина">
        <p style="text-align: center; padding-top: 30px">
        <div class="widget woocommerce widget_shopping_cart cart">
            <div class="widget_shopping_cart_content">

                <ul class="woocommerce-mini-cart cart_list product_list_widget ">
                    <!-- ko foreach: cart().items() -->
                    <li class="woocommerce-mini-cart-item mini_cart_item">
                        <a  data-bind="click: $root.remove_from_cart.bind($data, guid())"  class="remove remove_from_cart_button" aria-label="Remove this item" data-product_id="515" data-cart_item_key="91a4721f2038461dc2529a2fe719254d" data-product_sku="N/A">×</a>
                        <a  data-bind="attr: {href: `/product/${guid()}`}" >
                            <img
                                    width="300"
                                    height="300"
                                    data-bind="attr:{src: `${img_url()}`, srcset: `${img_url()}  300w, ${img_url()}  100w`}"
                                    class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail"
                                    alt="image"
                                    sizes="(max-width: 300px) 100vw, 300px">
                            <span  data-bind="text: title()"></span>
                        </a>
                        <span class="quantity"><span  data-bind="text: product_amount()"></span> × <span class="woocommerce-Price-amount amount" data-bind="text:Math.round(Number(cost()*(product_amount())))+ ' ₽'"></span></span>
                    </li>
                    <!-- /ko -->
                </ul>

                <p class="woocommerce-mini-cart__total total">
                    <strong>Итого:</strong><span class="woocommerce-Price-amount amount" data-bind="text: total_cart_sum() + ' ₽'"></span>
                </p>

                <p class="woocommerce-mini-cart__buttons buttons">
                    <a href="/cart/" class="button wc-forward">Корзина</a>
                    <a href="/checkout/" class="button checkout wc-forward">Оформить</a>
                </p>

            </div>
        </div>
        </p>
    </div>
</nav>