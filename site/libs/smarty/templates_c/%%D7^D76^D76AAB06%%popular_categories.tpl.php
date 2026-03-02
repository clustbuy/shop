<?php /* Smarty version 2.6.11, created on 2025-12-24 22:04:24
         compiled from sfera/popular_categories/popular_categories.tpl */ ?>
<!-- Popular Categories Block -->
<section class="popular-categories-section">
    <div class="container">
        <h2 class="section-title">Популярные категории</h2>
        <div class="categories-grid">
<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['category']):
?>
            <a href="/catalog/<?php echo $this->_tpl_vars['category']['guid']; ?>
/" class="category-card">
                <div class="category-image">
<?php if ($this->_tpl_vars['category']['image']): ?>
                    <img src="/<?php echo $this->_tpl_vars['category']['image']; ?>
" alt="<?php echo $this->_tpl_vars['category']['title']; ?>
">
<?php else: ?>
                    <img src="/assets/sfera/img/category-placeholder.jpg" alt="<?php echo $this->_tpl_vars['category']['title']; ?>
">
<?php endif; ?>
                </div>
                <div class="category-label">
                    <h3><?php echo $this->_tpl_vars['category']['title']; ?>
</h3>
                </div>
            </a>
<?php endforeach; endif; unset($_from); ?>
        </div>
    </div>
</section>
