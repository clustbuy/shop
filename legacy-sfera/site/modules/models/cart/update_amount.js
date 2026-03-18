self.update_amount = function (guid, amount) {

    //console.log(amount);

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

            console.log(data.items[guid]['product_price']);
            console.log(data);

        }
    });


};