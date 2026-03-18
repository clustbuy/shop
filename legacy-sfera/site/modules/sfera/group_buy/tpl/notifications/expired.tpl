<div class="notification group-buy-expired">
    <div class="notification-icon">
        <i class="fa fa-clock-o"></i>
    </div>
    
    <div class="notification-content">
        <h4 class="notification-title">Групповая покупка истекла</h4>
        
        <div class="notification-details">
            <p class="product-name">{$groupBuy.product.name}</p>
            
            <div class="price-info">
                <span class="group-price">{$groupBuy.group_price|number_format:2} ₽</span>
                <span class="savings">Экономия: {($groupBuy.product.price - $groupBuy.group_price)|number_format:2} ₽</span>
            </div>
            
            <div class="expiration-info">
                <div class="participants">
                    <i class="fa fa-users"></i>
                    <span>{$groupBuy.current_participants} из {$groupBuy.min_participants} участников</span>
                </div>
                
                <div class="expiration-date">
                    <i class="fa fa-calendar"></i>
                    <span>Истекла: {$groupBuy.end_date|date_format:"%d.%m.%Y %H:%M"}</span>
                </div>
            </div>
            
            {if $groupBuy.is_creator}
                <div class="creator-info">
                    <p>К сожалению, не удалось собрать минимальное количество участников.</p>
                    <p>Вы можете создать новую групповую покупку с другими параметрами.</p>
                </div>
            {elseif $groupBuy.is_participant}
                <div class="participant-info">
                    <p>К сожалению, не удалось собрать минимальное количество участников.</p>
                    <p>Вы можете присоединиться к другим активным групповым покупкам.</p>
                </div>
            {/if}
        </div>
        
        <div class="notification-actions">
            {if $groupBuy.is_creator}
                <a href="/group-buy/create" class="btn btn-primary btn-sm">
                    Создать новую
                </a>
            {else}
                <a href="/group-buy" class="btn btn-primary btn-sm">
                    Смотреть другие
                </a>
            {/if}
        </div>
    </div>
</div>

<style>
.notification.group-buy-expired {
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
    background: #fff3e0;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
}

.notification-icon i {
    color: #ff9800;
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

.expiration-info {
    margin-bottom: 15px;
}

.participants, .expiration-date {
    font-size: 12px;
    color: #666;
    margin-bottom: 5px;
}

.participants i, .expiration-date i {
    margin-right: 5px;
    width: 16px;
    text-align: center;
}

.creator-info, .participant-info {
    background: #fff3e0;
    border-radius: 4px;
    padding: 10px;
    margin-bottom: 15px;
}

.creator-info p, .participant-info p {
    margin: 0 0 5px;
    font-size: 14px;
    color: #333;
}

.creator-info p:last-child, .participant-info p:last-child {
    margin-bottom: 0;
}

.notification-actions {
    text-align: right;
}

@media (max-width: 480px) {
    .notification.group-buy-expired {
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