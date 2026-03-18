function attach_component_item(config) {
    $(document).ready(function () {

        
        console.log(config);

        var viewmode = config.viewmode ? config.viewmode : 'main';
        var viewmode_params = config.params ? config.params : {};

        console.log($(config.class_target));

        Array.from($(config.class_target)).forEach(item => {
            if (config.lazyload) {
                var id = $(item).attr('data-id');
            } else {
                var id = (config.params.model_cart_item && config.params.model_cart_item.guid && config.params.model_cart_item.guid()) ? config.params.model_cart_item.guid() : $(items[i]).attr('guid');
            }

            console.log(id);

            var content = $(item).find(config.class_inside_target);



            var params = {
                name: 'item',
                params: {
                    id: id,
                    viewmode: viewmode,
                    viewmode_params: viewmode_params,
                    model_cart_item: (config.params.model_cart_item) ? config.params.model_cart_item : {}
                }
            };

            var html = "<div data-bind='component: " + JSON.stringify(params) + "'>" + "</div>";
            content.append(html);
            ko.applyBindings({}, item);
        });
    });
}

