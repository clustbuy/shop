<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Заказ принят - Творческий Центр СФЕРА</title>
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <style>
        .thankyou-container {
            max-width: 800px;
            margin: 60px auto;
            padding: 40px;
            text-align: center;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .thankyou-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 30px;
            background: #4CAF50;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .thankyou-icon svg {
            width: 50px;
            height: 50px;
            color: white;
        }
        
        .thankyou-title {
            font-size: 32px;
            font-weight: 600;
            color: #000;
            margin-bottom: 20px;
        }
        
        .thankyou-message {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .order-info {
            background: #f5f7fa;
            padding: 20px;
            border-radius: 8px;
            margin: 30px 0;
            text-align: left;
        }
        
        .order-info-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e5e5e5;
        }
        
        .order-info-item:last-child {
            border-bottom: none;
        }
        
        .order-info-label {
            font-weight: 500;
            color: #666;
        }
        
        .order-info-value {
            color: #000;
            font-weight: 600;
        }
        
        .thankyou-actions {
            margin-top: 40px;
        }
        
        .btn-primary {
            display: inline-block;
            padding: 12px 32px;
            background: #0078d4;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: background 0.2s;
        }
        
        .btn-primary:hover {
            background: #0063b1;
        }
        
        .btn-secondary {
            display: inline-block;
            padding: 12px 32px;
            background: white;
            color: #0078d4;
            text-decoration: none;
            border: 1px solid #0078d4;
            border-radius: 4px;
            font-weight: 500;
            margin-left: 15px;
            transition: all 0.2s;
        }
        
        .btn-secondary:hover {
            background: #f3f3f3;
        }
    </style>
</head>
<body>
~~include file="sfera/tpl/header.tpl"~
~~include file="sfera/tpl/mobile_menu.tpl"~

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <a href="/">Главная</a>
        <span>/</span>
        <span>Заказ принят</span>
    </div>
</div>

<!-- Thank You Page -->
<main class="thankyou-container">
    <div class="thankyou-icon">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
            <polyline points="22 4 12 14.01 9 11.01"></polyline>
        </svg>
    </div>
    
    <h1 class="thankyou-title">Заказ принят успешно!</h1>
    
    <p class="thankyou-message">
        Спасибо за ваш заказ! Мы получили вашу заявку и в ближайшее время свяжемся с вами для подтверждения.
    </p>
    
    ~~if $order~
    <div class="order-info">
        ~~if isset($order.order_code)~
        <div class="order-info-item">
            <span class="order-info-label">Номер заказа:</span>
            <span class="order-info-value">~~$order.order_code~</span>
        </div>
        ~~/if~
        ~~if isset($order.name)~
        <div class="order-info-item">
            <span class="order-info-label">Получатель:</span>
            <span class="order-info-value">~~$order.name~</span>
        </div>
        ~~/if~
        ~~if isset($order.phone)~
        <div class="order-info-item">
            <span class="order-info-label">Телефон:</span>
            <span class="order-info-value">~~$order.phone~</span>
        </div>
        ~~/if~
        ~~if isset($order.pay_sum)~
        <div class="order-info-item">
            <span class="order-info-label">Сумма заказа:</span>
            <span class="order-info-value">~~$order.pay_sum|number_format:0:" ":" "~ ₽</span>
        </div>
        ~~/if~
    </div>
    ~~/if~
    
    <div class="thankyou-actions">
        <a href="/" class="btn-primary">Вернуться на главную</a>
        <a href="/catalog/" class="btn-secondary">Продолжить покупки</a>
    </div>
</main>

~~include file="sfera/tpl/footer.tpl"~

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
</body>
</html>

