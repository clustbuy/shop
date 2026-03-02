
<?php
/**
 * Smarty shared plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Function: smarty_contains
 * Purpose:  Used to find a string in a string
 * Example: contains( 'Jason was here', 'here' ) returns true
 * Example2: contains( 'Jason was here', 'ason' ) returns false
 * @author Jason Strese <Jason dot Strese at gmail dot com>
 * @param string
 * @return string
 */
function smarty_modifier_contains($string, $find)
{

    $pos = strpos($string, ","); 
    if ($pos != false) {
        $string = substr($string, 0, $pos); 
    }
    

   if(strpos($string, $find)>0)
   {
    $res = 1;
   } 
   else if(strpos($string, "025")>0)
   {
    $res = 1;
   } 
   else if(strpos($string, "033")>0)
   {
    $res = 1;
   } 
   else if(strpos($string, "044")>0)
   {
    $res = 1;
   } 
   else
   {
    $res = 0;
   }


   
   
   return $res;
}

/* vim: set expandtab: */

?>