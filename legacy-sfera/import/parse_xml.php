<?php
session_start();
require 'vendor/autoload.php';
include_once('site/libs/config.php');
require_once('site/libs/smarty/Smarty.class.php');
require_once('site/libs/mysql.php');
include_once('site/functions.php');
include_once('site/classes/aModule.class.php');
include_once('site/classes/router.class.php');



$xml = simplexml_load_file('File1C.xml');

// Рекурсивная функция для прохода и сохранения групп
function saveGroups($groups, $parentId = null) {
    foreach ($groups as $group) {
        $id = (string)$group->Ид;
        $name = (string)$group->Наименование;
        // Вставка или обновление категории
        $stmt = q("REPLACE INTO categories (id, name, parent_id) VALUES ('".$id."', '".$name."', '".$parentId."')");

        // Если есть вложенные группы — рекурсивно вызываем
        if (isset($group->Группы->Группа)) {
            saveGroups($group->Группы->Группа, $id);
        }
    }
}

// Запуск сохранения категорий
saveGroups($xml->Классификатор->Группы->Группа, null);

foreach ($xml->Классификатор->ТипыЦен->ТипЦены as $priceType) {
    $id = (string)$priceType->Ид;
    $name = (string)$priceType->Наименование;
    $currency = (string)$priceType->Валюта;
    // Запись в БД
    $stmt = q("REPLACE INTO price_types  (id, name, currency) VALUES ('".$id."', '".$name."', '".$currency."')");

}

foreach ($xml->Классификатор->Свойства->Свойство as $property) {
    $id = (string)$property->Ид;
    $name = (string)$property->Наименование;
    $value_type = (string)$property->ТипЗначений;
    // Запись в БД
    $stmt = q("REPLACE INTO product_properties  (id, name, value_type) VALUES ('".$id."', '".$name."', '".$value_type."')");

}

foreach ($xml->Каталог->Товары->Товар as $product) {
    $id = (string)$product->Ид;
    $sku = (string)$product->Артикул;
    $code = (string)$product->Код;
    $name = (string)$product->Наименование;
    $description = (string)$product->Описание;
    $picture = (string)$product->Картинка;
    $baseUnit = (string)$product->БазоваяЕдиница;
    $quantity = (int)$product->Количество;

    // Цены (могут быть несколько)
    $prices = [];
    foreach ($product->Цены->Цена as $price) {
        $priceTypeId = (string)$price->ИдТипаЦены;
        $priceValue = (float)$price->ЦенаЗаЕдиницу;
        $prices[$priceTypeId] = $priceValue;
    }

    // Категории товара
    $categories = [];
    foreach ($product->Группы->Ид as $catId) {
        $categories[] = (string)$catId;
    }

    // Дополнительные реквизиты - можно сохранить в JSON или отдельной таблице
    $attributes = [];
    foreach ($product->ЗначенияРеквизитов->ЗначениеРеквизита as $attr) {
        $attrName = (string)$attr->Наименование;
        $attrValue = (string)$attr->Значение;
        $attributes[$attrName] = $attrValue;
    }

    // SQL вставка (пример с PDO, параметры нужно адаптировать под вашу структуру)
    $stmt = q("INSERT INTO products (
                      id, 
                      category_id,
                      sku, 
                      code, 
                      name, 
                      description, 
                      picture, 
                      base_unit, 
                      quantity, 
                      attributes_json
                      ) VALUES (
                                '".$id."', 
                                '".$categories[0]."',
                                '".$sku."', 
                                '".$code."',
                                '".$name."',
                                '".$description."', 
                                '".$picture."', 
                                '".$baseUnit."', 
                                '".$quantity."',
                                '".json_encode($attributes, JSON_UNESCAPED_UNICODE)."'
                    ) ON DUPLICATE KEY UPDATE 
                    name = VALUES(name),
                    description = VALUES(description),
                    picture = VALUES(picture)"
    );



    // Для цен и категорий сделайте отдельные вставки в связанные таблицы
    // Например, цены в таблицу product_prices, категории в product_categories
}
