<?php

function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

function now()
{
    $now = array();
    list($now['year'], $now['month'], $now['months'], $now['day'], $now['hour'], $now['hours'], $now['minute'], $now['minutes'], $now['second']) = sscanf(date("Y m m d H H i i s"), "%d %d %s %d %d %s %d %s %d");
    return $now;
}

function time_format($time)
{
    $now = array();
    list($now['year'], $now['month'], $now['months'], $now['day'], $now['hour'], $now['hours'], $now['minute'], $now['minutes'], $now['second']) = sscanf(date("Y m m d H H i i s", $time), "%d %d %s %d %d %s %d %s %d");
    return $now;
}


function get_period()
{
    global $ts;
    list($usec, $sec) = explode(" ", microtime());
    $time = ((float)$usec + (float)$sec);
    $period = ((float)$time - (float)$ts);
    $ts = $time;
    return $period;
}

?>