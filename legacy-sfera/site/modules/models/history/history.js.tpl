<script>

var HistoryModel = {
    constructor: function(){
    
        var self = this;
        
        self.history = ko.observableArray(Hj);


        self.order_status = function(item, data, event){
           
			var status_class = "";

			switch (item.order_oracle_status) {

			   case "100": 		status_class = "cancel";			break;
			   case "999": 		status_class = "cancel";			break;
			   case "1001": 	status_class = "cancel";			break;
			   case "300": 		status_class = "complete";			break;
			   case "": 		status_class = "";					break;

			}

            return status_class;
        };


        self.order_status_text = function(item, data, event){
           
			var status_text = "";

			if(item.order_status == 0) 
			{
				status_text = "(<span style='color:green;'>Новый заказ</span>)";
			}
			else if(item.order_status == 4) 
			{
				status_text = "(Заказ не оплачен)";
			}
			else if (item.order_status == 9) 
			{
				status_text = "(Тестовый технический заказ)";
			}
			else
			{
				status_text = "(" + item.status_text + ")";
			}

			if (item.order_oracle_status == null && item.order_status == 1) 
			{
				status_text = "";
			}

            return status_text;
        };


        self.pay_type = function(item, data, event){
           
			var type = "";

			switch (item.order_pay_type) {

			   case "0": 		type = "Оплата наличными";				break;
			   case "2": 		type = "Оплата банковской картой";		break;
			   case "5": 		type = "Оплата через Webmoney";			break;
			   case "4": 		type = "Оплата из QIWI кошелька";		break;
			   case "3": 		type = "Оплата через Яндекс.Деньги";	break;
			   case "8": 		type = "Оплата банковской картой";  	break;
			   case "9": 		type = "Оплата электронными деньгами"; 	break;
			   default: 		type = "Нет признака оплаты (код " + item.order_pay_type + ")";			break;

			}

            return type;
        };

        self.pay_image = function(item, data, event){
           
			var image = "";

			switch (item.order_pay_type) {

			   case "0": 		image = "img-cash.jpg";				break;
			   case "5": 		image = "img-webmoney.jpg";			break;
			   case "4": 		image = "img-qiwi.jpg";				break;
			   case "3": 		image = "img-yandex.jpg";			break;
			   case "8": 		image = "img-visa-mastercard.jpg";  break;
			   case "2": 		image = "img-visa-mastercard.jpg";  break;
			   case "9": 		image = "img-webmoney.jpg";  		break;

			   default: 		image = "undefined.png";			break;

			}

            return "background: rgba(0, 0, 0, 0) url(/images/"+image+") no-repeat scroll 0 0 / calc(100%) auto;";
        };


           
		self.full_link = function(item, data, event){

			var link_href = "";

			$.each(Items[item.op_menu_id].cat.breadcrumbs, function(index, obj){
					link_href = link_href + "/" + obj.alias;
			});

			link_href = link_href + "/" + Items[item.op_menu_id].alias;

            return link_href;
        };


        self.move_to_cart = function(item, data, e){

            e.preventDefault();

            var amount = 0;

            //console.log(item.items);

            $.each(item.items, function(index, obj){
				amount = amount + Number(obj.op_amount);
			});

            
            var flyCart = jQuery('<span class="flycart">+'+amount+'</span>');
            
            var flyCoordinatesX = e.pageX,
            flyCoordinatesY = e.pageY,
            cartCoordinatesX = $('.to_cart').offset().left,
            cartCoordinatesy = $('.to_cart').offset().top;  

            
            if (cartCoordinatesX == 0) {
            cartCoordinatesX = $(window).width() - 40;
            }
            
            flyCart.css({
            'left': flyCoordinatesX - 12,
            'top': flyCoordinatesY - 12,
            'z-index': 1000
        	});


            $('body').append(flyCart);  
            
            flyCart.animate({
                'left': cartCoordinatesX,
                'top': cartCoordinatesy
                }, 
                1000, 
                function () {
                
                    var pars = {
                        mod_name: "cart",
                        task: "repeat_order",
                        order_id: item.order_id
                    };
                    
                    $.ajax({
                        type: "POST",
                        url: '/cart/',
                        data: pars,
                        dataType : "json",                     
                        success: function (data, textStatus) {
                        

							console.log(data);

							var items = (function(){
								var results = [];
								for(var key in data.items) {

									if(!data.items.hasOwnProperty(key)) continue;
									results.push(data.items[key]);

								}
								return results;
							})();

                        	//console.log(items);

							model_cart.update_items(items);                        	

                        }
                    });       

                    setTimeout(function () {
                    $('.flycart').remove();
                    }, 500);
                

                },
                null
            ); 


        }; 

        self.delete_order = function(item, data, event){

			//console.log(data);
        	
			var pars = {
				tpl: 'delete_order',
				mod_name : 'order',
				order_id: data.order_id
			};

			$.ajax({
				type: "POST",
				url: '/',
				data: pars,
				dataType : "json",
				success: function (data, textStatus) {

				    self.history.remove(function(i){
				        if (i == item) return true;
				    });					
					toastr.info(data.answer);
				},
				error: function(){
					toastr.info('Не удалось удалить заказ');
				}
			});

        }; 

        ko.computed(function(){
            if (!ko.computedContext.isInitial()) 
                return;
            //
        });
        
        return self;
    }
};


var model_history = Object.create(HistoryModel).constructor();

$(document).ready(function(){
	if($('#history')[0])  ko.applyBindings(model_history, $('#history')[0]);
});


</script>