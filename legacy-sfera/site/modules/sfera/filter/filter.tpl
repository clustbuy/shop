<!-- Sidebar Filters -->
<aside class="catalog-sidebar">
    <form method="POST" action="~~$action_url~" id="catalogFiltersForm">
    <div class="sidebar-header">
        <h2>Отбор среди всей продукции</h2>
        <button class="btn-reset-filters" id="resetFilters" type="button">Сбросить все</button>
    </div>

    <!-- Author Filter -->
    <div class="filter-group">
        <h3 class="filter-title">Автор</h3>
        <div class="filter-search">
            <input type="text" placeholder="Поиск автора" id="authorSearch">
            <div class="author-suggestions" id="authorSuggestions"></div>
        </div>
        <div class="filter-options" id="authorList">
            ~~foreach from=$authors item=author~
            <label class="filter-checkbox">
                <input type="checkbox" value="~~$author.name~" name="author[]" ~~if $author.name|in_array:$filter_authors~checked~~/if~>
                <span>~~$author.name~</span>
                <span class="filter-count">(~~$author.count~)</span>
            </label>
            ~~/foreach~
        </div>
        <a target="_blank" href="/authors/" class="btn-show-more">Показать еще</a>
    </div>

    <!-- Age Filter -->
    <div class="filter-group">
        <h3 class="filter-title">Возраст</h3>
        <div class="filter-options">
            ~~if $ages|@count > 0~
            ~~foreach from=$ages item=age~
            <label class="filter-checkbox">
                <input type="checkbox" value="~~$age.value~" name="age[]" ~~if $age.value|in_array:$filter_ages~checked~~/if~>
                <span>~~$age.value~</span>
                <span class="filter-count">(~~$age.count~)</span>
            </label>
            ~~/foreach~
            ~~else~
            <p>Возрасты не найдены.</p>
            ~~/if~
        </div>
    </div>

    <!-- Series Filter -->
    <div class="filter-group">
        <h3 class="filter-title">Серия</h3>
        <div class="filter-options" id="seriesList">
            ~~foreach from=$series item=serie~
            <label class="filter-checkbox">
                <input type="checkbox" value="~~$serie.name~" name="seriya[]" ~~if $serie.name|in_array:$filter_series~checked~~/if~>
                <span>~~$serie.name~</span>
                <span class="filter-count">(~~$serie.count~)</span>
            </label>
            ~~/foreach~
        </div>
        <a target="_blank" href="/series/" class="btn-show-more">Показать еще</a>
    </div>

    <!-- Product Type Filter -->
    <div class="filter-group">
        <h3 class="filter-title">Тип товара</h3>
        <div class="filter-options" id="productTypeList">
            ~~foreach from=$product_types item=product_type~
            <label class="filter-checkbox">
                <input type="checkbox" value="~~$product_type.name~" name="product_type[]" ~~if $product_type.name|in_array:$filter_product_types~checked~~/if~>
                <span>~~$product_type.name~</span>
                <span class="filter-count">(~~$product_type.count~)</span>
            </label>
            ~~/foreach~
        </div>
        <a target="_blank" href="/product_types/" class="btn-show-more">Показать еще</a>
    </div>

    <!-- Topic Filter -->
    <div class="filter-group">
        <h3 class="filter-title">Тематика</h3>
        <div class="filter-options" id="topicList">
            ~~foreach from=$topics item=topic~
            <label class="filter-checkbox">
                <input type="checkbox" value="~~$topic.name~" name="topic[]" ~~if $topic.name|in_array:$filter_topics~checked~~/if~>
                <span>~~$topic.name~</span>
                <span class="filter-count">(~~$topic.count~)</span>
            </label>
            ~~/foreach~
        </div>
        <a target="_blank" href="/topics/" class="btn-show-more">Показать еще</a>
    </div>

    <button type="submit" class="btn-apply-filters" id="applyFilters">Применить</button>
    </form>
</aside>

