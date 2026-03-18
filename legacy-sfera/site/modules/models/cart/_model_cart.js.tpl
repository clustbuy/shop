<script>

    var CartModel = {
    constructor: function(){

    var self = this;

    self.cart = ko.observable(ko.mapping.fromJS(server_cart.data));
    self.promocode = ko.observable(~~if $smarty.session.cart.promocode != ''~"~~$smarty.session.cart.promocode~"~~else~""~~/if~);
    self.promocode_input = ko.observable("");

    self.is_promo_ok = ko.observable(false);
    self.sbp = ko.observable(0);

    self.discount = ko.observable(Object.hasOwn(self.cart(), 'discount') ? self.cart().discount() : 0);

    self.is_modal_cunstructor_visible = ko.observable(false);


    self.full_link = function(item, data, event){
    link_href =  "/" + Items[item.guid()]['node'] + "/" + item.guid();

    return link_href;
};

    self.promo_keydown = function(val, e){

    console.log(val);
    console.log(e);

    if (e.keyCode === 13) {
    console.log(val);
}

};


    self.sbp_cart_discount = ko.pureComputed({
    read: function () {
    var sbp_discount = 0;
    if(self.cart().spb() == 1)
{
    sbp_discount = (self.cart().cart_sum() - self.cart().cart_discount())*0.03; // скидка 3%
}
    return sbp_discount;
}
});

    self.cart_discount = ko.pureComputed({
    read: function () {
    var discount = 0;
    for (var i = 0; i < self.cart().items().length; i++) {
    discount = discount + Number((self.cart().items()[i].cost() - self.cart().items()[i].bill()) * self.cart().items()[i].product_amount());
}
    return discount;
}

});

    self.cart_sum = ko.pureComputed({
    read: function () {
    var sum = 0;
    for (var i = 0; i < self.cart().items().length; i++) {
    sum = sum + Number((self.cart().items()[i].cost()) * self.cart().items()[i].product_amount());
}
    return sum;
}
});

    self.cart_weight = ko.pureComputed({
    read: function () {
    var weight = 0;
    for (var i = 0; i < self.cart().items().length; i++) {
    /*console.log(weight);
    console.log(self.cart().items()[i].weight());
    console.log(self.cart().items()[i].product_amount());*/

    weight = weight + parseFloat(self.cart().items()[i].weight().replace(",", ".")) * Number(self.cart().items()[i].product_amount());
}
    /*console.log(weight);*/

    return weight.toFixed(3);
}
});

    self.try2apply_card = async function(id){

    console.log(id);
    //console.log(self.cart());


};


    ~~include file="models/cart/total_cart_sum.js"~
    ~~include file="models/cart/total_cart_amount.js"~
    ~~include file="models/cart/update_items.js"~
    ~~include file="models/cart/remove_from_cart.js"~
    ~~include file="models/cart/clear_cart.js"~
    ~~include file="models/cart/update_cart.js"~
    ~~include file="models/cart/update_amount.js"~
    ~~include file="models/cart/amount_plus.js"~
    ~~include file="models/cart/amount_minus.js"~
    ~~include file="models/cart/put_into_cart.js"~
    ~~include file="models/cart/validate_amount.js"~
    ~~*include file="models/cart/update_cost.js"*~

    self.total_sum = ko.observable(Math.floor(self.total_cart_sum()/((100-self.discount())/100)));


    ko.computed(function(){


    //console.log(self.min_gift_sum);

    console.log(self.total_cart_sum());
    //console.log(self.total_sum());
    self.total_sum(Math.floor(self.total_cart_sum()/((100-self.discount())/100)));
    //console.log(self.total_sum());
});


    ~~*include file="models/cart/show_modal_constructor.js"~
    ~~include file="models/cart/hide_modal_constructor.js"~
    ~~include file="models/cart/switch_modal_constructor.js"~
    ~~include file="models/cart/load_component.js"~
    ~~include file="models/cart/save_and_unload_component.js"~
    ~~include file="models/cart/goto_order.js"*~



    ~~include file="models/cart/try2apply_promocode.js"~
    ~~include file="models/cart/try2cancel_promocode.js"~


    ko.computed(function(){
    if (!ko.computedContext.isInitial())
    return;

    //self.promocode(""); //устанавлиавем пустой промокод
});

    return self;
}


};



    var model_cart = Object.create(CartModel).constructor();



    $(document).ready(function(){

    if($('.cart-row.title-row')[0])
    ko.applyBindings(model_cart, $('.cart-row.title-row')[0]);

    if (document.getElementsByClassName('cart-body').length != 0)
    ko.applyBindings(model_cart, document.getElementsByClassName('cart-body')[0]);

    if (document.getElementsByClassName('md-cart').length != 0)
    ko.applyBindings(model_cart, document.getElementsByClassName('md-cart')[0]);

    if (document.getElementsByClassName('modal-window-constructor').length != 0)
    ko.applyBindings(model_cart, document.getElementsByClassName('modal-window-constructor')[0].parentNode);

    $('.total_cart_sum').each(function(){
    ko.applyBindings(model_cart, $(this)[0]);
});
    $('.total_cart_amount').each(function(){
    ko.applyBindings(model_cart, $(this)[0]);
});

    $('.cart').each(function(){
    ko.applyBindings(model_cart, $(this)[0]);
});

    /*



		if($('.l-order__aside')[0]) {
            ko.applyBindings(model_cart, $('.l-order__aside')[0]);
        }*/

    ~~*if (document.getElementsByClassName('item__main').length != 0)
    ko.applyBindings(model_cart, document.getElementsByClassName('item__main')[0]);*~
});


    ~~include file="models/cart/addEvent_focus.js"~


    /*
    addEvent(window, ['resize'], function(){

    var modal = document.getElementsByClassName('modal-window-constructor')[0];
    model_cart.hide_modal_constructor();

});
    */

</script>
