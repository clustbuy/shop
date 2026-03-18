// удалить 
self.remove_from_cart = function (guid, data, event) {

    //console.log(guid);

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

            //console.log(data);

        }
    });


    self.cart().items.remove(function (i) {
        if (i == data) {
            return true;
        }
    });

    // подсчет количества товаров
    var items = 0;
    for (var i = 0; i < self.cart().items().length; i++) {
        items = items + 1;
    };

    // Удалить все подарки из корзины если нет товаров
    if (items == 0) {

        if (self.promocode().length > 0) {
            self.promocode('');
            self.promocode_input('');
            model_cart.is_promo_ok(false);
            toastr.info('Промокод отменён');
        }

    }

    // Удалить все подарки из корзины если сумма меньше минимальной для подарков
    if (self.total_sum() < self.min_gift_sum) {

        self.promocode('');
        self.promocode_input('');
        self.is_promo_ok(false);
        self.dop_nabor(0);
    }

    self.update_cart();
};

