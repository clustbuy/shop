// Catalog Page JavaScript

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

// Sort functionality - redirects to URL with sort parameter
const sortSelect = document.getElementById('sortSelect');

if (sortSelect) {
sortSelect.addEventListener('change', () => {
    const sortType = sortSelect.value;
        const urlParams = new URLSearchParams(window.location.search);
        
        if (sortType && sortType !== 'popular') {
            urlParams.set('sort', sortType);
        } else {
            urlParams.delete('sort');
        }
        
        // Reset to first page when sorting
        urlParams.delete('page');
        
        const newUrl = window.location.pathname + (urlParams.toString() ? '?' + urlParams.toString() : '');
        window.location.href = newUrl;
    });
}

// Mobile filters toggle
const showFiltersMobileBtn = document.getElementById('showFiltersMobile');
const filtersOverlay = document.getElementById('filtersOverlay');
const catalogSidebar = document.querySelector('.catalog-sidebar');

if (showFiltersMobileBtn && catalogSidebar && filtersOverlay) {
    showFiltersMobileBtn.addEventListener('click', () => {
    catalogSidebar.classList.add('active');
    filtersOverlay.classList.add('active');
    document.body.style.overflow = 'hidden';
});

filtersOverlay.addEventListener('click', () => {
    catalogSidebar.classList.remove('active');
    filtersOverlay.classList.remove('active');
    document.body.style.overflow = '';
});
}

// Reset filters
// Setup reset filters button
function setupResetFilters() {
const resetFiltersBtn = document.getElementById('resetFilters');

    if (resetFiltersBtn) {
        resetFiltersBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            // console.log('Reset filters button clicked');
            
            // Uncheck all filter checkboxes
            document.querySelectorAll('input[name="author[]"]').forEach(checkbox => {
                checkbox.checked = false;
            });
            
            document.querySelectorAll('input[name="age[]"]').forEach(checkbox => {
                checkbox.checked = false;
            });
            
            // Navigate to catalog page without filter parameters
            const baseUrl = window.location.pathname;
            // console.log('Redirecting to:', baseUrl);
            window.location.href = baseUrl;
            
            return false;
        });
    }
}

// Price range sync
const priceFrom = document.getElementById('priceFrom');
const priceTo = document.getElementById('priceTo');
const rangeFrom = document.getElementById('rangeFrom');
const rangeTo = document.getElementById('rangeTo');

if (priceFrom && rangeFrom) {
priceFrom.addEventListener('input', () => {
    rangeFrom.value = priceFrom.value;
});
}

if (priceTo && rangeTo) {
priceTo.addEventListener('input', () => {
    rangeTo.value = priceTo.value;
});
}

if (rangeFrom && priceFrom) {
rangeFrom.addEventListener('input', () => {
    priceFrom.value = rangeFrom.value;
});
}

if (rangeTo && priceTo) {
rangeTo.addEventListener('input', () => {
    priceTo.value = rangeTo.value;
});
}

// Brand search
const brandSearch = document.getElementById('brandSearch');
const brandList = document.getElementById('brandList');

if (brandSearch && brandList) {
brandSearch.addEventListener('input', () => {
    const searchTerm = brandSearch.value.toLowerCase();
    const checkboxes = brandList.querySelectorAll('.filter-checkbox');

    checkboxes.forEach(checkbox => {
        const text = checkbox.textContent.toLowerCase();
        checkbox.style.display = text.includes(searchTerm) ? 'flex' : 'none';
    });
});
}

// Author search with autocomplete
function setupAuthorSearch() {
    const authorSearch = document.getElementById('authorSearch');
    const authorSuggestions = document.getElementById('authorSuggestions');
    let authorSearchTimeout = null;
    
    if (!authorSearch) {
        // console.log('Author search input not found');
        return;
    }
    
    if (!authorSuggestions) {
        // console.log('Author suggestions container not found');
        return;
    }
    
    // console.log('Setting up author search...');
    
    // Hide suggestions when clicking outside
    document.addEventListener('click', (e) => {
        if (!authorSearch.contains(e.target) && !authorSuggestions.contains(e.target)) {
            authorSuggestions.classList.remove('active');
            authorSuggestions.innerHTML = '';
        }
    });
    
    // Handle input
    authorSearch.addEventListener('input', (e) => {
        const query = authorSearch.value.trim();
        // console.log('Author search input:', query);
        
        // Clear previous timeout
        if (authorSearchTimeout) {
            clearTimeout(authorSearchTimeout);
        }
        
        // Hide suggestions if query is too short
        if (query.length < 2) {
            authorSuggestions.classList.remove('active');
            authorSuggestions.innerHTML = '';
            return;
        }
        
        // Debounce search
        authorSearchTimeout = setTimeout(() => {
            // console.log('Fetching author suggestions for:', query);
            fetchAuthorSuggestions(query, authorSuggestions);
        }, 300);
    });
    
    // Handle focus
    authorSearch.addEventListener('focus', () => {
        const query = authorSearch.value.trim();
        if (query.length >= 2 && authorSuggestions.innerHTML.trim() !== '') {
            authorSuggestions.classList.add('active');
        }
    });
    
    // Handle blur (with delay to allow click on suggestion)
    authorSearch.addEventListener('blur', () => {
        setTimeout(() => {
            if (!authorSuggestions.matches(':hover')) {
                authorSuggestions.classList.remove('active');
            }
        }, 200);
    });
    
    // console.log('Author search setup complete');
}

