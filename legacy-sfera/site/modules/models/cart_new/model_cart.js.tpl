<script>

// Инициализация server_cart если не определена (для страниц, где она не инициализирована)
if (typeof server_cart === 'undefined') {
    var server_cart = {
        data: {items: {}, total_cart_sum: 0, total_cart_amount: 0, cart_sum: 0, cart_discount: 0, promocode: ''}
    };
}

var CartModel = {
    constructor: function(){
        var self = this;
        
        // Инициализация корзины через ko.mapping для автоматического преобразования
        var cartData = (typeof server_cart !== 'undefined' && server_cart.data) ? server_cart.data : {items: {}, total_cart_sum: 0, total_cart_amount: 0, cart_sum: 0, cart_discount: 0, promocode: ''};
        // console.log('CartModel constructor - initializing with cartData:', cartData);
        // console.log('Items in cartData:', Object.keys(cartData.items || {}).length);
        self.cart = ko.observable(ko.mapping.fromJS(cartData)).extend({ deferred: true });
        // console.log('Cart initialized. Items in cart:', Object.keys(ko.unwrap(self.cart().items) || {}).length);
        
        // Флаг для предотвращения бесконечного цикла при обновлении selected с сервера
        self._updatingSelected = {};
        
        // Промокод
        self.promocode = ko.observable(ko.unwrap(self.cart().promocode) || '');
        self.promocode_input = ko.observable('');
        // Алиас для совместимости с шаблонами (promoCode вместо promocode_input)
        self.promoCode = self.promocode_input;
        self.promocode_applied = ko.observable(false);
        self.promocode_message = ko.observable('');
        
        // Доставка (для checkout)
        self.delivery_price = ko.observable(0);
        self.delivery_method = ko.observable('pickup');
        
        // Вычисляемые свойства - общая сумма товаров
        // Используем значение из сервера, если оно есть, иначе вычисляем
        self.cart_sum = ko.pureComputed({
            read: function () {
                var cartData = self.cart();
                // Сначала пытаемся получить значение из сервера
                var serverCartSum = parseFloat(ko.unwrap(cartData.cart_sum) || 0) || 0;
                
                // Если значение с сервера есть и больше 0, используем его
                if (serverCartSum > 0) {
                    return serverCartSum;
                }
                
                // Иначе вычисляем вручную
                var sum = 0;
                var itemsObj = null;
                
                // Получаем items из cart (ko.mapping создает observable объект, не функцию)
                if (cartData && typeof cartData === 'object') {
                    if (typeof cartData.items === 'function') {
                        itemsObj = cartData.items();
                    } else if (cartData.items && typeof cartData.items === 'object') {
                        itemsObj = ko.unwrap(cartData.items) || cartData.items;
                    } else if (cartData.items !== undefined) {
                        itemsObj = cartData.items;
                    }
                }
                
                if (itemsObj && typeof itemsObj === 'object' && !Array.isArray(itemsObj)) {
                    for (var key in itemsObj) {
                        if (itemsObj.hasOwnProperty(key)) {
                            var item = itemsObj[key];
                            var itemUnwrapped = ko.unwrap(item) || item;
                            // Проверяем, выбран ли товар (по умолчанию true, если свойство не определено)
                            var isSelected = itemUnwrapped.selected !== undefined ? (typeof itemUnwrapped.selected === 'function' ? itemUnwrapped.selected() : itemUnwrapped.selected) : true;
                            if (isSelected) {
                                var cost = parseFloat(itemUnwrapped.cost || itemUnwrapped.price || 0) || 0;
                                var amount = parseInt(itemUnwrapped.product_amount || 1) || 1;
                                sum = sum + (cost * amount);
                            }
                        }
                    }
                }
                return sum;
            }
        });
        
        // Вычисляемые свойства - скидка
        self.cart_discount = ko.pureComputed({
            read: function () {
                var discount = parseFloat(ko.unwrap(self.cart().cart_discount) || 0) || 0;
                return discount;
            }
        });
        
        // Вычисляемые свойства - общее количество товаров
        self.total_cart_amount = ko.pureComputed({
            read: function () {
                var total_amount = 0;
                var cartData = self.cart();
                var itemsObj = null;
                
                // Получаем items из cart
                if (cartData && typeof cartData === 'object') {
                    if (typeof cartData.items === 'function') {
                        itemsObj = cartData.items();
                    } else if (cartData.items && typeof cartData.items === 'object') {
                        itemsObj = ko.unwrap(cartData.items) || cartData.items;
                    } else if (cartData.items !== undefined) {
                        itemsObj = cartData.items;
                    }
                }
                
                if (itemsObj && typeof itemsObj === 'object' && !Array.isArray(itemsObj)) {
                    for (var key in itemsObj) {
                        if (itemsObj.hasOwnProperty(key)) {
                            var item = itemsObj[key];
                            var itemUnwrapped = ko.unwrap(item) || item;
                            // Проверяем, выбран ли товар (по умолчанию true, если свойство не определено)
                            var isSelected = itemUnwrapped.selected !== undefined ? (typeof itemUnwrapped.selected === 'function' ? itemUnwrapped.selected() : itemUnwrapped.selected) : true;
                            if (isSelected) {
                                var amount = parseInt(itemUnwrapped.product_amount || 1) || 1;
                                total_amount = total_amount + amount;
                            }
                        }
                    }
                }
                return total_amount;
            }
        });
        
        // Вычисляемые свойства - итоговая сумма
        self.total_cart_sum = ko.pureComputed({
            read: function () {
                var total_sum = self.cart_sum() - self.cart_discount();
                return Math.round(total_sum * 100) / 100;
            }
        });
        
        // Форматированная итоговая сумма
        self.formatted_total_cart_sum = ko.pureComputed({
            read: function () {
                return self.total_cart_sum().toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
            }
        });
        
        // Форматированное количество товаров
        self.formatted_total_cart_amount = ko.pureComputed({
            read: function () {
                var count = self.total_cart_amount();
                if (count === 0) return '';
                if (count === 1) return '1';
                return count.toString();
            }
        });
        
        // Преобразование items из объекта в массив для работы с foreach
        // Это computed observable, который преобразует объект items в массив
        // Для checkout страницы фильтруем только selected товары
        // Используем ko.computed вместо ko.pureComputed, чтобы он всегда пересчитывался при изменении структуры объекта
        self.items = ko.computed({
            read: function () {
                var cartData = self.cart();
                var itemsObj = null;
                var isCheckoutPage = $('.checkout-sidebar').length > 0;
                
                // ko.mapping.fromJS() для объекта {items: {}} создает observable объект для items
                // НО это НЕ observable функция, поэтому items() не работает
                // Нужно использовать ko.unwrap() или обращаться напрямую
                if (cartData && typeof cartData === 'object') {
                    // Если items - это observable функция (старый подход с массивом)
                    if (typeof cartData.items === 'function') {
                        itemsObj = cartData.items();
                    } 
                    // Если items - это observable объект (ko.mapping создает observable для объектов)
                    // ko.mapping создает observable объект, но это не функция, поэтому используем ko.unwrap
                    else if (cartData.items !== undefined) {
                        // ko.unwrap правильно обработает и observable, и обычное значение
                        itemsObj = ko.unwrap(cartData.items);
                    }
                }
                
                var itemsArray = [];
                
                // Если items - это объект, преобразуем в массив
                if (itemsObj && typeof itemsObj === 'object' && !Array.isArray(itemsObj)) {
                    for (var key in itemsObj) {
                        if (itemsObj.hasOwnProperty(key)) {
                            var item = itemsObj[key];
                            // Добавляем id в объект товара
                            var itemData = ko.unwrap(item) || item;
                            if (typeof itemData === 'object' && itemData !== null) {
                                // Копируем данные товара
                                var itemCopy = {};
                                for (var prop in itemData) {
                                    if (itemData.hasOwnProperty(prop)) {
                                        var propValue = itemData[prop];
                                        // Если свойство - это observable, получаем его значение
                                        itemCopy[prop] = ko.unwrap(propValue) !== undefined ? ko.unwrap(propValue) : propValue;
                                    }
                                }
                                itemCopy.id = key;
                                itemCopy.guid = key;
                                // Создаем observable для каждого товара через ko.mapping
                                var mappedItem = ko.mapping.fromJS(itemCopy);
                                
                                // Добавляем computed observables для каждого элемента
                                // Используем замыкание для правильной работы с mappedItem
                                (function(item) {
                                    // Сохраняем исходные значения для доступа без рекурсии
                                    var itemName = itemCopy.name || itemCopy.title || '';
                                    var itemImgUrl = itemCopy.img_url || itemCopy.image || '/assets/img/product_empty.jpg';
                                    var itemCost = parseFloat(itemCopy.cost || itemCopy.price || 0) || 0;
                                    var itemAmount = parseInt(itemCopy.product_amount || 1) || 1;
                                    var itemOldPrice = parseFloat(itemCopy.old_price || 0) || 0;
                                    
                                    // productUrl - URL страницы товара
                                    item.productUrl = ko.pureComputed(function() {
                                        var itemId = ko.unwrap(item.id) || ko.unwrap(item.guid) || key;
                                        return '/product/' + itemId + '/';
                                    });
                                    
                                    // image - URL изображения товара (используем сохраненное значение)
                                    item.image = ko.observable(itemImgUrl);
                                    
                                    // name - название товара (используем сохраненное значение)
                                    item.name = ko.observable(itemName);
                                    
                                    // formattedPrice - отформатированная цена за единицу
                                    item.formattedPrice = ko.pureComputed(function() {
                                        // Получаем актуальное значение cost из observable
                                        var price = parseFloat(ko.unwrap(item.cost) || ko.unwrap(item.price) || itemCost) || 0;
                                        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
                                    });
                                    
                                    // formattedTotal - отформатированная общая цена (цена × количество)
                                    item.formattedTotal = ko.pureComputed(function() {
                                        var price = parseFloat(ko.unwrap(item.cost) || ko.unwrap(item.price) || itemCost) || 0;
                                        var amount = parseInt(ko.unwrap(item.product_amount) || itemAmount) || 1;
                                        var total = price * amount;
                                        return total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
                                    });
                                    
                                    // hasDiscount - есть ли скидка
                                    item.hasDiscount = ko.pureComputed(function() {
                                        var oldPrice = parseFloat(ko.unwrap(item.old_price) || itemOldPrice) || 0;
                                        var price = parseFloat(ko.unwrap(item.cost) || ko.unwrap(item.price) || itemCost) || 0;
                                        return oldPrice > 0 && oldPrice > price;
                                    });
                                    
                                    // formattedOldPrice - отформатированная старая цена
                                    item.formattedOldPrice = ko.pureComputed(function() {
                                        var oldPrice = parseFloat(ko.unwrap(item.old_price) || itemOldPrice) || 0;
                                        if (oldPrice > 0) {
                                            return oldPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
                                        }
                                        return '';
                                    });
                                    
                                    // formattedQuantity - отформатированное количество (для checkout)
                                    item.formattedQuantity = ko.pureComputed(function() {
                                        var amount = parseInt(ko.unwrap(item.product_amount) || itemAmount) || 1;
                                        return amount + ' шт.';
                                    });
                                    
                                    // max_quantity - максимальное количество товара (для валидации input)
                                    // Используем observable, чтобы оно обновлялось при изменении данных
                                    var itemMaxQuantity = parseInt(itemCopy.quantity || itemCopy.max_quantity || 99) || 99;
                                    if (!item.max_quantity || typeof item.max_quantity !== 'function') {
                                        item.max_quantity = ko.observable(itemMaxQuantity);
                                    } else {
                                        item.max_quantity(itemMaxQuantity);
                                    }
                                    
                                    // selected - выбран ли товар для заказа (по умолчанию true)
                                    // Если товар не выбран, он не учитывается в расчетах и не попадает в заказ
                                    var itemSelected = itemCopy.selected !== undefined ? itemCopy.selected : true;
                                    if (!item.selected || typeof item.selected !== 'function') {
                                        item.selected = ko.observable(itemSelected);
                                    } else {
                                        // Обновляем значение только если оно отличается от текущего
                                        var currentValue = ko.unwrap(item.selected);
                                        if (currentValue !== itemSelected) {
                                            item.selected(itemSelected);
                                        }
                                    }
                                    
                                    // Подписываемся на изменение selected, чтобы обновлять состояние на сервере
                                    // Важно: subscribe срабатывает только при изменении значения observable
                                    // Если мы обновляем значение программно (из ответа сервера), 
                                    // subscribe тоже сработает, поэтому нужно проверять, не идет ли уже обновление
                                    var itemGuid = ko.unwrap(item.id) || ko.unwrap(item.guid) || key;
                                    if (itemGuid) {
                                        // Инициализируем флаг для этого товара, если его еще нет
                                        if (!self._updatingSelected) {
                                            self._updatingSelected = {};
                                        }
                                        
                                        item.selected.subscribe(function(newValue) {
                                            // Пропускаем, если обновление идет программно (из ответа сервера)
                                            if (self._updatingSelected[itemGuid]) {
                                                return;
                                            }
                                            
                                            // Вызываем обновление на сервере только при ручном изменении пользователем
                                            self.update_item_selected(itemGuid, newValue);
                                        });
                                    }
                                })(mappedItem);
                                
                                // Для checkout страницы показываем только selected товары
                                if (isCheckoutPage) {
                                    var isSelected = ko.unwrap(mappedItem.selected);
                                    if (isSelected === undefined || isSelected === null) {
                                        isSelected = true; // По умолчанию true
                                    }
                                    if (isSelected) {
                                        itemsArray.push(mappedItem);
                                    }
                                } else {
                                    // Для страницы корзины показываем все товары
                                    itemsArray.push(mappedItem);
                                }
                            }
                        }
                    }
                }
                
                // Отладочная информация
                if (itemsArray.length === 0 && itemsObj && typeof itemsObj === 'object' && Object.keys(itemsObj).length > 0) {
                    console.warn('Items object is not empty but array is empty:', itemsObj);
                }
                
                // if (itemsArray.length > 0) {
                //     console.log('items() computed - returning array with', itemsArray.length, 'items', isCheckoutPage ? '(filtered for checkout)' : '(all items)');
                //     console.log('First item:', itemsArray[0]);
                //     console.log('First item name:', ko.unwrap(itemsArray[0].name));
                // }
                
                return itemsArray;
            }
        });
        
        // Выбранные товары (только те, у которых selected === true)
        // Используется на странице checkout для отображения только выбранных товаров
        self.selectedItems = ko.pureComputed({
            read: function () {
                return self.items().filter(function(item) {
                    var isSelected = ko.unwrap(item.selected);
                    return isSelected === true || isSelected === undefined; // По умолчанию true
                });
            }
        });
        
        // Дополнительные computed свойства для совместимости с шаблонами
        self.selectedCount = ko.pureComputed({
            read: function () {
                // Возвращаем количество выбранных товаров
                return self.selectedItems().length;
            }
        });
        
        self.formattedItemsTotal = ko.pureComputed({
            read: function () {
                return self.cart_sum().toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
            }
        });
        
        // Алиас для cart_discount (для совместимости с шаблонами)
        self.discountTotal = ko.pureComputed({
            read: function () {
                return self.cart_discount();
            }
        });
        
        self.formattedDiscountTotal = ko.pureComputed({
            read: function () {
                var discount = self.cart_discount();
                return discount > 0 ? '−' + discount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽' : '0 ₽';
            }
        });
        
        self.formattedGrandTotal = ko.pureComputed({
            read: function () {
                return self.total_cart_sum().toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
            }
        });
        
        self.formattedItemsCount = ko.pureComputed({
            read: function () {
                return '(' + self.total_cart_amount() + ')';
            }
        });
        
        self.canCheckout = ko.pureComputed({
            read: function () {
                return self.total_cart_sum() > 0;
            }
        });
        
        // Форматированная цена доставки (для checkout)
        self.formattedDeliveryPrice = ko.pureComputed({
            read: function () {
                var price = self.delivery_price();
                if (price === 0) {
                    return 'Бесплатно';
                }
                return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ") + ' ₽';
            }
        });
        
        // Включение модульных методов через Smarty includes
        ~~include file="models/cart_new/put_into_cart.js"~
        ~~include file="models/cart_new/remove_from_cart.js"~
        ~~include file="models/cart_new/clear_cart.js"~
        ~~include file="models/cart_new/update_amount.js"~
        ~~include file="models/cart_new/amount_plus.js"~
        ~~include file="models/cart_new/amount_minus.js"~
        ~~include file="models/cart_new/validate_amount.js"~
        ~~include file="models/cart_new/update_items.js"~
        ~~include file="models/cart_new/update_cart.js"~
        ~~include file="models/cart_new/try2apply_promocode.js"~
        ~~include file="models/cart_new/try2cancel_promocode.js"~
        ~~include file="models/cart_new/update_delivery_price.js"~
        ~~include file="models/cart_new/refresh_cart.js"~
        ~~include file="models/cart_new/update_item_selected.js"~
        
        // Алиасы для совместимости с шаблонами
        self.applyPromoCode = self.try2apply_promocode;
        self.removePromoCode = self.try2cancel_promocode;
        
        // Методы для работы с items как с массивом (для совместимости с шаблонами)
        self.removeItem = function(item) {
            var guid = ko.unwrap(item.id) || ko.unwrap(item.guid);
            if (guid) {
                self.remove_from_cart(guid);
            }
        };
        
        self.increaseAmount = function(item) {
            var guid = ko.unwrap(item.id) || ko.unwrap(item.guid);
            if (guid) {
                self.amount_plus(guid, item);
            }
        };
        
        self.decreaseAmount = function(item) {
            var guid = ko.unwrap(item.id) || ko.unwrap(item.guid);
            if (guid) {
                self.amount_minus(guid, item);
            }
        };
        
        self.updateAmount = function(item, event) {
            if (item && event && event.target) {
                self.validate_amount(item, event);
            }
        };
        
        self.clearCart = function() {
            self.clear_cart();
        };
        
        self.checkout = function() {
            window.location.href = '/checkout/';
        };
        
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
var model_cart = Object.create(CartModel).constructor();

// Множественные applyBindings к разным элементам страницы
// Применяем bindings только к конкретным классам, которые не пересекаются со счетчиками
$(document).ready(function(){
    // Применяем bindings к элементам с классом .cart-page (страница корзины)
    $('.cart-page').each(function(){
        if (ko.dataFor(this) === undefined) {
            // console.log('Applying bindings to .cart-page element:', this);
            // console.log('Items count before binding:', model_cart.items().length);
            ko.applyBindings(model_cart, this);
            // console.log('Bindings applied. Items count after binding:', model_cart.items().length);
        } else {
            // console.log('Bindings already applied to .cart-page element');
        }
    });
    
    // Применяем bindings к элементам с классом .checkout-sidebar (боковая панель checkout)
    // ИЛИ к .order-summary внутри .checkout-sidebar (чтобы избежать двойных bindings)
    $('.checkout-sidebar').each(function(){
        var $sidebar = $(this);
        var $orderSummary = $sidebar.find('.order-summary').first();
        
        if ($orderSummary.length > 0) {
            // Применяем bindings к .order-summary внутри .checkout-sidebar
            if (ko.dataFor($orderSummary[0]) === undefined) {
                // console.log('Applying bindings to .order-summary inside .checkout-sidebar');
                // console.log('formattedDeliveryPrice available:', typeof model_cart.formattedDeliveryPrice !== 'undefined');
                ko.applyBindings(model_cart, $orderSummary[0]);
            }
        } else {
            // Если .order-summary не найден, применяем к .checkout-sidebar
            if (ko.dataFor(this) === undefined) {
                // console.log('Applying bindings to .checkout-sidebar element (no .order-summary found)');
                // console.log('formattedDeliveryPrice available:', typeof model_cart.formattedDeliveryPrice !== 'undefined');
                ko.applyBindings(model_cart, this);
            }
        }
    });
    
    // Применяем bindings к элементам с классом .order-summary (сводка заказа)
    // НО только если они НЕ находятся внутри .checkout-sidebar (чтобы избежать двойных bindings)
    $('.order-summary').each(function(){
        var $el = $(this);
        // Пропускаем, если элемент находится внутри .checkout-sidebar (там bindings уже применены)
        if ($el.closest('.checkout-sidebar').length === 0) {
            if (ko.dataFor(this) === undefined) {
                ko.applyBindings(model_cart, this);
            }
        }
    });
    
    // Применяем bindings к отдельным элементам с классами .total_cart_sum, .total_cart_amount
    // (но только если они не находятся внутри счетчиков)
    $('.total_cart_sum, .total_cart_amount').each(function(){
        var $el = $(this);
        // Пропускаем, если элемент находится внутри счетчика
        if ($el.closest('.cart-counter, .mobile-cart-counter, .favorites-counter').length === 0) {
            if (ko.dataFor(this) === undefined) {
                ko.applyBindings(model_cart, this);
            }
        }
    });
});

// Делаем модель доступной глобально для отладки
window.model_cart = model_cart;
window.cart = model_cart; // Короткий алиас

// Проверка доступности свойств модели
// console.log('=== Cart Model Properties Check ===');
// console.log('formattedDeliveryPrice:', typeof model_cart.formattedDeliveryPrice !== 'undefined' ? 'defined' : 'UNDEFINED');
// console.log('formattedItemsTotal:', typeof model_cart.formattedItemsTotal !== 'undefined' ? 'defined' : 'UNDEFINED');
// console.log('formattedGrandTotal:', typeof model_cart.formattedGrandTotal !== 'undefined' ? 'defined' : 'UNDEFINED');
// console.log('formattedItemsCount:', typeof model_cart.formattedItemsCount !== 'undefined' ? 'defined' : 'UNDEFINED');
// console.log('formattedDiscountTotal:', typeof model_cart.formattedDiscountTotal !== 'undefined' ? 'defined' : 'UNDEFINED');
// console.log('canCheckout:', typeof model_cart.canCheckout !== 'undefined' ? 'defined' : 'UNDEFINED');
// console.log('===================================');

// Добавляем вспомогательные методы для отладки
model_cart.getItemsObject = function() {
    var cartData = this.cart();
    if (cartData && typeof cartData === 'object') {
        if (typeof cartData.items === 'function') {
            return cartData.items();
        } else if (cartData.items !== undefined) {
            return ko.unwrap(cartData.items);
        }
    }
    return {};
};

model_cart.getItemsArray = function() {
    return this.items();
};

model_cart.debugCart = function() {
    var cartData = this.cart();
    // console.log('=== Cart Debug Info ===');
    // console.log('cartData:', cartData);
    // console.log('cartData.items:', cartData ? cartData.items : 'N/A');
    // console.log('typeof cartData.items:', cartData ? typeof cartData.items : 'N/A');
    // console.log('ko.unwrap(cartData.items):', cartData ? ko.unwrap(cartData.items) : 'N/A');
    // console.log('server_cart.data:', typeof server_cart !== 'undefined' ? server_cart.data : 'N/A');
    // console.log('items():', this.items());
    // console.log('getItemsObject():', this.getItemsObject());
    // console.log('Object.keys(getItemsObject()):', Object.keys(this.getItemsObject()));
    // console.log('========================');
};

// console.log('Cart Model initialized. Available as: model_cart, window.model_cart, cart, window.cart');
// console.log('Debug methods:');
// console.log('  - model_cart.items() - получить массив товаров (для foreach)');
// console.log('  - model_cart.getItemsObject() - получить объект items (ключ-значение)');
// console.log('  - model_cart.getItemsArray() - получить массив товаров (алиас для items())');
// console.log('  - model_cart.debugCart() - полная отладочная информация');
// console.log('  - ko.unwrap(model_cart.cart().items) - получить значение observable объекта items');

</script>

