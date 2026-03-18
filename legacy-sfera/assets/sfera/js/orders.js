// Логика страницы заказов
document.addEventListener('DOMContentLoaded', function() {
    const statusFilters = document.querySelectorAll('input[name="status"]');
    const periodFilters = document.querySelectorAll('input[name="period"]');
    const orderCards = document.querySelectorAll('.order-card');

    // Фильтрация по статусу
    statusFilters.forEach(filter => {
        filter.addEventListener('change', function() {
            const status = this.value;
            filterOrders(status, getCurrentPeriod());
        });
    });

    // Фильтрация по периоду
    periodFilters.forEach(filter => {
        filter.addEventListener('change', function() {
            const period = this.value;
            filterOrders(getCurrentStatus(), period);
        });
    });

    function getCurrentStatus() {
        const checked = document.querySelector('input[name="status"]:checked');
        return checked ? checked.value : 'all';
    }

    function getCurrentPeriod() {
        const checked = document.querySelector('input[name="period"]:checked');
        return checked ? checked.value : 'all';
    }

    function filterOrders(status, period) {
        orderCards.forEach(card => {
            let show = true;

            // Фильтр по статусу
            if (status !== 'all') {
                const statusElement = card.querySelector('.order-status');
                const cardStatus = statusElement.classList.contains('status-active') ? 'active' :
                    statusElement.classList.contains('status-delivered') ? 'delivered' :
                        statusElement.classList.contains('status-cancelled') ? 'cancelled' : '';

                if (cardStatus !== status) {
                    show = false;
                }
            }

            // Фильтр по периоду (упрощенная версия)
            if (period !== 'all' && show) {
                const dateText = card.querySelector('.order-date').textContent;
                const orderDate = parseRussianDate(dateText);
                const now = new Date();

                if (period === 'month') {
                    const monthAgo = new Date(now.getFullYear(), now.getMonth() - 1, now.getDate());
                    if (orderDate < monthAgo) show = false;
                } else if (period === 'year') {
                    const yearAgo = new Date(now.getFullYear() - 1, now.getMonth(), now.getDate());
                    if (orderDate < yearAgo) show = false;
                }
            }

            // Анимация показа/скрытия
            if (show) {
                card.style.display = 'block';
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, 10);
            } else {
                card.style.opacity = '0';
                card.style.transform = 'translateY(-10px)';
                setTimeout(() => {
                    card.style.display = 'none';
                }, 300);
            }
        });

        // Показываем сообщение если нет заказов
        checkEmptyState();
    }

    function parseRussianDate(dateStr) {
        const months = {
            'января': 0, 'февраля': 1, 'марта': 2, 'апреля': 3,
            'мая': 4, 'июня': 5, 'июля': 6, 'августа': 7,
            'сентября': 8, 'октября': 9, 'ноября': 10, 'декабря': 11
        };

        const parts = dateStr.split(' ');
        const day = parseInt(parts[0]);
        const month = months[parts[1]];
        const year = parseInt(parts[2]);

        return new Date(year, month, day);
    }

    function checkEmptyState() {
        const visibleCards = Array.from(orderCards).filter(card =>
            card.style.display !== 'none'
        );

        const existingEmpty = document.querySelector('.empty-state');
        if (existingEmpty) existingEmpty.remove();

        if (visibleCards.length === 0) {
            const emptyState = document.createElement('div');
            emptyState.className = 'empty-state';
            emptyState.innerHTML = `
        <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="#cccccc" stroke-width="1">
          <rect x="3" y="3" width="18" height="18" rx="2"/>
          <path d="M3 9h18"/>
        </svg>
        <h3>Заказов не найдено</h3>
        <p>Попробуйте изменить параметры фильтрации</p>
      `;
            document.querySelector('.orders-list').appendChild(emptyState);
        }
    }

    // Обработчики кнопок
    document.querySelectorAll('.order-actions .btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            const action = this.textContent.trim();
            // console.log('Действие:', action);

            // Показываем уведомление
            showNotification(`Действие "${action}" выполнено`);
        });
    });

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
      animation: slideInUp 0.3s ease-out;
    `;
        document.body.appendChild(notification);

        setTimeout(() => {
            notification.style.animation = 'slideOutDown 0.3s ease-out';
            setTimeout(() => notification.remove(), 300);
        }, 3000);
    }

    // Добавляем стили анимации
    const style = document.createElement('style');
    style.textContent = `
    .order-card {
      opacity: 1;
      transform: translateY(0);
      transition: opacity 0.3s, transform 0.3s;
    }
    
    .empty-state {
      text-align: center;
      padding: 60px 20px;
      background: #ffffff;
      border-radius: 12px;
    }
    
    .empty-state svg {
      margin-bottom: 20px;
    }
    
    .empty-state h3 {
      font-size: 20px;
      font-weight: 600;
      color: #0d0d0d;
      margin-bottom: 8px;
    }
    
    .empty-state p {
      font-size: 14px;
      color: #666666;
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
});
