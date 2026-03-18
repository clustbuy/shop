<div class="catalog-main-categories">
~~foreach from=$categories item=category name=catLoop~
    <a href="/catalog/~~$category.id~/" class="catalog-category-item" data-category="~~$category.id~">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 3h12a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="currentColor" stroke-width="1.5"/>
            <path d="M7 7h6M7 11h4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
        <span>~~$category.name~</span>
~~if $category.children|@count > 0~
        <svg class="catalog-arrow" width="16" height="16" viewBox="0 0 16 16" fill="none">
            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
~~/if~
    </a>
~~/foreach~
</div>

<div class="catalog-subcategories">
~~foreach from=$categories item=category name=catLoop~
~~if $category.children|@count > 0~
    <div class="catalog-subcategory-group" data-subcategory="~~$category.id~">
        <div class="catalog-subcategory-column">
            <div class="catalog-subcategory-section">
                <h4>~~$category.name~</h4>
~~foreach from=$category.children item=subcategory name=subLoop~
~~if $smarty.foreach.subLoop.index < 8~
                <a href="/catalog/~~$subcategory.id~/">~~$subcategory.name~</a>
~~/if~
~~/foreach~
            </div>
        </div>
~~if $category.children|@count > 8~
        <div class="catalog-subcategory-column">
            <div class="catalog-subcategory-section">
                <h4>Дополнительные категории</h4>
~~foreach from=$category.children item=subcategory name=subLoop~
~~if $smarty.foreach.subLoop.index >= 8~
                <a href="/catalog/~~$subcategory.id~/">~~$subcategory.name~</a>
~~/if~
~~/foreach~
            </div>
        </div>
~~/if~
    </div>
~~/if~
~~/foreach~
</div>