// Function to fetch author suggestions via AJAX
function fetchAuthorSuggestions(query, authorSuggestions) {
    if (!query || query.length < 2) {
        return;
    }
    
    const url = '/ajax/?task=search_authors&query=' + encodeURIComponent(query);
    // console.log('Fetching from URL:', url);
    
    fetch(url)
        .then(response => {
            // console.log('Response status:', response.status);
            return response.json();
        })
        .then(data => {
            // console.log('Response data:', data);
            if (data.success && data.rows && data.rows.length > 0) {
                displayAuthorSuggestions(data.rows, authorSuggestions);
            } else {
                authorSuggestions.classList.remove('active');
                authorSuggestions.innerHTML = '';
            }
        })
        .catch(error => {
            console.error('Author search error:', error);
            authorSuggestions.classList.remove('active');
        });
}

// Function to display author suggestions
function displayAuthorSuggestions(authors, authorSuggestions) {
    if (!authorSuggestions) return;
    
    const authorSearch = document.getElementById('authorSearch');
    if (!authorSearch) return;
    
    let html = '<div class="author-suggestions-list">';
    
    authors.forEach(author => {
        const authorName = author.name || '';
        const authorCount = author.count || 0;
        const authorNameEncoded = encodeURIComponent(authorName);
        html += `<div class="author-suggestion-item" data-author="${authorName}">
                    <a href="/author/?author_name=${authorNameEncoded}" class="author-suggestion-link">
                        <span class="author-suggestion-name">${authorName}</span>
                        <span class="author-suggestion-count">(${authorCount})</span>
                    </a>
                 </div>`;
    });
    
    html += '</div>';
    
    authorSuggestions.innerHTML = html;
    authorSuggestions.classList.add('active');
    
    // Links are already in HTML, no need for click handlers
}

