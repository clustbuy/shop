~~if $TPL == 'd'~
<div class="group-buy-container">
    <div class="group-buy-header">
        <h1>Совместные покупки</h1>
        ~~if $user_id~
        <a href="/group_buy/create" class="btn btn-primary">Создать групповую покупку</a>
        ~~/if~
    </div>
    
    ~~if $group_buys~
    <div class="group-buys-grid">
        ~~foreach from=$group_buys item=group~
        <div class="group-buy-card">
            <div class="product-info">
                <img src="~~$group.product.image~" alt="~~$group.product.name~">
                <div>
                    <h3>~~$group.product.name~</h3>
                    <p class="price">Обычная цена: ~~$group.product.price~ ₽</p>
                    <p class="group-price">Групповая цена: ~~$group.group_price~ ₽</p>
                </div>
            </div>
            
            <div class="group-info">
                <div class="progress">
                    <div class="progress-bar" style="width: ~~$group.progress~%"></div>
                </div>
                <p>Участников: ~~$group.current_participants~/~~$group.min_participants~</p>
                <p>До окончания: ~~$group.time_left~</p>
            </div>
            
            <div class="group-actions">
                ~~if $group.is_participant~
                <button class="btn btn-secondary leave-group" data-group-id="~~$group.id~">
                    Покинуть группу
                </button>
                ~~else~
                <button class="btn btn-primary join-group" data-group-id="~~$group.id~">
                    Присоединиться
                </button>
                ~~/if~
                <a href="/group_buy/view/~~$group.id~" class="btn btn-link">Подробнее</a>
            </div>
        </div>
        ~~/foreach~
    </div>
    ~~else~
    <div class="empty-state">
        <p>Сейчас нет активных групповых покупок</p>
        ~~if $user_id~
        <a href="/group_buy/create" class="btn btn-primary">Создать первую</a>
        ~~else~
        <a href="/auth/login" class="btn btn-primary">Войти для создания</a>
        ~~/if~
    </div>
    ~~/if~
</div>
~~else~
<div class="group-buy-container-mobile">
    <div class="group-buy-header-mobile">
        <h2>Совместные покупки</h2>
        ~~if $user_id~
        <a href="/group_buy/create" class="btn-mobile primary">Создать</a>
        ~~/if~
    </div>
    
    ~~if $group_buys~
    <div class="group-buys-list-mobile">
        ~~foreach from=$group_buys item=group~
        <div class="group-buy-item-mobile">
            <div class="product-info-mobile">
                <img src="~~$group.product.image~" alt="~~$group.product.name~">
                <div>
                    <h3>~~$group.product.name~</h3>
                    <p class="price">~~$group.product.price~ ₽</p>
                    <p class="group-price">~~$group.group_price~ ₽</p>
                </div>
            </div>
            
            <div class="group-info-mobile">
                <div class="progress-mobile">
                    <div class="progress-bar" style="width: ~~$group.progress~%"></div>
                </div>
                <p>~~$group.current_participants~/~~$group.min_participants~ участников</p>
                <p>~~$group.time_left~</p>
            </div>
            
            <div class="group-actions-mobile">
                ~~if $group.is_participant~
                <button class="btn-mobile leave-group" data-group-id="~~$group.id~">
                    Покинуть
                </button>
                ~~else~
                <button class="btn-mobile primary join-group" data-group-id="~~$group.id~">
                    Присоединиться
                </button>
                ~~/if~
                <a href="/group_buy/view/~~$group.id~" class="btn-mobile">Подробнее</a>
            </div>
        </div>
        ~~/foreach~
    </div>
    ~~else~
    <div class="empty-state-mobile">
        <p>Нет активных групповых покупок</p>
        ~~if $user_id~
        <a href="/group_buy/create" class="btn-mobile primary">Создать</a>
        ~~else~
        <a href="/auth/login" class="btn-mobile primary">Войти</a>
        ~~/if~
    </div>
    ~~/if~
</div>
~~/if~ 