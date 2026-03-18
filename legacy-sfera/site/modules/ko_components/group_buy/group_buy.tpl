<div class="group-buy-component" data-bind="with: groupBuy">
    <div class="group-buy-header">
        <h2 data-bind="text: product.name"></h2>
        <div class="group-buy-status">
            <span class="status-label">Статус:</span>
            <span class="status-value" data-bind="text: status"></span>
        </div>
    </div>
    
    <div class="group-buy-content">
        <div class="product-info">
            <img data-bind="attr: { src: product.image, alt: product.name }" class="product-image">
            <div class="price-info">
                <div class="regular-price">
                    <span class="label">Обычная цена:</span>
                    <span class="value" data-bind="text: product.price + ' ₽'"></span>
                </div>
                <div class="group-price">
                    <span class="label">Групповая цена:</span>
                    <span class="value" data-bind="text: group_price + ' ₽'"></span>
                </div>
                <div class="savings">
                    <span class="label">Экономия:</span>
                    <span class="value" data-bind="text: $parent.savings() + ' ₽ (' + $parent.savingsPercent() + '%)'"></span>
                </div>
            </div>
        </div>
        
        <div class="group-progress">
            <div class="progress-bar">
                <div class="progress" data-bind="style: { width: $parent.progress() + '%' }"></div>
            </div>
            <div class="progress-info">
                <span data-bind="text: current_participants + '/' + min_participants + ' участников'"></span>
                <span data-bind="text: $parent.timeLeft()"></span>
            </div>
        </div>
        
        <div class="group-actions">
            <!-- ko if: is_participant -->
            <button class="btn btn-secondary" data-bind="click: function() { $parent.leaveGroup(id) }">
                Покинуть группу
            </button>
            <!-- /ko -->
            <!-- ko ifnot: is_participant -->
            <button class="btn btn-primary" data-bind="click: function() { $parent.joinGroup(id) }">
                Присоединиться
            </button>
            <!-- /ko -->
            <!-- ko if: is_creator -->
            <button class="btn btn-primary" data-bind="click: function() { $parent.completeGroup(id) }">
                Завершить покупку
            </button>
            <!-- /ko -->
        </div>
    </div>
    
    <div class="participants-section">
        <h3>Участники группы</h3>
        <div class="participants-list" data-bind="foreach: $parent.participants">
            <div class="participant-card">
                <img data-bind="attr: { src: avatar, alt: name }" class="avatar">
                <div class="participant-info">
                    <h4 data-bind="text: name"></h4>
                    <p data-bind="text: 'Присоединился: ' + join_date"></p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ko if: $parent.error -->
    <div class="error-message" data-bind="text: $parent.error"></div>
    <!-- /ko -->
    
    <!-- ko if: $parent.isLoading -->
    <div class="loading-overlay">
        <div class="spinner"></div>
    </div>
    <!-- /ko -->
</div>

<script>
ko.components.register('group-buy', {
    viewModel: function(params) {
        var self = this;
        
        // Инициализация модели
        self.groupBuy = ko.observable(null);
        self.participants = ko.observableArray([]);
        self.isLoading = ko.observable(false);
        self.error = ko.observable(null);
        
        // Загрузка данных при инициализации
        if (params.groupId) {
            self.loadGroupBuy(params.groupId);
        }
        
        // Методы из GroupBuyModel
        self.loadGroupBuy = GroupBuyModel.loadGroupBuy;
        self.joinGroup = GroupBuyModel.joinGroup;
        self.leaveGroup = GroupBuyModel.leaveGroup;
        self.completeGroup = GroupBuyModel.completeGroup;
        
        // Вычисляемые свойства
        self.progress = GroupBuyModel.progress;
        self.timeLeft = GroupBuyModel.timeLeft;
        self.savings = GroupBuyModel.savings;
        self.savingsPercent = GroupBuyModel.savingsPercent;
    },
    template: { element: 'group-buy-template' }
});
</script>

<style>
.group-buy-component {
    position: relative;
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.group-buy-header {
    margin-bottom: 20px;
}

.group-buy-header h2 {
    margin: 0;
    color: #333;
}

.group-buy-status {
    margin-top: 10px;
    color: #666;
}

.group-buy-content {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.product-info {
    display: flex;
    gap: 20px;
}

.product-image {
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 4px;
}

.price-info {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.price-info .label {
    color: #666;
}

.price-info .value {
    font-weight: bold;
    color: #333;
}

.group-price .value {
    color: #e53935;
}

.savings .value {
    color: #43a047;
}

.group-progress {
    margin: 20px 0;
}

.progress-bar {
    height: 8px;
    background: #eee;
    border-radius: 4px;
    overflow: hidden;
}

.progress {
    height: 100%;
    background: #2196f3;
    transition: width 0.3s ease;
}

.progress-info {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
    color: #666;
}

.group-actions {
    display: flex;
    gap: 10px;
}

.participants-section {
    margin-top: 30px;
}

.participants-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
    margin-top: 15px;
}

.participant-card {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 10px;
    background: #f5f5f5;
    border-radius: 4px;
}

.participant-card .avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
}

.participant-info h4 {
    margin: 0;
    font-size: 14px;
    color: #333;
}

.participant-info p {
    margin: 5px 0 0;
    font-size: 12px;
    color: #666;
}

.error-message {
    margin-top: 20px;
    padding: 10px;
    background: #ffebee;
    color: #c62828;
    border-radius: 4px;
}

.loading-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255,255,255,0.8);
    display: flex;
    justify-content: center;
    align-items: center;
}

.spinner {
    width: 40px;
    height: 40px;
    border: 4px solid #f3f3f3;
    border-top: 4px solid #2196f3;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* Мобильные стили */
@media (max-width: 768px) {
    .product-info {
        flex-direction: column;
    }
    
    .product-image {
        width: 100%;
        height: auto;
    }
    
    .participants-list {
        grid-template-columns: 1fr;
    }
    
    .group-actions {
        flex-direction: column;
    }
    
    .group-actions .btn {
        width: 100%;
    }
}
</style> 