# Модуль случайных товаров (Random Products)

## Описание

Модуль отображает блок из 12 случайных товаров на главной странице или других страницах сайта. Показывает товары с флагом `is_new = 1`.

## Архитектура

### Серверная часть (PHP)

**Файл:** `random_products.class.php`

#### Основные функции

1. **`execute($arr)`** - Главный метод модуля
   - Загружает 12 случайных товаров из таблицы `products`
   - Фильтрует товары с флагом `is_new = 1`
   - Получает цены из таблицы `prices`
   - Получает рейтинги и количество отзывов для каждого товара
   - Форматирует данные для шаблона

2. **`getProductRating($product_id)`** - Получение рейтинга товара
   - Получает SKU товара из `v_products_o_products`
   - Вычисляет средний рейтинг и количество отзывов из `o_reviews`
   - Возвращает массив с `rating` и `reviews_count`

#### Получение товаров

```php
$query = "SELECT p.*, pr.price as product_price, p.quantity
          FROM products p
          LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
          WHERE is_new = 1 
          ORDER BY RAND()
          LIMIT 12";
```

#### Форматирование данных

```php
$products[] = [
    'id' => $product_id,
    'name' => $row['name'],
    'description' => $row['description'],
    'image' => $image_url,
    'price' => round($price),
    'quantity' => intval($row['quantity']),
    'rating' => $rating_data['rating'],
    'reviews_count' => $rating_data['reviews_count']
];
```

### Клиентская часть

**Файл:** `random_products.tpl`

#### Отображение

Блок обычно содержит:
- Сетку из 12 товаров
- Карточки товаров с изображениями
- Названия, цены, рейтинги
- Кнопки добавления в корзину и избранное

## Использование

### Вызов модуля

```smarty
{mod path="sfera/" mod_name="random_products"}
```

## Файлы

- `random_products.class.php` - Серверная логика
- `random_products.tpl` - Шаблон блока

## Зависимости

- Таблица `products` - товары
- Таблица `prices` - цены
- View `v_products_o_products` - для получения SKU
- Таблица `o_reviews` - для рейтингов
- Функция `getProductImageUrl()` - для получения изображений

## Особенности

1. **Случайность:** Товары выбираются случайно через `ORDER BY RAND()`
2. **Новинки:** Показываются только товары с флагом `is_new = 1`
3. **Ограничение:** Всегда 12 товаров
4. **Рейтинги:** Отображение рейтинга и количества отзывов
5. **Интеграция:** Полная интеграция с корзиной и избранным

