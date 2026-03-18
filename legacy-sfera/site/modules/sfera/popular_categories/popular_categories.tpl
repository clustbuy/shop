<!-- Popular Categories Block -->
<section class="popular-categories-section">
    <div class="container">
        <h2 class="section-title">Популярные категории</h2>
        <div class="categories-grid">
~~foreach from=$categories item=category~
            <a href="/catalog/~~$category.guid~/" class="category-card">
                <div class="category-image">
~~if $category.image~
                    <img src="/~~$category.image~" alt="~~$category.title~">
~~else~
                    <img src="/assets/sfera/img/category-placeholder.jpg" alt="~~$category.title~">
~~/if~
                </div>
                <div class="category-label">
                    <h3>~~$category.title~</h3>
                </div>
            </a>
~~/foreach~
        </div>
    </div>
</section>

