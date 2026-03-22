<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    <base href="/">
    ~~include file="sfera/tpl/favicon.tpl"~
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/footer.css">
    <link rel="stylesheet" href="/assets/sfera/css/catalog.css">

    <style>
        /* ===== ОБЩИЕ СТИЛИ ===== */
        body {
            margin: 0;
            padding: 0;
        }

        .profile-card {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
            border: 1px solid #eee;
        }

        .profile-header {
            color: white;
            padding: 30px;
            text-align: center;
        }

        .profile-avatar {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 50%;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #005b94;
            font-size: 32px;
            font-weight: bold;
        }

        .profile-info {
            padding: 30px;
        }
        
        .info-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f0f0f0;
            flex-wrap: nowrap;
        }

        .info-label {
            width: 100px;
            flex-shrink: 0;
            color: #777;
            font-size: 14px;
        }

        .info-value {
            flex: 1;
            color: #333;
            font-weight: 500;
            word-break: break-word;
            min-width: 0;
        }

        .edit-btn {
            flex-shrink: 0;
            background: none;
            border: 1px solid #49A4DC;
            color: #49A4DC;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 12px;
            cursor: pointer;
            transition: 0.2s;
            white-space: nowrap;
        }

    </style>

</head>
<body>
    ~~include file="sfera/tpl/header.tpl"~ <!-- ШАПКА -->
    <div style="height: 150px;"></div>

    <div class="profile-simple">
        <div class="container">
            <div class="profile-card">
                <div class="profile-info">
                    <!-- Имя -->
                    <div class="info-row">
                        <div class="info-label">Имя:</div>
                        <div class="info-value" id="nameValue">Михаил</div>
                        <button class="edit-btn" onclick="editField('nameValue')">Изменить</button>
                    </div>
                    
                    <!-- Фамилия -->
                    <div class="info-row">
                        <div class="info-label">Фамилия:</div>
                        <div class="info-value" id="surnameValue">Зубиенко</div>
                        <button class="edit-btn" onclick="editField('surnameValue')">Изменить</button>
                    </div>
                    
                    <!-- Email -->
                    <div class="info-row">
                        <div class="info-label">Email:</div>
                        <div class="info-value" id="emailValue">Mafioznik@gmail.com</div>
                        <button class="edit-btn" onclick="editField('emailValue')">Изменить</button>
                    </div>
                    
                    <!-- Телефон -->
                    <div class="info-row">
                        <div class="info-label">Телефон:</div>
                        <div class="info-value" id="phoneValue">+8(800)555-35-35</div>
                        <button class="edit-btn" onclick="editField('phoneValue')">Изменить</button>
                    </div>
                    
                    <!-- Пароль (скрыт, без редактирования) -->
                    <div class="info-row">
                        <div class="info-label">Пароль:</div>
                        <div class="info-value">
                            <div class="password-field">
                                <span class="password-dots">••••••••</span>
                                <span style="color:#999; font-size:12px;">(скрыт)</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Кнопки действий -->
                    <div class="profile-actions">
                        <button class="action-btn save-btn" onclick="alert('Данные сохранены (до обновления страницы)')">Сохранить</button>
                        <a href="/logout/" class="action-btn logout-btn">Выйти</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div style="height: 110px;"></div>
    ~~include file="sfera/tpl/footer.tpl"~ <!-- ПОДВАЛ -->

        <!-- Скрипт на изменение данных (потом сделаю получше) -->

    <script>
        function editField(elementId) {
            var span = document.getElementById(elementId);
            if (!span) return;
            var oldText = span.innerText;

            if (span.querySelector('input')) return;

            var input = document.createElement('input');
            input.type = 'text';
            input.value = oldText;
            input.className = 'edit-input';

            span.innerHTML = '';
            span.appendChild(input);
            input.focus();

            function save() {
                var newValue = input.value.trim();
                span.innerText = newValue !== '' ? newValue : oldText;
                input.removeEventListener('blur', save);
                input.removeEventListener('keypress', keyHandler);
            }

            function keyHandler(e) {
                if (e.key === 'Enter') {
                    save();
                }
            }

            input.addEventListener('blur', save);
            input.addEventListener('keypress', keyHandler);
        }
    </script>

</body>
</html>
