<html lang="ru">

~~include file="market/tpl/`$smarty.const.TPL`/index/head.tpl"~

<body class="clickup-chrome-ext_installed" style="overflow-anchor: none;" cz-shortcut-listen="true">

	<div id="__ozon">

		<div id="layoutPage" class="a0 a2">

			<div data-replace-layout-path="[0]" class="b0 b2" style="width:auto;" data-widget="blockVertical">

				<div data-replace-layout-path="[0][0]" ~~*class="e3"*~ style="top:0;z-index:12;" data-widget="stickyContainer">
					<div class="a5g h4e" data-widget="webToAppBanner">
							<a href="/">
								<img alt="" src="/images/logo.svg" style="height:32px;">
							</a>
							<noindex style="margin-left: auto;">
								<span ></span>
							</noindex>
							<div class="e5h a2429-a hidden">
							</div>
					</div>
				</div>

	            ~~include file="market/tpl/`$smarty.const.TPL`/navBar.tpl"~

	            ~~include file="market/tpl/`$smarty.const.TPL`/addressBookBarWeb.tpl"~

            	<div  class="container b4 b6" >
					~~$body~
            	</div>
				~~include file="market/tpl/`$smarty.const.TPL`/stickyContainer.tpl"~

			</div>
			<div>
				<div class="an2 a2n" style="bottom: 66px;">
				</div>
			</div>
		</div>
	</div>
	~~mod path="market/" mod_name="menu" tpl="m_menu"~
	~~include file='market/tpl/bottom_script.tpl'~
</body>
</html>