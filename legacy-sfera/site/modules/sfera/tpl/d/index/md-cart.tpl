
<div class="modal remodal md-cart" data-remodal-id="cart">
	<button class="modal__close close-btn" data-remodal-action="close">
		Закрыть
	</button>
	<div class="title h1">
		Корзина
	</div>
	<div class="md-cart__header">
		<div class="md-cart__header-left">
			<div class="text">
				Всего товаров в корзине <b data-bind="text: total_cart_amount"></b>
				на сумму <span  data-bind="text: total_cart_sum"></span> ₽
			</div>
		</div>


		~~*
		<div class="md-cart__header-right">
			<div class="text">
				До окончания резерва осталось
				<div class="bg-countdown">
					<span data-countdown="~~$now.year~/~~$now.month~/~~$now.day~ 23:59:59" class="js-countdown"></span>
				</div>
			</div>
		</div>
		*~


	</div>



	<!-- ko foreach: cart().items() -->

	<div class="item-click item-click--row">

		<a href="#" class="remove-btn item-click__remove"
		   data-bind="click: $root.remove_from_cart.bind($data, guid())"
		><i></i></a>

		<div class="item-click__inn">
			<div class="item-click__photo">
				<a href="#"> <img class="item-click__img"  data-bind="attr:{src: gallery()[0]}" /> </a>
			</div>
			<div class="item-click__info">
				<div class="item-click__row">
					<div>
						<a href="#" class="item-click__name" data-bind="text: title"></a>
					</div>


					<div class="item-click__num" style="width:160px;">
						<div class="item-count js-item-count js-itemd-cart-count">

							<a  data-bind="click: $root.amount_minus.bind($data, guid())"
								style="display: inline-block; float: none; vertical-align: middle;">
								<img src="/images/ico-minus.svg" style="width:12px;">
							</a>


							<div class="item-count__num">
								<div data-bind="text: product_amount" style="display: inline-block; float: none; vertical-align: middle;"></div>
							</div>


							<a  data-bind="click: $root.amount_plus.bind(guid(), $data)"
								style="display: inline-block; float: none; vertical-align: middle;">
								<img src="/images/ico-plus.svg" style="width:12px;">
							</a>

						</div>
					</div>


					<div class="item-click__price">
						<div class="price">
							<span class="js-item-click-price js-odometer" data-bind="text:Math.round(Number(cost()*product_amount()))"></span> ₽
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	~~*
	<div class="item-click item-click--row">
		<div class="item-click__inn">
			<div class="item-click__photo">
				<a data-bind="attr: {href: $root.full_link($data, $data)}"> <img class="item-click__img" data-bind="attr:{src: Items[guid()].img_url}"> </a>
			</div>
			<div class="item-click__info">
				<div class="item-click__row">
					<div>
						<a class="item-click__name" data-bind="text: Items[guid()].title, attr: {href: $root.full_link($data, $data)}"></a>
					</div>
					<div class="item-click__num">
						<div class="item-count js-item-count js-itemd-cart-count" data-price="2790" data-max="11">
							<button type="button" data-el="minus" class="item-count__minus" data-bind="click: $root.amount_minus.bind($data, guid())">
								-
							</button>
							<div class="item-count__num">
								<input type="text" data-el="num" data-bind="textInput: product_amount" />
							</div>
							<button type="button" data-el="plus" class="item-count__plus" data-bind="click: $root.amount_plus.bind(guid(), $data)">
								+
							</button>
						</div>
					</div>
					<div class="item-click__price">
						<div class="price">
							<span class="js-item-click-price js-odometer" data-bind="text:Math.round(Number(Items[guid()].cost*product_amount()))"></span> ₽
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	*~


	<!-- /ko -->


	<div class="md-cart__bottom">
		<div class="md-cart__bottom-left">

		</div>

		<div class="md-cart__bottom-center">



			~~*
			<div class="progress-bar js-cart-progress-bar" data-to="1500">
				<div class="progress-bar__row">
					<div class="progress-bar__from">
						0
					</div>
					<div class="progress-bar__p">
						<div class="progress-bar__line">
							<div data-el="bar" style="width: 70%;" class="progress-bar__bar"></div>
						</div>
					</div>
					<div class="progress-bar__to">
						1500 ₽
					</div>
				</div>
				<div class="progress-bar__hint">
					Осталось <b><span data-el="left">780</span> руб.</b> для бесплатной доставки
				</div>
			</div>
			*~


		</div>


		<div class="md-cart__bottom-right" style="display: none" data-bind="visible: (total_cart_amount() != 0)">
			<a href="/order/" class="btn btn--vinous">Оформить заказ</a>
		</div>


	</div>
</div>