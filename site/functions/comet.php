<?php

function comet_bye($link)
{
    mysqli_close($link);
}

function comet_connect()
{

    $link =  mysqli_connect("app.comet-server.ru",
        "15", "lPXBFPqNg3f661JcegBY0N0dPXqUBdHXqj2cHf04PZgLHxT6z55e20ozojvMRvB8", "CometQL_v1");

    //mysqli_connect("app.comet-server.ru", "", "lPXBFPqNg3f661JcegBY0N0dPXqUBdHXqj2cHf04PZgLHxT6z55e20ozojvMRvB8", "CometQL_v1");

    if(!$link)
    {
        echo json_encode(Array( "info" => "Не удалось создать соединение c CometQL (Использование CometQL не возможно)",
            "error" => true));
        //$this->comet_error = 1;
    }
    else
    {

        $result = mysqli_query (  $link, "show status" );
        if(mysqli_errno($link) != 0 && @mysqli_num_rows($result))
        {
            echo json_encode(Array(
                    "info" => "<b>Error code:<a href='https://comet-server.ru/wiki/doku.php/comet:cometql:error'  target='_blank' >".mysqli_errno($link)."</a>&nbsp;&nbsp;Error text:<a href='https://comet-server.ru/wiki/doku.php/comet:cometql:error' target='_blank' >".mysqli_error($link)."</a></b>",
                    "error" => true
                )
            );
            //$this->comet_error = 1;
        }
        else
        {
            //$resTest[] = Array("info" => "OK", "error" => false);
            //$this->comet_error = 0;
        }
    }

    return $link;
}

function pushCometMessage($link, $channel, $event, $message)
{
    try {
        //$link = mysqli_connect(COMET_SERVER_HOST, COMET_DEV_ID, COMET_DEV_KEY, "CometQL_v1");

        if (!$link) {
            return false;
        }

        $query = "INSERT INTO pipes_messages (name, event, message) VALUES ('%s', '%s', '%s')";

        if (!is_string($message)) {
            $message = json_encode($message);
        }

        return mysqli_query($link, sprintf($query, $channel, $event, $message));
    } catch (Throwable $e) {
    }

    return false;
}


?>