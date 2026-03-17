<div class="catalog-section">

    <h1>~~$page_title~~</h1>

    <div class="catalog-header">
        <div class="filters">
            <label>Бренд:</label>
            <select>
                <option>Все</option>
                <option>Ray-Ban</option>
                <option>Oakley</option>
                <option>Lindberg</option>
            </select>
        </div>
        <div class="sort">
            <label>Сортировка:</label>
            <select>
                <option>По умолчанию</option>
                <option>Цена ↑</option>
                <option>Цена ↓</option>
            </select>
        </div>
    </div>

    <div class="products-grid">

    ~~foreach from=$goods item=good~~
        ~~include file="catalog/card.tpl" good=$good~~
    ~~/foreach~~

    </div>

    <div class="pagination-simple">
        <span>1</span> <a href="#">2</a> <a href="#">3</a> … <a href="#">12</a>
    </div>

</div>