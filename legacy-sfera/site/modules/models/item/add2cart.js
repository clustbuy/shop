self.add2cart = function (btn, data, event) {
	var amount = self.amount();

	var item = (function () {
		for (var i = 0; i < model_cart.cart().items().length; i++) {
			if (model_cart.cart().items()[i].guid() == self.item().guid()) {
				return model_cart.cart().items()[i];
			}
		}
	})();

	if (window.red_balls_queue && window.red_balls_queue.length > 0 && !item) {
		return;
	}

	var add2cart = function () {
		window.item = self.item();
		var pars = {
			task: 'put_item',
			item: JSON.stringify({
				guid: self.item().guid(),
				product_price: self.item().cost(),
				product_amount: amount
			})
		};


		console.log(pars.item);
		console.log('add2cart');

		$.ajax({
			type: "POST",
			url: '/cart/',
			data: pars,
			dataType: "json",
			success: function (data, textStatus) {
				var items = (function () {
					var results = [];
					for (var key in data.items) {

						if (!data.items.hasOwnProperty(key)) continue;
						results.push(data.items[key]);

						if (window.red_balls_queue) {
							$(window.red_balls_queue[0]).remove();
							window.red_balls_queue.shift();
						}

					}
					return results;
				})();
				model_cart.update_items(items);
			},
			error: function () {

				if (window.red_balls_queue) {
					$(window.red_balls_queue[0]).remove();
					window.red_balls_queue.shift();
				}

			}
		});


		console.log(Items[self.item().guid()]);


	};


	// 3. Организовать анимацию отправки в корзину

	var flyCart = $('<span class="flycart">+' + amount + '</span>');

	var flyCoordinatesX = event.pageX,
		flyCoordinatesY = event.pageY,
		cartCoordinatesX = $('.to_cart').offset().left,
		cartCoordinatesY = $('.to_cart').offset().top;

	if (cartCoordinatesX == 0) {
		cartCoordinatesX = $(window).width() - 40;
	}

	flyCart.css({
		'left': flyCoordinatesX - 12,
		'top': flyCoordinatesY - 12,
		'z-index': 1000
	});

	$('body').append(flyCart);

	if (!window.red_balls_queue) window.red_balls_queue = [];
	window.red_balls_queue.push(flyCart);

	console.log('flyCart');

	flyCart.animate({
			'left': cartCoordinatesX,
			'top': cartCoordinatesY
		},
		{
			duration: 1500, // продолжительность анимации
			easing: "linear", // скорость анимации
			complete: function(){ // callback

				setTimeout(function () {

					// Если item == undefined, применить add2cart
					if (!item) add2cart();

					// Если же нет, применить update_cart_item
					else {

						// Увеличить amount позиции item на amount
						var newamount = +item.product_amount() + Number(amount);

						// Применить update_cart_item
						self.update_cart_item(item.guid(), newamount, null, null);

					}

					$('.flycart').remove();

				}, 1500);

				//$(".status").text("Анимация завершена");
			},
			queue: false // не ставим в очередь
		});





