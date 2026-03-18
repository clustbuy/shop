<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty street_replace modifier plugin
 *
 * Type:     modifier<br>
 * Name:     street_replace<br>
 * Purpose:  street_replace dependency
 * @author   Alex
 * @param string
 * @return string
 */
function smarty_modifier_street_replace($string)
{
    if(strpos(mb_strtolower($string, "UTF-8"), "улица")!==FALSE) {
        $string = "улицу ".trim(str_replace("улица", "", $string));
    }    
    
    return $string;
}

/* vim: set expandtab: */

?>
