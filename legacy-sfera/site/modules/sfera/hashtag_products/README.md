# Модуль hashtag_products

## Описание

Модуль для отображения всех товаров с конкретным хэштегом. Работает аналогично модулю `catalog`, отображая товары в виде сетки с фильтрами, пагинацией и всеми функциями (добавление в корзину, избранное).

## Принцип работы

1. Модуль получает хэштег из URL (например: `/hashtag/%23логопедические_книги/`)
2. Ищет товары через связку `product_hashtags` → `v_products_o_products` → `products`
3. Отображает товары в виде каталога с поддержкой:
   - Пагинации
   - Фильтров (авторы, возраст)
   - Добавления в корзину
   - Добавления в избранное
   - Синхронизации состояния

## URL структура

```
/hashtag/{encoded_hashtag_value}/
/hashtag/{encoded_hashtag_value}/?page=2
```

### Примеры URL

- `/hashtag/%23логопедические_книги/` - товары с тегом #логопедические_книги
- `/hashtag/%23развиваем_речь/?page=2` - вторая страница товаров с тегом #развиваем_речь

## SQL запросы

### Получение товаров

```sql
SELECT DISTINCT p.*, pr.price as product_price, p.quantity
FROM product_hashtags ph
INNER JOIN v_products_o_products vpo ON ph.product_id = vpo.product_id
INNER JOIN products p ON vpo.offer_id = p.id
LEFT JOIN prices pr ON p.id = pr.product_id AND pr.price_type_id = '000000002'
WHERE ph.value = '$hashtag'
ORDER BY p.name ASC
LIMIT 20 OFFSET 0
```

### Подсчет товаров

```sql
SELECT COUNT(DISTINCT p.id) AS total
FROM product_hashtags ph
INNER JOIN v_products_o_products vpo ON ph.product_id = vpo.product_id
INNER JOIN products p ON vpo.offer_id = p.id
WHERE ph.value = '$hashtag'
```

## Роутинг

Роут добавлен в `site/classes/router.class.php`:

```php
case 'hashtag':
    print ($_SESSION['smarty']->fetch('str:'.$rout.'/hashtag_products'));
    break;
```

## Шаблон

Модуль использует собственный шаблон `hashtag_products.tpl`, который повторяет структуру каталога:
- Breadcrumbs
- Боковая панель с фильтрами
- Сетка товаров
- Пагинация

## Функциональность

### Карточки товаров

Каждая карточка содержит:
- ✅ Изображение товара
- ✅ Название и цену
- ✅ Кнопку избранного (❤️)
- ✅ Кнопку "В корзину" или контрол количества
- ✅ Ссылку "Купить всё"
- ✅ Синхронизацию с корзиной при переключении вкладок

### Фильтры

Работают через модуль `filter` с передачей `action_url="/hashtag/{hashtag}/"`.

### Пагинация

Стандартная пагинация:
- 20 товаров на странице
- Группы по 5 страниц
- Навигация "вперед/назад"

## Интеграция

### 1. Создание ссылок на хэштеги

В модуле `product_hashtags`:

```smarty
<a href="/hashtag/~~$hashtag.url_value~/" class="hashtag-link">
    ~~$hashtag.value~
</a>
```

### 2. JavaScript

Использует тот же `catalog.js` для обработки корзины и избранного.

### 3. CSS

Использует те же стили `catalog.css` для отображения сетки товаров.

## Примеры использования

### Переход по хэштегу

1. Пользователь открывает карточку товара
2. Видит блок с хэштегами под описанием
3. Кликает на хэштег, например `#логопедические_книги`
4. Открывается страница `/hashtag/%23логопедические_книги/` с товарами

### Поиск похожих товаров

Хэштеги автоматически группируют похожие товары:
- Все товары с тегом `#рабочая_тетрадь`
- Все товары с тегом `#подготовка_к_школе`
- И так далее

## Зависимости

- **product_hashtags** - таблица с хэштегами
- **v_products_o_products** - view для связки товаров
- **products** - таблица товаров
- **filter** - модуль фильтров
- **catalog.js** - JavaScript для корзины/избранного
- **catalog.css** - стили для карточек товаров

## Связь с другими модулями

- **product** - карточка товара с хэштегами
- **product_hashtags** - отображение хэштегов на карточке
- **catalog** - общая структура и стили
- **filter** - фильтрация товаров

## Обслуживание

### Отладка

В консоль выводятся логи:
```
=== hashtag_products: Loading products for hashtag: #логопедические_книги ===
Found hashtags: 15
Total products: 15
```

### Проверка данных

```sql
-- Товары с хэштегом
SELECT p.id, p.name
FROM product_hashtags ph
INNER JOIN v_products_o_products vpo ON ph.product_id = vpo.product_id
INNER JOIN products p ON vpo.offer_id = p.id
WHERE ph.value = '#логопедические_книги';
```

## Производительность

- Индексы на `product_hashtags.value` и `product_hashtags.product_id`
- Использование `DISTINCT` для исключения дубликатов
- Пагинация по 20 товаров для быстрой загрузки

