<?php /* Smarty version 2.6.11, created on 2025-12-24 22:04:23
         compiled from sfera/main_carousel/main_carousel.tpl */ ?>
<div class="main-carousel-container">
    <div class="main-carousel">
        <button class="carousel-btn carousel-prev" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M15 18l-6-6 6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-track" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
<?php $_from = $this->_tpl_vars['banners']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['bannerLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['bannerLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['banner']):
        $this->_foreach['bannerLoop']['iteration']++;
?>
            <div class="carousel-slide<?php if (($this->_foreach['bannerLoop']['iteration'] <= 1)): ?> active<?php endif; ?>">
                <img src="<?php echo $this->_tpl_vars['banner']['url']; ?>
" alt="<?php if ($this->_tpl_vars['banner']['title']):  echo $this->_tpl_vars['banner']['title'];  else:  echo $this->_tpl_vars['banner']['name'];  endif; ?>">
            </div>
<?php endforeach; endif; unset($_from); ?>
        </div>
        <button class="carousel-btn carousel-next" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M9 18l6-6-6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
        <div class="carousel-dots" data-carousel="<?php echo $this->_tpl_vars['carousel_id']; ?>
">
<?php $_from = $this->_tpl_vars['banners']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['dotLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['dotLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['banner']):
        $this->_foreach['dotLoop']['iteration']++;
?>
            <button class="carousel-dot<?php if (($this->_foreach['dotLoop']['iteration'] <= 1)): ?> active<?php endif; ?>" data-index="<?php echo ($this->_foreach['dotLoop']['iteration']-1); ?>
"></button>
<?php endforeach; endif; unset($_from); ?>
        </div>
    </div>
</div>