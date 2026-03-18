<?php
/**
 * Интеграция модуля групповых покупок с другими модулями
 */

class GroupBuyIntegration {
    private $db;
    private $events;
    
    public function __construct() {
        $this->db = Database::getInstance();
        $this->events = new GroupBuyEvents();
    }
    
    /**
     * Интеграция с модулем корзины
     */
    public function integrateWithCart() {
        // Добавляем групповые покупки в корзину
        Cart::addHook('beforeAddItem', function($item) {
            // Проверяем, не является ли товар частью групповой покупки
            $groupBuy = $this->getActiveGroupBuyForProduct($item['product_id']);
            if ($groupBuy) {
                // Если есть активная групповая покупка, предлагаем присоединиться
                return [
                    'success' => false,
                    'message' => 'Этот товар доступен в групповой покупке',
                    'group_buy_id' => $groupBuy['id']
                ];
            }
            return true;
        });
        
        // Обработка завершения групповой покупки
        Cart::addHook('afterOrderCreated', function($order) {
            if ($order['group_buy_id']) {
                // Обновляем статус заказа в групповой покупке
                $this->updateGroupBuyOrderStatus($order['group_buy_id'], $order['id'], $order['status']);
            }
        });
    }
    
    /**
     * Интеграция с модулем бонусов
     */
    public function integrateWithBonuses() {
        // Начисление бонусов за создание групповой покупки
        Bonuses::addHook('groupBuyCreated', function($groupBuy) {
            $bonusAmount = $this->calculateGroupBuyBonus($groupBuy);
            Bonuses::add($groupBuy['creator_id'], $bonusAmount, 'group_buy_created');
        });
        
        // Начисление бонусов за участие в групповой покупке
        Bonuses::addHook('groupBuyCompleted', function($groupBuy) {
            $participants = $this->getGroupBuyParticipants($groupBuy['id']);
            foreach ($participants as $participant) {
                $bonusAmount = $this->calculateParticipationBonus($groupBuy);
                Bonuses::add($participant['user_id'], $bonusAmount, 'group_buy_participation');
            }
        });
    }
    
    /**
     * Интеграция с модулем уведомлений
     */
    public function integrateWithNotifications() {
        // Регистрация типов уведомлений
        Notifications::registerType('group-buy:joined', [
            'title' => 'Вы присоединились к групповой покупке',
            'template' => 'sfera/group_buy/tpl/notifications/joined.tpl'
        ]);
        
        Notifications::registerType('group-buy:completed', [
            'title' => 'Групповая покупка завершена',
            'template' => 'sfera/group_buy/tpl/notifications/completed.tpl'
        ]);
        
        Notifications::registerType('group-buy:expired', [
            'title' => 'Групповая покупка истекла',
            'template' => 'sfera/group_buy/tpl/notifications/expired.tpl'
        ]);
        
        // Добавление уведомлений в центр уведомлений
        Notifications::addToCenter('group-buy', [
            'title' => 'Групповые покупки',
            'icon' => 'users',
            'template' => 'sfera/group_buy/tpl/notifications/center.tpl'
        ]);
    }
    
    /**
     * Интеграция с модулем аналитики
     */
    public function integrateWithAnalytics() {
        // Регистрация метрик
        Analytics::registerMetric('group_buys', [
            'title' => 'Групповые покупки',
            'type' => 'counter',
            'description' => 'Количество групповых покупок'
        ]);
        
        Analytics::registerMetric('group_buy_participants', [
            'title' => 'Участники групповых покупок',
            'type' => 'counter',
            'description' => 'Количество участников групповых покупок'
        ]);
        
        Analytics::registerMetric('group_buy_revenue', [
            'title' => 'Выручка от групповых покупок',
            'type' => 'money',
            'description' => 'Общая выручка от групповых покупок'
        ]);
        
        // Добавление отчетов
        Analytics::addReport('group_buys', [
            'title' => 'Отчет по групповым покупкам',
            'template' => 'sfera/group_buy/tpl/analytics/report.tpl',
            'metrics' => ['group_buys', 'group_buy_participants', 'group_buy_revenue']
        ]);
    }
    
    /**
     * Интеграция с модулем поиска
     */
    public function integrateWithSearch() {
        // Добавление групповых покупок в поиск
        Search::addIndex('group_buys', [
            'fields' => [
                'product_name' => 'string',
                'description' => 'text',
                'status' => 'string',
                'created_at' => 'date'
            ],
            'relations' => [
                'product' => ['name', 'description'],
                'creator' => ['name', 'email']
            ]
        ]);
        
        // Добавление фильтров
        Search::addFilter('group_buys', [
            'status' => [
                'type' => 'select',
                'options' => [
                    'active' => 'Активные',
                    'completed' => 'Завершенные',
                    'cancelled' => 'Отмененные'
                ]
            ],
            'price_range' => [
                'type' => 'range',
                'field' => 'group_price'
            ],
            'participants' => [
                'type' => 'range',
                'field' => 'current_participants'
            ]
        ]);
    }
    
    /**
     * Получение активной групповой покупки для товара
     */
    private function getActiveGroupBuyForProduct($productId) {
        return $this->db->fetchOne(
            "SELECT * FROM group_buys
             WHERE product_id = ?
             AND status = 'active'
             AND end_date > NOW()
             ORDER BY created_at DESC
             LIMIT 1",
            [$productId]
        );
    }
    
    /**
     * Обновление статуса заказа в групповой покупке
     */
    private function updateGroupBuyOrderStatus($groupId, $orderId, $status) {
        $this->db->update('group_buy_orders', [
            'status' => $status,
            'updated_at' => date('Y-m-d H:i:s'),
            $status . '_at' => date('Y-m-d H:i:s')
        ], [
            'group_buy_id' => $groupId,
            'id' => $orderId
        ]);
    }
    
    /**
     * Расчет бонусов за создание групповой покупки
     */
    private function calculateGroupBuyBonus($groupBuy) {
        // Базовая сумма бонусов
        $baseBonus = 100;
        
        // Дополнительные бонусы за количество участников
        $participantBonus = $groupBuy['current_participants'] * 10;
        
        // Дополнительные бонусы за сумму покупки
        $revenueBonus = $groupBuy['group_price'] * $groupBuy['current_participants'] * 0.01;
        
        return $baseBonus + $participantBonus + $revenueBonus;
    }
    
    /**
     * Расчет бонусов за участие в групповой покупке
     */
    private function calculateParticipationBonus($groupBuy) {
        // Базовая сумма бонусов
        $baseBonus = 50;
        
        // Дополнительные бонусы за сумму покупки
        $purchaseBonus = $groupBuy['group_price'] * 0.02;
        
        return $baseBonus + $purchaseBonus;
    }
} 