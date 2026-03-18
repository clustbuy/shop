                
<div class="m-nav__catalog">
    <div class="m-catalog js-m-catalog">
        <ul class="m-catalog__list  m-catalog__item-lvl1">

~~foreach from=$c.tree item=i~<li class="m-catalog__item m-catalog__item--has-sub"><a data-id="~~$i.id~" href="/~~$i.name~/" class="m-catalog__link m-catalog__link--icon ~~*js-m-catalog-link*~" style="padding-left: 20px;"><div class="m-catalog__link-icon"><svg class="icon icon-bag-1"><use xmlns:xlink="http://www.w3.org/1999/xlink"></use></svg></div>~~$i.title~</a><ul class="m-catalog__list m-catalog__item-lvl2">~~foreach from=$i.nodes item=j~<li class="m-catalog__item m-catalog__item--has-sub"><a data-id="~~$j.id~" href="/~~$j.name~/" class="m-catalog__link m-catalog__link--icon ~~*js-m-catalog-link*~" style="padding-left: 40px;"><div class="m-catalog__link-icon"><svg class="icon icon-bag-1"><use xmlns:xlink="http://www.w3.org/1999/xlink"></use></svg></div>~~$j.title~</a><ul class="m-catalog__list m-catalog__item-lvl3">~~foreach from=$j.nodes item=l~<li class="m-catalog__item"><a data-id="~~$l.id~" href="/~~$l.name~/" class="m-catalog__link m-catalog__link--icon ~~*js-m-catalog-link*~" style="padding-left: 60px;"><div class="m-catalog__link-icon"><svg class="icon icon-bag-1"><use xmlns:xlink="http://www.w3.org/1999/xlink"></use></svg></div>~~$l.title~</a></li>~~/foreach~</ul></li>~~/foreach~</ul></li>~~/foreach~

        </ul>
    </div>
</div>
