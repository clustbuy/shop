<?php
/**
 * User: Nikolay Zubkov <zubkov.rabota@gmail.com>
 * Date: 31.07.2023
 * Time: 09:54
 */ 
function smarty_modifier_nearest_10($number)
{
    return round($number, -1);
}