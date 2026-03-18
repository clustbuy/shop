<div class="group-buy-list-component">
    <div class="group-buy-list-header">
        <h2>Активные групповые покупки</h2>
        <!-- ko if: isLoggedIn -->
        <button class="btn btn-primary" data-bind="click: createNewGroupBuy">
            Создать групповую покупку
        </button>
        <!-- /ko -->
    </div>
    
    <!-- ko if: isLoading -->
    <div class="loading-overlay">
        <div class="spinner"></div>
    </div>
    <!-- /ko -->
    
    <!-- ko if: error -->
    <div class="error-message" data-bind="text: error"></div>
    <!-- /ko -->
    
    <!-- ko if: groupBuys().length > 0 -->
    <div class="group-buy-grid" data-bind="foreach: groupBuys">
        <div class="group-buy-card">
            <div class="product-image">
                <img data-bind="attr: { src: product.image, alt: product.name }">
            </div>
            
            <div class="product-info">
                <h3 data-bind="text: product.name"></h3>
                
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
                        <span class="value" data-bind="text: $parent.calculateSavings(product.price, group_price) + ' ₽'"></span>
                    </div>
                </div>
                
                <div class="group-progress">
                    <div class="progress-bar">
                        <div class="progress" data-bind="style: { width: (current_participants / min_participants * 100) + '%' }"></div>
                    </div>
                    <div class="progress-info">
                        <span data-bind="text: current_participants + '/' + min_participants + ' участников'"></span>
                        <span data-bind="text: $parent.formatTimeLeft(end_date)"></span>
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
                    <a class="btn btn-link" data-bind="attr: { href: '/group_buy/view/' + id }">
                        Подробнее
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- /ko -->
    
    <!-- ko if: groupBuys().length === 0 -->
    <div class="empty-state">
        <p>Нет активных групповых покупок</p>
        <!-- ko if: isLoggedIn -->
        <button class="btn btn-primary" data-bind="click: createNewGroupBuy">
            Создать первую групповую покупку
        </button>
        <!-- /ko -->
        <!-- ko ifnot: isLoggedIn -->
        <p>Войдите, чтобы создать групповую покупку</p>
        <a href="/auth/login" class="btn btn-primary">Войти</a>
        <!-- /ko -->
    </div>
    <!-- /ko -->
</div>

<script>
ko.components.register('group-buy-list', {
    viewModel: function(params) {
        var self = this;
        
        // Инициализация модели
        self.groupBuys = ko.observableArray([]);
        self.isLoading = ko.observable(false);
        self.error = ko.observable(null);
        self.isLoggedIn = ko.observable(params.isLoggedIn || false);
        
        // Загрузка данных при инициализации
        self.loadGroupBuys = function() {
            self.isLoading(true);
            self.error(null);
            
            $.ajax({
                url: '/api/group_buy/active',
                method: 'GET',
                success: function(response) {
                    if (response.success) {
                        self.groupBuys(response.data);
                    } else {
                        self.error(response.message);
                    }
                },
                error: function() {
                    self.error('Ошибка при загрузке списка групповых покупок');
                },
                complete: function() {
                    self.isLoading(false);
                }
            });
        };
        
        // Методы для работы с групповыми покупками
        self.joinGroup = function(groupId) {
            self.isLoading(true);
            self.error(null);
            
            $.ajax({
                url: '/api/group_buy/' + groupId + '/join',
                method: 'POST',
                success: function(response) {
                    if (response.success) {
                        self.loadGroupBuys();
                    } else {
                        self.error(response.message);
                    }
                },
                error: function() {
                    self.error('Ошибка при присоединении к групповой покупке');
                },
                complete: function() {
                    self.isLoading(false);
                }
            });
        };
        
        self.leaveGroup = function(groupId) {
            if (!confirm('Вы уверены, что хотите покинуть группу?')) return;
            
            self.isLoading(true);
            self.error(null);
            
            $.ajax({
                url: '/api/group_buy/' + groupId + '/leave',
                method: 'POST',
                success: function(response) {
                    if (response.success) {
                        self.loadGroupBuys();
                    } else {
                        self.error(response.message);
                    }
                },
                error: function() {
                    self.error('Ошибка при выходе из групповой покупки');
                },
                complete: function() {
                    self.isLoading(false);
                }
            });
        };
        
        self.createNewGroupBuy = function() {
            window.location.href = '/group_buy/create';
        };
        
        // Вспомогательные методы
        self.calculateSavings = function(regularPrice, groupPrice) {
            return regularPrice - groupPrice;
        };
        
        self.formatTimeLeft = function(endDate) {
            const end = new Date(endDate);
            const now = new Date();
            const diff = end - now;
            
            if (diff <= 0) return 'Завершено';
            
            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            
            return `${days}д ${hours}ч ${minutes}м`;
        };
        
        // Инициализация
        self.loadGroupBuys();
    },
    template: { element: 'group-buy-list-template' }
});
</script>

<style>
.group-buy-list-component {
    padding: 20px;
}

.group-buy-list-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.group-buy-list-header h2 {
    margin: 0;
    color: #333;
}

.group-buy-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
}

.group-buy-card {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: transform 0.2s ease;
}

.group-buy-card:hover {
    transform: translateY(-2px);
}

.product-image {
    width: 100%;
    height: 200px;
    overflow: hidden;
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.product-info {
    padding: 15px;
}

.product-info h3 {
    margin: 0 0 15px;
    font-size: 18px;
    color: #333;
}

.price-info {
    margin-bottom: 15px;
}

.price-info .label {
    color: #666;
    font-size: 14px;
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
    margin: 15px 0;
}

.progress-bar {
    height: 6px;
    background: #eee;
    border-radius: 3px;
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
    margin-top: 8px;
    font-size: 12px;
    color: #666;
}

.group-actions {
    display: flex;
    gap: 10px;
    margin-top: 15px;
}

.group-actions .btn {
    flex: 1;
}

.empty-state {
    text-align: center;
    padding: 40px;
    background: #f5f5f5;
    border-radius: 8px;
}

.empty-state p {
    margin: 0 0 20px;
    color: #666;
}

.error-message {
    margin: 20px 0;
    padding: 10px;
    background: #ffebee;
    color: #c62828;
    border-radius: 4px;
}

.loading-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255,255,255,0.8);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
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
    .group-buy-list-header {
        flex-direction: column;
        gap: 15px;
        text-align: center;
    }
    
    .group-buy-grid {
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