// Catalog Page JavaScript

// Sample product data
const products = [
    {
        id: 1,
        title: 'Смартфон Apple iPhone 13 128GB',
        price: 54990,
        oldPrice: 79990,
        discount: 31,
        image: 'https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg',
        rating: 4.8,
        reviews: 2345,
        badge: 'sale',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 2,
        title: 'Беспроводные наушники TWS Bluetooth 5.0',
        price: 599,
        oldPrice: 1299,
        discount: 54,
        image: 'https://ir.ozone.ru/s3/multimedia-1-g/wc300/8013967072.jpg',
        rating: 4.6,
        reviews: 1892,
        badge: 'price',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 3,
        title: 'Умные часы Smart Watch фитнес-браслет',
        price: 2490,
        oldPrice: 4990,
        discount: 50,
        image: 'https://ir.ozone.ru/s3/multimedia-1-6/wc300/7784859930.jpg',
        rating: 4.7,
        reviews: 3124,
        badge: 'sale',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 4,
        title: 'Портативная колонка Bluetooth JBL стиль',
        price: 1299,
        oldPrice: 2990,
        discount: 57,
        image: 'https://ir.ozone.ru/s3/multimedia-1-2/wc300/7726240838.jpg',
        rating: 4.5,
        reviews: 876,
        badge: 'price',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 5,
        title: 'Клавиатура игровая механическая RGB',
        price: 3990,
        oldPrice: 7990,
        discount: 50,
        image: 'https://ir.ozone.ru/s3/multimedia-1-9/wc300/7813067157.jpg',
        rating: 4.9,
        reviews: 1567,
        badge: 'sale',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 6,
        title: 'Мышь беспроводная компьютерная USB',
        price: 799,
        oldPrice: 1890,
        discount: 58,
        image: 'https://ir.ozone.ru/s3/multimedia-1-b/wc300/8139888227.jpg',
        rating: 4.4,
        reviews: 654,
        badge: 'price',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 7,
        title: 'Power Bank 20000 mAh быстрая зарядка',
        price: 1490,
        oldPrice: 2990,
        discount: 50,
        image: 'https://ir.ozone.ru/s3/multimedia-z/wc300/6743553551.jpg',
        rating: 4.6,
        reviews: 892,
        badge: 'sale',
        seller: 'ТЦ СФЕРА'
    },
    {
        id: 8,
        title: 'Смартфон Samsung Galaxy A54 256GB',
        price: 32990,
        oldPrice: 44990,
        discount: 27,
        image: 'https://ir.ozone.ru/s3/multimedia-1-g/wc300/7518239728.jpg',
        rating: 4.7,
        reviews: 1234,
        badge: 'sale',
        seller: 'ТЦ СФЕРА'
    }
];

// Render products
function renderProducts(productsToRender = products) {
    const grid = document.getElementById('productsGrid');
    grid.innerHTML = '';

    productsToRender.forEach(product => {
        const card = createProductCard(product);
        grid.appendChild(card);
    });

    updateResultsCount(productsToRender.length);
}

// Create product card
function createProductCard(product) {
    const card = document.createElement('article');
    card.className = 'product-card';
    card.dataset.productId = product.id;

    const badgeClass = product.badge === 'sale' ? 'badge-sale' : 'badge-price';
    const badgeText = product.badge === 'sale' ? 'Распродажа 11.11' : 'Цена что надо';
    const badgeIcon = product.badge === 'sale' ? '<svg width="12" height="12" viewBox="0 0 12 12" fill="none"><path d="M6 2l1.5 3 3.5.5-2.5 2.5.5 3.5L6 10l-3 1.5.5-3.5L1 5.5l3.5-.5L6 2z" fill="currentColor"/></svg>' : '';

    card.innerHTML = `
        <button class="product-favorite" data-product-id="${product.id}">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
            </svg>
        </button>
        <div class="product-image">
            <span class="product-badge ${badgeClass}">
                ${badgeIcon}
                ${badgeText}
            </span>
            <img src="${product.image}" alt="${product.title}">
        </div>
        <div class="product-info">
            <div class="product-price">
                <span class="price-current">${product.price.toLocaleString('ru-RU')} ₽</span>
                <span class="price-original">${product.oldPrice.toLocaleString('ru-RU')} ₽</span>
                <span class="price-discount">-${product.discount}%</span>
            </div>
            <h3 class="product-title">${product.title}</h3>
            <div class="product-rating">
                <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                </svg>
                <span class="rating-value">${product.rating}</span>
                <span class="rating-reviews">(${product.reviews.toLocaleString('ru-RU')})</span>
            </div>
            <div class="product-seller">
                <span class="seller-badge">${product.seller}</span>
            </div>
        </div>
    `;

    // Navigate to product page on card click
    card.addEventListener('click', (e) => {
        if (!e.target.closest('.product-favorite')) {
            window.location.href = '/product/123456/';
        }
    });

    return card;
}

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

// Favorite toggle
document.addEventListener('click', (e) => {
    const favoriteBtn = e.target.closest('.product-favorite');
    if (favoriteBtn) {
        e.stopPropagation();
        favoriteBtn.classList.toggle('active');

        const productId = favoriteBtn.dataset.productId;
        const isFavorite = favoriteBtn.classList.contains('active');

        showNotification(isFavorite ? 'Добавлено в избранное' : 'Удалено из избранного');
    }
});

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
    let sortedProducts = [...products];

    switch (sortType) {
        case 'price_asc':
            sortedProducts.sort((a, b) => a.price - b.price);
            break;
        case 'price_desc':
            sortedProducts.sort((a, b) => b.price - a.price);
            break;
        case 'rating':
            sortedProducts.sort((a, b) => b.rating - a.rating);
            break;
        case 'discount':
            sortedProducts.sort((a, b) => b.discount - a.discount);
            break;
        default:
            // popular - default order
            break;
    }

    renderProducts(sortedProducts);
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

// Initialize
renderProducts();

console.log('Catalog page loaded successfully');