function put_item(guid, id_cat) {

	var d = new Date();

	var pars = {

		task: 'put_item',

		item: {
			guid: guid,
			alias: Items[guid].alias,
			product_price: Items[guid].total_sum,
			product_amount: Items[guid].amount,
			bonus: Items[guid].bonus
		}

	};


	console.log(Items[guid]);

	//сначала пишем в модель
	model_cart.put_into_cart(pars.item);

	//затем пишем на сервер
	$.ajax({

		type: "POST",
		url: '/cart/',
		data: pars,
		dataType: "json",
		success: function (data, textStatus) {

			console.log(data);

			// преобразование к массиву
			var items = (function () {

				var results = [];
				for (var key in data.items) {

					if (!data.items.hasOwnProperty(key)) continue;
					results.push(data.items[key]);

				}
				return results;

			})();

			model_cart.update_items(items);

		}
	});

}