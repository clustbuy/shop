// Product Page JavaScript

// Gallery functionality with vertical thumbnails
const thumbnails = document.querySelectorAll('.thumbnail-vertical');
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

// Favorite toggle - Gallery button
const favoriteBtnGallery = document.getElementById('favoriteBtn');
let isFavorite = false;

if (favoriteBtnGallery) {
    favoriteBtnGallery.addEventListener('click', () => {
        isFavorite = !isFavorite;
        favoriteBtnGallery.classList.toggle('active', isFavorite);
        
        // Sync with favorite action button
        const favoriteAction = document.getElementById('favoriteAction');
        if (favoriteAction) {
            favoriteAction.classList.toggle('active', isFavorite);
        }
        
        showNotification(isFavorite ? 'Добавлено в избранное' : 'Удалено из избранного');
    });
}

// Favorite toggle - Action button
const favoriteAction = document.getElementById('favoriteAction');
if (favoriteAction) {
    favoriteAction.addEventListener('click', () => {
        isFavorite = !isFavorite;
        favoriteAction.classList.toggle('active', isFavorite);
        
        // Sync with gallery favorite button
        if (favoriteBtnGallery) {
            favoriteBtnGallery.classList.toggle('active', isFavorite);
        }
        
        showNotification(isFavorite ? 'Добавлено в избранное' : 'Удалено из избранного');
    });
}

// Get product ID from page
const productId = document.querySelector('.btn-add-to-cart[data-product-id]')?.getAttribute('data-product-id') || 
                  document.querySelector('.purchase-sticky-content')?.dataset?.productId || 
                  window.location.pathname.split('/').filter(p => p).pop();

// console.log('Product ID:', productId);

// Quantity selector
const decreaseBtn = document.getElementById('decreaseQty');
const increaseBtn = document.getElementById('increaseQty');
const quantityInput = document.getElementById('quantityInput');
const addToCartBtn = document.querySelector('.btn-add-to-cart[data-product-id]');
const quantitySelector = document.querySelector('.quantity-selector');
const favoriteBtn = document.querySelector('.product-favorite[data-product-id]');

// Load product quantity from cart on page load
function loadProductQuantityFromCart() {
    if (!productId) return;
    
    fetch('/cart/?task=get_cart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'task=get_cart'
    })
    .then(response => response.json())
    .then(data => {
        // console.log('Cart data loaded:', data);
        
        if (data && data.items && data.items[productId]) {
            const cartItem = data.items[productId];
            const quantity = parseInt(cartItem.product_amount) || 1;
            
            // Update quantity input
            if (quantityInput) {
                quantityInput.value = quantity;
            }
            
            // Hide add to cart button and show quantity selector
            if (addToCartBtn && quantitySelector) {
                addToCartBtn.style.display = 'none';
                quantitySelector.style.display = 'flex';
            }
            
            // Update quantity buttons state
            updateQuantityButtons();
        } else {
            // Product not in cart - show add to cart button
            if (addToCartBtn && quantitySelector) {
                addToCartBtn.style.display = 'flex';
                quantitySelector.style.display = 'none';
            }
            
            // Reset quantity to 1
            if (quantityInput) {
                quantityInput.value = 1;
            }
        }
    })
    .catch(error => {
        console.error('Error loading cart:', error);
    });
}

// Update quantity buttons state
function updateQuantityButtons() {
    if (!quantityInput || !decreaseBtn || !increaseBtn) return;
    
    const value = parseInt(quantityInput.value) || 1;
    const max = parseInt(quantityInput.max) || 99;
    
    // Кнопка минус всегда доступна (при количестве 1 будет удалять товар)
    decreaseBtn.disabled = false;
    increaseBtn.disabled = value >= max;
}

