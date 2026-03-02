<?php /* Smarty version 2.6.11, created on 2025-12-24 22:04:24
         compiled from sfera/promo_carousel/promo_carousel.tpl */ ?>
<div class="promo-carousel-container">
    <div class="promo-carousel">
        <button class="carousel-btn carousel-prev small" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M10 12l-4-4 4-4" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-track" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
<?php $_from = $this->_tpl_vars['promos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['promoLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['promoLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['promo']):
        $this->_foreach['promoLoop']['iteration']++;
?>
            <div class="carousel-slide<?php if (($this->_foreach['promoLoop']['iteration'] <= 1)): ?> active<?php endif; ?>">
                <div class="promo-mini-card" style="background: <?php echo $this->_tpl_vars['promo']['background']; ?>
;">
                    <div class="promo-mini-content">
                        <h4><?php echo $this->_tpl_vars['promo']['title']; ?>
</h4>
                        <p><?php echo $this->_tpl_vars['promo']['subtitle']; ?>
</p>
                    </div>
                </div>
            </div>
<?php endforeach; endif; unset($_from); ?>
        </div>
        <button class="carousel-btn carousel-next small" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M6 12l4-4-4-4" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-dots small" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
<?php $_from = $this->_tpl_vars['promos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['dotLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['dotLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['promo']):
        $this->_foreach['dotLoop']['iteration']++;
?>
            <button class="carousel-dot<?php if (($this->_foreach['dotLoop']['iteration'] <= 1)): ?> active<?php endif; ?>" data-index="<?php echo ($this->_foreach['dotLoop']['iteration']-1); ?>
"></button>
<?php endforeach; endif; unset($_from); ?>
        </div>
    </div>
</div>