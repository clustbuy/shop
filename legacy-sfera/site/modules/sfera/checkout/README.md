# Модуль оформления заказа (Checkout)

## Описание

Модуль оформления заказа позволяет пользователю завершить покупку, указав данные доставки, способ оплаты и информацию о получателе.

## Архитектура

### Серверная часть (PHP)

**Файл:** `checkout.class.php`

#### Основные методы

1. **`execute($arr)`** - Главный метод модуля
   - Обрабатывает GET запросы для отображения формы
   - Обрабатывает POST запросы для создания заказа
   - Пересчитывает корзину перед отображением
   - Передает данные корзины в шаблон

2. **`createOrder()`** - Создание заказа
   - Валидирует обязательные поля (ФИО, телефон)
   - Генерирует номер заказа через `make_order_num()`
   - Создает записи в таблице `order_positions` для каждого товара
   - Создает запись в таблице `orders`
   - Очищает корзину после успешного создания
   - Возвращает JSON с результатом и редиректом на страницу благодарности

3. **`make_order_num()`** - Генерация номера заказа
   - Создает уникальный `order_num` (число) и `order_code` (строка)
   - Использует временную метку и случайные значения
   - Возвращает массив с `order_num` и `order_code`

#### Структура данных заказа

**Таблица `orders`:**
- `id` - ID заказа (order_num)
- `order_code` - Код заказа (строка)
- `full_sum` - Полная сумма заказа
- `discount_sum` - Сумма скидки
- `pay_sum` - Итоговая сумма к оплате
- `name` - ФИО получателя
- `phone` - Телефон получателя
- `email` - Email получателя
- `comment_user` - Комментарий к заказу
- `user_id` - ID пользователя (если авторизован)
- `ip` - IP адрес
- `user_agent` - User Agent браузера

**Таблица `order_positions`:**
- `order_num` - ID заказа
- `order_code` - Код заказа
- `guid` - ID товара
- `title` - Название товара
- `pieces` / `amount` - Количество
- `cost` / `piece_cost` - Цена за единицу
- `sum` - Сумма позиции
- `weight` / `piece_weight` - Вес

### Клиентская часть (JavaScript + KnockoutJS)

**Файл:** `checkout.tpl` (встроенный JavaScript)

#### Интеграция с CartViewModel

Страница checkout использует тот же `cartViewModel`, что и страница корзины:

```javascript
// Применяем bindings к order-summary
var orderSummary = document.querySelector('.order-summary');
if (orderSummary) {
    ko.applyBindings(cartViewModel, orderSummary);
}
```

#### Отображение товаров

Товары отображаются через KnockoutJS binding:

```html
<div class="order-items" data-bind="foreach: items">
    <div class="order-item">
        <img data-bind="attr: {src: image, alt: name}">
        <h4 data-bind="text: name"></h4>
        <p data-bind="text: formattedQuantity"></p>
        <div data-bind="text: formattedTotal"></div>
    </div>
</div>
```

#### Обработка формы

```javascript
checkoutBtn.addEventListener('click', function(e) {
    e.preventDefault();
    
    // Собираем данные формы
    var formData = new FormData();
    formData.append('create_order', '1');
    formData.append('recipientName', document.getElementById('recipientName').value);
    formData.append('recipientPhone', document.getElementById('recipientPhone').value);
    // ... другие поля
    
    // Отправляем на сервер
    fetch('/checkout/', {
        method: 'POST',
        body: formData
    })
    .then(function(response) {
        return response.json();
    })
    .then(function(data) {
        if (data.success) {
            window.location.href = data.redirect || '/thankyoupage/';
        }
    });
});
```

#### Интеграция с Яндекс.Картами

Модуль интегрирован с Яндекс.Картами для выбора пункта выдачи:

- Инициализация карты при открытии popup
- Отображение точек выдачи на карте
- Выбор точки выдачи по клику
- Сохранение выбранной точки в localStorage
- Обновление адреса в форме

## Использование

### Создание заказа

1. Пользователь заполняет форму:
   - Адрес доставки (выбор на карте)
   - Способ доставки
   - Способ оплаты
   - ФИО получателя
   - Телефон
   - Email (опционально)
   - Комментарий (опционально)

2. Нажимает кнопку "Оформить заказ"

3. Сервер:
   - Валидирует данные
   - Создает записи в `order_positions`
   - Создает запись в `orders`
   - Очищает корзину
   - Возвращает JSON с редиректом

4. Клиент перенаправляет на `/thankyoupage/`

## Файлы

- `checkout.class.php` - Серверная логика
- `checkout.tpl` - Шаблон страницы оформления
- `func.ajax.php` - AJAX обработчики для карты

## Зависимости

- Модуль `cart` - для получения данных корзины
- KnockoutJS - для отображения товаров
- Яндекс.Карты API - для выбора пункта выдачи
- jQuery - для работы с картой

## Особенности

1. **Динамическое обновление:** Итоговая сумма обновляется при изменении доставки или промокода
2. **Валидация:** Проверка обязательных полей на клиенте и сервере
3. **Интеграция с картой:** Выбор пункта выдачи через Яндекс.Карты
4. **Очистка корзины:** Автоматическая очистка после создания заказа
5. **Перенаправление:** Автоматический редирект на страницу благодарности

