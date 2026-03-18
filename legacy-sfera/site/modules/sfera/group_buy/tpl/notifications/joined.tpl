<div class="notification group-buy-joined">
    <div class="notification-icon">
        <i class="fa fa-users"></i>
    </div>
    
    <div class="notification-content">
        <h4 class="notification-title">Вы присоединились к групповой покупке</h4>
        
        <div class="notification-details">
            <p class="product-name">{$groupBuy.product.name}</p>
            
            <div class="price-info">
                <span class="group-price">{$groupBuy.group_price|number_format:2} ₽</span>
                <span class="savings">Экономия: {($groupBuy.product.price - $groupBuy.group_price)|number_format:2} ₽</span>
            </div>
            
            <div class="progress-info">
                <div class="progress">
                    <div class="progress-bar" style="width: {($groupBuy.current_participants / $groupBuy.min_participants) * 100}%"></div>
                </div>
                <span class="participants-count">
                    {$groupBuy.current_participants} из {$groupBuy.min_participants} участников
                </span>
            </div>
            
            <div class="time-info">
                <i class="fa fa-clock-o"></i>
                <span>Осталось времени: {$groupBuy.time_left}</span>
            </div>
        </div>
        
        <div class="notification-actions">
            <a href="/group-buy/view/{$groupBuy.id}" class="btn btn-primary btn-sm">
                Подробнее
            </a>
        </div>
    </div>
</div>

<style>
.notification.group-buy-joined {
    display: flex;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 15px;
    margin-bottom: 10px;
}

.notification-icon {
    flex: 0 0 40px;
    height: 40px;
    background: #e8f5e9;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
}

.notification-icon i {
    color: #4caf50;
    font-size: 20px;
}

.notification-content {
    flex: 1;
}

.notification-title {
    margin: 0 0 10px;
    font-size: 16px;
    font-weight: 600;
    color: #333;
}

.notification-details {
    margin-bottom: 15px;
}

.product-name {
    font-size: 14px;
    color: #666;
    margin-bottom: 10px;
}

.price-info {
    margin-bottom: 10px;
}

.group-price {
    font-size: 18px;
    font-weight: 600;
    color: #e74c3c;
    margin-right: 10px;
}

.savings {
    font-size: 14px;
    color: #27ae60;
}

.progress-info {
    margin-bottom: 10px;
}

.progress {
    height: 4px;
    background: #f5f5f5;
    border-radius: 2px;
    overflow: hidden;
    margin-bottom: 5px;
}

.progress-bar {
    background: #3498db;
    height: 100%;
}

.participants-count {
    font-size: 12px;
    color: #666;
}

.time-info {
    font-size: 12px;
    color: #666;
}

.time-info i {
    margin-right: 5px;
}

.notification-actions {
    text-align: right;
}

@media (max-width: 480px) {
    .notification.group-buy-joined {
        flex-direction: column;
    }
    
    .notification-icon {
        margin: 0 auto 15px;
    }
    
    .notification-actions {
        text-align: center;
    }
}
</style> 