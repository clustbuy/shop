<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход в админ-панель - Творческий Центр СФЕРА</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }
        
        .login-header p {
            color: #666;
            font-size: 14px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .error-message {
            background: #fee;
            border: 1px solid #fcc;
            color: #c33;
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #999;
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Админ-панель</h1>
            <p>Творческий Центр СФЕРА</p>
        </div>
        
~~if $error~
        <div class="error-message">
            ~~$error~
        </div>
~~/if~
        
        <!-- Фейковые поля для отвлечения браузера -->
        <div style="position: absolute; left: -9999px; width: 1px; height: 1px; opacity: 0;">
            <input type="text" name="username" tabindex="-1">
            <input type="password" name="pwd" tabindex="-1">
        </div>
        
        <style>
            /* Визуальная маскировка пароля БЕЗ type="password" */
            input[data-field="password"] {
                -webkit-text-security: disc !important;
                -moz-text-security: disc !important;
                text-security: disc !important;
                font-family: text-security-disc !important;
            }
            
            /* Для Firefox альтернатива */
            input[data-field="password"]::-moz-placeholder {
                -moz-text-security: none !important;
            }
            input[data-field="password"]::placeholder {
                -webkit-text-security: none !important;
            }
        </style>
        
        <form method="POST" action="/admin/" autocomplete="new-password" id="login-form">
            <input type="hidden" name="action" value="login">
            <input type="hidden" id="real-login">
            <input type="hidden" id="real-password">
            
            <!-- Еще фейковые поля внутри формы -->
            <input type="text" style="display:none" tabindex="-1">
            <input type="text" style="display:none" tabindex="-1">
            
            <div class="form-group">
                <label>Логин</label>
                <input 
                    type="text" 
                    data-field="login"
                    required 
                    autofocus 
                    autocomplete="new-password"
                    autocorrect="off" 
                    autocapitalize="off" 
                    spellcheck="false"
                    role="presentation"
                >
            </div>
            
            <!-- Разделитель между полями -->
            <input type="text" style="display:none" tabindex="-1">
            
            <div class="form-group">
                <label>Пароль</label>
                <input 
                    type="text"
                    data-field="password"
                    required 
                    autocomplete="new-password"
                    autocorrect="off" 
                    autocapitalize="off" 
                    spellcheck="false"
                    role="presentation"
                    placeholder="••••••••"
                >
            </div>
            
            <button type="submit" class="btn-login">Войти</button>
        </form>
        
        <script>
        (function() {
            var form = document.getElementById('login-form');
            var loginField = document.querySelector('[data-field="login"]');
            var passField = document.querySelector('[data-field="password"]');
            var realLogin = document.getElementById('real-login');
            var realPassword = document.getElementById('real-password');
            
            // Устанавливаем readonly при загрузке
            loginField.setAttribute('readonly', 'readonly');
            passField.setAttribute('readonly', 'readonly');
            
            // Убираем readonly после задержки (БЕЗ смены типа!)
            setTimeout(function() {
                loginField.removeAttribute('readonly');
                passField.removeAttribute('readonly');
            }, 600);
            
            // Добавляем имена полям только перед отправкой
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Копируем значения в скрытые поля
                realLogin.name = 'login';
                realLogin.value = loginField.value;
                
                realPassword.name = 'password';
                realPassword.value = passField.value;
                
                // Убираем значения из видимых полей
                loginField.value = '';
                passField.value = '';
                
                // Отправляем форму
                form.submit();
            });
            
            // Блокируем автозаполнение при фокусе
            loginField.addEventListener('focus', function() {
                this.setAttribute('autocomplete', 'off');
            });
            
            passField.addEventListener('focus', function() {
                this.setAttribute('autocomplete', 'off');
            });
        })();
        </script>
        
        <a href="/" class="back-link">← Вернуться на сайт</a>
        
        <div class="login-footer">
            ©  ~~$now.year~ Творческий Центр СФЕРА
        </div>
    </div>
</body>
</html>

