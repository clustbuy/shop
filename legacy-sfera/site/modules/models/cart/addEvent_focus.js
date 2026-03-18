
addEvent(window, 'focus', function(){

    if(page_focus == false)
    {
        page_focus = true;

    var pars = {
        task: "get_cart"
    };
    
    $.ajax({
    
        type: "POST",
        url: '/cart/',
        data: pars,
        dataType: "json",
        success: function(data, textStatus){
        
        
            // преобразование к массиву
            var items = (function(){
            
                var results = [];
                for (var key in data.items) {
                
                    if (!data.items.hasOwnProperty(key)) 
                        continue;
                    results.push(data.items[key]);
                    
                }
                return results;
                
            })();
            
            model_cart.update_items(items);
        }
    });
    }

});


addEvent(window, 'blur', function(){
    
        page_focus = false;

});
/**/
