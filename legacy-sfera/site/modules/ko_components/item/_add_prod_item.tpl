
<div class="add_prod_item" data-bind="if: params.viewmode() == 'add_prod_item', visible: params.viewmode() == 'add_prod_item'">
	<div class="item_name" style="height: 50px;">
		<a href="#" data-bind="attr: {href: '/' + item().cat.breadcrumbs()[0].alias() + '/' + item().alias()}">
			<span data-bind="text: item().name_menu"  style='border-bottom: #e0ded8 solid 1px; font: 700 15px/24px "Roboto Slab","Times New Roman",serif !important;'></span>
		</a>
	</div>

	<div style="padding-bottom: 0;" class="total">
		<strong class="total-price">
			<span data-bind="text: item().total_sum"></span>
			<span class="rubl">руб</span>
			<span class="add-weight">
				<span data-bind="text: item().total_weight"></span>
				<span style="display: none" data-bind="visible: (item().cat.breadcrumbs()[0].alias() != 'drinks' && item().cat.breadcrumbs()[0].alias() != 'soup')">гр.</span>
				<span style="display: none" data-bind="visible: (item().cat.breadcrumbs()[0].alias() == 'drinks')">л.</span>
				<span style="display: none" data-bind="visible: (item().cat.breadcrumbs()[0].alias() == 'soup')">мл.</span>
			</span>
		</strong>
	</div>

	<div style="text-align: center;" class="less-more">
		<a style="display: inline-block; float: none; vertical-align: middle;" class="minus" href="#" data-bind="click: minus"><span class="minus-ico"></span></a><!--
		--><input style="display: inline-block; float: none; vertical-align: middle;" type="text" class="amount" data-bind="textInput: item().amount" readonly="readonly"><!--
		--><a style="display: inline-block; float: none; vertical-align: middle;" class="plus" href="#" data-bind="click: plus"><span class="plus-ico"></span></a>
	</div>

	<div class="btn-wrapper">
		<a href="#" class="btn" data-bind="click: add2cart.bind($data, $element)">В корзину</a>
	</div>
</div>
