~~*debug*~


~~foreach from=$items_r item=item~

<script>
    Items.push(~~$item.json~);
</script>

<div class="ix9 i9x iy0">
    <a href="/product/~~$item.guid~/" data-prerender="true" class="v5i tile-hover-target i7v">
        <div highfetchpriority="true" class="i4v vi4">
            <div class="vi7">
                <div class="v7i">


                    ~~*<img loading="lazy" fetchpriority="low" src="https://ir.ozone.ru/s3/multimedia-x/wc350/6204696285.jpg" class="b9414-a">*~


                    <div class="swiper swiper-thumbnails" ~~*data-mousemove-swipe*~  style="position: absolute;">
                        <div class="swiper-wrapper">
                            ~~foreach from=$item.thumbnails item=img~

                            <div class="swiper-slide">

                                <div class="ai3 a4i">
                                    <div class="i4a">

                                        <img loading="lazy" fetchpriority="low" src="https://ru.market/i/~~$item.guid~/400/~~$img.img_name~.jpg"  alt="~~$item.title~" class="b9414-a">

                                    </div>
                                </div>
                            </div>

                            ~~/foreach~
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>


                </div>
                <!---->

            </div>
            <div class="v6i"></div>


            ~~*
            <section class="h9a ai">
                <div class="ia ai0">
                    <div tabindex="1" class="a0i b411-a0 b411-a5 b411-a1" style="background-color:#5B51DE;color:#FFFFFF;">
                        <div class="b411-b">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="b411-b1" style="color: rgb(255, 255, 255);">
                                <path fill="currentColor" d="M10 9.333c0-.333 0-.666-.667-.666H6.667V10h2.666C10 10 10 9.667 10 9.333Z"></path><path fill="currentColor" fill-rule="evenodd" d="M2 8c0-4.941 1.059-6 6-6s6 1.059 6 6-1.059 6-6 6-6-1.059-6-6Zm4.667-3.333c-1 0-1.334.333-1.334 1.333v4c0 1 .334 1.333 1.41 1.333h1.943c.318 0 .633 0 .911-.023.281-.023.589-.074.868-.214.303-.151.539-.39.686-.721.137-.308.182-.663.182-1.042s-.045-.734-.182-1.041a1.44 1.44 0 0 0-.686-.722c-.28-.14-.587-.19-.868-.214-.278-.023-.593-.023-.911-.023h-2.02V6H10a.667.667 0 1 0 0-1.333H6.667Z" clip-rule="evenodd"></path>
                            </svg>
                            <div title="70 баллов за отзыв" class="b411-b0 tsBodyAccent250Caption">
                                70 баллов за отзыв
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            *~



        </div></a>
    <div class="iy">
        <div class="vi i0v c3118-a c3118-b3" style="padding-bottom:4px;">
            <div class="c3118-a0">
                <span class="c3118-a1 tsHeadline500Medium c3118-b9"  style="font-size: 15px;">~~$item.cost|price~ ₽</span>
            </div>
        </div>


        <a href="/product/~~$item.guid~/" class="tile-hover-target vi vi0">
            <div class="b7a ab9 ba9 vi">
                <span class="tsBody400Small">~~$item.title~</span>
            </div></a>

        ~~if $item.count_reviews >0~
        <div class="vi">
            <div class="t2 t3 t4 tsCaptionBold" style="text-align:left;">
                <span class="t7">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgb(255, 168, 0);">
                    <path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
                  </svg><span style="color:rgba(0, 26, 52, 0.6);">~~$item.rating|round:1~ </span></span><span class="t7">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8 t9" style="color: rgba(0, 26, 52, 0.4);">
                    <path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
                  </svg><span style="color:rgba(0, 26, 52, 0.6);">отзывов: ~~$item.count_reviews~ </span></span>
            </div>
        </div>
        ~~/if~

        <div class="iv9 w0i iw0">
            <div class="iw wi0 wi">
                <div class="f f1 f4 i9v">
                    <div class="e9 a2429-a a2429-a3">
                        <a tabindex="0"  href="#card" data-remodal-target="cart" onclick="a2c('~~$item.guid~','~~$item.cost~'); return;" class="a2429-a4 a2429-a3" style="border-radius:8px;">
                      <span class="a2429-b1 a2429-e2 a2429-a3" style="border-radius:8px;">
                            <img src="/images/icons/ico-cart-16w.svg" style="margin: 0 10px 0 0;"/>
                          <span class="a2429-e7 a2429-f2">в корзину</span></span>
                        </a>
                    </div>

                </div>
            </div>
        </div>

    </div>

    ~~*
    <div class="i3y yi3">
        <div class="d4147-a iy4">
            <button class="a6j">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
                    <path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
                </svg>
            </button>
        </div>
    </div>
    *~

    <!---->
</div>
~~/foreach~