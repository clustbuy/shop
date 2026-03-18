<?php 
include_once('site/classes/aModule.class.php');
include_once('site/functions/getDataFromPath.php');

class category extends aModule
{
    function execute($arr)
    {

        //echo "<pre>"; print_r($arr); echo "</pre>"; die();

        $sorting = 'name';
        $order_by = 'name ASC';
        if (isset($arr['send_params']['sorting'])){
            $sorting = $arr['send_params']['sorting'];
            switch ($arr['send_params']['sorting']){
                case 'name':
                    $order_by = 'name ASC';
                    break;
                case 'name_desc':
                    $order_by = 'name DESC';
                    break;
            }
        }

        $start_limit = 120; // ITEMS_PER_PAGE
        $ajax_load_limit = 120;

        $data = getDataFromPath($arr['send_params']['q']);
        $page = $arr['send_params']['page'] ?? 1;
        $limit = ($page > 1)? $ajax_load_limit : $start_limit;
        $offset = ($page > 1)?$start_limit + ($page - 2) * $limit : 0;

        //echo "<pre>"; print_r($data); echo "</pre>";
    	//echo '<script> var arr = ' .json_encode($arr). ';console.log(arr);</script>'; //die();

    	//$category = intval($data['category']);
        //echo '<script> var category = ' .json_encode($category). ';console.log(category);</script>';

    	$category_data = array();
    	$where = "1=1"; // По умолчанию выбираем все товары
    	
    	if(!isset($data['category']) || strlen($data['category']) == 0)
        {
            $data['category'] = '';
        }
        else
        {
            $category_id_safe = noSQL($data['category']);
            $category_data = rows("SELECT * FROM tree WHERE BINARY id = BINARY '$category_id_safe'");

            if(count($category_data)==0)
            {
                $node_safe = noSQL($data['category']);
                if(count(rows("SELECT * FROM products WHERE BINARY category_id = BINARY '$node_safe'")) == 0)
                {
                    http_response_code(404);
                    print ($_SESSION['smarty']->fetch('sfera/tpl/404.tpl'));	die();
                }
                else
                {
                    $where = "BINARY category_id = BINARY '$node_safe'";
                }
            }
            else
            {
                $categories = $this->get_subcategies_ids($category_data[0]);
                //echo "<pre>"; print_r($categories); echo "</pre>"; //die();

                if (count($categories) > 0) {
                    $categories_safe = array_map(function($id) {
                        return "'" . noSQL($id) . "'";
                    }, $categories);
                    $where = "BINARY category_id IN (" . implode(',', $categories_safe) . ")";
                } else {
                    $where = "BINARY category_id = BINARY '$category_id_safe'";
                }
            }
        }

        //echo "<pre>"; print_r($category_data); echo "</pre>"; //die();
        //echo "<pre>"; print_r($categories); echo "</pre>"; //die();
    	//echo '<script> var category_data = ' .json_encode($categories)."; console.log('category_data',category_data); </script>"; //die();

        $query_limit = 'LIMIT '.$limit . ' OFFSET '.$offset;

        $query = "SELECT * FROM `products` WHERE $where ORDER BY $order_by $query_limit ";
        //echo "<pre>"; print_r($query); echo "</pre>"; //die();

        $items = rows($query);//,'guid');
        if (!$items) {
            $items = array();
        }

        $total_items = row("SELECT COUNT(*) AS total FROM products WHERE $where");
        $total_count = isset($total_items['total']) ? intval($total_items['total']) : 0;

        $total_pages = ($total_items['total'] > $start_limit)? (1 + ceil(($total_items['total'] - $start_limit) / $ajax_load_limit)) : 1;

        /*echo "<pre>"; print_r($query); echo "</pre>";*/
        $_SESSION['ts']['category56'] = (string)get_period();

        foreach($items as $k=>$v)
        {
            $vowels = array("&lt;p&gt;", ""); //&lt;p&gt;

            if (isset($v['description'])) {
                $items[$k]['description'] = str_replace( $vowels, '', $v['description']);
            }

            //$items[$k] = array_merge($v,getProductImages($v));
            //$items[$k]['thumbnails'] = rows("SELECT img_name FROM _photos WHERE CATEGORY NOT LIKE 'F' AND guid = ".$v['guid']." ORDER BY  CATEGORY DESC,  sort ASC ");

            //if ($v['cost'] > ITEM_COST)
            //{
            //    $items[$k]['bonus'] = round(($v['cost'] - $v['bill']) * BONUS_RATIO, 0);
            //}
            //else
            //{
            //    $items[$k]['bonus'] = 0;
            //}

            /*
            $w=0;$l=0;$h=0;$volume=0;
            foreach(rows("SELECT * FROM v_item_dimensions WHERE guid = ".$v["guid"]) as $d)
            {$w = $d['width'];$l = $d['long'];$h = $d['height'] * $v["min"]; $volume = $w*$l*$h/1000000;}

            $pieces=1;
            foreach(rows("SELECT * FROM v_item_pieces WHERE guid = ".$v["guid"]) as $pi)
            {$pieces = $pi['pieces']; $piece_weight = $cart_item['weight'] / $pieces; $piece_cost = $cart_item["cost"] / ($v["min"] * $pieces) ;}

            $items[$k]['pieces'] = $pieces;
            $items[$k]['piece_cost'] = $piece_cost;
            $items[$k]['w'] = $w;
            $items[$k]['l'] = $l;
            $items[$k]['h'] = $h;
            $items[$k]['volume'] = $volume;
            if ($volume > 0 ) {$items[$k]['ro'] = $v["weight"]/$volume;}
            */

            // единица измерения - штука, набор, ..
            /*
            $items[$k]['measure'] = 'шт.';
            if(strstr($items[$k]['title'], 'Набор')) {  $items[$k]['measure'] = 'набор'.fins_sush( $count=$items[$k]['min'], $default='ов' );    }
            else
                if(strstr($items[$k]['title'], 'упаковк')) {  $items[$k]['measure'] = 'упаков'.fins( $items[$k]['min'], 'ку', 'ки', 'ок' );    }
                else
                    if(strstr($items[$k]['title'], 'блистер')) {  $items[$k]['measure'] = 'блистер'.fins( $items[$k]['min'], '', 'а', 'ов' );    }
                    else
                    {
                        preg_match('/([\d]+) ?шт/', $items[$k]['title'], $matches, PREG_OFFSET_CAPTURE);
                        if($matches[1][0] != '') {  $items[$k]['measure'] = ' упаковок по '.$matches[1][0].' штук'.fins( $matches[1][0], 'у', 'и', '' );    }

                    }
            */

            /*if($v['old_cost']>0)
            {
                $items[$k]['percent_cost'] = round((($v['old_cost'] - $v['cost']) / $v['old_cost'])*100, 0);
            }*/
        }


        $pages = array();
        for($i = 1; $i<=$total_pages; $i++)
        {
            $pages[] = array(
                                'page_num' => $i
            );
        }


        // echo '<script> var items = ' .json_encode($items). ';console.log(items);</script>'; //die();
//        echo '<script> var time_logs = ' .json_encode($_SESSION['ts']). ';console.log(time_logs);</script>'; //die();


        $items_on_page = '0';
        if($page == 1)
        {
            if( $total_count == '1' )
            {
                $items_on_page = '1';
            }
            else
            {
                if( $total_count < $start_limit )
                {
                    $items_on_page = '1-'.$total_count;
                }
                else
                {
                    $items_on_page = '1-'.$start_limit;
                }
            }
        }
        else
        {
            if($page == $total_pages)
            {
                $from = $start_limit+($page-2)*$ajax_load_limit+1;
                $to = $total_count;
            }
            else
            {
                $from = $start_limit+($page-2)*$ajax_load_limit+1;
                $to = $from + $ajax_load_limit - 1;

            }

            $items_on_page = $from.'-'.$to;
        }

        $cat_menu = array();
        $i = 0;
        $category_id_for_menu = isset($data['category']) ? $data['category'] : '';
        foreach($this->get_c($category_id_for_menu)['nodes'] as $k=>$v)
        {
            $i++;

            //echo "<pre>"; print_r($v); echo "</pre>"; //die();

            if($v['active']) $cat_menu['all'][$k] = $v;

            if($i <= 4)
            {
                $cat_menu['part1'][$k] = $v;
            }
            else
            {
                $cat_menu['part2'][$k] = $v;
            }
        }

        $_SESSION['smarty']->assign('cat_menu', $cat_menu);
        $_SESSION['smarty']->assign('items_on_page', $items_on_page);
        $_SESSION['smarty']->assign('links', $pages);
        $_SESSION['smarty']->assign('numPage', $page);
        $_SESSION['smarty']->assign('sorting', $sorting);
        if (count($category_data) > 0) {
            $_SESSION['smarty']->assign('category', $category_data[0]);
        } else {
            $_SESSION['smarty']->assign('category', array('id' => '', 'name' => ''));
        }
        $_SESSION['smarty']->assign('totalCount', $total_count);
        $_SESSION['smarty']->assign('total_pages', $total_pages);
        $_SESSION['smarty']->assign('items_r', $items);
        $_SESSION['smarty']->assign('items_json', json_encode($items));

        $_SESSION['smarty']->display('sfera/category/d.tpl');


    }

