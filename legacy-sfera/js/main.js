

function move_to_cart(btn, amount, e){

		    //console.log(e,btn);
		    //alert(dump(btn));
		    
		    var guid = btn.attr('data-guid');
		    var id_cat = btn.attr('data-id_cat');
		    
		    var flyCart = jQuery('<span class="flycart">+'+amount+'</span>');
		    
		    var flyCoordinatesX = e.pageX,
		    flyCoordinatesY = e.pageY,
		    cartCoordinatesX = $('.to_cart').offset().left,
		    cartCoordinatesY = $('.to_cart').offset().top;
		    
		    /*
		    if ($('.main-header').hasClass('fixed')) {
			cartCoordinatesX = $('.main-header .cart').offset().left;
			cartCoordinatesy = $('.main-header .cart').offset().top;
		    }
		    */
		    
		    if (cartCoordinatesX == 0) {
			cartCoordinatesX = $(window).width() - 40;
		    }
		    
		    flyCart.css({
			'left': flyCoordinatesX - 12,
			'top': flyCoordinatesY - 12,
			'z-index': 1000
		    });
		    
		    
		    $('body').append(flyCart);

			console.log('flyCart');
		    
		    flyCart.animate({
					'left': cartCoordinatesX,
					'top': cartCoordinatesY
				    },
				{
				duration: 1500, // продолжительность анимации
				easing: "linear", // скорость анимации
				complete: function(){ // callback

					setTimeout(function () {

						put_item(guid, id_cat);	// ajax запрос на добавление в корзину
						$('.flycart').remove();

					}, 1500);

					//$(".status").text("Анимация завершена");
				},
				queue: false // не ставим в очередь

			});

}				    

// ограничитель содержимого для textarea (см. страницу отзывы)
(function($) {
    $.fn.extend( {
        limiter: function(limit, elem) {
            $(this).on("keyup focus", function() {
                setCount(this, elem);
            });
            function setCount(src, elem) {
                var chars = src.value.length;
                if (chars > limit) {
                    src.value = src.value.substr(0, limit);
                    chars = limit;
                }
                elem.html( limit - chars );
            }
            setCount($(this)[0], elem);
        }
    });
})(jQuery);
	


