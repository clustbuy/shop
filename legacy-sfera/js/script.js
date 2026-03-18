// Находим элементы
const menuToggle = $('#mobile-toggle'); // Кнопка бургер
const sideMenu = document.querySelector('.side-menu'); // Боковое меню
const closeMenu = document.querySelector('.close-menu'); // Кнопка закрытия внутри меню

// Функция для переключения состояния меню
function toggleMenu() {
    sideMenu.classList.toggle('active'); // Добавляем/удаляем класс 'active'
}

// Добавляем обработчик клика на кнопку бургер
menuToggle.on('click', toggleMenu);

// Добавляем обработчик клика на кнопку закрытия внутри меню
closeMenu.addEventListener('click', toggleMenu);

// Закрытие меню при клике вне его области
document.addEventListener('click', function (event) {
    if (!sideMenu.contains(event.target) && !menuToggle.contains(event.target)) {
        if (sideMenu.classList.contains('active')) {
            toggleMenu(); // Закрываем меню, если оно открыто
        }
    }
});

// Находим элемент бэджа
const badge = document.querySelector('.mobile-footer .badge');
const cartButton = document.querySelector('.cart-button');



