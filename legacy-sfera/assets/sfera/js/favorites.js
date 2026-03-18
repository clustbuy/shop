// Логика страницы избранного (совместимость с Knockout)
document.addEventListener('DOMContentLoaded', function() {
    // console.log('=== Favorites.js DOMContentLoaded ===');
    
    // Проверяем, что мы на странице избранного
    const favoritesPage = document.querySelector('.favorites-page');
    if (!favoritesPage) {
        // console.log('Not a favorites page, skipping favorites.js initialization');
        return;
    }
    
    // Проверяем, используется ли Knockout на странице (по наличию data-bind)
    const hasKnockout = favoritesPage.querySelector('[data-bind]');
    if (hasKnockout) {
        console.log('Knockout detected, favorites logic handled by favorites-viewmodel.js');
        return;
    }
    
    // Старая логика для обратной совместимости (если Knockout не используется)
    console.log('Using legacy favorites.js logic');
    
    const favoritesGrid = document.getElementById('favoritesGrid');
    const clearAllBtn = document.getElementById('clearAllBtn');
    const itemsCountEl = document.querySelector('.items-count');
    
    // Проверки существования элементов
    if (!favoritesGrid || !clearAllBtn || !itemsCountEl) {
        console.log('Required elements not found, skipping event handlers');
        return;
    }

    // Обновление счетчика товаров
    function updateItemsCount() {
        const count = document.querySelectorAll('.favorite-card').length;
        itemsCountEl.textContent = `${count} ${getProductWord(count)}`;

        // Показываем пустое состояние
        if (count === 0) {
            showEmptyState();
        }
    }

    function getProductWord(count) {
        const lastDigit = count % 10;
        const lastTwoDigits = count % 100;

        if (lastTwoDigits >= 11 && lastTwoDigits <= 19) {
            return 'товаров';
        }

        if (lastDigit === 1) {
            return 'товар';
        }

        if (lastDigit >= 2 && lastDigit <= 4) {
            return 'товара';
        }

        return 'товаров';
    }

    // Удаление одного товара
    document.querySelectorAll('.remove-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.stopPropagation();
            const id = this.getAttribute('data-id');
            const card = document.querySelector(`.favorite-card[data-id="${id}"]`);

            // Анимация удаления
            card.style.opacity = '0';
            card.style.transform = 'scale(0.8)';

            setTimeout(() => {
                card.remove();
                updateItemsCount();
                showNotification('Товар удален из избранного');
            }, 300);
        });
    });

    // Очистить все
    if (clearAllBtn) {
        clearAllBtn.addEventListener('click', function() {
        const cards = document.querySelectorAll('.favorite-card');

        if (cards.length === 0) return;

        if (confirm('Вы уверены, что хотите удалить все товары из избранного?')) {
            cards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = '0';
                    card.style.transform = 'scale(0.8)';

                    setTimeout(() => {
                        card.remove();
                        if (index === cards.length - 1) {
                            updateItemsCount();
                            showNotification('Избранное очищено');
                        }
                    }, 300);
                }, index * 50);
            });
        }
        });
    }

    // Добавление в корзину
    document.querySelectorAll('.add-to-cart').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.stopPropagation();
            const id = this.getAttribute('data-id');
            const card = document.querySelector(`.favorite-card[data-id="${id}"]`);
            const title = card.querySelector('.product-title').textContent;

            // Анимация
            this.textContent = 'Добавлено';
            this.style.backgroundColor = '#00a859';
            this.disabled = true;

            setTimeout(() => {
                this.textContent = 'В корзину';
                this.style.backgroundColor = '';
                this.disabled = false;
            }, 2000);

            // Обновляем счетчик корзины
            const cartCount = document.querySelector('.cart-count');
            if (cartCount) {
                const currentCount = parseInt(cartCount.textContent) || 0;
                cartCount.textContent = currentCount + 1;
            }

            showNotification(`"${title.substring(0, 30)}..." добавлен в корзину`);
        });
    });

    // Пустое состояние
    function showEmptyState() {
        favoritesGrid.innerHTML = `
      <div class="empty-state" style="grid-column: 1 / -1;">
        <svg width="120" height="120" viewBox="0 0 24 24" fill="none" stroke="#cccccc" stroke-width="1">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
        <h3>В избранном пока пусто</h3>
        <p>Добавляйте товары, которые вам понравились, чтобы не потерять их</p>
        <a href="/" class="btn btn-primary">Перейти к покупкам</a>
      </div>
    `;
    }

    // Уведомления
    function showNotification(message) {
        const notification = document.createElement('div');
        notification.className = 'notification';
        notification.textContent = message;
        notification.style.cssText = `
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #0d0d0d;
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

    // Клик по карточке (переход на страницу товара)
    document.querySelectorAll('.favorite-card').forEach(card => {
        card.addEventListener('click', function(e) {
            // Игнорируем клики по кнопкам
            if (e.target.closest('.remove-btn') || e.target.closest('.add-to-cart')) {
                return;
            }

            const id = this.getAttribute('data-id');
            console.log('Переход на страницу товара:', id);
            // window.location.href = `/product/${id}`;
        });
    });

    // Стили анимации
    const style = document.createElement('style');
    style.textContent = `
    .favorite-card {
      cursor: pointer;
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
    updateItemsCount();
});
