<?php
function smarty_function_print_r($params, &$smarty){
	echo "<pre>"; print_r($params['what']); echo "</pre>"; //die();
}
?>