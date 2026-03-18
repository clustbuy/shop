<?php
/**
 * Получить URL изображения товара
 * Проверяет наличие товара в v_products_o_products и берет primary_image из o_products
 * Если товара нет в v_products_o_products, использует стандартный путь /import_files/{id}b.jpg
 *
 * @param string $product_id ID товара (offer_id)
 * @return string URL изображения товара
 */
function getProductImageUrl($product_id)
{
    if (empty($product_id)) {
        return '/assets/img/product_empty.jpg';
    }

    $product_id_safe = noSQL($product_id);

    // Проверяем наличие товара в v_products_o_products
    $ozon_product = row("SELECT product_id FROM v_products_o_products WHERE offer_id = '$product_id_safe' LIMIT 1");

    if ($ozon_product && !empty($ozon_product['product_id'])) {
        // Товар найден в v_products_o_products, получаем primary_image из o_products
        $ozon_product_id = noSQL($ozon_product['product_id']);
        $o_image = row("SELECT * FROM o_images WHERE product_id = '$ozon_product_id' AND image_order = 0");

            // Возвращаем адрес изображения из o_images
            return "/o_images/".$o_image['product_id']."/0.jpg";

    }

    // Если товара нет в v_products_o_products, используем стандартный путь
    return '/import_files/' . $product_id_safe . 'b.jpg';
}


?>