// Quantity selector handlers
if (decreaseBtn && increaseBtn && quantityInput) {
    decreaseBtn.addEventListener('click', () => {
        let value = parseInt(quantityInput.value) || 1;
        
        if (value > 1) {
            // Уменьшаем количество
            quantityInput.value = value - 1;
            updateQuantityButtons();
            updateCartItemQuantity(parseInt(quantityInput.value));
        } else if (value === 1) {
            // Удаляем товар из корзины
            removeFromCart();
        }
    });

    increaseBtn.addEventListener('click', () => {
        let value = parseInt(quantityInput.value) || 1;
        const max = parseInt(quantityInput.max) || 99;
        if (value < max) {
            quantityInput.value = value + 1;
            updateQuantityButtons();
            updateCartItemQuantity(parseInt(quantityInput.value));
        }
    });
    
    // Handle manual input change
    quantityInput.addEventListener('change', () => {
        let value = parseInt(quantityInput.value) || 1;
        const max = parseInt(quantityInput.max) || 99;
        
        if (value < 1) value = 1;
        if (value > max) value = max;
        
        quantityInput.value = value;
        updateQuantityButtons();
        updateCartItemQuantity(value);
    });

    // Initial state
    updateQuantityButtons();
}

// Update cart item quantity
function updateCartItemQuantity(quantity) {
    if (!productId) return;
    
    const itemData = {
        guid: productId,
        product_amount: quantity
    };
    
    fetch('/cart/?task=update_item', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'item=' + encodeURIComponent(JSON.stringify(itemData))
    })
    .then(response => response.json())
    .then(data => {
        // console.log('Cart item updated:', data);
        
        // Update cart counter
        if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
            cartCounterViewModel.updateCount(data);
        }
    })
    .catch(error => {
        console.error('Error updating cart item:', error);
    });
}

// Remove product from cart
function removeFromCart() {
    if (!productId) return;
    
    // console.log('=== Removing product from cart ===');
    // console.log('Product ID:', productId);
    
    fetch('/cart/?task=delete_product', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'guid=' + encodeURIComponent(productId)
    })
    .then(response => response.json())
    .then(data => {
        // console.log('Product removed from cart:', data);
        
        // Hide quantity selector and show add to cart button
        if (quantitySelector && addToCartBtn) {
            quantitySelector.style.display = 'none';
            addToCartBtn.style.display = 'flex';
        }
        
        // Reset quantity to 1
        if (quantityInput) {
            quantityInput.value = 1;
        }
        
        // Update cart counter
        if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
            cartCounterViewModel.updateCount(data);
        }
        
        showNotification('Товар удален из корзины');
    })
    .catch(error => {
        console.error('Error removing from cart:', error);
        showNotification('Ошибка при удалении из корзины', 'error');
    });
}

// Add to cart button handler
if (addToCartBtn) {
    addToCartBtn.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        const quantity = quantityInput ? parseInt(quantityInput.value) || 1 : 1;
        
        // console.log('=== Add to cart clicked ===');
        // console.log('Product ID:', productId);
        // console.log('Quantity:', quantity);
        
        // Add animation
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = 'scale(1)';
        }, 150);
        
        // Add to cart via AJAX
        const itemData = {
            guid: productId,
            product_amount: quantity
        };
        
        fetch('/cart/?task=put_item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'item=' + encodeURIComponent(JSON.stringify(itemData))
        })
        .then(response => response.json())
        .then(data => {
            // console.log('Item added to cart:', data);
            
            // Hide add to cart button and show quantity selector
            if (quantitySelector) {
                this.style.display = 'none';
                quantitySelector.style.display = 'flex';
            }
            
            // Update cart counter
            if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                cartCounterViewModel.updateCount(data);
            }
            
            showNotification(`Товар добавлен в корзину (${quantity} шт.)`);
        })
        .catch(error => {
            console.error('Error adding to cart:', error);
            showNotification('Ошибка при добавлении в корзину', 'error');
        });
    });
}

// Favorite button handler (using same logic as catalog)
if (favoriteBtn) {
    const isFavorite = favoriteBtn.classList.contains('favorite-filled') || 
                      favoriteBtn.querySelector('.ag5_6_1-a')?.style.backgroundColor === 'var(--bgAccentPrimary)';
    
    favoriteBtn.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        const isCurrentlyFavorite = this.classList.contains('favorite-filled') || 
                                   this.querySelector('.ag5_6_1-a')?.style.backgroundColor === 'var(--bgAccentPrimary)';
        
        if (isCurrentlyFavorite) {
            removeFromFavorites(productId, this);
        } else {
            addToFavorites(productId, this);
        }
    });
}

