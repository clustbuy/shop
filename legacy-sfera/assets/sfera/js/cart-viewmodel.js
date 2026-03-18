/**
 * Cart ViewModel using KnockoutJS
 * Управление корзиной с использованием MVVM паттерна
 */

// console.log('=== Cart ViewModel Loading ===');

// Функция для форматирования чисел с пробелами
function numberWithSpaces(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
}

// Модель товара в корзине
function CartItem(data) {
    var self = this;
    
    // console.log('Creating CartItem:', data);
    
    // Основные данные товара
    self.id = ko.observable(data.id || '');
    self.product_id = ko.observable(data.product_id || data.id || '');
    self.name = ko.observable(data.name || data.title || '');
    self.price = ko.observable(parseFloat(data.price) || parseFloat(data.cost) || 0);
    self.old_price = ko.observable(parseFloat(data.old_price) || 0);
    self.image = ko.observable(data.image || data.img_url || data.picture || '');
    self.product_amount = ko.observable(parseInt(data.product_amount) || 1);
    self.max_quantity = ko.observable(parseInt(data.max_quantity) || parseInt(data.quantity) || 99);
    
    // Дополнительные данные
    self.selected = ko.observable(data.selected !== undefined ? data.selected : true);
    self.inFavorites = ko.observable(data.inFavorites || false); // Флаг "в избранном"
    
    // Вычисляемое - стоимость позиции
    self.total = ko.computed(function() {
        var result = self.price() * self.product_amount();
        // console.log('CartItem total computed:', self.id(), result);
        return result;
    });
    
    // Вычисляемое - есть ли скидка
    self.hasDiscount = ko.computed(function() {
        return self.old_price() > 0 && self.old_price() > self.price();
    });
    
    // Форматированная цена
    self.formattedPrice = ko.computed(function() {
        return numberWithSpaces(self.price()) + ' ₽';
    });
    
    // Форматированная старая цена
    self.formattedOldPrice = ko.computed(function() {
        return numberWithSpaces(self.old_price()) + ' ₽';
    });
    
    // Форматированная итоговая стоимость
    self.formattedTotal = ko.computed(function() {
        return numberWithSpaces(self.total()) + ' ₽';
    });
    
    // Форматированное количество (для checkout)
    self.formattedQuantity = ko.computed(function() {
        var qty = self.product_amount();
        return qty + ' шт.';
    });
    
    // URL страницы товара
    self.productUrl = ko.computed(function() {
        return '/product/' + self.id() + '/';
    });

    /*
    console.log('CartItem created:', {
        id: self.id(),
        name: self.name(),
        price: self.price(),
        amount: self.product_amount()
    });
    */
}

