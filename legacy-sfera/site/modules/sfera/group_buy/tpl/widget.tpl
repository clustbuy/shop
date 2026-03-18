<div class="widget active-group-buys">
    <div class="widget-header">
        <h3 class="widget-title">Активные групповые покупки</h3>
        {if $isLoggedIn}
            <a href="/group-buy/create" class="btn btn-primary btn-sm">
                <i class="fa fa-plus"></i> Создать
            </a>
        {/if}
    </div>
    
    <div class="widget-body">
        {if $activeGroupBuys}
            <div class="group-buys-grid">
                {foreach from=$activeGroupBuys item=groupBuy}
                    <div class="group-buy-card">
                        <div class="group-buy-image">
                            <img src="{$groupBuy.product.image}" alt="{$groupBuy.product.name}">
                        </div>
                        
                        <div class="group-buy-info">
                            <h4 class="group-buy-title">
                                <a href="/group-buy/view/{$groupBuy.id}">{$groupBuy.product.name}</a>
                            </h4>
                            
                            <div class="group-buy-prices">
                                <span class="regular-price">{$groupBuy.product.price|number_format:2} ₽</span>
                                <span class="group-price">{$groupBuy.group_price|number_format:2} ₽</span>
                                <span class="savings">
                                    Экономия: {($groupBuy.product.price - $groupBuy.group_price)|number_format:2} ₽
                                </span>
                            </div>
                            
                            <div class="group-buy-progress">
                                <div class="progress">
                                    <div class="progress-bar" style="width: {($groupBuy.current_participants / $groupBuy.min_participants) * 100}%"></div>
                                </div>
                                <div class="progress-info">
                                    <span class="current">{$groupBuy.current_participants}</span>
                                    <span class="separator">/</span>
                                    <span class="required">{$groupBuy.min_participants}</span>
                                    <span class="participants">участников</span>
                                </div>
                            </div>
                            
                            <div class="group-buy-time">
                                <i class="fa fa-clock-o"></i>
                                <span class="time-left" data-end="{$groupBuy.end_date}">
                                    {$groupBuy.time_left}
                                </span>
                            </div>
                            
                            {if $isLoggedIn}
                                {if $groupBuy.is_participant}
                                    <button class="btn btn-danger btn-sm leave-group" data-id="{$groupBuy.id}">
                                        <i class="fa fa-times"></i> Покинуть
                                    </button>
                                {else}
                                    <button class="btn btn-success btn-sm join-group" data-id="{$groupBuy.id}">
                                        <i class="fa fa-plus"></i> Присоединиться
                                    </button>
                                {/if}
                            {else}
                                <a href="/login" class="btn btn-primary btn-sm">
                                    <i class="fa fa-sign-in"></i> Войти для участия
                                </a>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            </div>
            
            <div class="widget-footer">
                <a href="/group-buy" class="btn btn-link">Все групповые покупки</a>
            </div>
        {else}
            <div class="empty-state">
                <i class="fa fa-users"></i>
                <p>Нет активных групповых покупок</p>
                {if $isLoggedIn}
                    <a href="/group-buy/create" class="btn btn-primary">
                        <i class="fa fa-plus"></i> Создать групповую покупку
                    </a>
                {else}
                    <a href="/login" class="btn btn-primary">
                        <i class="fa fa-sign-in"></i> Войти для создания
                    </a>
                {/if}
            </div>
        {/if}
    </div>
</div>

<style>
.widget.active-group-buys {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin-bottom: 20px;
}

.widget-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    border-bottom: 1px solid #eee;
}

.widget-title {
    margin: 0;
    font-size: 18px;
    font-weight: 600;
}

.widget-body {
    padding: 20px;
}

.group-buys-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
}

.group-buy-card {
    background: #fff;
    border: 1px solid #eee;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.2s;
}

.group-buy-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.group-buy-image {
    height: 200px;
    overflow: hidden;
}

.group-buy-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.group-buy-info {
    padding: 15px;
}

.group-buy-title {
    margin: 0 0 10px;
    font-size: 16px;
    font-weight: 600;
}

.group-buy-title a {
    color: #333;
    text-decoration: none;
}

.group-buy-prices {
    margin-bottom: 15px;
}

.regular-price {
    color: #999;
    text-decoration: line-through;
    margin-right: 10px;
}

.group-price {
    color: #e74c3c;
    font-weight: 600;
    font-size: 18px;
}

.savings {
    display: block;
    color: #27ae60;
    font-size: 14px;
    margin-top: 5px;
}

.group-buy-progress {
    margin-bottom: 15px;
}

.progress {
    height: 6px;
    background: #f5f5f5;
    border-radius: 3px;
    overflow: hidden;
    margin-bottom: 5px;
}

.progress-bar {
    background: #3498db;
    height: 100%;
    transition: width 0.3s;
}

.progress-info {
    display: flex;
    align-items: center;
    font-size: 14px;
    color: #666;
}

.progress-info .current {
    color: #3498db;
    font-weight: 600;
}

.progress-info .separator {
    margin: 0 5px;
}

.group-buy-time {
    margin-bottom: 15px;
    color: #666;
    font-size: 14px;
}

.group-buy-time i {
    margin-right: 5px;
}

.empty-state {
    text-align: center;
    padding: 40px 20px;
}

.empty-state i {
    font-size: 48px;
    color: #ddd;
    margin-bottom: 15px;
}

.empty-state p {
    color: #666;
    margin-bottom: 20px;
}

.widget-footer {
    padding: 15px 20px;
    border-top: 1px solid #eee;
    text-align: center;
}

@media (max-width: 768px) {
    .group-buys-grid {
        grid-template-columns: 1fr;
    }
    
    .group-buy-card {
        margin-bottom: 15px;
    }
    
    .group-buy-image {
        height: 150px;
    }
}
</style>

<script>
$(document).ready(function() {
    // Обработка присоединения к групповой покупке
    $('.join-group').click(function() {
        var groupId = $(this).data('id');
        var button = $(this);
        
        button.prop('disabled', true);
        
        $.post('/api/group-buy/' + groupId + '/join', function(response) {
            if (response.success) {
                location.reload();
            } else {
                alert(response.error || 'Произошла ошибка');
                button.prop('disabled', false);
            }
        });
    });
    
    // Обработка выхода из групповой покупки
    $('.leave-group').click(function() {
        var groupId = $(this).data('id');
        var button = $(this);
        
        if (confirm('Вы уверены, что хотите покинуть групповую покупку?')) {
            button.prop('disabled', true);
            
            $.post('/api/group-buy/' + groupId + '/leave', function(response) {
                if (response.success) {
                    location.reload();
                } else {
                    alert(response.error || 'Произошла ошибка');
                    button.prop('disabled', false);
                }
            });
        }
    });
    
    // Обновление оставшегося времени
    function updateTimeLeft() {
        $('.time-left').each(function() {
            var endDate = new Date($(this).data('end'));
            var now = new Date();
            var diff = endDate - now;
            
            if (diff <= 0) {
                $(this).text('Завершено');
                return;
            }
            
            var days = Math.floor(diff / (1000 * 60 * 60 * 24));
            var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            
            var timeLeft = '';
            if (days > 0) {
                timeLeft += days + 'д ';
            }
            timeLeft += hours + 'ч ' + minutes + 'м';
            
            $(this).text(timeLeft);
        });
    }
    
    updateTimeLeft();
    setInterval(updateTimeLeft, 60000); // Обновление каждую минуту
});
</script> 