<div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-4a6d79a" data-id="4a6d79a" data-element_type="column">
    <div class="elementor-widget-wrap elementor-element-populated">
        <div class="elementor-element elementor-element-48356d9 product-cat-style-1 elementor-widget elementor-widget-tmcore-product-categories" data-id="48356d9" data-element_type="widget" data-widget_type="tmcore-product-categories.default">
            <div class="elementor-widget-container">

                <div class="product-cat">

                    <div class="cat-image"></div>

                    ~~foreach from=$mobile_drawer_menu item=cm~
                    <div class="cat-title">
                        <a href="/category/~~$cm.id~/" title="Electronics">~~$cm.title~</a>
                    </div>

                    <ul class="sub-categories">
                        ~~foreach from=$cm.childrens item=cs~
                        <li>
                            <a href="/category/~~$cs.id~/">~~$cs.title~</a>
                        </li>
                        ~~/foreach~

                    </ul>

                    ~~/foreach~
                </div>
            </div>
        </div>
    </div>
</div>