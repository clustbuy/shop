<?php /* Smarty version 2.6.11, created on 2025-11-27 17:50:22
         compiled from sfera/authors/authors.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'count', 'sfera/authors/authors.tpl', 36, false),array('modifier', 'urlencode', 'sfera/authors/authors.tpl', 43, false),)), $this); ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторы - Творческий Центр СФЕРА</title>
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
        <a href="/catalog/">Каталог</a>
        <span>/</span>
        <span>Авторы</span>
    </div>
</div>

<!-- Authors Page -->
<main class="catalog-page">
    <div class="container">
        <div class="catalog-header">
            <h1>Авторы</h1>
            <p class="catalog-description">Список всех авторов в алфавитном порядке</p>
        </div>

        <div class="authors-list">
<?php if (count($this->_tpl_vars['groupedAuthors']) > 0): ?>
<?php $_from = $this->_tpl_vars['groupedAuthors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['letter'] => $this->_tpl_vars['authorsInGroup']):
?>
            <div class="authors-group">
                <h2 class="authors-letter"><?php echo $this->_tpl_vars['letter']; ?>
</h2>
                <div class="authors-grid">
<?php $_from = $this->_tpl_vars['authorsInGroup']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['author']):
?>
                    <div class="author-item">
                        <a href="/authors/<?php echo ((is_array($_tmp=$this->_tpl_vars['author']['name'])) ? $this->_run_mod_handler('urlencode', true, $_tmp) : urlencode($_tmp)); ?>
/" class="author-link">
                            <span class="author-name"><?php echo $this->_tpl_vars['author']['name']; ?>
</span>
                            <span class="author-count">(<?php echo $this->_tpl_vars['author']['count']; ?>
 книг)</span>
                        </a>
                    </div>
<?php endforeach; endif; unset($_from); ?>
                </div>
            </div>
<?php endforeach; endif; unset($_from); ?>
<?php else: ?>
            <p>Авторы не найдены.</p>
<?php endif; ?>
        </div>
    </div>
</main>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "sfera/tpl/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>
