<?php
function smarty_function_mod($params, &$smarty){

	// ОТЛАДКА (закомментирована - больше не нужна)
	// $log_file = 'mod_debug.log';
	// file_put_contents($log_file, "=== smarty_function_mod called ===\n", FILE_APPEND);
	// file_put_contents($log_file, "Time: " . date('Y-m-d H:i:s') . "\n", FILE_APPEND);
	// file_put_contents($log_file, "Params: " . print_r($params, true) . "\n", FILE_APPEND);

	if (!isset($params['mod_name'])) {
		// file_put_contents($log_file, "ERROR: missing 'mod_name'\n", FILE_APPEND);
		$smarty->trigger_error("aa: missing 'mod_name'");
		return;
	}

	$modname=$params['mod_name'];
	$path=$params['path'];
	$action=$params['action'];
	$session_name=$modname."__".$action."__".md5(print_r($params, true));
	
	// file_put_contents($log_file, "mod_name: $modname\n", FILE_APPEND);
	// file_put_contents($log_file, "path: $path\n", FILE_APPEND);
	// file_put_contents($log_file, "session_name: $session_name\n", FILE_APPEND);

	if(!isset($_SESSION[$session_name])) $_SESSION[$session_name]=$params;

	$mod_path='site/modules/'.$path.$modname.'/'.$modname.'.class.php';
	// file_put_contents($log_file, "mod_path: $mod_path\n", FILE_APPEND);
	
	// Проверяем существование файла
	if (!file_exists($mod_path)) {
		// file_put_contents($log_file, "ERROR: File not found: $mod_path\n", FILE_APPEND);
		echo "ERROR: Module file not found: $mod_path";
		return;
	}
	// file_put_contents($log_file, "File exists: OK\n", FILE_APPEND);

	include_once($mod_path);
	// file_put_contents($log_file, "File included\n", FILE_APPEND);
	
	// Проверяем все загруженные классы
	// $declared_classes = get_declared_classes();
	// file_put_contents($log_file, "Total classes loaded: " . count($declared_classes) . "\n", FILE_APPEND);
	
	// Проверяем существование класса
	if (!class_exists($modname)) {
		// file_put_contents($log_file, "ERROR: Class '$modname' not found\n", FILE_APPEND);
		// file_put_contents($log_file, "Last 20 classes: " . print_r(array_slice($declared_classes, -20), true) . "\n", FILE_APPEND);
		
		// Проверяем ошибки
		// $error = error_get_last();
		// if ($error) {
		// 	file_put_contents($log_file, "Last error: " . print_r($error, true) . "\n", FILE_APPEND);
		// }
		
		echo "ERROR: Class '$modname' not found";
		return;
	}
	// file_put_contents($log_file, "Class exists: OK\n", FILE_APPEND);

	try {
		$oMod=new $modname();
		// file_put_contents($log_file, "Object created: OK\n", FILE_APPEND);
		
		$oMod->mod_execute($_SESSION[$session_name]);
		// file_put_contents($log_file, "mod_execute() called\n", FILE_APPEND);
	} catch (Exception $e) {
		// file_put_contents($log_file, "ERROR: " . $e->getMessage() . "\n", FILE_APPEND);
		echo "ERROR: " . $e->getMessage();
	}
	
	// file_put_contents($log_file, "=== END smarty_function_mod ===\n\n", FILE_APPEND);
}
?>
