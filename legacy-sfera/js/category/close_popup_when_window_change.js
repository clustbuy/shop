
addEvent(window, 'resize', function(event, params){

	// 1] Получить элемент #popup
	var popup = document.getElementById('popup');

	// 2] Скрыть popup
	$(popup).css('display', 'none');

}, {self: self});
			