// Notification system
function showNotification(message, type = 'success') {
    const existing = document.querySelector('.notification');
    if (existing) {
        existing.remove();
    }

    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    
    // Цвет фона в зависимости от типа
    const bgColor = type === 'error' ? '#ff1744' : (type === 'success' ? '#00a859' : '#0d0d0d');

    Object.assign(notification.style, {
        position: 'fixed',
        bottom: '24px',
        right: '24px',
        background: bgColor,
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

// Apply filters button - now submits form via POST
function setupApplyFilters() {
    const catalogFiltersForm = document.getElementById('catalogFiltersForm');
    
    if (!catalogFiltersForm) {
        // console.log('Catalog filters form not found');
        return;
    }
    
    // console.log('Catalog filters form found, setting up submit handler');
    
    catalogFiltersForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // console.log('Form submit triggered');
        
        // Collect selected filters
        const selectedAuthors = [];
        const selectedAges = [];
        
        // Get selected authors
        const authorCheckboxes = document.querySelectorAll('input[name="author[]"]:checked');
        authorCheckboxes.forEach(checkbox => {
            selectedAuthors.push(checkbox.value);
        });
        
        // Get selected ages
        const ageCheckboxes = document.querySelectorAll('input[name="age[]"]:checked');
        ageCheckboxes.forEach(checkbox => {
            selectedAges.push(checkbox.value);
        });
        
        // console.log('Selected authors:', selectedAuthors);
        // console.log('Selected ages:', selectedAges);
        
        // Remove any existing hidden inputs for filters
        const existingAuthorInputs = catalogFiltersForm.querySelectorAll('input[name="author[]"]');
        existingAuthorInputs.forEach(input => {
            if (input.type === 'hidden') {
                input.remove();
            }
        });
        
        const existingAgeInputs = catalogFiltersForm.querySelectorAll('input[name="age[]"]');
        existingAgeInputs.forEach(input => {
            if (input.type === 'hidden') {
                input.remove();
            }
        });
        
        // Add hidden inputs for selected filters (checkboxes are already in form, but we need to ensure unchecked ones don't submit)
        // Actually, unchecked checkboxes don't submit, so we're good
        // But we need to make sure the form action includes the current category if any
        
        // Submit the form
        // console.log('Submitting form via POST');
        catalogFiltersForm.submit();
        
        return false;
    });
}

// Restore filter state from URL parameters (for GET) or form data (for POST)
function restoreFilterState() {
    const urlParams = new URLSearchParams(window.location.search);
    
    // console.log('Restoring filter state from URL:', window.location.search);
    
    // Restore author filters from URL (проверяем оба варианта: author[] и author)
    const authors = urlParams.getAll('author[]').length > 0 ? urlParams.getAll('author[]') : urlParams.getAll('author');
    // console.log('Authors from URL:', authors);
    
    authors.forEach(author => {
        const decodedAuthor = decodeURIComponent(author);
        // console.log('Looking for author checkbox with value:', decodedAuthor);
        
        // Try to find checkbox by exact value match
        const checkboxes = document.querySelectorAll('input[name="author[]"]');
        checkboxes.forEach(checkbox => {
            if (checkbox.value === decodedAuthor) {
                // console.log('Found matching author checkbox, checking it');
                checkbox.checked = true;
            }
        });
    });
    
    // Restore age filters from URL (проверяем оба варианта: age[] и age)
    const ages = urlParams.getAll('age[]').length > 0 ? urlParams.getAll('age[]') : urlParams.getAll('age');
    // console.log('Ages from URL:', ages);
    
    ages.forEach(age => {
        const decodedAge = decodeURIComponent(age);
        // console.log('Looking for age checkbox with value:', decodedAge);
        
        // Try to find checkbox by exact value match
        const checkboxes = document.querySelectorAll('input[name="age[]"]');
        checkboxes.forEach(checkbox => {
            if (checkbox.value === decodedAge) {
                // console.log('Found matching age checkbox, checking it');
                checkbox.checked = true;
            }
        });
    });
    
    // Update pagination links to preserve filters
    updatePaginationLinks();
}

// Update pagination links to preserve current filters
function updatePaginationLinks() {
    // Не обрабатываем пагинацию на странице хэштегов - там свои правила формирования URL
    if (window.location.pathname.includes('/hashtag/')) {
        // console.log('Skipping pagination update on hashtag page');
        return;
    }
    
    const urlParams = new URLSearchParams(window.location.search);
    // Используем age[] и author[] для правильной передачи массивов
    const authors = urlParams.getAll('author[]').length > 0 ? urlParams.getAll('author[]') : urlParams.getAll('author');
    const ages = urlParams.getAll('age[]').length > 0 ? urlParams.getAll('age[]') : urlParams.getAll('age');
    
    // Get all pagination links
    const paginationLinks = document.querySelectorAll('.pagination a[href*="page="]');
    
    paginationLinks.forEach(link => {
        const href = new URL(link.href, window.location.origin);
        
        // Remove old filter params (оба варианта)
        href.searchParams.delete('author');
        href.searchParams.delete('author[]');
        href.searchParams.delete('age');
        href.searchParams.delete('age[]');
        
        // Add current filter params с использованием []
        authors.forEach(author => {
            href.searchParams.append('author[]', author);
        });
        
        ages.forEach(age => {
            href.searchParams.append('age[]', age);
        });
        
        link.href = href.pathname + href.search;
    });
}

// Setup quantity controls (Ozon style)
function setupQuantityControls() {
    // Log all quantity inputs with their max values
    // console.log('=== Quantity Controls Setup ===');
    document.querySelectorAll('.qty-input').forEach(input => {
        const productId = input.getAttribute('data-product-id');
        const maxValue = input.getAttribute('max');
        // console.log(`Product ${productId}: max quantity = ${maxValue}`);
    });
    // console.log('=== End Quantity Controls Setup ===');
    
    // Handle quantity minus button
    document.querySelectorAll('.qty-minus').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            const productId = this.getAttribute('data-product-id');
            const input = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
            if (input) {
                let value = parseInt(input.value) || 1;
                if (value > 1) {
                    value--;
                    input.value = value;
                    
                    // Обновляем количество в корзине на сервере
                    updateCartItemQuantity(productId, value);
                } else {
                    // If quantity becomes 0, hide quantity control and show add to cart button
                    const quantityControl = document.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
                    const addToCartBtn = document.querySelector(`.btn-add-to-cart[data-product-id="${productId}"]`);
                    if (quantityControl && addToCartBtn) {
                        quantityControl.classList.add('hidden');
                        addToCartBtn.style.display = 'flex';
                    }
                }
            }
        });
    });

    // Handle quantity plus button
    document.querySelectorAll('.qty-plus').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            const productId = this.getAttribute('data-product-id');
            const input = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
            if (input) {
                let value = parseInt(input.value) || 1;
                const maxValue = parseInt(input.getAttribute('max')) || 99;
                // console.log(`Product ${productId}: current=${value}, max=${maxValue}`);
                if (value < maxValue) {
                    value++;
                    input.value = value;
                    // console.log(`Product ${productId}: increased to ${value}`);
                    
                    // Обновляем количество в корзине на сервере
                    updateCartItemQuantity(productId, value);
                } else {
                    // console.log(`Product ${productId}: reached max quantity ${maxValue}`);
                }
            }
        });
    });

    // Handle quantity input change
    document.querySelectorAll('.qty-input').forEach(input => {
        input.addEventListener('change', function() {
            const productId = this.getAttribute('data-product-id');
            let value = parseInt(this.value) || 1;
            const maxValue = parseInt(this.getAttribute('max')) || 99;
            // console.log(`Product ${productId}: input change - value=${value}, max=${maxValue}`);
            if (value < 1) {
                value = 1;
                // console.log(`Product ${productId}: value too low, set to 1`);
            }
            if (value > maxValue) {
                value = maxValue;
                // console.log(`Product ${productId}: value too high, set to max ${maxValue}`);
            }
            this.value = value;
            
            // Обновляем количество в корзине на сервере
            updateCartItemQuantity(productId, value);
        });
    });
}

