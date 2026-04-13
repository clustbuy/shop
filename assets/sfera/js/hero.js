const slides = document.querySelectorAll('.hero__slide');
const prevBtn = document.querySelector('.hero__prev');
const nextBtn = document.querySelector('.hero__next');

let current = 0;
let interval;

// показать слайд
function showSlide(index) {
  slides.forEach(slide => {
    slide.classList.remove('hero__slide--active');
  });

  slides[index].classList.add('hero__slide--active');
}

// следующий
function nextSlide() {
  current++;
  if (current >= slides.length) {
    current = 0;
  }
  showSlide(current);
}

// предыдущий
function prevSlide() {
  current--;
  if (current < 0) {
    current = slides.length - 1;
  }
  showSlide(current);
}

// автопрокрутка
function startAutoSlide() {
  interval = setInterval(nextSlide, 4000);
}

function stopAutoSlide() {
  clearInterval(interval);
}

// события
nextBtn.addEventListener('click', () => {
  nextSlide();
  stopAutoSlide();
  startAutoSlide();
});

prevBtn.addEventListener('click', () => {
  prevSlide();
  stopAutoSlide();
  startAutoSlide();
});

// запуск
startAutoSlide();