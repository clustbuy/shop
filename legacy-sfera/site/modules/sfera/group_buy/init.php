<?php
/**
 * Инициализация модуля групповых покупок
 */

// Регистрация маршрутов для инициированных закупок
$router->addRoute('group-buy/initiated/create', 'group_buy', 'createInitiatedBuy');
$router->addRoute('group-buy/initiated/list', 'group_buy', 'listInitiatedBuys');
$router->addRoute('group-buy/initiated/view/{id}', 'group_buy', 'viewInitiatedBuy');

// Регистрация маршрутов
$router->addRoute('group-buy', 'group_buy', 'showGroupBuys');
$router->addRoute('group-buy/create', 'group_buy', 'createGroupBuy');
$router->addRoute('group-buy/view/{id}', 'group_buy', 'viewGroupBuy');
$router->addRoute('group-buy/join/{id}', 'group_buy', 'joinGroupBuy');
$router->addRoute('group-buy/leave/{id}', 'group_buy', 'leaveGroupBuy');
$router->addRoute('group-buy/complete/{id}', 'group_buy', 'completeGroupBuy');
$router->addRoute('group-buy/orders/view/{id}', 'group_buy', 'viewOrder');
$router->addRoute('group-buy/orders/pay/{id}', 'group_buy', 'payOrder');
$router->addRoute('group-buy/orders/cancel/{id}', 'group_buy', 'cancelOrder');

// Регистрация API маршрутов
$apiRouter->addRoute('GET', '/api/group-buy/active', 'GroupBuyApi', 'getActive');
$apiRouter->addRoute('GET', '/api/group-buy/{id}', 'GroupBuyApi', 'getGroupBuy');
$apiRouter->addRoute('POST', '/api/group-buy/create', 'GroupBuyApi', 'create');
$apiRouter->addRoute('POST', '/api/group-buy/{id}/join', 'GroupBuyApi', 'join');
$apiRouter->addRoute('POST', '/api/group-buy/{id}/leave', 'GroupBuyApi', 'leave');
$apiRouter->addRoute('POST', '/api/group-buy/{id}/complete', 'GroupBuyApi', 'complete');
$apiRouter->addRoute('GET', '/api/group-buy/orders/{id}', 'GroupBuyApi', 'getOrder');
$apiRouter->addRoute('POST', '/api/group-buy/orders/{id}/pay', 'GroupBuyApi', 'payOrder');
$apiRouter->addRoute('POST', '/api/group-buy/orders/{id}/cancel', 'GroupBuyApi', 'cancelOrder');

// Регистрация API маршрутов для инициированных закупок
$apiRouter->addRoute('POST', '/api/group-buy/initiated/create', 'GroupBuyApi', 'createInitiatedBuy');
$apiRouter->addRoute('GET', '/api/group-buy/initiated', 'GroupBuyApi', 'getInitiatedBuys');
$apiRouter->addRoute('PUT', '/api/group-buy/initiated/{id}', 'GroupBuyApi', 'updateInitiatedBuy');

// Регистрация Knockout компонентов
$koComponents->register('group-buy', 'ko_components/group_buy/group_buy.tpl');
$koComponents->register('group-buy-list', 'ko_components/group_buy/group_buy_list.tpl');
$koComponents->register('group-buy-create', 'ko_components/group_buy/group_buy_create.tpl');

// Регистрация моделей
$koModels->register('group-buy', 'models/group_buy/model_group_buy.js.tpl');

// Добавление пунктов меню
$menu->addItem('group-buy', [
    'title' => 'Групповые покупки',
    'url' => '/group-buy',
    'icon' => 'users',
    'order' => 5
]);

// Добавление виджета на главную страницу
$widgets->register('active-group-buys', [
    'title' => 'Активные групповые покупки',
    'template' => 'sfera/group_buy/tpl/widget.tpl',
    'position' => 'main',
    'order' => 3
]);

// Регистрация обработчиков событий
$events->on('user:login', function($userId) {
    // Обновление статуса групповых покупок при входе пользователя
    $groupBuyModel = new GroupBuyModel();
    $groupBuyModel->updateUserGroupBuys($userId);
});

$events->on('order:created', function($orderId) {
    // Обработка создания заказа в рамках групповой покупки
    $groupBuyModel = new GroupBuyModel();
    $groupBuyModel->handleOrderCreated($orderId);
});

// Регистрация задач по расписанию
$scheduler->addTask('group-buy:check-expired', [
    'schedule' => '*/5 * * * *', // Каждые 5 минут
    'callback' => function() {
        $groupBuyModel = new GroupBuyModel();
        $groupBuyModel->checkExpiredGroupBuys();
    }
]);

// Регистрация уведомлений
$notifications->register('group-buy:joined', [
    'title' => 'Вы присоединились к групповой покупке',
    'template' => 'sfera/group_buy/tpl/notifications/joined.tpl'
]);

$notifications->register('group-buy:completed', [
    'title' => 'Групповая покупка завершена',
    'template' => 'sfera/group_buy/tpl/notifications/completed.tpl'
]);

$notifications->register('group-buy:expired', [
    'title' => 'Групповая покупка истекла',
    'template' => 'sfera/group_buy/tpl/notifications/expired.tpl'
]);

// Регистрация прав доступа
$acl->addResource('group-buy', [
    'create' => 'Создание групповых покупок',
    'join' => 'Присоединение к групповым покупкам',
    'leave' => 'Выход из групповых покупок',
    'complete' => 'Завершение групповых покупок'
]);

// Добавление переводов
$translations->add('ru', 'group-buy', [
    'title' => 'Групповые покупки',
    'create' => 'Создать групповую покупку',
    'join' => 'Присоединиться',
    'leave' => 'Покинуть',
    'complete' => 'Завершить',
    'min_participants' => 'Минимум участников',
    'max_participants' => 'Максимум участников',
    'group_price' => 'Групповая цена',
    'end_date' => 'Дата окончания',
    'description' => 'Описание',
    'participants' => 'Участники',
    'progress' => 'Прогресс',
    'time_left' => 'Осталось времени',
    'savings' => 'Экономия',
    'status' => [
        'active' => 'Активна',
        'completed' => 'Завершена',
        'cancelled' => 'Отменена'
    ]
]); 