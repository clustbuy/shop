<?php
class auth extends aModule{
    function execute($arr)
    {
    	$user = array();
		if (empty($_SESSION['user']))
		{
			if (!empty($arr['send_params']['phone']) && !empty($arr['send_params']['password']))//|| $arr['verified_email'] == 1)
			{   
				$login = str_replace(array("(",")"," ","-","+"), "", $arr['send_params']['phone']);
				$where = "";
				if(strlen($arr['send_params']['password'])>0 && strlen($login)>0)
                {
                    //$where .= "(pass LIKE '".md5($arr['send_params']['password'])."' AND login LIKE '".noSQL($login)."')";
                    $where .= "(pass LIKE '".$arr['send_params']['password']."' AND login LIKE '".noSQL($login)."')";
                }

				$List=rows("SELECT * FROM users WHERE  (".$where.")");
				if(count($List)==1)
				{
				    $user = $List[0];
//				    $user['role'] = "admin";
				}            
			}
		}
		else
		{
			$user = $_SESSION['user'];
		}
		return $user;
    }
}

?>