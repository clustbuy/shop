<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty lower modifier plugin
 *
 * Type:     modifier<br>
 * Name:     lower<br>
 * Purpose:  convert string to lowercase
 * @link http://smarty.php.net/manual/en/language.modifier.lower.php
 *          lower (Smarty online manual)
 * @author   Monte Ohrt <monte at ohrt dot com>
 * @param string
 * @return string
 */
function smarty_modifier_date2arr($str)
{
	$arr = array();
	list($arr['year'], $arr['month'], $arr['day'], $arr['hour'], $arr['minute'], $arr['second']) = sscanf($str, "%d-%d-%d %d:%d:%d");

	if($arr['minute']<10) $arr['minute'] = "0".$arr['minute'];
	if($arr['second']<10) $arr['second'] = "0".$arr['second'];

	switch ($arr['month']) {
		case '01': $arr['str_month'] = "января"; 	break;
		case '02': $arr['str_month'] = "февраля"; 	break;
		case '03': $arr['str_month'] = "марта"; 	break;
		case '04': $arr['str_month'] = "апреля"; 	break;
		case '05': $arr['str_month'] = "мая"; 		break;
		case '06': $arr['str_month'] = "июня"; 		break;
		case '07': $arr['str_month'] = "июля"; 		break;
		case '08': $arr['str_month'] = "августа"; 	break;
		case '09': $arr['str_month'] = "сентября"; 	break;
		case '10': $arr['str_month'] = "октября"; 	break;
		case '11': $arr['str_month'] = "ноября"; 	break;
		case '12': $arr['str_month'] = "декабря"; 	break;
	}
	return $arr;
}

?>