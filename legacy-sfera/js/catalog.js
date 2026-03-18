// Catalog Page JavaScript

// Cart state
const cart = {};

// Update results count
function updateResultsCount(count) {
    const resultsCount = document.getElementById('resultsCount');
    resultsCount.textContent = `Найдено ${count.toLocaleString('ru-RU')} ${getProductWord(count)}`;
}

function getProductWord(count) {
    const cases = [2, 0, 1, 1, 1, 2];
    const words = ['товар', 'товара', 'товаров'];
    return words[(count % 100 > 4 && count % 100 < 20) ? 2 : cases[Math.min(count % 10, 5)]];
}

// Add to cart functionality
document.addEventListener('click', (e) => {
    // Add to cart button
    const addToCartBtn = e.target.closest('.btn-add-to-cart');
    if (addToCartBtn) {
        e.stopPropagation();
        const productId = parseInt(addToCartBtn.dataset.productId);
        addToCart(productId, 1);
        return;
    }

    // Quantity controls
    const qtyMinus = e.target.closest('.qty-minus');
    const qtyPlus = e.target.closest('.qty-plus');
    
    if (qtyMinus) {
        e.stopPropagation();
        const productId = parseInt(qtyMinus.dataset.productId);
        updateQuantity(productId, -1);
        return;
    }
    
    if (qtyPlus) {
        e.stopPropagation();
        const productId = parseInt(qtyPlus.dataset.productId);
        updateQuantity(productId, 1);
        return;
    }

    // Favorite toggle
    const favoriteBtn = e.target.closest('.product-favorite');
    if (favoriteBtn) {
        e.stopPropagation();
        favoriteBtn.classList.toggle('active');
        
        const productId = favoriteBtn.dataset.productId;
        const isFavorite = favoriteBtn.classList.contains('active');
        
        showNotification(isFavorite ? 'Добавлено в избранное' : 'Удалено из избранного');
    }
});

// Quantity input change
document.addEventListener('input', (e) => {
    const qtyInput = e.target.closest('.qty-input');
    if (qtyInput) {
        const productId = parseInt(qtyInput.dataset.productId);
        let value = parseInt(qtyInput.value) || 1;
        
        if (value < 1) value = 1;
        if (value > 99) value = 99;
        
        qtyInput.value = value;
        cart[productId] = value;
        updateCartCount();
    }
});

function addToCart(productId, quantity = 1) {
    if (!cart[productId]) {
        cart[productId] = 0;
    }
    cart[productId] += quantity;
    
    // Update UI
    const card = document.querySelector(`[data-product-id="${productId}"]`);
    if (card) {
        const addBtn = card.querySelector('.btn-add-to-cart');
        const qtyControl = card.querySelector('.product-quantity-control');
        const qtyInput = qtyControl?.querySelector('.qty-input');
        
        if (addBtn && qtyControl && qtyInput) {
            addBtn.classList.add('hidden');
            qtyControl.classList.remove('hidden');
            qtyInput.value = cart[productId];
        }
    }
    
    updateCartCount();
    showNotification('Товар добавлен в корзину');
}

function updateQuantity(productId, delta) {
    if (!cart[productId]) {
        cart[productId] = 1;
    }
    
    cart[productId] += delta;
    
    if (cart[productId] < 1) {
        cart[productId] = 0;
        removeFromCart(productId);
        return;
    }
    
    if (cart[productId] > 99) {
        cart[productId] = 99;
    }
    
    // Update input
    const qtyInput = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
    if (qtyInput) {
        qtyInput.value = cart[productId];
    }
    
    updateCartCount();
}

function removeFromCart(productId) {
    delete cart[productId];
    
    // Update UI
    const card = document.querySelector(`[data-product-id="${productId}"]`);
    if (card) {
        const addBtn = card.querySelector('.btn-add-to-cart');
        const qtyControl = card.querySelector('.product-quantity-control');
        
        if (addBtn && qtyControl) {
            addBtn.classList.remove('hidden');
            qtyControl.classList.add('hidden');
        }
    }
    
    updateCartCount();
    showNotification('Товар удален из корзины');
}

function updateCartCount() {
    const totalItems = Object.values(cart).reduce((sum, qty) => sum + qty, 0);
    const cartCountElements = document.querySelectorAll('.cart-count');
    
    cartCountElements.forEach(el => {
        if (totalItems > 0) {
            el.textContent = totalItems;
            el.style.display = 'flex';
        } else {
            el.style.display = 'none';
        }
    });
}

// View toggle
const viewBtns = document.querySelectorAll('.view-btn');
const productsGrid = document.getElementById('productsGrid');

viewBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        viewBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        
        const view = btn.dataset.view;
        if (view === 'list') {
            productsGrid.classList.add('list-view');
        } else {
            productsGrid.classList.remove('list-view');
        }
    });
});

// Sort functionality
const sortSelect = document.getElementById('sortSelect');

sortSelect.addEventListener('change', () => {
    const sortType = sortSelect.value;
    showNotification(`Сортировка: ${sortSelect.options[sortSelect.selectedIndex].text}`);
});

// Mobile filters toggle
const showFiltersMobileBtn = document.getElementById('showFiltersMobile');
const filtersOverlay = document.getElementById('filtersOverlay');
const catalogSidebar = document.querySelector('.catalog-sidebar');

showFiltersMobileBtn?.addEventListener('click', () => {
    catalogSidebar.classList.add('active');
    filtersOverlay.classList.add('active');
    document.body.style.overflow = 'hidden';
});

filtersOverlay.addEventListener('click', () => {
    catalogSidebar.classList.remove('active');
    filtersOverlay.classList.remove('active');
    document.body.style.overflow = '';
});

// Reset filters
const resetFiltersBtn = document.getElementById('resetFilters');

resetFiltersBtn.addEventListener('click', () => {
    document.querySelectorAll('.filter-checkbox input').forEach(input => {
        input.checked = false;
    });
    
    document.getElementById('priceFrom').value = '0';
    document.getElementById('priceTo').value = '100000';
    
    showNotification('Фильтры сброшены');
});

// Price range sync
const priceFrom = document.getElementById('priceFrom');
const priceTo = document.getElementById('priceTo');
const rangeFrom = document.getElementById('rangeFrom');
const rangeTo = document.getElementById('rangeTo');

priceFrom.addEventListener('input', () => {
    rangeFrom.value = priceFrom.value;
});

priceTo.addEventListener('input', () => {
    rangeTo.value = priceTo.value;
});

rangeFrom.addEventListener('input', () => {
    priceFrom.value = rangeFrom.value;
});

rangeTo.addEventListener('input', () => {
    priceTo.value = rangeTo.value;
});

// Brand search
const brandSearch = document.getElementById('brandSearch');
const brandList = document.getElementById('brandList');

brandSearch.addEventListener('input', () => {
    const searchTerm = brandSearch.value.toLowerCase();
    const checkboxes = brandList.querySelectorAll('.filter-checkbox');
    
    checkboxes.forEach(checkbox => {
        const text = checkbox.textContent.toLowerCase();
        checkbox.style.display = text.includes(searchTerm) ? 'flex' : 'none';
    });
});

// Notification system
function showNotification(message) {
    const existing = document.querySelector('.notification');
    if (existing) {
        existing.remove();
    }
    
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    
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
    
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => notification.remove(), 300);
    }, 3000);
}

// Add animation styles
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

console.log('Catalog page loaded successfully');