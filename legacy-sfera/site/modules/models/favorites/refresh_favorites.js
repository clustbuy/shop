// Обновление данных избранного с сервера
self.refresh_favorites = function() {
    $.ajax({
        type: "POST",
        url: '/favorites/',
        data: {
            task: "get_favorites"
        },
        dataType: "json",
        success: function(data, textStatus){
            // Обновляем глобальную переменную server_favorites
            if (typeof server_favorites === 'undefined') {
                window.server_favorites = {data: {}};
            }
            if (data) {
                server_favorites.data = data;
            }
            
            // Обновляем избранное из ответа сервера
            if (data) {
                self.favorites(ko.mapping.fromJS(data));
                self.update_favorites();
            }
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(data);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error refreshing favorites:', error);
        }
    });
};

