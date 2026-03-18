<div class="main-carousel-container">
    <div class="main-carousel">
        <button class="carousel-btn carousel-prev" data-carousel="~~$carousel_id~">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M15 18l-6-6 6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-track" data-carousel="~~$carousel_id~">
~~foreach from=$banners item=banner name=bannerLoop~
            <div class="carousel-slide~~if $smarty.foreach.bannerLoop.first~ active~~/if~">
                <img src="~~$banner.url~" alt="~~if $banner.title~~~$banner.title~~~else~~~$banner.name~~~/if~">
            </div>
~~/foreach~
        </div>
        <button class="carousel-btn carousel-next" data-carousel="~~$carousel_id~">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-dots" data-carousel="~~$carousel_id~">
~~foreach from=$banners item=banner name=dotLoop~
            <button class="carousel-dot~~if $smarty.foreach.dotLoop.first~ active~~/if~" data-index="~~$smarty.foreach.dotLoop.index~"></button>
~~/foreach~
        </div>
    </div>
</div>