// Главная ViewModel корзины
function CartViewModel() {
    var self = this;
    
    // console.log('=== Initializing CartViewModel ===');
    
    // Массив товаров в корзине
    self.items = ko.observableArray([]);
    
    // Промокод
    self.promoCode = ko.observable('');
    self.promoDiscount = ko.observable(0);
    self.promoCodeApplied = ko.observable(false);
    self.promoMessage = ko.observable('');
    
    // Вычисляемое - количество выбранных товаров
    self.selectedCount = ko.computed(function() {
        var count = 0;
        ko.utils.arrayForEach(self.items(), function(item) {
            if (item.selected()) {
                count += Number(item.product_amount());
            }
        });
        // console.log('Selected count computed:', count);
        return count;
    });
    
    // Вычисляемое - сумма выбранных товаров
    self.itemsTotal = ko.computed(function() {
        var total = 0;
        ko.utils.arrayForEach(self.items(), function(item) {
            if (item.selected()) {
                total += item.total();
            }
        });
        // console.log('Items total computed:', total);
        return total;
    });
    
    // Вычисляемое - скидка
    self.discountTotal = ko.computed(function() {
        var discount = 0;
        ko.utils.arrayForEach(self.items(), function(item) {
            if (item.selected() && item.hasDiscount()) {
                discount += (item.old_price() - item.price()) * item.product_amount();
            }
        });
        discount += self.promoDiscount();
        // console.log('Discount total computed:', discount);
        return discount;
    });
    
    // Цена доставки (для checkout)
    self.deliveryPrice = ko.observable(0);
    self.deliveryMethod = ko.observable('pickup');
    
    // Вычисляемое - итого к оплате (с учетом доставки и скидки)
    self.grandTotal = ko.computed(function() {
        var total = self.itemsTotal() - self.discountTotal() + self.deliveryPrice();
        var result = total < 0 ? 0 : total;
        console.log('Grand total computed:', result, '(items:', self.itemsTotal(), ', discount:', self.discountTotal(), ', delivery:', self.deliveryPrice(), ')');
        return result;
    });
    
    // Форматированные значения
    self.formattedItemsTotal = ko.computed(function() {
        return numberWithSpaces(self.itemsTotal()) + ' ₽';
    });
    
    self.formattedDiscountTotal = ko.computed(function() {
        var discount = self.discountTotal();
        return discount > 0 ? '−' + numberWithSpaces(discount) + ' ₽' : '0 ₽';
    });
    
    self.formattedGrandTotal = ko.computed(function() {
        return numberWithSpaces(self.grandTotal()) + ' ₽';
    });
    
    // Форматированная цена доставки
    self.formattedDeliveryPrice = ko.computed(function() {
        var price = self.deliveryPrice();
        return price > 0 ? numberWithSpaces(price) + ' ₽' : 'Бесплатно';
    });
    
    // Форматированное количество товаров (для checkout)
    self.formattedItemsCount = ko.computed(function() {
        return '(' + self.selectedCount() + ')';
    });
    
    // Проверка, можно ли оформить заказ
    self.canCheckout = ko.computed(function() {
        return self.items().length > 0;
    });
    
    // Загрузка корзины с сервера
    self.loadCart = function(serverData) {
        console.log('=== Loading cart ===');
        
        var data = serverData || (typeof server_cart !== 'undefined' ? server_cart.data : null);
        
        if (data) {
            console.log('Using provided cart data:', data);
            
            if (data && data.items) {
                var cartItems = [];
                for (var key in data.items) {
                    if (data.items.hasOwnProperty(key)) {
                        var item = data.items[key];
                        item.id = key;
                        cartItems.push(new CartItem(item));
                    }
                }
                self.items(cartItems);
                console.log('Cart loaded from server data, items count:', cartItems.length);
            } else {
                console.log('No items in cart data');
                self.items([]);
            }
            
            // Загружаем промокод если есть
            if (data && data.promocode) {
                self.promoCode(data.promocode);
            }
            
            // Загружаем скидку если есть
            if (data && data.cart_discount) {
                var discount = parseFloat(data.cart_discount) || 0;
                self.promoDiscount(discount);
                self.promoCodeApplied(discount > 0);
            } else {
                self.promoDiscount(0);
                self.promoCodeApplied(false);
            }
        } else {
            // Fallback: загрузка через AJAX если server_cart не доступен
            console.log('No server_cart data, loading via AJAX');
            
            fetch('/cart/?task=get_cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(function(response) {
                console.log('Cart response status:', response.status);
                return response.json();
            })
            .then(function(data) {
                console.log('Cart data received via AJAX:', data);
                self.loadCart(data);
            })
            .catch(function(error) {
                console.error('Error loading cart via AJAX:', error);
            });
        }
    };
    
    // Добавление товара в корзину
    self.addItem = function(productData) {
        console.log('=== Adding item to cart ===', productData);
        
        var itemData = {
            guid: productData.id || productData.product_id,
            product_amount: productData.quantity || 1
        };
        
        fetch('/cart/?task=put_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'item=' + encodeURIComponent(JSON.stringify(itemData))
        })
        .then(function(response) {
            console.log('Add item response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            console.log('Item added, cart data:', data);
            // Обновляем корзину из ответа сервера
            self.loadCart(data);
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error adding item:', error);
        });
    };
    
    // Удаление товара из корзины
    self.removeItem = function(item) {
        console.log('=== Removing item from cart ===', item.id());
        
        fetch('/cart/?task=delete_product', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'guid=' + encodeURIComponent(item.id())
        })
        .then(function(response) {
            console.log('Remove item response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            console.log('Item removed, cart data:', data);
            // Обновляем корзину из ответа сервера
            self.loadCart(data);
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error removing item:', error);
        });
    };
    
    // Добавление товара в избранное из корзины
    self.addToFavorites = function(item) {
        console.log('=== Adding item to favorites from cart ===', item.id());
        
        const productId = item.id();
        
        fetch('/favorites/?task=add_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'product_id=' + encodeURIComponent(productId)
        })
        .then(function(response) {
            console.log('Add to favorites response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            console.log('Item added to favorites, response:', data);
            
            // Обновляем флаг inFavorites для этого товара
            item.inFavorites(true);
            
            // Обновляем счетчик избранного
            if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
                console.log('Updating favorites counter via ViewModel');
                favoritesCounterViewModel.updateCount(data);
            } else {
                console.log('FavoritesCounterViewModel not available yet');
            }
            
            // Показываем уведомление
            showCartNotification('Товар добавлен в избранное');
        })
        .catch(function(error) {
            console.error('Error adding to favorites:', error);
            showCartNotification('Ошибка при добавлении в избранное', 'error');
        });
    };
    
    // Обновление количества товара
    self.updateAmount = function(item) {
        console.log('=== Updating item amount ===', item.id(), item.product_amount());
        
        // Убеждаемся, что количество - это число
        var amount = parseInt(item.product_amount()) || 1;
        var maxAmount = parseInt(item.max_quantity()) || 99;
        
        // Проверяем минимальное значение
        if (amount < 1) {
            amount = 1;
        }
        
        // Проверяем максимальное значение
        if (amount > maxAmount) {
            amount = maxAmount;
            showCartNotification('Максимальное количество товара: ' + maxAmount, 'info');
        }
        
        item.product_amount(amount);
        
        fetch('/cart/?task=update_amount', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'guid=' + encodeURIComponent(item.id()) + '&amount=' + encodeURIComponent(amount)
        })
        .then(function(response) {
            console.log('Update amount response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            console.log('Amount updated, cart data:', data);
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error updating amount:', error);
        });
    };
    
    // Увеличение количества
    self.increaseAmount = function(item) {
        console.log('Increasing amount for item:', item.id());
        var currentAmount = parseInt(item.product_amount()) || 1;
        var maxAmount = parseInt(item.max_quantity()) || 99;
        
        if (currentAmount < maxAmount) {
            var newAmount = currentAmount + 1;
            // Проверяем, не превышает ли новое значение максимум
            if (newAmount > maxAmount) {
                newAmount = maxAmount;
            }
            item.product_amount(newAmount);
            self.updateAmount(item);
        } else {
            console.log('Max quantity reached:', maxAmount);
            // Показываем уведомление, если достигнут максимум
            showCartNotification('Достигнуто максимальное количество товара: ' + maxAmount, 'info');
        }
    };
    
    // Уменьшение количества
    self.decreaseAmount = function(item) {
        console.log('Decreasing amount for item:', item.id());
        var currentAmount = parseInt(item.product_amount()) || 1;
        
        if (currentAmount > 1) {
            item.product_amount(currentAmount - 1);
            self.updateAmount(item);
        } else {
            console.log('Minimum quantity is 1');
        }
    };
    
    // Очистка корзины
    self.clearCart = function() {
        console.log('=== Clearing cart ===');
        

        fetch('/cart/?task=clear_cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(function(response) {
            console.log('Clear cart response status:', response.status);
            return response.json();
        })
        .then(function(data) {
            console.log('Cart cleared, data:', data);
            // Обновляем корзину из ответа сервера
            self.loadCart(data);
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error clearing cart:', error);
        });
    };
    
    // Применение промокода
    self.applyPromoCode = function() {
        console.log('=== Applying promo code ===', self.promoCode());
        
        var promoCode = self.promoCode().trim();
        if (!promoCode) {
            self.promoMessage('Введите промокод');
            setTimeout(function() {
                self.promoMessage('');
            }, 3000);
            return;
        }
        
        // Отправляем промокод на сервер
        fetch('/cart/?task=save_promocode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'promocode=' + encodeURIComponent(promoCode) + '&discount=0'
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Promo code response:', data);
            
            // Пересчитываем корзину для получения актуальных данных
            return fetch('/cart/?task=get_cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'task=get_cart'
            });
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Cart recalculated after promo code:', data);
            
            // Обновляем данные корзины
            self.loadCart(data);
            
            // Проверяем, применилась ли скидка
            if (data.cart_discount && parseFloat(data.cart_discount) > 0) {
                self.promoCodeApplied(true);
                self.promoMessage('Промокод применен успешно!');
                setTimeout(function() {
                    self.promoMessage('');
                }, 3000);
            } else {
                self.promoCodeApplied(false);
                self.promoMessage('Промокод не найден или недействителен');
                setTimeout(function() {
                    self.promoMessage('');
                }, 3000);
            }
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error applying promo code:', error);
            self.promoMessage('Ошибка при применении промокода');
            setTimeout(function() {
                self.promoMessage('');
            }, 3000);
        });
    };
    
    // Удаление промокода
    self.removePromoCode = function() {
        console.log('=== Removing promo code ===');
        self.promoCode('');
        
        // Отправляем запрос на удаление промокода
        fetch('/cart/?task=del_promocode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'task=del_promocode'
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Promo code removed, cart data:', data);
            // Пересчитываем корзину
            return fetch('/cart/?task=get_cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'task=get_cart'
            });
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Cart recalculated after removing promo code:', data);
            self.loadCart(data);
            self.promoCodeApplied(false);
            self.promoMessage('');
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error removing promo code:', error);
        });
    };
    
    // Обновление цены доставки (для checkout)
    self.updateDeliveryPrice = function(method) {
        console.log('=== Updating delivery price ===', method);
        self.deliveryMethod(method);
        
        if (method === 'pickup') {
            self.deliveryPrice(0);
        } else if (method === 'courier') {
            self.deliveryPrice(200);
        } else if (method === 'express') {
            self.deliveryPrice(500);
        }
    };
    
    // Удаление промокода
    self.removePromoCode = function() {
        console.log('=== Removing promo code ===');
        self.promoCode('');
        
        // Отправляем запрос на удаление промокода
        fetch('/cart/?task=del_promocode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'task=del_promocode'
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Promo code removed, cart data:', data);
            // Пересчитываем корзину
            return fetch('/cart/?task=get_cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'task=get_cart'
            });
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Cart recalculated after removing promo code:', data);
            self.loadCart(data);
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error removing promo code:', error);
        });
    };
    
    // Обновление цены доставки (для checkout)
    self.updateDeliveryPrice = function(method) {
        console.log('=== Updating delivery price ===', method);
        self.deliveryMethod(method);
        
        if (method === 'pickup') {
            self.deliveryPrice(0);
        } else if (method === 'courier') {
            self.deliveryPrice(200);
        } else if (method === 'express') {
            self.deliveryPrice(500);
        }
    };
    
    // Переход к оформлению
    self.checkout = function() {
        console.log('=== Proceeding to checkout ===');
        window.location.href = '/checkout/';
    };
    
    // Метод для обновления данных корзины (при переходе на вкладку)
    self.refreshCart = function() {
        console.log('=== Refreshing cart data from server ===');
        
        fetch('/cart/?task=get_cart', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log('Cart refreshed:', data);
            self.loadCart(data);
            
            // Обновляем глобальный счетчик
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
        })
        .catch(function(error) {
            console.error('Error refreshing cart:', error);
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
    
    // Получить полное состояние корзины в удобном формате для отладки
    self.getCartState = function() {
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
                product_amount: item.product_amount(),
                max_quantity: item.max_quantity(),
                total: item.total(),
                image: item.image(),
                selected: item.selected(),
                inFavorites: item.inFavorites(),
                formattedPrice: item.formattedPrice(),
                formattedTotal: item.formattedTotal()
            });
        }
        
        return {
            items: itemsData,
            itemsCount: items.length,
            selectedCount: self.selectedCount(),
            itemsTotal: self.itemsTotal(),
            discountTotal: self.discountTotal(),
            promoCode: self.promoCode(),
            promoDiscount: self.promoDiscount(),
            promoCodeApplied: self.promoCodeApplied(),
            deliveryPrice: self.deliveryPrice(),
            deliveryMethod: self.deliveryMethod(),
            grandTotal: self.grandTotal(),
            formattedItemsTotal: self.formattedItemsTotal(),
            formattedGrandTotal: self.formattedGrandTotal()
        };
    };
    
    // Вывести информацию о корзине в консоль
    self.debugInfo = function() {
        console.log('=== CART DEBUG INFO ===');
        console.log('Items count:', self.items().length);
        console.log('Selected count:', self.selectedCount());
        console.log('Items total:', self.itemsTotal(), '₽');
        console.log('Discount total:', self.discountTotal(), '₽');
        console.log('Promo code:', self.promoCode() || '(not set)');
        console.log('Promo discount:', self.promoDiscount(), '₽');
        console.log('Delivery price:', self.deliveryPrice(), '₽');
        console.log('Grand total:', self.grandTotal(), '₽');
        console.log('');
        console.log('Items:');
        var items = self.items();
        for (var i = 0; i < items.length; i++) {
            var item = items[i];
            console.log('  [' + i + ']', {
                id: item.id(),
                name: item.name(),
                price: item.price() + ' ₽',
                amount: item.product_amount(),
                total: item.total() + ' ₽',
                max_quantity: item.max_quantity(),
                selected: item.selected()
            });
        }
        console.log('=== END CART DEBUG INFO ===');
        return self.getCartState();
    };
    
    // Получить товар по ID с подробной информацией
    self.debugItem = function(productId) {
        var item = self.getItemById(productId);
        if (!item) {
            console.log('Item not found with ID:', productId);
            console.log('Available IDs:', self.items().map(function(i) { return i.id(); }));
            return null;
        }
        
        console.log('=== ITEM DEBUG INFO ===');
        console.log('ID:', item.id());
        console.log('Product ID:', item.product_id());
        console.log('Name:', item.name());
        console.log('Price:', item.price(), '₽');
        console.log('Old Price:', item.old_price(), '₽');
        console.log('Amount:', item.product_amount());
        console.log('Max Quantity:', item.max_quantity());
        console.log('Total:', item.total(), '₽');
        console.log('Image:', item.image());
        console.log('Selected:', item.selected());
        console.log('In Favorites:', item.inFavorites());
        console.log('Formatted Price:', item.formattedPrice());
        console.log('Formatted Total:', item.formattedTotal());
        console.log('Product URL:', item.productUrl());
        console.log('Has Discount:', item.hasDiscount());
        console.log('=== END ITEM DEBUG INFO ===');
        
        return {
            id: item.id(),
            product_id: item.product_id(),
            name: item.name(),
            price: item.price(),
            old_price: item.old_price(),
            product_amount: item.product_amount(),
            max_quantity: item.max_quantity(),
            total: item.total(),
            image: item.image(),
            selected: item.selected(),
            inFavorites: item.inFavorites(),
            formattedPrice: item.formattedPrice(),
            formattedTotal: item.formattedTotal(),
            productUrl: item.productUrl(),
            hasDiscount: item.hasDiscount()
        };
    };
    
    // Инициализация - загрузка корзины из server_cart.data
    console.log('CartViewModel initialized');
    
    // Проверяем наличие server_cart.data
    if (typeof server_cart !== 'undefined' && server_cart.data) {
        console.log('Using server_cart.data for initialization');
        self.loadCart(server_cart.data);
    } else {
        console.log('server_cart.data not found, will load via AJAX');
        self.loadCart();
    }
}

