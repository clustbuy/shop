<div class="notification group-buy-completed">
    <div class="notification-icon">
        <i class="fa fa-check-circle"></i>
    </div>
    
    <div class="notification-content">
        <h4 class="notification-title">Групповая покупка завершена</h4>
        
        <div class="notification-details">
            <p class="product-name">{$groupBuy.product.name}</p>
            
            <div class="price-info">
                <span class="group-price">{$groupBuy.group_price|number_format:2} ₽</span>
                <span class="savings">Экономия: {($groupBuy.product.price - $groupBuy.group_price)|number_format:2} ₽</span>
            </div>
            
            <div class="completion-info">
                <div class="participants">
                    <i class="fa fa-users"></i>
                    <span>{$groupBuy.current_participants} участников</span>
                </div>
                
                <div class="completion-date">
                    <i class="fa fa-calendar"></i>
                    <span>Завершена: {$groupBuy.completed_at|date_format:"%d.%m.%Y %H:%M"}</span>
                </div>
            </div>
            
            {if $groupBuy.is_participant}
                <div class="order-info">
                    <p>Ваш заказ #{$groupBuy.group_buy_order_id} создан и ожидает оплаты.</p>
                    <p class="payment-deadline">
                        <i class="fa fa-clock-o"></i>
                        Срок оплаты: {$groupBuy.payment_deadline|date_format:"%d.%m.%Y %H:%M"}
                    </p>
                </div>
            {/if}
        </div>
        
        <div class="notification-actions">
            {if $groupBuy.is_participant}
                <a href="/group-buy/orders/view/{$groupBuy.group_buy_order_id}" class="btn btn-primary btn-sm">
                    Перейти к заказу
                </a>
            {else}
                <a href="/group-buy/view/{$groupBuy.id}" class="btn btn-primary btn-sm">
                    Подробнее
                </a>
            {/if}
        </div>
    </div>
</div>

<style>
.notification.group-buy-completed {
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
    background: #e3f2fd;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
}

.notification-icon i {
    color: #2196f3;
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

.completion-info {
    margin-bottom: 15px;
}

.participants, .completion-date {
    font-size: 12px;
    color: #666;
    margin-bottom: 5px;
}

.participants i, .completion-date i {
    margin-right: 5px;
    width: 16px;
    text-align: center;
}

.order-info {
    background: #f8f9fa;
    border-radius: 4px;
    padding: 10px;
    margin-bottom: 15px;
}

.order-info p {
    margin: 0 0 5px;
    font-size: 14px;
    color: #333;
}

.payment-deadline {
    font-size: 12px;
    color: #666;
}

.payment-deadline i {
    margin-right: 5px;
}

.notification-actions {
    text-align: right;
}

@media (max-width: 480px) {
    .notification.group-buy-completed {
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