// Функция обновления количества товара в корзине
function updateCartItemQuantity(productId, quantity) {
    // console.log('=== Updating cart item quantity ===');
    // console.log('Product ID:', productId, 'Quantity:', quantity);
    
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
        // console.log('Cart item quantity updated:', data);
        
        // Обновляем счетчик корзины
        if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
            cartCounterViewModel.updateCount(data);
        }
    })
    .catch(error => {
        console.error('Error updating cart item quantity:', error);
    });
}

// Setup add to cart buttons (Ozon style)
function setupAddToCart() {
    document.querySelectorAll('.btn-add-to-cart').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            const productId = this.getAttribute('data-product-id');
            const quantityControl = document.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
            const qtyInput = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
            const quantity = qtyInput ? parseInt(qtyInput.value) || 1 : 1;
            
            // console.log('=== Add to cart clicked ===');
            // console.log('Product ID:', productId);
            // console.log('Quantity:', quantity);
            
            // Добавляем товар в корзину через AJAX
            addToCart(productId, quantity);
            
            // Hide add to cart button and show quantity control (keep buy all link visible)
            if (quantityControl) {
                this.style.display = 'none';
                quantityControl.classList.remove('hidden');
                if (qtyInput) {
                    qtyInput.value = quantity;
                }
            }
            
            // Show notification
            showNotification(`Товар добавлен в корзину (${quantity} шт.)`);
        });
    });
}

// Функция добавления товара в корзину
function addToCart(productId, quantity) {
    // console.log('=== Adding to cart via AJAX ===');
    // console.log('Product ID:', productId, 'Quantity:', quantity);
    
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
    .then(response => {
        // console.log('Add to cart response status:', response.status);
        return response.json();
    })
    .then(data => {
        // console.log('Item added to cart, response:', data);
        
        // Обновляем счетчик корзины через глобальную ViewModel
        if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
            // console.log('Updating cart counter via ViewModel');
            cartCounterViewModel.updateCount(data);
        } else {
            // console.log('CartCounterViewModel not available yet');
        }
    })
    .catch(error => {
        console.error('Error adding to cart:', error);
    });
}

