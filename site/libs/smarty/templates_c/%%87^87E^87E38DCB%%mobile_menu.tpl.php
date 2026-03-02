<?php /* Smarty version 2.6.11, created on 2025-12-24 22:05:42
         compiled from sfera/catalog_menu/mobile_menu.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'sfera/catalog_menu/mobile_menu.tpl', 3, false),)), $this); ?>
<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['catLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['catLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['category']):
        $this->_foreach['catLoop']['iteration']++;
?>
<div class="mobile-catalog-item">
<?php if (count($this->_tpl_vars['category']['children']) > 0): ?>
    <button class="mobile-catalog-toggle">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 3h12a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="currentColor" stroke-width="1.5"/>
            <path d="M7 7h6M7 11h4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
        <span><?php echo $this->_tpl_vars['category']['name']; ?>
</span>
        <svg class="mobile-catalog-arrow" width="16" height="16" viewBox="0 0 16 16" fill="none">
            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    </button>
    <div class="mobile-catalog-submenu">
<?php $_from = $this->_tpl_vars['category']['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['subLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['subLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['subcategory']):
        $this->_foreach['subLoop']['iteration']++;
?>
        <div class="mobile-catalog-subitem">
<?php if (count($this->_tpl_vars['subcategory']['children']) > 0): ?>
            <button class="mobile-catalog-subtoggle">
                <span><?php echo $this->_tpl_vars['subcategory']['name']; ?>
</span>
                <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M5 3l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </button>
            <div class="mobile-catalog-subsubmenu">
<?php $_from = $this->_tpl_vars['subcategory']['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['subsubcategory']):
?>
                <a href="/catalog/<?php echo $this->_tpl_vars['subsubcategory']['id']; ?>
/"><?php echo $this->_tpl_vars['subsubcategory']['name']; ?>
</a>
<?php endforeach; endif; unset($_from); ?>
            </div>
<?php else: ?>
            <a href="/catalog/<?php echo $this->_tpl_vars['subcategory']['id']; ?>
/"><?php echo $this->_tpl_vars['subcategory']['name']; ?>
</a>
<?php endif; ?>
        </div>
<?php endforeach; endif; unset($_from); ?>
    </div>
<?php else: ?>
    <a href="/catalog/<?php echo $this->_tpl_vars['category']['id']; ?>
/" class="mobile-catalog-toggle">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 3h12a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="currentColor" stroke-width="1.5"/>
            <path d="M7 7h6M7 11h4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
        <span><?php echo $this->_tpl_vars['category']['name']; ?>
</span>
    </a>
<?php endif; ?>
</div>
<?php endforeach; endif; unset($_from); ?>
