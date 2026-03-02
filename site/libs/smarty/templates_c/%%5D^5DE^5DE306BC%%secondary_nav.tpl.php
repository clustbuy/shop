<?php /* Smarty version 2.6.11, created on 2025-12-24 22:05:42
         compiled from sfera/secondary_nav/secondary_nav.tpl */ ?>
<nav class="secondary-nav">
<?php $_from = $this->_tpl_vars['menu_items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
 if ($this->_tpl_vars['item']['submenu']): ?>
    <div class="secondary-nav-dropdown">
        <button class="secondary-nav-dropdown-trigger">
            <?php echo $this->_tpl_vars['item']['title']; ?>

            <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                <path d="M3 4.5l3 3 3-3" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="secondary-nav-dropdown-menu">
<?php $_from = $this->_tpl_vars['item']['submenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['subitem']):
?>
            <a href="<?php echo $this->_tpl_vars['subitem']['link']; ?>
"><?php echo $this->_tpl_vars['subitem']['title']; ?>
</a>
<?php endforeach; endif; unset($_from); ?>
        </div>
    </div>
<?php else: ?>
    <a href="<?php echo $this->_tpl_vars['item']['link']; ?>
"><?php echo $this->_tpl_vars['item']['title']; ?>
</a>
<?php endif;  endforeach; endif; unset($_from); ?>
</nav>

