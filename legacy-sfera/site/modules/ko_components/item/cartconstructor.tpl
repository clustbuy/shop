<div data-bind="if: params.viewmode() == 'cartconstructor', visible: params.viewmode() == 'cartconstructor'">


	<a href="#" class="btn-close" data-bind="click: model_cart.hide_modal_constructor.bind($data, $component)"></a>


	<div class="row" style="overflow: visible">
		<div class="price-box item" style="display: inline; float: left; width: 40%; position: relative;">

			<span class="price total-price">
				<span data-bind="text: item().total_sum">410</span>
				<span class="rubl">руб</span>
			</span>

		</div>
		<div style="display: inline; float: left; width: 60%;">
			<div class="close-btn-wrapper">
				<a class="close-btn" href="#" data-bind="click: model_cart.hide_modal_constructor.bind($data, $component)">Применить и закрыть</a>
			</div>
		</div>
	</div>



</div>
