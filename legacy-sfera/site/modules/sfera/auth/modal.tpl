~~if $smarty.session.auth_user~
  <div style="display:none;" data-auth-phone="~~$smarty.session.auth_user.phone~"></div>
~~/if~

<div id="login-modal" class="modal-overlay" style="display:none;">
  <div class="modal-backdrop"></div>
  
  <div class="modal-dialog">
    <button type="button" class="modal-close" id="login-modal-close">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <line x1="18" y1="6" x2="6" y2="18"></line>
        <line x1="6" y1="6" x2="18" y2="18"></line>
      </svg>
    </button>

<!-- ===== ФОРМА НОМЕРА ===== -->
<div id="phone-step" style="display: block;">
  <div class="modal-header">
    <h2>Вход в аккаунт</h2>
    <p class="modal-subtitle">Введите номер телефона</p>
  </div>
  
  <form id="sms-phone-form" class="modal-form">
    <div class="form-group">
      <label for="sms-phone-input">Номер телефона</label>
      <input 
        type="tel" 
        id="sms-phone-input" 
        name="phone" 
        placeholder="+7 (999) 999-99-99"
        autocomplete="off"
        required
      >
    </div>

    <button type="submit" class="btn btn-primary btn-full">
      Отправить код
    </button>

    <div class="sms-message" id="phone-message"></div>

    <p class="modal-help-text">
      Мы отправим код подтверждения по СМС на ваш номер
    </p>
  </form>
</div>


    <!-- ===== ФОРМА КОДА ===== -->
    <div id="code-step" style="display: none;">
      <div class="modal-header">
        <h2>Подтвердите номер</h2>
        <p class="modal-subtitle">
          Код отправлен на номер: <strong id="phone-display"></strong>
        </p>
      </div>

      <form id="sms-verify-form" class="modal-form">
        <div class="form-group">
          <label for="sms-code-input">Код из СМС</label>
          <input 
            type="text" 
            id="sms-code-input" 
            name="code" 
            placeholder="0000" 
            maxlength="4" 
            pattern="\d{4}"
            autocomplete="off"
            required
          >
        </div>

        <button type="submit" class="btn btn-primary btn-full">
          Подтвердить
        </button>

        <div class="sms-message" id="code-message"></div>

        <div class="modal-footer">
          <p class="code-timer">
            Код действует <span id="timer">15:00</span>
          </p>
          <a href="#" id="resend-btn" onclick="resendCode(event)" class="resend-link">
            Отправить заново
          </a>
        </div>
      </form>
    </div>
  </div>
</div>