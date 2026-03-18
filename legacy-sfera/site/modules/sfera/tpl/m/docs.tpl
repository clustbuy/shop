<div class="docs hidden">
	<div class="docs-close" onclick="$('.docs').addClass('hidden')"></div>
	<div class="docs-wrapper">
		<div>
			<h3>Главная</h3>
			<a title="+7 800 700 28 92" href="tel:+78007002892" rel="noopener">+7 800 700 28 92</a>
			<a title="help@ru.market" href="mailto:help@ru.market" rel="noopener">help@ru.market</a>
			<p>Адрес: г. Москва, пер. Электрический, д. 3/10 стр. 3 пом. 1/1</p>
		</div>

		<div>
			<h3>Мой заказ</h3>
			<a title="Где посмотреть статус заказа" target="_blank" href="#" rel="noopener">Где посмотреть статус заказа</a>
			<a title="Как редактировать заказ" target="_blank" href="#" rel="noopener">Как редактировать заказ</a>
			<a title="Как отменить заказ" target="_blank" href="#" rel="noopener">Как отменить заказ</a>
			<a title="Как получить заказ" target="_blank" href="#" rel="noopener">Как получить заказ</a>
			<a title="Не получается сделать заказ" target="_blank" href="#" rel="noopener">Не получается сделать заказ</a>
		</div>

		<div>
			<h3>Оплата</h3>
			<a title="Способы оплаты" target="_blank" href="#" rel="noopener">Способы оплаты</a>
			<a title="Чеки и документы" target="_blank" href="#" rel="noopener">Чеки и документы</a>
		</div>

		<div>
			<h3>Возвраты и отмены</h3>
			<a title="Как вернуть товар" target="_blank" href="#" rel="noopener">Как вернуть товар</a>
			<a title="Условия и сроки возврата" target="_blank" href="#" rel="noopener">Условия и сроки возврата</a>
			<a title="Когда вернутся деньги за отмену или возврат" target="_blank" href="#" rel="noopener">Когда вернутся деньги за отмену или возврат</a>
		</div>

		<div>
			<h3>Доставка</h3>
			<a title="Стоимость доставки" target="_blank" href="#" rel="noopener">Стоимость доставки</a>
			<a title="Способы доставки" target="_blank" href="#" rel="noopener">Способы доставки</a>
		</div>
	</div>
</div>

<style>
.docs {
	position: fixed;
	top: 0;
	overflow: auto;
	height: 100vh;
	z-index: 999;
}

.docs-wrapper {
	font-family: var(--mainFont);
	background-color: #fff;
	color: #000;
	width: calc(100% - 30px);
	padding: 15px;
	display: grid;
	gap: 32px;
}

.docs h3 {
	margin-top: 0;
	margin-bottom: 16px;
	font-size: 17px;
	line-height: 165%;
	margin-bottom: 8px;
	display: inline-block;
}

.docs a {
	display: block;
	font-size: 15px;
	line-height: 160%;
	margin-bottom: 12px;
}

.docs a:last-child {
	margin-bottom: 0;
}

.docs-close {
	display: block;
	width: 32px;
	height: 32px;
	border: none;
	border-radius: 50%;
	outline: none;
	background-color: white;
	background-repeat: no-repeat;
	background-position: 50%;
	filter: drop-shadow(0px 2px 8px rgba(0,0,0,0.12)) drop-shadow(0px 0px 2px rgba(0,0,0,0.12));
	position: absolute;
	top: 15px;
	right: 15px;
}

.docs-close::before, .docs-close::after {
	content: '';
	position: absolute;
	background-color: #000;
	top: 50%;
	left: 50%;
	width: calc(100% - 10px);
	height: 2px;
}

.docs-close::before {
	transform: translate(-50%, -50%) rotate(45deg);
}

.docs-close::after {
	transform: translate(-50%, -50%) rotate(-45deg);
}
</style>