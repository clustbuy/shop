// Обновление списка товаров
self.update_items = function(items){
    // console.log("update_items", items);
    
    // Преобразуем массив в объект для совместимости
    var itemsObj = {};
    if (Array.isArray(items)) {
        for (var i = 0; i < items.length; i++) {
            var item = items[i];
            var id = item.id || item.product_id;
            if (id) {
                itemsObj[id] = item;
            }
        }
    } else if (typeof items === 'object') {
        itemsObj = items;
    }
    
    // Обновляем избранное через ko.mapping
    var currentFavorites = self.favorites();
    currentFavorites.items(ko.mapping.fromJS(itemsObj));
    self.favorites(currentFavorites);
    self.update_favorites();
};

