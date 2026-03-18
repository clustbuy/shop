# Модульная модель корзины (старый подход)

## Описание

Модульная модель корзины использует старый подход с:
- **Прототипным наследованием** через `Object.create(CartModel).constructor()`
- **ko.mapping.fromJS()** для автоматического преобразования данных
- **Множественными applyBindings** к разным элементам страницы
- **Модульностью через Smarty includes** - каждый метод в отдельном файле

## Структура файлов

```
cart_new/
├── model_cart.js.tpl          # Основная модель с конструктором
├── put_into_cart.js           # Добавление товара в корзину
├── remove_from_cart.js        # Удаление товара из корзины
├── clear_cart.js              # Очистка корзины
├── update_amount.js           # Обновление количества товара
├── amount_plus.js             # Увеличение количества
├── amount_minus.js            # Уменьшение количества
├── validate_amount.js         # Валидация количества
├── update_items.js            # Обновление списка товаров
├── update_cart.js             # Обновление корзины (после изменений)
├── try2apply_promocode.js     # Применение промокода
├── try2cancel_promocode.js    # Отмена промокода
├── update_delivery_price.js   # Обновление цены доставки
└── refresh_cart.js            # Обновление данных с сервера
```

## Использование

### Подключение в шаблоне

Модель подключается глобально в `scripts.tpl`:

```smarty
~~include file="models/cart_new/model_cart.js.tpl"~
```

### Доступ к модели

Модель доступна глобально через:
- `model_cart` - основное имя
- `window.model_cart` - через window
- `cart` - короткий алиас
- `window.cart` - короткий алиас через window

### Примеры использования

```javascript
// Получить корзину
var cartData = model_cart.cart();

// Получить товары
var items = model_cart.cart().items();

// Получить общую сумму
var total = model_cart.total_cart_sum();

// Добавить товар в корзину
model_cart.put_into_cart({id: 123, quantity: 1});

// Удалить товар из корзины
model_cart.remove_from_cart(123);

// Обновить количество
model_cart.update_amount(123, 5);

// Применить промокод
model_cart.try2apply_promocode();
```

## Особенности

### ko.mapping

Все данные автоматически преобразуются через `ko.mapping.fromJS()`, что означает:
- Каждое свойство объекта становится observable
- Для доступа к значениям используйте `ko.unwrap()` или вызов функции `()`
- Изменения автоматически отслеживаются KnockoutJS
- **Важно:** `items` становится observable объектом (не функцией), поэтому для доступа используется `ko.unwrap(cartData.items)`
- **Избежание рекурсии:** `name` и `image` создаются как обычные observables, а не computed, чтобы избежать рекурсивных вызовов при `ko.unwrap(item.name)` внутри самого `item.name`
- **Обновление после загрузки:** Используется `setTimeout` в шаблоне для обновления корзины после загрузки `server_cart.data`

### Множественные applyBindings

Bindings применяются к разным элементам страницы с проверкой на дублирование:

```javascript
$(document).ready(function(){
    setTimeout(function() {
        // Функция для проверки, не является ли элемент счетчиком
        function isCounterElement(element) {
            var $el = $(element);
            if ($el.hasClass('cart-counter') || 
                $el.hasClass('mobile-cart-counter') || 
                $el.hasClass('favorites-counter')) {
                return true;
            }
            if ($el.find('.cart-counter, .mobile-cart-counter, .favorites-counter').length > 0) {
                return true;
            }
            return false;
        }
        
        // Функция для безопасного применения bindings
        function safeApplyBindings(viewModel, element) {
            if (ko.dataFor(element) !== undefined) {
                console.log('Bindings already applied, skipping');
                return;
            }
            ko.applyBindings(viewModel, element);
        }
        
        // Применяем bindings к разным элементам
        $('.cart-page').each(function(){
            if (!isCounterElement(this)) {
                safeApplyBindings(model_cart, this);
            }
        });
        
        $('.checkout-sidebar').each(function(){
            if (!isCounterElement(this)) {
                safeApplyBindings(model_cart, this);
            }
        });
    }, 100); // Задержка для инициализации счетчиков
});
```

**Элементы, к которым применяются bindings:**
- `.cart` - основной блок корзины
- `.total_cart_sum` - отображение общей суммы
- `.total_cart_amount` - отображение количества товаров
- `.cart-page` - страница корзины
- `.checkout-sidebar` - боковая панель на странице оформления
- `.order-summary` - сводка заказа

**Особенности:**
- Проверка на дублирование через `ko.dataFor(element)`
- Избежание конфликтов со счетчиками через `isCounterElement()`
- Задержка 100ms для инициализации счетчиков перед применением bindings

### Структура данных

Корзина использует объект `items` (не массив), где ключ - это ID товара:

```javascript
{
    items: {
        "123": {id: 123, name: "Товар", cost: 100, product_amount: 2, img_url: "/path/to/image.jpg"},
        "456": {id: 456, name: "Товар 2", cost: 200, product_amount: 1, img_url: "/path/to/image2.jpg"}
    },
    total_cart_sum: 400,
    total_cart_amount: 3,
    cart_sum: 400,
    cart_discount: 0,
    promocode: ""
}
```

**Важно:**
- `items` - это объект (ключ-значение), а не массив
- Для работы с `foreach` используется computed observable `items()`, который преобразует объект в массив
- Каждый товар в массиве имеет computed observables: `formattedPrice`, `formattedTotal`, `productUrl`, `hasDiscount`, `formattedOldPrice`
- `name` и `image` - обычные observables (не computed), чтобы избежать рекурсии при `ko.unwrap(item.name)` внутри самого `item.name`

## Отладка

Модель доступна в консоли браузера:

```javascript
// Вывести состояние корзины
console.log(model_cart.cart());

// Вывести товары
console.log(model_cart.cart().items());

// Вывести общую сумму
console.log(model_cart.total_cart_sum());
```

