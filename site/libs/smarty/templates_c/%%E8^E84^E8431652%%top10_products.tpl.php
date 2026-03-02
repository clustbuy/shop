<?php /* Smarty version 2.6.11, created on 2025-12-24 22:04:25
         compiled from sfera/top10_products/top10_products.tpl */ ?>
<!-- TOP-10 Slider Block -->
<section class="top10-slider-section">
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">ТОП-10</h2>
            <div class="slider-navigation">
                <button class="slider-nav-btn slider-prev-btn" aria-label="Предыдущий">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                        <path d="M12 16l-6-6 6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
                <button class="slider-nav-btn slider-next-btn" aria-label="Следующий">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                        <path d="M8 16l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </button>
            </div>
        </div>

        <div class="top10-slider-container">
            <div class="top10-slider-wrapper">
                <div class="top10-slider-track">
<?php $_from = $this->_tpl_vars['products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['top10Loop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['top10Loop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['product']):
        $this->_foreach['top10Loop']['iteration']++;
?>
                    <a href="/product/<?php echo $this->_tpl_vars['product']['product_id']; ?>
/" class="top10-product-card">
                        <div class="top10-product-image-container">
                            <span class="top10-rank-badge"><?php echo $this->_foreach['top10Loop']['iteration']; ?>
</span>

                            <img src="/import_files/<?php echo $this->_tpl_vars['product']['product_id']; ?>
b.jpg" alt="<?php echo $this->_tpl_vars['product']['product_name']; ?>
">
                        </div>
                        <div class="top10-product-info">
                            <h3 class="top10-product-title"><?php echo $this->_tpl_vars['product']['product_name']; ?>
</h3>
<?php if ($this->_tpl_vars['product']['rating'] || $this->_tpl_vars['product']['reviews']): ?>
                            <div class="top10-product-rating">
                                <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                                    <path d="M7 1l1.5 3 3.5.5-2.5 2.5.5 3.5L7 9l-3 1.5.5-3.5L2 4.5l3.5-.5L7 1z" fill="#FFCC00"/>
                                </svg>
<?php if ($this->_tpl_vars['product']['rating']): ?>
                                <span class="top10-rating-value"><?php echo $this->_tpl_vars['product']['rating']; ?>
</span>
<?php endif; ?>
<?php if ($this->_tpl_vars['product']['reviews']): ?>
                                <span class="top10-rating-reviews">(<?php echo $this->_tpl_vars['product']['reviews']; ?>
)</span>
<?php endif; ?>
                            </div>
<?php endif; ?>
<?php if ($this->_tpl_vars['product']['price_current'] || $this->_tpl_vars['product']['price_original']): ?>
                            <div class="top10-product-price">
<?php if ($this->_tpl_vars['product']['price_current']): ?>
                                <span class="top10-price-current"><?php echo $this->_tpl_vars['product']['price_current']; ?>
 ₽</span>
<?php endif; ?>
<?php if ($this->_tpl_vars['product']['price_original']): ?>
                                <span class="top10-price-original"><?php echo $this->_tpl_vars['product']['price_original']; ?>
 ₽</span>
<?php endif; ?>
<?php if ($this->_tpl_vars['product']['price_discount']): ?>
                                <span class="top10-price-discount"><?php echo $this->_tpl_vars['product']['price_discount']; ?>
</span>
<?php endif; ?>
                            </div>
<?php endif; ?>
                        </div>
                    </a>
<?php endforeach; endif; unset($_from); ?>
                </div>
            </div>
        </div>
    </div>
</section>
