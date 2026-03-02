<?php
function smarty_modifier_month($month)
{
    $str = '';
    switch ($month) {
        case "1": $str = 'январь'; break;
        case "2": $str = 'февраль'; break;
        case "3": $str = 'март'; break;
        case "4": $str = 'апрель'; break;
        case "5": $str = 'май'; break;
        case "6": $str = 'июнь'; break;
        case "7": $str = 'июль'; break;
        case "8": $str = 'август'; break;
        case "9": $str = 'сентябрь'; break;
        case "10": $str = 'октябрь'; break;
        case "11": $str = 'ноябрь'; break;
        case "12": $str = 'декабрь'; break;
        default: break;
    }
    return $str;
}
?>