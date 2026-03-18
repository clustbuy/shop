
self.update_cart_item = function (guid, newamount, data, event) {

	var update_cart_item = function () {

		var pars = {
			task: 'update_item',
			item: JSON.stringify({

				guid: self.item().guid(),
				product_price: self.item().cost(),
				product_amount: newamount == 'auto' ? self.item().amount() : newamount,
			})
		};
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

		console.log('update_cart_item');

	};
	update_cart_item();

};

