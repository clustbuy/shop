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

    // console.log('TOP-10 Slider initialized with', cards.length, 'products');
    
    // Функция обновления состояния карточек TOP-10
    function refreshTop10CartState() {
        // Используем общую функцию refreshCartState из catalog.js, если она доступна
        if (typeof refreshCartState === 'function') {
            refreshCartState();
        } else {
            // Если функция refreshCartState недоступна, загружаем состояние корзины напрямую
            fetch('/cart/?task=get_cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (typeof updateProductCardsFromCart === 'function') {
                    updateProductCardsFromCart(data);
                } else {
                    // Если updateProductCardsFromCart недоступна, обновляем карточки TOP-10 напрямую
                    updateTop10CardsFromCart(data);
                }
                // Обновляем счетчик корзины
                if (typeof cartCounterViewModel !== 'undefined' && cartCounterViewModel !== null) {
                    cartCounterViewModel.updateCount(data);
                }
            })
            .catch(error => {
                // console.error('Error refreshing cart state:', error);
            });
        }
    }
    
    // Функция обновления карточек TOP-10 на основе данных корзины (если updateProductCardsFromCart недоступна)
    function updateTop10CardsFromCart(cartData) {
        if (!cartData || !cartData.items) {
            // Если корзина пустая, сбрасываем все карточки TOP-10
            document.querySelectorAll('.top10-product-card').forEach(card => {
                const productId = card.querySelector('[data-product-id]')?.getAttribute('data-product-id');
                if (productId) {
                    resetTop10Card(productId);
                }
            });
            return;
        }
        
        const cartItemIds = Object.keys(cartData.items);
        
        // Проходим по всем карточкам TOP-10
        document.querySelectorAll('.top10-product-card').forEach(card => {
            const productId = card.querySelector('[data-product-id]')?.getAttribute('data-product-id');
            if (!productId) return;
            
            const isInCart = cartItemIds.includes(productId);
            
            if (isInCart) {
                // Товар в корзине - показываем количество
                const cartItem = cartData.items[productId];
                const quantity = cartItem.product_amount || 1;
                showTop10QuantityControl(productId, quantity);
            } else {
                // Товара нет в корзине - показываем кнопку "В корзину"
                resetTop10Card(productId);
            }
        });
    }
    
    // Функция показа контрола количества для карточки TOP-10
    function showTop10QuantityControl(productId, quantity) {
        // Ищем карточку TOP-10, которая содержит элемент с data-product-id
        const cards = document.querySelectorAll('.top10-product-card');
        let targetCard = null;
        for (let i = 0; i < cards.length; i++) {
            const card = cards[i];
            const productElement = card.querySelector(`[data-product-id="${productId}"]`);
            if (productElement) {
                targetCard = card;
                break;
            }
        }
        
        if (!targetCard) return;
        
        const addToCartBtn = targetCard.querySelector(`.btn-add-to-cart[data-product-id="${productId}"]`);
        const quantityControl = targetCard.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
        const qtyInput = targetCard.querySelector(`.qty-input[data-product-id="${productId}"]`);
        
        if (addToCartBtn && quantityControl && qtyInput) {
            addToCartBtn.style.display = 'none';
            quantityControl.classList.remove('hidden');
            qtyInput.value = quantity;
        }
    }
    
    // Функция сброса карточки TOP-10 к начальному состоянию
    function resetTop10Card(productId) {
        // Ищем карточку TOP-10, которая содержит элемент с data-product-id
        const cards = document.querySelectorAll('.top10-product-card');
        let targetCard = null;
        for (let i = 0; i < cards.length; i++) {
            const card = cards[i];
            const productElement = card.querySelector(`[data-product-id="${productId}"]`);
            if (productElement) {
                targetCard = card;
                break;
            }
        }
        
        if (!targetCard) return;
        
        const addToCartBtn = targetCard.querySelector(`.btn-add-to-cart[data-product-id="${productId}"]`);
        const quantityControl = targetCard.querySelector(`.product-quantity-control[data-product-id="${productId}"]`);
        const qtyInput = targetCard.querySelector(`.qty-input[data-product-id="${productId}"]`);
        
        if (addToCartBtn && quantityControl && qtyInput) {
            addToCartBtn.style.display = 'flex';
            quantityControl.classList.add('hidden');
            qtyInput.value = 1;
        }
    }
    
    // Обновление состояния карточек TOP-10 при переключении вкладок
    document.addEventListener('visibilitychange', function() {
        if (!document.hidden) {
            // console.log('=== Tab became visible, refreshing TOP-10 cart state ===');
            refreshTop10CartState();
        }
    });
    
    // Обновление состояния карточек TOP-10 при возврате фокуса на окно
    // Это срабатывает даже если пользователь не переключал вкладки, а просто кликнул на другое окно
    let windowFocusTimeout = null;
    window.addEventListener('focus', function() {
        // Добавляем небольшую задержку, чтобы избежать множественных запросов
        clearTimeout(windowFocusTimeout);
        windowFocusTimeout = setTimeout(function() {
            // console.log('=== Window focused, refreshing TOP-10 cart state ===');
            refreshTop10CartState();
        }, 100);
    });
});