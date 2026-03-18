self.put_into_cart = function (item) {

    console.log('put_into_cart');
    self.cart().items.push(ko.mapping.fromJS(item));
    self.update_cart();
};