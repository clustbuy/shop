// Добавление товара в избранное
self.add_to_favorites = function (productId) {
    var pars = {
        task: "add_item",
        product_id: productId
    };

    $.ajax({
        type: "POST",
        url: '/favorites/',
        data: pars,
        dataType: "json",
        success: function (data, textStatus) {
            // Обновляем глобальную переменную server_favorites
            if (typeof server_favorites === 'undefined') {
                window.server_favorites = {data: {}};
            }
            if (data) {
                server_favorites.data = data;
            }
            
            // Обновляем избранное из ответа сервера
            if (data && data.items) {
                self.favorites(ko.mapping.fromJS(data));
                self.update_favorites();
            }
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(data);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error adding item to favorites:', error);
        }
    });
};

