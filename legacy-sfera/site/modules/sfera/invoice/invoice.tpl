<!DOCTYPE html>
<html lang="ru">

	<head>
		<meta charset="utf-8">
		<title>Ru.Market</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="format-detection" content="telephone=no">
		<meta name="mobile-web-app-capable" content="yes">
		<link rel="icon" type="image/png" sizes="120x120" href="assets/img/icon.png">
		<link rel="stylesheet" type="text/css" href="/assets/css/libs.css">
		<link rel="stylesheet" type="text/css" href="/assets/js/lightGallery/css/lightgallery.min.css">
		<link rel="stylesheet" type="text/css" href="/assets/css/app.css">
		<!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<style>
			html,
			body {
				height: 100%;
			}
			.wrapper {
				display: flex;
				flex-direction: column;
				min-height: 100%;
			}
			.content {
				flex: 1 0 auto;
			}


			a.cart {
			    width: 21px;
			    height: 21px;
			    background: url(/images/ico-cart.svg) no-repeat;
			    background-size: 100% 100%;
			}
			.counter {
			    position: absolute;
			    top: 4px;
			    right: -8px;
			    border-radius: 16px;
			    border: 2px solid #fff;
			    height: 20px;
			    min-width: 8px;
			    padding: 0 4px;
			    background: #ec5a1e;
			    color: #fff;
			    font: 11px/16px 'PT Sans Narrow',serif;
			    text-align: center;
			}

				.header__search {
  padding-left: 15px;
}

@media only screen and (max-width: 940px) {
  .header__search {
    padding-left: 0;
  }
}

@media only screen and (max-width: 480px) {
  .header__search {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
  }
}

.header__search .search:before {
  display: none;
}

/*@media only screen and (max-width: 760px) {
  .header__search .search__input {
    padding-top: 7px;
    padding-bottom: 7px;
  }
}*/

@media only screen and (max-width: 480px) {
  .header__search .search__input {
    border-radius: 0;
  }
}

@media only screen and (max-width: 480px) {
  .header__search .search__submit {
    display: none;
  }
}

@media only screen and (max-width: 480px) {
  .header__search .search__close {
    display: block;
  }
}

.search .awesomplete > ul {
  border-top: 0;
}

.search .awesomplete > ul > li {
  text-decoration: none;
  padding: 0;
  border-bottom: 1px solid rgba(0, 0, 0, 0.3);
}

.search .awesomplete > ul > li:last-child {
  border-bottom: 0;
}


.product-ac {
  padding: 15px 10px;
}

.product-ac__inn {
  table-layout: fixed;
}

.product-ac__inn > * {
  vertical-align: top;
}

.product-ac__photo {
  width: 80px;
  padding-right: 20px;
}

@media only screen and (max-width: 640px) {
  .product-ac__photo {
    width: 50px;
    padding-right: 10px;
  }
}

.product-ac__img {
  display: inline-block;
  max-width: 100%;
  width: 100%;
}

.product-ac__name {
  max-width: 350px;
  font-size: 14px;
  -o-text-overflow: clip;
  text-overflow: clip;
  display: inline-block;
  white-space: normal;
  overflow: visible;
  line-height: 1.3;
}

@media only screen and (max-width: 640px) {
  .product-ac__name {
    font-size: 12px;
  }
}

.product-ac .price, .product-ac .bx-soa-cart-total-line-total .bx-soa-cart-d, .bx-soa-cart-total-line-total .product-ac .bx-soa-cart-d {
  display: block;
  font-size: 16px;
}

@media only screen and (max-width: 640px) {
  .product-ac .price, .product-ac .bx-soa-cart-total-line-total .bx-soa-cart-d, .bx-soa-cart-total-line-total .product-ac .bx-soa-cart-d {
    font-size: 14px;
  }
}


.item-grid__name, .product-ac__name {
  font-size: 16px;
  color: #2f2f2f;
  font-weight: 300;
  margin-bottom: 5px;
  -webkit-transition: all ease .3s;
  -o-transition: all ease .3s;
  transition: all ease .3s;
  display: inline-block;
  white-space: nowrap;
  overflow: hidden;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  width: 100%;
  padding-left: 5px;
}

