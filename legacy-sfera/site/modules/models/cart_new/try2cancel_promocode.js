// Отмена промокода
self.try2cancel_promocode = function(){
    var pars = {
        task: "del_promocode"
    };

    $.ajax({
        type: "POST",
        url: '/cart/',
        data: pars,
        dataType: "json",
        success: function(data, textStatus){
            // Обновляем глобальную переменную server_cart
            if (typeof server_cart === 'undefined') {
                window.server_cart = {data: {}};
            }
            if (data) {
                server_cart.data = data;
            }
            
            // Обновляем корзину из ответа сервера
            if (data) {
                // Используем ko.mapping.fromJS с target для обновления существующего объекта
                var currentCart = self.cart();
                var updatedCart = ko.mapping.fromJS(data, {}, currentCart);
                self.cart(updatedCart);
            }
            
            self.promocode('');
            self.promocode_input('');
            self.promocode_applied(false);
            self.promocode_message('');
            self.update_cart();
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error canceling promo code:', error);
        }
    });
};

