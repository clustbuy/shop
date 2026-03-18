<div class="product-grid">
~~if $products|@count > 0~
~~foreach from=$products item=product~
    <article class="product-card">
        <button class="product-favorite~~if isset($favorites.items[$product.id])~ favorite-filled~~/if~" data-product-id="~~$product.id~" title="~~if isset($favorites.items[$product.id])~Удалить из избранного~~else~Добавить в избранное~~/if~">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" stroke="currentColor" stroke-width="1.5"/>
            </svg>
        </button>
        <a href="/product/~~$product.id~/" class="product-link">
            <div class="product-image">
                <img src="~~$product.image~" alt="~~$product.name~" onerror="this.onerror=null; this.src='/assets/img/product_empty.jpg';">
            </div>
            <div class="product-info">
                <h3 class="product-title">~~$product.name~</h3>
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
~~if $product.price && $product.price > 0~
                <div class="product-price">
                    <span class="price-current">~~$product.price~ ₽</span>
                </div>
~~/if~
            </div>
        </a>
        <div class="product-actions">
~~if isset($cart.items[$product.id]) && isset($cart.items[$product.id].product_amount)~
            <button class="btn-add-to-cart" data-product-id="~~$product.id~" type="button" style="display: none;">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 3h2l1 4m0 0l3 11h10l3-11H6z"/>
                    <circle cx="9" cy="20" r="1" fill="currentColor"/>
                    <circle cx="17" cy="20" r="1" fill="currentColor"/>
                </svg>
                <span>В корзину</span>
            </button>
            <a href="#" class="btn-buy-all" data-product-id="~~$product.id~" data-max-quantity="~~$product.quantity~">Купить всё</a>
            <div class="product-quantity-control" data-product-id="~~$product.id~">
                <button class="qty-btn qty-minus" data-product-id="~~$product.id~" type="button">−</button>
                <input type="number" class="qty-input" value="~~$cart.items[$product.id].product_amount~" min="1" max="~~$product.quantity~" data-product-id="~~$product.id~">
                <button class="qty-btn qty-plus" data-product-id="~~$product.id~" type="button">+</button>
            </div>
~~else~
            <button class="btn-add-to-cart" data-product-id="~~$product.id~" type="button">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 3h2l1 4m0 0l3 11h10l3-11H6z"/>
                    <circle cx="9" cy="20" r="1" fill="currentColor"/>
                    <circle cx="17" cy="20" r="1" fill="currentColor"/>
                </svg>
                <span>В корзину</span>
            </button>
            <a href="#" class="btn-buy-all" data-product-id="~~$product.id~" data-max-quantity="~~$product.quantity~">Купить всё</a>
            <div class="product-quantity-control hidden" data-product-id="~~$product.id~">
                <button class="qty-btn qty-minus" data-product-id="~~$product.id~" type="button">−</button>
                <input type="number" class="qty-input" value="1" min="1" max="~~$product.quantity~" data-product-id="~~$product.id~">
                <button class="qty-btn qty-plus" data-product-id="~~$product.id~" type="button">+</button>
            </div>
~~/if~
        </div>
    </article>
~~/foreach~
~~/if~
</div>

<style>
    .wrap {
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .btn_splash {
        min-width: 250px;
        min-height: 30px;
        display: inline-flex;
        font-family: 'Nunito', sans-serif;
        font-size: 18px;
        align-items: center;
        justify-content: center;
        text-align: center;
        letter-spacing: 1.3px;
        font-weight: 400;
        color: #fff;
        background: #4FD1C5;
        background: linear-gradient(90deg, #FBC100 0%, #FBC100 100%);
        border: none;
        border-radius: 1000px;
        transition: all 0.3s ease-in-out 0s;
        cursor: pointer;
        outline: none;
        position: relative;
        padding: 10px;
    }

    .btn_splash::before {
        content: '';
        border-radius: 1000px;
        min-width: calc(300px + 12px);
        min-height: calc(60px + 12px);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        opacity: 0;
        transition: all .3s ease-in-out 0s;
    }

    .btn_splash:hover,
    .btn_splash:focus {
        color: #fff;
        transform: translateY(-6px);
    }

    .btn_splash:hover::before,
    .btn_splash:focus::before {
        opacity: 1;
    }

    .btn_splash::after {
        content: '';
        width: 30px; height: 30px;
        border-radius: 100%;
        border: 6px solid #FBC100;
        position: absolute;
        z-index: -1;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        animation: ring 1.5s infinite;
    }

    .btn_splash:hover::after,
    .btn_splash:focus::after {
        animation: none;
        display: none;
    }

    @keyframes ring {
        0% {
            width: 30px;
            height: 30px;
            opacity: 1;
        }
        100% {
            width: 300px;
            height: 300px;
            opacity: 0;
        }
    }
    </style>
<div class="catalog-link-container" style="text-align: center; margin-top: 32px; padding: 16px 0;">


    <div class="wrap">
        <a href="/catalog/" c class="btn_splash">Посмотреть каталог</a>
    </div>

    ~~*
    <a href="/catalog/" class="btn-catalog-link" style="display: inline-block; padding: 8px 16px; background: #0078d4; color: #fff; text-decoration: none; border: 1px solid #0078d4; border-radius: 2px; font-size: 14px; font-weight: 400; font-family: 'Segoe UI', sans-serif; transition: background 0.2s;">
        Просмотреть весь каталог
    </a>
    *~

</div>
