<?php

function smarty_modifier_minus_www($string)
{
    return str_replace("www.", "", $string);
}

?>