// Функция показа уведомлений на странице корзины
function showCartNotification(message, type) {
    type = type || 'success';
    
    const notification = document.createElement('div');
    notification.className = 'cart-notification';
    notification.textContent = message;
    
    let bgColor = '#00a859'; // success по умолчанию
    if (type === 'error') {
        bgColor = '#ff1744';
    } else if (type === 'info') {
        bgColor = '#0078d4';
    }
    
    notification.style.cssText = 
        'position: fixed;' +
        'bottom: 20px;' +
        'right: 20px;' +
        'background: ' + bgColor + ';' +
        'color: white;' +
        'padding: 16px 24px;' +
        'border-radius: 8px;' +
        'box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);' +
        'z-index: 10000;' +
        'max-width: 400px;' +
        'animation: slideInUp 0.3s ease-out;';
    
    document.body.appendChild(notification);
    
    setTimeout(function() {
        notification.style.animation = 'slideOutDown 0.3s ease-out';
        setTimeout(function() {
            notification.remove();
        }, 300);
    }, 3000);
}

// Глобальная переменная для доступа к ViewModel
// Создаем ViewModel глобально для доступа из консоли на любой странице
var cartViewModel = null;

// Инициализация ViewModel (создается всегда для доступа из консоли)
// Используем немедленное выполнение для синхронной инициализации
(function() {
    console.log('=== Initializing Cart ViewModel (Global) ===');
    try {
        cartViewModel = new CartViewModel();
        
        // Делаем доступным через window для удобной отладки
        window.cartViewModel = cartViewModel;
        window.cart = cartViewModel; // Короткий алиас для удобства
        
        // Также делаем доступным как глобальную переменную (без var)
        // Это нужно для доступа из консоли в некоторых браузерах
        if (typeof window !== 'undefined') {
            // Уже установлено через window.cart
        }
        
        console.log('Cart ViewModel доступен через:');
        console.log('  - cartViewModel');
        console.log('  - window.cartViewModel');
        console.log('  - cart');
        console.log('  - window.cart');
        console.log('');
        console.log('Методы для отладки:');
        console.log('  - cart.debugInfo() - вывести полную информацию о корзине');
        console.log('  - cart.getCartState() - получить состояние корзины как объект');
        console.log('  - cart.getItemById(id) - получить товар по ID');
        console.log('  - cart.debugItem(id) - вывести подробную информацию о товаре');
        console.log('  - cart.items() - получить массив товаров');
        console.log('  - cart.itemsTotal() - получить сумму товаров');
        console.log('  - cart.grandTotal() - получить итоговую сумму');
        console.log('');
        console.log('Проверка доступности:');
        console.log('  cart:', typeof window.cart !== 'undefined' ? '✓ доступен' : '✗ недоступен');
        console.log('  cartViewModel:', typeof window.cartViewModel !== 'undefined' ? '✓ доступен' : '✗ недоступен');
    } catch (error) {
        console.error('Ошибка при инициализации CartViewModel:', error);
    }
})();

