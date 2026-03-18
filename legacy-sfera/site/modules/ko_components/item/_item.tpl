<div data-bind="if: params.viewmode() == 'item', visible: params.viewmode() == 'item'">

<div style="display: none;" class="holder toppings-choose tabs-wrap" data-bind="if: (item().cat.breadcrumbs()[0].alias() == 'pizza' && item().isAddIngrid() != '0') || (item().cat.breadcrumbs()[0].alias() == 'wok' && item().isAddIngrid() != '0'), visible: (item().cat.breadcrumbs()[0].alias() == 'pizza' && item().isAddIngrid() != '0') || (item().cat.breadcrumbs()[0].alias() == 'wok' && item().isAddIngrid() != '0')">

	<span>
		<span>Ингредиенты</span>
		<em class="more"><span class="plus" data-bind="click: switch_ingr_choose_panel"></span></em>
	</span>

	<div style="display: none;" data-bind="visible: is_ingr_panel_expanded" class="item-popup additional-toppings-choose-panel">

		<!-- ko foreach: item().choosen_type().type().ingrids -->

			<div class="row">

				<div class="product">
					 <span class="name" data-bind="text: name_menu"></span>
				</div>

				<div class="price">
					 <strong><span id="i-291-0" class="ex_price" data-bind="text: price"></span> <span class="rubl">руб</span></strong>
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

		<!-- /ko -->

		<a href="#" class="btn-close" data-bind="click: switch_ingr_choose_panel"></a>

		<div class="close-btn-wrapper">
			<a class="close-btn" href="#" data-bind="click: switch_ingr_choose_panel">Применить и закрыть</a>
		</div>

	</div>

	<div class="no-additional-ingrs" data-bind="visible: !choosen_toppings().length">
		<span>Доп.ингредиенты не выбраны...</span>
	</div>

	<div data-bind="visible: choosen_toppings().length, foreach: choosen_toppings" style="">

		<div class="choosen_topping">
			<span data-bind="text: '+'+amount()">+1</span>
			<span data-bind="text: name_menu"></span>
			<em class="remove-additional" data-bind="click: $component.clear_clicked_toppings"></em>
		</div>

	</div>

</div>

<div style="display: none;" class="holder choose-sauce-wrapper tabs-wrap" data-bind="if: (item().cat.breadcrumbs()[0].alias() == 'wok' && item().isAddIngrid() != '0'), visible: (item().cat.breadcrumbs()[0].alias() == 'wok' && item().isAddIngrid() != '0')">

	<span>Соус</span>

	<ul data-bind="foreach: item().sauces.variants">
		<li data-bind="css: {active: $component.item().sauces.choosen() == $data}, click: $component.choose_sauce">
			<a href="#" data-bind="text: name_menu"></a>
		</li>
	</ul>

</div>

<div style="display: none;" class="tabs-wrap holder dough-choose" data-bind="if: (item().cat.breadcrumbs()[0].alias() == 'pizza'), visible: (item().cat.breadcrumbs()[0].alias() == 'pizza')">
	<span>
	<span>Тесто</span>
	</span>
	<ul data-bind="foreach: item().dough.variants">
		<li data-bind="css: {active: $component.item().dough.choosen() == $data}, click: $component.choose_dough">
			<a href="#" data-bind="text: name"></a>
		</li>
	</ul>
</div>

<div style="display: none;" class="size-wrap holder" data-bind="if: (item().cat.breadcrumbs()[0].alias() == 'pizza'), visible: (item().cat.breadcrumbs()[0].alias() == 'pizza')">
	<span>Размер</span>
	<ul data-bind="foreach: item().sizes.variants">
		<li style="display: none" data-bind="visible: $component.item().dough.choosen().original_name() == type(), click: $component.choose_size">
			<a href="#" data-bind="css: {active: $component.item().sizes.choosen() == $data}">
				<span data-bind="text: 'Ø'+size()+'см'"></span>
				<span data-bind="text: weight()+'гр'"></span>
				<strong>
					<span data-bind="text: price"></span>
					<span class="rub">P</span>
				</strong>
			</a>
		</li>
	</ul>
</div>

<div class="my-price-box">

	<div class="holder">

		<span class="price total-price">
			<span data-bind="text: item().total_sum"></span>
			<span class="rubl">руб</span>
			<span class="add-weight">
				~~*<span data-bind="text: item().total_weight"></span>*~
				<span data-bind="text: item().total_weight() + (item().cat.breadcrumbs()[0].alias() == 'drinks' ? 'л.' : (item().cat.breadcrumbs()[0].alias() == 'soup' ? 'мл.' : 'гр.'))"></span>
			</span>
		</span>

		<div class="less-more">
			<a class="minus" href="#" data-bind="click: minus"><span class="minus-ico"></span></a>
			<input type="text" class="amount" data-bind="textInput: item().amount" readonly="readonly" />
			<a class="plus" href="#" data-bind="click: plus"><span class="plus-ico"></span></a>
		</div>

		<a style="clear:both; margin-top:10px;" class="btn noselect" data-bind="click: add2cart.bind($data, $(this))">В корзину</a>

	</div>


	<div class="holder">

		<!--a class="one-click" href="#" id_menu="~~$p.id_menu~" data-bind="click: buy1click.bind($data, $element)">Купить в 1 клик</a-->
		<!--span class="free-delivery">Доставка бесплатно!</span-->

	</div>

</div>

</div>

