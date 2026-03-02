<?php
function smarty_function_mod($params, &$smarty){

	if (!isset($params['mod_name'])) {
		$smarty->trigger_error("aa: missing 'mod_name'");
		return;
	}

	$modname=$params['mod_name'];
	$action=$params['action'];
	$session_name=$modname."__".$action;

	if(!isset($_SESSION[$session_name])) $_SESSION[$session_name]=$params;

	$mod_path='modules/'.$modname.'/'.$modname.'.class.php';
	include_once($mod_path);

	$oMod=new $modname;
	$oMod->mod_execute($_SESSION[$session_name]);
}
?>