console.log('=== SMS SCRIPT LOADED ===');
  
  // ===== ПРОВЕРКА АВТОРИЗАЦИИ =====
  function checkAuth() {
    const authPhone = document.querySelector('[data-auth-phone]');
    if (authPhone && authPhone.dataset.authPhone) {
      console.log('✓ Пользователь авторизован');
      closeSmsModal();
      return true;
    }
    return false;
  }
  
  // Проверяем авторизацию при загрузке
  document.addEventListener('DOMContentLoaded', checkAuth);
  
  // Проверяем элементы
  console.log('phone-form:', document.getElementById('sms-phone-form'));
  console.log('code-form:', document.getElementById('sms-verify-form'));
  
  // ===== ОТПРАВКА НОМЕРА =====
  const phoneForm = document.getElementById('sms-phone-form');
  if (phoneForm) {
    console.log('✓ Форма номера найдена');
    phoneForm.addEventListener('submit', function(e) {
      e.preventDefault();
      console.log('✓ Форма отправлена');

      const phone = document.getElementById('sms-phone-input').value;
      const messageDiv = document.getElementById('phone-message');
      
      console.log('Отправляю номер:', phone);

      fetch('/sms/send', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'phone=' + encodeURIComponent(phone)
      })
      .then(response => response.text())
      .then(text => {
        console.log('Ответ от сервера:', text);
        const data = JSON.parse(text);
        
        if (data.success) {
          messageDiv.className = 'sms-message success';
          messageDiv.textContent = data.message;
          
          document.getElementById('phone-display').textContent = phone;
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
        console.error('Ошибка:', error);
        messageDiv.className = 'sms-message error';
        messageDiv.textContent = 'Ошибка подключения: ' + error.message;
      });
    });
  }

  // ===== ПРОВЕРКА КОДА =====
  const verifyForm = document.getElementById('sms-verify-form');
  if (verifyForm) {
    console.log('✓ Форма кода найдена');
    verifyForm.addEventListener('submit', function(e) {
      e.preventDefault();
      console.log('✓ Форма кода отправлена');

      const code = document.getElementById('sms-code-input').value;
      const messageDiv = document.getElementById('code-message');

      fetch('/sms/verify', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'code=' + encodeURIComponent(code)
      })
      .then(response => response.text())
      .then(text => {
        console.log('Ответ от сервера:', text);
        const data = JSON.parse(text);
        
        if (data.success) {
          messageDiv.className = 'sms-message success';
          messageDiv.textContent = data.message;
          
          setTimeout(() => {
            closeSmsModal();
            // Обновляем страницу для отображения профиля
            location.reload();
          }, 1500);
        } else {
          messageDiv.className = 'sms-message error';
          messageDiv.textContent = data.message;
        }
      })
      .catch(error => {
        console.error('Ошибка:', error);
        messageDiv.className = 'sms-message error';
        messageDiv.textContent = 'Ошибка проверки!';
      });
    });
  }

  // ===== ОТКРЫТЬ/ЗАКРЫТЬ МОДАЛЬНОЕ ОКНО =====
  function openSmsModal() {
    document.getElementById('login-modal').style.display = 'block';
    document.body.style.overflow = 'hidden';
    document.getElementById('phone-step').style.display = 'block';
    document.getElementById('code-step').style.display = 'none';
  }

  function closeSmsModal() {
    document.getElementById('login-modal').style.display = 'none';
    document.body.style.overflow = '';
    document.getElementById('sms-phone-form').reset();
    document.getElementById('sms-verify-form').reset();
    document.getElementById('phone-message').className = 'sms-message';
    document.getElementById('code-message').className = 'sms-message';
  }

  // ===== ПЕРЕОТПРАВИТЬ КОД =====
  function resendCode(e) {
    e.preventDefault();
    
    const phone = document.getElementById('sms-phone-input').value;
    const messageDiv = document.getElementById('code-message');

    fetch('/sms/send', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: 'phone=' + encodeURIComponent(phone)
    })
    .then(response => response.text())
    .then(text => {
      const data = JSON.parse(text);
      if (data.success) {
        messageDiv.className = 'sms-message success';
        messageDiv.textContent = 'Код переотправлен';
      }
    });
  }

  // ===== СЛУШАТЕЛИ СОБЫТИЙ =====
  const smsCloseBtn = document.getElementById('login-modal-close');
  const smsBackdrop = document.querySelector('#login-modal .modal-backdrop');
  
  if (smsCloseBtn) smsCloseBtn.addEventListener('click', closeSmsModal);
  if (smsBackdrop) smsBackdrop.addEventListener('click', closeSmsModal);