@media only screen and (max-width: 480px) {
  .item-grid__name, .product-ac__name {
    font-size: 16px;
    margin-bottom: 3px;
  }
}

.item-grid__name:hover, .product-ac__name:hover {
  color: #d22262;
  text-decoration: underline;
}


		i.icon-user:before {
			width: 21px;
		    content: " ";
		    background: url(/assets/img/user-profile.svg) no-repeat;
		    position: absolute;
		    left: 0px;
		    top: -2px;
		    height: 17px;
		    background-size: 100% 100%;
		}
	@media only screen and (max-width: 760px){
		.nav {
    		display: table !important;


		}
	}
	@media only screen and (max-width: 760px){
		.header {
    		display: block !important;
    		position: relative;
		}
	}
	@media only screen and (max-width: 760px){
		button {
			margin-top: 0 !important;
			}
	}
	@media only screen and (max-width: 760px){
		.catalog {
	    		    padding: 25px 0;
    display: none;
    animation: fadeIn .3s forwards;
    border-top: 2px solid #eaeaea;
    width: 100%;
    background: #ffffff;
			}
	}


		</style>
<style type="text/css">
				.form-wrap {
/*					  width: 550px;*/
					  border-radius: 20px;
/*	  				  margin: 0 auto;*/
					}
					.form-wrap *{transition: .1s linear}
					.profile {
					  width: 240px;
					  float: left;
					  text-align: center;
					  padding: 30px;
					}
					form {
					  background: white;
					  float: center;
					  width: calc(100% - 240px);
					  padding: 30px;
					  border-radius: 0 20px 20px 0;
					  color: #7b7b7b; 
	 				  margin: 0 auto;	

					}
					.form-wrap:after, form div:after {
					  content: "";
					  display: table;
					  clear: both;
					}
					form div {
					  margin-bottom: 15px;
					  position: relative;
					}
					h1 {
					  font-size: 24px;
					  font-weight: 400;
					  position: relative;
					  margin-top: 50px;
					  text-align: center;
					}

					/********************** стилизация элементов формы **********************/
					label, span {
					  font-size: 14px;
					  margin-bottom: 8px;
					}
					input[type="text"], input[type="email"] {
					  border-width: 0;
					  outline: none;
					  margin: 0;
					  width: 100%;
					  padding: 10px 15px;
					  background: #e6e6e6;
					}
					input[type="text"]:focus, input[type="email"]:focus {
					  box-shadow: inset 0 0 0 2px rgba(0,0,0,.2);
					}

					select {
					  width: 100%;
					  cursor: pointer;
					  padding: 10px 15px;
					  outline: 0;
					  border: 0;
					  background: #e6e6e6;
					  color: #7b7b7b;
					  -webkit-appearance: none; /*убираем галочку в webkit-браузерах*/
					  -moz-appearance: none; /*убираем галочку в Mozilla Firefox*/
					}
					select::-ms-expand {
					  display: none; /*убираем галочку в IE*/
					}
					.select-arrow {
					  position: absolute;
					  top: 38px;
					  right: 15px;
					  width: 0;
					  height: 0;
					  pointer-events: none; /*активизируем показ списка при нажатии на стрелку*/
					  border-style: solid;
					  border-width: 8px 5px 0 5px;
					  border-color: #7b7b7b transparent transparent transparent;
					}
					button {
					  padding: 10px 10px;
					  border-width: 0;
					  display: block;
					  margin: 25px auto 0;
					  background: #4099FD;
					  color: white;
					  font-size: 15px;
					  outline: none;
					  border-radius: 15px;
					}

					/********************** добавляем форме адаптивность **********************/
					@media (max-width: 600px) {
					  .form-wrap {margin: 20px auto; max-width: 550px; width:100%;}
					  .profile, form {float: none; width: 100%;}
					  h1 {margin-top: auto; padding-bottom: 50px;}
					  form {border-radius: 0 0 20px 20px;}
					}
					.catalog__close{
						z-index: 100;
					}
					input[type='checkbox']{
						margin-right: 5px;
						float: left;
						margin-bottom: 2px;
					}
					#innInput{
						margin: 0 auto;
						width: 300px;
						margin-bottom: 55px;
					}
					#innInput label{
						text-align: center;
					}
					.categories-menu__item{
						margin-bottom: 0 !important;
					}
					.categories-menu__item-inn{
						margin-bottom: 8 !important;
					}
					.categories-menu__item-inn label{
						margin-bottom: 0 !important;
					}
					.categories-menu__link{
						margin-bottom: 15px !important;
					}
					.vznos{
						margin: 0 auto;
					}
	</style>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){

			    $("[data-toggle='location-dropdown']").click(function(e) {   
			        $(".location-dropdown").toggleClass("hidden");  
			        e.stopPropagation();
			    });


			});
		</script> 


        ~~include file="tpl/js.tpl"~


		
	</head>

	<body>


		<div class="m-nav js-m-nav">
			<div class="m-nav__group">
				~~include file='market/tpl/m-nav__catalog.tpl'~
			</div>
		</div>
		<a href="#" class="up-btn js-up-btn">Наверх</a>

		<div class="l-main js-main wrapper">
			<div class="form-wrap">
	    		<h1>Введите ИНН для формирования счета</h1>
	  			<form method="post" action="/invoice/" target="_blank">
	    			<div id="innInput">
	     				<input type="text" name="inn" placeholder="ИНН" required>
	    			</div>



	    <header class="header js-header">
          <nav class="nav js-nav">
            <div class="l-wrapper">
              <ul class="nav__list">

                ~~*foreach from=$c_data.tree item=i~
                ~~if $i.parent_id == 2~


                <li class="nav__item js-catalog-toggle" id='~~$i.id~'>
                  <a class="nav__link nav__link--sub" href="#"><span>~~$i.title~</span></a>
                </li>

                ~~/if~
                ~~/foreach*~

              </ul>
            </div>
          </nav>
	    ~~*
          ~~foreach from=$c_data.tree item=i~
          ~~if $i.parent_id == 2~

          <div class="catalog js-catalog-~~$i.id~">
            <div class="catalog__inn">
              <div class="l-wrapper">
                <div class="catalog__content">
                  <a href="#" class="catalog__close close-btn js-catalog-close">Закрыть</a>
                  <div class="catalog__title">
                    ~~$i.title~
                  </div>
                  <div class="catalog__content-inn">
                    <div class="catalog__categories">
                      <ul class="categories-menu">

                        ~~foreach from=$c_data.tree item=j~
                        ~~if $j.parent_id == $i.id~


                        <li class="categories-menu__item categories-menu__item--sub">
                          <div class="categories-menu__item-inn">
                            <a href="#" class="categories-menu__link categories-menu__title">~~$j.title~</a>
                            <div class="categories-menu__count">

                            </div>
                          </div>
                          <ul class="categories-menu__sub">

                            ~~foreach from=$c_data.tree item=k~
                            ~~if $k.parent_id == $j.id~
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn">
                           	<input type="checkbox" id="~~$k.title~" name="form[]" value = "~~$k.title~">
	                          	<label for="~~$k.title~">~~$k.title~</label>
                               <!--a href="#" class="categories-menu__link">~~$k.title~</a-->
                              </div>

                            </li>
                            ~~/if~
                            ~~/foreach~

                          </ul>
                        </li>

                        ~~/if~
                        ~~/foreach~

                      </ul>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

          ~~/if~
          ~~/foreach~

			*~

				</div>
			</header>

			<!--div class="vznos">
				<input type="checkbox" name="vznos[]" value = "1" checked="checked">
	        	<label for="vznos">Взнос организационного сбора для регистрации на платформе ru.market для 1 категории</label>
			</div-->
			
   		 <button type="submit">Сформировать счет</button> 
	  			</form> 
			</div>
			
		</div>
		~~include file='market/tpl/bottom_script.tpl'~
	</body>

</html>