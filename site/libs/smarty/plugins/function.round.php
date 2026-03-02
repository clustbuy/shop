<?php
function smarty_function_round($params, &$smarty){

    $num = ceil($params['var']*100)/100;

    return number_format((float)$num, 2, '.', '');

}
?>