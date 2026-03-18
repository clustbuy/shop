
self.show_modal_constructor = function (model_cart_item, data, event) {

	self.hide_modal_constructor();

	var modal = document.getElementsByClassName('modal-window-constructor')[0];

	var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;

	var browser_metrics = getBrowserWindowMetrics();

	var top = (function () {

		if (browser_metrics.width <= 768)
			return +scrollTop + 82;

		else {

			if (scrollTop > 100)
				return +scrollTop + 82; //getBrowserWindowMetrics().height*0.15;

			else
				return +scrollTop + 82 + (103 - scrollTop);

		}

	})();

	// 6] Позиционировать окно по Y
	$(modal).css('top', top);

	// 7] Загрузить компонент (конструктор) и данные в него
	self.load_component({
		class_target: '.modal-window-constructor .constructor-wrapper',
		class_inside_target: '.constructor',
		viewmode: 'cartconstructor',
		params: {
			show_controls: 1,
			model_cart_item: model_cart_item,
			guid: data.guid()
		}
	});

	setTimeout(function () {

		var model_component = kocomponents.items[model_cart_item.guid()];

		self.is_modal_cunstructor_visible(true);

		setTimeout(function () {
			$('select').styler();
		}, 50);

	}, 10);

};

