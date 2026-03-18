<?php

$_SESSION['cart']['discount_sum'] = $p['discount_sum'];
$this->calc();
echo json_encode($_SESSION['cart']);

?>