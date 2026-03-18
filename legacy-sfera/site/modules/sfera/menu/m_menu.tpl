<div class="m_menu">
	<div class="m_menu-top">
		<h3>Категории</h3>
		<button class="m_menu-close" onclick="MobileMenu.closeMenu()">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="ag15-b1"><path fill="#fff" d="M2.533 2.533a1.25 1.25 0 0 1 1.768 0l3.7 3.7 3.699-3.7A1.25 1.25 0 0 1 13.466 4.3L9.767 8l3.7 3.7a1.25 1.25 0 1 1-1.768 1.767L8 9.767l-3.7 3.7A1.25 1.25 0 1 1 2.534 11.7L6.233 8l-3.7-3.7a1.25 1.25 0 0 1 0-1.767Z"></path></svg>
		</button>
	</div>
	<div class="m_menu-submit hidden">
		<a href="#">Посмотреть</a>
	</div>
</div>
<template id="m_menu-list">
	<ul class="m_menu-list noselected">
		~~foreach from=$top_menu key=id name=title item=tm~
			<li class="m_menu-item">
				<label data-id="~~$tm.id~" data-name="~~$tm.title~" onclick="MobileMenu.get_cat(~~$tm.id~, ~~$tm.name~, this); this.onclick=null">
					<input type="radio" name="radio" value="true">
					<h4>~~$tm.title~</h4>
					<span class="checkmark"></span>
				</label>
			</li>
		~~/foreach~
	</ul>
</template>
<script>


</script>

<style>
	.m_menu {
		font-family: 'var(--mainFont)', arial,sans-serif;
		background-color: #fff;
		position: fixed;
		top: 0;
		overflow: hidden;
		overflow-y: auto;
    height: calc(100vh - 56px);
    min-width: 100%;
		z-index: 9999;
		display: none;
	}

	.m_menu.open {
		display: block;
	}

	.m_menu-top {
		align-items: center;
		justify-content: center;
    display: flex;
    height: 60px;
    position: relative;
	}

	.m_menu-close {
		display: flex;
		justify-content: center;
		align-items: center;
		position: fixed;
		top: 10px;
		right: 10px;
		border-radius: 50%;
		background-color: rgba(204, 214, 228, 0.6);
		width: 32px;
		height: 32px;
		z-index: 999;
	}

	.m_menu h3 {
		font-size: 16px;
    font-weight: 500;
    letter-spacing: .2px;
    line-height: 24px;
		text-align: center;
	}

	.m_menu-list {
		height: 100vh;
	}

	.m_menu-list.noselected .m_menu-item,  .m_menu-sublist.noselected .m_menu-subitem{
		display: block;
	}

	.m_menu-list .m_menu-item, .m_menu-sublist .m_menu-subitem {
		display: none;
	}

	.m_menu-list .m_menu-item.open, .m_menu-sublist .m_menu-subitem.open {
		display: block;
	}

	.m_menu-item.open > label {
		pointer-events: none;
	}

	.m_menu-item.open > label span.checkmark {
		display: none;
	}

	.m_menu-item label {
		align-items: center;
    border-bottom: 1px solid rgba(204,214,228,.6);
    display: flex;
    height: 44px;
    justify-content: space-between;
    margin-left: 16px;
    padding-right: 50px;
		cursor: pointer;
		position: relative;
	}

	.m_menu-item label h4 {
		color: #001a34;
    font-size: 16px;
    font-weight: 400;
    letter-spacing: .2px;
	}

	.m_menu-item label input {
		position: absolute;
		opacity: 0;
		cursor: pointer;
		height: 0;
		width: 0;
	}

	.checkmark {
		position: absolute;
		right: 16px;
		height: 18px;
		width: 18px;
		border: 2px solid rgba(204,214,228,.6);
		background-color: #fff;
		border-radius: 50%;
	}

	.m_menu-curlist {
		margin-left: 16px;
	}

	.m_menu-curlink {
		color: rgba(0,26,52,.6);
    line-height: 1.1;
    position: relative;
	}

	.m_menu-curcount {
		margin-left: 5px;
    color: #a9a8a8;
	}

	.m_menu-item label:hover input ~ .checkmark {
		background-color: #ccc;
	}

	.m_menu-item label input:checked ~ .checkmark {
		background-color: var(--theme-rmcolor);
		border: 2px solid var(--theme-rmcolor);
	}

	.checkmark:after {
		content: "";
		position: absolute;
		display: none;
	}

	.m_menu-item label input:checked ~ .checkmark:after {
		display: block;
	}

	.m_menu-sublist {
		margin-left: 16px;
	}

	.m_menu-item label .checkmark:after {
		top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
		width: 10px;
		height: 10px;
		border-radius: 50%;
		background: white;
	}

	.m_menu-submit {
		display: flex;
		justify-content: center;
		bottom: 56px;
    box-shadow: 0 4px 16px 0 rgba(0,26,52,.1);
		background-color: #fff;
    box-sizing: border-box;
    left: 0;
    padding: 8px 16px;
    position: fixed;
    right: 0;
    width: 100%;
    z-index: 100;
	}

	.m_menu-submit a {
		font-size: 16px;
    font-weight: 500;
    letter-spacing: .2px;
    line-height: 24px;
		border-radius: 8px;
		/* padding: 10px; */
		background-color: var(--theme-rmcolor);
    color: #fff;
		display: flex;
		justify-content: center;
		overflow: hidden;
    text-overflow: ellipsis;
		align-items: center;
    height: 44px;
    white-space: nowrap;
    width: 100%;
	}
</style>