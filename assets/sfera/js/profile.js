// Profile Page Logic

// Tab Navigation
const navItems = document.querySelectorAll('.nav-item');
const tabContents = document.querySelectorAll('.tab-content');

navItems.forEach(item => {
    item.addEventListener('click', function(e) {
        e.preventDefault();

        // Remove active class from all nav items
        navItems.forEach(nav => nav.classList.remove('active'));

        // Add active class to clicked nav item
        this.classList.add('active');

        // Hide all tab contents
        tabContents.forEach(tab => tab.classList.remove('active'));

        // Show corresponding tab content
        const tabId = this.dataset.tab;
        const targetTab = document.getElementById(tabId);
        if (targetTab) {
            targetTab.classList.add('active');
        }
    });
});

// Personal Data Form
const personalForm = document.querySelector('#personal .profile-form');
if (personalForm) {
    personalForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const firstName = document.getElementById('firstName').value.trim();
        const lastName = document.getElementById('lastName').value.trim();

        if (!firstName || !lastName) {
            showNotification('Заполните обязательные поля', 'error');
            return;
        }

        // Simulate saving
        showNotification('Данные успешно сохранены', 'success');
    });
}

// Contact Info Form
const contactForms = document.querySelectorAll('#personal .profile-form');
if (contactForms[1]) {
    contactForms[1].addEventListener('submit', function(e) {
        e.preventDefault();

        const email = document.getElementById('email').value.trim();
        const phone = document.getElementById('phone').value.trim();

        if (!email || !phone) {
            showNotification('Заполните все поля', 'error');
            return;
        }

        // Simulate saving
        showNotification('Контактная информация обновлена', 'success');
    });
}

// Phone number formatting
const phoneInput = document.getElementById('phone');
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

// Address Actions
const addAddressBtn = document.querySelector('.add-address-card');
if (addAddressBtn) {
    addAddressBtn.addEventListener('click', function() {
        showNotification('Функция добавления адреса в разработке', 'info');
    });
}

const editBtns = document.querySelectorAll('.btn-edit');
editBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        showNotification('Функция редактирования в разработке', 'info');
    });
});

const deleteBtns = document.querySelectorAll('.btn-delete');
deleteBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        if (confirm('Вы уверены, что хотите удалить этот адрес?')) {
            this.closest('.address-card').remove();
            showNotification('Адрес удален', 'success');
        }
    });
});

// Payment Actions
const addPaymentBtn = document.querySelector('.add-payment-card');
if (addPaymentBtn) {
    addPaymentBtn.addEventListener('click', function() {
        showNotification('Функция добавления карты в разработке', 'info');
    });
}

const cardDeleteBtns = document.querySelectorAll('.card-delete');
cardDeleteBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        if (confirm('Вы уверены, что хотите удалить эту карту?')) {
            this.closest('.payment-method-card').remove();
            showNotification('Карта удалена', 'success');
        }
    });
});

// Notification Toggles
const notificationToggles = document.querySelectorAll('.notification-item .toggle input');
notificationToggles.forEach(toggle => {
    toggle.addEventListener('change', function() {
        const status = this.checked ? 'включены' : 'выключены';
        const notificationName = this.closest('.notification-item').querySelector('h4').textContent;
        showNotification(`Уведомления "${notificationName}" ${status}`, 'success');
    });
});

// Security - Change Password Form
const passwordForm = document.querySelector('#security .profile-form');
if (passwordForm) {
    passwordForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const currentPassword = document.getElementById('currentPassword').value;
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (!currentPassword || !newPassword || !confirmPassword) {
            showNotification('Заполните все поля', 'error');
            return;
        }

        if (newPassword.length < 8) {
            showNotification('Пароль должен содержать минимум 8 символов', 'error');
            return;
        }

        if (newPassword !== confirmPassword) {
            showNotification('Пароли не совпадают', 'error');
            return;
        }

        // Simulate password change
        showNotification('Пароль успешно изменен', 'success');

        // Clear form
        this.reset();
    });
}

// End Session
const endSessionBtns = document.querySelectorAll('.btn-end-session');
endSessionBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        if (confirm('Завершить этот сеанс?')) {
            this.closest('.session-item').remove();
            showNotification('Сеанс завершен', 'success');
        }
    });
});

// Logout
const logoutBtn = document.querySelector('.logout-btn');
if (logoutBtn) {
    logoutBtn.addEventListener('click', function() {
        if (confirm('Вы уверены, что хотите выйти?')) {
            showNotification('Выход из аккаунта...', 'info');

            setTimeout(() => {
                window.location.href = '/login.html';
            }, 1000);
        }
    });
}

// Mobile Navigation (если добавите мобильное меню)
function createMobileNav() {
    const isMobile = window.innerWidth <= 1024;

    if (isMobile) {
        // Add mobile navigation logic here if needed
    }
}

window.addEventListener('resize', createMobileNav);
createMobileNav();

// Notification System
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
    if (!document.querySelector('style[data-notifications]')) {
        style.setAttribute('data-notifications', 'true');
        document.head.appendChild(style);
    }

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

// Form validation helpers
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validatePhone(phone) {
    const digits = phone.replace(/\D/g, '');
    return digits.length === 11;
}

// Initialize
console.log('Profile page initialized');
