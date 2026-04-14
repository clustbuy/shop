


<!-- Кнопка поддержки -->
<div id="supportFloatBtn" class="support-float-btn">
    <span>💬</span>
</div>

<!-- Окно связи -->
<div id="supportModal" class="support-modal">
    <div class="support-modal-content">
        <span class="support-modal-close">&times;</span>
        <h3>Связаться с поддержкой</h3>
        <form id="supportForm">
            <div class="support-form-group">
                <label>Имя</label>
                <input type="text" id="supportName" required>
            </div>
            <div class="support-form-group">
                <label>Ваша почта</label>
                <input type="email" id="supportEmail" required>
            </div>
            <div class="support-form-group">
                <label>Сообщение</label>
                <textarea id="supportMessage" rows="5" required></textarea>
            </div>
            <button type="submit" class="support-submit-btn">Отправить</button>
        </form>
        <div id="supportFormStatus"></div>
    </div>
</div>

<style>
/* Плавающая кнопка */
.support-float-btn {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, #49A4DC, #005b94);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    transition: transform 0.2s, box-shadow 0.2s;
    z-index: 1000;
}
.support-float-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 20px rgba(0,0,0,0.25);
}
.support-float-btn span {
    font-size: 28px;
    color: white;
}

/* Окно */
.support-modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    z-index: 1001;
    justify-content: center;
    align-items: center;
}
.support-modal-content {
    background: white;
    max-width: 500px;
    width: 90%;
    border-radius: 20px;
    padding: 25px;
    position: relative;
    box-shadow: 0 10px 30px rgba(0,0,0,0.3);
}
.support-modal-close {
    position: absolute;
    right: 20px;
    top: 15px;
    font-size: 28px;
    cursor: pointer;
}
.support-form-group {
    margin-bottom: 15px;
}
.support-form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: 500;
}
.support-form-group input,
.support-form-group textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-family: inherit;
}
.support-submit-btn {
    background: linear-gradient(135deg, #49A4DC, #005b94);
    color: white;
    border: none;
    padding: 12px;
    border-radius: 40px;
    width: 100%;
    font-size: 16px;
    cursor: pointer;
    transition: 0.2s;
}
.support-submit-btn:hover {
    background: linear-gradient(135deg, #005b94, #003f66);
}
#supportFormStatus {
    margin-top: 15px;
    text-align: center;
}
</style>

/* Скрипт пока не работает полностью. Потом заставлю его работать */
<script>
(function() {
    function init() {
        var btn = document.getElementById('supportFloatBtn');
        var modal = document.getElementById('supportModal');
        var closeSpan = document.querySelector('.support-modal-close');
        var form = document.getElementById('supportForm');
        var statusDiv = document.getElementById('supportFormStatus');

        // Открытие
        btn.onclick = function() {
            modal.style.display = 'flex';
        };

        // Закрытие
        if (closeSpan) {
            closeSpan.onclick = function() {
                modal.style.display = 'none';
            };
        }

        // Отправка
        if (form) {
            form.onsubmit = function(e) {
                e.preventDefault();
                var name = document.getElementById('supportName').value.trim();
                var email = document.getElementById('supportEmail').value.trim();
                var message = document.getElementById('supportMessage').value.trim();

                if (!name || !email || !message) {
                    statusDiv.innerHTML = '<span style="color: red;">Заполните все поля.</span>';
                    return;
                }

                statusDiv.innerHTML = '<span style="color: green;">Отправка...</span>';

                fetch('/support_send.php', {
                    method: 'POST',
                    body: 'name=' + encodeURIComponent(name) +
                          '&email=' + encodeURIComponent(email) +
                          '&message=' + encodeURIComponent(message)
                })
                .then(response => response.text())
                .then(data => {
                    statusDiv.innerHTML = '<span style="color: green;">' + data + '</span>';
                    if (data.includes('отправлено')) {
                        form.reset();
                        setTimeout(() => modal.style.display = 'none', 3000);
                    }
                })
            };
        }
    }

    // Если DOM уже загружен, запускаем сразу, иначе ждём (так надо)
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
</script>
