<?php
function smarty_modifier_round($string, $decimals=2)
{

    $num = ceil($string*100)/100;

    return number_format((float)$num, $decimals, '.', '');

}
?>
