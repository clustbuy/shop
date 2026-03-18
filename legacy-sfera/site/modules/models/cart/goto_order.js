
self.goto_order = function () {

	if (+self.total_cart_sum() < server_cart.minsum) {
		toastr.info('Минимальная сумма заказа должна составить ' + server_cart.minsum + ' рублей.');
		return;
	}
	else {
		/*window.location = "/order/";*/
		//console.log(model_cart.gift_in_cart()); return;
		window.location = "/order/";
	}
};
