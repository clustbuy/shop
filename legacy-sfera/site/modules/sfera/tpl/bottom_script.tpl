

   ~~include file='market/tpl/comet.tpl'~


        <script type="text/javascript" src="/js/remodal/src/remodal.js"></script>


        <div id="dialog">
        </div>
        <style>
            /* (A) DIALOG BOX CSS */
            #dialog {
                position: fixed;
                top: 0; left: 0;
                z-index: 999;
                width: 100vw; height: 100vh;
                /*background: #fff;*/
                display: none;
            }
            body.dopen { overflow: hidden; }
            body.dopen #dialog { display: block; }
        </style>


        <script>


            function flyCartAnimate(item, amount)
            {
                console.log('flycart amount' + amount);

                var flyCart = $('<span class="flycart">+' + amount + '</span>');

                var flyCoordinatesX = event.pageX,
                    flyCoordinatesY = event.pageY,
                    cartCoordinatesX = $('.to_cart').offset().left,
                    cartCoordinatesY = $('.to_cart').offset().top;

                if (cartCoordinatesX == 0) {
                    cartCoordinatesX = $(window).width() - 40;
                }

                flyCart.css({
                    'left': flyCoordinatesX - 12,
                    'top': flyCoordinatesY - 12,
                    'z-index': 1000
                });

                $('body').append(flyCart);
                disableScroll();

                flyCart.animate({
                        'left': cartCoordinatesX,
                        'top': cartCoordinatesY
                    },
                    {
                        duration: 1000, // продолжительность анимации
                        easing: "linear", // скорость анимации
                        complete: function(){ // callback

                            setTimeout(function () {

                                var pars = {
                                    task: 'put_item',
                                    item: JSON.stringify({
                                        guid: item.guid,
                                        product_amount: amount
                                    })
                                };

                                console.log(pars);

                                $.ajax({
                                    type: "POST",
                                    url: '/cart/',
                                    data: pars,
                                    dataType: "json",
                                    success: function (data, textStatus) {

                                        console.log('success');
                                        console.log(data);


                                        // формируется новый список товаров в корзине
                                        var items = (function () {
                                            var results = [];
                                            for (var key in data.items) {

                                                if (!data.items.hasOwnProperty(key)) continue;
                                                results.push(data.items[key]);

                                                /*
                                                if (window.red_balls_queue) {
                                                    $(window.red_balls_queue[0]).remove();
                                                    window.red_balls_queue.shift();
                                                }
                                                */
                                            }
                                            return results;
                                        })();

                                        console.log('success2');
                                        console.log(items);

                                        model_cart.update_items(items); //
                                    },
                                    error: function () {
                                        /*
                                        if (window.red_balls_queue) {
                                            $(window.red_balls_queue[0]).remove();
                                            window.red_balls_queue.shift();
                                        }*/
                                    }
                                });




                                /*
                                // Если item == undefined, применить add2cart
                                if (!item) add2cart(guid);

                                // Если же нет, применить update_cart_item
                                else {

                                    // Увеличить amount позиции item на amount
                                    var newamount = +item.product_amount() + Number(amount);

                                    // Применить update_cart_item
                                    self.update_cart_item(item.guid(), newamount, null, null);

                                }*/



                                $('.flycart').remove();
                                enableScroll();


                            }, 500);

                            //$(".status").text("Анимация завершена");
                        },
                        queue: false // не ставим в очередь
                    });
            }

            function a2c(guid)
            {
                console.log('a2c');
                console.log(guid);

                var amount_cart_item = 0;

                var cart_item = (function () {
                    for (var i = 0; i < model_cart.cart().items().length; i++) {


                        console.log(model_cart.cart().items()[i].guid());


                        if (model_cart.cart().items()[i].guid() == guid) {

                            console.log(model_cart.cart().items()[i].min());

                            amount_cart_item = model_cart.cart().items()[i].min();
                            return model_cart.cart().items()[i];
                        }
                    }
                })();

                var amount = 0;
                var item = (function () {
                    for (var i = 0; i < Items.length; i++) {
                        if (Items[i].guid == guid) {

                            console.log(Items[i]);
                            amount = Items[i].min;

                            return Items[i];
                        }
                    }
                })();


                if (!cart_item) {

                    flyCartAnimate(item, amount);
                    //add2cart(guid);

                }
                else {

                    flyCartAnimate(item, amount_cart_item);
                    //var newamount = +item.product_amount() + Number(amount);
                    //self.update_cart_item(cart_item.guid(), newamount, null, null);
                }






            }

            function add2cart(guid)
            {
                //console.log(pars.item);
                $.ajax({
                    type: "POST",
                    url: '/cart/',
                    data: pars,
                    dataType: "json",
                    success: function (data, textStatus) {
                        var items = (function () {
                            var results = [];
                            for (var key in data.items) {
                                if (!data.items.hasOwnProperty(key)) continue;
                                results.push(data.items[key]);

                                if (window.red_balls_queue) {
                                    $(window.red_balls_queue[0]).remove();
                                    window.red_balls_queue.shift();
                                }
                            }
                            return results;
                        })();
                        model_cart.update_items(items);
                    },
                    error: function () {
                        if (window.red_balls_queue) {
                            $(window.red_balls_queue[0]).remove();
                            window.red_balls_queue.shift();
                        }
                    }
                });
            }

            function disableScroll() {

                    var xPos = window.scrollX;
                    var yPos = window.scrollY;
                    window.onscroll = () => window.scroll(xPos, yPos);


            }

            function enableScroll() {
                   window.onscroll = "";

            }


         function update_cart_item (guid, newamount, data, event) {

             var pars = {
                 task: 'update_item',
                 item: JSON.stringify({
                     guid: guid,
                     product_amount: newamount == 'auto' ? item.amount : newamount,
                 })
             };
             console.log(pars);

             $.ajax({
                 type: "POST",
                 url: '/cart/',
                 data: pars,
                 dataType: "json",
                 success: function (data, textStatus) {
                     var items = (function () {
                         var results = [];
                         for (var key in data.items) {

                             if (!data.items.hasOwnProperty(key)) continue;
                             results.push(data.items[key]);

                             if (window.red_balls_queue) {
                                 $(window.red_balls_queue[0]).remove();
                                 window.red_balls_queue.shift();
                             }

                         }
                         return results;
                     })();
                     model_cart.update_items(items);
                 },
                 error: function () {

                     if (window.red_balls_queue) {
                         $(window.red_balls_queue[0]).remove();
                         window.red_balls_queue.shift();
                     }

                 }
             });

         }


         // main items swiper
         $('.swiper-thumbnails').each((index, element) => {
             const swiperThumb = new Swiper(element, {
                 speed: 400,
                 spaceBetween: 100,
                 pagination: {
                     el: '.swiper-pagination',
                     clickable: true
                 },
                 on: {
                     init: function (e) {
                         const sliderItem = e;
                         const sliders = e.el;
                         const sliderLength = sliderItem.slides.length;
                         sliders.addEventListener('mousemove', (e) => {
                             if (sliderLength > 1) {
                                 const sliderWidth = sliderItem.width;
                                 const sliderPath = Math.round(sliderWidth / sliderLength);
                                 const sliderMousePos = e.clientX - sliderItem.el.closest('.i8a.a9i.j1a.ca8c.acc9').offsetLeft;
                                 const sliderSlide = Math.floor(sliderMousePos / sliderPath);
                                 sliderItem.slideTo(sliderSlide)
                             }
                         })
                     }
                 }
             });
         });

            // item gallery


