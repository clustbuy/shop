
<nav class="secondary-nav">
~~foreach from=$menu_items item=item~
~~if $item.submenu~
    <div class="secondary-nav-dropdown">
        <button class="secondary-nav-dropdown-trigger">
            ~~$item.title~
            <svg width="12" height="12" viewBox="0 0 12 12" fill="none">
                <path d="M3 4.5l3 3 3-3" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
            </svg>
        </button>
        <div class="secondary-nav-dropdown-menu">
~~foreach from=$item.submenu item=subitem~
            <a href="~~$subitem.link~">~~$subitem.title~</a>
~~/foreach~
        </div>
    </div>
~~else~
    <a href="~~$item.link~">~~$item.title~</a>
~~/if~
~~/foreach~
</nav>


