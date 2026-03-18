<script>

var CartModel = {
    constructor: function(){

        var self = this;
        self.cart = ko.observable(ko.mapping.fromJS(server_cart.data)).extend({ deferred: true });


        self.cart_bonus = ko.pureComputed({
        read: function () {
                var bonus = 0;
                var total_cost = 0;
                var total_bill = 0;

                for (var i = 0; i < self.cart().items().length; i++) {



                    total_cost = total_cost + Number(self.cart().items()[i].cost()) * Number(self.cart().items()[i].product_amount()/self.cart().items()[i].min());
                    total_bill = total_bill + Number(self.cart().items()[i].bill()) * Number(self.cart().items()[i].product_amount()/self.cart().items()[i].min());

                    if(Number(self.cart().items()[i].cost()) > ~~$smarty.const.ITEM_COST~ ){
                        bonus = bonus + Math.ceil(Number((self.cart().items()[i].cost() - self.cart().items()[i].bill()) * (self.cart().items()[i].product_amount()/self.cart().items()[i].min()) * ~~$smarty.const.BONUS_RATIO~));
                    }

/*
    console.log(bonus);
    console.log(self.cart().items()[i].cost());
    console.log(self.cart().items()[i].bill());
    console.log(self.cart().items()[i].product_amount());
    console.log(self.cart().items()[i].min());
*/
                }
/*
   console.log(bonus);console.log(total_cost);console.log(total_bill);
*/


                if(Number(total_cost) > ~~$smarty.const.TOTAL_COST~ ){
                    bonus = Math.ceil((total_cost - total_bill) * ~~$smarty.const.BONUS_RATIO~);
                }

                return bonus;
            }
        });

        self.cart_discount = ko.pureComputed({
        read: function () {
                var discount = 0;
                /*
                for (var i = 0; i < self.cart().items().length; i++) {
                    discount = discount + Number((self.cart().items()[i].cost() - self.cart().items()[i].bill()) * self.cart().items()[i].product_amount());
                }*/
                return discount;
            }
        });

        self.cart_sum = ko.pureComputed({
        read: function () {
                var sum = 0;
                for (var i = 0; i < self.cart().items().length; i++) {
                    sum = sum + Number((self.cart().items()[i].cost()) * (self.cart().items()[i].product_amount()  / self.cart().items()[i].min()) );
                }
                return sum;
            }
        });

        self.cart_weight = ko.pureComputed({
            read: function () {
                    var weight = 0;
                    for (var i = 0; i < self.cart().items().length; i++) {
                        weight = weight + parseFloat(self.cart().items()[i].weight().replace(",", ".")) * Number(self.cart().items()[i].product_amount());
                    }
                /*console.log(weight);*/
                return weight.toFixed(3);
            }
        });


        self.total_cart_sum = ko.pureComputed({
            read: function () {
                var total_sum = 0;

                console.log(self.cart().items());

                for (var i = 0; i < self.cart().items().length; i++) {
                    total_sum = total_sum + Number(self.cart().items()[i].cost() * (self.cart().items()[i].product_amount() / self.cart().items()[i].min() ) );
                }
                total_sum = total_sum - self.cart_discount();
                return Math.round(total_sum  * 100) / 100;
            }
        });

        self.total_cart_amount = ko.pureComputed({
            read: function () {
                var total_amount = 0;
                for (var i = 0; i < self.cart().items().length; i++) {
                    total_amount = total_amount + Number(self.cart().items()[i].product_amount());
                }
                return total_amount;
            }
        });

        self.update_items = function(items){
            console.log("self.update_items");
            self.cart().items.removeAll();
            self.cart().items(ko.mapping.fromJS(items)());
            self.update_cart();
        };

        // удалить
        self.remove_from_cart = function (guid, data, event) {
            var pars = {
                    task: "delete_product",
                    guid: guid
            };

            $.ajax({
                type: "POST",
                url: '/cart/',
                data: pars,
                dataType: "json",
                success: function (data, textStatus) {
                }
            });

            self.cart().items.remove(function (i) {
                if (i == data) {
                    return true;
                }
            });

            self.update_cart();
        };

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
                }
            });

            self.cart().items.removeAll();
            self.update_cart();
        };


        self.update_amount = function (guid, amount) {
            var pars = {
                task: "update_amount",
                guid: guid,
                amount: amount
            };

            $.ajax({
                type: "POST",
                url: '/cart/',
                data: pars,
                dataType: "json",
                success: function (data, textStatus) {
                }
            });
        };

        self.amount_plus = function (guid, data, event) {
            var minAmount = data.min();
            for (var i = 0; i < self.cart().items().length; i++) {
                if (self.cart().items()[i].guid() == guid) {
                    self.cart().items()[i].product_amount(Number(self.cart().items()[i].product_amount()) + Number(minAmount));
                    self.update_amount(self.cart().items()[i].guid(), data.product_amount()); // отправка количества на сервер
                }
            }
        };

        self.amount_minus = function (guid, data, event) {
            var minAmount = data.min();
            if (data.product_amount() <= minAmount) {
                return;
            } else
            {
                for (var i = 0; i < self.cart().items().length; i++) {
                    if (self.cart().items()[i] == data) {
                        self.cart().items()[i].product_amount(Number(self.cart().items()[i].product_amount()) - Number(minAmount));
                    }
                }
                self.update_amount(guid, data.product_amount());
            }
        };

        self.put_into_cart = function (item) {
            self.cart().items.push(ko.mapping.fromJS(item));
            self.update_cart();
        };

        self.validate_amount = function (guid, data, event) {

            /*console.log(data); console.log(event.target.value);*/

            var minAmount = data.min();
            //var minAmount = 1;
            if (event.target.value < 1 || event.target.value > 5000  ) {
                return;
            } else
            {
                for (var i = 0; i < self.cart().items().length; i++) {
                    if (self.cart().items()[i] == data) {
                        self.cart().items()[i].product_amount(event.target.value);
                    }
                }
                self.update_amount(guid, data.product_amount());
            }

        };

        self.send2order = function (data, event) {

            //alert('send2order');
            /* console.log(data); console.log(event.target.value);*/
            //window.location.href = '/cart/#cart_login';
            if(self.cart().items().length >0) {window.location.href = '/order/';}
            else{
                    toastr.info("Корзина пустая");
}

        };


        self.update_cart = function(){
        };

        self.total_sum = ko.observable(Math.floor(self.total_cart_sum()));

        ko.computed(function(){
            self.total_sum(Math.floor(self.total_cart_sum()));
        });

        ko.computed(function(){
            if (!ko.computedContext.isInitial())
                return;
            //
        });


        return self;
    }
};


var model_cart = Object.create(CartModel).constructor();

$(document).ready(function(){


    /*
    if($('.cart-row.title-row')[0]) ko.applyBindings(model_cart, $('.cart-row.title-row')[0]);
    if (document.getElementsByClassName('cart-body').length != 0) ko.applyBindings(model_cart, document.getElementsByClassName('cart-body')[0]);
    */

    $('.total_cart_sum').each(function(){
        ko.applyBindings(model_cart, $(this)[0]);
    });

    $('.total_cart_amount').each(function(){
        ko.applyBindings(model_cart, $(this)[0]);
    });

    $('.cart').each(function(){
        ko.applyBindings(model_cart, $(this)[0]);
    });

});


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

</script>
