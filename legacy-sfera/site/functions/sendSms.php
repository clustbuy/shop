<?php

function sendSms($phoneNumber, $message)
{
    $phoneNumber = str_replace(['-', ' ', '(', ')'], '', $phoneNumber);

    // отправка смс
    require_once 'site/libs/sms.ru.php';

    try {

        $smsru = new SMSRU(SMSRU_TOKEN); // Ваш уникальный программный ключ, который можно получить на главной странице

        $data = new stdClass();
        $data->to = $phoneNumber;
        $data->text = $message; // Текст сообщения

        $data->test = (R==1)?0:1; // Позволяет выполнить запрос в тестовом режиме без реальной отправки сообщения

        // $data->from = ''; // Если у вас уже одобрен буквенный отправитель, его можно указать здесь, в противном случае будет использоваться ваш отправитель по умолчанию
        // $data->time = time() + 7*60*60; // Отложить отправку на 7 часов
        // $data->translit = 1; // Перевести все русские символы в латиницу (позволяет сэкономить на длине СМС)
        // $data->partner_id = '1'; // Можно указать ваш ID партнера, если вы интегрируете код в чужую систему

        return $smsru->send_one($data); // Отправка сообщения и возврат данных в переменную
    } catch (Throwable $e) {
    }

    return false;
}


?>
