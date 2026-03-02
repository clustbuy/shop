<?php /* Smarty version 2.6.11, created on 2025-11-29 18:01:53
         compiled from sfera/sms/sms-script.tpl */ ?>
<script>
  // ===== ОТКРЫТЬ/ЗАКРЫТЬ МОДАЛЬНОЕ ОКНО =====
  const smsModal = document.getElementById('login-modal');
  const smsBackdrop = document.querySelector('#login-modal .modal-backdrop');
  const smsCloseBtn = document.getElementById('login-modal-close');

  function openSmsModal() {
    smsModal.style.display = 'block';
    document.body.style.overflow = 'hidden';
    document.getElementById('phone-step').style.display = 'block';
    document.getElementById('code-step').style.display = 'none';
  }

  function closeSmsModal() {
    smsModal.style.display = 'none';
    document.body.style.overflow = '';
    document.getElementById('sms-phone-form').reset();
    document.getElementById('sms-verify-form').reset();
    document.getElementById('phone-message').className = 'sms-message';
    document.getElementById('code-message').className = 'sms-message';
  }

  // Слушаем клики
  if (smsCloseBtn) smsCloseBtn.addEventListener('click', closeSmsModal);
  if (smsBackdrop) smsBackdrop.addEventListener('click', closeSmsModal);

  // ===== ОТПРАВКА НОМЕРА =====
  document.getElementById('sms-phone-form').addEventListener('submit', function(e) {
    e.preventDefault();

    const phone = document.getElementById('sms-phone-input').value;
    const messageDiv = document.getElementById('phone-message');

    fetch('/sms/send', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: 'phone=' + encodeURIComponent(phone)
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        messageDiv.className = 'sms-message success';
        messageDiv.textContent = data.message;
        
        // Показываем номер и переходим на форму кода
        document.getElementById('phone-display').textContent = phone;
        setTimeout(() => {
          document.getElementById('phone-step').style.display = 'none';
          document.getElementById('code-step').style.display = 'block';
        }, 1000);
      } else {
        messageDiv.className = 'sms-message error';
        messageDiv.textContent = data.message;
      }
    })
    .catch(error => {
      messageDiv.className = 'sms-message error';
      messageDiv.textContent = 'Ошибка подключения!';
    });
  });

  // ===== ПРОВЕРКА КОДА =====
  document.getElementById('sms-verify-form').addEventListener('submit', function(e) {
    e.preventDefault();

    const code = document.getElementById('sms-code-input').value;
    const messageDiv = document.getElementById('code-message');

    fetch('/sms/verify', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: 'code=' + encodeURIComponent(code)
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        messageDiv.className = 'sms-message success';
        messageDiv.textContent = data.message;
        
        setTimeout(() => {
          closeSmsModal();
          location.reload();
        }, 1500);
      } else {
        messageDiv.className = 'sms-message error';
        messageDiv.textContent = data.message;
      }
    })
    .catch(error => {
      messageDiv.className = 'sms-message error';
      messageDiv.textContent = 'Ошибка проверки!';
    });
  });

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
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        messageDiv.className = 'sms-message success';
        messageDiv.textContent = 'Код переотправлен на номер ' + phone;
      }
    });
  }
</script>

<style>
  .sms-message {
    margin-top: 15px;
    padding: 10px;
    border-radius: 5px;
    text-align: center;
    display: none;
    font-size: 14px;
  }

  .sms-message.success {
    display: block;
    background: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
  }

  .sms-message.error {
    display: block;
    background: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
  }

  #sms-phone-form label,
  #sms-verify-form label {
    display: block;
    margin-bottom: 10px;
    font-weight: 500;
  }

  #sms-phone-form input,
  #sms-verify-form input {
    width: 100%;
    padding: 12px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 5px;
  }

  #sms-phone-form input:focus,
  #sms-verify-form input:focus {
    outline: none;
    border-color: #FF6B35;
  }

  #sms-phone-form button,
  #sms-verify-form button {
    width: 100%;
    padding: 12px;
    background: #FF6B35;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    margin-top: 10px;
  }

  #sms-phone-form button:hover,
  #sms-verify-form button:hover {
    background: #E85A2A;
  }
</style>