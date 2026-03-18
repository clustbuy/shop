# Модуль корзины (Cart)

## Описание

Модуль корзины отвечает за управление товарами, добавленными пользователем в корзину покупок. Реализован с использованием KnockoutJS для реактивного обновления интерфейса и PHP для серверной логики.

## Архитектура

### Серверная часть (PHP)

**Файл:** `cart.class.php`

Модуль использует сессии PHP (`$_SESSION['cart']`) для хранения данных корзины. Основные методы:

#### Основные методы

1. **`put_item($p)`** - Добавление товара в корзину
   - Принимает JSON с данными товара (`guid`, `product_amount`)
   - Получает данные товара из таблицы `products` и `prices`
   - Проверяет максимальное количество (`quantity` из таблицы `products`)
   - Если товар уже есть в корзине, увеличивает количество
   - Сохраняет в `$_SESSION['cart']['items'][$guid]`

2. **`update_item($p)`** - Обновление товара в корзине
   - Обновляет количество товара
   - Проверяет максимальное количество
   - Если товара нет в корзине, добавляет его

3. **`update_amount($p)`** - Обновление количества товара
   - Обновляет только количество (`product_amount`)
   - Проверяет максимальное количество из БД

4. **`delete_product($p)`** - Удаление товара из корзины
   - Удаляет товар по `guid` из `$_SESSION['cart']['items']`

5. **`clear_cart($p)`** - Очистка корзины
   - Очищает массив `$_SESSION['cart']['items']`

6. **`calc()`** - Пересчет корзины
   - Вычисляет общее количество товаров (`total_cart_amount`)
   - Вычисляет общую сумму (`cart_sum`, `total_cart_sum`)
   - Вычисляет вес корзины (`cart_weight`)
   - Вычисляет бонусы (`bonus`)
   - Сохраняет данные в сессию и БД (таблица `_cart_sessions`)

7. **`save_promocode($p)`** - Сохранение промокода
   - Сохраняет промокод в сессию
   - Сохраняет скидку в `$_SESSION['user']['discount']['val']`

8. **`del_promocode($p)`** - Удаление промокода
   - Очищает промокод из сессии

#### Структура данных корзины в сессии

```php
$_SESSION['cart'] = [
    'items' => [
        'product_id' => [
            'id' => 'product_id',
            'name' => 'Название товара',
            'cost' => 1000.00,
            'product_amount' => 2,
            'max_quantity' => 10,
            'img_url' => '/path/to/image.jpg',
            'title' => 'Название товара',
            // ... другие поля из таблицы products
        ],
        // ... другие товары
    ],
    'total_cart_amount' => 5,        // Общее количество товаров
    'cart_sum' => 5000.00,           // Общая сумма
    'total_cart_sum' => 5000.00,     // Итоговая сумма
    'cart_weight' => 2.5,            // Вес корзины
    'cart_discount' => 0,             // Скидка
    'bonus' => 0,                     // Бонусы
    'promocode' => '',                // Промокод
]
```

#### API Endpoints

Все запросы отправляются на `/cart/` с параметром `task`:

- `task=put_item` - Добавить товар
- `task=update_item` - Обновить товар
- `task=update_amount` - Обновить количество
- `task=delete_product` - Удалить товар
- `task=clear_cart` - Очистить корзину
- `task=get_cart` - Получить данные корзины
- `task=save_promocode` - Сохранить промокод
- `task=del_promocode` - Удалить промокод

Все методы возвращают JSON с полными данными корзины после выполнения операции.

### Клиентская часть (KnockoutJS)

**Файл:** `site/modules/models/cart_new/model_cart.js.tpl`

#### Архитектура MVVM

Модуль использует паттерн MVVM (Model-View-ViewModel) с библиотекой KnockoutJS и модульным подходом:

- **Model** - данные корзины из сервера (`server_cart.data`)
- **View** - HTML шаблоны с data-bind атрибутами
- **ViewModel** - `CartModel` с прототипным наследованием и модульными методами

#### Структура модели

Модель собирается из модульных файлов через Smarty includes:

