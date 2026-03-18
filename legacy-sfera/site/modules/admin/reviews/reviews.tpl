<!-- Модуль управления обзорами продукции - API модуль -->
<!-- Открывается через функцию openReviews() в desktop.tpl -->
<script>
// Если пользователь попал сюда напрямую, перенаправляем на desktop
if (window.location.pathname === '/admin/reviews/' || window.location.pathname === '/admin/reviews') {
    window.location.href = '/admin/';
}
</script>
<div style="padding: 20px; text-align: center;">
    <h2>Обзоры продукции</h2>
    <p>Это API модуль. Откройте приложение через меню "Пуск" → "Обзоры продукции"</p>
    <p><a href="/admin/">Вернуться на главную</a></p>
</div>

