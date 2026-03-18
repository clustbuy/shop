
<nav id="base-breadcrumbs" aria-label="Breadcrumbs"  class="base-breadcrumbs">
    <div class="base-breadcrumb-container">

        <span><a href="/" itemprop="url" class="base-bc-home" ><span>Каталог</span></a></span>
        ~~foreach from=$breadcrumbs item=b name=breadcrumbs~
        <span class="bc-delimiter">/</span>
        ~~if !$smarty.foreach.breadcrumbs.last~
        <span><a href="/category/~~$b.id~/" itemprop="url" ><span>~~$b.title~</span></a></span>
        ~~else~
        <span><span>~~$b.title~</span></span>
        ~~/if~
        ~~/foreach~

    </div>
</nav>

~~*
<div data-replace-layout-path="[4][0][0][0]" class="d8" data-widget="row">
    <div data-replace-layout-path="[4][0][0][0][0][0]" class="c4" data-widget="column">
        <div data-replace-layout-path="[4][0][0][0][0][0][0][0]" class="ky2 ky4 y4k k6y" style="width:auto;" data-widget="webPdpGrid">

            <div class="" data-widget="breadCrumbs">
                <ol class="e7e">

                    ~~foreach from=$breadcrumbs item=b name=breadcrumbs~
                    <li class="ee8">
                        <a target="_self" href="/category/~~$b.guid~/" class="a5h e9e"><span>~~$b.title~</span></a>
                        ~~if !$smarty.foreach.breadcrumbs.last~
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="13" class="e8e">
                            <path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
                        </svg>
                        ~~/if~
                    </li>
                    ~~/foreach~


                </ol>
            </div>

        </div><div class="d5m" style="height:10px;" data-widget="separator"></div>
    </div>
</div>




<div data-replace-layout-path="[4][0][0][0]" class="e0" data-widget="row">
    <div data-replace-layout-path="[4][0][0][0][0][0]" class="c7" data-widget="column">
        <div data-replace-layout-path="[4][0][0][0][0][0][0][0]" class="p2k p4k pk5 kp7" style="width:auto;" data-widget="webPdpGrid">
            <div class="" data-widget="breadCrumbs">
                <ol class="ei7">


                    ~~foreach from=$breadcrumbs item=b name=breadcrumbs~
                    <li class="e7i">
                        <a target="_self" href="/category/~~$b.guid~/" class="a5g ei8"><span>~~$b.title~</span></a>
                        ~~if !$smarty.foreach.breadcrumbs.last~
                        <svg xmlns="http://www.w3.org/2000/svg" width="10" height="13" class="ie7">
                            <path fill="currentColor" d="M5.293 12.293a1 1 0 1 0 1.414 1.414l5-5a1 1 0 0 0 0-1.414l-5-5a1 1 0 0 0-1.414 1.414L9.586 8l-4.293 4.293Z"></path>
                        </svg>
                        ~~/if~
                    </li>
                    ~~/foreach~

                </ol>
            </div>
        </div><div class="s9d" style="height:10px;" data-widget="separator"></div>
    </div>
</div>
*~