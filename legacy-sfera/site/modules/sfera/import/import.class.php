<?php
include_once('site/classes/aModule.class.php');
require_once('site/classes/pagination.class.php');
require_once('site/libs/mysql.php');
require_once('site/libs/smarty/Smarty.class.php');

function importFromYML($file)
{

    //echo "<pre>"; print_r($file); echo "</pre>";

    $array = XML2Array::createArray($file);
    $_SESSION['dbname'] = 'market';

    /*
    $company = htmlspecialchars_decode($array['yml_catalog']['shop']['company']);
    $merchant_where = array(
        'name' => $company,
    );


    $merchant = select('merchants', '*', $merchant_where);

    if (empty($merchant)) {
        $merchant_data = array(
            'name' =>  $company,
        );
        $merchant_id = insert('merchants', $merchant_data);
        $merchant['id'] = $merchant_id;
    }*/

    $cats = $array['yml_catalog']['shop']['categories']['category'];

    $categories = array();

    foreach ($cats as $category) {

            $categories[$category['attributes']['id']] = array(
                'title'         => $category['value'],
                'id'            => $category['attributes']['id'],
            );
            if ($category['attributes']['parentId'] != '') {
                $categories[$category['attributes']['id']]['parent_id'] = $category['attributes']['parentId'];
            }

            $yml_cat_where = array(
                'id' => $category['attributes']['id'],
            );
            $yml_cat = select('tree', '*', $yml_cat_where);

            if (empty($yml_cat)) {
                $yml_cat_data = array(
                    'id' => $category['attributes']['id'],
                    'title' => $category['value'],
                );
                if ($category['attributes']['parentId'] != '') {
                    $yml_cat_data['parent_id'] = $category['attributes']['parentId'];
                }

                insert('tree', $yml_cat_data);
            }

    }

    //echo "<pre>"; print_r($categories); echo "</pre>";
    //die();


    $items = array();
    $offers = $array['yml_catalog']['shop']['offers']['offer'];
    foreach ($offers as $offer) {
        $item_where = array('guid' => $offer['attributes']['id']);
        $item = select('items', '*', $item_where);

        $main_picture = '';
        $pictures = array();
        if (is_array($offer['picture'])) {
            $main_picture = $offer['picture'][0];
            $pictures = $offer['picture'];
        } else {
            $main_picture = $offer['picture'];
            array_push($pictures, $offer['picture']);
        }


        /*
        $brand_id = NULL;
        if (isset($offer['vendor'])) {
            $brand_where = array(
                'name' => $offer['vendor'],
                'merchant_id' => $merchant['id'],
            );
            $brand = select('brands', '*', $brand_where);

            if (empty($brand)) {
                $brand_data = array(
                    'name' => $offer['vendor'],
                    'merchant_id' => $merchant['id'],
                );
                $brand_id = insert('brands', $brand_data);
            } else {
                $brand_id = $brand['id'];
            }
            $vendors[] = $offer['vendor'];
        }
        */

        $item_data = array(
            'active' => $offer['attributes']['available'] == 'true' ? 1 : 0,
            'guid' => $offer['attributes']['id'],
            'title' => str_replace('(-)', '', $offer['name']),
            'art' => $offer['vendorCode'],
            'cost' => $offer['price'],
            'img_url' => $main_picture,
            'description' => $offer['description']['cdata'],
            //'withDiscount' => 0,
            //'isNew' => 0,
            //'isTop' => 0,
            //'isProfit' => 0,
            //'isAddParts' => 0,
            //'add_related_products' => 0,
            //'merchant_id' => $merchant['id'],
            'node' => $offer['categoryId']
        );
        /*
        if (isset($brand_id)) {
            $item_data['brand_id'] = $brand_id;
        }*/

        // Установка признака существования картинки.
        /*
        if ($main_picture == '') {
            $item_data['no_img'] = 1;
        } else {
            if (!isRemoteImageExists($main_picture)) {
                $item_data['no_img'] = 1;
            }
        }*/

        $item_guid = $item_data['guid'];
        if (empty($item)) {
            insert('items', $item_data);
        } else {
            update('items', $item_where, $item_data);
        }



        foreach ($pictures as $img_url) {
            if ($img_url == '') {
                continue;
            }

            /*
            $picture_where = array(
                'item_guid' => $item_guid,
                'url' => $img_url
            );
            $picture = select('gallery', '*', $picture_where);
            // Добавлять только существующие картинки.
            if (!isRemoteImageExists($img_url)) {
                continue;
            }*/

            $picture_data = array(
                'item_guid' => $item_guid,
                'url' => $img_url
            );

            //if (empty($picture)) {
                insert('gallery', $picture_data);
            /*} else {
                update('gallery', $picture_where, $picture_data);
            }*/
        }



        if (isset($offer['param'])) {
            foreach ($offer['param'] as $param) {
                // parameters
                $paramName = $param['attributes']['name'];
                $paramValue = $param['value'];

                $parameter_data = array(
                    'title' => $paramName,
                    'item_guid' => $item_guid,
                    'val' => $paramValue

                );

                insert('parameters', $parameter_data);

                // measurements
                /*
                if (isset($param['attributes']['unit'])) {
                    $measurementName = $param['attributes']['unit'];

                    $measurement_where = array(
                        'name' => $measurementName,
                    );
                    $measurement_data = array(
                        'name' => $measurementName,
                        'value' => 0,
                        'type' => 0,
                    );
                    $measure_id = insertOrUpdate('measurements', $measurement_where, $measurement_data);
                }
                */

                // p_values
                /*
                $values = array();
                if (canSplitValue($paramName)) {
                    $values = explode(',', $param['value']);
                } else {
                    array_push($values, $param['value']);
                }
                foreach ($values as $value) {
                    $pValue_where = array(
                        'value' => trim($value),
                        'parameter_id' => $parameter_id,
                        'item_id' => $item_id,
                    );
                    $pValue_data = array(
                        'value' => trim($value),
                        'parameter_id' => $parameter_id,
                        'item_id' => $item_id,
                    );

                    if (isset($param['attributes']['unit'])) {
                        $pValue_data['measure_id'] = $measure_id;
                    }

                    insertOrUpdate('p_values', $pValue_where, $pValue_data);
                }
                */
            }
        }

    }
    //echo "<pre>"; print_r($items); echo "</pre>";


}

