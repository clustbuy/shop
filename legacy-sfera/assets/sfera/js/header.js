// Header JavaScript Functions

// Search functionality
function setupSearch() {
    const searchForm = document.querySelector('.search-bar');
    const searchInput = document.querySelector('.search-input');
    const searchSubmit = document.querySelector('.search-submit');
    const searchSuggestions = document.getElementById('searchSuggestions');
    
    let searchTimeout = null;
    
    if (searchForm) {
        searchForm.addEventListener('submit', (e) => {
            const query = searchInput.value.trim();
            if (!query) {
                e.preventDefault();
                return false;
            }
            // Hide suggestions on submit
            if (searchSuggestions) {
                searchSuggestions.classList.remove('active');
            }
        });
    }
    
    if (searchSubmit) {
        searchSubmit.addEventListener('click', (e) => {
            const query = searchInput.value.trim();
            if (!query) {
                e.preventDefault();
                return false;
            }
            // Hide suggestions on submit
            if (searchSuggestions) {
                searchSuggestions.classList.remove('active');
            }
        });
    }
    
    if (searchInput && searchSuggestions) {
        // AJAX поиск при вводе
        searchInput.addEventListener('input', (e) => {
            const query = searchInput.value.trim();
            
            // Очищаем предыдущий таймаут
            if (searchTimeout) {
                clearTimeout(searchTimeout);
            }
            
            // Если запрос меньше 2 символов, скрываем список
            if (query.length < 2) {
                searchSuggestions.classList.remove('active');
                searchSuggestions.innerHTML = '';
                return;
            }
            
            // Задержка перед отправкой запроса (debounce)
            searchTimeout = setTimeout(() => {
                fetchSearchSuggestions(query);
            }, 300);
        });
        
        // Скрываем список при потере фокуса (с небольшой задержкой для клика)
        searchInput.addEventListener('blur', () => {
            setTimeout(() => {
                searchSuggestions.classList.remove('active');
            }, 200);
        });
        
        // Показываем список при фокусе, если есть результаты
        searchInput.addEventListener('focus', () => {
            if (searchSuggestions.innerHTML.trim() !== '') {
                searchSuggestions.classList.add('active');
            }
        });
        
        // Обработка Enter
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                const query = searchInput.value.trim();
                if (!query) {
                    e.preventDefault();
                    return false;
                }
                // Hide suggestions on submit
                searchSuggestions.classList.remove('active');
            }
        });
    }
    
    // Функция для получения подсказок через AJAX
    function fetchSearchSuggestions(query) {
        if (!query || query.length < 2) {
            return;
        }
        
        // Формируем URL для AJAX запроса
        const url = '/ajax/?task=search_products&query=' + encodeURIComponent(query);
        
        fetch(url)
            .then(response => response.json())
            .then(data => {
                if (data.success && data.rows && data.rows.length > 0) {
                    displaySuggestions(data.rows);
                } else {
                    searchSuggestions.classList.remove('active');
                    searchSuggestions.innerHTML = '';
                }
            })
            .catch(error => {
                console.error('Search error:', error);
                searchSuggestions.classList.remove('active');
            });
    }
    
    // Функция для отображения подсказок
    function displaySuggestions(products) {
        if (!searchSuggestions) return;
        
        let html = '<div class="search-suggestions-list">';
        
        products.forEach(product => {
            html += `<a href="/product/${product.id}/" class="search-suggestion-item">${product.name}</a>`;
        });
        
        html += '</div>';
        
        searchSuggestions.innerHTML = html;
        searchSuggestions.classList.add('active');
    }
}

// Catalog button
function setupCatalog() {
    const catalogButton = document.getElementById('catalogButton');
    const catalogDropdown = document.getElementById('catalogDropdown');
    const catalogOverlay = document.getElementById('catalogOverlay');
    const categoryItems = document.querySelectorAll('.catalog-category-item');
    
    function openCatalog() {
        catalogDropdown.classList.add('active');
        catalogButton.classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    
    function closeCatalog() {
        catalogDropdown.classList.remove('active');
        catalogButton.classList.remove('active');
        document.body.style.overflow = '';
    }
    
    if (catalogButton) {
        catalogButton.addEventListener('click', (e) => {
            e.preventDefault();
            if (catalogDropdown.classList.contains('active')) {
                closeCatalog();
            } else {
                openCatalog();
            }
        });
    }
    
    if (catalogOverlay) {
        catalogOverlay.addEventListener('click', closeCatalog);
    }
    
    // Category hover/click switching
    categoryItems.forEach(item => {
        item.addEventListener('mouseenter', () => {
            // Remove active class from all categories
            categoryItems.forEach(cat => cat.classList.remove('active'));
            
            // Add active class to current category
            item.classList.add('active');
            
            // Get the category data attribute
            const category = item.dataset.category;
            
            // Hide all subcategory groups
            const subcategoryGroups = document.querySelectorAll('.catalog-subcategory-group');
            subcategoryGroups.forEach(group => group.classList.remove('active'));
            
            // Show the corresponding subcategory group
            const targetGroup = document.querySelector(`.catalog-subcategory-group[data-subcategory="${category}"]`);
            if (targetGroup) {
                targetGroup.classList.add('active');
            }
        });
    });
    
    // Close catalog on escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && catalogDropdown.classList.contains('active')) {
            closeCatalog();
        }
    });
}

