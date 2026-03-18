<div class="catalog-items__cell" id="item~~$item.guid~" data-id="~~$item.guid~">
    <div class="item-grid  js-item js-item-grid">
        
        ~~if $item.wholesale_amount > 1~
        <div data-size="big" data-theme="opt" class="item-badge item-badge--opt js-tooltip" data-tooltipped="" aria-describedby="tippy-tooltip-2" data-original-title="заказ кратно ~~$item.wholesale_amount~" style="
    width: 47px;
    height: 47px;
    line-height: 47px;
    text-align: center;
    display: inline-block;
    color: #fff;
    background: #f33535;
    font-size: 20px!important;
    ">~~$item.wholesale_amount~</div>
        ~~/if~

        <div class="item-grid__inn">
            <div class="item-grid__photo">
                <a href="/~~$c_data.current.name~/~~$item.guid~/">
                ~~if isset($item.gallery) && count($item.gallery)>0~
                <img alt="~~$item.name~" class="item-grid__img js-item-main-img" src="~~$item.gallery.0~"> 
                ~~else~
                <img alt="~~$item.name~" class="item-grid__img js-item-main-img" src="~~$item.img_url~">
                ~~/if~
                </a>
                                 
                ~~if isset($item.gallery) && count($item.gallery)>0~
                <div class="item-grid__carousel carousel">
                    <div class="swiper-container js-item-gallery-carousel">
                        <div class="swiper-wrapper">
                            ~~foreach from=$item.gallery item=photo~
                            <div class="swiper-slide">
                                <div class="item-grid__carousel-item js-item-carousel-image"><img
                                            alt="~~$item.name~"
                                            src="~~$photo~">
                                </div>
                            </div>
                            ~~/foreach~
                        </div>
                    </div>
                </div>
                ~~/if~
            </div>
            <a href="/~~$c_data.current.name~/~~$item.guid~/" class="item-grid__name">~~$item.title~</a> 
            <div class="item-grid__category">
              ~~if $item.wholesale_amount > 1~ Цена за ~~if $item.pack>1~упаковку (~~$item.pack~шт)~~else~единицу~~/if~: ~~$item.cost~ ₽~~/if~
            </div>
            <a href="/brand/~~$item.brand_id~"class="item-grid__category">
                ~~$item.brand~
            </a>
            <div class="item-content item-grid__actions">
            </div>

            ~~*
            <div class="item-grid__category">
                Сумка дорожная
            </div>
            <div class="item-grid__meta">
                <div class="item-grid__meta-left">
                    <div class="rate">
                        <div class="rate__inn">
                            <div class="rate__stars r0">
                                <i></i><i></i><i></i><i></i><i></i>
                            </div>
                            <div class="rate__count">
                                (123)
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item-grid__meta-right">
                    <a href="#" class="js-fav-add fav-btn "></a>
                </div>
            </div>
            <div class="item-grid__actions">
                <div class="item-grid__actions-left">
                    <span class="price">9 000 р.</span>
                </div>
                <div class="item-grid__actions-right">
                    <a href="#" class="js-cart-add cart-btn "></a><a href="#" class="js-fav-add fav-btn "></a>
                </div>
            </div>
            <div class="item-grid__fast-view">
                <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a>
            </div>
            *~


        </div>
    </div>
</div>





