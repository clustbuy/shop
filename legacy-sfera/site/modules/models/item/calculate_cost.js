self.calculate_cost = function (event) {
    let cost = self.default_cost;

    if (self.item().opt_prices) {
        self.item().opt_prices().forEach(function (data) {
            if (self.amount() >= data.amount()) {
                cost = data.cost();
            }
        });
    }

    self.item().cost(cost);
    self.total_cost(cost * self.amount());
};
