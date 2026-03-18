function get_ingr_ko(btn, guid, e)
{
	//console.log(guid);

	e.preventDefault();

	//clearToppings(guid);

	var block = $('#popup-box-ko');
    var startTop = parseInt(btn.offset().top+22);
    var startLeft = parseInt(e.clientX-175);		

	block.hide();

	model_i.guid(guid);
	model_i.ingrids_update();

    if(!block.is(':visible')) 
    {
        block.css('top',startTop);
        block.css('left',startLeft);
        block.css('z-index','98');
        block.show();
    }

}
