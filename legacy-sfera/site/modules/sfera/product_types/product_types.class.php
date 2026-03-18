<?php
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class product_types extends aModule
{
    function execute($arr)
    {
        $product_type_id = isset($_GET['product_type_id']) ? (int)$_GET['product_type_id'] : 0;

        if ($product_type_id > 0) {
            // Если указан ID типа товара, перенаправляем на модуль product_type
            header('Location: /product_type/?product_type_id=' . $product_type_id);
            die();
        }
        
        $this->showProductTypesList();
    }
    
    private function showProductTypesList()
    {
        $query = "SELECT 
                    id,
                    value AS name,
                    cnt AS count
                  FROM v_tip_tovara
                  ORDER BY value ASC";
        
        $result = rows($query);
        
        $product_types = [];
        if ($result && is_array($result)) {
            foreach ($result as $row) {
                $product_types[] = [
                    'id' => intval($row['id']),
                    'name' => $row['name'],
                    'count' => intval($row['count'])
                ];
            }
        }
        
        $groupedProductTypes = [];
        foreach ($product_types as $product_type) {
            if (!empty($product_type['name'])) {
                $firstLetter = mb_strtoupper(mb_substr($product_type['name'], 0, 1, 'UTF-8'), 'UTF-8');
                if (!preg_match('/[А-ЯЁA-Z]/u', $firstLetter)) {
                    $firstLetter = '#';
                }
                if (!isset($groupedProductTypes[$firstLetter])) {
                    $groupedProductTypes[$firstLetter] = [];
                }
                $groupedProductTypes[$firstLetter][] = $product_type;
            }
        }
        
        ksort($groupedProductTypes);
        
        $_SESSION['smarty']->assign('product_types', $product_types);
        $_SESSION['smarty']->assign('groupedProductTypes', $groupedProductTypes);
        $_SESSION['smarty']->assign('pageTitle', 'Типы товаров');
        
        $templatePath = 'site/modules/sfera/product_types/product_types.tpl';
        if (!file_exists($templatePath)) {
            die("ERROR: Template not found: $templatePath");
        }
        
        try {
            $_SESSION['smarty']->display('sfera/product_types/product_types.tpl');
        } catch (Exception $e) {
            die("ERROR displaying template: " . $e->getMessage());
        }
    }
}

