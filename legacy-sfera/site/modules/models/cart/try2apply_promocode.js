
self.try2apply_promocode = async function(){

	if(self.promocode_input().trim() == '') {
		toastr.info('Пожалуйста введите промокод');
		return;
	}

	var is_promo_good = false;
	
	return await $.post({
		url: '/cart/',
		data: {
			task: 'save_promocode', 
			promocode: self.promocode_input().trim()
		},
		dataType : "json",
		success: function (data) {
			console.log(data);
			is_promo_good = !!data?.result
			if (is_promo_good) {
				self.discount(Number.parseInt(data[0].discount))
				toastr.info('Промокод применен');
				self.update_cart();
				model_cart.is_promo_ok(is_promo_good)
				if (model_cart.is_promo_ok) {
					self.promocode(self.promocode_input())
				}
				return Promise.resolve(self.discount())
			} else {
				toastr.error('Промокод не действителен');
				return Promise.reject('Промокод не действителен')
			}
		},
		error: function(a,b){
			console.log(a);
			console.log(b);
			is_promo_good = false
			toastr.error('Неизвестная ошибка');
			return Promise.reject('Неизвестная ошибка')
		} 
	});
};
