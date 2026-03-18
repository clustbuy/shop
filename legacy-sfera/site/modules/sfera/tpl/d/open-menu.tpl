
<style>


	body {
		height: 100%;
		width: 100%;
	}
	.logo {
		z-index: 100000;
	}
	.top-header .logo {
		/*display: inline-block;*/
		/*position: static;*/
		/*left: auto;*/
	}
	.top-header .wrapper.holder {
		/*text-align: center;*/
	}
	.page.mobile-menu-opened {
		z-index: 5;
	}
	.open-menu-wrapper {

	}


  .open-menu {
    display: none;
    position: absolute; left: 15px; top: 15px;
    overflow: hidden;
    float: left;
    margin: 0 !important;
    cursor: pointer;
    width: 30px;
    height: 35px;
    font-size: 30px;
		padding-top: 10px;
		z-index: 1001;
		-webkit-user-select: none;  /* Chrome all / Safari all */
		-moz-user-select: none;     /* Firefox all */
		-ms-user-select: none;      /* IE 10+ */
		user-select: none;          /* Likely future */
    -webkit-transition: all .05s linear;
    -moz-transition: all .05s linear;
    -o-transition: all .05s linear;
    transition: all .05s linear;
  }
	.open-menu.fixed_pos {
		position: fixed;
	}
	.open-menu.expanded {
		left: 215px;
	}
  .open-menu i {
		-webkit-user-select: none;  /* Chrome all / Safari all */
		-moz-user-select: none;     /* Firefox all */
		-ms-user-select: none;      /* IE 10+ */
		user-select: none;          /* Likely future */
  }
  .open-menu-expanded-color {
    /*color: #eb5a1e;*/
  }

  @media screen and (max-width:768px){
    .open-menu{
      margin:14px 0 0;
    }
    .open-menu{
      display:block;
    }
  }


	#mobile-menu{
    display:block;
    position: fixed; top: 0; left:-200px;
		height: 100%;
		/*overflow: hidden;*/
		/*box-shadow: 0 0 20px 7px rgba(155,155,155,.2) inset;*/
    box-shadow: -20px 0 20px -16px rgba(155,155,155,.2) inset;
    width:200px;
    z-index: 1000000;
    font:15px/18px 'Roboto Slab','Times New Roman',serif;
    text-align: center;
		background-color: #fff;
    -webkit-transition: all .05s linear;
    -moz-transition: all .05s linear;
    -o-transition: all .05s linear;
    transition: all .05s linear;
  }
	#mobile-menu.expanded {
		left: 0;
	}
  #mobile-menu li {
    border-bottom: 1px solid #f2f2f2;
		border-right: 1px solid #f2f2f2;
    height: 50px;
    line-height: 50px;
    text-align: left;
    padding-left: 15px;
    cursor: pointer;
		user-select: none;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
    -webkit-transition: all .2s ease;
    -moz-transition: all .2s ease;
    -o-transition: all .2s ease;
    transition: all .2s ease;
  }
  #mobile-menu li:hover {
		box-shadow: -20px 0 20px -16px rgba(236, 90, 30, .1) inset;
    background-color: #fafafa;
  }
  #mobile-menu li i {
    font-size: 1.3em;
    padding-right: 5px;
    vertical-align: middle;
    color: #eb5a1e;
  }
  #mobile-menu li a {
    border-bottom: 1px dotted #aaa;
  }
  #mobile-menu .mobile-menu-itself {

  }
  @media screen and (min-width:769px){
    #mobile-menu{display:none !important;}
    /*.page{
      left:0;
    }
    .top-header{
      left:0;
    }*/
  }



		/* Блок авторизации */
		#mobile-menu .mobile-menu-auth {
			height: 74px;
			line-height: 74px !important;
			font: 13px/20px Arial,Helvetica,sans-serif;
			box-shadow: -20px 0 20px -20px rgba(155,155,155,.2) inset;
			background-color: #f8f8f8;
			font-size: 14px;
			border-bottom: 1px solid #eee;
			border-right: 1px solid #eee;
		}
		#mobile-menu .mobile-menu-auth span {
			border-bottom: 1px dotted #999;
			cursor: pointer;
		}

		/* Информация о вошедшем пользователе */
		#mobile-menu .mobile-menu-user_info {
			position: relative;
			background-color: #f8f8f8;
			border-bottom: 1px solid #eee;
			border-right: 1px solid #eee;
			box-shadow: -20px 0 20px -20px rgba(155,155,155,.2) inset;

			height: 74px;
			line-height: 20px;
			font-size: 16px;
			text-align: center;
		}
		#mobile-menu .mobile-menu-user_info:before {
			content: '';
			display: inline-block;
			height: 71px;
			vertical-align: middle;
			width: 1px;
		}
		#mobile-menu .mobile-menu-user_info span {
			display: inline-block;
			vertical-align: middle;
			height: auto;
			width: 170px;
			padding: 0 10px 0 5px;
			overflow: hidden;
			text-overflow: ellipsis;
		}

		/* Информация о вошедшем пользователе */
		#mobile-menu .mobile-menu-user_info .exit-button {
			position: absolute;
			top: 24px;
			left: 148px;
			display: block;
		}
		#mobile-menu .mobile-menu-user_info .exit-button a {
			border-bottom: 1px dotted #a6a6a6;
			color: #a6a6a6;
			font: 13px/20px Arial,Helvetica,sans-serif;
		  /*border-bottom: 1px dotted #999;*/
			cursor: pointer;
		}


  #mobile-menu .mobile-menu-phones {
    font: 700 17px/36px 'Roboto Slab','Times New Roman',serif;
    padding-top: 10px;
		/*background-color: #f8f8f8;*/
  }
  #mobile-menu .mobile-menu-phones>div {
    text-align: left;
    padding-left: 15px;
  }
	#mobile-menu .mobile-menu-phones>div>a {
		cursor: pointer;
		transition: all .3s linear;
	}
	#mobile-menu .mobile-menu-phones>div>a:hover {
		color: #ec5a1e;
	}


	.open-menu-popup {
		position: fixed;
    left: 5px; top: 5px;
    background-color: #fff;
    z-index: 100001;
    border-radius: 4px;
    min-width: 270px;
    min-height: 270px;
    opacity: 1;
    border: 1px solid #eee;
    box-shadow: 0 0 10px RGBA(0,0,0,.5);
	}
	.open-menu-popup>div:nth-child(1) {
		display: block;
    top: 0;
    box-shadow: none;
    border: 0;
    position: static;
    margin: 0;
	}


		.login-panel input[type=submit]{
			float:left;
			box-shadow:0 3px 0 0 #b15241;
			border-radius:10px;
			cursor:pointer;
			font:400 14px/32px 'Roboto Slab','Times New Roman',serif;
			padding:0 17px;
			color:#fff;
			border:1px solid #ea7045;
			background:#ea7045;
			background:-moz-linear-gradient(top,#ea7045 0,#df4c30 100%);
			background:-webkit-linear-gradient(top,#ea7045 0,#df4c30 100%);
			background:linear-gradient(to bottom,#ea7045 0,#df4c30 100%);
			margin:8px 0 19px
		}
		.login-panel input[type=submit]:hover{
			border-color:#ff8f52;
			background:#ff8f52;
			background:-moz-linear-gradient(top,#ff8f52 0,#e6573b 100%);
			background:-webkit-linear-gradient(top,#ff8f52 0,#e6573b 100%);
			background:linear-gradient(to bottom,#ff8f52 0,#e6573b 100%)
		}
		.login-panel input[type=submit]:active{
			position:relative;
			top:3px;
			border-color:#cc471c;
			box-shadow:0 0 20px 0 #a63019 inset;
		}

		/* Надписи "Забыли пароль?" и "Регистрация" */
		.login-panel .forgot-password {
			float:right;
			color:#919191;
			border-bottom:1px dotted #919191;
			font-family:Arial,Helvetica,sans-serif;
			margin:5px 0 0 !important;
		}

		/* Надпись "Вход" */
		.login-panel .title-popup-wrapper {
			margin-bottom: 15px;
			font-size: 1.2em;
		}
		.login-panel .title-popup {
			display: block !important;
		}


	.myrow {}
	.myrow:after {
		display: block;
		content: '';
		height: 0;
		visibility: hidden;
		clear: both;
	}

	[class*='span'] {
		float: left;
		display: inline;
	}

	.holder .myrow .back_button {
		margin-top: 17px;
    color: RGBA(0,0,200,1);
	}
	.holder .myrow .back_button span {
		cursor: pointer;
	}
	.holder .myrow .back_button span:hover {
		text-decoration: underline;
	}


	.user-city-choose {

	}
	.user-city-choose .choose-city {
		box-shadow: -20px 0 20px -16px rgba(155,155,155,.2) inset;
		width: auto !important;
		top: -1px !important;
    height: 100%;
    overflow-x: hidden !important;
	}
	.user-city-choose .choose-city li {
		height: auto !important;
		line-height: normal !important;
		padding: 10px 0 !important;
	}
	.user-city-choose li.activeli {
    padding-bottom: 5px !important;
    padding-top: 5px !important;
	}


	.back-button-container {
		padding-top: 7px;
		padding-bottom: 0;
	}
	.back-button-container .back-row {
    font-size: 15px;
    line-height: 35px;
    overflow: hidden;
		padding: 10px;
    width: 90%;
    margin: 0;
	}
	.back-button-container .back-row a {
		width: 80%;
    padding: 0 11px 0 21px;
    border: 1px solid #eaeaea;
    float: left;
    position: relative;
		cursor: pointer;
    -webkit-transition: all .5s ease;
    -moz-transition: all .5s ease;
    -o-transition: all .5s ease;
    transition: all .5s ease;
	}
	.back-button-container .back-row a:hover {
		background: #f0f0f0;
	}
	.back-button-container .back-row a:before {
		content: ' ';
		width: 7px;
		height: 10px;
		position: absolute;
		top: 50%;
		left: 8px;
		margin: -5px 0 0;
		background: url(/images/arrow5.svg) no-repeat;
		background-size: 100% 100%;
	}
	.back-button-container .back-row a span {
		position: relative;
		border-bottom: 1px dotted #ccc;
	}


	.menu-category-choose {

	}
	.menu-category-choose #mobile-menu-city-choose-panel.choose-city {
		box-shadow: -20px 0 20px -16px rgba(155,155,155,.2) inset;
		width: auto !important;
		top: -1px !important;
    height: 100%;
    overflow-x: hidden !important;
	}
	.menu-category-choose #mobile-menu-city-choose-panel.choose-city li {
		height: auto !important;
		line-height: normal !important;
		padding: 10px 0 !important;
	}
	.menu-category-choose li.activeli {
    padding-bottom: 5px !important;
    padding-top: 5px !important;
	}


	#popup_menu:after,#popup_menu:before {
		content: none;
	}
	#close_popup_menu{
		display: none;
		position: absolute !important;
    top: 10px !important;
    left: 171px !important;
	}
	#popup_text{
		font:15px/18px 'Roboto Slab','Times New Roman',serif;
	}
	#popup_menu
	{
		display:none;
		position: absolute !important;
		top: 0 !important;
		width: 190px !important;
		margin-left: -95px !important;
		z-index: 1000001 !important;
	}
	.choose-menu-cat {
		/*box-shadow: -20px 0 20px -16px rgba(155,155,155,.2) inset;*/
		/*width: auto !important;*/
		/*top: -1px !important;*/
    /*height: 100%;*/
    overflow-x: hidden !important;
	}
	.choose-menu-cat li {
		height: auto !important;
		line-height: normal !important;
		padding: 10px 0 0 0 !important;
		text-align: center !important;
		border-bottom: 0 !important;
	}
	.choose-menu-cat li a {
		border-bottom: 1px solid #ddd;
		margin-left: 0 !important;
	}
	.choose-menu-cat li.activeli {
    padding-bottom: 5px !important;
    padding-top: 5px !important;
	}





</style>


	<div class="open-menu-wrapper">

			<div style="display: none" class="open-menu-popup" data-bind="visible: m.s1.modal.login">

				<div class="callback-popup popup-box login-panel">

					<a href="#" class="btn-close" data-bind="click: f.s1.pupup_switch.bind($data, 'login')"></a>

                                        <form id="mobile-menu-login-form" action="/" method="post" data-bind="visible: !m.s1.login.password_restore()">
						<fieldset>

							<input type="hidden" name="confirmed_email" id="confirmed_email">
							<input type="hidden" name="verified_email" id="verified_email">

							<div class="title-popup-wrapper">
								<strong class="title-popup">Войти в свой аккаунт</strong>
							</div>

							<div>
								<label>
									<span data-bind="if: m.s1.login.via_phone">Телефон</span><span data-bind="if: !m.s1.login.via_phone()">Электронная почта / Логин</span>
								</label>
                                <span data-bind="if: m.s1.login.via_phone"><input type="text" class="tel-input" name="user_login" data-bind="textInput: m.s1.login.phone~~*, event: {keypress: f.s1.login}*~"></span>
                                <span data-bind="if: !m.s1.login.via_phone()"><input type="text" name="user_login" data-bind="textInput: m.s1.login.email_login~~*, event: {keypress: f.s1.login}*~"></span>
							</div>

							<div>
								<label>
									<span>Пароль</span>
								</label>
								<input type="password" name="password" data-bind="textInput: m.s1.login.password~~*, event: {keypress: f.s1.login}*~">
							</div>

							<div class="holder">
								<input type="submit" value="Войти" data-binc="click: f.s1.login" />
								<a href="#" class="forgot-password" data-bind="click: f.s1.switch_login_restore">Забыли пароль?</a>
								<a href="/registration/" class="forgot-password">Регистрация</a>
							</div>

							<div class="holder">
								<span class="alt-enter">Войти через социальные сети</span>
								<ul class="social-enter">
									<li>

									</li>
								</ul>
								<a href="#" data-bind="click: f.s1.switch_login_way" class="forgot-password" style="margin: 0;">Другой способ</a>
							</div>

						</fieldset>
					</form>


					<div>


						<form action="#" style="display: none" data-bind="visible: m.s1.login.password_restore() && !m.s1.login.password_restore_msg()">

							<input type="hidden" name="mod_name" value="registration">
							<input type="hidden" name="tpl" value="restore_password">
							<fieldset>

								<div class="title-popup-wrapper">
									<strong class="title-popup">Восстановить пароль</strong>
								</div>


								<div data-bind="visible: m.s1.login.via_phone">
									<label>
										<span>Телефон</span>
									</label>
									<input type="text" class="tel-input" name="user_phone" data-bind="textInput: m.s1.login.phone">
								</div>

								<div>
									<p>
										<span>Укажите номер телефона, который был введен вами во время регистрации.</span>
									</p>
								</div>

								<div class="holder">
									<div class="myrow">
										<div class="back_button span40">
											<span class="back_button" data-bind="click: f.s1.switch_login_restore">Назад</span>
										</div>
										<div class="span60">
											<input type="submit" value="Восстановить" data-bind="click: f.s1.restore_password" />
										</div>
									</div>
								</div>

							</fieldset>
						</form>

						<div style="display: none" class="password_restore_msg" data-bind="visible: m.s1.login.password_restore_msg, html: m.s1.login.password_restore_msg_html">

						</div>

					</div>

				</div>

			</div>

			<div style="display: none" class="open-menu-popup" data-bind="visible: m.s1.modal.callback">

				<div class="callback-popup popup-box">

					<a href="#" class="btn-close" data-bind="click: f.s1.pupup_switch.bind($data, 'callback')"></a>

					<form data-bind="visible: m.s1.callback.form_visible">
						<fieldset>

							<div>
								<label><span>Ваше имя</span></label>
								<input type="text" name="name" data-bind="textInput: m.s1.callback.name, event: {keypress: f.s1.callback}">
							</div>

							<div>
								<label><span>Телефон</span></label>
								<input type="text" class="tel-input" name="phone" data-bind="textInput: m.s1.callback.phone, event: {keypress: f.s1.callback}">
							</div>

							<div>
								<p><span>Наш оператор свяжется с Вами для уточнения деталей заказа.</span></p>
							</div>

							<!--div class="holder">
								<input type="button" data-bind="click: f.s1.callback" value="Перезвоните мне"/>
							</div-->

						</fieldset>
					</form>


					<div style="display: none" data-bind="visible: m.s1.callback.success_visible, html: m.s1.callback.form_html">

					</div>

				</div>

			</div>


		<!--<div style="display: none" class="open-menu" data-bind="click: f.s1.switch, css: {'open-menu-expanded-color': m.s1.expanded, expanded: m.s1.expanded}">-->
			<!--<i class="mdi mdi-menu"></i>-->
			<!--&lt;!&ndash;<a href="#" class="open-menu" data-bind="click: f.s1.switch">open menu</a>&ndash;&gt;-->
		<!--</div>-->

		<style>

			/* mob-menu-btn begin */

			.menuopen {
				right: 0px !important;
			}

			.menu-button {
				position: fixed;
				left: 15px;
				top: 30px;
				width: 30px;
				height: 20px;
				cursor: pointer;
				-webkit-transition: all 200ms ease-out;
				-moz-transition: all 200ms ease-out;
				-o-transition: all 200ms ease-out;
				transition: all 200ms ease-out;
				z-index: 10000;
				/*display: none;*/

			}
			.menu-button .active {
				display: block;
			}

			.icon-menu-burger {
				background: #000000;
				background-color: #000000;
				height: 2px;
				width: 30px;
				position: absolute;
				top: 50%;
				left: 50%;
				margin: -1px 0 0 -13px;
				-webkit-transition: transform 0.2s ease 0s;
				-moz-transition: transform 0.2s ease 0s;
				-o-transition: transform 0.2s ease 0s;
				-ms-transition: transform 0.2s ease 0s;
				transition: transform 0.2s ease 0s;
				-webkit-transition: -webkit-transform 0.2s ease 0s;
			}
			.icon-menu-burger__line {
				background: #000000;
				background-color: #000000;
				height: 100%;
				width: 100%;
				position: absolute;
				top: 0;
				left: 0;
				-webkit-transition: transform 0.2s linear 0.2s;
				-moz-transition: transform 0.2s linear 0.2s;
				-o-transition: transform 0.2s linear 0.2s;
				-ms-transition: transform 0.2s linear 0.2s;
				transition: transform 0.2s linear 0.2s;
				-webkit-transition: -webkit-transform 0.2s linear 0.2s;
			}
			.icon-menu-burger:before, .icon-menu-burger:after {
				background: #000000;
				background-color: #000000;
				content: '';
				height: 100%;
				width: 100%;
				position: absolute;
				left: 0;
			}
			.menu-button.active .icon-menu-burger__line,
			.menu-button.active .icon-menu-burger:before,
			.menu-button.active .icon-menu-burger:after {
				background: #FF2C3E;
			}
			.menu-button .icon-menu-burger__line,
			.menu-button .icon-menu-burger:before,
			.menu-button .icon-menu-burger:after {
				background: #000000;
			}

			.icon-menu-burger:before {
				top: -9px;
				-webkit-transition: top 0.2s linear 0.4s;
				-moz-transition: top 0.2s linear 0.4s;
				-o-transition: top 0.2s linear 0.4s;
				-ms-transition: top 0.2s linear 0.4s;
				transition: top 0.2s linear 0.4s;
			}
			.icon-menu-burger:after {
				bottom: -9px;
				-webkit-transition: bottom 0.2s linear 0.4s;
				-moz-transition: bottom 0.2s linear 0.4s;
				-o-transition: bottom 0.2s linear 0.4s;
				-ms-transition: bottom 0.2s linear 0.4s;
				transition: bottom 0.2s linear 0.4s;
			}
			.menu-button.active .icon-menu-burger{
				-webkit-transform: rotate(45deg);
				-moz-transform: rotate(45deg);
				-o-transform: rotate(45deg);
				-ms-transform: rotate(45deg);
				transform: rotate(45deg);
				-webkit-transition: transform 0.2s linear 0.4s;
				-moz-transition: transform 0.2s linear 0.4s;
				-o-transition: transform 0.2s linear 0.4s;
				-ms-transition: transform 0.2s linear 0.4s;
				transition: transform 0.2s linear 0.4s;
				-webkit-transition: -webkit-transform 0.2s linear 0.4s;
			}
			.menu-button.active .icon-menu-burger__line{
				-webkit-transform: rotate(90deg);
				-moz-transform: rotate(90deg);
				-o-transform: rotate(90deg);
				-ms-transform: rotate(90deg);
				transform: rotate(90deg);
			}
			.menu-button.active .icon-menu-burger:before {
				-webkit-transition: top 0.2s linear;
				-moz-transition: top 0.2s linear;
				-o-transition: top 0.2s linear;
				-ms-transition: top 0.2s linear;
				transition: top 0.2s linear;
				top: 0;
			}
			.menu-button.active .icon-menu-burger:after {
				-webkit-transition: bottom 0.2s linear;
				-moz-transition: bottom 0.2s linear;
				-o-transition: bottom 0.2s linear;
				-ms-transition: bottom 0.2s linear;
				transition: bottom 0.2s linear;
				bottom: 0;
			}
			/* mob-menu-btn end */

			.mobile-menu {
				position: fixed;
				top: 0;
				right: -470px;
				background: #1F1F1F;
				height: 100%;
				width: 370px;
				max-width: 100%;
				z-index: 10000;
				overflow-y: scroll;
				-webkit-transition: all 200ms ease-out;
				-moz-transition: all 200ms ease-out;
				-o-transition: all 200ms ease-out;
				transition: all 200ms ease-out;
				padding-top: 75px;
			}
			.overlay {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: rgba(255,255,255,0.8);
				z-index: -100;
				opacity: 0;
				-webkit-transition: opacity 200ms ease-out;
				-moz-transition: opacity 200ms ease-out;
				-o-transition: opacity 200ms ease-out;
				transition: opacity 200ms ease-out;
			}

			.mobile-menu li {
				position: relative;

			}
			.mobile-menu > ul > li{
				border-bottom: 1px solid rgba(255,255,255,0.1);
			}
			.mobile-menu > ul > li:first-of-type{
				border-top: 1px solid rgba(255,255,255,0.1);
			}
			.mobile-menu li.down > a {
				padding-right: 60px;
			}
			.mobile-menu .dropdown-button{
				display: block;
				position: absolute;
				top: 0;
				right: 0;
				height: 45px;
				max-height: 100%;
				width: 48px;
				z-index: 10;
			}
			.mobile-menu .dropdown-button:before {
				content: "";
				display: block;
				position: absolute;
				width: 12px;
				height: 12px;
				top: 13px;
				left: 16px;
				border-bottom: 1px solid #fff;
				border-right: 1px solid #fff;
				-moz-transform: rotate(45deg);
				-webkit-transform: rotate(45deg);
				-o-transform: rotate(45deg);
				-ms-transform: rotate(45deg);
				transform: rotate(45deg);
				-webkit-transition: all 300ms ease-out;
				-moz-transition: all 300ms ease-out;
				-o-transition: all 300ms ease-out;
				transition: all 300ms ease-out;
			}
			.mobile-menu .dropdown-button.active:before{
				-moz-transform: rotate(225deg);
				-webkit-transform: rotate(225deg);
				-o-transform: rotate(225deg);
				-ms-transform: rotate(225deg);
				transform: rotate(225deg);
				top: 19px;
			}
			.mobile-menu .dropdown-button + ul {
				position: static;
				width: 100%;
				display: none;
			}
			.mobile-menu ul ul .dropdown-button:before{
				width: 6px;
				height: 6px;
				content: "+";
				border: none;
				color: #fff;
				-moz-transform: rotate(0) !important;
				-webkit-transform: rotate(0) !important;
				-o-transform: rotate(0) !important;
				-ms-transform: rotate(0) !important;
				transform: rotate(0) !important;
				top: 8px !important;
				left: 17px;
				font-size: 16px;
			}



			.mobile-menu .dropdown-button + ul > li:last-of-type{
				border-bottom: none;
			}
			.mobile-menu > ul  > li > a {
				display: block;
				text-decoration: none;
				color: #fff;
				padding: 13px 20px 10px;
				text-transform: uppercase;
				font-size: 14px;
			}
			.mobile-menu > ul  > li.active > a,
			.mobile-menu > ul > li > ul > li.active > a,
			.mobile-menu ul ul ul .active a{
				color: #f7931e;
			}

			.mobile-menu > ul > li > ul > li > a,
			.mobile-menu ul ul ul a{
				display: block;
				font-size: 15px;
				line-height: 18px;
				text-decoration: none;
				-webkit-transition: all 200ms ease-out;
				-moz-transition: all 200ms ease-out;
				-o-transition: all 200ms ease-out;
				transition: all 200ms ease-out;
				padding: 10px 10px 10px 30px;
				color: #FFFFFF;
				position: relative;
			}
			.mobile-menu > ul > li > ul > li > a:before,
			.mobile-menu ul ul ul a:before {
				content: "";
				font-family: 'FontAwesome';
				display: block;
				position: absolute;
				top: 17px;
				left: 20px;
				font-size: 14px;
				width: 4px;
				height: 4px;
				background: #f7931e;
				border-radius: 100%;
			}
			.mobile-menu ul ul ul a{
				padding: 6px 10px 6px 42px;
				font-size: 13px;
			}
			.mobile-menu ul ul ul a:before{
				left: 32px;
				top: 12px;
			}

			.mobile-search-wrapper {
				width: 100%;
				padding: 0 20px;
				margin-bottom: 20px;
				position: relative;
				max-width: 100%;
			}
			.mobile-search-wrapper input[type=text]{
				background: transparent;
				border-color: #5f5f5f;
				border-radius: 30px;
			}
			.mobile-search-wrapper [type=submit] {
				position: absolute;
				display: block;
				top: 0;
				right: 0;
				height: 44px;
				width: 44px;
				border: none;
				-webkit-transition: all 200ms ease-out;
				-moz-transition: all 200ms ease-out;
				-o-transition: all 200ms ease-out;
				transition: all 200ms ease-out;
				background: transparent;
			}
			.mobile-search-wrapper [type=submit] i{
				margin: 0;
				color: #5f5f5f;
			}
			.mobile-menu-info{
				padding: 0 20px;
			}
			.mobile-menu-info .btn{
				width: 100%;
				padding: 11px 0 8px;
			}
			.mobile-menu-info .header-mail a{
				color: #A5A5A9;
			}
			.white{
				color: #fff;
			}
		</style>

		<!-- Mobile menu -->
		~~if $mobile == 1~
		<div class="menu-button" style="z-index: 11000;">
				<span class="icon-menu-burger">
					<span class="icon-menu-burger__line"></span>
				</span>
		</div>

		<script>
			$('.menu-button').click(function(e){

				if (menu_button == 0) {
					console.log('has no active');
					console.log('openleftmenu');
					$('.mobile-menu').toggleClass('menuopen');
					$('.menu-button').toggleClass('active');

					menu_button = 1;
				}
				else {
					if(menu_button == 1){
						console.log('has active');
						console.log('closeleftmenu');
						$('.mobile-menu').toggleClass('menuopen');
						$('.menu-button').toggleClass('active');
						/*$('.menu-button').css('display','none');*/
					}
				}
			});
		</script>
		~~/if~

		<div class="mobile-menu open" id="mobmenu">




			<ul class="">
				<li class="first active">
					<a href="/" >Главная</a>
				</li>
				~~*
				<li class="down">
					<a href="#" class="catalog-link">Меню</a><span class="dropdown-button"></span>
					<ul  class="down" >
						<li class="down">
							<a href="/pizza/" >Пиццы</a>
							<!--ul  class="">
								<li class="first">
									<a href="/pizza/myasnye/" >Мясные</a>
								</li>
								<li>
									<a href="/pizza/vegetarianskie/" >Вегетарианские</a>
								</li>
								<li>
									<a href="/pizza/morskie-i-rybnye/" >Морские и рыбные</a>
								</li>
								<li class="last">
									<a href="/pizza/zakrytye/" >Закрытые</a>
								</li>
							</ul-->
						</li>
						<li class="down">
							<a href="/assorti/" >Сеты</a>
							<!--ul  class="">
								<li class="first">
									<a href="/assorti/bolshie-assorti/" >Большие</a>
								</li>
								<li>
									<a href="/assorti/srednie-assorti/" >Средние</a>
								</li>
								<li class="last">
									<a href="/assorti/malye-assorti/" >Малые</a>
								</li>
							</ul-->
						</li>
						<li class="down">
							<a href="/rolls/" >Роллы</a>
							<!--ul  class="">
								<li class="first">
									<a href="/rolls/usual-rolls/" >Классические роллы</a>
								</li>
								<li>
									<a href="/rolls/rolls-mini/" >Мини роллы</a>
								</li>
								<li>
									<a href="/rolls/rolls-fry/" >Запеченные роллы</a>
								</li>
								<li class="last">
									<a href="/rolls/tempura-rolly/" >Темпура роллы</a>
								</li>
							</ul-->
						</li>
						<li class="first down">
							<a href="/sushi/" >Суши</a><span class="dropdown-button"></span>
							<ul  class="">
								<li class="first">
									<a href="/sushi/sushisushi/" >Суши </a>
								</li>
								<li>
									<a href="/sushi/gunkany/" >Гунканы</a>
								</li>
								<!--li>
									<a href="/sushi/gunkany%20spajs/" >Гунканы спайс</a>
								</li>
								<li>
									<a href="/sushi/gunkany%20zapechennye/" >Гунканы запеченные</a>
								</li>
								<li class="last">
									<a href="/sushi/inari/" >Инари</a>
								</li-->
							</ul>
						</li>
						<li class="last down">
							<a href="/snakes/" >Закуски</a>
						</li>
						<li class="last down">
							<a href="/salad/" >Салаты</a>
						</li>
						<!--li class="last down">
							<a href="/pelmeni/" >Пельмени</a>
						</li-->
                        <li class="last down">
                            <a href="/soup/" >Супы</a>
                        </li>
						<!--li class="last down">
							<a href="/hot-meals/" >Горячее</a>
						</li-->
						<li class="last down">
							<a href="/drinks/" >Морсы</a>
						</li>
						<!--li class="last down">
							<a href="/desserts/" >Десерты</a>
						</li-->
					</ul>
				</li>
				*~
				<li>
					<a href="/cart/" >Корзина</a>
				</li>
				<li>
					<a href="tel:~~$filial.tel1|replace:' ':''|replace:'(':''|replace:')':''|replace:'-':''~">~~$filial.tel1~</a>
				</li>


			</ul>

			<style>
				.mobile-menu-info{
					padding: 0 20px;
				}
				.mobile-menu-info .btn{
					width: 100%;
					padding: 11px 0 8px;
				}
				.mobile-menu-info .header-mail a{
					color: #A5A5A9;
				}
			</style>

			<div class="push30"></div>
			<div class="mobile-menu-info white" style="padding:20px;">

				<!--div class="header-slogan hidden-xs">Курьер принимает оплату картой при доставке<br><br></div-->
				<div class="push10"></div>
				<div class="mob-shedule f12 weight100">
					<div class="inner">
						<div class="element"><span class="upper bold">Наш адрес: ~~$filial.name_filial~</span></div>

						<div class="element">

							<span class="upper bold">~~$filial.working_time~</span>

						</div>

					</div>
				</div>

			</div>
			<div class="push30"></div>
		</div>
		<div class="overlay"></div>
		<!-- Mobile menu end -->

		<script>


			$('.mobile-menu .dropdown-button').click(function(){
				$(this).toggleClass('active');
				if($(this).siblings('ul').is(':visible')){
					$(this).siblings('ul').slideUp();
				}else{
					$(this).siblings('ul').slideDown();
				}

			});

			// ASIDE MENU

			$('.aside-menu li').has('ul').addClass('down');

			$('.aside-menu > ul li.down > ul').before('<span class="dropdown-button"></span>');
			$('.aside-menu .down .dropdown-button').click(function(){
				$(this).toggleClass('active');
				$(this).parent().toggleClass('open');
				if($(this).siblings('ul').is(':visible')){
					$(this).siblings('ul').slideUp();
				}else{
					$(this).siblings('ul').slideDown();
				}

			});

			$('.aside-menu-title').click(function(){
				$('.aside-menu').toggleClass('active');
			});

			// ASIDE MENU END

		</script>


		~~*
		<nav id="mobile-menu" data-bind="visible: m.s1.expanded, css: {active: m.s1.expanded, expanded: m.s1.expanded}">

			<div id="mobile-menu-itself" data-bind="visible: !m.s1.cityexpanded()">

				<div style="display: none" data-bind="visible: !m.s1.is_loggedin()" class="mobile-menu-auth" >
					<span data-bind="click: f.s1.pupup_switch.bind($data, 'login')" onclick="model_openmenu.f.s1.switch(); $('.login-popup').css('display', 'block'); return false;">Вход</span> / <span><a href="/registration">Регистрация</a></span>
				</div>

				<div style="display: none" data-bind="visible: m.s1.is_loggedin" class="mobile-menu-user_info">

					<span data-bind="text: m.s1.username"></span>

					<!--<div class="exit-button">-->
						<!--<a href="/?unset=user">Выйти</a>-->
					<!--</div>-->

				</div>


				<div class="mobile-menu-itself">
					<ul>
						<!--li data-bind="click: function(){ window.scrollTo(0,0); popup_menu(); }"-->  <!-- data-bind="click: f.s1.switch_menucat_choose_mode" -->
						<!--li>
							<i class="mdi mdi-pizza"></i>
							<a href="/pizza/" title="Пицца">Пицца</a>
						</li>
						<li>
							<i class="mdi mdi-google-circles-extended"></i>
							<a href="/assorti/" title="Сеты">Сеты</a>
						</li>
						<li>
							<i class="mdi mdi-slack"></i>
							<a href="/rolls/" title="Роллы">Роллы</a>
						</li>
                        <li>
                            <i class="mdi mdi-link"></i>
                            <a href="/sushi/" title="Суши">Суши</a>
                        </li>
                        <li>
                            <i class="mdi mdi-pot-mix"></i>
                            <a href="/soup/" title="Супы">Супы</a>
                        </li>
						<li>
							<i class="mdi mdi-glass-flute"></i>
							<a href="/drinks/" title="Напитки">Напитки</a>
						</li>
						<li>
							<i class="mdi mdi-google-wallet"></i>
							<a href="/desserts/" title="Десерты">Десерты</a>
						</li>
						<li data-bind="click: function(){ window.location = '/page/promotions'; }">
							<i class="mdi mdi-gift"></i>
							<a href="/page/promotions" title="Акции">Акции</a>
						</li>
						<li data-bind="click: function(){ window.location = '/room' }, visible: m.s1.is_loggedin">
							<i class="mdi mdi-account-key"></i>
							<a href="/room" data-bind="attr: {href: '/room'}" title="Личный кабинет">Личный кабинет</a>
						</li>
						<li>
							<i class="mdi mdi-heart-outline"></i>
							<a href="#" title="Избранное">Избранное</a>
						</li>
						<li data-bind="click: function(){ window.location = '/page/about'; }">
							<i class="mdi mdi-home"></i>
							<a href="/page/about" title="О компании">О компании</a>
						</li>
						<li data-bind="click: f.s1.pupup_switch.bind($data, 'callback')"  onclick="model_openmenu.f.s1.switch(); callback($(this), $('#callback'), event);return false;">
							<i class="mdi mdi-phone-incoming"></i>
							<a href="#" title="Обратный звонок">Обратный звонок</a>
						</li>
						<li data-bind="click: function(){ window.location = 'tel:84951343333'; }">
							<i class="mdi mdi-headphones"></i>
							<a href="tel:84951343333" id="call_to_skp" title="Заказ по телефону">Заказ по телефону</a>
						</li>
						<li-- data-bind="click: f.s1.switch_city_choose_mode">
							<i class="mdi mdi-map-marker"></i>
							<a href="#" data-bind="text: m.s1.indexes.cities[m.s1.cities.choosen_id()].name_filial">г. Москва</a>
						</li-->
						<li data-bind="click: function(){ window.location = '/?unset=user'; }, visible: m.s1.is_loggedin">
							<i class="mdi mdi-logout"></i>
							<a href="/?unset=user">Выйти</a>
						</li>
					</ul>
				</div>

				<div class="mobile-menu-itself">
					<ul>
						<li >
							<i class="mdi mdi-cart"></i>
							<a href="/cart/" title="Корзина">Корзина</a>
						</li>
					</ul>
				</div>

				<div class="mobile-menu-phones">

					~~if $filial.tel1~
					<div>
						<a href="tel:~~$filial.tel1~" title="Заказ по телефону">
						~~$filial.tel1~
						</a>
					</div>
					~~/if~

				</div>



			</div>

			<form method="POST" action="/" id="mobile-menu-city-choose" class="user-city-choose" style="display: none" data-bind="visible: m.s1.cityexpanded" tabindex="-1">

				<input type="hidden" name="id_filial" data-bind="textInput: m.s1.cities.choosen_id">
				<div class="choose-city popup-box" id="mobile-menu-city-choose-panel">

					<div class="back-button-container">
						<div class="back-row">
							<a data-bind="click: f.s1.switch_city_choose_mode"><span>Назад</span></a>
						</div>
					</div>

					<ul data-bind="foreach: m.s1.cities.list">
						<li data-bind="css: {activeli: id_filial == $root.m.s1.cities.choosen_id()}, click: $root.f.s1.choose_city">
							<a href="#" data-bind="text: name_filial, css: {active: id_filial == $root.m.s1.cities.choosen_id()}"></a>
						</li>
					</ul>

				</div>

			</form>



		</nav>
		*~

	<div id="popup_menu" style="display: none" class="choose-city choose-menu-cat callback-popup popup-box">

		<ul>
		~~foreach from=$menu item=m~

			~~if $m.parent == 0~
			<li>
					<a data-bind="event: {click: function(){ f.s1.show_load_screen_50(); window.location = '/~~$m.alias~'; }, touchstart: function(){ f.s1.show_load_screen_50(); setTimeout(function(){ window.location = '/~~$m.alias~'; }, 100); }}, attr: {href: '/~~$m.alias~'}" ~~if $post.alias == $m.alias~class="active"~~/if~>~~$m.name_cat~</a>
			</li>
			~~/if~

		~~/foreach~
		</ul>
		<a href="#" id="close_popup_menu" class="btn-close" onclick="$('#popup_menu,#close_popup_menu').css('display','none');return false;">close</a>

	</div>

	</div>



<script>

    $(document).ready(function (){
        
                $('#mobile-menu-login-form').on('submit', function (e){
                    
                    e.preventDefault();
                    
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        data: $(this).serialize(),
                        cache: false,
                        error: function (jqXHR, textStatus, errorThrown) {
                            toastr.error('Нет связи с сервером:'+textStatus,'Ошибка');
                        },
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);                           
                            if(data.result) {
                                toastr.success(data.message,'Сообщение');
                                setTimeout(function (){
                                    if(/unset=user/.test(window.location.search)) {
                                        window.location.href="/";
                                    }
                                    else {
                                        window.location.reload();
                                    }                                    
                                },1000);
                            }
                            else {
                                toastr.error(data.message,'Ошибка');
                            }
                        }
                    });
                    
                });        
        
    });

    var OpenmenuFunctionsProto = { constructor: function(self) { var f = this; f.s1 = {};

			f.s1.switch_login_restore_off = function(){
				self.m.s1.login.password_restore(false);
			};

			f.s1.switch_login_way_phone = function(){
				self.m.s1.login.via_phone(true);
			};

			f.s1.expand = function(data, event) {

				if(!self.m.s1.expanded()) {

          self.m.s1.expanded(!self.m.s1.expanded());
          $('.page').animate({'right' : '-200px'}, 50, 'linear');
					$('.page').addClass('mobile-menu-opened');
					$(document.body).delay(200).queue(function (next) {
						$(this).css('overflow-x', 'hidden');
						//$(this).css('position', 'fixed');
						next();
					});
					self.f.s1.switch_login_restore_off();
					self.f.s1.switch_login_way_phone();
					self.m.s1.cityexpanded(false);
					document.getElementById('mobile-menu').scrollTop = 0;
					$('.header').addClass('fix');
					$('.page').addClass('fix');

				}

			};

			// 1.4] Раскрыть левое мобильное меню
			f.s1.hide = function(data, event) {

				if(self.m.s1.expanded()) {

          self.m.s1.expanded(!self.m.s1.expanded());
          $('.page').animate({'right': 0}, 50, 'linear');
					$('.page').removeClass('mobile-menu-opened');
					$(document.body).delay(200).queue(function (next) {
						$(this).css('overflow-x', 'auto');
						//$(this).css('position', 'static');
						next();
					});
					self.f.s1.switch_login_restore_off();
					self.f.s1.switch_login_way_phone();
					self.m.s1.cityexpanded(false);
					document.getElementById('mobile-menu').scrollTop = 0;
					$('#popup_menu,#close_popup_menu').css('display','none');

				}

			};

      f.s1.switch = function(data, event) {

        if(self.m.s1.expanded()) 	self.f.s1.hide();
				else 											self.f.s1.expand();

				self.f.s1.switch_login_restore_off();
				self.f.s1.switch_login_way_phone();
				self.m.s1.cityexpanded(false);
				window.scrollTo(0,0);
				document.getElementById('mobile-menu').scrollTop = 0;

      };

      f.s1.pupup_switch = function(modalname, data, event) {
				if(!self.m.s1.modal[modalname]) return;
				self.m.s1.modal[modalname](!self.m.s1.modal[modalname]());
				window.scrollTo(0,0);
				self.f.s1.hide();
				self.m.s1.login.password_restore_msg(false);
			};

			f.s1.callback = function(data, event){

				if(event.type == 'keypress' && event.keyCode != '13') return true;
				if(self.m.s1.callback.phone().length != 15) return;
					var pars = {
						mod_name: "call_me",
						task: "put_request",
						name: self.m.s1.callback.name(),
						phone: self.m.s1.callback.phone(),
						product_arr: null
					};

					$.ajax({
						type: "POST",
						url: '/',
						data: pars,
						dataType : "json",
						success: function (data, textStatus) {
							self.m.s1.callback.form_visible(false);
							self.m.s1.callback.form_html(data.message);
							self.m.s1.callback.success_visible(true);
						}
					});

			};
			f.s1.switch_login_way = function(){
				self.m.s1.login.via_phone(!self.m.s1.login.via_phone());
			};
			f.s1.switch_login_restore = function(){
				self.m.s1.login.password_restore(!self.m.s1.login.password_restore());
			};
			f.s1.restore_password = function(){
				var pars = {
					mod_name: "registration",
					tpl: 			"restore_password",
					phone: 		self.m.s1.login.phone()
				};
				$.ajax({
					type: "POST",
					url: '/',
					data: pars,
					dataType : "json",
					success: function (data, textStatus) {
						self.m.s1.login.password_restore(false);
					},
					error: function(jqXHR, textStatus, errorThrown){
						console.log(errorThrown);
					}
				});

			};

			f.s1.switch_city_choose_mode = function(){
				self.m.s1.cityexpanded(!self.m.s1.cityexpanded());
				if(self.m.s1.cityexpanded()) {
					var element = document.getElementById('mobile-menu-city-choose');
					element.focus();
				}

			};

			f.s1.choose_city = function(data, event){
				self.m.s1.cityexpanded(false);
				self.f.s1.hide();
				self.m.s1.cities.choosen_id(data.id_filial)
				document.getElementById('mobile-menu-city-choose').submit();
				self.f.s1.show_load_screen_50();
			};

			/*
			f.s1.login = function(data, event){
				if(event.type == 'keypress' && event.keyCode != '13') return true;
				document.getElementById('mobile-menu-login-form').submit();
			};
			*/

			f.s1.show_load_screen_50 = function(){

				setTimeout(function(){
					$('.preloader-box').css('display', 'block');
				}, 50);

			};

			f.s1.hide_load_screen_50 = function(){
				setTimeout(function(){
					$('.preloader-box').css('display', 'none');
				}, 50);
			};



    return f; }};
