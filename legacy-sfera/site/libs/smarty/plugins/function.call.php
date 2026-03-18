<?php
function smarty_function_call($params, &$smarty){

	if (!isset($params['file'])) {
		$smarty->trigger_error("missing 'file' of module");
		return;
	}

	$filename=$params['file'];
	
	$session_name=$filename."__".md5(print_r($params, true));

	if(!isset($_SESSION[$session_name])) $_SESSION[$session_name]=$params;

	$path='site/modules/'.$filename;
	
	require_once($path);
}
?>