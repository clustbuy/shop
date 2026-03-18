self.amount_minus = function (guid, data, event) {
	var minAmount = 1;

	if (data.product_amount() <= minAmount) {
		return;
	} else {

		for (var i = 0; i < self.cart().items().length; i++) {

			if (self.cart().items()[i] == data) {
				self.cart().items()[i].product_amount(Number(self.cart().items()[i].product_amount()) - 1);
				// self.cart().items()[i].product_price(1);
			}

		};

		self.update_amount(guid, data.product_amount());
		//self.update_cost(data);
		
	}

	// self.calculate_cost();
};
