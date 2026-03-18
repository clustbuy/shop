<?php
/**
 * Обработчики событий для модуля групповых покупок
 */

class GroupBuyEvents {
    private $db;
    private $notifications;
    private $mailer;
    
    public function __construct() {
        $this->db = Database::getInstance();
        $this->notifications = Notifications::getInstance();
        $this->mailer = Mailer::getInstance();
    }
    
    /**
     * Обработка присоединения к групповой покупке
     */
    public function onParticipantJoined($groupId, $userId) {
        // Получаем информацию о групповой покупке
        $groupBuy = $this->getGroupBuyInfo($groupId);
        
        // Отправляем уведомление участнику
        $this->notifications->send($userId, 'group-buy:joined', [
            'group_buy' => $groupBuy
        ]);
        
        // Отправляем email участнику
        $this->mailer->send(
            $groupBuy['user_email'],
            'Вы присоединились к групповой покупке',
            'sfera/group_buy/tpl/emails/joined.tpl',
            ['group_buy' => $groupBuy]
        );
        
        // Проверяем, достигнуто ли минимальное количество участников
        if ($groupBuy['current_participants'] >= $groupBuy['min_participants']) {
            $this->onMinParticipantsReached($groupId);
        }
    }
    
    /**
     * Обработка выхода из групповой покупки
     */
    public function onParticipantLeft($groupId, $userId) {
        // Получаем информацию о групповой покупке
        $groupBuy = $this->getGroupBuyInfo($groupId);
        
        // Отправляем уведомление создателю
        $this->notifications->send($groupBuy['creator_id'], 'group-buy:participant-left', [
            'group_buy' => $groupBuy,
            'user_id' => $userId
        ]);
        
        // Проверяем, не стало ли участников меньше минимума
        if ($groupBuy['current_participants'] - 1 < $groupBuy['min_participants']) {
            $this->onMinParticipantsNotReached($groupId);
        }
    }
    
    /**
     * Обработка достижения минимального количества участников
     */
    public function onMinParticipantsReached($groupId) {
        // Получаем информацию о групповой покупке
        $groupBuy = $this->getGroupBuyInfo($groupId);
        
        // Отправляем уведомления всем участникам
        $participants = $this->getGroupBuyParticipants($groupId);
        foreach ($participants as $participant) {
            $this->notifications->send($participant['user_id'], 'group-buy:min-participants-reached', [
                'group_buy' => $groupBuy
            ]);
            
            // Отправляем email участнику
            $this->mailer->send(
                $participant['email'],
                'Групповая покупка набрала минимальное количество участников',
                'sfera/group_buy/tpl/emails/min-participants-reached.tpl',
                ['group_buy' => $groupBuy]
            );
        }
    }
    
    /**
     * Обработка ситуации, когда участников меньше минимума
     */
    public function onMinParticipantsNotReached($groupId) {
        // Получаем информацию о групповой покупке
        $groupBuy = $this->getGroupBuyInfo($groupId);
        
        // Отправляем уведомления всем участникам
        $participants = $this->getGroupBuyParticipants($groupId);
        foreach ($participants as $participant) {
            $this->notifications->send($participant['user_id'], 'group-buy:min-participants-not-reached', [
                'group_buy' => $groupBuy
            ]);
            
            // Отправляем email участнику
            $this->mailer->send(
                $participant['email'],
                'Внимание: недостаточно участников в групповой покупке',
                'sfera/group_buy/tpl/emails/min-participants-not-reached.tpl',
                ['group_buy' => $groupBuy]
            );
        }
    }
    
    /**
     * Обработка завершения групповой покупки
     */
    public function onGroupBuyCompleted($groupId) {
        // Получаем информацию о групповой покупке
        $groupBuy = $this->getGroupBuyInfo($groupId);
        
        // Создаем заказы для всех участников
        $participants = $this->getGroupBuyParticipants($groupId);
        foreach ($participants as $participant) {
            $orderId = $this->createOrder($participant['user_id'], $groupBuy);
            
            // Отправляем уведомление участнику
            $this->notifications->send($participant['user_id'], 'group-buy:completed', [
                'group_buy' => $groupBuy,
                'order_id' => $orderId
            ]);
            
            // Отправляем email участнику
            $this->mailer->send(
                $participant['email'],
                'Групповая покупка завершена',
                'sfera/group_buy/tpl/emails/completed.tpl',
                [
                    'group_buy' => $groupBuy,
                    'order_id' => $orderId
                ]
            );
        }
    }
    
    /**
     * Обработка истечения срока групповой покупки
     */
    public function onGroupBuyExpired($groupId) {
        // Получаем информацию о групповой покупке
        $groupBuy = $this->getGroupBuyInfo($groupId);
        
        // Обновляем статус групповой покупки
        $this->db->update('group_buys', [
            'status' => 'cancelled',
            'cancelled_at' => date('Y-m-d H:i:s')
        ], ['id' => $groupId]);
        
        // Отправляем уведомления всем участникам
        $participants = $this->getGroupBuyParticipants($groupId);
        foreach ($participants as $participant) {
            $this->notifications->send($participant['user_id'], 'group-buy:expired', [
                'group_buy' => $groupBuy
            ]);
            
            // Отправляем email участнику
            $this->mailer->send(
                $participant['email'],
                'Групповая покупка истекла',
                'sfera/group_buy/tpl/emails/expired.tpl',
                ['group_buy' => $groupBuy]
            );
        }
        
        // Отправляем уведомление создателю
        $this->notifications->send($groupBuy['creator_id'], 'group-buy:expired', [
            'group_buy' => $groupBuy
        ]);
        
        // Отправляем email создателю
        $this->mailer->send(
            $groupBuy['creator_email'],
            'Групповая покупка истекла',
            'sfera/group_buy/tpl/emails/expired-creator.tpl',
            ['group_buy' => $groupBuy]
        );
    }
    
    /**
     * Получение информации о групповой покупке
     */
    private function getGroupBuyInfo($groupId) {
        return $this->db->fetchOne(
            "SELECT gb.*, p.name as product_name, p.price as product_price,
                    u.email as user_email, c.email as creator_email
             FROM group_buys gb
             JOIN products p ON p.id = gb.product_id
             JOIN users u ON u.id = gb.creator_id
             JOIN users c ON c.id = gb.creator_id
             WHERE gb.id = ?",
            [$groupId]
        );
    }
    
    /**
     * Получение списка участников групповой покупки
     */
    private function getGroupBuyParticipants($groupId) {
        return $this->db->fetchAll(
            "SELECT gbp.*, u.email
             FROM group_buy_participants gbp
             JOIN users u ON u.id = gbp.user_id
             WHERE gbp.group_buy_id = ?",
            [$groupId]
        );
    }
    
    /**
     * Создание заказа для участника
     */
    private function createOrder($userId, $groupBuy) {
        return $this->db->insert('group_buy_orders', [
            'user_id' => $userId,
            'product_id' => $groupBuy['product_id'],
            'group_buy_id' => $groupBuy['id'],
            'price' => $groupBuy['group_price'],
            'status' => 'pending',
            'created_at' => date('Y-m-d H:i:s')
        ]);
    }
} 