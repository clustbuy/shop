<?php class aModule{

	var $action = "";
	protected $p;
	protected $ID;

	private $db = null;

 	protected $DBHOST;
 	protected $DBNAME;
 	protected $DBUSER;
 	protected $DBPASS;
 	protected $PREFIX;
 	protected $PCONNECT;
 	protected $dbid;
	protected $mysql;
	protected $output;

	function __construct(){



		$this->p = $_REQUEST;
		$this->ID = $this->id();

		$this->PREFIX = '';
		$this->PCONNECT = 0;
		$this->dbid = false;
		$this->mysql['sql'] = "";

		$this->DBHOST = DB_HOST;
		$this->DBNAME = DB_NAME;
		$this->DBUSER = DB_USER;
		$this->DBPASS = DB_PASS;

		$this->db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		$GLOBALS['dbid'] = $this->db; 

		$this->db->set_charset('utf8');



        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }


	}

    public function __call($storeProcedureName, $params)
    {
        $quotedParams = array ();
        foreach ($params as $param)
        {
            array_push($quotedParams, $param === null?'NULL':'"'.$param.'"');
        }
        $sql = 'CALL '.$storeProcedureName.'('.implode(',', $quotedParams).');';
        $this->db->multi_query($sql);
        $results = array ();
        do
        {
            if ($result = $this->db->store_result())
            {
                $rows = array ();
                while ($row = $result->fetch_assoc())
                {
                    array_push($rows, $row);
                }
                $result->close();
                array_push($results, $rows);
            }
        } while ($this->db->more_results() && $this->db->next_result());
        return ($results);
    }

    public function call_sp($sp_arr)
    {

        //echo "<pre>"; print_r($sp_arr); echo "</pre>"; //die();

        $sql="";
		foreach ($sp_arr as $sp => $value)
		{
	        $quotedParams = array ();
			$storeProcedureName = $value['proc'];

            //echo $storeProcedureName;

	        foreach ($value['p'] as $param)
	        {
	            array_push($quotedParams, $param === null?'NULL':'"'.$param.'"');
	        }
	        $sql .= 'CALL '.$storeProcedureName.'('.implode(',', $quotedParams).');';
		}

        //echo $sql; //die();///////////////// debug
        //$this->insert('_debug', array('id_session' => session_id(), 'sql' => $sql));

        if(!R) 
        {
        	file_put_contents(filter_input(INPUT_SERVER, "DOCUMENT_ROOT")."/logs/sql.log", date("H-m-d H:i:s")." SESSION => ".session_id()." "." SQL =>".$sql."\n", FILE_APPEND | LOCK_EX);
        }

        //$this->db->multi_query($sql);
        $results = array ();

        if ($this->db->multi_query($sql)) {
            do {
                if ($result = $this->db->store_result())
                {
                    $rows = array ();
                    while ($row = $result->fetch_assoc())
                    {
                        array_push($rows, $row);
                    }
                    $result->close();
                    array_push($results, $rows);
                }
            } while ($this->db->more_results() && $this->db->next_result());
        }

        return ($results);
    }

	function mod_execute(array $params , $protocol='HTTP'){
		$this->mod_name=$params['mod_name'];
		$this->action=$params['action'];
		$this->prot=$protocol;
		$params['send_params'] = $_REQUEST;
		$this->execute($params);
	}

	function mod_display($protocol){
		$tpl_path=$this->mod_name.'/'.$this->mod_name.'.tpl';

		switch($protocol){
			case 'HTTP': $_SESSION['smarty']->display($tpl_path);
			break;

			case 'AJAX':  echo json_encode($this->output);
			break;
		}
	}


    function array_random_assoc($arr) {
        $keys = array_keys($arr);
        shuffle($keys);

        $r = array();
        for ($i = 0; $i < count($keys); $i++) {
            $r[$keys[$i]] = $arr[$keys[$i]];
        }
        return $r;
    }


	function id()
	{
		if (isset($this->p['id']) && strlen($this->p['id'])>0)	{return $this->p['id'];}
		//else if(auth::id()) {return auth::id();}
		else {
            $this->p['id']=0;
            //echo " No authentification or ID found "; exit;
            }
		return $this->p['id'];
	}

	function dbconnect() {
		$F = $this->PCONNECT ? 'mysql_pconnect' : 'mysql_connect';
		if (!$this->dbid) $this->dbid = $F($this->DBHOST, $this->DBUSER, $this->DBPASS, true, 199608);
		if (!$this->dbid OR !mysql_select_db($this->DBNAME, $this->dbid)) {
			if (DEBUGMODE) $this->dberror(mysql_error(), mysql_errno());
			exit;
		}

		$this->q("set session character_set_server=utf8;");
		$this->q("set session character_set_database=utf8;");
		$this->q("set session character_set_client=utf8;");
		$this->q("set session character_set_connection=utf8;");
		$this->q("set session character_set_results=utf8;");

	}

	function dbnum($show=false) {
		static $qnum=0;
		if (false !== $show) return $qnum;
		$qnum++;
	}

	function q($query) {

		$this->mysql['affected_rows'] = null;
		$this->mysql['sql'] .= $query."\n";
		$this->mysql['err'] = "";

		if (!$this->dbid) $this->dbconnect();
		$result = mysql_query($query, $this->dbid);

		$this->mysql['affected_rows'] = mysql_affected_rows();
		$this->mysql['insert_id'] = $this->insert_id();

		if (!$result)
		{
			$this->mysql['err'] .= "\n" . mysql_errno() . " => " . mysql_error();
			$result = false;
		}
		$this->dbnum();
		return $result;
	}

	function numrows($result) {
		return mysql_num_rows($result);
	}

	function fetch($q) {
		return mysql_fetch_assoc($q);
	}

	function row($query,$mode='assoc') {
		$row = array();
		if ($q = $this->q($query)) {
			$F = 'mysql_fetch_'.$mode;
			$row = $F($q);
			mysql_free_result($q);
		}
		return $row;
	}

	function rows($query, $setkey=false, $group=false, $subkeys=false) {
		$rows = array();
		if ($q = $this->q($query)) {
			if (false !== $setkey) {
				if (false !== $group) {
					if (false !== $subkeys)
						while ($row = mysql_fetch_assoc($q)) $rows[$row[$setkey]][$row[$subkeys]] = $row;
					else
						while ($row = mysql_fetch_assoc($q)) $rows[$row[$setkey]][] = $row;
				} else
					while ($row = mysql_fetch_assoc($q)) $rows[$row[$setkey]] = $row;
			} else
				while ($row = mysql_fetch_assoc($q))
					$rows[] = $row;
			mysql_free_result($q);
		}
		return $rows;
	}

	function select($table,$what='*',$where='',$limit='') {
		$q = 'SELECT '.$what.' FROM `'.$table.'`'.($where ? ' WHERE '.$where : '');
		return $this->row($q);
	}

	function selects($table,$what='*',$where='',$limit='') {
		$q = 'SELECT '.$what.' FROM `'.$table.'`'.($where ? ' WHERE '.$where : '');
		return $this->rows($q);
	}

	function sel($input,$one=false) {
		$q = array('SELECT');
		$q[] = !empty($input['what']) ? $input['what'] : '*';
		if (is_array($input['from'])) {
			$from = array();
			foreach ($input['from'] as $v)
				$from[] = $v.' as '.$v[0];
			$q[] = 'FROM '.implode(', ', $from);
		} else {
			$q[] = 'FROM '.$input['from'];
		}
		if (!empty($input['where'])) {
			if (is_array($input['where'])) {
				$z = array();
				foreach ($input['where'] as $k=>$v)
					$z[] = $this->esc(stripslashes($k))."='".$this->esc(stripslashes($v))."'";
				$q[] = 'WHERE '.implode(' AND ',$z);
			} else {
				$q[] = 'WHERE '.$input['where'];
			}
		}
		if (!empty($input['order'])) $q[] = 'ORDER BY '.$input['order'];
		if (!empty($input['limit'])) $q[] = 'LIMIT '.$input['limit'];
		$F = $one ? 'row' : 'rows';
		if (is_array($input['from'])) die(implode(' ',$q));
		return $F(implode(' ',$q));
	}

	function insert($table, $values) {
		foreach ($values as $k=>$v)
			$values[$k] = $this->esc(stripslashes(trim($values[$k])));
		$this->q("INSERT INTO `".$this->esc(stripslashes($table))."` (`".implode('`,`',array_keys($values))."`) VALUES ('".implode("','",$values)."')");
		return $this->insert_id();
	}

	function update($table, $where, $values) {
		$q = "UPDATE `".$this->esc(stripslashes($table))."` SET ";
		$z = array();
		foreach ($values as $k=>$v)
			$z[] = $this->esc(stripslashes($k))."='".$this->esc(stripslashes(trim($v)))."'";
		$q .= implode(', ',$z);
		$q .= ' WHERE ';
		$z = array();
		foreach ($where as $k=>$v)
			$z[] = $this->esc(stripslashes($k))."='".$this->esc(stripslashes($v))."'";
		$q .= implode(' AND ',$z);
		return $this->q($q);
	}

	function sql_delete($table, $where) {
		$q = "DELETE FROM `".$this->esc($table)."` WHERE ";
		$z = array();
		foreach ($where as $k=>$v)
			$z[] = $this->esc(stripslashes($k))."='".$this->esc(stripslashes($v))."'";
		$q .= implode(' AND ',$z);
		return $this->q($q) ? true : false;
	}

	function insert_id() {
		return mysql_insert_id($this->dbid);
	}

	function freeresult($q) {
		if ($q) mysql_free_result($q);
	}

	function get_result_fields($result) {
		$fields = array();
		while ($field = mysql_fetch_field($result))
			$fields[] = $field;
		return $fields;
	}

	function fields($table) {
		$names = array();
		$fields = mysql_list_fields($this->DBNAME, $table, $this->dbid);
		$columns = mysql_num_fields($fields);
		for ($i = 0; $i < $columns; $i++)
		    $names[] = mysql_field_name($fields, $i);
		mysql_free_result($fields);
		return $names;
	}

	function dbclose() {
		if ($this->dbid) mysql_close($this->dbid);
	}

	function dberror($error, $error_num, $query = '') {
		$query = preg_replace('#([0-9a-f]){32}#', '********************************', $query);
		//include 'templates/messages/db_error.html';
		exit;
	}

	function esc($str) {
		return mysql_escape_string($str);
	}

	function i($str) {
		return intval($str);
	}

	function get_data($proc, $p)
	{
		$out[] = array(
			'proc' => $proc,
			'p' => $p
		) ;
		$res = $this->call_sp($out);
		//foreach($res[0] as $k => $rr) $res[0][$k]['total_count'] = $res[1][0]['num_rows'];
		$r = $res[0];

		return $r;
	}

	function get_all_data($page)
	{

		$out = array();
		$out[] = array(
			'proc' => "menu_cat_Get_list",
			'p' => array(
				    )
		) ;
		$out[] = array(
			'proc' => "filials_Get_list",
			'p' => array(
				    )
		) ;
		$out[] = array(
			'proc' => "menu_Get_list",
			'p' => array(
				    )
		) ;
		$out[] = array(
			'proc' => "settings_Get_page",
			'p' => array(
					$page
				    )
		) ;
		$out[] = array(
			'proc' => "pages_Get_list",
			'p' => array(
				    )
		) ;
		$res = $this->call_sp($out);

		$r = array();
		$r['menu_cat_Get_list'] = $res[0];
		$r['filials_Get_list'] = $res[1];
		$r['menu_Get_list'] = $res[2];
		$r['settings_Get_page'] = $res[3];
		$r['pages_Get_list'] = $res[4];

		return $r;
	}


	function set_filial($arr, $res)
	{


        if (filter_has_var(INPUT_GET, 'utm_source'))
        {
            $_SESSION['utm_source'] = filter_input(INPUT_GET, 'utm_source');
        }
        if (filter_has_var(INPUT_GET, 'utm_medium'))
        {
            $_SESSION['utm_medium'] = filter_input(INPUT_GET, 'utm_medium');
        }
        if (filter_has_var(INPUT_GET, 'utm_term'))
        {
            $_SESSION['utm_term'] = filter_input(INPUT_GET, 'utm_term');
        }
        if (filter_has_var(INPUT_GET, 'utm_campaign'))
        {
            $_SESSION['utm_campaign'] = filter_input(INPUT_GET, 'utm_campaign');
        }
        if (filter_has_var(INPUT_GET, 'gclid'))
        {
            $_SESSION['gclid'] = filter_input(INPUT_GET, 'gclid');
        }

	    /*$http_host = $_SERVER['HTTP_HOST'];
	    $http_host = str_replace("new.pizzasushiwok.ru", "", $http_host);
	    $http_host = str_replace("pizzasushiwok.ru", "", $http_host);
	    $http_host = str_replace("www.", "", $http_host);
	    $filial_alias = str_replace(".", "", $http_host);*/
        $filial_alias = 'moscow';

        $filials = array();
	    foreach($res['filials_Get_list'] as $k=>$v)
	    {
	    	if($v['value_filial'] == $filial_alias)
	    	{

                $_SESSION['filial'] = $res['filials_Get_list'][$k];
				$_SESSION['smarty']->assign('filial', $res['filials_Get_list'][$k]); // по умолчанию Москва (первый элемент в списке)
	    	}

	    	$filials[(int)$v['id_filial']] = $v;
	    }

	    $_SESSION['filials'] = $filials;

		$_SESSION['smarty']->assign('filials', $res['filials_Get_list']); // передаем филиалы
		$_SESSION['smarty']->assign('filials_json', json_encode($res['filials_Get_list'])); // передаем филиалы json

        $phone = replaceUTMphone();

		if(!isset($_SESSION['filial']) || !empty($phone)) // если не установлен филиал
		{
            $filial0 = $res['filials_Get_list'][0];

            if(!empty($phone)) {
                $filial0['tel1'] = $filial0['tel2'] = "+7(".$phone['phoneCode'].")".$phone['phone'];
            }

			$_SESSION['filial'] = $filial0;
			$_SESSION['smarty']->assign('filial', $filial0); // по умолчанию Москва (первый элемент в списке)
		}
		else
		{

            if(!empty($phone)) {
                $_SESSION['filial']['tel1'] = $_SESSION['filial']['tel2'] = "+7(".$phone['phoneCode'].")".$phone['phone'];
            }

			$_SESSION['smarty']->assign('filial', $_SESSION['filial']);
		}

		// если выбран филиал
		if (isset($arr['id_filial']) && strlen($arr['id_filial'])>0)
		{
			unset($_SESSION['filial']); // разрегистрируем филиал

			foreach($res['filials_Get_list'] as $k=>$v)
			{
				if ($res['filials_Get_list'][$k]['id_filial'] == $arr['id_filial'])
				{

                    $filial = $res['filials_Get_list'][$k];

                    if(!empty($phone)) {
                        $filial['tel1'] = $filial['tel2'] = "+7(".$phone['phoneCode'].")".$phone['phone'];
                    }

					$_SESSION['filial'] = $filial;
					$_SESSION['smarty']->assign('filial', $filial); // передаем выбранный филиал
				}
			}
		}

		return $_SESSION['filial'];

	}

	function set_pages($post, $res)
	{

		foreach($res['pages_Get_list'] as $v)  // перебираем меню с целю проставить ключи
		{
			$pages[$v['id']] = $v;

			if($pages[$v['id']]['parent']!=0)  // проставляем наличие детей родителям
			{
				$pages[$v['parent']]['child'] = 1;
			}

			if ($pages[$v['id']]['alias'] == $post[0]) // ищем текущую страницу в таблице страниц
			{
				$page = $v;
			}
		}

		$_SESSION['pages'] = $pages;
		$_SESSION['smarty']->assign('pages', $pages);

		if(empty($page)) $page = null;

		return $page;
	}



	function set_menu_cat($post)
	{
        $menu = array();
		$categoriesSql = 'SELECT category.* FROM tree category';
        foreach (rows($categoriesSql) as $v) {  // перебираем меню с целю проставить ключи
			$v['alias'] = $v['id'];
            $menu[$v['id']] = $v;

            if ($menu[$v['id']]['parent_id'] != 0) {  // проставляем наличие детей родителям
                $menu[$v['parent_id']]['child'] = 1;
            }

            if ($menu[$v['id']]['alias'] == $post[0]) { // ищем текущую страницу в меню
                $node = $v;
            }
            $path_parts = explode("/", trim($post['path'], "/"));
        }

        $_SESSION['menu'] = $menu;
		$_SESSION['smarty']->assign('menu', $menu);

		if (!empty($node)) // если пункт меню обнаружен, получаем его свойства
		{
			$node['path'] = $post['path'];
			$node['post'] = $post;

			$remark = array(); // путь к странице
			$i = $node['id_cat'];
			while ($i != 0)
			{
				$n = $menu[$i];
				$remark[] = $menu[$i];
				$i = $n['parent'];
			}

			$node['breadcrumbs'] = array_reverse($remark);
			//$node['params'] = $arr;

			// получить все id узлов, которые подчинены данному узлу
			$condition = array();
			foreach($menu as $m)
			{
				if($m['parent']==0) continue;
				$i = $m['id_cat'];
				do
				{
					if($i==$node['id_cat'])
					{
						$condition[] = $m['id_cat'];
						break;
					}
					$i = $menu[$i]['parent'];
				}while($i!=0);
			}
			$condition[] = $node['id_cat'];
			$node['nodes'] = implode(",", $condition);

			if(isset($aliases))$node['aliases'] = $aliases;

//			if(!empty($res['settings_Get_page'])) $node['settings']=$res['settings_Get_page'][0]; // добавляем настройки для страницы каталога
		}
		else
		{
			$node = null;
		}


	    return $node;
	}

    function child_nodes($id_cat)
    {

    	$menu = $_SESSION['menu'];

		// получить все id узлов, которые подчинены данному узлу
		$condition = array();
		foreach($menu as $m)
		{
			if($m['parent']==0) continue;
            if($id_cat === 0) {
                $condition[] = $m['id_cat'];
                continue;
            }
			$i = $m['id_cat'];
			do
			{
				if($i==$id_cat)
				{
					$condition[] = $m['id_cat'];
					break;
				}
				$i = $menu[$i]['parent'];
			}while($i!=0);
		}
		$condition[] = $id_cat;
		//$nodes = implode(",", $condition);

		return $condition;
	}


	function set_json_vars()
	{
		$res = set_directories();

		//echo "<pre>"; print_r($filial); echo "</pre>";
		//echo "<pre>"; print_r($res); echo "</pre>";

		$prods = $res['prods'];
		$prods_tpl = $res['prods_tpl'];
		$M = $res['M'];
		$positionSizes = $res['positionSizes'];

		//$_SESSION['smarty']->assign('P', json_encode($prods));

		// добавить данные для вывода на страницу
		// имя продукции

		$_SESSION['products'] = $prods_tpl;

		$_SESSION['smarty']->assign('products', $prods_tpl);
		$_SESSION['smarty']->assign('M', $M);

        $json_prods = json_encode($prods);
        $pS = json_encode($positionSizes);

        $text  = "var P = " . $json_prods.";\r\n";
        $text .= "var pS = " . $pS . ";\r\n";

        $_SESSION['smarty']->assign('p_js', $text);

        /*
        $md5_json = md5($json_prods.$pS.$sauces);
        $_SESSION['hash'] = $md5_json;

		//echo "<pre>"; print_r($prods); echo "</pre>"; die();
		*/

	}

	function set_products($post, $res, $menu)
	{
		$prods = array();
		$prod = array();

		//echo "<pre>"; print_r($res['menu_Get_list']); echo "</pre>"; //die();

		foreach($res['menu_Get_list'] as $v) // заполняем массив блюд
		{
			$prods[$v['guid']] = $v;

			if ($prods[$v['guid']]['alias'] == $post[0]) // ищем текущую страницу в блюдах
			{
				$prod = $v;
			}
		}

		//echo "<pre>"; print_r($prods); echo "</pre>"; //die();

		//echo "<pre>"; print_r($post); echo "</pre>"; //die();

		//echo "<pre>"; print_r($prod); echo "</pre>"; //die();

		if (!empty($prod)) // если пункт меню обнаружен, получаем его свойства
		{

			if(!empty($path)) $prod['path'] = $path;
			$prod['post'] = $post;
			if(!empty($aliases)) $prod['aliases'] = $aliases;


			$remark = array(); // путь к странице
			$i = $prod['id_cat'];
			while ($i != 0)
			{
				$n = $menu[$i];
				$remark[] = $menu[$i];
				$i = $n['parent'];
			}

			$prod['breadcrumbs'] = array_reverse($remark);
			if(!empty($arr)) $prod['params'] = $arr;

		}

		//echo "<pre>"; print_r($prod); echo "</pre>";

		return $prod;
	}


	function set_sort($sort)
	{
		if(isset($_SESSION['sort']))
		{
			$_SESSION['smarty']->assign('sort', $_SESSION['sort']);
		}

		if (isset($sort) && strlen($sort)>0)
		{
			unset($_SESSION['sort']);
			$_SESSION['sort'] = $sort;
			$_SESSION['smarty']->assign('sort', $_SESSION['sort']);
		}

	}

	function get_ip()
    {
	    if (!empty($_SERVER['HTTP_CLIENT_IP']))
	    {
		$ip=$_SERVER['HTTP_CLIENT_IP'];
	    }
	    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
	    {
		$ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
	    }
	    else
	    {
		$ip=$_SERVER['REMOTE_ADDR'];
	    }
	    return $ip;
    }

	function clear_sess($arr)
    {
    	//echo "<pre >"; print_r($arr); echo "</pre>"; //die();

    	// очистка сортировки
        if (isset($arr['unset'])  && $arr['unset'] == 'sort'){ unset($_SESSION['sort']);}

        if (isset($arr['sort']) && strlen($arr['sort'])>0)
        {
            unset($_SESSION['sort']);
            $_SESSION['sort'] = $arr['sort'];
            $_SESSION['smarty']->assign('sort', $_SESSION['sort']);
        }

        // очистка корзины
        if(isset($arr['unset']) && $arr['unset'] == 'cart')
        {
            unset($_SESSION['cart']);// обнуляем корзину
            $_SESSION['cart']['total_cart_amount'] = 0;
            $_SESSION['cart']['items'] = array();

            $_SESSION['smarty']->assign('cart', $_SESSION['cart']);
    	}

    	// очистка данных о пользователе
		if (isset($arr['unset'])  && $arr['unset'] == 'user'){ unset($_SESSION['user']);} // перенести в модуль работы с авторизацией пользователя

    }

    public function showPage404()
    {
        http_response_code(404);
        $_SESSION['smarty']->display('404.tpl');
    }

    public function endRequest()
    {
        unset($_SESSION['smarty']);
        session_write_close();
    }

    public function jsonResponse($data)
    {
        header("Content-Type: application/json");
        echo json_encode($data);

        $this->endRequest();
        $this->endRequest();
    }

    function get_categories_data($section = '1')
    {
        $is_category = false;
        $current = 1;
        $tree = array();
        
        // проверка папки на наличие в категориях
        $res = rows('SELECT * FROM tree WHERE id LIKE "'.noSQL($section).'"');
        if (count($res)>0) 
        { 
        	$current = $res[0]; 
        	$is_category = true; 

	        foreach($this->get_data('get_tree', array($section)) as $k=>$v) //формирование массива категорий
	        {
	            $categories[$v['id']] = $v;
	            $arr[] = $v['name'];       

	            //echo "<pre>"; print_r($categories); echo "<pre>"; //die();

	            foreach($this->get_data('get_tree', array($v['id'])) as $k1=>$v1)
	            {
	            	$categories[$v['id']]['nodes'][$v1['id']] = $v1;
	            	$arr[] = $v1['name'];

		            foreach($this->get_data('get_tree', array($v1['id'])) as $k2=>$v2)
		            {
		            	$categories[$v['id']]['nodes'][$v1['id']]['nodes'][$v2['id']] = $v2;
		            	$arr[] = $v2['name'];

		            }
	            }
	        }
	        //echo "<pre>"; print_r($categories); echo "<pre>"; //die();

        }


        $c_data = array(
            'is_category' => $is_category,
            'current' => $current,
            'breadcrumbs' => array(),  // todo,
            'tree' => $categories

        );

        return $c_data;
    }

}
