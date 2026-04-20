~~mod path="sfera/" mod_name="header" tpl="header"~~

<div class="catalog-page">
    <div class="container">
        <h1>~~$page_title~~</h1>

        <div class="products-grid">

        ~~foreach from=$goods item=good~~
            <div class="product-card">
                <div class="image-wrapper">
                    <img src="~~$good.image~~" alt="~~$good.name~~" loading="lazy">
                    ~~if $good.old_price > 0~~
                        <span class="sale-badge">
                            -~~math equation="round((($good.old_price - $good.price)/$good.old_price)*100)"~~%
                        </span>
                    ~~/if~~
                </div>

                <div class="info">
                    ~~if $good.brand_name~~
                        <div class="brand">~~$good.brand_name~~</div>
                    ~~/if~~

                    <h3 class="name">
                        <a href="/product/~~$good.id~~">~~$good.name~~</a>
                    </h3>

                    <div class="category">~~$good.category_name~~</div>

                    <div class="price-block">
                        ~~if $good.old_price > 0~~
                            <span class="old-price">~~$good.old_price~~ ₽</span>
                        ~~/if~~
                        <span class="current-price"><strong>~~$good.price~~ ₽</strong></span>
                    </div>

                    <div class="actions">
                        <button class="btn-add-cart" data-id="~~$good.id~~">В корзину</button>
                        <a href="/product/~~$good.id~~" class="btn-details">Подробнее</a>
                    </div>
                </div>
            </div>
        ~~/foreach~~

        </div>

        ~~if empty($goods)~~
            <p>В данный момент товаров нет.</p>
        ~~/if~~

    </div>
</div>

~~mod path="sfera/" mod_name="footer" tpl="footer"~~