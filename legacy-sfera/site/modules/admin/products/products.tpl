<!-- Модуль управления товарами - API модуль -->
<!-- Открывается через функцию openProducts() в desktop.tpl -->
<script>
// Если пользователь попал сюда напрямую, перенаправляем на desktop
if (window.location.pathname === '/admin/products/' || window.location.pathname === '/admin/products') {
    window.location.href = '/admin/';
}
</script>
<div style="padding: 20px; text-align: center;">
    <h2>Управление товарами</h2>
    <p>Это API модуль. Откройте приложение через меню "Пуск" → "Управление товарами"</p>
    <p><a href="/admin/">Вернуться на главную</a></p>
</div>