// Setup buy all buttons
function setupBuyAll() {
    document.querySelectorAll('.btn-buy-all').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            const productId = this.getAttribute('data-product-id');
            const maxQuantity = parseInt(this.getAttribute('data-max-quantity')) || 99;
            const quantityControl = document.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
            const qtyInput = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
            const addToCartBtn = document.querySelector(`.btn-add-to-cart[data-product-id="${productId}"]`);
            
            // console.log('=== Buy all clicked ===');
            // console.log('Product ID:', productId, 'Max quantity:', maxQuantity);
            
            // Set quantity to maximum
            if (qtyInput) {
                qtyInput.value = maxQuantity;
            }
            
            // Используем update_item вместо put_item, чтобы УСТАНОВИТЬ количество, а не добавить
            const itemData = {
                guid: productId,
                product_amount: maxQuantity
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
                // console.log('All items set in cart:', data);
                
                // Обновляем счетчик корзины
                if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                    cartCounterViewModel.updateCount(data);
                }
            })
            .catch(error => {
                console.error('Error setting all items:', error);
            });
            
            // Hide add to cart button and show quantity control (keep buy all link visible)
            if (quantityControl && addToCartBtn) {
                addToCartBtn.style.display = 'none';
                quantityControl.classList.remove('hidden');
            }
            
            // Show notification
            showNotification(`Количество установлено: ${maxQuantity} шт.`);
        });
    });
}

// Функция добавления товара в избранное
function addToFavorites(productId, btn) {
    // console.log('=== Adding to favorites via AJAX ===');
    // console.log('Product ID:', productId);
    
    fetch('/favorites/?task=add_item', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'product_id=' + encodeURIComponent(productId)
    })
    .then(response => {
        // console.log('Add to favorites response status:', response.status);
        return response.json();
    })
    .then(data => {
        // console.log('Item added to favorites, response:', data);
        
        // Обновляем визуальное состояние кнопки
        if (btn) {
            btn.classList.add('favorite-filled');
            btn.setAttribute('title', 'Удалить из избранного');
            const svgPath = btn.querySelector('svg path');
            if (svgPath) {
                svgPath.setAttribute('fill', '#ff0080');
                svgPath.setAttribute('stroke', '#ff0080');
            }
        }
        
        // Обновляем счетчик избранного
        if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
            // console.log('Updating favorites counter via ViewModel');
            favoritesCounterViewModel.updateCount(data);
        } else {
            // console.log('FavoritesCounterViewModel not available yet');
        }
        
        showNotification('Товар добавлен в избранное');
    })
    .catch(error => {
        console.error('Error adding to favorites:', error);
        showNotification('Ошибка при добавлении в избранное', 'error');
    });
}

function removeFromFavorites(productId, btn) {
    // console.log('=== Removing from favorites via AJAX ===');
    // console.log('Product ID:', productId);
    
    fetch('/favorites/?task=remove_item', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'product_id=' + encodeURIComponent(productId)
    })
    .then(response => {
        // console.log('Remove from favorites response status:', response.status);
        return response.json();
    })
    .then(data => {
        // console.log('Item removed from favorites, response:', data);
        
        // Обновляем визуальное состояние кнопки
        if (btn) {
            btn.classList.remove('favorite-filled');
            btn.setAttribute('title', 'Добавить в избранное');
            const svgPath = btn.querySelector('svg path');
            if (svgPath) {
                svgPath.setAttribute('fill', 'none');
                svgPath.setAttribute('stroke', 'currentColor');
            }
        }
        
        // Обновляем счетчик избранного
        if (typeof favoritesCounterViewModel !== 'undefined' && favoritesCounterViewModel !== null) {
            // console.log('Updating favorites counter via ViewModel');
            favoritesCounterViewModel.updateCount(data);
        } else {
            // console.log('FavoritesCounterViewModel not available yet');
        }
        
        showNotification('Товар удален из избранного');
    })
    .catch(error => {
        console.error('Error removing from favorites:', error);
        showNotification('Ошибка при удалении из избранного', 'error');
    });
}

// Setup favorite buttons
function setupFavoriteButtons() {
    // console.log('=== Setting up favorite buttons ===');
    
    // Инициализация - окрашиваем сердечки для товаров, которые уже в избранном
    document.querySelectorAll('.product-favorite.favorite-filled').forEach(btn => {
        const svgPath = btn.querySelector('svg path');
        if (svgPath) {
            svgPath.setAttribute('fill', '#ff0080');
            svgPath.setAttribute('stroke', '#ff0080');
        }
    });
    
    document.querySelectorAll('.product-favorite').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            const productId = this.getAttribute('data-product-id');
            
            // console.log('=== Favorite button clicked ===');
            // console.log('Product ID:', productId);
            
            // Проверяем, уже в избранном или нет (по классу filled)
            const isFavorite = this.classList.contains('favorite-filled');
            
            if (isFavorite) {
                // console.log('Product already in favorites, removing...');
                removeFromFavorites(productId, this);
            } else {
                // console.log('Adding product to favorites...');
                addToFavorites(productId, this);
            }
        });
    });
    
    // console.log('Favorite buttons setup complete. Found:', document.querySelectorAll('.product-favorite').length);
}

