<div class="group-buy-create-component">
    <div class="create-header">
        <h2>Создание групповой покупки</h2>
    </div>
    
    <form class="create-form" data-bind="submit: submitForm">
        <div class="form-group">
            <label for="product">Выберите товар</label>
            <select id="product" class="form-control" data-bind="options: availableProducts, optionsText: 'name', optionsValue: 'id', value: selectedProduct, event: { change: onProductChange }">
                <option value="">Выберите товар</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="min_participants">Минимальное количество участников</label>
            <input type="number" id="min_participants" class="form-control" data-bind="value: minParticipants, min: 2" min="2">
            <small class="form-text text-muted">Минимум 2 участника</small>
        </div>
        
        <div class="form-group">
            <label for="group_price">Групповая цена</label>
            <div class="input-group">
                <input type="number" id="group_price" class="form-control" data-bind="value: groupPrice, min: 0">
                <div class="input-group-append">
                    <span class="input-group-text">₽</span>
                </div>
            </div>
            <small class="form-text text-muted" data-bind="text: groupPriceHint"></small>
        </div>
        
        <div class="form-group">
            <label for="end_date">Дата окончания</label>
            <input type="datetime-local" id="end_date" class="form-control" data-bind="value: endDate, min: minEndDate">
            <small class="form-text text-muted">Минимум 24 часа с текущего момента</small>
        </div>
        
        <div class="form-group">
            <label for="description">Описание</label>
            <textarea id="description" class="form-control" rows="4" data-bind="value: description"></textarea>
        </div>
        
        <div class="form-actions">
            <button type="button" class="btn btn-secondary" data-bind="click: cancel">Отмена</button>
            <button type="submit" class="btn btn-primary" data-bind="disable: isLoading">
                <span data-bind="visible: !isLoading()">Создать</span>
                <span data-bind="visible: isLoading">
                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                    Создание...
                </span>
            </button>
        </div>
    </form>
    
    <!-- ko if: error -->
    <div class="error-message" data-bind="text: error"></div>
    <!-- /ko -->
</div>

<script>
ko.components.register('group-buy-create', {
    viewModel: function(params) {
        var self = this;
        
        // Инициализация модели
        self.availableProducts = ko.observableArray([]);
        self.selectedProduct = ko.observable(null);
        self.minParticipants = ko.observable(2);
        self.groupPrice = ko.observable(0);
        self.endDate = ko.observable('');
        self.description = ko.observable('');
        self.isLoading = ko.observable(false);
        self.error = ko.observable(null);
        
        // Вычисляемые свойства
        self.minEndDate = ko.computed(function() {
            const now = new Date();
            now.setHours(now.getHours() + 24);
            return now.toISOString().slice(0, 16);
        });
        
        self.groupPriceHint = ko.computed(function() {
            if (!self.selectedProduct()) return '';
            const product = self.availableProducts().find(p => p.id === self.selectedProduct());
            if (!product) return '';
            
            const regularPrice = product.price;
            const currentPrice = self.groupPrice();
            
            if (currentPrice >= regularPrice) {
                return 'Групповая цена должна быть меньше обычной цены';
            }
            
            const savings = regularPrice - currentPrice;
            const savingsPercent = Math.round((savings / regularPrice) * 100);
            
            return `Экономия: ${savings} ₽ (${savingsPercent}%)`;
        });
        
        // Методы
        self.loadProducts = function() {
            self.isLoading(true);
            self.error(null);
            
            $.ajax({
                url: '/api/products/available',
                method: 'GET',
                success: function(response) {
                    if (response.success) {
                        self.availableProducts(response.data);
                    } else {
                        self.error(response.message);
                    }
                },
                error: function() {
                    self.error('Ошибка при загрузке списка товаров');
                },
                complete: function() {
                    self.isLoading(false);
                }
            });
        };
        
        self.onProductChange = function() {
            const product = self.availableProducts().find(p => p.id === self.selectedProduct());
            if (product) {
                self.groupPrice(Math.round(product.price * 0.9)); // 10% скидка по умолчанию
            }
        };
        
        self.submitForm = function() {
            if (!self.validateForm()) return;
            
            self.isLoading(true);
            self.error(null);
            
            const data = {
                product_id: self.selectedProduct(),
                min_participants: self.minParticipants(),
                group_price: self.groupPrice(),
                end_date: self.endDate(),
                description: self.description()
            };
            
            $.ajax({
                url: '/api/group_buy/create',
                method: 'POST',
                data: data,
                success: function(response) {
                    if (response.success) {
                        window.location.href = '/group_buy/view/' + response.data.id;
                    } else {
                        self.error(response.message);
                    }
                },
                error: function() {
                    self.error('Ошибка при создании групповой покупки');
                },
                complete: function() {
                    self.isLoading(false);
                }
            });
        };
        
        self.validateForm = function() {
            if (!self.selectedProduct()) {
                self.error('Выберите товар');
                return false;
            }
            
            if (self.minParticipants() < 2) {
                self.error('Минимальное количество участников - 2');
                return false;
            }
            
            const product = self.availableProducts().find(p => p.id === self.selectedProduct());
            if (self.groupPrice() >= product.price) {
                self.error('Групповая цена должна быть меньше обычной цены');
                return false;
            }
            
            if (!self.endDate()) {
                self.error('Укажите дату окончания');
                return false;
            }
            
            const endDate = new Date(self.endDate());
            const minDate = new Date(self.minEndDate());
            if (endDate < minDate) {
                self.error('Дата окончания должна быть не раньше чем через 24 часа');
                return false;
            }
            
            return true;
        };
        
        self.cancel = function() {
            window.location.href = '/group_buy/list';
        };
        
        // Инициализация
        self.loadProducts();
    },
    template: { element: 'group-buy-create-template' }
});
</script>

<style>
.group-buy-create-component {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
}

.create-header {
    margin-bottom: 30px;
    text-align: center;
}

.create-header h2 {
    margin: 0;
    color: #333;
}

.create-form {
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: #333;
    font-weight: 500;
}

.form-control {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.form-control:focus {
    border-color: #2196f3;
    outline: none;
    box-shadow: 0 0 0 2px rgba(33,150,243,0.2);
}

.form-text {
    display: block;
    margin-top: 4px;
    font-size: 12px;
}

.input-group {
    display: flex;
}

.input-group .form-control {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

.input-group-append {
    display: flex;
}

.input-group-text {
    padding: 8px 12px;
    background: #f5f5f5;
    border: 1px solid #ddd;
    border-left: none;
    border-radius: 0 4px 4px 0;
    color: #666;
}

.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 30px;
}

.error-message {
    margin-top: 20px;
    padding: 10px;
    background: #ffebee;
    color: #c62828;
    border-radius: 4px;
}

/* Мобильные стили */
@media (max-width: 768px) {
    .group-buy-create-component {
        padding: 15px;
    }
    
    .create-form {
        padding: 15px;
    }
    
    .form-actions {
        flex-direction: column;
    }
    
    .form-actions .btn {
        width: 100%;
    }
}
</style> 