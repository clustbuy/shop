// Product Page JavaScript

// Wait for DOM to be ready
function initProductPage() {
    // Gallery functionality
    const thumbnails = document.querySelectorAll('.thumbnail');
    const mainImage = document.getElementById('mainImage');

    if (thumbnails.length > 0 && mainImage) {
        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', () => {
                // Remove active class from all thumbnails
                thumbnails.forEach(t => t.classList.remove('active'));

                // Add active class to clicked thumbnail
                thumbnail.classList.add('active');

                // Update main image
                const newImage = thumbnail.dataset.image;
                if (newImage) {
                    mainImage.src = newImage;
                }
            });
        });
    }

    // Favorite toggle
    const favoriteBtn = document.getElementById('favoriteBtn');
    if (favoriteBtn) {
        let isFavorite = false;

        favoriteBtn.addEventListener('click', () => {
            isFavorite = !isFavorite;
            favoriteBtn.classList.toggle('active', isFavorite);

            // Show notification
            showNotification(isFavorite ? 'Добавлено в избранное' : 'Удалено из избранного');
        });
    }

    // Variant selection
    const variantOptions = document.querySelectorAll('.variant-option');

    if (variantOptions.length > 0) {
        variantOptions.forEach(option => {
            option.addEventListener('click', () => {
                // Remove active from siblings
                const siblings = option.parentElement.querySelectorAll('.variant-option');
                siblings.forEach(s => s.classList.remove('active'));

                // Add active to clicked option
                option.classList.add('active');
            });
        });
    }

    // Add to cart
    const addToCartBtn = document.getElementById('addToCart');

    if (addToCartBtn) {
        addToCartBtn.addEventListener('click', () => {
            // Add animation
            addToCartBtn.style.transform = 'scale(0.95)';
            setTimeout(() => {
                addToCartBtn.style.transform = 'scale(1)';
            }, 150);

            // Show notification
            showNotification('Товар добавлен в корзину');
        });
    }

    // Tabs functionality
    const tabBtns = document.querySelectorAll('.tab-btn');
    const tabPanes = document.querySelectorAll('.tab-pane');

    if (tabBtns.length > 0) {
        tabBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const tabId = btn.dataset.tab;

                // Remove active from all tabs
                tabBtns.forEach(b => b.classList.remove('active'));
                tabPanes.forEach(p => p.classList.remove('active'));

                // Add active to clicked tab
                btn.classList.add('active');
                const targetPane = document.getElementById(tabId);
                if (targetPane) {
                    targetPane.classList.add('active');
                }
            });
        });
    }

    // Review helpful button
    const helpfulBtns = document.querySelectorAll('.helpful-btn');

    if (helpfulBtns.length > 0) {
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
    }
}

// Mobile sidebar repositioning
function handleSidebarPosition() {
    const sidebar = document.querySelector('.product-purchase-sidebar');
    const productLayout = document.querySelector('.product-layout');
    const container = document.querySelector('.product-page .container');
    const sectionDescription = document.getElementById('section-description');
    
    if (!sidebar || !productLayout || !container) return;
    
    if (window.innerWidth <= 1024) {
        // On mobile: move sidebar to end of container (after all sections)
        if (sidebar.parentElement === productLayout) {
            container.appendChild(sidebar);
            sidebar.classList.add('mobile-repositioned');
        }
    } else {
        // On desktop: move sidebar back to product-layout
        if (sidebar.classList.contains('mobile-repositioned')) {
            productLayout.appendChild(sidebar);
            sidebar.classList.remove('mobile-repositioned');
        }
    }
}

// Run on load
handleSidebarPosition();

// Run on resize
let resizeTimer;
window.addEventListener('resize', () => {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(handleSidebarPosition, 250);
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
function initImageZoom() {
    if (window.innerWidth > 768) {
        const galleryMain = document.querySelector('.gallery-main');
        const mainImage = document.getElementById('mainImage');

        if (galleryMain && mainImage) {
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
    }
}

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        initProductPage();
        initImageZoom();
    });
} else {
    initProductPage();
    initImageZoom();
}

// console.log('Product page loaded successfully');