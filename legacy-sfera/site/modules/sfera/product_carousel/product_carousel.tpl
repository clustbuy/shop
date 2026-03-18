<div class="product-carousel-container">
    <div class="product-carousel">
        <button class="carousel-btn carousel-prev small" data-carousel="~~$carousel_id~">
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M10 12l-4-4 4-4" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-track" data-carousel="~~$carousel_id~">
~~foreach from=$products item=product name=productLoop~
            <div class="carousel-slide~~if $smarty.foreach.productLoop.first~ active~~/if~">
                <div class="product-mini-card">
                    <img src="~~$product.image~" alt="~~$product.title~">
                    ~~*
                    <div class="product-mini-info">
                        <div class="product-mini-price">~~$product.price~</div>
                        <div class="product-mini-title">~~$product.title~</div>
                    </div>
                    *~
                </div>
            </div>
~~/foreach~
        </div>
        <button class="carousel-btn carousel-next small" data-carousel="~~$carousel_id~">
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M6 12l4-4-4-4" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-dots small" data-carousel="~~$carousel_id~">
~~foreach from=$products item=product name=dotLoop~
            <button class="carousel-dot~~if $smarty.foreach.dotLoop.first~ active~~/if~" data-index="~~$smarty.foreach.dotLoop.index~"></button>
~~/foreach~
        </div>
    </div>
</div>