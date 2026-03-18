# Модуль меню каталога (Catalog Menu)

## Описание

Модуль меню каталога строит иерархическое дерево категорий из таблицы `tree` для отображения в dropdown меню или навигации.

## Архитектура

### Серверная часть (PHP)

**Файл:** `catalog_menu.class.php`

#### Основные функции

1. **`execute($arr)`** - Главный метод модуля
   - Загружает корневые категории (где `parent_id` пустой или NULL)
   - Рекурсивно строит дерево категорий через `getChildren()`
   - Передает данные в шаблон
   - Поддерживает выбор шаблона через параметр `tpl`

2. **`getChildren($parent_id)`** - Рекурсивное получение дочерних категорий
   - Получает дочерние категории для указанного родителя
   - Рекурсивно вызывает себя для построения многоуровневого дерева
   - Возвращает массив с вложенными категориями

#### Структура данных

```php
$categories = [
    [
        'id' => 'category_id',
        'name' => 'Название категории',
        'children' => [
            [
                'id' => 'child_id',
                'name' => 'Дочерняя категория',
                'children' => [...]
            ],
            // ... другие дочерние категории
        ]
    ],
    // ... другие корневые категории
]
```

#### Получение корневых категорий

```php
$query = "SELECT id, name, parent_id 
          FROM tree 
          WHERE (parent_id = '' OR parent_id IS NULL)
          ORDER BY name ASC";
```

#### Получение дочерних категорий

```php
$query = "SELECT id, name, parent_id 
          FROM tree 
          WHERE parent_id = '$parent_id_safe'
          ORDER BY name ASC";
```

### Клиентская часть

**Файл:** `catalog_menu.tpl` или `mobile_menu.tpl`

#### Отображение

Модуль может использовать разные шаблоны:

- `catalog_menu.tpl` - Основное меню каталога
- `mobile_menu.tpl` - Мобильное меню

#### Структура в шаблоне

```smarty
{foreach from=$categories item=category}
    <li>
        <a href="/catalog/{$category.id}/">{$category.name}</a>
        {if $category.children|@count > 0}
            <ul>
                {foreach from=$category.children item=child}
                    <!-- Рекурсивное отображение -->
                {/foreach}
            </ul>
        {/if}
    </li>
{/foreach}
```

## Использование

### Вызов модуля

```smarty
{mod path="sfera/" mod_name="catalog_menu"}
```

или с указанием шаблона:

```smarty
{mod path="sfera/" mod_name="catalog_menu" tpl="mobile_menu"}
```

## Файлы

- `catalog_menu.class.php` - Серверная логика
- `catalog_menu.tpl` - Шаблон основного меню
- `mobile_menu.tpl` - Шаблон мобильного меню

## Зависимости

- Таблица `tree` - структура категорий
- Smarty - для рендеринга шаблонов

## Особенности

1. **Рекурсивность:** Поддержка неограниченной вложенности категорий
2. **Гибкость:** Возможность выбора шаблона
3. **Сортировка:** Категории сортируются по алфавиту
4. **Производительность:** Эффективная рекурсивная загрузка