function transliterate($string)
{
    $roman = array("sch", "sch", 'yo', 'zh', 'kh', 'ts', 'ch', 'sh', 'yu', 'ya', 'yo', 'zh', 'kh', 'ts', 'ch', 'sh', 'yu', 'ya', 'a', 'b', 'v', 'g', 'd', 'e', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', '', 'y', '', 'e', 'a', 'b', 'v', 'g', 'd', 'e', 'z', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', '', 'y', '', 'e', '_');
    $cyrillic = array("Щ", "щ", 'Ё', 'Ж', 'Х', 'Ц', 'Ч', 'Ш', 'Ю', 'я', 'ё', 'ж', 'х', 'ц', 'ч', 'ш', 'ю', 'я', 'А', 'Б', 'В', 'Г', 'Д', 'Е', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Ь', 'Ы', 'Ъ', 'Э', 'а', 'б', 'в', 'г', 'д', 'е', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'ь', 'ы', 'ъ', 'э', ' ');
    return str_replace($cyrillic, $roman, $string);
}

function canSplitValue($parameterName)
{
    $notSplitted = array('вес', 'размеры', 'размер', 'объём', 'объем', 'длина', 'ширина', 'высота', 'площадь', 'диагональ');

    return !in_array(mb_strtolower($parameterName), $notSplitted);
}

class import extends aModule
{
    function execute($arr)
    {
        //echo "<pre>"; print_r($arr); echo "</pre>";

        // получить файл в строку

        //$url = 'https://www.armed.ru/bitrix/catalog_export/yandex_904903.php';
        $url = 'https://www.armed.ru/yml/?token=848D8E58E0E329E66D892B56C3451458';

        $file = file_get_contents($url);
        importFromYML($file);


        die();

        if (
            isset($_FILES['uploadedFile']) &&
            $_FILES['uploadedFile']['error'] === UPLOAD_ERR_OK &&
            $_FILES['uploadedFile']['type'] === 'text/xml'
        ) {
            $file = file_get_contents($_FILES['uploadedFile']['tmp_name']);
            importFromYML($file);
        }



        $data = getDataFromPath();
        $page = isset($data['page']) ? $data['page'] : 1;

        $items_query = array();
        $items_query['what'] = 'it.*, b.name AS brand';
        $items_query['from'] = 'items it LEFT JOIN brands b ON it.brand_id  = b.id';
        $items_query['where'] = 'node = 0 AND (no_img != 1 OR no_img IS NULL) AND active = 1';
        $items_query['limit'] = ITEMS_PER_PAGE . ' OFFSET ' . ($page - 1) * ITEMS_PER_PAGE;

        $items = array();
        $items = sel($items_query);

        if (empty($items)) {
            $_SESSION['smarty']->display('sfera/import/import_blank.tpl');
            die();
        }

        $categories = selects('yml_cat', '*');

        $c_data = array(
            'is_category' => 1,
            'current' => array(
                'id' => 1,
                'title' => 'Импортируемые товары',
                'parent_id' => 0,
            ),
            'breadcrumbs' => array(),  // todo
            'tree' => $categories,
        );

        $_SESSION['smarty']->assign('c_data', $c_data); // передача в шаблоны данных по категориям

        $pag = new pagination();
        $pagination = $pag->execute($page, '/import', ITEMS_PER_PAGE, $items_query['where']);

        $category = $c_data['current'];
        $_SESSION['smarty']->assign('category', $category);
        $_SESSION['smarty']->assign('categories', $categories);
        $_SESSION['smarty']->assign('items', $items);
        $_SESSION['smarty']->assign('page', $page);
        $_SESSION['smarty']->assign('pagination', $pagination);
        $_SESSION['smarty']->display('sfera/import/import.tpl');
    }
}

/**
 * XML2Array: A class to convert XML to an array in PHP
 * Takes a DOMDocument object or an XML string as input.
 *
 * See Array2XML: http://www.lalit.org/lab/convert-php-array-to-xml-with-attributes
 *
 * Author : Lalit Patel, Verdant Industries
 * Website: http://www.lalit.org/lab/convert-xml-to-array-in-php-xml2array
 * License: Apache License 2.0
 *          http://www.apache.org/licenses/LICENSE-2.0
 * Version: 0.1 (07 Dec 2011)
 * Version: 0.2 (04 Mar 2012)
 *             Fixed typo 'DomDocument' to 'DOMDocument'
 * Version: 0.3 (26 August 2013), Verdant Industries
 *          - Converted from static usage to instance usage with static facade for compatibility
 *          - Added configurable attribute/cdata/value special keys
 *          - Added configurable option to retain tag and attribute namespacing
 *
 * Usage:
 *       $array = XML2Array::createArray($xml);
 *       $array = XML2Array::createArray($xml, array('useNamespaces' => true));
 */
class XML2Array
{
    /**
     * The name of the XML attribute that indicates a namespace definition
     */
    const ATTRIBUTE_NAMESPACE = 'xmlns';
    /**
     * The string that separates the namespace attribute from the prefix for the namespace
     */
    const ATTRIBUTE_NAMESPACE_SEPARATOR = ':';

    /**
     * The configuration of the current instance
     * @var array
     */
    public $config = array();

    /**
     * The working XML document
     * @var \DOMDocument
     */
    protected $xml = null;

    /**
     * The working list of XML namespaces
     * @var array
     */
    protected $namespaces = array();

    /**
     * Constructor
     * @param array $config The configuration to use for this instance
     */
    public function __construct($config = array())
    {
        // The default configuration, set for backwards compatibility
        $this->config = array(
            'version'       => '1.0',
            'encoding'      => 'UTF-8',
            'attributesKey' => 'attributes',
            'cdataKey'      => 'cdata',
            'valueKey'      => 'value',
            'useNamespaces' => false,
        );
        if (!empty($config) && is_array($config)) {
            $this->config = array_merge($this->config, $config);
        }
    }

    /**
     * Initialise the instance for a conversion
     */
    protected function init()
    {
        $this->xml = null;
        $this->namespaces = array();
    }

    /**
     * Creates a blank working XML document
     */
    protected function createDomDocument()
    {
        return new \DOMDocument($this->config['version'], $this->config['encoding']);
    }

    /**
     * Convert an XML DOMDocument or XML string to an array
     * A static facade for ease of use and backwards compatibility
     * @param DOMDocument|string $inputXml The XML to convert to an array
     * @param array $config The configuration to use for the conversion
     * @return array An array representation of the input XML
     */
    public static function &createArray($inputXml, $config = array())
    {
        $instance = new XML2Array($config);
        return $instance->buildArray($inputXml);
    }

    /**
     * Convert an XML DOMDocument or XML string to an array
     * @param DOMDocument|string $inputXml The XML to convert to an array
     * @return array An array representation of the input XML
     */
    public function &buildArray($inputXml)
    {
        $this->init();

        if (is_string($inputXml)) {
            $this->xml = $this->createDOMDocument();
            $parsed = $this->xml->loadXML($inputXml);
            if (!$parsed) {
                throw new \Exception('[XML2Array] Error parsing the XML string.');
            }
        } elseif ($inputXml instanceof \DOMDocument) {
            $this->xml = $inputXml;
        } else {
            throw new \Exception('[XML2Array] The input XML object should be of type: DOMDocument.');
        }

        // Convert the XML to an array, starting with the root node
        $docNodeName = $this->xml->documentElement->nodeName;
        $array[$docNodeName] = $this->convert($this->xml->documentElement);

        // Add namespacing information to the root node
        if (!empty($this->namespaces)) {
            if (!isset($array[$docNodeName][$this->config['attributesKey']])) {
                $array[$docNodeName][$this->config['attributesKey']] = array();
            }
            foreach ($this->namespaces as $uri => $prefix) {
                if ($prefix) {
                    $prefix = self::ATTRIBUTE_NAMESPACE_SEPARATOR . $prefix;
                }
                $array[$docNodeName][$this->config['attributesKey']][self::ATTRIBUTE_NAMESPACE . $prefix] = $uri;
            }
        }
        return $array;
    }

    /**
     * Convert an XML DOMDocument (or part thereof) to an array
     * @param \DOMNode $node A single XML DOMNode
     * @return array An array representation of the input node
     */
    protected function &convert(\DOMNode $node)
    {
        $output = array();

        $this->collateNamespaces($node);
        switch ($node->nodeType) {
            case XML_CDATA_SECTION_NODE:
                $output[$this->config['cdataKey']] = trim($node->textContent);
                break;

            case XML_TEXT_NODE:
                $output = trim($node->textContent);
                break;

            case XML_ELEMENT_NODE:

                // for each child node, call the covert function recursively
                for ($i = 0, $m = $node->childNodes->length; $i < $m; $i++) {
                    $child = $node->childNodes->item($i);
                    $v = $this->convert($child);
                    if (isset($child->tagName)) {
                        $t = $child->nodeName;

                        // assume more nodes of same kind are coming
                        if (!isset($output[$t])) {
                            $output[$t] = array();
                        }
                        $output[$t][] = $v;
                    } else {
                        //check if it is not an empty text node
                        if ($v !== '') {
                            $output = $v;
                        }
                    }
                }

                if (is_array($output)) {
                    // if only one node of its kind, assign it directly instead if array($value);
                    foreach ($output as $t => $v) {
                        if (is_array($v) && count($v) == 1) {
                            $output[$t] = $v[0];
                        }
                    }
                    if (empty($output)) {
                        //for empty nodes
                        $output = '';
                    }
                }

                // loop through the attributes and collect them
                if ($node->attributes->length) {
                    $a = array();
                    foreach ($node->attributes as $attributeName => $attributeNode) {
                        $attributeName = $attributeNode->nodeName;
                        $a[$attributeName] = (string) $attributeNode->value;
                        $this->collateNamespaces($attributeNode);
                    }
                    // if its an leaf node, store the value in @value instead of directly storing it.
                    if (!is_array($output)) {
                        $output = array($this->config['valueKey'] => $output);
                    }
                    $output[$this->config['attributesKey']] = $a;
                }
                break;
        }
        return $output;
    }

    /**
     * Get the namespace of the supplied node, and add it to the list of known namespaces for this document
     * @param \DOMNode $node
     */
    protected function collateNamespaces(\DOMNode $node)
    {
        if (
            $this->config['useNamespaces'] && $node->namespaceURI
            && !array_key_exists($node->namespaceURI, $this->namespaces)
        ) {
            $this->namespaces[$node->namespaceURI] = $node->lookupPrefix($node->namespaceURI);
        }
    }
}
