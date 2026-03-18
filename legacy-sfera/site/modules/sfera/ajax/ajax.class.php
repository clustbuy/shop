<?php include_once('site/classes/aModule.class.php');

class ajax extends aModule
{
    function execute($arr)
    {

        header('Access-Control-Allow-Origin: *');

        //echo json_encode($arr);
    	$p = $arr['send_params'];
        switch ($p['task']) {

            case 'logout':                  $this->logout();                                              break;
            case 'save_subscriber_email':          $this->save_subscriber_email($p);                      break;
            case 'search_data_fetch':          $this->search_data_fetch($p);                      break;
            case 'search_products':          $this->search_products($p);                      break;
            case 'search_authors':          $this->search_authors($p);                      break;
            default:
                        echo json_encode(array('success' => 'false', 'message' => 'Запрос не распознан'));
                break;

        }
        die(); 
    }


    function search_data_fetch($p)
    {

        $res = rows("SELECT guid, title FROM items WHERE title LIKE '".$p['s']."%' ");
        if(count($res) > 0)
        {
            echo json_encode(array('success' => 'true', 'rows' => $res));
        }
    }

    function save_subscriber_email($p)
    {

        $id = insert('subscribers', ['email' => $p["email"]]);
        if($id > 0)
        {
            echo json_encode(array('success' => 'true', 'message' => 'Подписка сохранена'));
        }
    }

    function search_products($p)
    {
        header('Content-Type: application/json; charset=utf-8');
        
        $query = isset($p['query']) ? trim($p['query']) : '';
        
        if (empty($query) || mb_strlen($query) < 2) {
            echo json_encode(array('success' => 'true', 'rows' => array()));
            return;
        }
        
        $query_safe = noSQL($query);
        
        // Поиск товаров по названию, ограничиваем 10 результатами, сортируем по алфавиту
        $res = rows("SELECT id, name FROM products 
                     WHERE name LIKE '%$query_safe%' 
                     ORDER BY name ASC 
                     LIMIT 10");
        
        if(count($res) > 0)
        {
            echo json_encode(array('success' => 'true', 'rows' => $res));
        } else {
            echo json_encode(array('success' => 'true', 'rows' => array()));
        }
    }
    
    function search_authors($p)
    {
        header('Content-Type: application/json; charset=utf-8');
        
        $query = isset($p['query']) ? trim($p['query']) : '';
        
        if (empty($query) || mb_strlen($query) < 2) {
            echo json_encode(array('success' => 'true', 'rows' => array()));
            return;
        }
        
        $query_safe = noSQL($query);
        
        // Поиск авторов по имени, ограничиваем 10 результатами, сортируем по алфавиту
        $res = rows("SELECT DISTINCT author_name as name, COUNT(*) as count
                     FROM authors 
                     WHERE author_name LIKE '%$query_safe%'
                     GROUP BY author_name
                     ORDER BY author_name ASC 
                     LIMIT 10");
        
        if(count($res) > 0)
        {
            echo json_encode(array('success' => 'true', 'rows' => $res));
        } else {
            echo json_encode(array('success' => 'true', 'rows' => array()));
        }
    }
}