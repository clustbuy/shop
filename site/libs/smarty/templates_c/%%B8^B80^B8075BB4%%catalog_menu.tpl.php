<?php /* Smarty version 2.6.11, created on 2025-12-24 22:05:41
         compiled from sfera/catalog_menu/catalog_menu.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'sfera/catalog_menu/catalog_menu.tpl', 9, false),)), $this); ?>
<div class="catalog-main-categories">
<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['catLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['catLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['category']):
        $this->_foreach['catLoop']['iteration']++;
?>
    <a href="/catalog/<?php echo $this->_tpl_vars['category']['id']; ?>
/" class="catalog-category-item" data-category="<?php echo $this->_tpl_vars['category']['id']; ?>
">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
            <path d="M4 3h12a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="currentColor" stroke-width="1.5"/>
            <path d="M7 7h6M7 11h4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
        </svg>
        <span><?php echo $this->_tpl_vars['category']['name']; ?>
</span>
<?php if (count($this->_tpl_vars['category']['children']) > 0): ?>
        <svg class="catalog-arrow" width="16" height="16" viewBox="0 0 16 16" fill="none">
            <path d="M6 4l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
<?php endif; ?>
    </a>
<?php endforeach; endif; unset($_from); ?>
</div>

<div class="catalog-subcategories">
<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['catLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['catLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['category']):
        $this->_foreach['catLoop']['iteration']++;
?>
<?php if (count($this->_tpl_vars['category']['children']) > 0): ?>
    <div class="catalog-subcategory-group" data-subcategory="<?php echo $this->_tpl_vars['category']['id']; ?>
">
        <div class="catalog-subcategory-column">
            <div class="catalog-subcategory-section">
                <h4><?php echo $this->_tpl_vars['category']['name']; ?>
</h4>
<?php $_from = $this->_tpl_vars['category']['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['subLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['subLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['subcategory']):
        $this->_foreach['subLoop']['iteration']++;
?>
<?php if (($this->_foreach['subLoop']['iteration']-1) < 8): ?>
                <a href="/catalog/<?php echo $this->_tpl_vars['subcategory']['id']; ?>
/"><?php echo $this->_tpl_vars['subcategory']['name']; ?>
</a>
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
            </div>
        </div>
<?php if (count($this->_tpl_vars['category']['children']) > 8): ?>
        <div class="catalog-subcategory-column">
            <div class="catalog-subcategory-section">
                <h4>Дополнительные категории</h4>
<?php $_from = $this->_tpl_vars['category']['children']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['subLoop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['subLoop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['subcategory']):
        $this->_foreach['subLoop']['iteration']++;
?>
<?php if (($this->_foreach['subLoop']['iteration']-1) >= 8): ?>
                <a href="/catalog/<?php echo $this->_tpl_vars['subcategory']['id']; ?>
/"><?php echo $this->_tpl_vars['subcategory']['name']; ?>
</a>
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
            </div>
        </div>
<?php endif; ?>
    </div>
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
</div>
