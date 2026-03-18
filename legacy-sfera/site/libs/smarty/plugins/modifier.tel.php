<?php

function smarty_modifier_tel($string)
{
    $pos = strpos($string, ","); 
    if ($pos != false) {
        $string = substr($string, 0, $pos); 
    }
    
    $pos = strrpos($string, "-"); 
    $len = strlen($string);
    
    //echo $pos; 
    if (($pos > 0)&&($len-($pos+1))>3){
        $string = substr($string, 0, $pos);
    }
    
    return $string;
}

?>