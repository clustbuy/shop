~~foreach from=$categories item=category name=catLoop~
<div class="mobile-catalog-item">
    ~~if $category.children|@count > 0~
    <button class="mobile-catalog-toggle">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 3h12a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="currentColor" stroke-width="1.5"/>
            <path d="M7 7h6M7 11h4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
        <span>~~$category.name~</span>
        <svg class="mobile-catalog-arrow" width="16" height="16" viewBox="0 0 16 16" fill="none">
            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </button>
    <div class="mobile-catalog-submenu">
        ~~foreach from=$category.children item=subcategory name=subLoop~
        <div class="mobile-catalog-subitem">
            ~~if $subcategory.children|@count > 0~
            <button class="mobile-catalog-subtoggle">
                <span>~~$subcategory.name~</span>
                <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M5 3l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
            <div class="mobile-catalog-subsubmenu">
                ~~foreach from=$subcategory.children item=subsubcategory~
                <a href="/catalog/~~$subsubcategory.id~/">~~$subsubcategory.name~</a>
                ~~/foreach~
            </div>
            ~~else~
            <button class="mobile-catalog-subtoggle">
                <a href="/catalog/~~$subcategory.id~/">~~$subcategory.name~</a>
                <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M5 3l4 4-4 4" stroke="currentColor" stroke-width="1.5"
                          stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
            ~~/if~
        </div>
        ~~/foreach~
    </div>
    ~~else~
    <a href="/catalog/~~$category.id~/" class="mobile-catalog-toggle">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 3h12a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="currentColor" stroke-width="1.5"/>
            <path d="M7 7h6M7 11h4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
        <span>~~$category.name~</span>
    </a>
    ~~/if~
</div>
~~/foreach~

