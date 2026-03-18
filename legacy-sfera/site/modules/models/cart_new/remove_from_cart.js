// Удаление товара из корзины
self.remove_from_cart = function (guid, data, event) {
    var pars = {
        task: "delete_product",
        guid: guid
    };

    $.ajax({
        type: "POST",
        url: '/cart/',
        data: pars,
        dataType: "json",
        success: function (responseData, textStatus) {
            // Обновляем глобальную переменную server_cart
            if (typeof server_cart === 'undefined') {
                window.server_cart = {data: {}};
            }
            if (responseData) {
                server_cart.data = responseData;
            }
            
            // Обновляем корзину из ответа сервера
            if (responseData) {
                // Используем ko.mapping.fromJS для полного обновления корзины
                // Важно: создаем новый объект, а не обновляем существующий, чтобы computed observables пересчитались
                var updatedCart = ko.mapping.fromJS(responseData);
                self.cart(updatedCart);
                
                // Принудительно обновляем computed observable items()
                // Это необходимо, так как ko.pureComputed может не заметить удаление ключа из объекта
                if (self.items && typeof self.items === 'function') {
                    // Вызываем items() чтобы заставить его пересчитаться
                    self.items();
                }
                
                self.update_cart();
            }
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(responseData);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error removing item from cart:', error);
        }
    });
    
    // Обновление корзины происходит через ko.mapping.fromJS в success callback
    // Локальное удаление не требуется, так как данные обновляются с сервера
};

