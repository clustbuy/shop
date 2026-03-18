// Обновление цены доставки (для checkout)
self.update_delivery_price = function(method) {
    self.delivery_method(method);
    
    if (method === 'pickup') {
        self.delivery_price(0);
    } else if (method === 'courier') {
        self.delivery_price(200);
    } else if (method === 'express') {
        self.delivery_price(500);
    }
};

