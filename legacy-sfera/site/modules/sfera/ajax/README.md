# Модуль AJAX (Ajax)

## Описание

Модуль AJAX предоставляет API endpoints для различных AJAX запросов на сайте: поиск товаров, поиск авторов, подписка на рассылку, выход из системы.

## Архитектура

### Серверная часть (PHP)

**Файл:** `ajax.class.php`

#### Основные методы

1. **`execute($arr)`** - Главный метод модуля
   - Обрабатывает AJAX запросы через параметр `task`
   - Устанавливает заголовок `Access-Control-Allow-Origin: *` для CORS
   - Маршрутизирует запросы к соответствующим методам

2. **`search_products($p)`** - Поиск товаров
   - Принимает параметр `query` (минимальная длина 2 символа)
   - Ищет товары в таблице `products` по полю `name`
   - Возвращает до 10 результатов, отсортированных по алфавиту
   - Формат ответа: `{success: true, rows: [{id, name}, ...]}`

3. **`search_authors($p)`** - Поиск авторов
   - Принимает параметр `query` (минимальная длина 2 символа)
   - Ищет авторов в таблице `authors` по полю `author_name`
   - Группирует по имени и считает количество книг
   - Возвращает до 10 результатов, отсортированных по алфавиту
   - Формат ответа: `{success: true, rows: [{name, count}, ...]}`

4. **`save_subscriber_email($p)`** - Сохранение email подписчика
   - Принимает параметр `email`
   - Сохраняет в таблицу `subscribers`
   - Возвращает `{success: true, message: 'Подписка сохранена'}`

5. **`logout()`** - Выход из системы
   - Уничтожает сессию пользователя
   - Перенаправляет на главную страницу

#### API Endpoints

Все запросы отправляются на `/ajax/` с параметром `task`:

- `task=search_products&query=название` - Поиск товаров
- `task=search_authors&query=имя` - Поиск авторов
- `task=save_subscriber_email&email=email@example.com` - Подписка
- `task=logout` - Выход из системы

#### Формат ответов

Все ответы в формате JSON:

```json
{
    "success": true,
    "rows": [...]
}
```

или

```json
{
    "success": false,
    "message": "Ошибка"
}
```

## Использование

### Поиск товаров

```javascript
fetch('/ajax/?task=search_products&query=книга')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(data.rows); // Массив товаров
        }
    });
```

### Поиск авторов

```javascript
fetch('/ajax/?task=search_authors&query=Пушкин')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(data.rows); // Массив авторов
        }
    });
```

### Подписка на рассылку

```javascript
fetch('/ajax/?task=save_subscriber_email&email=user@example.com')
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(data.message);
        }
    });
```

## Файлы

- `ajax.class.php` - Серверная логика

## Зависимости

- PHP Session - для logout
- MySQL - таблицы `products`, `authors`, `subscribers`

## Особенности

1. **CORS:** Поддержка Cross-Origin запросов
2. **Валидация:** Минимальная длина поискового запроса - 2 символа
3. **Лимиты:** Ограничение результатов поиска до 10 записей
4. **Сортировка:** Результаты сортируются по алфавиту

