<!-- Модуль управления меню (страницами) - API модуль -->
<!-- Открывается через функцию openMenu() в desktop.tpl -->
<script>
// Если пользователь попал сюда напрямую, перенаправляем на desktop
if (window.location.pathname === '/admin/menu/' || window.location.pathname === '/admin/menu') {
    window.location.href = '/admin/';
}
</script>
<div style="padding: 20px; text-align: center;">
    <h2>Управление меню (страницы)</h2>
    <p>Это API модуль. Откройте приложение через меню "Пуск" → "Меню"</p>
    <p><a href="/admin/">Вернуться на главную</a></p>
</div>

