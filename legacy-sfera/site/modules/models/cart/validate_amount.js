self.validate_amount = function (guid, data, event) {

    console.log('validate');
    
    //console.log(data.guid());

    var minAmount = Items[data.guid()].wholesale_amount ? Number(Items[data.guid()].wholesale_amount) : 1;

    if (data.product_amount() < minAmount) {

        for (var i = 0; i < self.cart().items().length; i++) {
            if (self.cart().items()[i] == data) {
                self.cart().items()[i].product_amount(minAmount);
            }
        };

        self.update_amount(guid, data.product_amount());
    }
};
