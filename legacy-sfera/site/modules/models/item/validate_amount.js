self.validate_amount = function (event, el) {
    var inputQuantity = Number.parseInt(el.target.value)
    if (!inputQuantity) {
        inputQuantity = 0
    }
    var amountMin = self.item().wholesale_amount() ? Number(self.item().wholesale_amount()) : 1;
    if (inputQuantity === 0) {
        self.amount(amountMin)
        el.target.value = amountMin
        self.calculate_cost();
        return
    }
    let availableQuantity = Number.parseInt(self.item().available_quantity())
    let canTakeAll = availableQuantity % amountMin === 0
    let maxAvailableToOrder = canTakeAll ? availableQuantity : availableQuantity - (availableQuantity - amountMin)
    let amount = 0
    if (inputQuantity <= amountMin) {
        amount = amountMin
    } else if (inputQuantity >= availableQuantity) {
        amount = maxAvailableToOrder
    } else {
       amount = inputQuantity
    }
    
    self.amount(amount)
    el.target.value = amount
    self.calculate_cost();
};
