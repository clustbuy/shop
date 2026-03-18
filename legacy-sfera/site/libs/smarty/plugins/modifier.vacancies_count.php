<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty vacancies count modifier plugin
 *
 * Type:     modifier<br>
 * Name:     vacancies_count<br>
 * Purpose:  vacancies count dependency
 * @author   Alex
 * @param string
 * @param string
 * @return string
 */
function smarty_modifier_vacancies_count($string, $count)
{
    if(in_array(substr((string)$count, -1),array("1")) && $count!==11) {
        $string = "Вакансия";
    }
    elseif (in_array(substr((string)$count, -1),array("2","3","4")) && $count!==12 && $count!==13 && $count!==14) {
        $string = "Вакансии";
    }
    
    
    return $string;
}

/* vim: set expandtab: */

?>
