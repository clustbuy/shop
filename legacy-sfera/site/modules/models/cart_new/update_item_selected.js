// Обновление состояния selected для товара
self.update_item_selected = function (guid, selected) {
    var pars = {
        task: "update_item_selected",
        guid: guid,
        selected: selected ? 1 : 0
    };

    $.ajax({
        type: "POST",
        url: '/cart/',
        data: pars,
        dataType: "json",
        success: function (data, textStatus) {
            // Обновляем глобальную переменную server_cart
            if (typeof server_cart === 'undefined') {
                window.server_cart = {data: {}};
            }
            if (data) {
                server_cart.data = data;
            }
            
            // Обновляем корзину из ответа сервера
            if (data) {
                // Устанавливаем флаг, чтобы предотвратить повторный вызов subscribe
                // при программном обновлении selected из ответа сервера
                if (!self._updatingSelected) {
                    self._updatingSelected = {};
                }
                self._updatingSelected[guid] = true;
                
                // Используем ko.mapping.fromJS с target для обновления существующего объекта
                var currentCart = self.cart();
                var updatedCart = ko.mapping.fromJS(data, {}, currentCart);
                self.cart(updatedCart);
                
                // НЕ обновляем item.selected вручную из ответа сервера,
                // так как ko.mapping уже обновил данные в cart(), и если мы обновим item.selected,
                // это вызовет subscribe снова, создав бесконечный цикл.
                // Значение selected уже правильное (мы только что отправили его на сервер),
                // поэтому просто обновляем общее состояние корзины.
                
                self.update_cart();
                
                // Снимаем флаг после небольшой задержки, чтобы дать время для обновления
                setTimeout(function() {
                    if (self._updatingSelected) {
                        self._updatingSelected[guid] = false;
                    }
                }, 100);
            }
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error updating item selected:', error);
        }
    });
};

