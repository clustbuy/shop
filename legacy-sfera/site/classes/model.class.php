<?php class menu_model extends aModule{

	function menu_init($filial)
	{

		$products = $this->get_data('Get_products', array($filial['id_filial'])); // получаем всё меню по филиалу
		$ingr['pizza'] = $this->get_data('Get_pizza_ingrids', array($_SESSION['filial']['id_filial'])); // получаем ингредиенты по пицце
		$ingr['wok'] = $this->get_data('Get_wok_ingrids', array($_SESSION['filial']['id_filial'])); // получаем ингредиенты по вок
		$sauces = $this->get_data('Get_wok_sauce', array($_SESSION['filial']['id_filial'])); // получаем соусы
		$default_sauce = $sauces[0]['guid'];

		foreach($sauces as $k => $sauce)
		{
			$ingr['sauce'][$sauce['guid']] = $sauce;
		}

		$_SESSION['smarty']->assign('wok_sauce', $ingr['sauce']); // 

		$ps = $_SESSION['positionSizes']; // массив размеров пицц
		$prods = array();


		// создаем массив дополнительных ингредиентов для каждого размера пиццы
		$ingrids = array();
		foreach($ingr['pizza'] as $k=>$v) // для каждого дополнительного ингридиента
		{
			$prices = explode("^", $ingr['pizza'][$k]['price']);
			$weights = explode("^", $ingr['pizza'][$k]['weeight']);
			$items = array();
			foreach($prices as $i=>$j) // составляем массив для каждой цены 
			{
				if($prices[$i]!='')
				{
					$items[] = array(
								"guid" => $v['guid'],
								"name_menu" => $v['name_menu'],
								//"kcal" => $v['kcal'],
								//"protein" => $v['protein'],
								//"fat" => $v['fat'],
								//"carbo" => $v['carbo'],
								"price" => $prices[$i],
								//"weight" => $weights[$i], // нет в таблице данных по весам доп. ингредиентов
								"amount" =>  0
							);
					
				}
			}
			$ingrids['pizza'][] = $items;
		}

		// создаем массив дополнительных ингредиентов для вок
		foreach($ingr['wok'] as $k=>$v) // для каждого дополнительного ингридиента
		{
			$prices = explode("^", $ingr['wok'][$k]['price']);
			$weights = explode("^", $ingr['wok'][$k]['weeight']);
			$items = array();
			foreach($prices as $i=>$j) // составляем массив для каждой цены 
			{
				if($prices[$i]!='')
				{
					$items[] = array(
								"guid" => $v['guid'],
								"name_menu" => $v['name_menu'],
								//"kcal" => $v['kcal'],
								//"protein" => $v['protein'],
								//"fat" => $v['fat'],
								//"carbo" => $v['carbo'],
								"price" => $prices[$i],
								//"weight" => $weights[$i], // нет в таблице данных по весам доп. ингредиентов
								"amount" =>  0
							);
					
				}
			}
			$ingrids['wok'][] = $items;
		}	


		foreach($products as $k=>$p)
		{

			$prices = explode("^", $p['price']);
			$weights = explode("^", $p['weight']);
			$thin_count = 0;
			$items = array(); // обнуляем массив вариаций пицц

			foreach($prices as $i=>$j) // составляем массив блюд одного названия с соответствующими параметрами : цена и вес
			{
				if($prices[$i]!='') // i выступает в качестве ключа ко всем массивам он соединяет цену и раземр пиццы
				{
					if($ps[$i]['doughType']=='thin') $thin_count++; // считаем количество тонких
					$items[] = array(
						"price" => $prices[$i], 
						"weight" => $weights[$i], 
						"type" => $ps[$i]['doughType'],
						"size" => $ps[$i]['size']
					);
				}
			}

			$p['items'] = $items;

			// Категория
			$cat = array();
			$remark = array();
			$menu = $_SESSION['menu'];
			$cat = $menu[$p['id_cat']];

			$i = $p['id_cat'];
			while ($i != 0)
			{
				$n = $menu[$i];
				$remark[] = $menu[$i];
				$i = $n['parent'];
			}
			$cat['breadcrumbs'] = array_reverse($remark);

			$p['cat'] = $cat;


			// определяем какие брать дополнительные ингредиенты 
			$type_ingr='';
			if(in_array($p['id_cat'], $this->child_nodes(1))) $type_ingr='pizza';
			if(in_array($p['id_cat'], $this->child_nodes(35))) $type_ingr='wok';
			if(isset($type_ingr) && strlen($type_ingr)>0)
			{
				foreach($p['items'] as $kk=>$vv)
				{
					foreach($ingrids[$type_ingr] as $i=>$j)
					{
						$p['items'][$kk]['ingrids'][$ingrids[$type_ingr][$i][$kk]['guid']] = $ingrids[$type_ingr][$i][$kk];  // массив ингредиентов с ключами guid
					}
				}					
			}
			else
			{
				foreach($p['items'] as $kk=>$vv)
				{		
						$p['items'][$kk]['ingrids'] = null;	
				}					
			}

			if(isset($type_ingr) && $type_ingr == 'wok')
			{
				$p['sauces'] = $ingr['sauce'];
			}

			// добавляем текущее состояние по позиции меню
			$p['current_item'] = 0;
			$p['type'] = 'standart';
			$p['amount'] = 1;
			$p['ingrid_amount'] = 0;
			$p['cost_ingr'] = 0;
			$p['total_sum'] = $p['items'][0]['price']*$p['amount'];
			$p['total_weight'] = $p['items'][0]['weight'];
			$p['size'] = $p['items'][0]['size'];
			$p['thin_count'] = $thin_count;
			$p['add_ingr'] = null;
			
			$p['sauce'] = null;
			if(isset($type_ingr) && $type_ingr == 'wok')
			{
				$p['sauce'] = $default_sauce;
			}

			$p['sostav'] = $this->get_data('Get_ingrids', array($p['guid']));
			$sostav_text = '';
			$i = 0;
			$c = count($p['sostav']);
			foreach ($p['sostav'] as $s)
			{
				$i++;
				if ($i>1)
				{
					$sostav_text .= ", ".$s['pc_name'];
				}
				else
					$sostav_text .= $s['pc_name'];

			}
			$p['sostav_text'] = $sostav_text;

			unset($p['price']);
			unset($p['weight']);

			$prods[$p['guid']] = $p;  // расстановка индексов для продукции в соответствии с их id
		}

		$_SESSION['smarty']->assign('P', json_encode($prods)); 

		// добавить данные для вывода на страницу
		// имя продукции
		$_SESSION['P'] = $prods;
		$_SESSION['smarty']->assign('products', $prods);

		//echo "<pre>"; print_r($prods); echo "</pre>"; die();

	}	

}
?> 