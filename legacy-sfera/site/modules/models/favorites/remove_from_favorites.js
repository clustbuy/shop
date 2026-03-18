// Удаление товара из избранного
self.remove_from_favorites = function (productId, data, event) {
    var pars = {
        task: "remove_item",
        product_id: productId
    };

    $.ajax({
        type: "POST",
        url: '/favorites/',
        data: pars,
        dataType: "json",
        success: function (responseData, textStatus) {
            // Обновляем глобальную переменную server_favorites
            if (typeof server_favorites === 'undefined') {
                window.server_favorites = {data: {}};
            }
            if (responseData) {
                server_favorites.data = responseData;
            }
            
            // Обновляем избранное из ответа сервера
            if (responseData && responseData.items) {
                self.favorites(ko.mapping.fromJS(responseData));
                self.update_favorites();
            }
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(responseData);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error removing item from favorites:', error);
        }
    });
    
    // Удаляем из локальной модели
    var items = self.favorites().items();
    if (items && items[productId]) {
        delete items[productId];
        self.favorites().items(items);
    }
    
    self.update_favorites();
};

