
self.hide_modal_constructor = function(model_component, data, event){

	(function(){

		if(!model_component) return;

		var model_cart_item = (function(){

			var id = model_component.params.viewmode_params.guid();

			for(var i=0; i<model_cart.cart().items().length; i++) {
				if(model_cart.cart().items()[i].guid() == id)
					return model_cart.cart().items()[i];
			}

		})();

		if(!model_cart_item) return;

		if(model_component.item().cat.breadcrumbs()[0].alias() == 'wok') {
			model_cart_item.sauce(model_component.item().sauces.choosen().guid());
		}

		model_cart_item.product_type(model_component.item().choosen_type().num());

		model_component.item().amount(model_cart_item.product_amount());

		model_component.update_cart_item(model_cart_item.guid(), 'auto', null, null);

	})();

	(function(){

		self.is_modal_cunstructor_visible(false);

		self.save_and_unload_component({
			class_target: 			'.modal-window-constructor .stopbinding .constructor-wrapper',
			class_inside_target: 	'.constructor',
			viewmode:             	'cartconstructor',
			params:       {
				show_controls: 1
			}
		});

	})();

};
