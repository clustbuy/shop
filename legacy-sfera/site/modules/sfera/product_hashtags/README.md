# Модуль product_hashtags

## Описание

Модуль для отображения хэштегов на карточке товара. Получает хэштеги из таблицы `product_hashtags` через связку с `v_products_o_products`.

## Принцип работы

1. Модуль получает `product_id` товара (из таблицы `products`)
2. Ищет соответствующий `product_id` в Ozon через view `v_products_o_products` (где `offer_id` = `product_id`)
3. По найденному `product_id` (из Ozon) получает хэштеги из `product_hashtags`
4. Если товара нет в `v_products_o_products` - хэштеги не отображаются

## SQL запрос

```sql
SELECT DISTINCT ph.value
FROM v_products_o_products vpo
INNER JOIN product_hashtags ph ON vpo.product_id = ph.product_id
WHERE vpo.offer_id = '$product_id'
ORDER BY ph.value ASC
```

## Использование в шаблонах

### Вызов модуля

```smarty
~~mod path="sfera/" mod_name="product_hashtags" product_id=$product_id~
```

### Параметры

- **product_id** - ID товара из таблицы `products` (обязательный параметр)

## Вывод

Модуль выводит список хэштегов в виде ссылок:

```html
<div class="product-hashtags">
    <div class="hashtags-label">Теги:</div>
    <div class="hashtags-list">
        <a href="/hashtag/%23логопедические_книги/" class="hashtag-link">#логопедические_книги</a>
        <a href="/hashtag/%23развиваем_речь/" class="hashtag-link">#развиваем_речь</a>
        <a href="/hashtag/%23подготовка_к_школе/" class="hashtag-link">#подготовка_к_школе</a>
    </div>
</div>
```

Если хэштегов нет - ничего не выводится.

## Стили

Стили находятся в файле: `assets/sfera/css/product-hashtags.css`

## Интеграция

Модуль уже интегрирован в карточку товара (`site/modules/sfera/product/product.tpl`) после блока описания.

## Связь с другими модулями

- **hashtag_products** - модуль для отображения всех товаров с конкретным хэштегом
- **v_products_o_products** - view для связки товаров с Ozon
- **product_hashtags** - таблица с хэштегами

## Зависимости

- Таблица `product_hashtags` должна быть создана и заполнена
- View `v_products_o_products` должна существовать
- Модуль `hashtag_products` для обработки ссылок на хэштеги

