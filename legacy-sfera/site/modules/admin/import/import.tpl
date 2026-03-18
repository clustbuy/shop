<!-- Модуль импорта товаров - API модуль -->
<!-- Открывается через функцию openImport() в desktop.tpl -->
<script>
// Если пользователь попал сюда напрямую, перенаправляем на desktop
if (window.location.pathname === '/admin/import/' || window.location.pathname === '/admin/import') {
    window.location.href = '/admin/';
}
</script>
<div style="padding: 20px; text-align: center;">
    <h2>Импорт товаров из XML</h2>
    <p>Это API модуль. Откройте приложение через меню "Пуск" → "Импорт товаров"</p>
    <p><a href="/admin/">Вернуться на главную</a></p>
</div>

