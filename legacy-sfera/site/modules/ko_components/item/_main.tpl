<div data-bind="if: params.viewmode() == 'main', visible: params.viewmode() == 'main'">

<div style="display: none; height: 20px;" data-bind="if: ((item().cat.breadcrumbs()[0].alias() == 'pizza' || item().cat.breadcrumbs()[0].alias() == 'wok') && params.viewmode_params.show_controls() != 0 && item().isAddIngrid() != '0'), visible: ((item().cat.breadcrumbs()[0].alias() == 'pizza' || item().cat.breadcrumbs()[0].alias() == 'wok') && params.viewmode_params.show_controls() != 0)">

	<div class="ingredients">
		<em >Ингредиенты:</em>
		<em class="additional-items">+
			<span data-bind="text: item().ingrid_amount"></span>
			<em class="remove-additional" data-bind="click: clear_toppings">remove</em>
		</em>
		<em style="margin-right:5px;" class="price">
			 <strong><span data-bind="text: item().cost_ingr"></span> <span class="rubl">руб</span></strong>
		</em>
		<em class="more" data-bind="click: switch_ingr_choose_panel"><span class="plus"></span></em>

		<div style="display: none;" data-bind="visible: is_ingr_panel_expanded" class="item-popup additional-toppings-choose-panel">

			<div data-bind="foreach: item().items()[item().choosen_type().num()].ingrids">
				<div class="row">
					<div class="product">
						 <span class="name" data-bind="text: name_menu"></span>
					</div>
					<div class="price">
						 <strong><span class="ex_price" data-bind="text: price"></span> <span class="rubl">руб</span></strong>
						 <div class="add-product">
								<a href="#" data-bind="click: $component.ingr_minus, css: {'hide-element': amount() == 0}" class="minus ex_minus" style="display: inline;">
									<span class="minus-ico"></span>
								</a>
								<span class="amount ex_amount" style="display: inline;" data-bind="text: amount, css: {'hide-element': amount() == 0}"></span>
								<a href="#" data-bind="click: $component.ingr_plus" class="plus ex_plus">
									<span class="plus-ico"></span>
								</a>
						 </div>
					</div>
				</div>
			</div>
			<div class="close-btn-wrapper">
				<a class="close-btn" href="#" data-bind="click: switch_ingr_choose_panel">Применить и закрыть</a>
			</div>
			<a href="#" class="btn-close" data-bind="click: switch_ingr_choose_panel"></a>
		</div>

	</div>
	
</div>

<div style="display: none;" class="tabs" data-bind="if: (item().cat.breadcrumbs()[0].alias() == 'pizza' && params.viewmode_params.show_controls() != 0), visible: (item().cat.breadcrumbs()[0].alias() == 'pizza' && params.viewmode_params.show_controls() != 0)">
	<string>Тесто:</string>
	<!-- ko foreach: item().dough.variants -->
		<a href="#" data-bind="text: name, css: {active: $component.item().dough.choosen() == $data}, click: $component.choose_dough"></a>
	<!-- /ko -->
</div>


<div class="size-choose-block" style="display: none;" data-bind="if: (item().cat.breadcrumbs()[0].alias() == 'pizza' && params.viewmode_params.show_controls() != 0), visible: (item().cat.breadcrumbs()[0].alias() == 'pizza' && params.viewmode_params.show_controls() != 0)">

	<!-- ko foreach: item().sizes.variants -->
	<div style="display: none" class="size" data-bind="visible: type() == $component.item().choosen_type().type().type(), css: {active: $component.item().sizes.choosen() == $data}, click: $component.choose_size">
		<div>
			<span class="radio" data-bind="css: {checked: $component.item().sizes.choosen() == $data}">
				<input type="radio" name="size">
			</span>
		</div>
		<div>
			<span class="text" data-bind="text: 'Ø' + size() + 'см'"></span>
		</div>
		<div>
			<span class="text" data-bind="text: weight() + ' гр'"></span>
		</div>
		<div>
			<span class="text" data-bind="text: price() + ' '"></span><span class="rub">P</span>
		</div>
	</div>
	<!-- /ko -->

</div>

<div class="sauce-choose-block select-row" style="display: none;" data-bind="if: (item().sauces && item().isAddIngrid() != '0' && item().cat.breadcrumbs()[0].alias() == 'wok' && params.viewmode_params.show_controls() != 0), visible: (item().cat.breadcrumbs()[0].alias() == 'wok' && params.viewmode_params.show_controls() != 0)">

	<span class="label">Соус:</span>
	<select class="sauce" style="width:180px;" data-bind="options: item().sauces.variants,
		optionsText: function(item){ return item.name_menu(); },
		value: item().sauces.choosen,
		event: {change: function(){ console.log('change'); }">
	</select>

</div>

	<div class="item-parts-count" style="display: none;" data-bind="if: (item().items_amount && (item().cat.breadcrumbs()[0].alias() == 'assorti' || item().cat.breadcrumbs()[0].alias() == 'rolls') && params.viewmode_params.show_controls() != 0), visible: (item().items_amount && (item().cat.breadcrumbs()[0].alias() == 'assorti' || item().cat.breadcrumbs()[0].alias() == 'rolls') && params.viewmode_params.show_controls() != 0)">
	<span data-bind="text: item().items_amount() + ' шт.'"></span>
</div>

<div class="price-box">
	<div class="holder">
		<span class="price total-price">
			<span data-bind="text: item().total_sum"></span>
			<span class="rubl">руб</span>
			<span class="add-weight">
				<span data-bind="text: item().total_weight() + (item().cat.breadcrumbs()[0].alias() == 'drinks' ? 'л.' : (item().cat.breadcrumbs()[0].alias() == 'soup' ? 'мл.' : 'гр.'))"></span>
			</span>
		</span>
		<div class="less-more">
			<a class="minus" href="#" data-bind="click: minus"><span class="minus-ico"></span></a>
			<input type="text" class="amount" readonly="readonly" data-bind="value: item().amount" />
			<a class="plus" href="#" data-bind="click: plus"><span class="plus-ico"></span></a>
		</div>
		<a class="btn noselect" data-bind="click: add2cart.bind($data, $element)">В корзину</a>
	</div>
	<!--div class="holder">
		<a class="one-click" href="#" data-bind="click: buy1click.bind($data, $element)">Купить в 1 клик</a>
	</div-->
</div>

<div class="modal-shield4items"></div>

</div>
