// Triple Carousel functionality
function setupTripleCarousel() {
    const carousels = ['main', 'product', 'promo'];

    carousels.forEach(carouselName => {
        const track = document.querySelector(`.carousel-track[data-carousel="${carouselName}"]`);
        if (!track) return;

        const slides = track.querySelectorAll('.carousel-slide');
        const prevBtn = document.querySelector(`.carousel-prev[data-carousel="${carouselName}"]`);
        const nextBtn = document.querySelector(`.carousel-next[data-carousel="${carouselName}"]`);
        const dots = document.querySelectorAll(`.carousel-dots[data-carousel="${carouselName}"] .carousel-dot`);

        if (slides.length === 0) return;

        let currentIndex = 0;
        let autoplayInterval;

        function showSlide(index) {
            // Ensure index is within bounds
            if (index < 0) index = slides.length - 1;
            if (index >= slides.length) index = 0;

            // Remove active class from all slides
            slides.forEach(slide => slide.classList.remove('active'));

            // Add active class to current slide
            if (slides[index]) {
                slides[index].classList.add('active');
            }

            // Update dots
            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === index);
            });

            currentIndex = index;
        }

        function nextSlide() {
            showSlide(currentIndex + 1);
        }

        function prevSlide() {
            showSlide(currentIndex - 1);
        }

        function startAutoplay() {
            stopAutoplay();
            autoplayInterval = setInterval(nextSlide, 5000);
        }

        function stopAutoplay() {
            if (autoplayInterval) {
                clearInterval(autoplayInterval);
            }
        }

        // Initialize first slide
        showSlide(0);

        // Event listeners for buttons
        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                prevSlide();
                stopAutoplay();
                startAutoplay();
            });
        }

        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                nextSlide();
                stopAutoplay();
                startAutoplay();
            });
        }

        // Event listeners for dots
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                showSlide(index);
                stopAutoplay();
                startAutoplay();
            });
        });

        // Pause autoplay on hover
        track.addEventListener('mouseenter', stopAutoplay);
        track.addEventListener('mouseleave', startAutoplay);

        // Start autoplay
        startAutoplay();
    });
}

// Initialize carousel when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupTripleCarousel);
} else {
    setupTripleCarousel();
}
