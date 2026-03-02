<?php
function smarty_modifier_price($str)
{
	$price = number_format($str, 0, '', ' ');

	return $price;
}
?>
