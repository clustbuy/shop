# Модуль популярных категорий (Popular Categories)

## Описание

Модуль отображает блок популярных категорий для главной страницы. Категории загружаются из таблицы `popular_categories` и отображаются с изображениями.

## Архитектура

### Серверная часть (PHP)

**Файл:** `popular_categories.class.php`

#### Основные функции

1. **`execute($arr)`** - Главный метод модуля
   - Загружает популярные категории из таблицы `popular_categories`
   - Соединяет с таблицей `tree` для получения названий
   - Фильтрует только активные категории (`active = 1`)
   - Сортирует по полю `sort`
   - Передает данные в шаблон

#### Получение категорий

```php
$query = "SELECT pc.id, pc.category_id, pc.sort, pc.image, 
                 t.name as title, t.id as guid
          FROM popular_categories pc
          LEFT JOIN tree t ON pc.category_id = t.id
          WHERE pc.active = 1
          ORDER BY pc.sort ASC";
```

#### Структура данных

```php
$categories = [
    [
        'id' => 1,
        'category_id' => 'cat123',
        'sort' => 0,
        'image' => '/assets/img/category1.jpg',
        'title' => 'Название категории',
        'guid' => 'cat123'
    ],
    // ... другие категории
]
```

### Клиентская часть

**Файл:** `popular_categories.tpl`

#### Отображение

Блок обычно содержит:
- Сетку категорий с изображениями
- Названия категорий
- Ссылки на страницы категорий

## Использование

### Вызов модуля

```smarty
{mod path="sfera/" mod_name="popular_categories"}
```

### Управление категориями

Популярные категории управляются через админ-панель (модуль `popular_categories`):
- Добавление категорий в популярные
- Загрузка изображений
- Изменение порядка сортировки
- Активация/деактивация

## Файлы

- `popular_categories.class.php` - Серверная логика
- `popular_categories.tpl` - Шаблон блока

## Зависимости

- Таблица `popular_categories` - хранение популярных категорий
- Таблица `tree` - структура категорий

## Особенности

1. **Активность:** Отображение только активных категорий
2. **Сортировка:** Категории отображаются в порядке поля `sort`
3. **Изображения:** Поддержка изображений для каждой категории
4. **Связь:** Связь с основным каталогом через `category_id`

## Структура таблицы popular_categories

```sql
CREATE TABLE popular_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id VARCHAR(255),  -- ID категории из tree
    sort INT DEFAULT 0,         -- Порядок сортировки
    image VARCHAR(255),         -- URL изображения
    active TINYINT DEFAULT 1    -- Активность
)
```

