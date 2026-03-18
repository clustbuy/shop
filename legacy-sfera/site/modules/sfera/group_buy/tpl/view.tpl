~~if $TPL == 'd'~
<div class="group-buy-detail-container">
    <div class="product-detail">
        <div class="product-gallery">
            <img src="~~$group_buy.product.image~" alt="~~$group_buy.product.name~" class="main-image">
            ~~if $group_buy.product.images~
            <div class="thumbnail-list">
                ~~foreach from=$group_buy.product.images item=image~
                <img src="~~$image~" alt="~~$group_buy.product.name~" class="thumbnail">
                ~~/foreach~
            </div>
            ~~/if~
        </div>
        
        <div class="product-info">
            <h1>~~$group_buy.product.name~</h1>
            <div class="price-info">
                <p class="regular-price">Обычная цена: ~~$group_buy.product.price~ ₽</p>
                <p class="group-price">Групповая цена: ~~$group_buy.group_price~ ₽</p>
                <p class="savings">Экономия: ~~$group_buy.savings~ ₽ (~~$group_buy.savings_percent~%)</p>
            </div>
            
            <div class="group-progress">
                <div class="progress">
                    <div class="progress-bar" style="width: ~~$group_buy.progress~%"></div>
                </div>
                <p>Участников: ~~$group_buy.current_participants~/~~$group_buy.min_participants~</p>
                <p>До окончания: ~~$group_buy.time_left~</p>
            </div>
            
            <div class="product-description">
                ~~$group_buy.product.description~
            </div>
            
            <div class="group-actions">
                ~~if $group_buy.is_participant~
                <button class="btn btn-secondary leave-group" data-group-id="~~$group_buy.id~">
                    Покинуть группу
                </button>
                ~~else~
                <button class="btn btn-primary join-group" data-group-id="~~$group_buy.id~">
                    Присоединиться
                </button>
                ~~/if~
                
                ~~if $group_buy.is_creator~
                <button class="btn btn-primary complete-group" data-group-id="~~$group_buy.id~">
                    Завершить покупку
                </button>
                ~~/if~
            </div>
        </div>
    </div>
    
    <div class="participants-section">
        <h2>Участники группы</h2>
        <div class="participants-list">
            ~~foreach from=$participants item=participant~
            <div class="participant-card">
                <img src="~~$participant.avatar~" alt="~~$participant.name~" class="avatar">
                <div class="participant-info">
                    <h3>~~$participant.name~</h3>
                    <p>Присоединился: ~~$participant.join_date~</p>
                </div>
            </div>
            ~~/foreach~
        </div>
    </div>
</div>
~~else~
<div class="group-buy-detail-mobile">
    <div class="product-detail-mobile">
        <div class="product-gallery-mobile">
            <img src="~~$group_buy.product.image~" alt="~~$group_buy.product.name~" class="main-image">
            ~~if $group_buy.product.images~
            <div class="thumbnail-scroll">
                ~~foreach from=$group_buy.product.images item=image~
                <img src="~~$image~" alt="~~$group_buy.product.name~" class="thumbnail">
                ~~/foreach~
            </div>
            ~~/if~
        </div>
        
        <div class="product-info-mobile">
            <h1>~~$group_buy.product.name~</h1>
            <div class="price-info-mobile">
                <p class="regular-price">~~$group_buy.product.price~ ₽</p>
                <p class="group-price">~~$group_buy.group_price~ ₽</p>
                <p class="savings">Экономия ~~$group_buy.savings~ ₽</p>
            </div>
            
            <div class="group-progress-mobile">
                <div class="progress-mobile">
                    <div class="progress-bar" style="width: ~~$group_buy.progress~%"></div>
                </div>
                <p>~~$group_buy.current_participants~/~~$group_buy.min_participants~ участников</p>
                <p>~~$group_buy.time_left~</p>
            </div>
            
            <div class="product-description-mobile">
                ~~$group_buy.product.description~
            </div>
            
            <div class="group-actions-mobile">
                ~~if $group_buy.is_participant~
                <button class="btn-mobile leave-group" data-group-id="~~$group_buy.id~">
                    Покинуть
                </button>
                ~~else~
                <button class="btn-mobile primary join-group" data-group-id="~~$group_buy.id~">
                    Присоединиться
                </button>
                ~~/if~
                
                ~~if $group_buy.is_creator~
                <button class="btn-mobile primary complete-group" data-group-id="~~$group_buy.id~">
                    Завершить
                </button>
                ~~/if~
            </div>
        </div>
    </div>
    
    <div class="participants-section-mobile">
        <h2>Участники</h2>
        <div class="participants-list-mobile">
            ~~foreach from=$participants item=participant~
            <div class="participant-item-mobile">
                <img src="~~$participant.avatar~" alt="~~$participant.name~" class="avatar">
                <div class="participant-info">
                    <h3>~~$participant.name~</h3>
                    <p>~~$participant.join_date~</p>
                </div>
            </div>
            ~~/foreach~
        </div>
    </div>
</div>
~~/if~

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Обработка присоединения к группе
    document.querySelectorAll('.join-group').forEach(button => {
        button.addEventListener('click', function() {
            const groupId = this.dataset.groupId;
            window.location.href = `/group_buy/join/${groupId}`;
        });
    });
    
    // Обработка выхода из группы
    document.querySelectorAll('.leave-group').forEach(button => {
        button.addEventListener('click', function() {
            if (confirm('Вы уверены, что хотите покинуть группу?')) {
                const groupId = this.dataset.groupId;
                window.location.href = `/group_buy/leave/${groupId}`;
            }
        });
    });
    
    // Обработка завершения групповой покупки
    document.querySelectorAll('.complete-group').forEach(button => {
        button.addEventListener('click', function() {
            if (confirm('Вы уверены, что хотите завершить групповую покупку?')) {
                const groupId = this.dataset.groupId;
                window.location.href = `/group_buy/complete/${groupId}`;
            }
        });
    });
});
</script> 