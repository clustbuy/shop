<?php
/**
 * Задачи по расписанию для модуля групповых покупок
 */

class GroupBuyTasks {
    private $db;
    private $events;
    
    public function __construct() {
        $this->db = Database::getInstance();
        $this->events = new GroupBuyEvents();
    }
    
    /**
     * Проверка истекших групповых покупок
     * Запускается каждые 5 минут
     */
    public function checkExpiredGroupBuys() {
        // Получаем истекшие групповые покупки
        $expiredGroupBuys = $this->db->fetchAll(
            "SELECT id FROM group_buys
             WHERE status = 'active'
             AND end_date <= NOW()"
        );
        
        // Обрабатываем каждую истекшую покупку
        foreach ($expiredGroupBuys as $groupBuy) {
            $this->events->onGroupBuyExpired($groupBuy['id']);
        }
    }
    
    /**
     * Проверка групповых покупок, близких к истечению
     * Запускается каждый час
     */
    public function checkExpiringGroupBuys() {
        // Получаем покупки, которые истекают через 24 часа
        $expiringGroupBuys = $this->db->fetchAll(
            "SELECT gb.*, p.name as product_name, p.price as product_price,
                    COUNT(gbp.id) as current_participants
             FROM group_buys gb
             JOIN products p ON p.id = gb.product_id
             LEFT JOIN group_buy_participants gbp ON gbp.group_buy_id = gb.id
             WHERE gb.status = 'active'
             AND gb.end_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 24 HOUR)
             GROUP BY gb.id"
        );
        
        // Отправляем уведомления участникам
        foreach ($expiringGroupBuys as $groupBuy) {
            $participants = $this->getGroupBuyParticipants($groupBuy['id']);
            foreach ($participants as $participant) {
                $this->notifications->send($participant['user_id'], 'group-buy:expiring', [
                    'group_buy' => $groupBuy
                ]);
            }
            
            // Если участников меньше минимума, отправляем уведомление создателю
            if ($groupBuy['current_participants'] < $groupBuy['min_participants']) {
                $this->notifications->send($groupBuy['creator_id'], 'group-buy:expiring-low-participants', [
                    'group_buy' => $groupBuy
                ]);
            }
        }
    }
    
    /**
     * Очистка старых групповых покупок
     * Запускается раз в день
     */
    public function cleanupOldGroupBuys() {
        // Удаляем отмененные покупки старше 30 дней
        $this->db->delete(
            'group_buys',
            "status = 'cancelled' AND cancelled_at < DATE_SUB(NOW(), INTERVAL 30 DAY)"
        );
        
        // Архивируем завершенные покупки старше 90 дней
        $this->db->update(
            'group_buys',
            ['status' => 'archived'],
            "status = 'completed' AND completed_at < DATE_SUB(NOW(), INTERVAL 90 DAY)"
        );
    }
    
    /**
     * Сбор статистики по групповым покупкам
     * Запускается раз в день
     */
    public function collectGroupBuyStats() {
        // Собираем статистику за последние 24 часа
        $stats = $this->db->fetchOne(
            "SELECT 
                COUNT(*) as total_group_buys,
                SUM(CASE WHEN status = 'completed' THEN 1 ELSE 0 END) as completed_group_buys,
                SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) as cancelled_group_buys,
                AVG(CASE WHEN status = 'completed' THEN current_participants ELSE NULL END) as avg_participants,
                SUM(CASE WHEN status = 'completed' THEN group_price * current_participants ELSE 0 END) as total_revenue
             FROM group_buys
             WHERE created_at >= DATE_SUB(NOW(), INTERVAL 24 HOUR)"
        );
        
        // Сохраняем статистику
        $this->db->insert('group_buy_stats', [
            'date' => date('Y-m-d'),
            'total_group_buys' => $stats['total_group_buys'],
            'completed_group_buys' => $stats['completed_group_buys'],
            'cancelled_group_buys' => $stats['cancelled_group_buys'],
            'avg_participants' => $stats['avg_participants'],
            'total_revenue' => $stats['total_revenue'],
            'created_at' => date('Y-m-d H:i:s')
        ]);
    }
    
    /**
     * Проверка активности участников
     * Запускается раз в день
     */
    public function checkParticipantActivity() {
        // Получаем неактивных участников (не заходили более 7 дней)
        $inactiveParticipants = $this->db->fetchAll(
            "SELECT DISTINCT gbp.user_id, u.email
             FROM group_buy_participants gbp
             JOIN users u ON u.id = gbp.user_id
             JOIN group_buys gb ON gb.id = gbp.group_buy_id
             WHERE gb.status = 'active'
             AND u.last_login < DATE_SUB(NOW(), INTERVAL 7 DAY)"
        );
        
        // Отправляем напоминания неактивным участникам
        foreach ($inactiveParticipants as $participant) {
            $this->mailer->send(
                $participant['email'],
                'Напоминание о групповой покупке',
                'sfera/group_buy/tpl/emails/activity-reminder.tpl',
                ['user_id' => $participant['user_id']]
            );
        }
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
} 