<?php

function send_email($subject, $body, $recipient_email)
{

    /*
    require("vendor/phpmailer/phpmailer/src/PHPMailer.php");
    require("vendor/phpmailer/phpmailer/src/SMTP.php");

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;


    require_once '/PHPMailer/src/Exception.php';
    require_once '/PHPMailer/src/PHPMailer.php';
    require_once '/PHPMailer/src/SMTP.php';
     */

    // Для более ранних версий PHPMailer
    //require_once '/PHPMailer/PHPMailerAutoload.php'; %YuEpYa6tEs2

    $mail = new PHPMailer\PHPMailer\PHPMailer();
    $mail->CharSet = 'UTF-8';

    // Настройки SMTP
    $mail->isSMTP();
    $mail->SMTPAuth = true;
    $mail->SMTPDebug = 0;

    $mail->Host = 'ssl://smtp.mail.ru';
    $mail->Port = 465;
    $mail->Username = 'orders@ru.market';
    $mail->Password = 'GMitiRtY^u16';

    // От кого
    $mail->setFrom('orders@ru.market', 'ru.market');

    // Кому
    $mail->addAddress($recipient_email, '');
    $mail->addAddress('orders@ru.market', '');

    // Тема письма
    $mail->Subject = $subject;

    // Тело письма
    //$body = '<p><strong>«Hello, world!» </strong></p>';
    $mail->msgHTML($body);

    // Приложение
    //$mail->addAttachment(__DIR__ . '/image.jpg');

    $mail->send();
}

?>
