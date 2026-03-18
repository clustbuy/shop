/**
 * Favorites ViewModel using KnockoutJS
 * Управление избранным с использованием MVVM паттерна
 */

// console.log('=== Favorites ViewModel Loading ===');

// Функция для форматирования чисел с пробелами
function numberWithSpaces(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

// Модель товара в избранном
function FavoriteItem(data) {
    var self = this;
    
    // console.log('Creating FavoriteItem:', data);
    
    // Основные данные товара
    self.id = ko.observable(data.id || '');
    self.product_id = ko.observable(data.product_id || data.id || '');
    self.name = ko.observable(data.name || '');
    self.price = ko.observable(parseFloat(data.price) || parseFloat(data.cost) || 0);
    self.old_price = ko.observable(parseFloat(data.old_price) || 0);
    self.image = ko.observable(data.image || data.img_url || data.picture || '');
    self.quantity = ko.observable(parseInt(data.quantity) || 99);
    self.currentQuantity = ko.observable(parseInt(data.currentQuantity) || parseInt(data.cartQuantity) || 1); // Текущее количество в корзине
    self.inCart = ko.observable(data.inCart || false); // Флаг "товар в корзине"
    
    // Дополнительные данные
    self.rating = ko.observable(parseFloat(data.rating) || 0);
    self.reviews_count = ko.observable(parseInt(data.reviews_count) || 0);
    self.badge = ko.observable(data.badge || '');
    
    // Вычисляемое - есть ли скидка
    self.hasDiscount = ko.computed(function() {
        return self.old_price() > 0 && self.old_price() > self.price();
    });
    
    // Вычисляемое - процент скидки
    self.discountPercent = ko.computed(function() {
        if (!self.hasDiscount()) return 0;
        var percent = Math.round((1 - self.price() / self.old_price()) * 100);
        // console.log('Discount percent computed for', self.id(), ':', percent);
        return percent;
    });
    
    // Форматированная цена
    self.formattedPrice = ko.computed(function() {
        return numberWithSpaces(self.price()) + ' ₽';
    });
    
    // Форматированная старая цена
    self.formattedOldPrice = ko.computed(function() {
        return numberWithSpaces(self.old_price()) + ' ₽';
    });
    
    // Форматированный процент скидки
    self.formattedDiscount = ko.computed(function() {
        return '-' + self.discountPercent() + '%';
    });
    
    /*
    console.log('FavoriteItem created:', {
        id: self.id(),
        name: self.name(),
        price: self.price()
    });
    */
}

// Главная ViewModel избранного
function FavoritesViewModel() {
    var self = this;
    
    // console.log('=== Initializing FavoritesViewModel ===');
    
    // Массив товаров в избранном
    self.items = ko.observableArray([]);
    
    // Вычисляемое - количество товаров
    self.itemsCount = ko.computed(function() {
        var count = self.items().length;
        // console.log('Items count computed:', count);
        return count;
    });
    
    // Вычисляемое - текст количества товаров
    self.itemsCountText = ko.computed(function() {
        var count = self.itemsCount();
        if (count === 0) return 'Нет товаров';
        if (count === 1) return '1 товар';
        if (count > 1 && count < 5) return count + ' товара';
        return count + ' товаров';
    });
    
    // Загрузка избранного
    self.loadFavorites = function(serverData) {
        // console.log('=== Loading favorites ===');
        
        var data = serverData || (typeof server_favorites !== 'undefined' ? server_favorites.data : null);
        
        if (data) {
            // console.log('Using provided favorites data:', data);
            
            if (data && data.items) {
                var favoriteItems = [];
                for (var key in data.items) {
                    if (data.items.hasOwnProperty(key)) {
                        var item = data.items[key];
                        item.id = key;
                        favoriteItems.push(new FavoriteItem(item));
                    }
                }
                self.items(favoriteItems);
                // console.log('Favorites loaded, items count:', favoriteItems.length);
            } else {
                // console.log('No items in favorites data');
                self.items([]);
            }
        } else {
            // Fallback: загрузка через AJAX
            // console.log('No server_favorites data, loading via AJAX');
            
            fetch('/favorites/?task=get_favorites', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(function(response) {
                // console.log('Favorites response status:', response.status);
                return response.json();
            })
            .then(function(data) {
                // console.log('Favorites data received via AJAX:', data);
                self.loadFavorites(data);
            })
            .catch(function(error) {
                console.error('Error loading favorites via AJAX:', error);
            });
        }
    };
    
    // Добавление товара в избранное
    self.addItem = function(productId) {
        // console.log('=== Adding item to favorites ===', productId);
        
        fetch('/favorites/?task=add_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'product_id=' + encodeURIComponent(productId)
        })
        .then(function(response) {
            // console.log('Add item response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            // console.log('Item added to favorites, response:', data);
            // Обновляем избранное из ответа сервера
            self.loadFavorites(data);
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error adding item to favorites:', error);
        });
    };
    
    // Удаление товара из избранного
    self.removeItem = function(item) {
        // console.log('=== Removing item from favorites ===', item.id());
        
        fetch('/favorites/?task=remove_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'product_id=' + encodeURIComponent(item.id())
        })
        .then(function(response) {
            // console.log('Remove item response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            // console.log('Item removed from favorites, response:', data);
            // Обновляем избранное из ответа сервера
            self.loadFavorites(data);
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error removing item from favorites:', error);
        });
    };
    
    // Очистка избранного
    self.clearFavorites = function() {
        // console.log('=== Clearing favorites ===');
        

        fetch('/favorites/?task=clear_favorites', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(function(response) {
            // console.log('Clear favorites response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            // console.log('Favorites cleared, data:', data);
            // Обновляем избранное из ответа сервера
            self.loadFavorites(data);
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error clearing favorites:', error);
        });
    };
    
    // Добавление в корзину из избранного
    self.addToCart = function(item, event) {
        // console.log('=== Adding to cart from favorites ===', item.id());
        
        const productId = item.id();
        const quantity = item.currentQuantity();
        
        // Формируем данные для отправки
        const cartItem = {
            guid: productId,
            product_amount: quantity
        };
        
        // console.log('Sending to cart:', cartItem);
        
        // AJAX запрос на добавление в корзину
        fetch('/cart/?task=put_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'item=' + encodeURIComponent(JSON.stringify(cartItem))
        })
        .then(response => response.json())
        .then(data => {
            // console.log('Item added to cart, response:', data);
            
            // Устанавливаем флаг "товар в корзине"
            item.inCart(true);
            
            // Обновляем счетчик корзины (передаём весь объект данных)
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                // console.log('Updating cart counter via ViewModel');
                cartCounterViewModel.updateCount(data);
            } else {
                // console.log('CartCounterViewModel not available yet');
            }
            
            // Показываем уведомление
            showNotification(`"${item.name()}" добавлен в корзину`);
        })
        .catch(error => {
            console.error('Error adding to cart:', error);
            showNotification('Ошибка при добавлении в корзину', 'error');
        });
    };
    
    // Увеличение количества
    self.increaseQuantity = function(item, event) {
        const currentQty = item.currentQuantity();
        const maxQty = item.quantity();
        
        if (currentQty < maxQty) {
            item.currentQuantity(currentQty + 1);
            self.updateCartQuantity(item);
        }
        
        event.stopPropagation();
        return false;
    };
    
    // Уменьшение количества
    self.decreaseQuantity = function(item, event) {
        const currentQty = item.currentQuantity();
        
        if (currentQty > 1) {
            item.currentQuantity(currentQty - 1);
            self.updateCartQuantity(item);
        }
        
        event.stopPropagation();
        return false;
    };
    
    // Обработка изменения количества вручную
    self.quantityChanged = function(item, event) {
        let value = parseInt(event.target.value) || 1;
        const maxQty = item.quantity();
        
        if (value < 1) value = 1;
        if (value > maxQty) value = maxQty;
        
        item.currentQuantity(value);
        event.target.value = value;
        
        self.updateCartQuantity(item);
        
        return true;
    };
    
    // Купить всё
    self.buyAll = function(item, event) {
        // console.log('=== Buy All clicked ===', item.id());
        
        const maxQty = item.quantity();
        item.currentQuantity(maxQty);
        
        // Если товар еще не в корзине, добавляем его
        if (!item.inCart()) {
            item.inCart(true);
        }
        
        // Обновляем корзину (устанавливаем максимальное количество)
        self.updateCartQuantity(item);
        
        showNotification(`Количество установлено: ${maxQty} шт.`);
        
        event.preventDefault();
        event.stopPropagation();
        return false;
    };
    
    // Обновление количества в корзине
    self.updateCartQuantity = function(item) {
        const productId = item.id();
        const quantity = item.currentQuantity();
        
        // console.log('Updating cart quantity:', productId, quantity);
        
        const cartItem = {
            guid: productId,
            product_amount: quantity
        };
        
        fetch('/cart/?task=update_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'item=' + encodeURIComponent(JSON.stringify(cartItem))
        })
        .then(response => response.json())
        .then(data => {
            // console.log('Cart quantity updated, response:', data);
            
            // Обновляем счетчик корзины
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(error => {
            console.error('Error updating cart quantity:', error);
        });
    };
    
    // Функция показа уведомлений
    function showNotification(message, type = 'success') {
        const notification = document.createElement('div');
        notification.className = 'notification notification-' + type;
        notification.textContent = message;
        notification.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: ${type === 'success' ? '#00a859' : '#ff1744'};
            color: white;
            padding: 16px 24px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            z-index: 10000;
            max-width: 400px;
            animation: slideInUp 0.3s ease-out;
        `;
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.style.animation = 'slideOutDown 0.3s ease-out';
            setTimeout(() => notification.remove(), 300);
        }, 3000);
    }
    
    // Метод для обновления данных избранного (при переходе на вкладку)
    self.refreshFavorites = function() {
        // console.log('=== Refreshing favorites data from server ===');
        
        fetch('/favorites/?task=get_favorites', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            // console.log('Favorites refreshed:', data);
            self.loadFavorites(data);
            
            // Обновляем глобальный счетчик
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                favoritesCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error refreshing favorites:', error);
        });
    };
    
    // ============================================
    // МЕТОДЫ ДЛЯ ОТЛАДКИ (DEBUG)
    // ============================================
    
    // Получить товар по ID
    self.getItemById = function(productId) {
        var items = self.items();
        for (var i = 0; i < items.length; i++) {
            if (items[i].id() == productId || items[i].product_id() == productId) {
                return items[i];
            }
        }
        return null;
    };
    
    // Получить полное состояние избранного в удобном формате для отладки
    self.getFavoritesState = function() {
        var items = self.items();
        var itemsData = [];
        
        for (var i = 0; i < items.length; i++) {
            var item = items[i];
            itemsData.push({
                id: item.id(),
                product_id: item.product_id(),
                name: item.name(),
                price: item.price(),
                old_price: item.old_price(),
                image: item.image(),
                formattedPrice: item.formattedPrice(),
                productUrl: item.productUrl()
            });
        }
        
        return {
            items: itemsData,
            itemsCount: items.length,
            itemsCountText: self.itemsCountText()
        };
    };
    
    // Вывести информацию об избранном в консоль
    self.debugInfo = function() {
        console.log('=== FAVORITES DEBUG INFO ===');
        console.log('Items count:', self.items().length);
        console.log('Items count text:', self.itemsCountText());
        console.log('');
        console.log('Items:');
        var items = self.items();
        for (var i = 0; i < items.length; i++) {
            var item = items[i];
            console.log('  [' + i + ']', {
                id: item.id(),
                name: item.name(),
                price: item.price() + ' ₽',
                image: item.image()
            });
        }
        console.log('=== END FAVORITES DEBUG INFO ===');
        return self.getFavoritesState();
    };
    
    // Получить товар по ID с подробной информацией
    self.debugItem = function(productId) {
        var item = self.getItemById(productId);
        if (!item) {
            console.log('Item not found in favorites with ID:', productId);
            console.log('Available IDs:', self.items().map(function(i) { return i.id(); }));
            return null;
        }
        
        console.log('=== FAVORITES ITEM DEBUG INFO ===');
        console.log('ID:', item.id());
        console.log('Product ID:', item.product_id());
        console.log('Name:', item.name());
        console.log('Price:', item.price(), '₽');
        console.log('Old Price:', item.old_price(), '₽');
        console.log('Image:', item.image());
        console.log('Formatted Price:', item.formattedPrice());
        console.log('Product URL:', item.productUrl());
        console.log('=== END FAVORITES ITEM DEBUG INFO ===');
        
        return {
            id: item.id(),
            product_id: item.product_id(),
            name: item.name(),
            price: item.price(),
            old_price: item.old_price(),
            image: item.image(),
            formattedPrice: item.formattedPrice(),
            productUrl: item.productUrl()
        };
    };
    
    // Инициализация - загрузка избранного из server_favorites.data
    console.log('FavoritesViewModel initialized');
    
    // Проверяем наличие server_favorites.data
    if (typeof server_favorites !== 'undefined' && server_favorites.data) {
        console.log('Using server_favorites.data for initialization');
        self.loadFavorites(server_favorites.data);
    } else {
        console.log('server_favorites.data not found, will load via AJAX');
        self.loadFavorites();
    }
}

// Глобальная переменная для доступа к ViewModel
// Создаем ViewModel глобально для доступа из консоли на любой странице
var favoritesViewModel = null;

// Инициализация ViewModel (создается всегда для доступа из консоли)
(function() {
    console.log('=== Initializing Favorites ViewModel (Global) ===');
    favoritesViewModel = new FavoritesViewModel();
    
    // Делаем доступным через window для удобной отладки
    window.favoritesViewModel = favoritesViewModel;
    window.favorites = favoritesViewModel; // Короткий алиас для удобства
    
    console.log('Favorites ViewModel доступен через:');
    console.log('  - favoritesViewModel');
    console.log('  - window.favoritesViewModel');
    console.log('  - favorites (короткий алиас)');
    console.log('');
    console.log('Методы для отладки:');
    console.log('  - favorites.debugInfo() - вывести полную информацию об избранном');
    console.log('  - favorites.getFavoritesState() - получить состояние избранного как объект');
    console.log('  - favorites.getItemById(id) - получить товар по ID');
    console.log('  - favorites.debugItem(id) - вывести подробную информацию о товаре');
    console.log('  - favorites.items() - получить массив товаров');
    console.log('  - favorites.itemsCount() - получить количество товаров');
})();

// Инициализация при загрузке страницы (для применения bindings)
document.addEventListener('DOMContentLoaded', function() {
    console.log('=== DOM Content Loaded - Applying Favorites Bindings ===');
    
    // Проверяем, что мы на странице избранного
    var favoritesPage = document.querySelector('.favorites-page');
    if (favoritesPage) {
        console.log('Favorites page detected, applying bindings');
        // ViewModel уже создан глобально, просто применяем bindings
        ko.applyBindings(favoritesViewModel, favoritesPage);
        console.log('Knockout bindings applied to favorites page');
        
        // Обновление данных при переходе на вкладку (visibilitychange)
        document.addEventListener('visibilitychange', function() {
            if (!document.hidden && favoritesViewModel) {
                console.log('=== Tab became visible, refreshing favorites data ===');
                favoritesViewModel.refreshFavorites();
            }
        });
        
        // Дополнительно: обновление при клике на странице
        var clickRefreshEnabled = false;
        document.addEventListener('click', function(e) {
            // Обновляем только если клик не на элементах управления
            if (clickRefreshEnabled && favoritesViewModel && 
                !e.target.closest('.remove-btn') && 
                !e.target.closest('.btn-add-to-cart') &&
                !e.target.closest('.qty-btn') &&
                !e.target.closest('.btn')) {
                console.log('=== Page clicked, refreshing favorites data ===');
                favoritesViewModel.refreshFavorites();
                clickRefreshEnabled = false; // Отключаем до следующего скрытия вкладки
            }
        });
        
        // Включаем обновление по клику после возврата на вкладку
        document.addEventListener('visibilitychange', function() {
            if (document.hidden) {
                clickRefreshEnabled = true;
            }
        });
    } else {
        console.log('Not a favorites page, but favoritesViewModel is still available globally for debugging');
        console.log('Use favorites.debugInfo() or favorites.getFavoritesState() in console to inspect favorites state');
    }
});

console.log('=== Favorites ViewModel Script Loaded ===');

