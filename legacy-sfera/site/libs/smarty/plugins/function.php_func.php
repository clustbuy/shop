<?php
function smarty_function_php_func($params, &$smarty){

	$value = $params['func']($params['what'], $params['where']);
	$_SESSION['smarty']->assign($params['var'], $value);
  return $value;

}
?>