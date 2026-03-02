<?php

function smarty_modifier_brb_cost($cost)
{
    $cost  = ceil($cost/100)*100;
    
    return $cost;
}

?>