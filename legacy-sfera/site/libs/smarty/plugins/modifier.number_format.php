<?php
function smarty_modifier_number_format($string, $format)
{
    return number_format($string, 0, '', ' '); 
}


?>