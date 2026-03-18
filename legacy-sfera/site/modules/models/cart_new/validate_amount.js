// Валидация количества товара
self.validate_amount = function (data, event) {
    var guid = ko.unwrap(data.id) || ko.unwrap(data.guid);
    if (!guid && event && event.target) {
        // Пытаемся получить guid из data-bind или других источников
        var $target = $(event.target);
        var $item = $target.closest('[data-id]');
        if ($item.length) {
            guid = $item.attr('data-id');
        }
    }
    
    if (!guid) {
        console.error('validate_amount: guid not found');
        return;
    }
    
    var value = parseInt(event.target.value) || 1;
    var maxQuantity = parseInt(ko.unwrap(data.max_quantity) || ko.unwrap(data.quantity) || 99) || 99;
    
    if (value < 1) {
        value = 1;
        event.target.value = 1;
    } else if (value > maxQuantity) {
        value = maxQuantity;
        event.target.value = maxQuantity;
    }
    
    self.update_amount(guid, value);
};

