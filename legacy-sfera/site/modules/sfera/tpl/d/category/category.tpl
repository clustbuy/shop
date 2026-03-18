~~*debug*~          
~~*print_r what=$c_data*~          



          ~~*foreach from=$c.tree item=i*~
          
          <div class="catalog js-catalog-~~$i.id~" style="display:block;">
            <div class="catalog__inn">
              <div class="l-wrapper">
                <div class="catalog__content">
                  ~~*<a href="/~~$i.name~/" class="catalog__close close-btn js-catalog-close">Закрыть</a>*~
                  <div class="catalog__title">
                    ~~$menu.current.title~
                  </div>
                  <div class="catalog__content-inn">
                    <div class="catalog__categories">
                      <ul class="categories-menu">

                        

                        ~~foreach from=$menu.tree item=j~~~if $j.id != $c_data.current.id && $j.items_count > 0 ~
                        <li class="categories-menu__item categories-menu__item">
                          <div class="categories-menu__item-inn">

                            
                            <a href="/~~$j.name~/" class="categories-menu__link categories-menu__title">~~$j.title~</a>
                            <div class="categories-menu__count">(~~$j.items_count~)</div>
                            
                          </div>
                        </li>
                        ~~/if~~~/foreach~

                      </ul>
                    </div>


                  </div>
                </div>
              </div>

            </div>
          </div>

          ~~*/foreach*~





<div class="catalog-items__header">
  <div class="catalog-items__header-left">
    <div class="catalog-items__title title h1">
      ~~$c_data.current.title~
    </div>
    <span class="catalog-items__count">(~~$c_data.current.items_count~)</span>
  </div>
  <div class="catalog-items__header-right">
    <div class="catalog-items__actions">

      ~~*

      <div class="catalog-items__actions-filter">
        <button type="button" class="catalog-items__filter-btn btn btn--icon btn--vinous js-catalog-filters-toggle">
          <i  class="ticon ticon-filter "></i>
        </button>
      </div>
      <div class="catalog-items__actions-sort">
        <div class="sort js-sort">
          <div class="sort__inn">
            <div class="sort__label">
              Сортировать:
            </div>
            <div class="sort__value dropdown">
              <div class="sort__item js-dropdown-toggle js-sort-label">
                По популярности <i class="ticon ticon-desc "></i>
              </div>
              <div class="dropdown__block sort__dropdown">
                <ul class="sort__list">
                  <li>
                    <label class="sort__item js-sort-item is-active">
                      <input type="radio" name="sort">
                      <span> По популярности <i  class="ticon ticon-desc "></i> </span></label>
                  </li>
                  <li>
                    <label class="sort__item js-sort-item">
                      <input type="radio" name="sort">
                      <span>По популярности <i  class="ticon ticon-asc "></i> </span></label>
                  </li>
                  <li>
                    <label class="sort__item js-sort-item">
                      <input type="radio" name="sort">
                      <span>По дате <i  class="ticon ticon-desc "></i> </span></label>
                  </li>
                  <li>
                    <label class="sort__item js-sort-item">
                      <input type="radio" name="sort">
                      <span>По дате <i  class="ticon ticon-asc "></i> </span></label>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      *~

      
    </div>
  </div>
</div>


<div class="catalog-items__list">
  ~~assign var="i" value="1"~
  ~~foreach from=$items item=item~

          ~~* // Если id категории товара входит в список id подкатегорий этой категории, то устанавливаем переменную approve_cat в true *~
          ~~in_array what=$item.id_cat where=$nodes var="approve_cat"~


          ~~include file="market/tpl/category/c_item.tpl"~

          ~~assign var="i" value=$i+1~

  ~~foreachelse~
    <h2>Нет товаров</h2>
  ~~/foreach~
</div>



<script>
var Items = ~~$items_json~;
</script>



~~*
<div class="catalog-items__nav">
  <div class="catalog-items__nav-pagination">
    <div class="pager">
      <ul class="pagination">
        ~~foreach from=$pagination.print_pages item=page~
        
          ~~if $page.is_last~
            <li class="pagination__item pagination__item--dots"></li>
          ~~/if~
          
          <li class="pagination__item ~~if $page.is_current~is-active~~/if~ ~~if $page.is_first~is-first~~/if~ ~~if $page.is_last~is-last~~/if~">
            <a href="~~$page.path~" class="pagination__link">~~$page.num~</a>
          </li>
          
          ~~if $page.is_first~
            <li class="pagination__item pagination__item--dots"></li>
          ~~/if~
        
        ~~/foreach~
      </ul>
      <div class="pager__info">
        <div class="pager__info-inn">
          ~~if $pagination.prev~
          <div class="pager__info-btn">
            <a href="~~$pagination.prev.path~" class="prev-btn">Предыдущая</a>
          </div>
          ~~/if~
          <div class="pager__info-total">
            Результаты: ~~$pagination.total_printed_items~ из ~~$pagination.total_items~
          </div>
          ~~if $pagination.next~
          <div class="pager__info-btn">
            <a href="~~$pagination.next.path~" class="next-btn">Следующая</a>
          </div>
          ~~/if~
        </div>
      </div>
    </div>
  </div>
</div>
*~
