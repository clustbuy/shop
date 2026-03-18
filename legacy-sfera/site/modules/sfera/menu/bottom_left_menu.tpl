~~foreach from=$cat_menu item=cm~
<div class="menu-item menu-item-type-custom menu-item-object-custom jet-nav__item-639 jet-nav__item">
    <a href="/category/~~$cm.id~/" class="menu-item-link menu-item-link-depth-0 menu-item-link-top"><span class="jet-nav-link-text">~~$cm.title~</span></a>
</div>
~~/foreach~