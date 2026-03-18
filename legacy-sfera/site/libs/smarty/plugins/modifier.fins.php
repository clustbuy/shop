<?php

function smarty_modifier_fins($count=0, $default='ов')
{
    if(in_array(substr($count,-2),array('11','12','13','14'))){
        return $default;
    }
    $count = substr($count,-1);
    switch ($count) {
        case "1":
            return '';
        case "2":case "3":case "4":
        return 'а';
        default:
            return $default;
    }

}

?>