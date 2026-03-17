<div class="product-item ~~if !$good.stock~~ unavailable~~/if~~">

    <div class="image-container">
        <img src="~~$good.image~~" alt="~~$good.name~~" loading="lazy">
        ~~if $good.old_price > 0~~
            <span class="sale-badge">
                -~~math equation="round((($good.old_price - $good.price) / $good.old_price) * 100)"~~%
            </span>
        ~~/if~~
    </div>

    <div class="info">
        <div class="brand">~~$good.brand~~</div>
        <h3 class="title"><a href="/product/~~$good.id~~/">~~$good.name~~</a></h3>
        <div class="color">~~$good.color~~</div>

        <div class="price-row">
            ~~if $good.old_price > 0~~
                <span class="old-price">~~$good.old_price~~ ₽</span>
            ~~/if~~
            <span class="price">~~$good.price~~ ₽</span>
        </div>

        <div class="actions">
            ~~if $good.stock~~
                <button class="add-to-cart" data-id="~~$good.id~~">В корзину</button>
            ~~else~~
                <span class="no-stock">Нет в наличии</span>
            ~~/if~~
            <a href="/product/~~$good.id~~/" class="details">Подробнее</a>
        </div>
    </div>

</div>