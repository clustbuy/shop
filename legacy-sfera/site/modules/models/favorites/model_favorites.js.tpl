<script>

// Инициализация server_favorites если не определена (для страниц, где она не инициализирована)
if (typeof server_favorites === 'undefined') {
    var server_favorites = {
        data: {items: {}, count: 0}
    };
}

var FavoritesModel = {
    constructor: function(){
        var self = this;
        
        // Инициализация избранного через ko.mapping для автоматического преобразования
        var favoritesData = (typeof server_favorites !== 'undefined' && server_favorites.data) ? server_favorites.data : {items: {}, count: 0};
        self.favorites = ko.observable(ko.mapping.fromJS(favoritesData)).extend({ deferred: true });
        
        // Вычисляемые свойства - количество товаров
        self.favorites_count = ko.pureComputed({
            read: function () {
                var items = self.favorites().items();
                var count = 0;
                for (var key in items) {
                    if (items.hasOwnProperty(key)) {
                        count++;
                    }
                }
                return count;
            }
        });
        
        // Форматированное количество товаров
        self.formatted_favorites_count = ko.pureComputed({
            read: function () {
                var count = self.favorites_count();
                if (count === 0) return '';
                if (count === 1) return '1';
                return count.toString();
            }
        });
        
        // Включение модульных методов через Smarty includes
        ~~include file="models/favorites/add_to_favorites.js"~
        ~~include file="models/favorites/remove_from_favorites.js"~
        ~~include file="models/favorites/clear_favorites.js"~
        ~~include file="models/favorites/update_items.js"~
        ~~include file="models/favorites/update_favorites.js"~
        ~~include file="models/favorites/refresh_favorites.js"~
        
        // Инициализация
        ko.computed(function(){
            if (!ko.computedContext.isInitial())
                return;
            // Инициализация завершена
        });
        
        return self;
    }
};

// Создание экземпляра модели через прототипное наследование
var model_favorites = Object.create(FavoritesModel).constructor();

// Множественные applyBindings к разным элементам страницы
// Используем setTimeout, чтобы счетчики успели применить свои bindings первыми
$(document).ready(function(){
    // Ждем, чтобы счетчики успели применить свои bindings
    setTimeout(function() {
        // Функция для проверки, не является ли элемент счетчиком или не содержит счетчиков
        function isCounterElement(element) {
            var $el = $(element);
            // Проверяем сам элемент
            if ($el.hasClass('cart-counter') || 
                $el.hasClass('mobile-cart-counter') || 
                $el.hasClass('favorites-counter')) {
                return true;
            }
            // Проверяем, содержит ли элемент счетчики внутри
            if ($el.find('.cart-counter, .mobile-cart-counter, .favorites-counter').length > 0) {
                return true;
            }
            return false;
        }
        
        // Функция для безопасного применения bindings (проверяет, не применены ли уже bindings)
        function safeApplyBindings(viewModel, element) {
            try {
                // Проверяем, не применены ли уже bindings к этому элементу
                if (ko.dataFor(element) !== undefined) {
                    // console.log('Bindings already applied to element, skipping:', element);
                    return;
                }
                // Проверяем, не содержит ли элемент счетчики с уже примененными bindings
                var $el = $(element);
                var hasBoundCounters = false;
                $el.find('.cart-counter, .mobile-cart-counter, .favorites-counter').each(function() {
                    if (ko.dataFor(this) !== undefined) {
                        hasBoundCounters = true;
                        return false; // break
                    }
                });
                if (hasBoundCounters) {
                    // console.log('Element contains counters with bindings, skipping:', element);
                    return;
                }
                ko.applyBindings(viewModel, element);
            } catch (e) {
                console.error('Error applying bindings:', e, element);
            }
        }
        
        // Применяем bindings к элементам с классом .favorites (исключая счетчики)
        $('.favorites').each(function(){
            if (!isCounterElement(this)) {
                safeApplyBindings(model_favorites, this);
            }
        });
        
        // Применяем bindings к элементам с классом .favorites-page
        $('.favorites-page').each(function(){
            if (!isCounterElement(this)) {
                safeApplyBindings(model_favorites, this);
            }
        });
        
        // НЕ применяем bindings к .favorites-counter - у них свой ViewModel (favoritesCounterViewModel)
    }, 100); // Задержка 100ms, чтобы счетчики успели применить свои bindings
});

// Делаем модель доступной глобально для отладки
window.model_favorites = model_favorites;
window.favorites = model_favorites; // Короткий алиас

// console.log('Favorites Model initialized. Available as: model_favorites, window.model_favorites, favorites, window.favorites');

</script>

