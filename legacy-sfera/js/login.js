// Логика страницы входа
document.addEventListener('DOMContentLoaded', function() {
  const loginForm = document.getElementById('loginForm');
  const phoneEmailInput = document.getElementById('phoneEmail');

  // Маска для телефона
  phoneEmailInput.addEventListener('input', function(e) {
    let value = e.target.value;
    
    // Если начинается с +7 или 8, применяем маску телефона
    if (value.startsWith('+7') || value.startsWith('8') || value.startsWith('7')) {
      // Автоформатирование телефона
      value = value.replace(/\D/g, '');
      if (value.length > 0) {
        if (value[0] === '8') {
          value = '7' + value.slice(1);
        }
        let formatted = '+7';
        if (value.length > 1) {
          formatted += ' (' + value.substring(1, 4);
        }
        if (value.length >= 5) {
          formatted += ') ' + value.substring(4, 7);
        }
        if (value.length >= 8) {
          formatted += '-' + value.substring(7, 9);
        }
        if (value.length >= 10) {
          formatted += '-' + value.substring(9, 11);
        }
        e.target.value = formatted;
      }
    }
  });

  // Отправка формы
  loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const phoneEmail = phoneEmailInput.value.trim();
    
    if (!phoneEmail) {
      alert('Пожалуйста, введите номер телефона или email');
      return;
    }
    
    // Валидация email или телефона
    const isEmail = phoneEmail.includes('@');
    const isPhone = phoneEmail.startsWith('+7');
    
    if (!isEmail && !isPhone) {
      alert('Пожалуйста, введите корректный номер телефона или email');
      return;
    }
    
    // Симуляция отправки кода
    console.log('Отправка кода на:', phoneEmail);
    
    // Показываем сообщение
    const messageDiv = document.createElement('div');
    messageDiv.className = 'success-message';
    messageDiv.style.cssText = `
      position: fixed;
      top: 20px;
      right: 20px;
      background: #00a859;
      color: white;
      padding: 16px 24px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      z-index: 10000;
      animation: slideIn 0.3s ease-out;
    `;
    messageDiv.textContent = `Код отправлен на ${isEmail ? 'email' : 'телефон'}`;
    document.body.appendChild(messageDiv);
    
    // Удаляем сообщение через 3 секунды
    setTimeout(() => {
      messageDiv.style.animation = 'slideOut 0.3s ease-out';
      setTimeout(() => messageDiv.remove(), 300);
    }, 3000);
    
    // В реальном приложении здесь был бы переход на страницу ввода кода
    // window.location.href = '/verify-code.html';
  });

  // Обработчики социальных кнопок
  const socialBtns = document.querySelectorAll('.social-btn');
  socialBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      const provider = this.querySelector('span').textContent;
      console.log('Вход через:', provider);
      
      // В реальном приложении здесь был бы редирект на OAuth провайдера
      alert(`Вход через ${provider}. В демо-версии эта функция не реализована.`);
    });
  });

  // Анимации
  const style = document.createElement('style');
  style.textContent = `
    @keyframes slideIn {
      from {
        transform: translateX(100%);
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
        transform: translateX(100%);
        opacity: 0;
      }
    }
  `;
  document.head.appendChild(style);
});
