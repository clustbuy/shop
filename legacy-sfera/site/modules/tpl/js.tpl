

        <!-- Link Swiper's-->

        ~~**~<link rel="stylesheet" href="/js/swiper/swiper-bundle.min.css" />
        <script src="/js/swiper/swiper-bundle.min.js"></script>



<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.formstyler.min.js"></script>
<script src="/js/jquery.maskedinput.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<script src="/js/jquery.easyzoom.min.js"></script>
<script src="/js/jquery.zoom.min.js"></script>
<script src="/js/jquery.lazyload.js"></script>
~~*<script src="/js/owl.carousel.min.js"></script>*~
<script type="text/javascript" src="/site/libs/fancybox/jquery.fancybox.pack.js"></script>
<script src="/js/md5.js"></script>
<script src="/js/main.js"></script>
<script src="/js/category/put_item.js"></script>

<script src="/js/knockoutjs/dist/knockout.js"></script>
<script src="/js/knockout-mapping/build/output/knockout.mapping-latest.js"></script>
<script>
    ko.bindingHandlers.stopBinding = {
            init: function() {
                    return { controlsDescendantBindings: true };
            }
    };
</script>

<script src="/js/library.js"></script>

<script src="/js/toastr/toastr.min.js"></script>
<script src="/js/toastr_configuration.js"></script>

<script src="/js/category/get_ingr_ko.js"></script>

<script src="/js/category/on_resize_close_popup_box_ko.js"></script>


 <script>
    var menu_button = 0;

    var page_focus = false;

    var server_cart = {};
    var user_discount;

    ~~if $cart|@count >0~
    server_cart.data                   =  ~~json_encode str=$cart~;
    ~~else~
    server_cart.data                   =  {total_cart_sum:0,total_cart_amount:0, items:[]};
    ~~/if~

    user_discount =  ~~json_encode str=$user.discount.val~ | 0;

    // преобразование к массиву
    var items_new = (function(){

        var results = [];
        for (var key in server_cart.data.items) {

            if (!server_cart.data.items.hasOwnProperty(key))
                continue;
            results.push(server_cart.data.items[key]);

        }
        return results;

    })();
    server_cart.data.items = items_new;
        server_cart.minsum = ~~if $filial.minimal != ''~ ~~$filial.minimal~ ~~else~ 0 ~~/if~;


</script>


~~include file="models/cart/model_cart.js.tpl"~
~~include file="models/search/model_search.js.tpl"~

~~*
<script src="/js/model_ingr.js"></script>
*~

~~*include file="ko_components/item/model.js.tpl"*~


~~if $debug == 1~
~~debug~
~~/if~

<script>
// Функция для эмуляции клика
function eventFire(el, etype){
  if (el.fireEvent) {
    el.fireEvent('on' + etype);
  } else {
    var evObj = document.createEvent('Events');
    evObj.initEvent(etype, false, false);
    el.dispatchEvent(evObj);
  }
}
</script>

<script>
    $(document).ready(function(){


                $('#login_form').on('submit', function (e){

                    e.preventDefault();

                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        data: $(this).serialize(),
                        cache: false,
                        error: function (jqXHR, textStatus, errorThrown) {
                            toastr.info('Нет связи с сервером1:'+textStatus);
                        },
                        success: function (data, textStatus, jqXHR) {
                            //console.log(data);
                            toastr.info(data.message);
                            if(data.result) {
                                setTimeout(function (){
                                    if(/unset=user/.test(window.location.search)) {
                                        window.location.href="/";
                                    }
                                    else {
                                        window.location.reload();
                                    }
                                },1000);
                            }
                            else {
                                toastr.info(data.message);
                            }
                        }
                    });

                });

    });


    function numberWithSpaces(x) {

        var x = Math.trunc(x);
        return number_format(x, 0, '.', ' ');

    }

    function number_format(number, decimals, dec_point, thousands_sep) {
        // Strip all characters but numerical ones.
        number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function (n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }




</script>