~~*
    var OpenmenuModelProto = { constructor: function(OpenmenuFunctionsProto) {

      var self = this;
      self.m = {};
      self.f = Object.create(OpenmenuFunctionsProto).constructor(self);

      self.m.s1 = {};

        self.m.s1.expanded = ko.observable(false);
        self.m.s1.cityexpanded = ko.observable(false);

				self.m.s1.modal = {};

					self.m.s1.modal.login = ko.observable(false);
					self.m.s1.modal.callback = ko.observable(false);

				self.m.s1.callback = {};

					self.m.s1.callback.name = ko.observable('');
					self.m.s1.callback.phone = ko.observable('');
					self.m.s1.callback.form_visible = ko.observable(true);
					self.m.s1.callback.form_html	 = ko.observable("" +
							"<p>" +
							"<span>Спасибо!</span>" +
							"<br>" +
							"<span>Пожалуйста ожидайте звонок оператора.</span>" +
							"</p>");
					self.m.s1.callback.success_visible = ko.observable(false);

				self.m.s1.login = {};

					self.m.s1.login.phone = ko.observable('');
					self.m.s1.login.email_login = ko.observable('');
					self.m.s1.login.password = ko.observable('');
					self.m.s1.login.via_phone = ko.observable(true);
					self.m.s1.login.password_restore = ko.observable(false);
					self.m.s1.login.password_restore_msg = ko.observable(false);
					self.m.s1.login.password_restore_msg_html = ko.observable('Восстановление пароля');

				self.m.s1.username = ko.observable("~~$user.name~");
				self.m.s1.is_loggedin = ko.computed(function(){

					if(self.m.s1.username()) return true;
					return false;

				});

				self.m.s1.cities = {};

					self.m.s1.cities.list = ko.observableArray(~~$filials_json~);
					self.m.s1.cities.choosen_id = ko.observable("~~$filial.id_filial~");

      ko.computed(function(){
        self.m.s1.indexes = {};

				self.m.s1.indexes.cities = (function(){
					var results = {};
					for(var i=0; i<self.m.s1.cities.list().length; i++) {
						results[self.m.s1.cities.list()[i].id_filial] = self.m.s1.cities.list()[i];
					}
					return results;
				}());
      });

      ko.computed(function(){
        if(!ko.computedContext.isInitial()) return;

				(function(){

					window.onresize = function(event, params){

						if(window.innerWidth > 768) {
							self.f.s1.hide();
							$('#popup_menu,#close_popup_menu').css('display','none');
							$(document.body).delay(200).queue(function (next) {
								$(this).css('overflow-x', 'auto');
								$(this).css('position', 'static');
								next();
							});
						}

					};

				})();

				(function(){

					Ps.initialize(document.getElementById('mobile-menu'), {
						wheelSpeed:.4,
						wheelPropagation: true,
						minScrollbarLength: 20
					});

					Ps.initialize(document.getElementById('mobile-menu-city-choose-panel'), {
						wheelSpeed:.4,
						wheelPropagation: true,
						minScrollbarLength: 20,
						suppressScrollX: true
					});


				})();


      });
      return self;

    }};
    var model_openmenu = Object.create(OpenmenuModelProto).constructor(OpenmenuFunctionsProto);
    ko.applyBindings(model_openmenu, document.getElementsByClassName('open-menu-wrapper')[0]);

	*~
		function popup_menu(e){
			//e.preventDefault();
			$('#popup_menu').css({
				display:'block',
				position:'fixed',
				top:'30%',
				left:'50%'
			});
			$('#close_popup_menu').css({
				display:'block',
				'z-index':'1003',
				position:'fixed',
				top:'calc(30% + 10px)',
				left:'calc(50% + 125px)'
			});
		}

</script>
			    
			    













