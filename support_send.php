<?php
$name = trim($_POST['name'] ?? '');
$email = trim($_POST['email'] ?? '');
$message = trim($_POST['message'] ?? '');

if (empty($name) || empty($email) || empty($message)) {
    echo 'Заполните все поля';
    exit;
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo 'Некорректный email';
    exit;
}

$to = 'wrongemail@atomicmail.io';
$subject = 'Обращение с сайта от ' . $name;
$headers = "From: $email\r\n";
$headers .= "Reply-To: $email\r\n";
$headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

$body = "Имя: $name\nEmail: $email\n\nСообщение:\n$message";

if (mail($to, $subject, $body, $headers)) {
    echo 'Сообщение отправлено. Мы ответим вам в ближайшее время.';
} else {
    echo 'Ошибка при отправке. Попробуйте позже.';
}