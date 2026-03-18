// Timer Countdown
function updateTimer() {
    const timerBlocks = document.querySelectorAll('.timer-block');

    // Set target date (example: tomorrow at midnight)
    const targetDate = new Date();
    targetDate.setDate(targetDate.getDate() + 1);
    targetDate.setHours(0, 0, 0, 0);

    function tick() {
        const now = new Date();
        const diff = targetDate - now;

        if (diff <= 0) {
            return;
        }

        const days = Math.floor(diff / (1000 * 60 * 60 * 24));
        const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((diff % (1000 * 60)) / 1000);

        const values = [
            String(days).padStart(2, '0'),
            String(hours).padStart(2, '0'),
            String(minutes).padStart(2, '0'),
            String(seconds).padStart(2, '0')
        ];

        timerBlocks.forEach((block, index) => {
            const valueElement = block.querySelector('.timer-value');
            if (valueElement && values[index]) {
                valueElement.textContent = values[index];
            }
        });
    }

    tick();
    setInterval(tick, 1000);
}

// Favorite Button Toggle
function setupFavorites() {
    const favoriteButtons = document.querySelectorAll('.product-favorite');

    favoriteButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();

            const svg = button.querySelector('svg path');
            const isFavorite = svg.hasAttribute('fill');

            if (isFavorite) {
                svg.removeAttribute('fill');
                svg.setAttribute('stroke', 'currentColor');
            } else {
                svg.setAttribute('fill', '#ff0080');
                svg.setAttribute('stroke', '#ff0080');
            }
        });
    });
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    updateTimer();
    setupFavorites();

});