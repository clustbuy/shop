// Логика страницы корзины (совместимость с Knockout)
document.addEventListener('DOMContentLoaded', function() {
    // console.log('=== Cart.js DOMContentLoaded ===');
    
    // Проверяем, что мы на странице корзины с Knockout
    const cartPage = document.querySelector('.cart-page');
    if (!cartPage) {
        // console.log('Not a cart page, skipping cart.js initialization');
        return;
    }
    
    // Проверяем, используется ли Knockout на странице (по наличию data-bind)
    const hasKnockout = cartPage.querySelector('[data-bind]');
    if (hasKnockout) {
        // console.log('Knockout detected, cart logic handled by cart-viewmodel.js');
        return;
    }
    
    // Старая логика для обратной совместимости (если Knockout не используется)
    // console.log('Using legacy cart.js logic');
    
    const cartItems = document.querySelectorAll('.cart-item');
    const clearCartBtn = document.getElementById('clearCartBtn');
    const checkoutBtn = document.getElementById('checkoutBtn');
    const applyPromoBtn = document.getElementById('applyPromoBtn');
    const promoInput = document.getElementById('promoInput');

    // Пересчет итогов
    function calculateTotals() {
        let itemsTotal = 0;
        let selectedCount = 0;

        cartItems.forEach(item => {
            const checkbox = item.querySelector('.item-checkbox');
            if (!checkbox.checked) return;

            const price = parseInt(item.getAttribute('data-price'));
            const quantity = parseInt(item.querySelector('.qty-input').value);

            itemsTotal += price * quantity;
            selectedCount += quantity;
        });

        // Обновляем UI
        document.getElementById('selectedCount').textContent = selectedCount;
        document.getElementById('itemsTotal').textContent = formatPrice(itemsTotal);

        // Расчет скидки (упрощенно - 10% от суммы)
        const discount = Math.floor(itemsTotal * 0.1);
        document.getElementById('discountTotal').textContent = `−${formatPrice(discount)}`;

        // Итого
        const grandTotal = itemsTotal - discount;
        document.getElementById('grandTotal').textContent = formatPrice(grandTotal);

        // Обновляем счетчик в шапке
        updateHeaderCartCount();
    }

    function formatPrice(price) {
        return price.toLocaleString('ru-RU') + ' ₽';
    }

    function updateHeaderCartCount() {
        const count = document.querySelectorAll('.cart-item').length;
        const cartCount = document.querySelector('.cart-count');
        if (cartCount) {
            cartCount.textContent = count;
            if (count === 0) {
                cartCount.style.display = 'none';
            }
        }
    }

    // Чекбоксы
    document.querySelectorAll('.item-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', calculateTotals);
    });

    // Управление количеством
    document.querySelectorAll('.qty-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const id = this.getAttribute('data-id');
            const input = document.querySelector(`.qty-input[data-id="${id}"]`);
            let value = parseInt(input.value);

            if (this.classList.contains('plus')) {
                value = Math.min(value + 1, 99);
            } else {
                value = Math.max(value - 1, 1);
            }

            input.value = value;
            calculateTotals();
        });
    });

    // Ручной ввод количества
    document.querySelectorAll('.qty-input').forEach(input => {
        input.addEventListener('change', function() {
            let value = parseInt(this.value);
            if (isNaN(value) || value < 1) value = 1;
            if (value > 99) value = 99;
            this.value = value;
            calculateTotals();
        });
    });

    // Удаление товара
    document.querySelectorAll('.remove-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const id = this.getAttribute('data-id');
            const item = document.querySelector(`.cart-item[data-id="${id}"]`);
            const title = item.querySelector('.item-title').textContent;

            // Анимация удаления
            item.style.opacity = '0';
            item.style.transform = 'translateX(-20px)';

            setTimeout(() => {
                item.remove();
                calculateTotals();
                checkEmptyCart();
                showNotification(`"${title.substring(0, 30)}..." удален из корзины`);
            }, 300);
        });
    });

    // Добавление в избранное
    document.querySelectorAll('.favorite-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const id = this.getAttribute('data-id');
            const item = document.querySelector(`.cart-item[data-id="${id}"]`);
            const title = item.querySelector('.item-title').textContent;

            // Визуальная обратная связь
            this.innerHTML = `
        <svg width="18" height="18" viewBox="0 0 24 24" fill="#ff0080" stroke="#ff0080" stroke-width="2">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
        Добавлено
      `;
            this.disabled = true;

            showNotification(`"${title.substring(0, 30)}..." добавлен в избранное`);
        });
    });

    // Очистить корзину
    if (clearCartBtn) {
        clearCartBtn.addEventListener('click', function() {
            if (cartItems.length === 0) return;


                cartItems.forEach((item, index) => {
                    setTimeout(() => {
                        item.style.opacity = '0';
                        item.style.transform = 'translateX(-20px)';

                        setTimeout(() => {
                            item.remove();
                            if (index === cartItems.length - 1) {
                                calculateTotals();
                                checkEmptyCart();
                                showNotification('Корзина очищена');
                            }
                        }, 300);
                    }, index * 50);
                });

        });
    }

    // Оформление заказа
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', function() {
            const selectedCount = parseInt(document.getElementById('selectedCount').textContent);

            if (selectedCount === 0) {
                showNotification('Выберите товары для оформления заказа', 'error');
                return;
            }

            showNotification('Переход к оформлению заказа...');
            setTimeout(() => {
                // window.location.href = '/checkout';
                // console.log('Переход к оформлению заказа');
            }, 1000);
        });
    }

    // Применить промокод
    if (applyPromoBtn && promoInput) {
        applyPromoBtn.addEventListener('click', function() {
            const code = promoInput.value.trim().toUpperCase();

            if (!code) {
                showNotification('Введите промокод', 'error');
                return;
            }

            // Симуляция проверки промокода
            const validCodes = ['OZON2024', 'SALE10', 'WELCOME'];

            if (validCodes.includes(code)) {
                showNotification(`Промокод "${code}" успешно применен!`, 'success');
                promoInput.value = '';
                // Здесь можно добавить дополнительную скидку
            } else {
                showNotification('Промокод недействителен', 'error');
            }
        });
    }

    // Проверка пустой корзины
    function checkEmptyCart() {
        const remainingItems = document.querySelectorAll('.cart-item');

        if (remainingItems.length === 0) {
            const container = document.querySelector('.cart-container');
            container.innerHTML = `
        <div class="empty-cart" style="grid-column: 1 / -1;">
          <svg width="120" height="120" viewBox="0 0 24 24" fill="none" stroke="#cccccc" stroke-width="1">
            <circle cx="9" cy="21" r="1"/>
            <circle cx="20" cy="21" r="1"/>
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
          </svg>
          <h3>Корзина пуста</h3>
          <p>Добавьте товары, чтобы сделать заказ</p>
          <a href="/" class="btn btn-primary">Перейти к покупкам</a>
        </div>
      `;

            clearCartBtn.style.display = 'none';
        }
    }

    // Уведомления
    function showNotification(message, type = 'info') {
        const colors = {
            info: '#0d0d0d',
            success: '#00a859',
            error: '#ff1744'
        };

        const notification = document.createElement('div');
        notification.className = 'notification';
        notification.textContent = message;
        notification.style.cssText = `
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: ${colors[type]};
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

    // Стили анимации
    const style = document.createElement('style');
    style.textContent = `
    .cart-item {
      transition: opacity 0.3s, transform 0.3s;
    }
    
    @keyframes slideInUp {
      from {
        transform: translateY(100%);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }
    
    @keyframes slideOutDown {
      from {
        transform: translateY(0);
        opacity: 1;
      }
      to {
        transform: translateY(100%);
        opacity: 0;
      }
    }
  `;
    document.head.appendChild(style);

    // Инициализация
    calculateTotals();
});
