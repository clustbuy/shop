<section class="product-reviews-section">
    <div class="container">
        <h2 class="section-title" style="font-size: 24px;
    line-height: 30px;
    font-weight: 500;
    letter-spacing: -0.01em;
    color: #0d0d0d;
    margin-bottom: 24px;">Обзоры продукции</h2>

        <div class="review-blocks-container">
            <!-- First Horizontal Block -->
            <div class="review-block-horizontal">
                <!-- Main Review Card (Left - 4/6 width) -->
                ~~if $reviews[0]~
                <a href="/page/~~$reviews[0].id~/" class="review-card review-card-main">
                    <div class="review-image-container">
                        ~~if $reviews[0].image~
                        <img src="~~$reviews[0].image~" alt="~~$reviews[0].name~">
                        ~~else~
                        <img src="https://via.placeholder.com/800x400" alt="~~$reviews[0].name~">
                        ~~/if~
                        <div class="review-caption">
                            <h3 class="review-caption-title">~~$reviews[0].name~</h3>
                        </div>
                    </div>
                </a>
                ~~/if~

                <!-- Side Review Grid (Right - 2/6 width, 2x3 grid) -->
                <div class="review-side-grid">
                    ~~if $reviews[1]~
                    <a href="/page/~~$reviews[1].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[1].image~
                            <img src="~~$reviews[1].image~" alt="~~$reviews[1].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[1].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[1].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~

                    ~~if $reviews[2]~
                    <a href="/page/~~$reviews[2].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[2].image~
                            <img src="~~$reviews[2].image~" alt="~~$reviews[2].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[2].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[2].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~

                    ~~if $reviews[3]~
                    <a href="/page/~~$reviews[3].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[3].image~
                            <img src="~~$reviews[3].image~" alt="~~$reviews[3].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[3].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[3].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~

                    ~~if $reviews[4]~
                    <a href="/page/~~$reviews[4].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[4].image~
                            <img src="~~$reviews[4].image~" alt="~~$reviews[4].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[4].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[4].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~

                    ~~if $reviews[5]~
                    <a href="/page/~~$reviews[5].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[5].image~
                            <img src="~~$reviews[5].image~" alt="~~$reviews[5].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[5].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[5].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~

                    ~~if $reviews[6]~
                    <a href="/page/~~$reviews[6].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[6].image~
                            <img src="~~$reviews[6].image~" alt="~~$reviews[6].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[6].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[6].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~
                </div>
            </div>

            <!-- Second Horizontal Block -->
            <div class="review-block-horizontal">
                <!-- Main Review Card (Left - 4/6 width) -->
                ~~if $reviews[7]~
                <a href="/page/~~$reviews[7].id~/" class="review-card review-card-main">
                    <div class="review-image-container">
                        ~~if $reviews[7].image~
                        <img src="~~$reviews[7].image~" alt="~~$reviews[7].name~">
                        ~~else~
                        <img src="https://via.placeholder.com/800x400" alt="~~$reviews[7].name~">
                        ~~/if~
                        <div class="review-caption">
                            <h3 class="review-caption-title">~~$reviews[7].name~</h3>
                        </div>
                    </div>
                </a>
                ~~/if~

                <!-- Side Review Grid (Right - 2/6 width, 2x1 grid) -->
                <div class="review-side-grid">
                    ~~if $reviews[8]~
                    <a href="/page/~~$reviews[8].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[8].image~
                            <img src="~~$reviews[8].image~" alt="~~$reviews[8].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[8].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[8].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~

                    ~~if $reviews[9]~
                    <a href="/page/~~$reviews[9].id~/" class="review-card review-card-small">
                        <div class="review-image-container">
                            ~~if $reviews[9].image~
                            <img src="~~$reviews[9].image~" alt="~~$reviews[9].name~">
                            ~~else~
                            <img src="https://via.placeholder.com/400x300" alt="~~$reviews[9].name~">
                            ~~/if~
                            <div class="review-caption">
                                <h3 class="review-caption-title">~~$reviews[9].name~</h3>
                            </div>
                        </div>
                    </a>
                    ~~/if~
                </div>
            </div>
        </div>
    </div>
</section>

