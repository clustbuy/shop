self.amount_minus = function () {
	var amountMin = self.item().wholesale_amount() ? Number(self.item().wholesale_amount()) : 1;

	let amount = Number(self.amount()) - amountMin
	if (amount < amountMin) return;
	self.amount(amount);

	self.calculate_cost();
};
