~~if $hashtags_count > 0~

            ~~*
            <!-- Скопировано с https://www.ozon.ru/product/propisi-ya-gotovlyus-k-pismu-dlya-detey-4-5-let-chistyakova-nina-andreevna-523319123/?at=z6tOVqZglcOy0rEGCm0QWkQTMvWgO4UyYRYjJT7AWz5y -->
            <!-- Время копирования: 29.11.2025, 12:37:34 -->
            *~

            <link rel="stylesheet" href="/assets/sfera/css/product/pdp-all-hashtags-v1.css">
            <link rel="stylesheet" href="/assets/sfera/css/product/hashtags.css">

            <div class="pdp_ta5 pdp_at6" style="margin-top:36px;margin-bottom:36px;">
                
                ~~foreach from=$hashtags item=hashtag name=hashtagLoop~      
                <div class="b5_4_7-a0 b5_4_7-a9 b5_4_7-c2 b5_4_7-a6" style="border-radius: 12px;">
                    ~~*<div class="b5_4_7-a"></div>*~
                    <div class="b5_4_7-b">
                        <div class="b5_4_7-b0 tsBodyControl500Medium"><a href="/hashtag/~~$hashtag.id~/" target="_blank">~~$hashtag.value~</a></div>
                    </div>
                    
                </div>
                ~~/foreach~

            </div>



~~/if~