// Инициализация при загрузке страницы (для применения bindings)
document.addEventListener('DOMContentLoaded', function() {
    console.log('=== DOM Content Loaded - Applying Cart Bindings ===');
    
    // Проверяем, что мы на странице корзины или checkout
    var cartPage = document.querySelector('.cart-page');
    var checkoutSidebar = document.querySelector('.checkout-sidebar');
    var orderSummary = document.querySelector('.order-summary');
    
    // ViewModel уже создан глобально, просто применяем bindings
    
    // Применяем bindings к странице корзины
    if (cartPage) {
        console.log('Cart page detected, applying bindings');
        ko.applyBindings(cartViewModel, cartPage);
        console.log('Knockout bindings applied to cart page');
    }
    
    // Применяем bindings к блоку order-summary на странице checkout
    if (orderSummary) {
        console.log('Order summary detected on checkout page, applying bindings');
        ko.applyBindings(cartViewModel, orderSummary);
        console.log('Knockout bindings applied to order-summary');
    }
    
    // Если ViewModel создан, настраиваем обновление данных
    if (cartViewModel && (cartPage || orderSummary)) {
        // Обновление данных при переходе на вкладку (visibilitychange)
        document.addEventListener('visibilitychange', function() {
            if (!document.hidden && cartViewModel) {
                console.log('=== Tab became visible, refreshing cart data ===');
                cartViewModel.refreshCart();
            }
        });
        
        // Дополнительно: обновление при клике на странице
        var clickRefreshEnabled = false;
        document.addEventListener('click', function(e) {
            // Обновляем только если клик не на элементах управления корзиной
            if (clickRefreshEnabled && cartViewModel && 
                !e.target.closest('.qty-btn') && 
                !e.target.closest('.btn-remove') &&
                !e.target.closest('.btn') &&
                !e.target.closest('.checkout-btn')) {
                console.log('=== Page clicked, refreshing cart data ===');
                cartViewModel.refreshCart();
                clickRefreshEnabled = false; // Отключаем до следующего скрытия вкладки
            }
        });
        
        // Включаем обновление по клику после возврата на вкладку
        document.addEventListener('visibilitychange', function() {
            if (document.hidden) {
                clickRefreshEnabled = true;
            }
        });
    } else if (!cartPage && !orderSummary) {
        console.log('Not a cart or checkout page, but cartViewModel is still available globally for debugging');
        console.log('Use cart.debugInfo() or cart.getCartState() in console to inspect cart state');
    }
});

console.log('=== Cart ViewModel Script Loaded ===');

// Дополнительная проверка доступности после загрузки
if (typeof window.cart === 'undefined') {
    console.warn('⚠ cart не доступен через window.cart, пытаемся восстановить...');
    if (cartViewModel) {
        window.cart = cartViewModel;
        window.cartViewModel = cartViewModel;
        console.log('✓ cart восстановлен');
    }
} else {
    console.log('✓ cart доступен через window.cart');
}

// Экспортируем в глобальную область видимости для доступа из консоли
// Это гарантирует доступность даже если скрипт загружается асинхронно
if (typeof window !== 'undefined' && cartViewModel) {
    // Уже установлено выше, но делаем еще раз для надежности
    window.cart = cartViewModel;
    window.cartViewModel = cartViewModel;
}

