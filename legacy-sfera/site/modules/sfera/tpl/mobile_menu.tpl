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
~~mod path="sfera/" mod_name="catalog_menu" tpl="mobile_menu"~
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

            <!-- User Actions -->
            ~~if $smarty.session.auth_user~
            <!-- Пользователь авторизован -->
            <a href="/profile/" class="mobile-menu-link">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                    <circle cx="10" cy="7" r="3" stroke="currentColor" stroke-width="1.5"/>
                    <path d="M4 17c0-3 3-5 6-5s6 2 6 5" stroke="currentColor" stroke-width="1.5"/>
                </svg>
                Профиль
            </a>
            ~~else~
            <!-- Пользователь НЕ авторизован -->
            <a href="/login/" class="mobile-menu-link">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                    <circle cx="10" cy="7" r="3" stroke="currentColor" stroke-width="1.5"/>
                    <path d="M4 17c0-3 3-5 6-5s6 2 6 5" stroke="currentColor" stroke-width="1.5"/>
                </svg>
                Войти
            </a>
            ~~/if~
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