```javascript
var CartModel = {
    constructor: function(){
        var self = this;
        
        // Инициализация через ko.mapping
        var cartData = (typeof server_cart !== 'undefined' && server_cart.data) 
            ? server_cart.data 
            : {items: {}, total_cart_sum: 0, total_cart_amount: 0, cart_sum: 0, cart_discount: 0, promocode: ''};
        self.cart = ko.observable(ko.mapping.fromJS(cartData)).extend({ deferred: true });
        
        // Промокод
        self.promocode = ko.observable(ko.unwrap(self.cart().promocode) || '');
        self.promocode_input = ko.observable('');
        self.promocode_applied = ko.observable(false);
        self.promocode_message = ko.observable('');
        
        // Доставка (для checkout)
        self.delivery_price = ko.observable(0);
        self.delivery_method = ko.observable('pickup');
        
        // Computed свойства
        self.cart_sum = ko.pureComputed({
            read: function () {
                // Использует значение с сервера, если есть, иначе вычисляет
                var serverCartSum = parseFloat(ko.unwrap(self.cart().cart_sum) || 0) || 0;
                if (serverCartSum > 0) return serverCartSum;
                // ... вычисление суммы товаров ...
            }
        });
        
        // Преобразование items из объекта в массив для foreach
        self.items = ko.pureComputed({
            read: function () {
                var cartData = self.cart();
                var itemsObj = ko.unwrap(cartData.items);
                var itemsArray = [];
                
                // Преобразуем объект в массив с computed observables для каждого товара
                for (var key in itemsObj) {
                    if (itemsObj.hasOwnProperty(key)) {
                        var item = itemsObj[key];
                        var itemData = ko.unwrap(item) || item;
                        var mappedItem = ko.mapping.fromJS(itemCopy);
                        
                        // name и image - обычные observables (не computed) для избежания рекурсии
                        item.name = ko.observable(itemName);
                        item.image = ko.observable(itemImgUrl);
                        
                        // formattedPrice, formattedTotal - computed observables
                        item.formattedPrice = ko.pureComputed(function() { /* ... */ });
                        item.formattedTotal = ko.pureComputed(function() { /* ... */ });
                        
                        itemsArray.push(mappedItem);
                    }
                }
                return itemsArray;
            }
        });
        
        // Включение модульных методов через Smarty includes
        ~~include file="models/cart_new/put_into_cart.js"~
        ~~include file="models/cart_new/remove_from_cart.js"~
        ~~include file="models/cart_new/update_amount.js"~
        // ... и т.д.
        
        return self;
    }
};

var model_cart = Object.create(CartModel).constructor();
```

**Особенности:**
- **ko.mapping.fromJS()** - автоматическое преобразование данных сервера в observables
- **Прототипное наследование** - через `Object.create(CartModel).constructor()`
- **Модульные методы** - каждый метод в отдельном файле, включается через Smarty
- **Множественные applyBindings** - модель применяется к разным элементам страницы
- **Глобальный доступ** - `window.model_cart = model_cart` для отладки

**Важно:**
- `name` и `image` - обычные observables (не computed), чтобы избежать рекурсии
- `items` - computed observable, преобразующий объект товаров в массив для `foreach`
- `cart_sum` - использует значение с сервера, если оно есть, иначе вычисляет вручную

#### Основные методы модели

Методы находятся в отдельных файлах и включаются через Smarty:

1. **`put_into_cart(item)`** - Добавление товара
   - Отправляет AJAX запрос на `/cart/?task=put_item`
   - Обновляет корзину через `ko.mapping.fromJS()` из ответа сервера
   - Обновляет глобальную переменную `server_cart.data`
   - Обновляет счетчик корзины в header

2. **`remove_from_cart(guid)`** - Удаление товара
   - Отправляет AJAX запрос на `/cart/?task=delete_product`
   - Обновляет корзину из ответа сервера через `ko.mapping.fromJS()`
   - Обновляет счетчик корзины

3. **`update_amount(guid, amount)`** - Обновление количества
   - Отправляет AJAX запрос на `/cart/?task=update_amount`
   - Обновляет корзину из ответа сервера
   - Обновляет счетчик корзины

4. **`amount_plus(guid, item)`** - Увеличение количества
   - Проверяет текущее количество и максимальное значение
   - Увеличивает на 1, если не достигнут максимум
   - Вызывает `update_amount()`

5. **`amount_minus(guid, item)`** - Уменьшение количества
   - Уменьшает на 1, если количество > 1
   - Если количество становится 1 и нажата кнопка "-", удаляет товар через `remove_from_cart()`

