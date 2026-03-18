// Checkout Page Logic

// Address selection
const addressCards = document.querySelectorAll('.address-card');
addressCards.forEach(card => {
    card.addEventListener('click', function() {
        // Remove active class from all cards
        addressCards.forEach(c => c.classList.remove('active'));

        // Add active class to clicked card
        this.classList.add('active');

        // Check the radio button
        const radio = this.querySelector('input[type="radio"]');
        if (radio) {
            radio.checked = true;
        }
    });
});

// Delivery method selection
const deliveryCards = document.querySelectorAll('.delivery-card');
deliveryCards.forEach(card => {
    card.addEventListener('click', function() {
        // Remove active class from all cards
        deliveryCards.forEach(c => c.classList.remove('active'));

        // Add active class to clicked card
        this.classList.add('active');

        // Check the radio button
        const radio = this.querySelector('input[type="radio"]');
        if (radio) {
            radio.checked = true;
        }

        // Update delivery price in summary
        updateDeliveryPrice(this.dataset.method);
    });
});

// Payment method selection
const paymentCards = document.querySelectorAll('.payment-card');
paymentCards.forEach(card => {
    card.addEventListener('click', function() {
        // Remove active class from all cards
        paymentCards.forEach(c => c.classList.remove('active'));

        // Add active class to clicked card
        this.classList.add('active');

        // Check the radio button
        const radio = this.querySelector('input[type="radio"]');
        if (radio) {
            radio.checked = true;
        }
    });
});

// Update delivery price based on method
function updateDeliveryPrice(method) {
    const deliveryRow = document.querySelector('.summary-row:nth-child(3) .summary-value');

    if (method === 'pickup') {
        deliveryRow.textContent = 'Бесплатно';
        deliveryRow.classList.add('free');
    } else if (method === 'courier') {
        deliveryRow.textContent = '200 ₽';
        deliveryRow.classList.remove('free');
    } else if (method === 'express') {
        deliveryRow.textContent = '500 ₽';
        deliveryRow.classList.remove('free');
    }

    // Recalculate total
    calculateTotal();
}

// Promo code application
const promoInput = document.getElementById('promoInput');
const applyBtn = document.querySelector('.btn-apply');

applyBtn.addEventListener('click', function() {
    const promoCode = promoInput.value.trim().toUpperCase();

    if (!promoCode) {
        showNotification('Введите промокод', 'error');
        return;
    }

    // Simulate promo code validation
    const validPromoCodes = {
        'OZON2024': 1000,
        'WELCOME': 500,
        'SALE10': 0.1 // 10% discount
    };

    if (validPromoCodes[promoCode] !== undefined) {
        const discount = validPromoCodes[promoCode];

        if (typeof discount === 'number' && discount < 1) {
            // Percentage discount
            const subtotal = 64470;
            const discountAmount = Math.floor(subtotal * discount);
            updateDiscount(discountAmount);
            showNotification(`Промокод применен! Скидка ${Math.floor(discount * 100)}%`, 'success');
        } else {
            // Fixed discount
            updateDiscount(discount);
            showNotification(`Промокод применен! Скидка ${discount} ₽`, 'success');
        }

        promoInput.disabled = true;
        applyBtn.disabled = true;
        applyBtn.textContent = 'Применён';
    } else {
        showNotification('Неверный промокод', 'error');
    }
});

// Update discount in summary
function updateDiscount(amount) {
    const discountRow = document.querySelector('.summary-row:nth-child(2) .summary-value');
    discountRow.textContent = `-${amount.toLocaleString('ru-RU')} ₽`;
    calculateTotal();
}

// Calculate total price
function calculateTotal() {
    const subtotal = 64470;

    // Get discount
    const discountText = document.querySelector('.summary-row:nth-child(2) .summary-value').textContent;
    const discount = parseInt(discountText.replace(/[^0-9]/g, '')) || 5000;

    // Get delivery price
    const deliveryText = document.querySelector('.summary-row:nth-child(3) .summary-value').textContent;
    let deliveryPrice = 0;
    if (deliveryText !== 'Бесплатно') {
        deliveryPrice = parseInt(deliveryText.replace(/[^0-9]/g, ''));
    }

    // Calculate total
    const total = subtotal - discount + deliveryPrice;

    // Update total display
    const totalRow = document.querySelector('.summary-row.total .summary-value');
    totalRow.textContent = `${total.toLocaleString('ru-RU')} ₽`;
}

// Phone number formatting
const phoneInput = document.getElementById('recipientPhone');
if (phoneInput) {
    phoneInput.addEventListener('input', function(e) {
        let value = e.target.value.replace(/\D/g, '');

        if (value.startsWith('7')) {
            value = value.substring(1);
        } else if (value.startsWith('8')) {
            value = value.substring(1);
        }

        if (value.length > 0) {
            let formatted = '+7';
            if (value.length > 0) {
                formatted += ' (' + value.substring(0, 3);
            }
            if (value.length >= 4) {
                formatted += ') ' + value.substring(3, 6);
            }
            if (value.length >= 7) {
                formatted += '-' + value.substring(6, 8);
            }
            if (value.length >= 9) {
                formatted += '-' + value.substring(8, 10);
            }

            e.target.value = formatted;
        }
    });
}

// Checkout button
const checkoutBtn = document.querySelector('.checkout-btn');
checkoutBtn.addEventListener('click', function() {
    // Validate form
    const name = document.getElementById('recipientName').value.trim();
    const phone = document.getElementById('recipientPhone').value.trim();

    if (!name) {
        showNotification('Укажите ФИО получателя', 'error');
        return;
    }

    if (!phone || phone.length < 18) {
        showNotification('Укажите корректный номер телефона', 'error');
        return;
    }

    // Show loading state
    checkoutBtn.disabled = true;
    checkoutBtn.textContent = 'Оформление...';

    // Simulate order placement
    setTimeout(() => {
        showNotification('Заказ успешно оформлен! Номер заказа: #12345678', 'success');

        // Redirect to orders page after 2 seconds
        setTimeout(() => {
            //window.location.href = '/orders.html';
        }, 2000);
    }, 1500);
});



// Edit address buttons
const editAddressBtns = document.querySelectorAll('.address-edit');
editAddressBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
        e.stopPropagation();
        showNotification('Функция редактирования адреса в разработке', 'info');
    });
});

// Notification system
function showNotification(message, type = 'info') {
    // Remove existing notifications
    const existingNotification = document.querySelector('.notification');
    if (existingNotification) {
        existingNotification.remove();
    }

    // Create notification element
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;

    // Add styles
    notification.style.cssText = `
    position: fixed;
    top: 100px;
    right: 20px;
    background: ${type === 'success' ? '#00a859' : type === 'error' ? '#ff1744' : '#005bff'};
    color: white;
    padding: 16px 24px;
    border-radius: 8px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
    z-index: 10000;
    animation: slideIn 0.3s ease;
    max-width: 400px;
    font-size: 14px;
    font-weight: 500;
  `;

    // Add animation
    const style = document.createElement('style');
    style.textContent = `
    @keyframes slideIn {
      from {
        transform: translateX(400px);
        opacity: 0;
      }
      to {
        transform: translateX(0);
        opacity: 1;
      }
    }
    @keyframes slideOut {
      from {
        transform: translateX(0);
        opacity: 1;
      }
      to {
        transform: translateX(400px);
        opacity: 0;
      }
    }
  `;
    document.head.appendChild(style);

    // Add to page
    document.body.appendChild(notification);

    // Auto remove after 4 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 4000);
}

// Initialize
calculateTotal();