// Add to favorites function
function addToFavorites(productId, btn) {
    // console.log('=== Adding to favorites ===');
    // console.log('Product ID:', productId);
    
    fetch('/favorites/?task=add_item', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'product_id=' + encodeURIComponent(productId)
    })
    .then(response => response.json())
    .then(data => {
        // console.log('Item added to favorites:', data);
        
        if (btn) {
            btn.classList.add('favorite-filled');
            const accentDiv = btn.querySelector('.ag5_6_1-a');
            if (accentDiv) {
                accentDiv.style.backgroundColor = 'var(--bgAccentPrimary)';
            }
        }
        
        if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
            favoritesCounterViewModel.updateCount(data);
        }
        
        showNotification('Товар добавлен в избранное');
    })
    .catch(error => {
        console.error('Error adding to favorites:', error);
        showNotification('Ошибка при добавлении в избранное', 'error');
    });
}

// Remove from favorites function
function removeFromFavorites(productId, btn) {
    // console.log('=== Removing from favorites ===');
    // console.log('Product ID:', productId);
    
    fetch('/favorites/?task=remove_item', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'product_id=' + encodeURIComponent(productId)
    })
    .then(response => response.json())
    .then(data => {
        // console.log('Item removed from favorites:', data);
        
        if (btn) {
            btn.classList.remove('favorite-filled');
            const accentDiv = btn.querySelector('.ag5_6_1-a');
            if (accentDiv) {
                accentDiv.style.backgroundColor = 'var(--graphicActionPrimary)';
            }
        }
        
        if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
            favoritesCounterViewModel.updateCount(data);
        }
        
        showNotification('Товар удален из избранного');
    })
    .catch(error => {
        console.error('Error removing from favorites:', error);
        showNotification('Ошибка при удалении из избранного', 'error');
    });
}

// Setup "Buy All" button
function setupBuyAll() {
    const buyAllBtn = document.querySelector('.btn-buy-all[data-product-id]');
    
    if (buyAllBtn) {
        buyAllBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const maxQuantity = parseInt(this.getAttribute('data-max-quantity')) || 99;
            
            // console.log('=== Buy all clicked ===');
            // console.log('Product ID:', productId);
            // console.log('Max quantity:', maxQuantity);
            
            // Set quantity input to maximum
            if (quantityInput) {
                quantityInput.value = maxQuantity;
            }
            
            // Check if product is already in cart
            fetch('/cart/?task=get_cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'task=get_cart'
            })
            .then(response => response.json())
            .then(cartData => {
                const isInCart = cartData && cartData.items && cartData.items[productId];
                
                const itemData = {
                    guid: productId,
                    product_amount: maxQuantity
                };
                
                // Use update_item if product is in cart, put_item if not
                const task = isInCart ? 'update_item' : 'put_item';
                
                return fetch('/cart/?task=' + task, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'item=' + encodeURIComponent(JSON.stringify(itemData))
                });
            })
            .then(response => response.json())
            .then(data => {
                // console.log('All items set in cart:', data);
                
                // Hide add to cart button and show quantity selector
                if (quantitySelector && addToCartBtn) {
                    addToCartBtn.style.display = 'none';
                    quantitySelector.style.display = 'flex';
                }
                
                // Update quantity buttons state
                updateQuantityButtons();
                
                // Update cart counter
                if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                    cartCounterViewModel.updateCount(data);
                }
                
                showNotification(`Количество установлено: ${maxQuantity} шт.`);
            })
            .catch(error => {
                console.error('Error setting all items:', error);
                showNotification('Ошибка при установке количества', 'error');
            });
        });
    }
}

// Load product quantity from cart on page load
loadProductQuantityFromCart();

// Setup buy all button
setupBuyAll();

// Delivery tabs
const deliveryTabs = document.querySelectorAll('.delivery-tab');
const deliveryTabContents = document.querySelectorAll('.delivery-tab-content');

deliveryTabs.forEach(tab => {
    tab.addEventListener('click', () => {
        const tabId = tab.dataset.tab;
        
        // Remove active from all tabs
        deliveryTabs.forEach(t => t.classList.remove('active'));
        deliveryTabContents.forEach(c => c.classList.remove('active'));
        
        // Add active to clicked tab
        tab.classList.add('active');
        const content = document.getElementById(tabId);
        if (content) {
            content.classList.add('active');
        }
    });
});

