self.total_cart_amount = ko.pureComputed({
    read: function () {
        var total_amount = 0;
        for (var i = 0; i < self.cart().items().length; i++) {
            total_amount = total_amount + Number(self.cart().items()[i].product_amount());
        }
        return total_amount;
    }
});