    function get_c($node)
    {
        $nodes = array();
        $items_count = 0;
        
        if (empty($node)) {
            $where = "(parent_id = '' OR parent_id IS NULL)";
        } else {
            $node_safe = noSQL($node);
            $where = "BINARY parent_id = BINARY '$node_safe'";
        }
        
        $res = rows("SELECT 
                                    t.id,
                                    t.name as title,
                                    t.parent_id,
                                    1 as active
                        FROM tree t 
                        WHERE $where ORDER BY t.name ASC", "id");
        if(count($res)>0)
        {
            foreach($res as $k=>$t)
            {
                $child_id_safe = noSQL($t['id']);
                $result = rows("SELECT id FROM tree WHERE BINARY parent_id = BINARY '$child_id_safe'");

                if(count($result)>0)
                {
                    $arr = $this->get_c($t['id']);

                    $res[$k]['childrens'] = $arr['nodes'];
                    $res[$k]['items_count'] = $arr['items_count'];
                } else {
                    $res[$k]['items_count'] = 0;
                }
                $items_count += isset($res[$k]['items_count']) ? $res[$k]['items_count'] : 0;
            }
        }
        return array('nodes' => $res, 'items_count' => $items_count) ;
    }
    
    private function get_subcategies_ids($category)
    {
        $ids = array($category['id']);
        $category_id_safe = noSQL($category['id']);
        $children = rows("SELECT id, name FROM tree WHERE BINARY parent_id = BINARY '$category_id_safe'");
        
        foreach($children as $child) {
            $ids = array_merge($ids, $this->get_subcategies_ids($child));
        }
        
        return $ids;
    }
}
