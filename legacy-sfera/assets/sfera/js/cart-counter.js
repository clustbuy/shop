/**
 * Global Cart Counter using KnockoutJS
 * Легкая модель для отображения счетчика корзины на всех страницах
 */

// console.log('=== Cart Counter Script Loading ===');

// Глобальная модель счетчика корзины
function CartCounterViewModel() {
    var self = this;
    
    // console.log('=== Initializing CartCounterViewModel ===');
    
    // Количество товаров в корзине
    self.itemCount = ko.observable(0);
    
    // Форматированное количество
    self.formattedCount = ko.computed(function() {
        var count = self.itemCount();
        // console.log('Cart counter computed:', count);
        return count > 0 ? count : '';
    });
    
    // Видимость счетчика
    self.isVisible = ko.computed(function() {
        return self.itemCount() > 0;
    });
    
    // Загрузка счетчика с сервера
    self.loadCount = function() {
        // console.log('=== Loading cart count from server ===');
        
        fetch('/cart/?task=get_cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'task=get_cart'
        })
        .then(function(response) {
            // console.log('Cart count response status:', response.status);
            // console.log('Cart count response headers:', response.headers.get('content-type'));
            
            // Проверяем, что ответ действительно JSON
            var contentType = response.headers.get('content-type');
            if (!contentType || !contentType.includes('application/json')) {
                // Если ответ не JSON, читаем как текст для отладки
                return response.text().then(function(text) {
                    console.error('Server returned non-JSON response:', text.substring(0, 200));
                    throw new Error('Server returned non-JSON response');
                });
            }
            
            return response.json();
        })
        .then(function(data) {
            // console.log('Cart count data received:', data);
            
            var count = 0;
            if (data && data.items && typeof data.items === 'object') {
                // Подсчитываем количество товаров
                for (var key in data.items) {
                    if (data.items.hasOwnProperty(key)) {
                        var item = data.items[key];
                        count += parseInt(item.product_amount) || 0;
                    }
                }
            } else if (data && data.total_cart_amount !== undefined) {
                count = parseInt(data.total_cart_amount) || 0;
            }
            
            // console.log('Setting cart count to:', count);
            self.itemCount(count);
        })
        .catch(function(error) {
            console.error('Error loading cart count:', error);
            // При ошибке устанавливаем 0, чтобы не показывать неверное значение
            self.itemCount(0);
        });
    };
    
    // Обновление счетчика (вызывается после добавления товара)
    self.updateCount = function(cartData) {
        // console.log('=== Updating cart count ===', cartData);
        
        if (cartData && cartData.total_cart_amount !== undefined) {
            self.itemCount(parseInt(cartData.total_cart_amount));
            // console.log('Cart count updated to:', cartData.total_cart_amount);
        } else {
            // Если данных нет, перезагружаем с сервера
            self.loadCount();
        }
    };
    
    // Инициализация - загрузка счетчика
    // console.log('CartCounterViewModel initialized, loading count...');
    self.loadCount();
}

// Глобальная переменная для доступа к счетчику корзины
var cartCounterViewModel = null;

// Инициализация при загрузке страницы
document.addEventListener('DOMContentLoaded', function() {
    // console.log('=== DOM Content Loaded - Initializing Cart Counter ===');
    
    // Создаем ViewModel
    cartCounterViewModel = new CartCounterViewModel();
    
    // Применяем bindings ко всем счетчикам корзины
    var cartBadges = document.querySelectorAll('.cart-counter, .mobile-cart-counter');
    // console.log('Found ' + cartBadges.length + ' cart counter elements');
    
    cartBadges.forEach(function(badge) {
        // Проверяем, не применены ли уже bindings
        if (ko.dataFor(badge) === undefined) {
            // console.log('Applying bindings to cart counter:', badge);
            ko.applyBindings(cartCounterViewModel, badge);
        } else {
            // console.log('Bindings already applied to cart counter, skipping:', badge);
        }
    });
    
    // if (cartBadges.length > 0) {
    //     console.log('Knockout bindings applied to all cart counters');
    // } else {
    //     console.log('No cart counter elements found');
    // }
    
    // Обновление счетчика при переходе на вкладку (visibilitychange)
    document.addEventListener('visibilitychange', function() {
        if (!document.hidden && cartCounterViewModel) {
            // console.log('=== Tab became visible, refreshing cart counter ===');
            cartCounterViewModel.loadCount();
        }
    });
    
    // Дополнительно: обновление при первом клике после возврата на вкладку
    var clickRefreshEnabled = false;
    document.addEventListener('click', function() {
        if (clickRefreshEnabled && cartCounterViewModel) {
            // console.log('=== Page clicked after tab switch, refreshing cart counter ===');
            cartCounterViewModel.loadCount();
            clickRefreshEnabled = false;
        }
    }, { once: false });
    
    // Включаем обновление по клику после скрытия вкладки
    document.addEventListener('visibilitychange', function() {
        if (document.hidden) {
            clickRefreshEnabled = true;
        }
    });
});

// console.log('=== Cart Counter Script Loaded ===');

