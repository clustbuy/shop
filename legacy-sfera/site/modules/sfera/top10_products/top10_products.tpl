<!-- TOP-10 Slider Block -->
<section class="top10-slider-section">
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">ТОП-10</h2>
            <div class="slider-navigation">
                <button class="slider-nav-btn slider-prev-btn" aria-label="Предыдущий">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                        <path d="M12 16l-6-6 6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
                <button class="slider-nav-btn slider-next-btn" aria-label="Следующий">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                        <path d="M8 16l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
            </div>
        </div>

        <div class="top10-slider-container">
            <div class="top10-slider-wrapper">
                <div class="top10-slider-track">
                    ~~foreach from=$products item=product name=top10Loop~
                    <div class="top10-product-card">
                        <button class="product-favorite top10-favorite-btn~~if isset($favorites.items[$product.product_id])~ favorite-filled~~/if~" data-product-id="~~$product.product_id~" title="~~if isset($favorites.items[$product.product_id])~Удалить из избранного~~else~Добавить в избранное~~/if~">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" stroke="currentColor" stroke-width="1.5"/>
                            </svg>
                        </button>
                        <a href="/product/~~$product.product_id~/" class="top10-product-link">
                            <div class="top10-product-image-container">
                                <span class="top10-rank-badge">~~$smarty.foreach.top10Loop.iteration~</span>
                                <img src="~~$product.image_url~" alt="~~$product.product_name~" onerror="this.onerror=null; this.src='/assets/img/product_empty.jpg';">
                            </div>
                            <div class="top10-product-info">
                                <h3 class="top10-product-title">~~$product.product_name~</h3>

                                <div class="vi_24 vi0_24 p6b3_0_4-a p6b3_0_4-a0 p6b3_0_4-a1 tsBodyMBold"
                                     style="text-align: left;height: 22px;">
                                    ~~if $product.rating > 0 || $product.reviews_count > 0~
                                    ~~if $product.rating > 0~
                                    <span class="p6b3_0_4-a4">
                                        <svg
                                                xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                class="p6b3_0_4-a6 p6b3_0_4-a5" style="color: var(--graphicRating);"><path
                                                    fill="currentColor"
                                                    d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2"></path>
                                        </svg>
                                        <span style="color:var(--textPremium);">~~$product.rating~</span>
                                    </span>
                                    ~~/if~
                                    ~~if $product.reviews_count > 0~
                                    <span class="p6b3_0_4-a4">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                                     height="16" class="p6b3_0_4-a5"
                                                                     style="color: var(--graphicTertiary);"><path
                                                    fill="currentColor"
                                                    d="M8.545 13C11.93 13 14 11.102 14 8s-2.07-5-5.455-5C5.161 3 3.091 4.897 3.091 8c0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394"></path>
                                        </svg>
                                        <span style="color: var(--textSecondary);">~~$product.reviews_count|number_format:2~&nbsp;отзыв~~$product.reviews_count|fins~</span>
                                    </span>
                                    ~~/if~
                                    ~~/if~
                                </div>

                                ~~if $product.product_price && $product.product_price > 0~
                                <div class="top10-product-price">
                                    <span class="top10-price-current">~~$product.product_price~ ₽</span>
                                </div>
                                ~~/if~
                            </div>
                        </a>
                        <div class="product-actions" style="padding: 8px;">
                            ~~if isset($cart.items[$product.product_id]) && isset($cart.items[$product.product_id].product_amount)~
                            <button class="btn-add-to-cart" data-product-id="~~$product.product_id~" type="button" style="display: none;">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M3 3h2l1 4m0 0l3 11h10l3-11H6z"/>
                                    <circle cx="9" cy="20" r="1" fill="currentColor"/>
                                    <circle cx="17" cy="20" r="1" fill="currentColor"/>
                                </svg>
                                <span>В корзину</span>
                            </button>
                            <a href="#" class="btn-buy-all" data-product-id="~~$product.product_id~" data-max-quantity="~~$product.quantity~">Купить всё</a>
                            <div class="product-quantity-control" data-product-id="~~$product.product_id~">
                                <button class="qty-btn qty-minus" data-product-id="~~$product.product_id~" type="button">−</button>
                                <input type="number" class="qty-input" value="~~$cart.items[$product.product_id].product_amount~" min="1" max="~~$product.quantity~" data-product-id="~~$product.product_id~">
                                <button class="qty-btn qty-plus" data-product-id="~~$product.product_id~" type="button">+</button>
                            </div>
                            ~~else~
                            <button class="btn-add-to-cart" data-product-id="~~$product.product_id~" type="button">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M3 3h2l1 4m0 0l3 11h10l3-11H6z"/>
                                    <circle cx="9" cy="20" r="1" fill="currentColor"/>
                                    <circle cx="17" cy="20" r="1" fill="currentColor"/>
                                </svg>
                                <span>В корзину</span>
                            </button>
                            <a href="#" class="btn-buy-all" data-product-id="~~$product.product_id~" data-max-quantity="~~$product.quantity~">Купить всё</a>
                            <div class="product-quantity-control hidden" data-product-id="~~$product.product_id~">
                                <button class="qty-btn qty-minus" data-product-id="~~$product.product_id~" type="button">−</button>
                                <input type="number" class="qty-input" value="1" min="1" max="~~$product.quantity~" data-product-id="~~$product.product_id~">
                                <button class="qty-btn qty-plus" data-product-id="~~$product.product_id~" type="button">+</button>
                            </div>
                            ~~/if~
                        </div>
                    </div>
                    ~~/foreach~
                </div>
            </div>
        </div>
    </div>
</section>

