
<div data-widget="breadCrumbs" class="e4h_10">
    <ol class="he2_10 tsBodyControl400Small">

        ~~foreach from=$breadcrumbs item=b name=breadcrumbs~
        <li class="h2e_10">
            <a target="_self" href="/category/~~$b.guid~/" class="a6 he3_10"><span>~~$b.title~</span></a>
            <meta content="~~$b.guid~">
            ~~if !$smarty.foreach.breadcrumbs.last~
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" class="eh3_10">
                <path fill="currentColor" d="M16 12a4 4 0 1 1-8 0 4 4 0 0 1 8 0"></path>
            </svg>
            ~~/if~
        </li>
        ~~/foreach~

    </ol>
</div>