$(function(){


	var footer = {

		opener: jQuery('.sitemap'),
		slide: jQuery('.footer-l'),

		init: function() {

			var self = this;
			self.opener.on('click', function(e){
				e.preventDefault();
				self.slide.slideToggle();
			});

			$(window).resize(function(){
				if($(this).width() > 767) {
					self.slide.removeAttr('style');
				}
			})

		}

	};

	footer.init();


	/*
			$(window).resize(function(){
				var block = $('#popup-box-in');
				block.hide();
			})		
	*/


	if($('.slider').length) {

		$('.slider, .slider5, .slider6').owlCarousel({
			items : 4,
			itemsDesktop : [1024,3],
			itemsDesktopSmall : [786,2],
			itemsTablet: [533,1],
			navigation: true,
			mouseDrag: true,
			addClassActive : true,
			rewindNav: false,
			pagination: true,
			afterInit: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterMove: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterAction: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			}
		});

	}

	if($('.slider2').length) {

		var slider2 = $('.slider2');
		var slider3 = $('.slider3');

		var divs = $(".item", slider2);
		for(var i = 0; i < divs.length; i+=2) {
			divs.slice(i, i+2).wrapAll("<div class='item-wrap'></div>");
		}

		slider2.owlCarousel({
			items : 1,
			itemsDesktop : [1000,1],
			itemsDesktopSmall : [1024,1],
			itemsTablet: [786,2],
			navigation: true,
			mouseDrag: true,
			addClassActive : true,
			rewindNav: false,
			pagination: true,
			afterInit: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterMove: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterAction: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			}
		});

		slider3.owlCarousel({
			items : 2,
			itemsDesktop : [1000,1],
			itemsDesktopSmall : [1024,2],
			itemsTablet: [786,2],
			navigation: true,
			mouseDrag: true,
			addClassActive : true,
			rewindNav: false,
			pagination: true,
			afterInit: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterMove: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterAction: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			}
		});

	}

	if($('.slider4').length) {

		var slider4 = $('.slider4');

		slider4.owlCarousel({
			items : 1,
			itemsDesktop : [1000,1],
			itemsDesktopSmall : [1024,1],
			itemsTablet: [786,2],
			navigation: true,
			mouseDrag: true,
			addClassActive : true,
			rewindNav: false,
			pagination: true,
			afterInit: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterMove: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterAction: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			}
		});

	}

	if($('.additional-sorts').length) {

		var additionalSorts = $('.additional-sorts');

		additionalSorts.owlCarousel({
			items : 6,
			itemsDesktop : [1000,6],
			itemsDesktopSmall : [1024,3],
			itemsTablet: [786,2],
			navigation: true,
			mouseDrag: true,
			addClassActive : true,
			rewindNav: false,
			pagination: true,
		    
			//autoPlay: 5000,
			slideSpeed: 450,
			loop: true,
		    
			afterInit: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterMove: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			},
			afterAction: function(item){
				item.find('.owl-item.active').first().addClass('firstActive');
			}
		});

	}

	window.addEventListener( "DOMContentLoaded", function(){

		// Скрыть панель панели загрузки
		if($('.preloader-box').length) {
		  $('.preloader-box').css('display', 'none');
		}

	});

	//$(document).ready(function(){
  //
	//	// Скрыть панель панели загрузки
	//	if($('.preloader-box').length) {
	//	  $('.preloader-box').css('display', 'none');
	//	}
  //
	//});


    var mobileFilters = {

        init: function(filter) {

            var el = filter,
                opener = jQuery(el).find('.selected'),
                drop = jQuery(el).find('>ul'),
                parent = jQuery(el).parent();

            opener.on('click', function(){

                parent.toggleClass('active');

                drop.fadeToggle(300);

            })

        }
    };

    $('.filter-wrap').each(function(){
        mobileFilters.init($(this).find('>div'));
    });





	if($('.totop').length) {
		$('.totop').on('click', function(e){
			e.preventDefault();
			$('html, body').animate({
				scrollTop: 0
			}, 200)
		})
	}

	function showPass() {

		if($('.passwrap').length) {

			var passInp = $('.passwrap'),
				showBtn;

			passInp.each(function(){

				var inpEl = $(this).find('input');

				showBtn = $(this).find('.show-pass');

				showBtn.on('click', function() {

					if($(this).hasClass('active')) {

						$(this).removeClass('active');
						inpEl.attr('type', 'password');

					} else {

						$(this).addClass('active');
						inpEl.attr('type', 'text');

					}

				})


			})

		}

	}

	showPass();


	if($('.policy').length) {

		var anchor = $('.policy-filters a');

		anchor.on('click', function(e) {

			e.preventDefault();

			var dest = $(this).attr('href');

			$('html, body').animate({
				scrollTop: $(dest).offset().top - 100
			}, 500);

		})

	}



	if($('.standart').length) {

		var parent = $('.main-rules-box');

		parent.each(function(){

			var opener = $(this).find('.open-more'),
				slide = $(this).find('.hidden-text');

			opener.click(function(e){

				e.preventDefault();

				if(!$(this).hasClass('active')) {

					$(this).addClass('active');
					$(this).text('Свернуть');
					slide.slideDown();

				} else {

					$(this).removeClass('active');
					$(this).text('Раскрыть');
					slide.slideUp();

				}

			})

		})

	}

	function slideText() {

		if($('.opener-text').length) {

			var opener = $('.opener-text'),
				slide = $('.slide-text');

			opener.click(function(e){

				e.preventDefault();

				if(!$(this).hasClass('active')) {

					$(this).addClass('active');
					$(this).text('Свернуть');
					slide.slideDown();

				} else {

					$(this).removeClass('active');
					$(this).text('Раскрыть');
					slide.slideUp();

				}

			})

		}

	}
	slideText();

});

