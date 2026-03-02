<?php
function smarty_function_rawurlencode($params, &$smarty){
    return rawurlencode($params['var']);
}
?>