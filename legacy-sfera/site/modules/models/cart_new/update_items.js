// Обновление списка товаров
self.update_items = function(items){
    // console.log("update_items", items);
    
    // Преобразуем массив в объект для совместимости
    var itemsObj = {};
    if (Array.isArray(items)) {
        for (var i = 0; i < items.length; i++) {
            var item = items[i];
            var guid = item.id || item.guid || item.product_id;
            if (guid) {
                itemsObj[guid] = item;
            }
        }
    } else if (typeof items === 'object') {
        itemsObj = items;
    }
    
    // Обновляем корзину через ko.mapping
    // ko.mapping создает observable объект для items, поэтому используем ko.mapping.fromJS с target
    var currentCart = self.cart();
    var updatedCartData = {items: itemsObj};
    // Используем ko.mapping.fromJS с target для обновления существующего объекта
    var updatedCart = ko.mapping.fromJS(updatedCartData, {}, currentCart);
    self.cart(updatedCart);
    self.update_cart();
};

