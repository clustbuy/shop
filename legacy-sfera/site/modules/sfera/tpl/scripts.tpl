<!-- KnockoutJS Library -->
<script src="/js/knockoutjs/dist/knockout.js"></script>
<!-- KnockoutJS Mapping Plugin (для автоматического преобразования данных) -->
<script src="/js/knockout-mapping/knockout.mapping.js"></script>
<script>
// console.log('=== KnockoutJS Loaded ===');
// console.log('Knockout version:', ko.version);
// console.log('Knockout Mapping:', typeof ko.mapping !== 'undefined' ? 'loaded' : 'not loaded');
// console.log('========================');
</script>
<!-- jQuery (нужен для AJAX запросов в модульных моделях) -->
<script src="/js/jquery.min.js"></script>
<!-- Cart Counter ViewModel (global for all pages) -->
<script src="/assets/sfera/js/cart-counter.js"></script>
<!-- Favorites Counter ViewModel (global for all pages) -->
<script src="/assets/sfera/js/favorites-counter.js"></script>
<!-- Модульная модель корзины (старый подход с ko.mapping и прототипным наследованием) -->
~~include file="models/cart_new/model_cart.js.tpl"~
<!-- Модульная модель избранного (старый подход с ko.mapping и прототипным наследованием) -->
~~include file="models/favorites/model_favorites.js.tpl"~

