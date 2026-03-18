-- Создание таблицы пользователей (если не существует)
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `avatar` VARCHAR(255),
    `last_login` DATETIME,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Создание таблицы товаров (если не существует)
CREATE TABLE IF NOT EXISTS `products` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    `image` VARCHAR(255),
    `description` TEXT,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Таблица групповых покупок
CREATE TABLE IF NOT EXISTS `group_buys` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INT UNSIGNED NOT NULL,
    `creator_id` INT UNSIGNED NOT NULL,
    `min_participants` INT UNSIGNED NOT NULL DEFAULT 2,
    `max_participants` INT UNSIGNED DEFAULT NULL,
    `group_price` DECIMAL(10,2) NOT NULL,
    `end_date` DATETIME NOT NULL,
    `description` TEXT,
    `status` ENUM('active', 'completed', 'cancelled', 'archived') NOT NULL DEFAULT 'active',
    `created_at` DATETIME NOT NULL,
    `completed_at` DATETIME DEFAULT NULL,
    `cancelled_at` DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_product` (`product_id`),
    KEY `idx_creator` (`creator_id`),
    KEY `idx_status` (`status`),
    KEY `idx_end_date` (`end_date`),
    CONSTRAINT `fk_group_buy_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT,
    CONSTRAINT `fk_group_buy_creator` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Таблица участников групповых покупок
CREATE TABLE IF NOT EXISTS `group_buy_participants` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `group_buy_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `joined_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_group_user` (`group_buy_id`, `user_id`),
    KEY `idx_user` (`user_id`),
    CONSTRAINT `fk_participant_group` FOREIGN KEY (`group_buy_id`) REFERENCES `group_buys` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_participant_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Создание таблицы заказов групповых покупок
CREATE TABLE IF NOT EXISTS `group_buy_orders` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `group_buy_id` INT UNSIGNED NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    `status` ENUM('pending', 'paid', 'cancelled', 'completed') NOT NULL DEFAULT 'pending',
    `created_at` DATETIME NOT NULL,
    `paid_at` DATETIME DEFAULT NULL,
    `cancelled_at` DATETIME DEFAULT NULL,
    `completed_at` DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_user` (`user_id`),
    KEY `idx_product` (`product_id`),
    KEY `idx_group_buy` (`group_buy_id`),
    KEY `idx_status` (`status`),
    CONSTRAINT `fk_group_buy_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
    CONSTRAINT `fk_group_buy_order_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT,
    CONSTRAINT `fk_group_buy_order_group` FOREIGN KEY (`group_buy_id`) REFERENCES `group_buys` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Создание таблицы статистики групповых покупок
CREATE TABLE IF NOT EXISTS `group_buy_stats` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `total_group_buys` INT UNSIGNED NOT NULL DEFAULT 0,
    `completed_group_buys` INT UNSIGNED NOT NULL DEFAULT 0,
    `cancelled_group_buys` INT UNSIGNED NOT NULL DEFAULT 0,
    `avg_participants` DECIMAL(10,2) DEFAULT NULL,
    `total_revenue` DECIMAL(10,2) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Индексы для оптимизации запросов
CREATE INDEX `idx_group_buy_status_end_date` ON `group_buys` (`status`, `end_date`);
CREATE INDEX `idx_group_buy_creator_status` ON `group_buys` (`creator_id`, `status`);
CREATE INDEX `idx_participant_joined` ON `group_buy_participants` (`joined_at`);

-- Триггер для проверки максимального количества участников
DELIMITER //
CREATE TRIGGER `check_max_participants` BEFORE INSERT ON `group_buy_participants`
FOR EACH ROW
BEGIN
    DECLARE max_participants INT;
    DECLARE current_participants INT;
    
    SELECT gb.max_participants, COUNT(gbp.id)
    INTO max_participants, current_participants
    FROM group_buys gb
    LEFT JOIN group_buy_participants gbp ON gbp.group_buy_id = gb.id
    WHERE gb.id = NEW.group_buy_id
    GROUP BY gb.id;
    
    IF max_participants IS NOT NULL AND current_participants >= max_participants THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Maximum number of participants reached';
    END IF;
END//
DELIMITER ;

-- Триггер для проверки статуса групповой покупки
DELIMITER //
CREATE TRIGGER `check_group_buy_status` BEFORE INSERT ON `group_buy_participants`
FOR EACH ROW
BEGIN
    DECLARE group_status VARCHAR(20);
    
    SELECT status INTO group_status
    FROM group_buys
    WHERE id = NEW.group_buy_id;
    
    IF group_status != 'active' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Group buy is not active';
    END IF;
END//
DELIMITER ;

-- Триггер для проверки даты окончания
DELIMITER //
CREATE TRIGGER `check_group_buy_end_date` BEFORE INSERT ON `group_buy_participants`
FOR EACH ROW
BEGIN
    DECLARE end_date DATETIME;
    
    SELECT gb.end_date INTO end_date
    FROM group_buys gb
    WHERE gb.id = NEW.group_buy_id;
    
    IF end_date <= NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Group buy has ended';
    END IF;
END//
DELIMITER ; 