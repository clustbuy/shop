<?php 
/** 
 * Smarty plugin 
 * @package Smarty 
 * @subpackage plugins 
 */ 

function smarty_modifier_ucfirst($string) 
{
  $fc = mb_strtoupper(mb_substr($string, 0, 1));
  return $fc.mb_substr($string, 1);
}

?>