function dump(arr, level){
    var dumped_text = "";
    if (!level) 
        level = 0;
    var level_padding = "";
    for (var j = 0; j < level + 1; j++) 
        level_padding += "    ";
    if (typeof(arr) == 'object') {
        for (var item in arr) {
            var value = arr[item];
            if (typeof(value) == 'object') {
                dumped_text += level_padding + "'" + item + "' ...\n";
                dumped_text += dump(value, level + 1);
            }
            else {
                dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
            }
        }
    }
    else {
        dumped_text = "===>" + arr + "<===(" + typeof(arr) + ")";
    }
    return dumped_text;
}

    jQuery.extend({
        serialize: function(mixed_value){
            var _getType = function(inp){
                var type = typeof inp, match;
                var key;
                if (type == 'object' && !inp) {
                    return 'null';
                }
                if (type == "object") {
                    if (!inp.constructor) {
                        return 'object';
                    }
                    var cons = inp.constructor.toString();
                    match = cons.match(/(\w+)\(/);
                    if (match) {
                        cons = match[1].toLowerCase();
                    }
                    var types = ["boolean", "number", "string", "array"];
                    for (key in types) {
                        if (cons == types[key]) {
                            type = types[key];
                            break;
                        }
                    }
                }
                return type;
            };
            var type = _getType(mixed_value);
            var val, ktype = '';
            
            switch (type) {
                case "function":
                    val = "";
                    break;
                case "boolean":
                    val = "b:" + (mixed_value ? "1" : "0");
                    break;
                case "number":
                    val = (Math.round(mixed_value) == mixed_value ? "i" : "d") + ":" + mixed_value;
                    break;
                case "string":
                    val = "s:" + encodeURIComponent(mixed_value).replace(/%../g, 'x').length + ":\"" + mixed_value + "\"";
                    break;
                case "array":
                case "object":
                    val = "a";
                    /*
                 if (type == "object") {
                 var objname = mixed_value.constructor.toString().match(/(\w+)\(\)/);
                 if (objname == undefined) {
                 return;
                 }
                 objname[1] = serialize(objname[1]);
                 val = "O" + objname[1].substring(1, objname[1].length - 1);
                 }
                 */
                    var count = 0;
                    var vals = "";
                    var okey;
                    var key;
                    for (key in mixed_value) {
                        ktype = _getType(mixed_value[key]);
                        if (ktype == "function") {
                            continue;
                        }
                        
                        okey = (key.match(/^[0-9]+$/) ? parseInt(key, 10) : key);
                        vals += $.serialize(okey) +
                        $.serialize(mixed_value[key]);
                        count++;
                    }
                    val += ":" + count + ":{" + vals + "}";
                    break;
                case "undefined": 
                default: 
                    val = "N";
                    break;
            }
            if (type != "object" && type != "array") {
                val += ";";
            }
            return val;
        }
    });

// ============================== for validate jQuery plugin =======================    
var matched, browser;

jQuery.uaMatch = function( ua ) {
ua = ua.toLowerCase();

var match = /(chrome)[ \/]([\w.]+)/.exec( ua ) ||
/(webkit)[ \/]([\w.]+)/.exec( ua ) ||
/(opera)(?:.*version|)[ \/]([\w.]+)/.exec( ua ) ||
/(msie) ([\w.]+)/.exec( ua ) ||
ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec( ua ) ||
[];

return {
browser: match[ 1 ] || "",
version: match[ 2 ] || "0"
};
};

matched = jQuery.uaMatch( navigator.userAgent );
browser = {};

if ( matched.browser ) {
browser[ matched.browser ] = true;
browser.version = matched.version;
}

// Chrome is Webkit, but Webkit is also Safari.
if ( browser.chrome ) {
browser.webkit = true;
} else if ( browser.webkit ) {
browser.safari = true;
}

jQuery.browser = browser; 
// ==============================
    
function parseUrlQuery(url) {
    
    var data = {};
    
    if(!url && location.search) {
        url = location.search;
    }

    if(url) {

        var pair = (url.replace("?","")).split('&');

        for(var i = 0; i < pair.length; i ++) {

            var param = pair[i].split('=');
            if(/([^\[\]]+)\[([^\[\]]*)\]/i.test(param[0])) {
                var matches = /([^\[\]]+)\[([^\[\]]*)\]/i.exec(param[0]);
                if(typeof(data[decodeURIComponent(matches[1])])==="undefined") {
                    data[decodeURIComponent(matches[1])] = []; 
                }
                if(matches[2]) {
                    data[decodeURIComponent(matches[1])][decodeURIComponent(matches[2])]=decodeURIComponent(param[1]);
                }
                else {
                    data[decodeURIComponent(matches[1])].push(decodeURIComponent(param[1]));
                }
            }
            else {
                data[decodeURIComponent(param[0])] = decodeURIComponent(param[1]);
            }
            

        }

    }

    return data;

}
	var pdp = {

		init: function() {

			this.tabs();
			this.changeSize();
			this.oneClickOrderPopupPosition();
			this.oneClickPopupActions();
			this.pdpFlyCartAction();
			this.descriptionPopup();
			this.zoomOutWhenCursorOut();

		},

		tabs: function() {

			var tabLink = jQuery('.tabs-wrap ul li'),
				photos = jQuery('.pdp-img .photo'),
				activeClass = 'active';

//			tabLink.on('click', function(e){
//
//				e.preventDefault();
//
//				var el = $(this),
//					ind = el.index(),
//					photo = photos.eq(ind);
//
//				tabLink.removeClass(activeClass);
//				photos.removeClass(activeClass);
//				el.addClass(activeClass);
//				photo.addClass(activeClass);
//
//			});


			photos.click(function(){

				var el = $(this);

				if($(window).width() > 1023) {

					if(el.hasClass('zoomed')) {

						setTimeout(function(){
							el.removeClass('zoomed');
							el.parent().css('position', 'relative');
							el.find('a').show();
						}, 200);

					} else {

						el.find('a').hide();
						el.addClass('zoomed');
						el.parent().css('position', 'static');

					}

				}

			});

			if(photos.length && $(window).width() > 1023) {

				photos.zoom({
					on:'click',
					duration: 150,
					magnify: 2
				});

			}

		},

		zoomOutWhenCursorOut: function(){

			// 1] FIX функция для IE (при работе с relatedTarget)
			// - Если это IE, то добавляе объекту event свойство relatedTarget с правильным содержанием
			function fixRelatedTarget(e) {
				if (!e.relatedTarget) {
					if (e.type == 'mouseover') e.relatedTarget = e.fromElement;
					if (e.type == 'mouseout') e.relatedTarget = e.toElement;
				}
			}

			// 2] Получить все элементы с классом .photo
			var photos = document.getElementsByClassName('photo');

			// 3] Каждому из photos назначить обработчик события mouseout
			for(var i=0; i<photos.length; i++) {

				addEvent(photos[i], 'mouseout', function(event, params){

					var el = $(params.element);

					if(el.hasClass('zoomed') && el.hasClass('active')) {

						el.trigger('click');

					}

				}, {element: photos[i]});

			}

		},

		changeSize: function() {

			var size = jQuery('.pdp-text .size-wrap ul a');

			size.on('click', function(e){

				e.preventDefault();

				size.removeClass('active');

				$(this).addClass('active');

			})

		},

		oneClickOrderPopupPosition: function(){

			var popup = jQuery('.one-click-popup'),
				opener = jQuery('.price-box .one-click'),
				posX = opener.offset().left,
				posY = opener.offset().top;

			popup.css({
				'left' : posX + 'px',
				'top' : posY + 'px'
			})

		},

		oneClickPopupActions: function(){

			var successFlag = true,
				popup = jQuery('.one-click-popup'),
				form = popup.find('form'),
				btn = form.find('input:submit'),
				message = popup.find('.success-message'),
				opener = jQuery('.price-box .one-click'),
				close = popup.find('.btn-close-popup');

			opener.on('click', function(e){

				e.preventDefault();

				popup.show();
				popup.animate({
					'margin-top':'48px',
					'opacity':1
				}, 200)

			});

			close.on('click', function(e){

				e.preventDefault();

				popup.animate({
					'margin-top':'38px',
					'opacity':0
				}, 200)

			});

			if(successFlag) {

				btn.on('click', function(e){

					e.preventDefault();

					form.fadeOut(300, function(){
						message.fadeIn();
					})

				})

			}
		},

		pdpFlyCartAction: function(){

			var addCartBtn = jQuery('.pdp-text .price-box .btn'),
				lightbox = jQuery('.item-lightbox'),
				close = lightbox.find('.btn-close-lightbox');



			addCartBtn.on('click', function(e){

				e.preventDefault();

				var btn = $(this);

				if(!btn.hasClass('with-additional')) {

					//$('body').append('<div class="fader"></div>');

					//$('.fader').fadeIn(300);

					var lightboxHeight = lightbox.height();

					if($(window).height() > lightboxHeight) {
						lightbox.css({
							'top':'50%',
							'margin-top': $(window).scrollTop() - (lightboxHeight/2) + 'px'
						})
					} else {
						lightbox.css({
							'top':$(window).scrollTop() + 10 + 'px'
						})
					}

					setTimeout(function(){

						lightbox.fadeIn();

					}, 300);

				} else {

					flyCartBullet(e, btn, '.pdp-text');

				}

			});

			$('.item-lightbox .total .btn').on('click', function(e) {

				e.preventDefault();

				var button = $(this);

				flyCartBullet(e, button, '.item-lightbox');

			});

			$('.btn-close-lightbox').on('click', function(e){

				e.preventDefault();

				lightbox.fadeOut();

				setTimeout(function(){

					$('.fader').fadeOut('300', function(){
						$('.fader').remove();
						$('body').removeClass('lightbox-appears');
						$("html").niceScroll({
							zindex: 101,
							scrollspeed: 0
						});
					});

				}, 300);

			});

			$(document).on('click', '.fader', function(){

				$('.btn-close-lightbox').click();

			});

		},

		descriptionPopup: function() {

			var opener = $('.full-description a'),
				popup = $('.full-description-popup'),
				close = popup.find('.btn-close-description');

			if($(window).width() > 767) {

				opener.on('click', function(e){

					e.preventDefault();

					var topCoord = $(this).position().top - 18;

					popup.css('top', topCoord);

					popup.show();

					popup.animate({

						'margin-right' : '10px',
						'opacity' : 1

					}, 300)

				});

				close.on('click', function(e){

					e.preventDefault();

					popup.animate({

						'margin-right' : '0px',
						'opacity' : 0

					}, 300, function(){

						popup.hide();

					})

				})

			} else {

				opener.on('click', function(e){

					e.preventDefault();

					var topCoord = $(this).position().top + 12;

					popup.css('top', topCoord);

					popup.show();

					popup.animate({

						'margin-top' : '10px',
						'opacity' : 1

					}, 300)

				});

				close.on('click', function(e){

					e.preventDefault();

					popup.animate({

						'margin-top' : '0px',
						'opacity' : 0

					}, 300, function(){

						popup.hide();

					})

				})

			}

			$(document).mouseup(function (e){

				if(popup.is(':visible') && !popup.is(e.target) && !popup.children().is(e.target)) {

					close.click();

				}

			});

		}

	};

	//if($('.pdp').length) {
		//pdp.init();
	//}


	//$(window).resize(function(){
	//	if($('.pdp').length) {
	//		pdp.oneClickOrderPopupPosition();
	//	}
	//});


	(function($){
		
		var keyString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
		
		var uTF8Encode = function(string) {
			string = string.replace(/\x0d\x0a/g, "\x0a");
			var output = "";
			for (var n = 0; n < string.length; n++) {
				var c = string.charCodeAt(n);
				if (c < 128) {
					output += String.fromCharCode(c);
				} else if ((c > 127) && (c < 2048)) {
					output += String.fromCharCode((c >> 6) | 192);
					output += String.fromCharCode((c & 63) | 128);
				} else {
					output += String.fromCharCode((c >> 12) | 224);
					output += String.fromCharCode(((c >> 6) & 63) | 128);
					output += String.fromCharCode((c & 63) | 128);
				}
			}
			return output;
		};
		
		var uTF8Decode = function(input) {
			var string = "";
			var i = 0;
			var c = c1 = c2 = 0;
			while ( i < input.length ) {
				c = input.charCodeAt(i);
				if (c < 128) {
					string += String.fromCharCode(c);
					i++;
				} else if ((c > 191) && (c < 224)) {
					c2 = input.charCodeAt(i+1);
					string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
					i += 2;
				} else {
					c2 = input.charCodeAt(i+1);
					c3 = input.charCodeAt(i+2);
					string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
					i += 3;
				}
			}
			return string;
		}
		
		$.extend({
			base64Encode: function(input) {
				var output = "";
				var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
				var i = 0;
				input = uTF8Encode(input);
				while (i < input.length) {
					chr1 = input.charCodeAt(i++);
					chr2 = input.charCodeAt(i++);
					chr3 = input.charCodeAt(i++);
					enc1 = chr1 >> 2;
					enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
					enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
					enc4 = chr3 & 63;
					if (isNaN(chr2)) {
						enc3 = enc4 = 64;
					} else if (isNaN(chr3)) {
						enc4 = 64;
					}
					output = output + keyString.charAt(enc1) + keyString.charAt(enc2) + keyString.charAt(enc3) + keyString.charAt(enc4);
				}
				return output;
			},
			base64Decode: function(input) {
				var output = "";
				var chr1, chr2, chr3;
				var enc1, enc2, enc3, enc4;
				var i = 0;
				input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
				while (i < input.length) {
					enc1 = keyString.indexOf(input.charAt(i++));
					enc2 = keyString.indexOf(input.charAt(i++));
					enc3 = keyString.indexOf(input.charAt(i++));
					enc4 = keyString.indexOf(input.charAt(i++));
					chr1 = (enc1 << 2) | (enc2 >> 4);
					chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
					chr3 = ((enc3 & 3) << 6) | enc4;
					output = output + String.fromCharCode(chr1);
					if (enc3 != 64) {
						output = output + String.fromCharCode(chr2);
					}
					if (enc4 != 64) {
						output = output + String.fromCharCode(chr3);
					}
				}
				output = uTF8Decode(output);
				return output;
			}
		});
	})(jQuery);

	$(window).load(function(){

        //sameHeight('.items', '.item');

	});

	$(window).resize(function(){

        //sameHeight('.items', '.item');

	});

	function sameHeight(parent, col) {

		$(parent).each(function(){

			var highestBox = 0;

			$(col, this).each(function(){

				if($(this).height() > highestBox) {

					highestBox = $(this).height();

				}

			});

			$(col,this).height(highestBox);

			if(col == '.image') {
				$(col,this).css('line-height', highestBox + 'px');
			}

		});

	}

	$(window).load(function(){

        //sameHeight('.items', '.item');
        
		if($('.tel-input').length) {

			$('.tel-input').mask("8-999-999-99-99");

		}

	});


	$(window).load(function(){

        
		if($('#cert').length) {

			$('#cert').mask("999999-999");

		}

	});


function initSwiper(){

	let swiperThumb = new Swiper('.swiper-thumbnails:not(.swiper-initialized)', {
		speed: 400,
		spaceBetween: 100,
		pagination: {
			el: '.swiper-pagination',
			clickable: true
		},
		on: {
			init: function (e) {
				const sliderItem = e;
				const sliders = e.el;
				const sliderLength = sliderItem.slides.length;

				/*
				sliders.addEventListener('mousemove', (e) => {
					if (sliderLength > 1) {
						const sliderWidth = sliderItem.width;
						const sliderPath = Math.round(sliderWidth / sliderLength);
						let sliderParent = sliderItem.el.closest('.i8a.a9i.j1a.ca8c.acc9');
						let sliderMousePos = e.clientX;
						if(sliderParent === null) {
							sliderParent = sliderItem.el.closest('.ix9.i9x.iy0');
						}
						sliderMousePos = e.clientX - sliderParent.offsetLeft;
						const sliderSlide = Math.floor(sliderMousePos / sliderPath);
						sliderItem.slideTo(sliderSlide)
					}
				})*/
			}
		}
	});
}