6. **`validate_amount(guid, item, event)`** - Валидация количества из input
   - Проверяет минимальное (1) и максимальное (`max_quantity`) значения
   - Вызывает `update_amount()` с валидным значением

7. **`try2apply_promocode()`** - Применение промокода
   - Отправляет промокод на сервер через `/cart/?task=save_promocode`
   - Обновляет корзину из ответа сервера
   - Обновляет `promocode_applied` и `promocode_message`

8. **`try2cancel_promocode()`** - Удаление промокода
   - Отправляет запрос на `/cart/?task=del_promocode`
   - Обновляет корзину из ответа сервера
   - Сбрасывает промокод

9. **`update_delivery_price(method)`** - Обновление цены доставки
   - Устанавливает цену доставки в зависимости от метода
   - Используется на странице checkout

10. **`refresh_cart()`** - Обновление корзины с сервера
    - Отправляет запрос на `/cart/?task=get_cart`
    - Обновляет корзину из ответа сервера
    - Используется для синхронизации при переключении вкладок

#### Инициализация

```javascript
// Модель создается глобально при загрузке скрипта
var model_cart = Object.create(CartModel).constructor();

// Множественные applyBindings к разным элементам страницы
$(document).ready(function(){
    setTimeout(function() {
        // Применяем bindings к элементам с классом .cart-page
        $('.cart-page').each(function(){
            if (ko.dataFor(this) === undefined) {
                ko.applyBindings(model_cart, this);
            }
        });
        
        // Применяем bindings к checkout sidebar
        $('.checkout-sidebar').each(function(){
            if (ko.dataFor(this) === undefined) {
                ko.applyBindings(model_cart, this);
            }
        });
    }, 100); // Задержка для инициализации счетчиков
});

// Обновление корзины после загрузки server_cart.data
// В cart.tpl после инициализации server_cart.data:
setTimeout(function() {
    if (typeof model_cart !== 'undefined' && server_cart.data && server_cart.data.items) {
        var currentCart = model_cart.cart();
        var updatedCart = ko.mapping.fromJS(server_cart.data, {}, currentCart);
        model_cart.cart(updatedCart);
    }
}, 100);
```

**Особенности инициализации:**
- Модель создается глобально при загрузке скрипта
- `server_cart.data` загружается в шаблоне после создания модели
- Используется `setTimeout` для обновления корзины после загрузки данных
- Множественные `applyBindings` к разным элементам с проверкой на дублирование
- Задержка 100ms для инициализации счетчиков перед применением bindings

#### Data Binding в шаблонах

**Пример использования в HTML:**

```html
<!-- Цикл по товарам -->
<div data-bind="foreach: items">
    <div class="cart-item">
        <!-- Название товара -->
        <h4 data-bind="text: name"></h4>
        
        <!-- Цена -->
        <span data-bind="text: formattedPrice"></span>
        
        <!-- Количество -->
        <input type="number" 
               data-bind="value: product_amount, 
                          valueUpdate: 'input',
                          event: { change: $parent.updateAmount }">
        
        <!-- Итоговая стоимость -->
        <span data-bind="text: formattedTotal"></span>
        
        <!-- Кнопка удаления -->
        <button data-bind="click: $parent.removeItem">Удалить</button>
    </div>
</div>

<!-- Итоговая сумма -->
<div class="total">
    <span data-bind="text: formattedGrandTotal"></span>
</div>

<!-- Условное отображение -->
<!-- ko if: items().length === 0 -->
<div>Корзина пуста</div>
<!-- /ko -->
```

**Основные биндинги:**

- `text: property` - Отображение текста
- `value: property` - Двустороннее связывание для input
- `click: method` - Обработчик клика
- `foreach: array` - Цикл по массиву
- `if: condition` - Условное отображение
- `visible: condition` - Условная видимость
- `attr: { src: image }` - Установка атрибутов
- `css: { class: condition }` - Условные CSS классы

#### Синхронизация с сервером

1. **При загрузке страницы:**
   - Данные передаются из PHP в JavaScript через `server_cart.data` в шаблоне
   - Модель инициализируется с пустыми данными, если `server_cart` не определен
   - После загрузки `server_cart.data` корзина обновляется через `ko.mapping.fromJS()`
   - Используется `setTimeout` для гарантии, что модель уже создана

