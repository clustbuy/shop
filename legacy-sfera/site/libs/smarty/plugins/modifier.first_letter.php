<?php

function smarty_modifier_first_letter($str)
{
    return mb_strtoupper(mb_substr($str, 0, 1));
}

?>