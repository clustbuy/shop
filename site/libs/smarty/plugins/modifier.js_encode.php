<?php

function smarty_modifier_js_encode($string)
{
        $string = "document.write('".addslashes(preg_replace('/[\r\n\t]+/i', '', $string))."');";

        $js_encode = '';

        for ($x=0; $x < strlen($string); $x++) {
            $js_encode .= '%' . bin2hex($string[$x]);
        }

        return '<script type="text/javascript">eval(decodeURIComponent(\''.$js_encode.'\'))</script>';
}

?>