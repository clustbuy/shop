<script>

(function(){

var component_name = "item";

window.model_item_prototype = { constructor: function(params, componentInfo) {


	console.log(params);
	
	var self = this;
	self.params = ko.mapping.fromJS(params);

	self.component_name = component_name;
	self.component_uid = self.this_component_id;
	self.item = ko.observable('');
	self.viewmode = ko.observable(self.params.viewmode());
	self.amount = ko.observable(1);
	self.amount_name = 'шт.';
	self.default_cost = 0;
	self.total_cost = ko.observable(1);;

	ko.computed(function(){

		if(!ko.computedContext.isInitial()) return;
		if(typeof window[component_name+'_data'] == 'undefined') { window[component_name+'_data'] = {}; }

		if(typeof window[component_name+'_data'].counter == 'undefined')
			window[component_name+'_data'].counter = 1;
		else
			window[component_name+'_data'].counter = +window[component_name+'_data'].counter + 1;

		self.this_component_id = window[component_name+'_data'].counter;

		if(!window.kocomponents) window.kocomponents = {};
		if(!window.kocomponents.items) window.kocomponents.items = {};
		window.kocomponents.items[params.guid] = self;

	});

	~~include file="models/item/plus.js"~

	~~include file="models/item/minus.js"~

	~~include file="models/item/buy1click.js"~

	~~include file="models/item/add2cart.js"~

	~~include file="models/item/amount_minus.js"~

	~~include file="models/item/amount_plus.js"~

	~~include file="models/item/update_cart_item.js"~

	~~include file="models/item/validate_amount.js"~

	~~include file="models/item/calculate_cost.js"~

	self.choose_size = function(data, event) {
		
		//console.log(data.amount());
		//console.log(self.amount());


		self.amount(data.amount());
		self.calculate_cost();


	};


	ko.computed(function(){

		if(!ko.computedContext.isInitial()) return;
		self.item(ko.mapping.fromJS(Items[self.params.id()]));

		// Стоимость за 1 штуку
		self.default_cost = self.item().cost();
		// Минимальное количество для заказа
		self.amount(self.item().wholesale_amount() > 1 ? Number(self.item().wholesale_amount()) : 1);
		// Тип количества. Штука или упаковка.
		self.amount_name = (self.item().pack() && self.item().pack() > 1) ? 'уп.':'шт.';
		// Перерасчёт стоимости с учётом минимальной стоимости
		self.calculate_cost();

		if(self.viewmode() == 'main') {
			$(document).ready(function(){

				var owls = $(".slider.supermobile.owl-carousel.owl-theme");
				var count = +owls.length + 50;

				for(var i=0; i<owls.length; i++) {
					$(owls[i]).css('zIndex', count);
					count = +count - 1;
				}

			});
		}

		if(self.viewmode() == 'main') {
			$(document).ready(function(){

				var owlitems = $(".owl-wrapper-outer .owl-wrapper .owl-item");

				for(var i=0; i<owlitems.length; i++) {
					$(owlitems[i]).addClass('hidden');
				}

			});
		}

	});



	if(typeof params.model !== 'undefined')
		params.model(self);

	return self;


}, template: hereDoc(function () {
	~~*include file=ko_components/item/main.tpl*~
	~~*include file=ko_components/item/item.tpl*~
	~~*include file=ko_components/item/cartconstructor.tpl*~
})};


ko.components.register(component_name, {
	viewModel: model_item_prototype.constructor,
	template: model_item_prototype.template
});


})();

~~include file="models/item/function_attach_component_item.js"~

</script>
