
    <div class="l-content">
      <div class="l-wrapper">
        <div class="p-complete">
          <div class="p-complete__header">
              <div class="p-complete__header-inn">
                <div class="p-complete__header-center">
                  <div class="p-complete__title title h1">Заказ успешно оформлен!</div>
                </div>
                <div class="p-complete__header-right">
                  <div class="p-complete__num">Номер заказа: ~~$order.id~</div>
                </div>
              </div>
            </div>
          <div class="p-complete__thanks">
            <div class="p-complete__subtitle">На номер +~~$order.phone~ отправлен чек</div>
            <div class="text">
              <p>Информация о статусе доставки заказа будет отправлена на указанный email или ваш номер телефона.</p>
            </div>
          </div>
          <div class="p-complete__info">
            <div class="p-complete__info-inn">
              <div class="p-complete__info-left">
                <div class="p-complete__subtitle">Информация о заказе</div>
                <div class="order-info">
                  <dl class="order-info__row"> <dt class="order-info__label">Способы получения</dt>
                    <dd class="order-info__value">Доставка в пункт выдачи</dd>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Город</dt>
                    <dd class="order-info__value">~~$city~</dd>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Адрес</dt>
                    <dd class="order-info__value">~~$address~</dd>
                  </dl>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Сумма заказа</dt>
                    <dd class="order-info__value">~~$items_sum~ &#8381;</dd>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Стоимость доставки</dt>
                    <div class="order-info__value">~~$delivery_cost~ &#8381;</div>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Итого</dt>
                    <dd class="order-info__value">~~$total_sum~ &#8381;</dd>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Способ оплаты</dt>
                    <dd class="order-info__value">Оплата картой</dd>
                  </dl>
                  </dl>
                  <dl class="order-info__row"> <dt class="order-info__label">Телефон</dt>
                    <dd class="order-info__value">+~~$order.phone~</dd>
                  </dl>
                </div>
              </div>
              <div class="p-complete__info-right">
                <div class="p-complete__subtitle">Товары в заказе</div>
                ~~foreach from=$items item=item~
                <div class="item-order">
                  <div class="item-order__inn">
                    
                    <div class="item-order__photo">
                      <a href="~~$smarty.server.HTTP_ORIGIN~~~$item.link~">
                        <img class="item-order__img" src="https://ru.market/i/~~$item.guid~/200/1.jpg">
                      </a> 
                    </div>
                    <div class="item-order__info">
                      <a href="~~$smarty.server.HTTP_ORIGIN~~~$item.link~" class="item-order__name">
                        ~~$item.title~
                      </a>
                      <div class="item-order__count">~~$item.amount~ шт.</div>
                    </div>
                    <div class="item-order__price">~~$item.sum~ &#8381;</div>
                  </div>
                </div>
                ~~/foreach~
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

