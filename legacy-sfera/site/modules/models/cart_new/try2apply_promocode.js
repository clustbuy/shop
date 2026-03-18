// Применение промокода
self.try2apply_promocode = async function(){
    if(self.promocode_input().trim() == '') {
        self.promocode_message('Пожалуйста введите промокод');
        return;
    }

    var is_promo_good = false;
    
    return await $.post({
        url: '/cart/',
        data: {
            task: 'save_promocode', 
            promocode: self.promocode_input().trim()
        },
        dataType : "json",
        success: function (data) {
            // console.log('Promo code response:', data);
            is_promo_good = !!data?.result || !!data?.success;
            
            if (is_promo_good) {
                var discount = parseInt(data[0]?.discount || data.discount || 0) || 0;
                
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
                
                self.promocode(self.promocode_input());
                self.promocode_applied(true);
                self.promocode_message('Промокод применен');
                self.update_cart();
                
                // Обновляем глобальный счетчик
                if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                    cartCounterViewModel.updateCount(data);
                }
                
                return Promise.resolve(discount);
            } else {
                self.promocode_applied(false);
                self.promocode_message('Промокод не действителен');
                return Promise.reject('Промокод не действителен');
            }
        },
        error: function(a,b){
            console.error('Error applying promo code:', a, b);
            is_promo_good = false;
            self.promocode_applied(false);
            self.promocode_message('Неизвестная ошибка');
            return Promise.reject('Неизвестная ошибка');
        } 
    });
};

