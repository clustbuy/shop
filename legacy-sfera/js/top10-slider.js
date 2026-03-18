// TOP-10 Slider functionality
document.addEventListener('DOMContentLoaded', function() {
    const slider = document.querySelector('.top10-slider-track');
    if (!slider) return;

    const prevBtn = document.querySelector('.slider-prev-btn');
    const nextBtn = document.querySelector('.slider-next-btn');
    const cards = document.querySelectorAll('.top10-product-card');
    
    if (cards.length === 0) return;

    let currentIndex = 0;

    // Get current gap from computed styles
    function getCurrentGap() {
        const computedStyle = window.getComputedStyle(slider);
        const gap = computedStyle.gap || computedStyle.columnGap;
        return parseFloat(gap) || 16;
    }

    // Get card width including gap
    function getSlideStep() {
        const cardWidth = cards[0].offsetWidth;
        const gap = getCurrentGap();
        return cardWidth + gap;
    }

    // Calculate max index based on visible cards
    function getMaxIndex() {
        const containerWidth = slider.parentElement.offsetWidth;
        const cardWidth = cards[0].offsetWidth;
        const gap = getCurrentGap();
        
        // Calculate visible cards: (containerWidth + gap) / (cardWidth + gap)
        const visibleCards = Math.floor((containerWidth + gap) / (cardWidth + gap));
        
        // Max index = total cards - visible cards
        return Math.max(0, cards.length - visibleCards);
    }

    function updateSliderPosition() {
        const slideStep = getSlideStep();
        const offset = -(currentIndex * slideStep);
        slider.style.transform = `translateX(${offset}px)`;
        updateButtons();
    }

    function updateButtons() {
        const maxIndex = getMaxIndex();
        
        if (prevBtn) {
            prevBtn.disabled = currentIndex === 0;
        }
        
        if (nextBtn) {
            nextBtn.disabled = currentIndex >= maxIndex;
        }
    }

    function slideNext() {
        const maxIndex = getMaxIndex();
        if (currentIndex < maxIndex) {
            currentIndex++;
            updateSliderPosition();
        }
    }

    function slidePrev() {
        if (currentIndex > 0) {
            currentIndex--;
            updateSliderPosition();
        }
    }

    // Event listeners
    if (nextBtn) {
        nextBtn.addEventListener('click', slideNext);
    }

    if (prevBtn) {
        prevBtn.addEventListener('click', slidePrev);
    }

    // Favorite button functionality
    const favoriteButtons = document.querySelectorAll('.top10-favorite-btn');
    favoriteButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            this.classList.toggle('active');
        });
    });

    // Handle window resize
    let resizeTimer;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            // Reset to valid position on resize
            const maxIndex = getMaxIndex();
            if (currentIndex > maxIndex) {
                currentIndex = maxIndex;
            }
            updateSliderPosition();
        }, 250);
    });

    // Initial setup
    updateButtons();

    // Touch/Swipe support for mobile
    let touchStartX = 0;
    let touchEndX = 0;

    slider.addEventListener('touchstart', function(e) {
        touchStartX = e.changedTouches[0].screenX;
    }, { passive: true });

    slider.addEventListener('touchend', function(e) {
        touchEndX = e.changedTouches[0].screenX;
        handleSwipe();
    }, { passive: true });

    function handleSwipe() {
        const swipeThreshold = 50;
        const diff = touchStartX - touchEndX;

        if (Math.abs(diff) > swipeThreshold) {
            if (diff > 0) {
                // Swipe left - next
                slideNext();
            } else {
                // Swipe right - prev
                slidePrev();
            }
        }
    }

    console.log('TOP-10 Slider initialized with', cards.length, 'products');
});