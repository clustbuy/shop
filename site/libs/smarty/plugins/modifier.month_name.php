<?php

function smarty_modifier_month_name($string)
{
    $month = $string;
    
	switch ($month) {
	    
	    case "1":
		    $string = "января";
		break;	
	    
	    case "2":
		    $string = "февраля";
		break;	
	    
	    case "3":
		    $string = "марта";
		break;	
	    
	    case "4":
		    $string = "апреля";
		break;	
	    
	    case "5":
		    $string = "мая";
		break;	
	    
	    case "6":
		    $string = "июня";
		break;	
	    
	    case "7":
		    $string = "июля";
		break;	
	    
	    case "8":
		    $string = "августа";
		break;	
	    
	    case "9":
		    $string = "сентября";
		break;	
	    
	    case "10":
		    $string = "октября";
		break;	
	    
	    case "11":
		    $string = "ноября";
		break;	
	    
	    case "12":
		    $string = "декабря";
		break;	


	    //default:

	        
	}
    
    return $string;
}

?>