// Product tabs functionality
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
        const pane = document.getElementById(tabId);
        if (pane) {
            pane.classList.add('active');
        }
        
        // Scroll to tabs section on mobile
        if (window.innerWidth < 768) {
            document.querySelector('.product-tabs').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    });
});

// Review helpful button
const helpfulBtns = document.querySelectorAll('.helpful-btn');

helpfulBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const countSpan = btn.parentElement.querySelector('.helpful-count');
        if (countSpan) {
            const currentCount = parseInt(countSpan.textContent);
            countSpan.textContent = currentCount + 1;
        }
        
        btn.disabled = true;
        btn.style.opacity = '0.6';
        btn.style.cursor = 'not-allowed';
        showNotification('Спасибо за отзыв!');
    });
});

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

// Review filters
const filterBtns = document.querySelectorAll('.filter-btn');

filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
    });
});

// Show all characteristics button
const showAllCharsBtn = document.querySelector('.show-all-chars');
if (showAllCharsBtn) {
    showAllCharsBtn.addEventListener('click', () => {
        // Switch to characteristics tab
        const specsTab = document.querySelector('[data-tab="specs"]');
        if (specsTab) {
            specsTab.click();
        }
    });
}

// Meta action buttons
const metaActionBtns = document.querySelectorAll('.meta-action-btn');
metaActionBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const text = btn.textContent.trim();
        showNotification(text === 'В сравнение' ? 'Товар добавлен в сравнение' : 'Ссылка скопирована');
    });
});

// Load more reviews button
const loadMoreReviewsBtn = document.querySelector('.load-more-reviews');
if (loadMoreReviewsBtn) {
    loadMoreReviewsBtn.addEventListener('click', () => {
        showNotification('Загружаем еще отзывы...');
        // Simulate loading
        setTimeout(() => {
            showNotification('Больше отзывов не найдено');
        }, 1000);
    });
}

// Ask question button
const askQuestionBtn = document.querySelector('.btn-ask-question');
if (askQuestionBtn) {
    askQuestionBtn.addEventListener('click', () => {
        showNotification('Функция в разработке');
    });
}

// Delivery change address buttons
const changeAddressBtns = document.querySelectorAll('.delivery-change-address');
changeAddressBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        showNotification('Выбор адреса доставки');
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
        animation: 'slideIn 0.3s ease',
        maxWidth: '320px'
    });
    
    document.body.appendChild(notification);
    
    // Remove after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => notification.remove(), 300);
    }, 3000);
}

// Add animation keyframes (only if not already added)
(function() {
    const existingStyle = document.getElementById('product-page-animations');
    if (existingStyle) return;
    
    const productStyle = document.createElement('style');
    productStyle.id = 'product-page-animations';
    productStyle.textContent = `
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
    document.head.appendChild(productStyle);
})();

// Image zoom on hover (desktop only)
if (window.innerWidth > 768 && mainImage) {
    const galleryMain = document.querySelector('.gallery-main');
    
    if (galleryMain) {
        galleryMain.addEventListener('mouseenter', () => {
            mainImage.style.transition = 'transform 0.3s ease';
        });
        
        galleryMain.addEventListener('mousemove', (e) => {
            const rect = galleryMain.getBoundingClientRect();
            const x = ((e.clientX - rect.left) / rect.width - 0.5) * 100;
            const y = ((e.clientY - rect.top) / rect.height - 0.5) * 100;
            
            mainImage.style.transform = `scale(2) translate(${-x}px, ${-y}px)`;
        });
        
        galleryMain.addEventListener('mouseleave', () => {
            mainImage.style.transform = 'scale(1) translate(0, 0)';
        });
    }
}

// Smooth scroll for rating links
const ratingLinks = document.querySelectorAll('.rating-reviews, .rating-questions');
ratingLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        const targetId = link.getAttribute('href').substring(1);
        const targetTab = document.querySelector(`[data-tab="${targetId}"]`);
        if (targetTab) {
            targetTab.click();
            setTimeout(() => {
                document.querySelector('.product-tabs').scrollIntoView({ 
                    behavior: 'smooth', 
                    block: 'start' 
                });
            }, 100);
        }
    });
});

// console.log('Product page loaded successfully');