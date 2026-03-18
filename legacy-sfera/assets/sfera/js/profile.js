// Ждем полной загрузки страницы
document.addEventListener('DOMContentLoaded', function() {
    
    // Обработка формы ЛИЧНЫХ ДАННЫХ
    const personalForm = document.querySelector('#personal-form');
    if (personalForm) {
        personalForm.addEventListener('submit', function(e) {
            e.preventDefault(); // ВАЖНО! Останавливаем обычную отправку формы
            
            console.log('Отправка личных данных...');
            
            const formData = new FormData(this);
            formData.append('action', 'save_personal');
            
            fetch('/profile', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Ответ сервера:', data);
                
                if (data.success) {
                    showNotification(data.message || 'Данные сохранены', 'success');
                    
                    // Обновляем имя слева
                    const firstName = document.getElementById('firstName').value;
                    const lastName = document.getElementById('lastName').value;
                    const profileName = document.querySelector('.profile-name');
                    if (profileName) {
                        profileName.textContent = (firstName + ' ' + lastName).trim() || 'Гость';
                    }
                } else {
                    showNotification(data.message || 'Ошибка сохранения', 'error');
                }
            })
            .catch(error => {
                console.error('Ошибка:', error);
                showNotification('Ошибка соединения', 'error');
            });
            
            return false; // Дополнительная защита от отправки
        });
    }
    
    // Обработка формы КОНТАКТОВ
    const contactForm = document.querySelector('#contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            console.log('Отправка контактов...');
            
            const formData = new FormData(this);
            formData.append('action', 'save_contact');
            
            fetch('/profile', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Ответ сервера:', data);
                
                if (data.success) {
                    showNotification(data.message || 'Контакты сохранены', 'success');
                    
                    // Обновляем email слева
                    const email = document.getElementById('email').value;
                    const phone = document.getElementById('phone').value;
                    const profileEmail = document.querySelector('.profile-email');
                    if (profileEmail) {
                        profileEmail.textContent = email || phone || 'Не указано';
                    }
                } else {
                    showNotification(data.message || 'Ошибка сохранения', 'error');
                }
            })
            .catch(error => {
                console.error('Ошибка:', error);
                showNotification('Ошибка соединения', 'error');
            });
            
            return false;
        });
    }
    
    // Функция показа уведомлений
    function showNotification(message, type) {
        // Удаляем старое уведомление
        const existingNotification = document.querySelector('.notification');
        if (existingNotification) {
            existingNotification.remove();
        }
        
        // Создаем новое
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.textContent = message;
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
            font-size: 14px;
            font-weight: 500;
        `;
        
        document.body.appendChild(notification);
        
        // Автоудаление через 3 секунды
        setTimeout(() => {
            notification.remove();
        }, 3000);
    }
    
    console.log('Profile JS загружен');
    console.log('Форма личных данных найдена:', !!personalForm);
    console.log('Форма контактов найдена:', !!contactForm);
});
