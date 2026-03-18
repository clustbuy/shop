let currentType = 'phone'; // phone или email

// Переключение табов
document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
        
        currentType = this.getAttribute('data-type');
        const input = document.getElementById('contact-input');
        const label = document.getElementById('contact-label');
        const helpText = document.getElementById('help-text');
        
        if (currentType === 'phone') {
            input.type = 'tel';
            input.placeholder = '+7 (999) 999-99-99';
            label.textContent = 'Номер телефона';
            helpText.textContent = 'Мы отправим код подтверждения по СМС';
        } else {
            input.type = 'email';
            input.placeholder = 'example@mail.ru';
            label.textContent = 'Email адрес';
            helpText.textContent = 'Мы отправим код подтверждения на email';
        }
        input.value = '';
    });
});

// Маска для телефона
document.getElementById('contact-input').addEventListener('input', function(e) {
    if (currentType === 'phone') {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 0 && value[0] !== '7') {
            value = '7' + value;
        }
        if (value.length > 11) value = value.slice(0, 11);
        
        let formatted = '+7';
        if (value.length > 1) formatted += ' (' + value.slice(1, 4);
        if (value.length >= 5) formatted += ') ' + value.slice(4, 7);
        if (value.length >= 8) formatted += '-' + value.slice(7, 9);
        if (value.length >= 10) formatted += '-' + value.slice(9, 11);
        
        e.target.value = formatted;
    }
});

// ОТПРАВКА КОНТАКТА
document.getElementById('sms-phone-form').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const contact = document.getElementById('contact-input').value;
    const messageDiv = document.getElementById('phone-message');
    
    fetch('/sms/send', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'contact=' + encodeURIComponent(contact) + '&type=' + currentType
    })
    .then(response => response.text())
    .then(text => {
        const data = JSON.parse(text);
        messageDiv.style.display = 'block';
        
        if (data.success) {
            messageDiv.className = 'sms-message success';
            messageDiv.textContent = data.message + (data.debug_code ? ' (код: ' + data.debug_code + ')' : '');
            document.getElementById('phone-display').textContent = contact;
            
            setTimeout(() => {
                document.getElementById('phone-step').style.display = 'none';
                document.getElementById('code-step').style.display = 'block';
            }, 1000);
        } else {
            messageDiv.className = 'sms-message error';
            messageDiv.textContent = data.message || 'Ошибка';
        }
    })
    .catch(error => {
        messageDiv.style.display = 'block';
        messageDiv.className = 'sms-message error';
        messageDiv.textContent = 'Ошибка подключения';
    });
});

// ПРОВЕРКА КОДА
document.getElementById('sms-verify-form').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const code = document.getElementById('sms-code-input').value;
    const messageDiv = document.getElementById('code-message');
    
    fetch('/sms/verify', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'code=' + encodeURIComponent(code)
    })
    .then(response => response.json())
    .then(data => {
        messageDiv.style.display = 'block';
        
        if (data.success) {
            messageDiv.className = 'sms-message success';
            messageDiv.textContent = 'Успешно! Перенаправляем...';
            
            setTimeout(() => {
                window.location.href = '/profile';
            }, 1000);
        } else {
            messageDiv.className = 'sms-message error';
            messageDiv.textContent = data.message || 'Ошибка';
        }
    });
});

// ПОВТОР
document.getElementById('resend-link').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('code-step').style.display = 'none';
    document.getElementById('phone-step').style.display = 'block';
    document.getElementById('sms-code-input').value = '';
});