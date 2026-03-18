# Модуль избранного (Favorites)

## Описание

Модуль избранного позволяет пользователям сохранять товары для последующего просмотра и покупки.

## Архитектура

### Серверная часть (PHP)

**Файл:** `favorites.class.php`

#### Основные методы

1. **`add_item($p)`** - Добавление товара в избранное
   - Сохраняет товар в `$_SESSION['favorites']['items'][$product_id]`
   - Возвращает JSON с обновленным списком избранного

2. **`remove_item($p)`** - Удаление товара из избранного
   - Удаляет товар из `$_SESSION['favorites']['items']`
   - Возвращает JSON с обновленным списком

3. **`clear_favorites($p)`** - Очистка избранного
   - Очищает весь массив `$_SESSION['favorites']['items']`

4. **`get_favorites($p)`** - Получение списка избранного
   - Возвращает JSON с массивом товаров

#### Структура данных

```php
$_SESSION['favorites'] = [
    'items' => [
        'product_id' => [
            'id' => 'product_id',
            'name' => 'Название товара',
            'price' => 1000.00,
            'image' => '/path/to/image.jpg',
            // ... другие поля товара
        ],
        // ... другие товары
    ]
]
```

#### API Endpoints

- `task=add_item` - Добавить товар
- `task=remove_item` - Удалить товар
- `task=clear_favorites` - Очистить избранное
- `task=get_favorites` - Получить список

### Клиентская часть

#### Интеграция с KnockoutJS

Модуль использует `favoritesCounterViewModel` для отображения счетчика в header.

#### Добавление в избранное

```javascript
fetch('/favorites/?task=add_item', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: 'product_id=' + encodeURIComponent(productId)
})
.then(function(response) {
    return response.json();
})
.then(function(data) {
    // Обновляем счетчик
    if (typeof favoritesCounterViewModel !== 'undefined') {
        favoritesCounterViewModel.updateCount(data);
    }
});
```

## Использование

### Добавление товара в избранное

На странице товара или каталога:

```javascript
// Кнопка с data-product-id
document.querySelectorAll('.product-favorite').forEach(function(btn) {
    btn.addEventListener('click', function() {
        var productId = this.getAttribute('data-product-id');
        // Отправка запроса на сервер
    });
});
```

## Файлы

- `favorites.class.php` - Серверная логика
- `favorites.tpl` - Шаблон страницы избранного
- `assets/sfera/js/favorites-counter.js` - Счетчик избранного

## Зависимости

- PHP Session
- KnockoutJS (для счетчика)

## Особенности

1. **Хранение в сессии:** Избранное хранится в PHP сессии
2. **Счетчик:** Отображение количества товаров в header
3. **Интеграция:** Кнопки добавления/удаления на страницах товаров и каталога

