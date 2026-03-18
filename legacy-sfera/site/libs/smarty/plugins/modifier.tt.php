<?php

function smarty_modifier_tt($string)
{
    $len = strlen($string);

    if ($len<100) $string = "";

     /*$pos = strpos($string, ", "); 
    if ($pos != false) {
        $string = substr($string, $pos+2, $len); 
    }
    
   
    $pos = strrpos($string, "-"); 

    
    //echo $pos; 
    if (($pos > 0)&&($len-($pos+1))>3){
        $string = substr($string, 0, $pos);
    }*/
    
    return $string;
}

?>