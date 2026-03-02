<?php /* Smarty version 2.6.11, created on 2025-11-30 21:39:15
         compiled from sfera/catalog/catalog.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'sfera/catalog/catalog.tpl', 163, false),)), $this); ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Творческий Центр СФЕРА Интернет-магазин</title>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/favicon.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <link rel="stylesheet" href="/assets/sfera/styles.css">
    <link rel="stylesheet" href="/assets/sfera/css/header.css">
    <link rel="stylesheet" href="/assets/sfera/css/catalog.css">

</head>
<body>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/mobile_menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <a href="/">Главная</a>
        <span>/</span>
<?php if ($this->_tpl_vars['search_query']): ?>
        <a href="/search/">Поиск</a>
        <span>/</span>
        <span><?php echo $this->_tpl_vars['search_query']; ?>
</span>
<?php else: ?>
        <a href="/catalog/">Каталог</a>
<?php if ($this->_tpl_vars['category']['id']): ?>
        <span>/</span>
        <span><?php echo $this->_tpl_vars['category']['name']; ?>
</span>
<?php endif; ?>
<?php endif; ?>
    </div>
</div>

<!-- Catalog Page -->
<main class="catalog-page">
    <div class="container">
        <div class="catalog-layout">
            <!-- Sidebar Filters -->
            <aside class="catalog-sidebar">
                <div class="sidebar-header">
                    <h2>Отбор среди всей продукции</h2>
                    <button class="btn-reset-filters" id="resetFilters">Сбросить все</button>
                </div>

                <!-- Author Filter -->
                <div class="filter-group">
                    <h3 class="filter-title">Автор</h3>
                    <div class="filter-search">
                        <input type="text" placeholder="Поиск автора" id="authorSearch">
                    </div>
                    <div class="filter-options" id="authorList">
<?php $_from = $this->_tpl_vars['authors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['author']):
?>
                        <label class="filter-checkbox">
                            <input type="checkbox" value="<?php echo $this->_tpl_vars['author']['name']; ?>
" name="author[]">
                            <span><?php echo $this->_tpl_vars['author']['name']; ?>
</span>
                            <span class="filter-count">(<?php echo $this->_tpl_vars['author']['count']; ?>
)</span>
                        </label>
<?php endforeach; endif; unset($_from); ?>
                    </div>
                    <a href="/authors/" class="btn-show-more">Показать еще</a>
                </div>

                <!-- Rating Filter -->
                <div class="filter-group">
                    <h3 class="filter-title">Рейтинг</h3>
                    <div class="filter-options">
                        <label class="filter-checkbox">
                            <input type="checkbox" value="5">
                            <span class="rating-option">
                                    <svg width="14" height="14" viewBox="0 0 14 14" fill="#FFCC00">
                                        <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 5.5l3.5-.5L7 1z"/>
                                    </svg>
                                    5
                                </span>
                        </label>
                        <label class="filter-checkbox">
                            <input type="checkbox" value="4">
                            <span class="rating-option">
                                    <svg width="14" height="14" viewBox="0 0 14 14" fill="#FFCC00">
                                        <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 5.5l3.5-.5L7 1z"/>
                                    </svg>
                                    от 4
                                </span>
                        </label>
                        <label class="filter-checkbox">
                            <input type="checkbox" value="3">
                            <span class="rating-option">
                                    <svg width="14" height="14" viewBox="0 0 14 14" fill="#FFCC00">
                                        <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 5.5l3.5-.5L7 1z"/>
                                    </svg>
                                    от 3
                                </span>
                        </label>
                    </div>
                </div>

                <!-- Delivery Filter -->
                <div class="filter-group">
                    <h3 class="filter-title">Доставка</h3>
                    <div class="filter-options">
                        <label class="filter-checkbox">
                            <input type="checkbox" value="tomorrow">
                            <span>Завтра</span>
                        </label>
                        <label class="filter-checkbox">
                            <input type="checkbox" value="free">
                            <span>Бесплатная доставка</span>
                        </label>
                    </div>
                </div>

                <button class="btn-apply-filters">Применить фильтры</button>
            </aside>

            <!-- Main Content -->
            <div class="catalog-content">
                <!-- Toolbar -->
                <div class="catalog-toolbar">
                    <div class="toolbar-left">
<?php if ($this->_tpl_vars['search_query']): ?>
                        <h1>Результаты поиска: "<?php echo $this->_tpl_vars['search_query']; ?>
"</h1>
<?php else: ?>
                        <h1><?php echo $this->_tpl_vars['category']['name']; ?>
</h1>
<?php endif; ?>
                        <span class="results-count" id="resultsCount">Найдено <?php echo $this->_tpl_vars['total']; ?>
 товаров</span>
                    </div>
                    <div class="toolbar-right">
                        <button class="btn-filters-mobile" id="showFiltersMobile">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M2 5h16M5 10h10M8 15h4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                            Фильтры
                        </button>
                        <select class="sort-select" id="sortSelect">
                            <option value="popular">Популярное</option>
                            <option value="price_asc">Сначала дешевые</option>
                            <option value="price_desc">Сначала дорогие</option>
                            <option value="rating">По рейтингу</option>
                            <option value="discount">По скидке</option>
                        </select>
                        <div class="view-toggle">
                            <button class="view-btn active" data-view="grid">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                    <rect x="2" y="2" width="7" height="7" stroke="currentColor" stroke-width="1.5"/>
                                    <rect x="11" y="2" width="7" height="7" stroke="currentColor" stroke-width="1.5"/>
                                    <rect x="2" y="11" width="7" height="7" stroke="currentColor" stroke-width="1.5"/>
                                    <rect x="11" y="11" width="7" height="7" stroke="currentColor" stroke-width="1.5"/>
                                </svg>
                            </button>
                            <button class="view-btn" data-view="list">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                    <path d="M2 5h16M2 10h16M2 15h16" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Products Grid -->
                <div class="products-grid" id="productsGrid">
<?php if (count($this->_tpl_vars['products']) > 0): ?>
<?php $_from = $this->_tpl_vars['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['product']):
?>
                    <article class="product-card">
                        <button class="product-favorite">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M10 17l-6-6c-2-2-2-5 0-7 2-2 5-2 7 0l.5.5.5-.5c2-2 5-2 7 0 2 2 2 5 0 7l-6 6z" stroke="currentColor" stroke-width="1.5"/>
                            </svg>
                        </button>
                        <a href="/product/<?php echo $this->_tpl_vars['product']['id']; ?>
/" class="product-link">
                            <div class="product-image">
                                <img src="/import_files/<?php echo $this->_tpl_vars['product']['id']; ?>
b.jpg" alt="<?php echo $this->_tpl_vars['product']['name']; ?>
">
                            </div>
                            <div class="product-info">
                                <h3 class="product-title"><?php echo $this->_tpl_vars['product']['name']; ?>
</h3>
<?php if ($this->_tpl_vars['product']['price']): ?>
                                <div class="product-price">
                                    <span class="price-current"><?php echo $this->_tpl_vars['product']['price']; ?>
 ₽</span>
                                </div>
<?php endif; ?>
                            </div>
                        </a>
                    </article>
<?php endforeach; endif; unset($_from); ?>
<?php else: ?>
                    <div class="no-products">
                        <p>Товары не найдены</p>
                    </div>
<?php endif; ?>
                </div>

                <!-- Pagination -->
<?php if ($this->_tpl_vars['pages'] > 1): ?>
                <div class="pagination">
<?php if ($this->_tpl_vars['hasPrevGroup']): ?>
<?php if ($this->_tpl_vars['search_query']): ?>
                    <a href="/search/?query=<?php echo $this->_tpl_vars['search_query']; ?>
&page=<?php echo $this->_tpl_vars['prevGroupEnd']; ?>
" class="pagination-btn">
<?php else: ?>
                    <a href="/catalog/<?php if ($this->_tpl_vars['category']['id']):  echo $this->_tpl_vars['category']['id']; ?>
/<?php endif; ?>?page=<?php echo $this->_tpl_vars['prevGroupEnd']; ?>
" class="pagination-btn">
<?php endif; ?>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M10 4l-4 4 4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </a>
<?php else: ?>
                    <button class="pagination-btn" disabled>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M10 4l-4 4 4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </button>
<?php endif; ?>
<?php $this->assign('pagesInGroup', $this->_tpl_vars['endPage']-$this->_tpl_vars['startPage']+1); ?>
<?php unset($this->_sections['pageLoop']);
$this->_sections['pageLoop']['name'] = 'pageLoop';
$this->_sections['pageLoop']['loop'] = is_array($_loop=$this->_tpl_vars['pagesInGroup']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['pageLoop']['show'] = true;
$this->_sections['pageLoop']['max'] = $this->_sections['pageLoop']['loop'];
$this->_sections['pageLoop']['step'] = 1;
$this->_sections['pageLoop']['start'] = $this->_sections['pageLoop']['step'] > 0 ? 0 : $this->_sections['pageLoop']['loop']-1;
if ($this->_sections['pageLoop']['show']) {
    $this->_sections['pageLoop']['total'] = $this->_sections['pageLoop']['loop'];
    if ($this->_sections['pageLoop']['total'] == 0)
        $this->_sections['pageLoop']['show'] = false;
} else
    $this->_sections['pageLoop']['total'] = 0;
if ($this->_sections['pageLoop']['show']):

            for ($this->_sections['pageLoop']['index'] = $this->_sections['pageLoop']['start'], $this->_sections['pageLoop']['iteration'] = 1;
                 $this->_sections['pageLoop']['iteration'] <= $this->_sections['pageLoop']['total'];
                 $this->_sections['pageLoop']['index'] += $this->_sections['pageLoop']['step'], $this->_sections['pageLoop']['iteration']++):
$this->_sections['pageLoop']['rownum'] = $this->_sections['pageLoop']['iteration'];
$this->_sections['pageLoop']['index_prev'] = $this->_sections['pageLoop']['index'] - $this->_sections['pageLoop']['step'];
$this->_sections['pageLoop']['index_next'] = $this->_sections['pageLoop']['index'] + $this->_sections['pageLoop']['step'];
$this->_sections['pageLoop']['first']      = ($this->_sections['pageLoop']['iteration'] == 1);
$this->_sections['pageLoop']['last']       = ($this->_sections['pageLoop']['iteration'] == $this->_sections['pageLoop']['total']);
?>
<?php $this->assign('pageNum', $this->_tpl_vars['startPage']+$this->_sections['pageLoop']['index']); ?>
<?php if ($this->_tpl_vars['pageNum'] == $this->_tpl_vars['page']): ?>
                    <button class="pagination-btn active"><?php echo $this->_tpl_vars['pageNum']; ?>
</button>
<?php else: ?>
<?php if ($this->_tpl_vars['search_query']): ?>
                    <a href="/search/?query=<?php echo $this->_tpl_vars['search_query']; ?>
&page=<?php echo $this->_tpl_vars['pageNum']; ?>
" class="pagination-btn"><?php echo $this->_tpl_vars['pageNum']; ?>
</a>
<?php else: ?>
                    <a href="/catalog/<?php if ($this->_tpl_vars['category']['id']):  echo $this->_tpl_vars['category']['id']; ?>
/<?php endif; ?>?page=<?php echo $this->_tpl_vars['pageNum']; ?>
" class="pagination-btn"><?php echo $this->_tpl_vars['pageNum']; ?>
</a>
<?php endif; ?>
<?php endif; ?>
<?php endfor; endif; ?>
<?php if ($this->_tpl_vars['hasNextGroup']): ?>
<?php if ($this->_tpl_vars['search_query']): ?>
                    <a href="/search/?query=<?php echo $this->_tpl_vars['search_query']; ?>
&page=<?php echo $this->_tpl_vars['nextGroupStart']; ?>
" class="pagination-btn">
<?php else: ?>
                    <a href="/catalog/<?php if ($this->_tpl_vars['category']['id']):  echo $this->_tpl_vars['category']['id']; ?>
/<?php endif; ?>?page=<?php echo $this->_tpl_vars['nextGroupStart']; ?>
" class="pagination-btn">
<?php endif; ?>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </a>
<?php else: ?>
                    <button class="pagination-btn" disabled>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    </button>
<?php endif; ?>
                </div>
<?php endif; ?>
            </div>
        </div>
    </div>
</main>


<!-- Mobile Bottom Navigation -->
<nav class="mobile-bottom-nav">
    <a href="/" class="mobile-bottom-nav-item active">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
            <polyline points="9 22 9 12 15 12 15 22"></polyline>
        </svg>
        <span>Главная</span>
    </a>

    <a href="/favorites/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
        </svg>
        <span>Избранное</span>
    </a>

    <a href="/cart/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
        </svg>
        <span>Корзина</span>
        <span class="mobile-nav-badge">3</span>
    </a>

    <a href="/profile/" class="mobile-bottom-nav-item">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
        </svg>
        <span>Профиль</span>
    </a>
</nav>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<script src="/assets/sfera/script.js"></script>
<script src="/assets/sfera/js/header.js"></script>
<script src="/assets/sfera/js/catalog.js"></script>

</body>
</html>