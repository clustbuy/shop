// Product Page JavaScript

// Gallery functionality
const thumbnails = document.querySelectorAll('.thumbnail');
const mainImage = document.getElementById('mainImage');

thumbnails.forEach(thumbnail => {
    thumbnail.addEventListener('click', () => {
        // Remove active class from all thumbnails
        thumbnails.forEach(t => t.classList.remove('active'));

        // Add active class to clicked thumbnail
        thumbnail.classList.add('active');

        // Update main image
        const newImage = thumbnail.dataset.image;
        mainImage.src = newImage;
    });
});

// Favorite toggle
const favoriteBtn = document.getElementById('favoriteBtn');
let isFavorite = false;

favoriteBtn.addEventListener('click', () => {
    isFavorite = !isFavorite;
    favoriteBtn.classList.toggle('active', isFavorite);

    // Show notification
    showNotification(isFavorite ? 'Добавлено в избранное' : 'Удалено из избранного');
});

// Variant selection
const variantOptions = document.querySelectorAll('.variant-option');

variantOptions.forEach(option => {
    option.addEventListener('click', () => {
        // Remove active from siblings
        const siblings = option.parentElement.querySelectorAll('.variant-option');
        siblings.forEach(s => s.classList.remove('active'));

        // Add active to clicked option
        option.classList.add('active');
    });
});

// Add to cart
const addToCartBtn = document.getElementById('addToCart');

addToCartBtn.addEventListener('click', () => {
    // Add animation
    addToCartBtn.style.transform = 'scale(0.95)';
    setTimeout(() => {
        addToCartBtn.style.transform = 'scale(1)';
    }, 150);

    // Show notification
    showNotification('Товар добавлен в корзину');
});

// Tabs functionality
const tabBtns = document.querySelectorAll('.tab-btn');
const tabPanes = document.querySelectorAll('.tab-pane');

tabBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const tabId = btn.dataset.tab;

        // Remove active from all tabs
        tabBtns.forEach(b => b.classList.remove('active'));
        tabPanes.forEach(p => p.classList.remove('active'));

        // Add active to clicked tab
        btn.classList.add('active');
        document.getElementById(tabId).classList.add('active');
    });
});

// Review helpful button
const helpfulBtns = document.querySelectorAll('.helpful-btn');

helpfulBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const currentText = btn.textContent;
        const match = currentText.match(/\d+/);

        if (match) {
            const count = parseInt(match[0]) + 1;
            btn.innerHTML = btn.innerHTML.replace(/\d+/, count);
        }

        btn.disabled = true;
        btn.style.opacity = '0.6';
        showNotification('Спасибо за отзыв!');
    });
});

// Notification system
function showNotification(message) {
    // Remove existing notification
    const existing = document.querySelector('.notification');
    if (existing) {
        existing.remove();
    }

    // Create notification
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;

    // Style notification
    Object.assign(notification.style, {
        position: 'fixed',
        bottom: '24px',
        right: '24px',
        background: '#0d0d0d',
        color: '#ffffff',
        padding: '16px 24px',
        borderRadius: '8px',
        fontSize: '14px',
        fontWeight: '500',
        zIndex: '10000',
        boxShadow: '0 4px 16px rgba(0, 0, 0, 0.2)',
        animation: 'slideIn 0.3s ease'
    });

    document.body.appendChild(notification);

    // Remove after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => notification.remove(), 300);
    }, 3000);
}

// Add animation keyframes
const style = document.createElement('style');
style.textContent = `
    @keyframes slideIn {
        from {
            transform: translateX(400px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOut {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(400px);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);

// Image zoom on hover (desktop only)
if (window.innerWidth > 768) {
    const galleryMain = document.querySelector('.gallery-main');

    galleryMain.addEventListener('mouseenter', () => {
        mainImage.style.transition = 'transform 0.3s ease';
    });

    galleryMain.addEventListener('mousemove', (e) => {
        const rect = galleryMain.getBoundingClientRect();
        const x = ((e.clientX - rect.left) / rect.width - 0.5) * 20;
        const y = ((e.clientY - rect.top) / rect.height - 0.5) * 20;

        mainImage.style.transform = `scale(1.2) translate(${-x}px, ${-y}px)`;
    });

    galleryMain.addEventListener('mouseleave', () => {
        mainImage.style.transform = 'scale(1) translate(0, 0)';
    });
}

console.log('Product page loaded successfully');