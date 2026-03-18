<select  name='product_cat' id='product_cat_984' class='search-select'>
    <option value='1'>Все категории</option>
    ~~foreach from=$search_select_menu item=cm~
    <option class="level-0" value="~~$cm.id~">~~$cm.title~</option>
    ~~foreach from=$cm.childrens item=cs~
    <option class="level-1" value="~~$cs.id~">&nbsp;&nbsp;&nbsp;~~$cs.title~</option>
    ~~/foreach~
    ~~/foreach~
</select>
