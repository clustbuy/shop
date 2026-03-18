self.amount_plus = function (guid, data, event) {

	//data.product_amount(Number(data.product_amount()) + 1);

	for (var i = 0; i < self.cart().items().length; i++) {

		if (self.cart().items()[i].guid() == guid) {

			console.log(self.cart().items()[i].product_amount());

			self.cart().items()[i].product_amount(Number(self.cart().items()[i].product_amount()) + 1);

			console.log(data.product_amount());

			self.update_amount(self.cart().items()[i].guid(), data.product_amount()); // отправка количества на сервер
			//self.update_cost(data);
			//self.update_cart();

		}

	}

	//console.log(self.cart().items()[0].product_amount());
	//obj.product_amount(Number(obj.product_amount()) + 1);

};