2. **При изменении корзины:**
   - Клиент отправляет AJAX запрос на сервер (jQuery `$.ajax`)
   - Сервер выполняет операцию и возвращает обновленные данные корзины
   - Модель обновляется через `ko.mapping.fromJS(responseData, {}, currentCart)`
   - Глобальная переменная `server_cart.data` также обновляется

3. **При переключении вкладок:**
   - Слушатель `visibilitychange` вызывает `refresh_cart()`
   - Обеспечивает актуальность данных при возврате на вкладку

**Важно:**
- Все обновления корзины происходят через `ko.mapping.fromJS()` для сохранения структуры observables
- Глобальная переменная `server_cart.data` всегда синхронизирована с моделью
- При обновлении корзины также обновляется счетчик через `cartCounterViewModel.updateCount()`

#### Интеграция с другими модулями

1. **Счетчик корзины в header:**
   - Используется `cartCounterViewModel`
   - Обновляется при изменении корзины
   - Отображает количество товаров в badge

2. **Страница checkout:**
   - Использует тот же `cartViewModel`
   - Отображает товары в sidebar
   - Обновляет итоговую сумму при изменении доставки/промокода

3. **Страница товара:**
   - Кнопка "В корзину" вызывает `addItem()`
   - Кнопка "Купить всё" устанавливает максимальное количество

## Использование

### Добавление товара в корзину

```javascript
// Из любого места на сайте
if (typeof cartViewModel !== 'undefined' && cartViewModel !== null) {
    cartViewModel.addItem({
        id: '123',
        quantity: 1
    });
}
```

### Обновление количества

```javascript
// На странице корзины
cartViewModel.updateAmount(item);
```

### Применение промокода

```javascript
// На странице корзины или checkout
cartViewModel.promoCode('PROMO2024');
cartViewModel.applyPromoCode();
```

## Файлы

### Серверная часть
- `cart.class.php` - Серверная логика (API endpoints, сессии, БД)

### Клиентская часть
- `cart.tpl` - Шаблон страницы корзины с KnockoutJS bindings
- `site/modules/models/cart_new/model_cart.js.tpl` - Основная модель корзины
- `site/modules/models/cart_new/put_into_cart.js` - Добавление товара
- `site/modules/models/cart_new/remove_from_cart.js` - Удаление товара
- `site/modules/models/cart_new/update_amount.js` - Обновление количества
- `site/modules/models/cart_new/amount_plus.js` - Увеличение количества
- `site/modules/models/cart_new/amount_minus.js` - Уменьшение количества
- `site/modules/models/cart_new/validate_amount.js` - Валидация количества
- `site/modules/models/cart_new/try2apply_promocode.js` - Применение промокода
- `site/modules/models/cart_new/try2cancel_promocode.js` - Отмена промокода
- `site/modules/models/cart_new/update_delivery_price.js` - Обновление цены доставки
- `site/modules/models/cart_new/refresh_cart.js` - Обновление корзины с сервера
- `assets/sfera/js/cart-counter.js` - Счетчик корзины в header

## Зависимости

- **KnockoutJS 3.x** - для реактивных интерфейсов
- **knockout.mapping** - для автоматического преобразования данных сервера в observables
- **PHP Session** - для хранения данных корзины на сервере
- **MySQL** - таблица `_cart_sessions` для сохранения корзины в БД
- **jQuery** - для AJAX запросов (используется в модульных методах)
- **Smarty** - для сборки модели из модульных файлов через includes

## Особенности

1. **Реактивность:** Все изменения автоматически отражаются в UI благодаря KnockoutJS
2. **Синхронизация:** Данные всегда синхронизированы с сервером через `ko.mapping.fromJS()`
3. **Валидация:** Проверка максимального количества товара на сервере и клиенте
4. **Персистентность:** Корзина сохраняется в сессии и БД
5. **Модульность:** Каждый метод в отдельном файле, легко найти и изменить
6. **Избежание рекурсии:** `name` и `image` - обычные observables, не computed
7. **Оптимизация cart_sum:** Использует значение с сервера, если доступно
8. **Глобальный доступ:** `model_cart` доступен для отладки через консоль браузера
9. **Множественные bindings:** Модель применяется к разным элементам страницы с проверкой на дублирование
10. **Автоматическое обновление:** Корзина обновляется после загрузки `server_cart.data` через `setTimeout`