// Secondary Navigation Dropdown
function setupSecondaryNavDropdown() {
    const dropdowns = document.querySelectorAll('.secondary-nav-dropdown');
    
    dropdowns.forEach(dropdown => {
        const trigger = dropdown.querySelector('.secondary-nav-dropdown-trigger');
        
        // Close all dropdowns
        function closeAllDropdowns() {
            dropdowns.forEach(d => d.classList.remove('active'));
        }
        
        // Toggle dropdown on mouse enter
        dropdown.addEventListener('mouseenter', () => {
            closeAllDropdowns();
            dropdown.classList.add('active');
        });
        
        // Close dropdown on mouse leave
        dropdown.addEventListener('mouseleave', () => {
            dropdown.classList.remove('active');
        });
        
        // Also handle click for mobile/touch devices
        trigger.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            
            const isActive = dropdown.classList.contains('active');
            closeAllDropdowns();
            
            if (!isActive) {
                dropdown.classList.add('active');
            }
        });
    });
    
    // Close dropdowns when clicking outside
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.secondary-nav-dropdown')) {
            dropdowns.forEach(d => d.classList.remove('active'));
        }
    });
}

// Mobile Menu
function setupMobileMenu() {
    const mobileMenuButton = document.getElementById('mobileMenuButton');
    const mobileMenu = document.getElementById('mobileMenu');
    const mobileMenuOverlay = document.getElementById('mobileMenuOverlay');
    const mobileMenuClose = document.getElementById('mobileMenuClose');
    
    function openMenu() {
        mobileMenu.classList.add('active');
        mobileMenuOverlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    }
    
    function closeMenu() {
        mobileMenu.classList.remove('active');
        mobileMenuOverlay.classList.remove('active');
        document.body.style.overflow = '';
    }
    
    if (mobileMenuButton) {
        mobileMenuButton.addEventListener('click', openMenu);
    }
    
    if (mobileMenuClose) {
        mobileMenuClose.addEventListener('click', closeMenu);
    }
    
    if (mobileMenuOverlay) {
        mobileMenuOverlay.addEventListener('click', closeMenu);
    }
    
    // Close menu on escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && mobileMenu.classList.contains('active')) {
            closeMenu();
        }
    });
    
    // Mobile catalog toggle functionality
    setupMobileCatalog();
}

// Mobile Catalog with 3 levels
function setupMobileCatalog() {
    // Level 1 - Main categories
    const catalogToggles = document.querySelectorAll('.mobile-catalog-toggle');
    
    catalogToggles.forEach(toggle => {
        toggle.addEventListener('click', (e) => {
            e.preventDefault();
            const parentItem = toggle.closest('.mobile-catalog-item');
            const isActive = parentItem.classList.contains('active');
            
            // Close all other main categories
            document.querySelectorAll('.mobile-catalog-item').forEach(item => {
                if (item !== parentItem) {
                    item.classList.remove('active');
                    // Also close all subcategories inside
                    item.querySelectorAll('.mobile-catalog-subitem').forEach(subitem => {
                        subitem.classList.remove('active');
                    });
                }
            });
            
            // Toggle current category
            if (isActive) {
                parentItem.classList.remove('active');
                // Close all subcategories
                parentItem.querySelectorAll('.mobile-catalog-subitem').forEach(subitem => {
                    subitem.classList.remove('active');
                });
            } else {
                parentItem.classList.add('active');
            }
        });
    });
    
    // Level 2 - Subcategories
    const subToggles = document.querySelectorAll('.mobile-catalog-subtoggle');
    
    subToggles.forEach(toggle => {
        toggle.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            
            const parentSubitem = toggle.closest('.mobile-catalog-subitem');
            const isActive = parentSubitem.classList.contains('active');
            
            // Close all other subcategories in the same level
            const parentSubmenu = toggle.closest('.mobile-catalog-submenu');
            parentSubmenu.querySelectorAll('.mobile-catalog-subitem').forEach(item => {
                if (item !== parentSubitem) {
                    item.classList.remove('active');
                }
            });
            
            // Toggle current subcategory
            if (isActive) {
                parentSubitem.classList.remove('active');
            } else {
                parentSubitem.classList.add('active');
            }
        });
    });
}

// Initialize header functions on page load
function initHeader() {
    setupSearch();
    setupCatalog();
    setupSecondaryNavDropdown();
    setupMobileMenu();
    
    console.log('Header initialized');
}

// Auto-initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initHeader);
} else {
    initHeader();
}