// Функция обновления состояния карточек товаров на основе данных корзины
function updateProductCardsFromCart(cartData) {
    // console.log('=== Updating product cards from cart data ===');
    // console.log('Cart data:', cartData);
    
    if (!cartData || !cartData.items) {
        // console.log('No cart data, resetting all cards to "add to cart" state');
        // Если корзина пустая, сбрасываем все карточки к начальному состоянию
        // Обрабатываем как обычные карточки товаров, так и карточки TOP-10
        document.querySelectorAll('.product-card, .top10-product-card').forEach(card => {
            const productId = card.querySelector('[data-product-id]')?.getAttribute('data-product-id');
            if (productId) {
                resetProductCard(productId);
            }
        });
        return;
    }
    
    // Получаем список ID товаров в корзине
    const cartItemIds = Object.keys(cartData.items);
    // console.log('Items in cart:', cartItemIds);
    
    // Проходим по всем карточкам товаров на странице (включая TOP-10)
    document.querySelectorAll('.product-card, .top10-product-card').forEach(card => {
        const productId = card.querySelector('[data-product-id]')?.getAttribute('data-product-id');
        if (!productId) return;
        
        const isInCart = cartItemIds.includes(productId);
        
        if (isInCart) {
            // Товар в корзине - показываем количество
            const cartItem = cartData.items[productId];
            const quantity = cartItem.product_amount || 1;
            
            // console.log(`Product ${productId} is in cart with quantity ${quantity}`);
            
            showProductQuantityControl(productId, quantity);
        } else {
            // Товара нет в корзине - показываем кнопку "В корзину"
            // console.log(`Product ${productId} is NOT in cart`);
            
            resetProductCard(productId);
        }
    });
}

// Функция показа контрола количества для товара
function showProductQuantityControl(productId, quantity) {
    const addToCartBtn = document.querySelector(`.btn-add-to-cart[data-product-id="${productId}"]`);
    const quantityControl = document.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
    const qtyInput = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
    
    if (addToCartBtn && quantityControl && qtyInput) {
        addToCartBtn.style.display = 'none';
        quantityControl.classList.remove('hidden');
        qtyInput.value = quantity;
    }
}

// Функция сброса карточки товара к начальному состоянию (показать "В корзину")
function resetProductCard(productId) {
    const addToCartBtn = document.querySelector(`.btn-add-to-cart[data-product-id="${productId}"]`);
    const quantityControl = document.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
    const qtyInput = document.querySelector(`.qty-input[data-product-id="${productId}"]`);
    
    if (addToCartBtn && quantityControl && qtyInput) {
        addToCartBtn.style.display = 'flex';
        quantityControl.classList.add('hidden');
        qtyInput.value = 1;
    }
}

// Функция загрузки актуального состояния корзины с сервера
function refreshCartState() {
    // console.log('=== Refreshing cart state from server ===');
    
    fetch('/cart/?task=get_cart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    })
    .then(response => response.json())
    .then(data => {
        // console.log('Cart state refreshed:', data);
        
        // Обновляем состояние карточек на основе данных корзины
        updateProductCardsFromCart(data);
        
        // Обновляем счетчик корзины
        if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
            cartCounterViewModel.updateCount(data);
        }
    })
    .catch(error => {
        console.error('Error refreshing cart state:', error);
    });
}

// Отслеживание переключения между вкладками браузера
document.addEventListener('visibilitychange', function() {
    if (!document.hidden) {
        // console.log('=== Tab became visible, refreshing cart state ===');
        refreshCartState();
    }
});

// Setup author search when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        setupAuthorSearch();
        setupApplyFilters();
        setupResetFilters();
        setupQuantityControls();
        setupAddToCart();
        setupBuyAll();
        setupFavoriteButtons();
        restoreFilterState();
    });
} else {
    setupAuthorSearch();
    setupApplyFilters();
    setupResetFilters();
    setupQuantityControls();
    setupAddToCart();
    setupBuyAll();
    setupFavoriteButtons();
    restoreFilterState();
}

// console.log('Catalog page loaded successfully');