~~if $TPL == 'd'~
<div class="create-group-buy-container">
    <h1>Создание групповой покупки</h1>
    
    <form action="/group_buy/create" method="POST" class="create-group-form">
        <div class="form-group">
            <label for="product_id">Выберите товар:</label>
            <select name="product_id" id="product_id" required>
                <option value="">Выберите товар</option>
                ~~foreach from=$products item=product~
                <option value="~~$product.id~" 
                        data-price="~~$product.price~"
                        data-min-order="~~$product.min_order~">
                    ~~$product.name~ (~~$product.price~ ₽)
                </option>
                ~~/foreach~
            </select>
        </div>
        
        <div class="form-group">
            <label for="min_participants">Минимальное количество участников:</label>
            <input type="number" name="min_participants" id="min_participants" 
                   min="2" max="100" required>
            <small>Минимум 2 участника</small>
        </div>
        
        <div class="form-group">
            <label for="group_price">Групповая цена (₽):</label>
            <input type="number" name="group_price" id="group_price" 
                   min="0" step="0.01" required>
            <small>Должна быть меньше обычной цены</small>
        </div>
        
        <div class="form-group">
            <label for="end_date">Дата окончания:</label>
            <input type="datetime-local" name="end_date" id="end_date" required>
            <small>Минимум 24 часа от текущего момента</small>
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn btn-primary">Создать групповую покупку</button>
            <a href="/group_buy" class="btn btn-link">Отмена</a>
        </div>
    </form>
</div>
~~else~
<div class="create-group-buy-container-mobile">
    <h2>Создание групповой покупки</h2>
    
    <form action="/group_buy/create" method="POST" class="create-group-form-mobile">
        <div class="form-group-mobile">
            <label>Товар:</label>
            <select name="product_id" required>
                <option value="">Выберите товар</option>
                ~~foreach from=$products item=product~
                <option value="~~$product.id~" 
                        data-price="~~$product.price~"
                        data-min-order="~~$product.min_order~">
                    ~~$product.name~ (~~$product.price~ ₽)
                </option>
                ~~/foreach~
            </select>
        </div>
        
        <div class="form-group-mobile">
            <label>Участников:</label>
            <input type="number" name="min_participants" 
                   min="2" max="100" required>
            <small>Минимум 2</small>
        </div>
        
        <div class="form-group-mobile">
            <label>Групповая цена:</label>
            <input type="number" name="group_price" 
                   min="0" step="0.01" required>
            <small>Меньше обычной цены</small>
        </div>
        
        <div class="form-group-mobile">
            <label>Дата окончания:</label>
            <input type="datetime-local" name="end_date" required>
            <small>Минимум 24 часа</small>
        </div>
        
        <div class="form-actions-mobile">
            <button type="submit" class="btn-mobile primary">Создать</button>
            <a href="/group_buy" class="btn-mobile">Отмена</a>
        </div>
    </form>
</div>
~~/if~

<script>
document.addEventListener('DOMContentLoaded', function() {
    const productSelect = document.getElementById('product_id');
    const groupPriceInput = document.getElementById('group_price');
    const minParticipantsInput = document.getElementById('min_participants');
    const endDateInput = document.getElementById('end_date');
    
    // Установка минимальной даты окончания
    const minDate = new Date();
    minDate.setHours(minDate.getHours() + 24);
    endDateInput.min = minDate.toISOString().slice(0, 16);
    
    // Обработка выбора товара
    productSelect.addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        const price = selectedOption.dataset.price;
        const minOrder = selectedOption.dataset.minOrder;
        
        if (price) {
            groupPriceInput.max = price;
            groupPriceInput.value = Math.round(price * 0.9); // 10% скидка по умолчанию
        }
        
        if (minOrder) {
            minParticipantsInput.min = minOrder;
            minParticipantsInput.value = minOrder;
        }
    });
    
    // Валидация групповой цены
    groupPriceInput.addEventListener('input', function() {
        const selectedOption = productSelect.options[productSelect.selectedIndex];
        const price = selectedOption.dataset.price;
        
        if (this.value >= price) {
            this.setCustomValidity('Групповая цена должна быть меньше обычной');
        } else {
            this.setCustomValidity('');
        }
    });
});
</script> 