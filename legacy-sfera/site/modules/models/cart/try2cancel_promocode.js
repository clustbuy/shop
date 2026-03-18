
self.try2cancel_promocode = function (data, event) {

	self.promocode('');
	self.promocode_input('');
	model_cart.is_promo_ok(false);
	toastr.info('Промокод отменён');

	var pars = {
		task: 'del_promocode'
	};

	$.ajax({

		type: "POST",
		url: '/cart/',
		data: pars,
		dataType: "json",
		success: function (data, textStatus) {

			console.log(data);
			self.update_cart();
			location.reload();
			//

		}
	});


};
