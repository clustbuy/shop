<style>
    .ai3a4i{
        border: 1px solid rgb( 10 180 246 / 35%);
        border-radius: 12px;
    }
</style>

~~foreach from=$items_r item=item~


<script>
    Items.push(~~$item.json~);
</script>

<div class="i8a a9i j1a ca8c acc9" style="background-color:;">

    ~~*
    <div class="j5a i7a">

        <div tile-id="1266770795" on-click-action="function () { [native code] }" favlistslink="ClustBUY://modal/favoritesListsSelect?sku=1266770795" class="d4147-a aj6">
            <button class="a6j">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
                    <path fill="#00192E" fill-rule="evenodd" d="M12 22c-.316-.02-.56-.147-.848-.278a23.542 23.542 0 0 1-4.781-2.942C3.777 16.705 1 13.449 1 9a6 6 0 0 1 6-6 6.183 6.183 0 0 1 5 2.568A6.183 6.183 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278ZM7 5a4 4 0 0 0-4 4c0 3.552 2.218 6.296 4.621 8.22A21.525 21.525 0 0 0 12 19.91a21.58 21.58 0 0 0 4.377-2.69C18.78 15.294 21 12.551 21 9a4 4 0 0 0-4-4c-1.957 0-3.652 1.396-4.02 3.2a1 1 0 0 1-1.96 0C10.652 6.396 8.957 5 7 5Z" clip-rule="evenodd"></path><path fill="white" fill-rule="evenodd" d="M12 22c-.285-.018-.512-.123-.764-.24a21.77 21.77 0 0 1-1.273-.628 23.542 23.542 0 0 1-3.592-2.351C3.777 16.704 1 13.448 1 9a6 6 0 0 1 6-6 6.18 6.18 0 0 1 5 2.568A6.18 6.18 0 0 1 17 3a6 6 0 0 1 6 6c0 4.448-2.78 7.705-5.375 9.78a23.599 23.599 0 0 1-4.78 2.942c-.543.249-.732.278-.845.278Zm0-17.959A7.178 7.178 0 0 1 17 2a7 7 0 0 1 7 7c0 4.897-3.061 8.41-5.75 10.562a24.585 24.585 0 0 1-4.989 3.07c-.566.258-.92.368-1.261.368h-.032l-.033-.002c-.484-.032-.881-.218-1.12-.33a22.658 22.658 0 0 1-1.322-.653 24.524 24.524 0 0 1-3.747-2.454C3.058 17.41 0 13.896 0 9a7 7 0 0 1 7-7c1.918 0 3.701.776 5 2.041ZM3 9a4 4 0 0 1 4-4c1.957 0 3.652 1.396 4.02 3.2a1 1 0 0 0 1.96 0C13.348 6.396 15.043 5 17 5a4 4 0 0 1 4 4c0 3.552-2.22 6.295-4.625 8.22A21.58 21.58 0 0 1 12 19.91a21.525 21.525 0 0 1-4.377-2.69C5.217 15.295 3 12.551 3 9Z" clip-rule="evenodd"></path>
                </svg>
            </button>
        </div>
        <!---->
        <!---->
    </div>
    *~

    ~~if $item.cost > 500~
    <div class="j5a i7a">

        <div onclick="window.location.href='#bonus_info'"  class="d4147-a aj6">
            <section class="a6j" style="width:100px;">
                <div class="ia ai0">
                    <div tabindex="1" class="a0i b410-a0 b410-a1" style="background-color:rgba(16, 196, 76, 1);color:#ffffff;z-index:9999;">
                        <div class="b410-b">
                            <img src="/images/ico_bonus_w.svg" style="width:18px; margin-right:5px;">
                            <div title="Бонус ~~$item.bonus|price~ ₽" class="b410-b0 tsBodyControl400Small">
                                ~~$item.bonus|price~ ₽
                                ~~*
                                <svg xmlns="http://www.w3.org/2000/svg" style="width:18px;height:16px;" class="b28-a3" style="color:#ffffff;"><path fill="currentColor" d="M6.293 4.293a1 1 0 0 1 1.414 0l3 3a1 1 0 0 1 0 1.414l-3 3a1 1 0 0 1-1.414-1.414L8.586 8 6.293 5.707a1 1 0 0 1 0-1.414"></path></svg>
                                *~
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!---->
        <!---->
    </div>
    ~~/if~

    <a target="_self" href="/product/~~$item.guid~/" class="a5g aj2 i9a ai8">
        <div class="i5a ai6">
            <div type="" class="ai2">

                <div class="swiper swiper-thumbnails" data-mousemove-swipe>
                    <div class="swiper-wrapper">

                        ~~assign var="it" value="0"~
                        ~~foreach from=$item.thumbnails item=img ~
                        ~~assign var="it" value=`$it+1`~

                        ~~if  $it<5 ~
                        <div class="swiper-slide">

                            <div class="ai3 a4i ~~if $item.wlwh==0~ai3a4i~~/if~">
                                <div class="i4a">

                                    <img  ~~if  $it>1 ~ loading="lazy"  fetchpriority="low"  ~~/if~  src="https://ru.market/i/~~$item.guid~/400/~~$img.img_name~.jpg"  alt="~~$item.title~" class="b9414-a">

                                </div>
                            </div>

                        </div>
                        ~~/if~
                        ~~/foreach~
                    </div>
                    <div class="swiper-pagination"></div>
                </div>

            </div>
        </div>


        <!----> <!----> <!----></a>
    <div class="ia8">
        <a target="_self" href="/product/~~$item.guid~/" class="a5g aj2">
            <div class="ja1">
                <div class="a4j c3118-a c3118-b7" style="padding-bottom:4px;">
                    <div class="c3118-a0">

                        <span class="c3118-a1 tsHeadline500Medium c3118-b9">~~$item.cost|price~ ₽</span>
                        ~~if $item.min >1~
                        <div style="margin-left:15px;"> за <span class="c3118-a1 tsHeadline500Medium c3118-b9" >~~$item.min~</span> ~~$item.measure~</div>
                        ~~/if~

                        <!--span class="c3118-a1 tsHeadline500Medium  c3118-b9" style="background-image: linear-gradient(135deg, var(--theme-rmcolor), var(--theme-rmcolor)); margin-left:20px;margin-right:4px;">на бонусный счёт<br/>~~$item.bonus|price~ ₽</span-->



                    </div>
                </div>

                ~~if $item.available_quantity <= 10~
                <div class="e6136-a e6136-a5 a3j aj4">
                    <span class="e6136-a4" style="color:rgba(0, 0, 0, 1);">Осталось ~~$item.available_quantity~ шт</span>
                    <div class="e6136-a0">
                        <div class="e6136-a1" style="background-color:rgba(0, 26, 52, 0.2);opacity:1;"></div><div class="e6136-a2" style="background-color:rgba(249, 17, 85, 1);width:~~$item.available_quantity*100/$item.old_quantity~%;"></div>
                    </div>
                </div>
                ~~/if~


                <div class="b7a ab9 ba9 a3j" style="color:;">
                    <span class="tsBody500Medium">~~$item.title~</span>
                </div>

                ~~if $item.count_reviews >0~
                <div class="t2 t3 t4 tsBodyMBold" style="text-align:left;">
                    <span class="t7">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgb(255, 168, 0);">
                        <path fill="currentColor" d="M8 2a1 1 0 0 1 .87.508l1.538 2.723 2.782.537a1 1 0 0 1 .538 1.667L11.711 9.58l.512 3.266A1 1 0 0 1 10.8 13.9L8 12.548 5.2 13.9a1 1 0 0 1-1.423-1.055l.512-3.266-2.017-2.144a1 1 0 0 1 .538-1.667l2.782-.537 1.537-2.723A1 1 0 0 1 8 2Z"></path>
                      </svg><span style="color:rgba(0, 26, 52, 0.6);">~~$item.rating|round:1~ </span></span><span class="t7">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="t8" style="color: rgba(0, 26, 52, 0.4);">
                        <path fill="currentColor" d="M8.545 13C11.93 13 14 11.101 14 8c0-3.103-2.07-5-5.455-5-3.384 0-5.454 1.897-5.454 5 0 1.202.31 2.223.889 3.023-.2.335-.42.643-.656.899-.494.539-.494 1.077.494 1.077.89 0 1.652-.15 2.308-.394.703.259 1.514.394 2.42.394Z"></path>
                      </svg><span style="color:rgba(0, 26, 52, 0.6);">отзывов: ~~$item.count_reviews~ </span>
                    </span>
                </div>
                ~~/if~



            </div>
        </a>

        <div class="j4a">
            <div type="addToCartButtonWithQuantity" class="f f1">
                <div class="a2429-a a2429-a3">
                    <a onclick="a2c('~~$item.guid~'); return false;" class="a2429-a4 a2429-a3" style="border-radius:8px;">
                    <span class="a2429-b1 a2429-a3" style="border-radius:8px;">
                      <img src="/images/icons/ico-cart-16w.svg" style="margin: 0 10px 0 0;"/><span class="a2429-e7 a2429-f2">в корзину</span></span>
                    </a>
                </div>
                <!---->
            </div>
            <!---->
            <!---->
        </div>
        <!---->

    </div>
</div>
~~/foreach~



