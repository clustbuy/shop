<?php

function smarty_modifier_boss_name($string)
{
    $pos = strpos($string, " "); 
    $len = strlen($string);
    
    $string = substr($string, $pos+1, $len-($pos+1)); 
    return strtoupper($string);
}

?>