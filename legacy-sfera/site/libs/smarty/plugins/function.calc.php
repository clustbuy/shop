<?php
function smarty_function_calc($params, &$smarty){
	 
	if($params['operator'] == '+'){
		
		$res = 	$params['arg1'] + $params['arg2'];

	} else 
	if ($params['operator'] == '-'){
		
		$res = 	$params['arg1'] - $params['arg2'];

	}

	
	return $res; 
}
?>