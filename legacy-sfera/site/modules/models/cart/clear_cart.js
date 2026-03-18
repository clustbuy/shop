self.clear_cart = function(){
    var pars = {
        task: "clear_cart"
    };
    
    $.ajax({
        type: "POST",
        url: '/cart/',
        data: pars,
        dataType: "json",
        success: function(data, textStatus){
            console.log(data);
        }
    });
    
    self.cart().items.removeAll();
    self.update_cart();
};
