<?php
function smarty_function_in_array($params, &$smarty){

	$value = (isset($params['what']) && isset($params['where'])) ? in_array($params['what'], $params['where']) : FALSE;
	$_SESSION['smarty']->assign($params['var'], $value);

}
?>