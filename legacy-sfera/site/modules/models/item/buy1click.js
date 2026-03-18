
self.buy1click = function(link, data, event) {

	var block = $('#callback');
	var link = $(link);

	block.hide();

	$('#product_message').html('');
	if(link.hasClass('one-click')) {

		var div 				= document.createElement('div');
		//div.className 		= "order-row";
		div.id 					= "product_message";
		div.style.textAlign 	= "center";

		var img = document.createElement('img');
		img.src 				= '/images/~~$merchant_alias~/'+self.item().guid()+(self.item().dough ? (self.item().dough.choosen().original_name() == 'thin' ? 't' : '') : '')+'-300.jpg';
		img.width 				= 150;
		img.style.margin 		= '0px auto 10px';
		div.appendChild(img);

		var name = document.createElement('div');
		name.style.fontWeight 	= 700;
		name.style.color 		= 'black';
		name.innerHTML 			= self.item().name_menu();
		div.appendChild(name);

		var line = document.createElement('div');
		line.innerHTML = '<hr><br>';
		div.appendChild(line);

		document.getElementById('product_message').appendChild(div);

		$('#product_guid').val(self.item().guid());
	}

	$("#callback_email").css("display","none");

	var startTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
	startTop = startTop + 80;

	if(!block.is(':visible')) {
			block.css('top',startTop);
			block.show();
	}

};
