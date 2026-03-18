// Уменьшение количества товара
self.amount_minus = function (guid, data, event) {
    // data может быть item объектом из KnockoutJS
    var item = data;
    var currentAmount = 1;
    
    if (item) {
        // Если передан item, используем его данные
        // product_amount может быть observable, поэтому используем ko.unwrap
        var productAmountValue = ko.unwrap(item.product_amount);
        if (productAmountValue === undefined || productAmountValue === null) {
            // Если observable еще не инициализирован, пытаемся получить из исходных данных
            var itemUnwrapped = ko.unwrap(item) || item;
            productAmountValue = itemUnwrapped.product_amount;
        }
        currentAmount = parseInt(productAmountValue || 1) || 1;
    } else {
        // Иначе ищем в cart
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
        
        if (itemsObj && itemsObj[guid]) {
            var cartItem = itemsObj[guid];
            var itemUnwrapped = ko.unwrap(cartItem) || cartItem;
            currentAmount = parseInt(itemUnwrapped.product_amount || 1) || 1;
        }
    }
    
    if (currentAmount > 1) {
        var newAmount = currentAmount - 1;
        self.update_amount(guid, newAmount);
    } else {
        // Если количество становится 0, удаляем товар
        self.remove_from_cart(guid, data, event);
    }
};

