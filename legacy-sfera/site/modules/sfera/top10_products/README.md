# Модуль топ-10 товаров (Top 10 Products)

## Описание

Модуль отображает блок топ-10 товаров для главной страницы. Товары загружаются из таблицы `top10_products` и отображаются в порядке сортировки.

## Архитектура

### Серверная часть (PHP)

**Файл:** `top10_products.class.php`

#### Основные функции

1. **`execute($arr)`** - Главный метод модуля
   - Загружает топ-10 товаров из таблицы `top10_products`
   - Соединяет с таблицей `products` для получения данных товаров
   - Получает цены из таблицы `prices`
   - Получает рейтинги и количество отзывов для каждого товара
   - Фильтрует только активные товары (`active = 1`)
   - Сортирует по полю `sort`
   - Передает данные в шаблон

2. **`getProductRating($product_id)`** - Получение рейтинга товара
   - Получает SKU товара из `v_products_o_products`
   - Вычисляет средний рейтинг и количество отзывов из `o_reviews`
   - Возвращает массив с `rating` и `reviews_count`

#### Получение товаров

```php
$query = "SELECT t.id, t.product_id, t.sort, t.active,
                 p.name as product_name,
                 pr.price as product_price,
                 p.quantity
          FROM top10_products t
          LEFT JOIN products p ON BINARY t.product_id = BINARY p.id
          LEFT JOIN prices pr ON t.product_id = pr.product_id AND pr.price_type_id = '000000002'
          WHERE t.active = 1
          ORDER BY t.sort ASC
          LIMIT 10";
```

#### Форматирование данных

```php
$products[] = [
    'id' => $row['id'],
    'product_id' => $product_id,
    'sort' => $row['sort'],
    'active' => $row['active'],
    'product_name' => $row['product_name'],
    'product_price' => round($price),
    'quantity' => intval($row['quantity']),
    'rating' => $rating_data['rating'],
    'reviews_count' => $rating_data['reviews_count'],
    'image_url' => $image_url
];
```

### Клиентская часть

**Файл:** `top10_products.tpl`

#### Отображение

Блок обычно содержит:
- Сетку из 10 товаров
- Карточки товаров с изображениями
- Названия, цены, рейтинги
- Кнопки добавления в корзину и избранное

## Использование

### Вызов модуля

```smarty
{mod path="sfera/" mod_name="top10_products"}
```

### Управление топ-10

Топ-10 товаров управляется через админ-панель:
- Добавление товаров в топ-10
- Изменение порядка сортировки
- Активация/деактивация товаров

## Файлы

- `top10_products.class.php` - Серверная логика
- `top10_products.tpl` - Шаблон блока

## Зависимости

- Таблица `top10_products` - хранение топ-10 товаров
- Таблица `products` - товары
- Таблица `prices` - цены
- View `v_products_o_products` - для получения SKU
- Таблица `o_reviews` - для рейтингов
- Функция `getProductImageUrl()` - для получения изображений

## Особенности

1. **Ограничение:** Всегда 10 товаров
2. **Активность:** Отображение только активных товаров
3. **Сортировка:** Товары отображаются в порядке поля `sort`
4. **Рейтинги:** Отображение рейтинга и количества отзывов
5. **Интеграция:** Полная интеграция с корзиной и избранным

## Механизм синхронизации с корзиной

### Определение состояния корзины при загрузке

При рендеринге шаблона (`top10_products.tpl`) карточки товаров определяют свое начальное состояние на основе данных корзины, переданных с сервера:

```smarty
~~if isset($cart.items[$product.product_id]) && isset($cart.items[$product.product_id].product_amount)~
    <!-- Товар в корзине - показываем контрол количества -->
    <div class="product-quantity-control" data-product-id="~~$product.product_id~">
        <input type="number" class="qty-input" value="~~$cart.items[$product.product_id].product_amount~">
    </div>
~~else~
    <!-- Товара нет в корзине - показываем кнопку "В корзину" -->
    <button class="btn-add-to-cart" data-product-id="~~$product.product_id~">В корзину</button>
~~/if~
```

### Клиентское обновление карточек

После загрузки страницы карточки TOP-10 автоматически обновляются при изменении состояния корзины через JavaScript (`assets/sfera/js/top10-slider.js`):

#### 1. Обновление при переключении вкладок

```javascript
document.addEventListener('visibilitychange', function() {
    if (!document.hidden) {
        refreshTop10CartState(); // Загружает актуальное состояние корзины с сервера
    }
});
```

#### 2. Обновление при возврате фокуса на окно

```javascript
window.addEventListener('focus', function() {
    refreshTop10CartState(); // Обновляет карточки при возврате фокуса
});
```

#### 3. Функции обновления

- **`refreshTop10CartState()`** - Загружает актуальное состояние корзины с сервера и обновляет карточки
- **`updateTop10CardsFromCart(cartData)`** - Обновляет состояние всех карточек TOP-10 на основе данных корзины
- **`showTop10QuantityControl(productId, quantity)`** - Показывает контрол количества для товара в корзине
- **`resetTop10Card(productId)`** - Сбрасывает карточку к состоянию "В корзину"

### Интеграция с catalog.js

Если на странице загружен `catalog.js`, карточки TOP-10 обновляются через общую функцию `updateProductCardsFromCart()`, которая обрабатывает как обычные карточки (`.product-card`), так и карточки TOP-10 (`.top10-product-card`):

```javascript
// В catalog.js
function updateProductCardsFromCart(cartData) {
    document.querySelectorAll('.product-card, .top10-product-card').forEach(card => {
        // Обновление состояния карточки
    });
}
```

### Синхронизация между вкладками

Механизм синхронизации обеспечивает актуальность состояния карточек даже при изменении корзины на другой вкладке браузера:

1. **При переключении вкладок** - событие `visibilitychange` срабатывает при возврате на вкладку
2. **При возврате фокуса** - событие `focus` срабатывает при клике на окно браузера
3. **Автоматическое обновление** - карточки обновляются через AJAX запрос к `/cart/?task=get_cart`

### Структура данных корзины

Функции обновления ожидают следующий формат данных корзины:

```javascript
{
    items: {
        "product_id_1": {
            product_amount: 2,
            cost: 1000,
            // ... другие поля
        },
        "product_id_2": {
            product_amount: 1,
            cost: 500,
            // ... другие поля
        }
    },
    total_cart_amount: 3,
    cart_sum: 2500,
    // ... другие поля
}
```

## Структура таблицы top10_products

```sql
CREATE TABLE top10_products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id VARCHAR(255),  -- ID товара из products
    sort INT DEFAULT 0,       -- Порядок сортировки
    active TINYINT DEFAULT 1  -- Активность
)
```

