<?php /* Smarty version 2.6.11, created on 2025-12-24 22:05:42
         compiled from sfera/tpl/mobile_menu.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'mod', 'sfera/tpl/mobile_menu.tpl', 28, false),)), $this); ?>
<!-- Mobile Menu Overlay -->
<div class="mobile-menu-overlay" id="mobileMenuOverlay"></div>

<!-- Mobile Menu -->
<nav class="mobile-menu" id="mobileMenu">
    <div class="mobile-menu-header">
        <img src="/assets/sfera/img/logo/logo_white.svg" alt="Творческий Центр СФЕРА" height="50">
        <button class="mobile-menu-close" id="mobileMenuClose">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                <path d="M5 5l10 10M15 5l-10 10" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            </svg>
        </button>
    </div>

    <div class="mobile-menu-section">
        <button class="mobile-menu-location">
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
                <path d="M8 1c-2.8 0-5 2.2-5 5 0 3.8 5 9 5 9s5-5.2 5-9c0-2.8-2.2-5-5-5z" stroke="currentColor" stroke-width="1.5"/>
                <circle cx="8" cy="6" r="1.5" fill="currentColor"/>
            </svg>
            <span>Москва</span>
        </button>
    </div>

    <div class="mobile-menu-section">
        <div class="mobile-menu-section-title">Каталог</div>
        <div class="mobile-menu-catalog">
<?php echo smarty_function_mod(array('path' => "sfera/",'mod_name' => 'catalog_menu','tpl' => 'mobile_menu'), $this);?>

        </div>
    </div>


    <div class="mobile-menu-section">
        <div class="mobile-menu-section-title">Разделы</div>
        <div class="mobile-menu-links">

            <a href="/search/?query=Педагогам+детского+сада" class="mobile-menu-link">Педагогам детского сада</a>
            <a href="/search/?query=Руководителям+ДОО" class="mobile-menu-link">Руководителям ДОО</a>
            <a href="/search/?query=Логопедам" class="mobile-menu-link">Логопедам</a>
            <a href="/search/?query=Родителям" class="mobile-menu-link">Родителям</a>
            <a href="/search/?query=Детям" class="mobile-menu-link">Детям</a>
            <a href="/search/?query=Школьникам" class="mobile-menu-link">Школьникам</a>

        </div>
    </div>

    <div class="mobile-menu-section">
        <div class="mobile-menu-section-title">Профиль</div>
        <div class="mobile-menu-links">


<!-- НОВОЕ: проверяем авторизацию -->
           <?php if ($_SESSION['auth_user']): ?>
  <!-- АВТОРИЗОВАН -->
  <a href="/profile" class="mobile-menu-link">
    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
        <circle cx="10" cy="7" r="3" stroke="currentColor" stroke-width="1.5"/>
        <path d="M4 17c0-3 3-5 6-5s6 2 6 5" stroke="currentColor" stroke-width="1.5"/>
    </svg>
    <span><?php echo $_SESSION['auth_user']['phone']; ?>
</span>
  </a>
  <a href="/logout" class="header-action" style="margin-left: 10px;">
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
      <path d="M9 3H7a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h2" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      <polyline points="16 17 21 12 16 7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      <line x1="21" y1="12" x2="9" y2="12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
    </svg>
    <span>Выход</span>
  </a>
<?php else: ?>
  <!-- НЕ АВТОРИЗОВАН -->
  <a href="#" id="login-open-link" class="mobile-menu-link" onclick="openSmsModal(); return false;">
    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
        <circle cx="10" cy="7" r="3" stroke="currentColor" stroke-width="1.5"/>
        <path d="M4 17c0-3 3-5 6-5s6 2 6 5" stroke="currentColor" stroke-width="1.5"/>
    </svg>
    <span>Войти</span>
  </a>
<?php endif; ?>             

            <a href="/orders/" class="mobile-menu-link">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                    <rect x="2" y="5" width="16" height="12" rx="2" stroke="currentColor" stroke-width="1.5"/>
                    <path d="M2 9h16M6 13h6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
                </svg>
                Заказы
            </a>
            <a href="/favorites/" class="mobile-menu-link">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                    <path d="M10 17l-5-5c-1.5-1.5-1.5-4 0-5.5 1.5-1.5 4-1.5 5.5 0l.5.5.5-.5c1.5-1.5 4-1.5 5.5 0 1.5 1.5 1.5 4 0 5.5l-5 5z" stroke="currentColor" stroke-width="1.5"/>
                </svg>
                Избранное
            </a>
        </div>
    </div>
</nav>