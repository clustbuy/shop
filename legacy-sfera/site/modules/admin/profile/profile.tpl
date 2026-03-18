<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Параметры</title>
    <!-- Google Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #f3f3f3;
            color: #000;
            overflow: hidden;
        }
        
        .settings-container {
            display: flex;
            height: 100vh;
        }
        
        /* Левая панель */
        .sidebar {
            width: 300px;
            background: #f3f3f3;
            border-right: 1px solid #e5e5e5;
            display: flex;
            flex-direction: column;
        }
        
        .sidebar-header {
            padding: 20px;
            background: #f3f3f3;
        }
        
        .sidebar-header h1 {
            font-size: 24px;
            font-weight: 300;
            color: #000;
            margin-bottom: 15px;
        }
        
        .search-box {
            position: relative;
            margin-bottom: 10px;
        }
        
        .search-box input {
            width: 100%;
            padding: 8px 12px 8px 35px;
            border: 1px solid #bebebe;
            border-radius: 2px;
            font-size: 14px;
            font-family: inherit;
            background: #fff;
        }
        
        .search-box input:focus {
            outline: none;
            border-color: #0078d4;
        }
        
        .search-box::before {
            content: '';
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-family: 'Material Icons';
            font-size: 18px;
            color: #666;
        }
        
        .sidebar-section {
            padding: 0;
        }
        
        .sidebar-section-title {
            padding: 12px 20px 8px 20px;
            font-size: 13px;
            font-weight: 600;
            color: #000;
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu-item {
            padding: 0;
        }
        
        .sidebar-menu-link {
            display: flex;
            align-items: center;
            padding: 10px 20px 10px 12px;
            color: #000;
            text-decoration: none;
            font-size: 14px;
            border-left: 3px solid transparent;
            transition: background 0.1s;
        }
        
        .sidebar-menu-link:hover {
            background: #e5e5e5;
        }
        
        .sidebar-menu-link.active {
            background: #fff;
            border-left-color: #0078d4;
        }
        
        .sidebar-menu-icon {
            width: 20px;
            height: 20px;
            margin-right: 12px;
            font-size: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
        }
        
        .sidebar-menu-link.active .sidebar-menu-icon {
            color: #0078d4;
        }
        
        /* Контентная область */
        .content {
            flex: 1;
            background: #fff;
            overflow-y: auto;
            padding: 40px 50px;
        }
        
        .content-header {
            margin-bottom: 30px;
        }
        
        .content-title {
            font-size: 32px;
            font-weight: 300;
            color: #000;
            margin-bottom: 10px;
        }
        
        .content-subtitle {
            font-size: 14px;
            color: #666;
        }
        
        /* Профиль */
        .profile-section {
            margin-bottom: 40px;
        }
        
        .profile-avatar-container {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            padding-bottom: 30px;
            border-bottom: 1px solid #e5e5e5;
        }
        
        .profile-avatar {
            width: 120px;
            height: 120px;
            background: #e5e5e5;
            border-radius: 50%;
            margin-right: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 60px;
            color: #666;
        }
        
        .profile-info {
            flex: 1;
        }
        
        .profile-name {
            font-size: 24px;
            font-weight: 400;
            color: #000;
            margin-bottom: 5px;
        }
        
        .profile-status {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        
        .profile-role {
            font-size: 13px;
            color: #666;
        }
        
        /* Информационная таблица */
        .info-table {
            margin-bottom: 40px;
        }
        
        .info-row {
            display: flex;
            padding: 15px 0;
            border-bottom: 1px solid #f3f3f3;
        }
        
        .info-label {
            width: 200px;
            font-size: 14px;
            color: #666;
        }
        
        .info-value {
            flex: 1;
            font-size: 14px;
            color: #000;
        }
        
        /* Форма смены пароля */
        .password-section {
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #e5e5e5;
        }
        
        .section-title {
            font-size: 20px;
            font-weight: 400;
            color: #000;
            margin-bottom: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
            max-width: 400px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #000;
        }
        
        .form-input {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #bebebe;
            border-radius: 2px;
            font-size: 14px;
            font-family: inherit;
            background: #fff;
        }
        
        .form-input:focus {
            outline: none;
            border-color: #0078d4;
        }
        
        .form-input:hover {
            border-color: #7a7a7a;
        }
        
        /* Кнопки */
        .button-group {
            margin-top: 25px;
            display: flex;
            gap: 10px;
        }
        
        .btn {
            padding: 8px 16px;
            border: 1px solid transparent;
            border-radius: 2px;
            font-size: 14px;
            font-family: inherit;
            cursor: pointer;
            transition: all 0.1s;
        }
        
        .btn-primary {
            background: #0078d4;
            color: #fff;
            border-color: #0078d4;
        }
        
        .btn-primary:hover {
            background: #005a9e;
            border-color: #005a9e;
        }
        
        .btn-primary:active {
            background: #004578;
            border-color: #004578;
        }
        
        .btn-secondary {
            background: #fff;
            color: #000;
            border-color: #bebebe;
        }
        
        .btn-secondary:hover {
            background: #f3f3f3;
            border-color: #7a7a7a;
        }
        
        /* Сообщения */
        .message {
            padding: 12px 16px;
            margin-bottom: 20px;
            border-radius: 2px;
            font-size: 14px;
            border-left: 3px solid;
        }
        
        .message-success {
            background: #dff6dd;
            border-left-color: #107c10;
            color: #107c10;
        }
        
        .message-error {
            background: #fde7e9;
            border-left-color: #e81123;
            color: #e81123;
        }
        
        /* Бейдж статуса */
        .badge {
            display: inline-block;
            padding: 2px 8px;
            font-size: 12px;
            border-radius: 2px;
        }
        
        .badge-active {
            background: #dff6dd;
            color: #107c10;
        }
        
        .badge-inactive {
            background: #fde7e9;
            color: #e81123;
        }
        
        /* Скроллбар */
        .content::-webkit-scrollbar {
            width: 12px;
        }
        
        .content::-webkit-scrollbar-track {
            background: #f3f3f3;
        }
        
        .content::-webkit-scrollbar-thumb {
            background: #cdcdcd;
            border: 3px solid #f3f3f3;
            border-radius: 6px;
        }
        
        .content::-webkit-scrollbar-thumb:hover {
            background: #a6a6a6;
        }
    </style>
</head>
<body>
    <div class="settings-container">
        <!-- Левая панель -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <h1>Параметры</h1>
                <div class="search-box">
                    <input type="text" placeholder="Найти параметр">
                </div>
            </div>
            
            <div class="sidebar-section">
                <div class="sidebar-section-title">Учетные записи</div>
                <ul class="sidebar-menu">
                    <li class="sidebar-menu-item">
                        <a href="#" class="sidebar-menu-link active">
                            <span class="sidebar-menu-icon material-icons">person</span>
                            Ваши данные
                        </a>
                    </li>
                    <li class="sidebar-menu-item">
                        <a href="#" class="sidebar-menu-link">
                            <span class="sidebar-menu-icon material-icons">email</span>
                            Электронная почта и учетные записи
                        </a>
                    </li>
                    <li class="sidebar-menu-item">
                        <a href="#" class="sidebar-menu-link">
                            <span class="sidebar-menu-icon material-icons">vpn_key</span>
                            Варианты входа
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        
        <!-- Контентная область -->
        <main class="content">
            <div class="content-header">
                <h2 class="content-title">Ваши данные</h2>
            </div>
            
            <!-- Сообщения -->
~~if $message~
            <div class="message message-~~$message_type~">
                ~~$message~
            </div>
~~/if~
            
            <!-- Профиль -->
            <div class="profile-section">
                <div class="profile-avatar-container">
                    <div class="profile-avatar">
                        <span class="material-icons" style="font-size: 60px; color: #666;">account_circle</span>
                    </div>
                    <div class="profile-info">
                        <div class="profile-name">~~$user.name~</div>
                        <div class="profile-status">Локальная учётная запись</div>
                        <div class="profile-role">Администратор</div>
                    </div>
                </div>
                
                <!-- Информация -->
                <div class="info-table">
                    <div class="info-row">
                        <div class="info-label">Логин</div>
                        <div class="info-value">~~$user.login~</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Имя</div>
                        <div class="info-value">~~$user.name~</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Email</div>
                        <div class="info-value">~~$user.email~</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Роль</div>
                        <div class="info-value">~~$user.role~</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Статус</div>
                        <div class="info-value">
~~if $user.active == 1~
                            <span class="badge badge-active">Активен</span>
~~else~
                            <span class="badge badge-inactive">Неактивен</span>
~~/if~
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Последний вход</div>
                        <div class="info-value">~~$user.last_login~</div>
                    </div>
                </div>
            </div>
            
            <!-- Форма смены пароля -->
            <div class="password-section">
                <h3 class="section-title">Изменить пароль</h3>
                <p class="content-subtitle" style="margin-bottom: 20px;">Используйте надёжный пароль для защиты вашей учётной записи</p>
                
                <form method="POST" action="/admin/profile/?action=change_password" id="changePasswordForm">
                    <div class="form-group">
                        <label class="form-label" for="current_password">Текущий пароль</label>
                        <input type="password" class="form-input" id="current_password" name="current_password" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="new_password">Новый пароль</label>
                        <input type="password" class="form-input" id="new_password" name="new_password" required minlength="6">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="confirm_password">Подтвердите новый пароль</label>
                        <input type="password" class="form-input" id="confirm_password" name="confirm_password" required minlength="6">
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">Сохранить</button>
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">Отмена</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
    
    <script>
        // Проверка совпадения паролей
        const form = document.getElementById('changePasswordForm');
        form.addEventListener('submit', function(e) {
            const newPassword = document.getElementById('new_password').value;
            const confirmPassword = document.getElementById('confirm_password').value;
            
            if (newPassword !== confirmPassword) {
                e.preventDefault();
                alert('Новые пароли не совпадают!');
                return false;
            }
        });
        
        // Сброс формы
        function resetForm() {
            document.getElementById('changePasswordForm').reset();
        }
        
        // Поиск по параметрам (заглушка)
        const searchInput = document.querySelector('.search-box input');
        searchInput.addEventListener('input', function(e) {
            // Здесь можно добавить фильтрацию меню
            console.log('Поиск:', e.target.value);
        });
    </script>
</body>
</html>

