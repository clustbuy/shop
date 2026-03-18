self.amount_plus = function (event) {
	const addingQuantity = Number.parseInt(self.item().wholesale_amount())
	const amount = Number(self.amount()) + addingQuantity
	if (amount <= Number.parseInt(self.item().available_quantity())) {
		self.amount(amount);
		self.calculate_cost();
	}
};
