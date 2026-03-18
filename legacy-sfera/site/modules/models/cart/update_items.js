
self.update_items = function(items){
    console.log("self.update_items");
    self.cart().items.removeAll();
    self.cart().items(ko.mapping.fromJS(items)());
    self.update_cart();
};