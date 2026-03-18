document.addEventListener("DOMContentLoaded", function() {

    // --- 1. ЛОГИКА ПОИСКА (оставляем без изменений) ---
    const input = document.getElementById('cityInput');
    const list = document.getElementById('cityList');
    if(input && list) {
        input.addEventListener('click', () => list.classList.add('show'));
        input.addEventListener('input', function() {
            const val = this.value.toLowerCase();
            let hasVisible = false;
            list.querySelectorAll('li').forEach(item => {
                const match = item.innerText.toLowerCase().includes(val);
                item.style.display = match ? 'block' : 'none';
                if(match) hasVisible = true;
            });
            hasVisible ? list.classList.add('show') : list.classList.remove('show');
        });
        list.querySelectorAll('li').forEach(item => {
            item.addEventListener('click', function() {
                input.value = this.getAttribute('data-value');
                list.classList.remove('show');
            });
        });
        document.addEventListener('click', (e) => {
            if (!input.contains(e.target) && !list.contains(e.target)) list.classList.remove('show');
        });
    }

    // --- 2. СЛАЙДЕР (ГРУППОВОЕ ЛИСТАНИЕ) ---
    const track = document.querySelector('.custom-shops-track');
    const container = document.querySelector('.custom-shops-track-container');
    const slides = document.querySelectorAll('.custom-shop-slide');
    const dotsContainer = document.querySelector('.custom-slider-dots');

    // Состояние
    let currentGroupIndex = 0; // Индекс текущей ГРУППЫ слайдов (0, 1, 2...)
    let slidesPerGroup = 3;    // Сколько слайдов показываем и листаем за раз
    let totalGroups = 0;       // Сколько всего групп
    let slideWidth = 0;        // Ширина одного слайда

    // Drag variables
    let isDragging = false;
    let startPos = 0;
    let currentTranslate = 0;
    let prevTranslate = 0;

    // --- Инициализация и Ресайз ---
    function init() {
        const w = window.innerWidth;

        // Определяем количество слайдов на экране
        if(w <= 600) slidesPerGroup = 1;
        else if(w <= 992) slidesPerGroup = 2;
        else slidesPerGroup = 3;

        // Считаем группы
        totalGroups = Math.ceil(slides.length / slidesPerGroup);

        // Если из-за ресайза мы улетели за пределы, возвращаемся
        if (currentGroupIndex >= totalGroups) currentGroupIndex = totalGroups - 1;
        if (currentGroupIndex < 0) currentGroupIndex = 0;

        slideWidth = container.offsetWidth / slidesPerGroup;

        renderDots();
        setPosition();
    }

    // --- Точки (одна точка на одну ГРУППУ слайдов) ---
    function renderDots() {
        dotsContainer.innerHTML = '';
        // Если группа всего одна, точки можно не показывать (опционально)
        if (totalGroups <= 1) return;

        for(let i=0; i < totalGroups; i++) {
            const dot = document.createElement('div');
            dot.classList.add('custom-dot');
            if(i === currentGroupIndex) dot.classList.add('active');

            dot.onclick = () => {
                currentGroupIndex = i;
                setPosition();
            };
            dotsContainer.appendChild(dot);
        }
    }

    // --- Движение слайдера ---
    function setPosition() {
        // Сдвигаем на (НомерГруппы * ШиринаСлайда * КолВоСлайдовВГруппе)
        currentTranslate = -(currentGroupIndex * slidesPerGroup * slideWidth);

        // Проверка границ (чтобы не уехать в пустоту на последнем неполном слайде)
        const maxTranslate = -((slides.length * slideWidth) - container.offsetWidth);
        if (currentTranslate < maxTranslate) currentTranslate = maxTranslate;
        if (currentTranslate > 0) currentTranslate = 0;

        prevTranslate = currentTranslate;

        track.style.transition = 'transform 0.4s ease-out';
        track.style.transform = `translateX(${currentTranslate}px)`;

        updateDotsActive();
    }

    function updateDotsActive() {
        document.querySelectorAll('.custom-dot').forEach((d, i) => {
            d.classList.toggle('active', i === currentGroupIndex);
        });
    }

    // --- DRAG & DROP Логика ---
    const getX = (e) => e.type.includes('mouse') ? e.pageX : e.touches[0].clientX;

    function start(e) {
        isDragging = true;
        startPos = getX(e);
        track.style.transition = 'none'; // Убираем плавность для прямого управления
        container.style.cursor = 'grabbing';
    }

    function move(e) {
        if (!isDragging) return;
        const currentPosition = getX(e);
        const diff = currentPosition - startPos;
        track.style.transform = `translateX(${prevTranslate + diff}px)`;
    }

    function end(e) {
        if (!isDragging) return;
        isDragging = false;
        container.style.cursor = 'grab';

        const currentPosition = e.type.includes('mouse') ? e.pageX : e.changedTouches[0].clientX;
        const diff = currentPosition - startPos;

        // Порог срабатывания (100px)
        // Листаем целую группу!
        if (diff < -70 && currentGroupIndex < totalGroups - 1) {
            currentGroupIndex++; // Следующая группа
        }
        else if (diff > 70 && currentGroupIndex > 0) {
            currentGroupIndex--; // Предыдущая группа
        }

        setPosition();
    }

    // --- События ---
    container.addEventListener('mousedown', start);
    container.addEventListener('touchstart', start);

    container.addEventListener('mousemove', move);
    container.addEventListener('touchmove', move);

    container.addEventListener('mouseup', end);
    container.addEventListener('mouseleave', end);
    container.addEventListener('touchend', end);

    window.addEventListener('resize', () => {
        // При ресайзе сбрасываем анимацию, чтобы не дергалось
        track.style.transition = 'none';
        init();
    });

    // Старт
    init();
});