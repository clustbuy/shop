<?php

// После настройки переименовать в config.php

if (!defined('ITEMS_PER_PAGE')) define('ITEMS_PER_PAGE', 48); // Количество товаров на странице.
if (!defined('SMTP_HOST')) define('SMTP_HOST', 'ssl://mail.nic.ru');
if (!defined('SMTP_USERNAME')) define('SMTP_USERNAME', 'orders@ru.market');
if (!defined('SMTP_PASSWORD')) define('SMTP_PASSWORD', 'f9CbQCZFMnUCpsz;KAI^Ro');
if (!defined('SMTP_FROM_EMAIL')) define('SMTP_FROM_EMAIL', 'orders@ru.market');
if (!defined('SMTP_FROM_NAME')) define('SMTP_FROM_NAME', 'Ru.Market');
if (!defined('SMTP_PORT')) define('SMTP_PORT', 465);
if (!defined('SMTP_SSL')) define('SMTP_SSL', true);

/*
if (!defined('DB_HOST')) define('DB_HOST', '212.193.54.66'); //Server
if (!defined('DB_NAME')) define('DB_NAME', 'clustbuy'); //Database
if (!defined('DB_USER')) define('DB_USER', 'root'); //Database User
if (!defined('DB_PASS')) define('DB_PASS', '3Ei56-W695v-Q6F7p-Kx3mq'); //Password
*/

if (!defined('DB_HOST')) define('DB_HOST', 'mariadb-10.4'); //Server
if (!defined('DB_NAME')) define('DB_NAME', 'sfera'); //Database
if (!defined('DB_USER')) define('DB_USER', 'root'); //Database User
if (!defined('DB_PASS')) define('DB_PASS', ''); //Password



if (!defined('DADATA_TOKEN')) define('DADATA_TOKEN', '3ab30f043510035177906a0ffdee464036ee48ab');
if (!defined('SMSRU_TOKEN')) define('SMSRU_TOKEN', '2ECD21F3-D63F-D3F8-5BE0-F10E8EC1299E');
if (!defined('ZVONOBOT_API_KEY')) define('ZVONOBOT_API_KEY', 'QT8fvqeEwXDcxallxUOmk84Qzdd6obWoyUZKoPlPD3cyLvcvkv5FnHaYM74O');


if (!defined('RELEASE')) define('RELEASE', 'DEV'); // версия для локальной разработки (DEV), версия для пользователей (PROD) ** !! обязятельный параметр


if (!defined('TELEGRAM_TOKEN')) define('TELEGRAM_TOKEN', '5639110424:AAEfWLRWPIpI_gxjdgq42CzgNgacsV2oB98'); // токен бота
if (!defined('TELEGRAM_CHATID')) define('TELEGRAM_CHATID', '144512186'); // сюда нужно вписать ваш внутренний айдишник
if (!defined('MIN_SUM')) define('MIN_SUM', '1500'); // минимальная сумма заказа min_sum
if (!defined('COMET_SERVER_HOST')) define('COMET_SERVER_HOST', 'app.comet-server.ru');
if (!defined('COMET_SERVER_PORT')) define('COMET_SERVER_PORT', null);
if (!defined('COMET_DEV_ID')) define('COMET_DEV_ID', 15);
if (!defined('COMET_DEV_KEY')) define('COMET_DEV_KEY', 'lPXBFPqNg3f661JcegBY0N0dPXqUBdHXqj2cHf04PZgLHxT6z55e20ozojvMRvB8');


if (!defined('TOTAL_COST')) define('TOTAL_COST', 5000); // Стоимость корзины при которой пересчитываются бонусы по всем товарам
if (!defined('ITEM_COST')) define('ITEM_COST', 500); // Стоимость товара от которой начисляются бонусы за товар
if (!defined('BONUS_RATIO')) define('BONUS_RATIO', 0.3); // Коэффициент на который умножается разница между покупкой и продажей для вычисления размера бонусов


?>