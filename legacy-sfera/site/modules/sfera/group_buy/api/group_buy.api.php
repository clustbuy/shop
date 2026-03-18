<?php
class GroupBuyApi extends ApiController {
    private $db;
    private $user;
    
    public function __construct() {
        parent::__construct();
        $this->db = Database::getInstance();
        $this->user = User::getInstance();
    }
    
    // Получение списка активных групповых покупок
    public function getActive() {
        try {
            $groupBuys = $this->getActiveGroupBuys();
            $this->sendResponse(true, 'Список активных групповых покупок получен', $groupBuys);
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // Получение информации о групповой покупке
    public function getGroupBuy($groupId) {
        try {
            $groupBuy = $this->getGroupBuyInfo($groupId);
            if (!$groupBuy) {
                throw new Exception('Групповая покупка не найдена');
            }
            
            $this->sendResponse(true, 'Информация о групповой покупке получена', $groupBuy);
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // Создание новой групповой покупки
    public function create() {
        try {
            if (!$this->user->isLoggedIn()) {
                throw new Exception('Необходимо авторизоваться');
            }
            
            $data = $this->getRequestData();
            $this->validateCreateData($data);
            
            $groupId = $this->createGroupBuy($data);
            $this->sendResponse(true, 'Групповая покупка создана', ['id' => $groupId]);
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // Присоединение к групповой покупке
    public function join($groupId) {
        try {
            if (!$this->user->isLoggedIn()) {
                throw new Exception('Необходимо авторизоваться');
            }
            
            $groupBuy = $this->getGroupBuyInfo($groupId);
            if (!$groupBuy) {
                throw new Exception('Групповая покупка не найдена');
            }
            
            if ($groupBuy['status'] !== 'active') {
                throw new Exception('Групповая покупка неактивна');
            }
            
            if ($groupBuy['current_participants'] >= $groupBuy['max_participants']) {
                throw new Exception('Достигнуто максимальное количество участников');
            }
            
            if ($this->isUserParticipant($groupId, $this->user->getId())) {
                throw new Exception('Вы уже являетесь участником');
            }
            
            $this->addParticipant($groupId, $this->user->getId());
            $this->sendResponse(true, 'Вы присоединились к групповой покупке');
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // Выход из групповой покупки
    public function leave($groupId) {
        try {
            if (!$this->user->isLoggedIn()) {
                throw new Exception('Необходимо авторизоваться');
            }
            
            $groupBuy = $this->getGroupBuyInfo($groupId);
            if (!$groupBuy) {
                throw new Exception('Групповая покупка не найдена');
            }
            
            if ($groupBuy['status'] !== 'active') {
                throw new Exception('Групповая покупка неактивна');
            }
            
            if (!$this->isUserParticipant($groupId, $this->user->getId())) {
                throw new Exception('Вы не являетесь участником');
            }
            
            if ($groupBuy['creator_id'] === $this->user->getId()) {
                throw new Exception('Создатель не может покинуть группу');
            }
            
            $this->removeParticipant($groupId, $this->user->getId());
            $this->sendResponse(true, 'Вы покинули групповую покупку');
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // Завершение групповой покупки
    public function complete($groupId) {
        try {
            if (!$this->user->isLoggedIn()) {
                throw new Exception('Необходимо авторизоваться');
            }
            
            $groupBuy = $this->getGroupBuyInfo($groupId);
            if (!$groupBuy) {
                throw new Exception('Групповая покупка не найдена');
            }
            
            if ($groupBuy['status'] !== 'active') {
                throw new Exception('Групповая покупка неактивна');
            }
            
            if ($groupBuy['creator_id'] !== $this->user->getId()) {
                throw new Exception('Только создатель может завершить групповую покупку');
            }
            
            if ($groupBuy['current_participants'] < $groupBuy['min_participants']) {
                throw new Exception('Недостаточно участников для завершения');
            }
            
            $this->completeGroupBuy($groupId);
            $this->sendResponse(true, 'Групповая покупка завершена');
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // API эндпоинты для инициированных закупок
    public function createInitiatedBuy() {
        try {
            if (!$this->user->isLoggedIn()) {
                throw new Exception('Необходимо авторизоваться');
            }
            
            $data = $this->getRequestData();
            $this->validateCreateData($data);
            
            $groupId = $this->createInitiatedGroupBuy($data);
            $this->sendResponse(true, 'Инициированная групповая закупка создана', ['id' => $groupId]);
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }

    public function getInitiatedBuys() {
        try {
            $groupBuys = $this->getInitiatedGroupBuys();
            $this->sendResponse(true, 'Список инициированных групповых закупок получен', $groupBuys);
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }

    public function updateInitiatedBuy($id) {
        try {
            if (!$this->user->isLoggedIn()) {
                throw new Exception('Необходимо авторизоваться');
            }
            
            $data = $this->getRequestData();
            $this->validateUpdateData($data);
            
            $this->updateInitiatedGroupBuy($id, $data);
            $this->sendResponse(true, 'Инициированная групповая закупка обновлена');
        } catch (Exception $e) {
            $this->sendResponse(false, $e->getMessage());
        }
    }
    
    // Приватные методы для работы с базой данных
    
    private function getActiveGroupBuys() {
        $query = "SELECT gb.*, p.name as product_name, p.price as product_price, p.image as product_image,
                        u.name as creator_name, u.avatar as creator_avatar,
                        (SELECT COUNT(*) FROM group_buy_participants WHERE group_buy_id = gb.id) as current_participants
                 FROM group_buys gb
                 JOIN products p ON gb.product_id = p.id
                 JOIN users u ON gb.creator_id = u.id
                 WHERE gb.status = 'active' AND gb.end_date > NOW()
                 ORDER BY gb.created_at DESC";
        
        return $this->db->query($query)->fetchAll();
    }
    
    private function getGroupBuyInfo($groupId) {
        $query = "SELECT gb.*, p.name as product_name, p.price as product_price, p.image as product_image,
                        u.name as creator_name, u.avatar as creator_avatar,
                        (SELECT COUNT(*) FROM group_buy_participants WHERE group_buy_id = gb.id) as current_participants
                 FROM group_buys gb
                 JOIN products p ON gb.product_id = p.id
                 JOIN users u ON gb.creator_id = u.id
                 WHERE gb.id = ?";
        
        $groupBuy = $this->db->query($query, [$groupId])->fetch();
        
        if ($groupBuy) {
            $groupBuy['participants'] = $this->getGroupBuyParticipants($groupId);
            $groupBuy['is_participant'] = $this->isUserParticipant($groupId, $this->user->getId());
            $groupBuy['is_creator'] = $groupBuy['creator_id'] === $this->user->getId();
        }
        
        return $groupBuy;
    }
    
    private function getGroupBuyParticipants($groupId) {
        $query = "SELECT u.id, u.name, u.avatar, gbp.joined_at as join_date
                 FROM group_buy_participants gbp
                 JOIN users u ON gbp.user_id = u.id
                 WHERE gbp.group_buy_id = ?
                 ORDER BY gbp.joined_at ASC";
        
        return $this->db->query($query, [$groupId])->fetchAll();
    }
    
    private function isUserParticipant($groupId, $userId) {
        $query = "SELECT COUNT(*) FROM group_buy_participants WHERE group_buy_id = ? AND user_id = ?";
        return $this->db->query($query, [$groupId, $userId])->fetchColumn() > 0;
    }
    
    private function validateCreateData($data) {
        $required = ['product_id', 'min_participants', 'group_price', 'end_date'];
        foreach ($required as $field) {
            if (!isset($data[$field]) || empty($data[$field])) {
                throw new Exception("Поле {$field} обязательно для заполнения");
            }
        }
        
        if ($data['min_participants'] < 2) {
            throw new Exception('Минимальное количество участников - 2');
        }
        
        $product = $this->getProductInfo($data['product_id']);
        if (!$product) {
            throw new Exception('Товар не найден');
        }
        
        if ($data['group_price'] >= $product['price']) {
            throw new Exception('Групповая цена должна быть меньше обычной цены');
        }
        
        $endDate = new DateTime($data['end_date']);
        $minDate = new DateTime('+24 hours');
        if ($endDate < $minDate) {
            throw new Exception('Дата окончания должна быть не раньше чем через 24 часа');
        }
    }
    
    private function createGroupBuy($data) {
        $this->db->beginTransaction();
        
        try {
            $query = "INSERT INTO group_buys (product_id, creator_id, min_participants, group_price, end_date, description, status, created_at)
                     VALUES (?, ?, ?, ?, ?, ?, 'active', NOW())";
            
            $this->db->query($query, [
                $data['product_id'],
                $this->user->getId(),
                $data['min_participants'],
                $data['group_price'],
                $data['end_date'],
                $data['description'] ?? null
            ]);
            
            $groupId = $this->db->lastInsertId();
            
            // Добавляем создателя как первого участника
            $this->addParticipant($groupId, $this->user->getId());
            
            $this->db->commit();
            return $groupId;
        } catch (Exception $e) {
            $this->db->rollBack();
            throw $e;
        }
    }
    
    private function addParticipant($groupId, $userId) {
        $query = "INSERT INTO group_buy_participants (group_buy_id, user_id, joined_at)
                 VALUES (?, ?, NOW())";
        
        $this->db->query($query, [$groupId, $userId]);
    }
    
    private function removeParticipant($groupId, $userId) {
        $query = "DELETE FROM group_buy_participants WHERE group_buy_id = ? AND user_id = ?";
        $this->db->query($query, [$groupId, $userId]);
    }
    
    private function completeGroupBuy($groupId) {
        $this->db->beginTransaction();
        
        try {
            // Обновляем статус групповой покупки
            $query = "UPDATE group_buys SET status = 'completed', completed_at = NOW() WHERE id = ?";
            $this->db->query($query, [$groupId]);
            
            // Создаем заказы для всех участников
            $participants = $this->getGroupBuyParticipants($groupId);
            $groupBuy = $this->getGroupBuyInfo($groupId);
            
            foreach ($participants as $participant) {
                $this->createOrder($participant['id'], $groupBuy);
            }
            
            $this->db->commit();
        } catch (Exception $e) {
            $this->db->rollBack();
            throw $e;
        }
    }
    
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
    
    private function getProductInfo($productId) {
        $query = "SELECT * FROM products WHERE id = ?";
        return $this->db->query($query, [$productId])->fetch();
    }
} 