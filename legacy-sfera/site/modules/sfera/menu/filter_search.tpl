
~~*
<div id="search-modal" class="modal remodal search-modal" data-remodal-id="search-modal">
	<button class="modal__close close-btn" data-remodal-action="close" data-bind="text: 'Закрыть'"></button>
	<a target="_self" href="#" class="a5g nd8 search-modal_def" data-name="Везде" data-bind="click: $root.set_cur_cat('', 'Везде')">
		<span class="tsCompact500Medium">Везде</span>
	</a>
	<ul>

		~~foreach from=$top_menu key=SECTION_ID name=SECTION_NAME item=tm~
		<li>
			<a 
			href="#" 
			class="a5g nd8" 
			data-id="~~$tm.SECTION_ID~"
			data-guid="~~$tm.SECTION_GUID~" 
			data-name="~~$tm.SECTION_NAME~"
			data-bind="click: set_cur_cat.bind(this,'~~$tm.SECTION_GUID~', '~~$tm.SECTION_NAME~')"
			data-remodal-action="close"
			>
				<span class="tsCompact500Medium" data-bind="text: '~~$tm.SECTION_NAME~'"></span>
			</a>
		</li>
		~~/foreach~
		
	</ul>
</div>

<style>
	.search-modal {
		max-width: 660px;
	}

	.search-modal ul {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		grid-gap: 10px;
	}

	.search-modal .search-modal_def {
		display: inline-block;
		margin-left: 0;
		width: calc(50% - 17px);
	}

	.search-modal a {
		color: #000;
		padding: 6px;
	}

	.search-modal a:hover {
		border-radius: 6px;
	}
</style>
*~