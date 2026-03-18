
self.total_cart_sum = ko.pureComputed({
    read: function () {
        var total_sum = 0;
        for (var i = 0; i < self.cart().items().length; i++) {
            total_sum = total_sum + Number(self.cart().items()[i].cost() * self.cart().items()[i].product_amount());
        }
        total_sum = total_sum - self.cart_discount();
        return Math.round(total_sum  * 100) / 100;
    }
});
