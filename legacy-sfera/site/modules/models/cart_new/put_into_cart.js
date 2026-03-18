// Добавление товара в корзину
self.put_into_cart = function (item) {
    // console.log('put_into_cart', item);
    
    var itemData = {
        guid: item.id || item.product_id || item.guid,
        product_amount: item.quantity || item.product_amount || 1
    };
    
    $.ajax({
        type: "POST",
        url: '/cart/',
        data: {
            task: "put_item",
            item: JSON.stringify(itemData)
        },
        dataType: "json",
        success: function (data, textStatus) {
            // console.log('=== put_into_cart success ===');
            // console.log('Server response data:', data);
            // console.log('data.items:', data ? data.items : 'N/A');
            // console.log('typeof data.items:', data ? typeof data.items : 'N/A');
            // console.log('Object.keys(data.items):', data && data.items ? Object.keys(data.items) : 'N/A');
            
            // Обновляем глобальную переменную server_cart
            if (typeof server_cart === 'undefined') {
                window.server_cart = {data: {}};
            }
            if (data) {
                server_cart.data = data;
                // console.log('server_cart.data updated:', server_cart.data);
            }
            
            // Обновляем корзину из ответа сервера
            if (data) {
                // Используем ko.mapping.fromJS с target для обновления существующего объекта
                var currentCart = self.cart();
                // console.log('Current cart before update:', currentCart);
                var updatedCart = ko.mapping.fromJS(data, {}, currentCart);
                self.cart(updatedCart);
                self.update_cart();
                // console.log('Cart updated after put_item:', updatedCart);
                // console.log('Items in cart (ko.unwrap):', ko.unwrap(updatedCart.items));
                // console.log('Items array (self.items()):', self.items());
            }
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error adding item to cart:', error);
        }
    });
};

