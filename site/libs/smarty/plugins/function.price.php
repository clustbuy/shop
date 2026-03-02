<?php
function smarty_function_price($params, &$smarty){

	//$price = ceil(($params['cost']/$params['amount'])*100)/100;
	$price = ceil($params['var']*100)/100;

	return number_format((float)$price, 2, '.', '');

}
?>