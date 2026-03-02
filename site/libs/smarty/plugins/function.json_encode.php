<?php

function smarty_function_json_encode($params, &$smarty)
{
    echo json_encode($params['str']);
}

?>