</script>



<script type="text/javascript">

    $(document).ready(function(){

        CometServer().subscription("web_chat_tg", function(event){
            //console.log(event.data.text, event);
            toastr.info(event.data.text);
            //$("#textHolder").html( $("#textHolder").html() +"<hr>"+event.data.text);
        })

        CometServer().start({dev_id:15 })
    })

</script>




~~*debug*~

~~*
   <img src="//mc.yandex.ru/watch/95915045" style="width:1px;height:1px;">
*~

   ~~if $R == 1~

   <script type="text/javascript">var yaParams = {ipaddress: "~~$smarty.server.REMOTE_ADDR~"};</script>

   <!-- Yandex.Metrika counter -->
   <script type="text/javascript" >
       (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
           m[i].l=1*new Date();
           for (var j = 0; j < document.scripts.length; j++) {if (document.scripts[j].src === r) { return; }}
           k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
       (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

       ym(95915045, "init", {
           params:window.yaParams,
           clickmap:true,
           trackLinks:true,
           accurateTrackBounce:true,
           webvisor:true,
           ecommerce:"dataLayer"
       });
   </script>
   <noscript><div><img src="https://mc.yandex.ru/watch/95915045" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
   <!-- /Yandex.Metrika counter -->

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-HXRK60M40D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-HXRK60M40D');
</script>


~~/if~