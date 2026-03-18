/*//==================================================////
////                                                  ////
////         Bower-пакет: 4gekkman-bower-jslib1       ////
////                                                  ////
////==================================================////
////                      ////
////         Ссылки       ////
////                      ////
////======================////


	# Официальный репозиторий bower-пакета
			https://github.com/4gekkman/4gekkman-bower-jslib1


////==================================================////
////                         ////
////        Оглавление       ////
////                         ////
////=========================////


	• Cобытия

		- AddEvent									| Назначить эл-ту функ.обработчик событи(ю/ий) [кроссбраузерно]
		- removeEvent								| Удалить у эл-та функ.обработчик события [кроссбраузерно]
		- fixEvent									| FIX всех IE-несовместимостей при работе с событиями

  •	Классы

  	- addClass									| Добавить эл-ту указанный класс
  	- removeClass								| Удалить у эл-та указанный класс
  	- checkClass								| Проверить наличие у эл-та указанного класса

  • Размеры элемента

		- getBoundingDocRect				| Получить obj с внеш. размерами x,y эл-та, и его док. коорд. относ. ЛВ угла document
		- getBrowserWindowMetrics		| Получить obj с размерами x,y окна браузера, его клиент. и док. коорд-ми ЛВ и ПН углов окна браузера

  • Модальное окно и notify

    - showModal								  | Функция вызывает модальное окно с text, и кнопкой "Да", вызывающей callback
    - notify										| На N секунд показывает в верхней части экрана плашку с заданной инфой
		- popupCenter               | Открыть указанный URL в новом всплывающем окне указанных размеров по центру

	• AJAX

		- ajax										  | Функция для отправки асинхронного AJAX-запроса
		- getXhr										| Кроссбраузерно создаёт XHR-объект (в т.ч. для IE6)
		- makeJSON									| Создать json-строку из переданного массива пар значений
		- ajaxko                    | Функция для ajax-запросов в стиле ko к командам и контроллерам

  • Куки

 		- getCookie									| Извлечь куку по имени из document.cookie
 		- setCookie									| Записать куку
 		- deleteCookie							| Удалить куку

  • Прочее

  	- customPlaceholder					| Организует плейсхолдер для txt-эл.формы, у которых есть атрибут data-placeholder
  	- setImmediate							| Позволяет поставить выполнение указанного кода в конец очереди
  	- check_ie8									| Проверить, является ли текущий браузер IE <= 8
  	- check_ie9									| Проверить, является ли текущий браузер IE <= 9
  	- get_object_type						| Получить строку с типом объекта
  	- insertAfter								| Вставить узел x в DOM, как дочерний элемент e, после элемента y
  	- isImageExists							| Проверяет, существует ли картинка по указанному URL
  	- validateEmail							| Валидация адреса email
  	- clickmenu									| Открывает меню с указанным функционалам, помещая его ЛВ угол в точку с указанными докум.коорд. относ.body
  	- urlRusLat									| Функция для транслитерации РУС -> ENG
  	- tooltip										| [Срабатывает при старте] Показывает подсказку для эл-в с польз.атрибутом data-tooltip, при наведении курсора на эл-т
  	- hasYScrollbar							| Присутствует ли вертикальный скроллбар в окне браузера
  	- getInpCursorPos						| Получить позицию курсора в текстовом input в символах
  	- setInpCursorPos						| Установить позицию курсора в текстовом input в символах
  	- getChar                   | Кроссбраузерно получить код символа из события keypress
  	- cubicbezier               | Изменение значения по заданной кривой
  	- smoothscrollyTo           | Плавно изменить прокрутку окна по координате Y к указанной координате
		- hereDoc                   | Для создания многострочных строковых литералов


////==================================================////
////                         ////
////        Содержание       ////
////                         ////
////=========================//*/


/* AddEvent //
//----------//
// - Назначить эл-ту функ.обработчик событи(ю/ий) [кроссбраузерно].

	Аргументы:
		- element		| ссылка на элемент
		-	event			| имя события без приставки "on"
		- handler		| ссылка на функцию-обработчик
		- params		| обработчику можно передать параметры в params
		- phase			| фаза, в которой ловить событие (только для addEventListener, в IE<=8 не работает)

	Возвращает:
		- Ничего

	Пример:

		addEvent(button_cancel, 'click', function(event, params){

			// ...

		}, {x: 10, y: 20});

-------------------------------------*/
function addEvent(element, event, handler, params, phase) {

	// 1. Завернуть handler в замыкание, в которое положить params
	var handlerWithParams = function handlerWithParams(event){

		var self = this;
		return handler.bind(self)(event, params, handlerWithParams);

	};

	// 2. Подготовить функцию для подписки ф-ии handler на событие element
	var subscribe = function(event) {

		// Если element пуст, завершить
		if(!element) return;

		// Проверить, существует ли в этом браузере метод addEventListener
		// - Если да, то использовать его.
		// - Если нет, значит это старый IE, и использовать attachEvent

			// Если да, то использовать его.
			if (document.addEventListener) {
				element.addEventListener(event, handlerWithParams, phase);
			}

			// Если нет, значит это старый IE, и использовать attachEvent
			else {

				// Если скрипт выполняется в IE<=8 и event == 'blur':
				if((document.all && !document.addEventListener) && event == 'blur') {
					element.onfocusout = handlerWithParams;
					return;
				}

				// Если скрипт выполняется в IE>=9
				element.attachEvent("on" + event, handlerWithParams);

			}

	};

	// 3. Если event является массивом, то:
	//    - Значит это массив событий.
	//    - Для каждого из них надо добавить обработчиком handler
	if({}.toString.call(event).slice(8,-1) == 'Array') {
		for(var i=0; i<event.length; i++) {
			subscribe(event[i]);
		}
	}

	// 4. Если event - строка, то...
	else subscribe(event);

	// 5. Вернуть ссылку на handlerWithParams
	return handlerWithParams;

}


/* removeEvent //
//-------------//
// - Удалить у эл-та функ.обработчик события [кроссбраузерно].

	Аргументы:
		- element		| ссылка на элемент
		-	event			| имя события без приставки "on"
		- handler		| ссылка на функцию-обработчик
		- phase			| фаза, в которой ловить событие (только для addEventListener, в IE<=8 не работает)

	Возвращает:
		- Ничего

-------------------------------------*/
function removeEvent(element, event, handler, phase) {

	// Проверить, существует ли в этом браузере метод addEventListener
	// - Если да, то использовать removeEventListener.
	// - Если нет, значит это старый IE, и использовать detachEvent

		// Если да, то использовать removeEventListener.
		if (document.addEventListener) {
			element.removeEventListener(event, handler, phase);
		}

		// Если нет, значит это старый IE, и использовать detachEvent
		else {
			element.detachEvent("on" + event, handler);
		}

}


/* fixEvent //
//----------//
// - FIX всех IE-несовместимостей при работе с событиями.

	Аргументы:
		- e								| событие, которое надо пофиксить

	Возвращает:
		- Пофиксеннное событие

	Пример использования

		event = fixEvent(event);

-------------------------------------*/
function fixEvent(e, _this) {
	e = e || window.event;

	if (!e.currentTarget) e.currentTarget = _this;
	if (!e.target) e.target = e.srcElement;

	if (!e.relatedTarget) {
		if (e.type == 'mouseover') e.relatedTarget = e.fromElement;
		if (e.type == 'mouseout') e.relatedTarget = e.toElement;
	}

	if (e.pageX == null && e.clientX != null ) {
		var html = document.documentElement;
		var body = document.body;

		e.pageX = e.clientX + (html.scrollLeft || body && body.scrollLeft || 0);
		e.pageX -= html.clientLeft || 0;

		e.pageY = e.clientY + (html.scrollTop || body && body.scrollTop || 0);
		e.pageY -= html.clientTop || 0;
	}

	if (!e.which && e.button) {
		e.which = e.button & 1 ? 1 : ( e.button & 2 ? 3 : (e.button & 4 ? 2 : 0) );
	}

	return e;
}


/* addClass //
//----------//
// - Добавить эл-ту указанный класс.

	Аргументы:
		- el								| ссылка на элемент, которому надо добавить класс
		- cls								| строка с именем класса, который надо добавить

	Возвращает:
		- Ничего

-------------------------------------*/
function addClass(el, cls) {
	for(var c = el.className.split(' '),i=c.length-1; i>=0; i--) {
		if (c[i] == cls) return
	}

	el.className += ' '+cls
}


/* removeClass //
//-------------//
// - Удалить у эл-та указанный класс.

	Аргументы:
		- el								| ссылка на элемент, у которого надо удалить класс
		- cls								| строка с именем класса, который надо улалить

	Возвращает:
		- Ничего

-------------------------------------*/
function removeClass(el, cls) {
	for(var c = el.className.split(' '),i=c.length-1; i>=0; i--) {
		if (c[i] == cls) c.splice(i,1)
	}

	el.className = c.join(' ')
}


/* checkClass //
//------------//
// - Проверить наличие у эл-та указанного класса.

	Аргументы:
		- id						| id элемента, в котором надо проверить наличие класса
		- classname			| страка с классом, наличие котороно надо проверить
		- element				| ссылка на элемент, в котором надо проверить наличие класса

	Возвращает:
		-1, если элемент с id не найден
		0, если класс className в элементе с id не найден
		1, если класс className в элементе с id найден

	Ссылка element имеет преимущество над id
		- Если element не указан, то используется id.
		- Если element указан, то id игнорируется.

	Примеры использования

			checkClass('id55', 'someClass');
			checkClass('', 'someClass', someElement);


-------------------------------------*/
function checkClass(id, classname, element) {

	// Получить ссылку на эл-т, в котором надо производить поиск
	var e;

		// Если element передан:
		// - проигнорировать id
		// - использовать element для поиска в нём classname
		if(element) e = element;

		// Если element не передан:
		// - используя id получить ссылку на эл-т, и в нём искать classname
		else e = document.getElementById(id);

	// Если элемент с id не найден, вернуть -1
	if(e == null || e == undefined) return -1;

	// Получить строку с содержимым className элемента e:
	var classes = e.className;

	// Проверить, есть ли в строке classes подстрока className
	// - если нет, то вернуть 0.
	// - если да, то вернуть 1.
	if(classes.search(new RegExp(classname,'i')) !== -1) return 1;
	else return 0;

}


/* getBoundingDocRect //
//--------------------//
// - Получить obj с внеш. размерами x,y эл-та, и его док. коорд. относ. ЛВ угла Main.

	Аргументы:
		- e						| элемент, чьи документные координаты требуется получить

	Возвращает:
		- Объект с результатами.

	Содержимое объекта с результатами:
		- top				| координата Y ЛВ угла элемента e
		- left			| координата X ЛВ угла элемента e
		- bottom		| координата Y ПН элемента e
		- right			| координата X ПН угла элемента e
		- width			|	ширина эл-та e, включая границы и padding, не включая margin
		- heigth		| высота эл-та e, включая границы и padding, не включая margin

	Примечания
		- Координаты и размеры - для внешней зоны элемента (с учётом padding и border).
		- НЕ меняются при прокрутке Main, поскольку это документные координаты относ. ЛВ угла Main.
		- Эти координаты удобно использовать для absolute-позиционирования эл-тов относ. ЛВ угла Main.
		- Если у элемента display: none, то все значения, которые вернет функция - будут 0.
		- А вот если у элементе visibility: hidden, то все значения будут нормально вычисляться.

-------------------------------------*/
function getBoundingDocRect(e) {
	var rect,
			body,
			docElem,
			scrollTop,
			scrollLeft,
			clientTop,
			clientLeft,
			top,
			left,
			bottom,
			right,
			width,
			height;

	rect = e.getBoundingClientRect();
	body = document.body;
	docElem = document.documentElement;

	// Размеры прокручЕННой области
	scrollTop = window.pageYOffset 	|| docElem.scrollTop || body.scrollTop;
	scrollLeft = window.pageXOffset || docElem.scrollLeft || body.scrollLeft;

	// Размеры рамок элемента
	clientTop = docElem.clientTop || body.clientTop || 0;
	clientLeft = docElem.clientLeft || body.clientLeft || 0;

	// Документные координаты левого верхнего угла элемента (на внеш. стороне)
	top  = rect.top +  scrollTop - clientTop;
	left = rect.left + scrollLeft - clientLeft;

	// Документные координаты правого нижнего угла элемента
	bottom = rect.bottom + scrollTop - clientTop;
	right = rect.right + scrollLeft - clientLeft;

	// Внешние размеры элемента
	width = e.getBoundingClientRect().width;
	height = e.getBoundingClientRect().height;

	// Вернуть объект с координатами и размерами
	return {
		top: Math.round(top),
		left: Math.round(left),
		bottom: Math.round(bottom),
		right: Math.round(right),
		width: Math.round(width),
		height: Math.round(height)
	};
}


/* getBrowserWindowMetrics //
//-------------------------//
// - Получить obj с размерами x,y окна браузера, его клиент. и док. коорд-ми ЛВ и ПН углов окна браузера.

	Аргументы:
		- нет

	Возвращает:
		- Объект с результатами.

	Содержимое объекта с результатами:
		- width						| Внутренняя ширина окна браузера
		- height					| Внутренняя высота окна браузера
		- outerWidth			| Внешняя ширина окна браузера
		- outerHeight			| Внешняя высота окна браузера
		- windowScreenX   | Расстояние от левого края экрана до ЛВ угла браузера
		- windowScreenY   | Расстояние от верхнего края экрана до ЛВ угла браузера

		- clientTop    		| Клиентская координата X ЛВ угла окна браузера (== 0)
		- clientLeft  		| Клиентская координата Y ЛВ угла окна браузера (== 0)
		- clientBottom		| Клиентская координата X ПЕ угла окна браузера (== width)
		- clientRight 		| Клиентская координата Y ПН угла окна браузера (== height)

		- docTop   				| Документная координата X ЛВ угла окна браузера
		- docLeft  				| Документная координата Y ЛВ угла окна браузера
		- docBottom				| Документная координата X ПН угла окна браузера
		- docRight 				| Документная координата Y ПН угла окна браузера

	Примечания
		- На самом деле клиент. коорд. ЛВ угла окна браузера - это (0,0).
		- А клиент. коорд. ПН окна браузера - это его (width, height)
			- Т.Е. clientRight == width.
			- А clientBottom == height.

-------------------------------------*/
function getBrowserWindowMetrics() {
	var body,
			docElem,
			scrollTop,
			scrollLeft,

			width,
			height,

			clientTop,
			clientLeft,
			clientBottom,
			clientRight,

			docTop,
			docLeft,
			docBottom,
			docRight;


	// Получить ссылки на элементы body и Main
	body = document.body;
	docElem = document.documentElement;


	// Получить размеры прокручЕННой области ио осям X и Y
	// (понадобятся для вычисления документных координат)
	scrollTop = window.pageYOffset 	|| docElem.scrollTop || body.scrollTop;
	scrollLeft = window.pageXOffset || docElem.scrollLeft || body.scrollLeft;


	// Получить ширину и высоту клиентской области окна браузера

		// Если код выполняется в не-IE браузерах:
		if( typeof( window.innerWidth ) == 'number' ) {
			width = window.innerWidth;
			height = window.innerHeight;
		}

		// Если код выполняется в IE>=6 в 'standards compliant mode'
		else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
			width = document.documentElement.clientWidth;
			height = document.documentElement.clientHeight;
		}

		// Если код выполняется в IE4
		else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
			width = document.body.clientWidth;
			height = document.body.clientHeight;
		}


	// Получить клиентские координаты клиентской области браузера
	clientTop = 0;
	clientLeft = 0;
	clientBottom = clientTop + height
	clientRight	= clientLeft + width;

	// Получить документные координаты клиентской области браузера
	docTop = clientTop + scrollTop;
	docLeft = clientLeft + scrollLeft;
	docBottom = docTop + height;
	docRight = docLeft + width;


	// Вернуть объект с координатами и размерами
	return {
		width: Math.round(width),
		height: Math.round(height),
		outerWidth: window.outerWidth,
		outerHeight: window.outerHeight,
		windowScreenX: window.screenX,
		windowScreenY: window.screenY,

		clientTop: Math.round(clientTop),
		clientLeft: Math.round(clientLeft),
		clientBottom: Math.round(clientBottom),
		clientRight: Math.round(clientRight),

		docTop: Math.round(docLeft),
		docLeft: Math.round(docLeft),
		docBottom: Math.round(docBottom),
		docRight: Math.round(docRight)
	};

}


/* showModal //
//-----------//
// - Функция вызывает модальное окно с text, и кнопкой "Да", вызывающей callback.

	Аргументы
		- config			| конфигурационный объект

	Возвращает
		- ID созданного модального окна.

	Конфигурационный объект

		{
			id: [стока с id],										|   | уникальный ID для модального окна
			header: [заголовок окна], 	  			|   | текст для заголовка модального окна
			ok_name: [имя кнопки ok],						|   | имя для кнопки OK
			cancel_name: [имя кнопки cancel],		|   | имя для кнопки cancel
			standard_css: [1/0],								|   | использовать ли "стандартный" CSS для модального окна
			width: [число],											|   | можно задать ширину модального окна в пикселах
			html: [строка с html],							|   | html-код, который будет помещён между заголовком и кнопками
			callback: [функция], 								|		| функция, которая будет вызвана после нажатия на любую кнопку
			target: [dom-элемент],							|   | dom-элемент, который будет хозяином мод.окна
			params: [объект с параметрами]			|   | параметры, которые надо передать в callback
		}

	Конфигурационный объект "по умолчанию"

		{
			header: 'Модальное окно',
			ok_name: 'Да',
			cancel_name: 'Нет',
			standard_css: '1',
			html: '',
			callback: function(arg){
				if(arg) alert("Нажата кнопка 'Да'");
				else alert("Нажата кнопка 'Нет'");
			},
			target: Main.body
		}

	Как работает
		- Генерируется HTML из описанного ниже шаблона, и вставляется в body.
		- Если передано standard_css, дополнительно генерируется стандартный CSS.
		- При нажатии на кнопку 'ok':
			- Сначала вызывается функция 'callback' без аргументов.
			- Затем модальное окно с config.id удаляется вместе с содержимым.
		- При нажатии на кнопку 'cancel':
			- Сначала вызывается функция 'callback' с аргументом 'null'.
			- Затем модальное окно с config.id удаляется вместе с содержимым.

	Что с CSS модального окна?
		- Тут есть 2 варианта:

			1) Использовать свой, кастомный CSS.
				- Это вариант используется умолчанию.
				- Сгенерированный HTML не получает никакого CSS.
				- Подразумевается, что соотв. CSS для эл-та с ID == config.id присутствует в документе.
				- И в этом css, для всех классов внутри эл-та с config.id описано всё, что надо.

			2) Использовать стандартный CSS.
				- Преимущество этого варианта в том, что не требуется создавать
					никаких внешних CSS-правил. Вместо этого стандартные CSS-правила
					создаются при помощи JS при создании модального окна.
				- Чтобы воспользоваться этим вариантом, в конфиге надо передать
					параметр 'standard_css' == '1'.


	Шаблон HTML-структуры

			<div id='[config.id]'>

				// Чёрный щит на заднем плане, с полупрозрачностью .25 (по умолчанию)
				<div class="mw_shield"></div>

				// Контейнер для модального окна.
				<div class="mw_container">

					// Содержимое модального окна
					<div class="mw_modal">

						// Заголовок
						<div class="mw_header">[config.header]</div>

						// Контент
						<div class="mw_content">[config.html]</div>

						// Кнопки
						<div class="mw_buttons">

							// Кнопка Ok
							<div class='mw_ok'>[config.ok_name]</div>

							// Кнопка Cancel
							<div class='mw_cancel'>[config.cancel_name]</div>

						</div>

					</div>

				</div>

			</div>

	Примечания

		> Почему нельзя блок 'mw_modal' поместить в блок 'mw_shield'?
			- 'mw_shield', как правило, имеет opacity < 1.
			- А это значит, что и все его дети тоже будут иметь такую opacity.
			- Но мы бы хотели, чтобы модальное окно имело opacity == 1.
			- Поэтому 'mw_modal' и помещается в отдельный блок 'mw_container'.

		> Как выровнять блок 'mw_modal' в по центру блока 'mw_container'?

				.mw_container {

					position: fixed;
					left: 50%;

				}

				.mw_modal {

					position: relative;
					left: -50%;

				}

	Примеры использования

		> Тестовое модальное окно

				showModal();

		> Модальное окно со стандартным CSS и обработкой клика по кнопкам

				showModal({

					header: 'Модальное окно',
					ok_name: 'Да',
					cancel_name: 'Нет',
					standard_css: '1',
					html: 'Содержимое модального окна',
					callback: function(arg, params){
						if(arg !== null) alert("Нажата кнопка 'Да'");
						else alert("Нажата кнопка 'Нет'");
					},
					target: '',
					params: {}
				});


-------------------------------------*/
function showModal(config) {

	// 1. Если config не передан, задать конф. объект по умолчанию
	if(!config) config = {};
	if(!config.header) config.header = 'Модальное окно';
	if(!config.ok_name) config.ok_name = 'Закрыть';
	if(!config.cancel_name) config.cancel_name = '';
	if(!config.html) config.html = 'Содержимое модального окна';
	if(!config.callback) config.callback = function(arg){
		if(arg !== null) alert("Нажата кнопка 'Да'");
		else alert("Нажата кнопка 'Нет'");
	};
	if(!config.target) config.target = document.body;
	if(!config.params) config.params = {};

	// 2. Сгенерировать HTML-структуру мод. окна в соотв. с шаблоном
	var main = document.createElement('div');

		var shield = document.createElement('div');					main.appendChild(shield);
		var container = document.createElement('div');  		main.appendChild(container);

			var modal = document.createElement('div'); 				container.appendChild(modal);

				var header = document.createElement('div');			modal.appendChild(header);
				var content = document.createElement('div');		modal.appendChild(content);
				var buttons = document.createElement('div');  	modal.appendChild(buttons);

					var button_ok = document.createElement('div');			buttons.appendChild(button_ok);
					if(config.cancel_name) { var button_cancel = document.createElement('div');	buttons.appendChild(button_cancel); }

	// 3. Назначить в созданной HTML-структуре CSS-классы в соотв. с шаблоном
	shield.className 				= 'mw_shield';
	container.className 		= 'mw_container';
	modal.className 				= 'mw_modal';
	header.className 				= 'mw_header';
	content.className 			= 'mw_content';
	buttons.className 			= 'mw_buttons';
	button_ok.className 		= 'mw_ok';
	if(config.cancel_name) button_cancel.className = 'mw_cancel';

	// 4. Применить к созданной HTML-структуре переданные в конфиге параметры

		// 4.1. id

			// 4.1.1. Если config.id не пуст, добавить его, как id в main
			if(config.id) main.id = config.id;

			// 4.1.2. В противном случае сгенерировать и добавить уникальный id
			else {
				for(var i=0; i<1000; i++) {
					if(!document.getElementById('mw_'+i)) {
						main.id = 'mw_'+i;
						break;
					}
				}
			}

		// 4.2. header
		if(config.header) header.innerHTML = config.header;

		// 4.3. ok_name
		if(config.ok_name) button_ok.innerHTML = config.ok_name;
		else button_ok.innerHTML = 'Да';

		// 4.4. cancel_name
		if(config.cancel_name) button_cancel.innerHTML = config.cancel_name;

		// 4.5. html
		if(config.html) content.innerHTML = config.html;

		// 4.6. standard_css
		if(config.standard_css) {

			// Для shield
			shield.style.cssText = (function () {/*

				position: fixed;
				left: 0;
				top: 0;
				width: 100%;
				height: 100%;
				background: #000;
				opacity: .25;

				z-index: 1000;

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			// Для container
			container.style.cssText = (function () {/*

				position: fixed;
				display: block;
				width: 100%;
				height: 100%;
				overflow-y: scroll;

				top: 0;
				margin-top: 0;
				text-align: center;

				z-index: 1001;

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			// Для modal
			modal.style.cssText = (function () {/*

				position: fixed;
				display: inline-block;
				line-height: normal;

				padding: 5px 10px;
				background: #f5faff;
				border-radius: 10px;
				box-shadow: 2px 2px 8px RGBA(0,0,0,.5);
				font-size: 14px;
				color: #4b4b4b;
				user-select: none;

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

				// Если config.width передан, то задать кастомную ширину окна
				if(config.width) modal.style.width = config.width + 'px';

			// Для header
			header.style.cssText = (function () {/*

				font-size: 16px;
				font-weight: bold;
				margin-bottom: 10px;
				border-bottom: 1px solid #dfdada;

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			// Для content
			content.style.cssText = (function () {/*

				font-size: 14px;
				text-align: left;

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			// Для buttons
			buttons.style.cssText = (function () {/*

				padding-top: 6px;
				margin-top: 12px;
				border-top: 1px solid #dfdada;

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			// Если button_cancel существует:
			if(config.cancel_name) {

				// Для button_ok
				button_ok.style.cssText = (function () {/*

					display: inline-block;
					text-align: center;
					margin-right: 5%;
					width: 100px;
					height: 22px;
					line-height: 22px;
					background: #dfdada;
					cursor: pointer;
					vertical-align: bottom;

				*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

				// Для button_cancel
				if(config.cancel_name) button_cancel.style.cssText = (function () {/*

					display: inline-block;
					text-align: center;
					margin-left: 5%;
					width: 100px;
					height: 22px;
					line-height: 22px;
					background: #dfdada;
					cursor: pointer;
					vertical-align: bottom;

				*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			}

			// Если button_cancel не существует:
			else {

				// Для button_ok
				button_ok.style.cssText = (function () {/*

					display: inline-block;
					text-align: center;
					width: 100px;
					height: 22px;
					line-height: 22px;
					background: #dfdada;
					cursor: pointer;
					vertical-align: bottom;

				*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			}

		}

	// 5. Кроссбраузерно назначить обработчик события 'click' эл-ту button_ok
	addEvent(button_ok, 'click', function(event, params){

		// 5.1. Выполнить функцию callback без аргументов.
		var result = config.callback('', params);

		// 5.2. Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
		event = fixEvent(event);

		// 5.3. Кроссбраузероно остановить всплытие события.
		event.stopPropagation ? event.stopPropagation() :
														(event.cancelBubble=true);

		// 5.4. Удалить модальное окно
		if(!result) main.parentNode.removeChild(main);

	}, config.params);

	// 6. Кроссбраузерно назначить обработчик события 'click' эл-ту button_cancel
	// - Если этот элемент сущесвует
	if(config.cancel_name) {
		addEvent(button_cancel, 'click', function(event, params){

			// 6.1. Выполнить функцию callback без аргументов.
			var result = config.callback(null, params);

			// 6.2. Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
			event = fixEvent(event);

			// 6.3. Кроссбраузероно остановить всплытие события.
			event.stopPropagation ? event.stopPropagation() :
															(event.cancelBubble=true);

			// 6.4. Если функция вернула пустое значение, удалить модальное окно
			if(!result) main.parentNode.removeChild(main);

		}, config.params);
	}

	// 7. Добавить созданную структуру в body
	if(config.target) config.target.appendChild(main);
	else document.body.appendChild(main);

	// 8. Вычислить оконные координаты ЛВ угла modal так, чтобы оно было в центре

		// Написать функцию, которая вычисляет оконные коорд. мод. окна та, чтобы оно было в центре
		var getModalWindowCoords = function() {

			// Получить размеры и координаты окна
			var w = getBrowserWindowMetrics();

			// Получить внешние размеры элемента modal
			var msize = getBoundingDocRect(modal);

			// Получить координаты ЛВ угла модал так, чтобы оно было в центре
			return {
				left: w.width/2 - msize.width/2,
				top: w.height/2 - msize.height/2
			};

		};

		// Получить координаты
		var coords = getModalWindowCoords();

		// Сообщить modal вычисленные координаты
		modal.style.left = coords.left + 'px';
		modal.style.top = coords.top + 'px';

		// Будем мониторить изменение размера каждые 100мс
		setTimeout(function run(){

			// Получить координаты
			var coords = getModalWindowCoords();

			// Сообщить modal вычисленные координаты
			modal.style.left = coords.left + 'px';
			modal.style.top = coords.top + 'px';

			setTimeout(run, 100);
		}, 100);

	// 8. Вернуть id сгенерированного модального окна
	return main.id;

}


/* notify //
//--------//
// - На N секунд показывает в верхней части экрана плашку с заданной инфой.

	Аргументы
		- config		| конфигурационный объект

	Возвращает
		- id созданного элемента

	Конфигурационный объект

		{
		 	msg,			| *	| html или строка с сообщением, которое надо показывать
		 	time,			| 	| кол-во секунд, в течение которых надо показывать плашку
		 	target,		| 	|	dom-элемент, которому будет принадлежать dom-элемент-плашка
			width,		|  	| ширина плашки px
			height,		| 	| высота плашки px
			loading,	|		| url анимированной gif-картинки, демонстрирующей, что идёт загрузка
			color,		|		| цвет плашки, если не задан, то идёт стандартный серый
			fontcolor,|		| цвет текста
			speed,		|		| скорость раскрытия/закрытия плашки
			only			|		| закрывать ли все предыдущие подсказки при появлении новой? (0 | 1)
		}

	Пример использования

		var notid = notify({
				msg: 'Загрузка...',
				time: '7',
				height: '50px',
				speed: '.3',
				only: 1
			});

-------------------------------------*/

function notify(config) {

	// 1. Если config не передан, задать конф. объект по умолчанию
	if(!config) config = {};
	if(!config.msg) return 0;
	if(!config.time) config.time = 5;
	if(!config.target) config.target = document.body;
	if(!config.width) config.width = '';
	if(!config.height) config.height = 50;
	if(!config.loading) config.loading = '';
	if(!config.color) config.color = '#eee';
	if(!config.fontcolor) config.fontcolor = '#000';
	if(!config.speed) config.speed = '.3';
	if(!config.only) config.only = 1;

		// 1.1. Удалить все предыдущие 50 подсказок, если config.only == 1
		if(config.only == 1) {
			for(var i=0; i<50; i++){
				var id = 'notyplate_perspective_'+i;
				var e = document.getElementById(id);
				if(e) e.parentNode.removeChild(e);
			}
		}

	// 2. Сгенерировать HTML-структуру плашки
	var perspective = document.createElement('div');
	var main = document.createElement('div');	perspective.appendChild(main);

	// 3. Назначить элементам css-классы
	perspective.className = 'notyplate_perspective_css';
	main.className = 'notyplate_main_css';

	// 4. Назначить элементу perspective id
	var num = 0;
	var id = '';
	for(var i=0; i<1000; i){
		id = 'notyplate_perspective_'+num;
		if(document.getElementById(id)) { num++; continue; }
		break;
	}
	perspective.id = id;

	// 5. Добавить внутрь плашки переданный текст
	main.innerHTML = config.msg;

	// 6. Задать элементам плашки стандартные css-стили (в соотв. с параметрами)

		// 6.1. Стили для perspective
		perspective.style.cssText = (function () {/*

			-webkit-perspective: 500px;
			perspective: 500px;

			position: fixed;
			width: 100%;
			top: -5px;
			text-align: center;
			height: 1px;
			z-index: 100000000000000000;

		*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

		// 6.2. Стили для main
		main.style.cssText = (function () {/*

			display: inline-block;

			height: 30px;
			background-color: #eee;
			line-height: 30px;
			padding: 10px 20px;
			text-align: center;
			box-shadow: 0 1px 1px rgba(0,0,0,.2);
			border: 1px solid #777;
			border-radius: 0 0 5px 5px;

			-webkit-transition: all .5s ease-in-out;
				 -moz-transition: all .5s ease-in-out;
					 -o-transition: all .5s ease-in-out;
							transition: all .5s ease-in-out;

			-webkit-transform-origin: 50% 0%;
				 -moz-transform-origin: 50% 0%;
					-ms-transform-origin: 50% 0%;
					 -o-transform-origin: 50% 0%;
							transform-origin: 50% 0%;

			-webkit-transform: rotateX(-90deg);
				 -moz-transform: rotateX(-90deg);
					-ms-transform: rotateX(-90deg);
					 -o-transform: rotateX(-90deg);
							transform: rotateX(-90deg);

			opacity: .5;

		*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];
		if(config.width) main.style.width 						= config.width + 'px';
		main.style.height 					= config.height + 'px';
		main.style.backgroundColor 	= config.color;
		main.style.color 						= config.fontcolor;

		main.style.transitionDuration = config.speed+'s';
		main.style.webkitTransitionDuration = config.speed+'s';
		main.style.MozTransitionDuration = config.speed+'s';
		main.style.OTransitionDuration = config.speed+'s';
		main.style.msTransitionDuration = config.speed+'s';

	// 7. Добавить созданную структуру в target
	config.target.appendChild(perspective);

	// 8.	Повернуть созданную структуру по оси X, установив угол на 0 градусов
	// - И сделать opacity 100
	// - Сделать это через 2 секунды, дав браузеру время на обработку
	setTimeout(function(main){

		main.style.opacity = '1';

		main.style.webkitTransform = 'rotateX(0deg)';
		main.style.MozTransform = 'rotateX(0deg)';
		main.style.msTransform = 'rotateX(0deg)';
		main.style.OTransform = 'rotateX(0deg)';
		main.style.transform = 'rotateX(0deg)';

	}, 100, main);

	// 9. Убрать плашку через time секунд
	setTimeout(function(id, main, perspective, speed){

		// 1) Скроем в 3d-стиле плашку с инфой
		// - И сделать opacity == 0
		main.style.opacity = '0';

		main.style.webkitTransform = 'rotateX(-90deg)';
		main.style.MozTransform = 'rotateX(-90deg)';
		main.style.msTransform = 'rotateX(-90deg)';
		main.style.OTransform = 'rotateX(-90deg)';
		main.style.transform = 'rotateX(-90deg)';

		// 2) Удалим dom-элемент плашки (с id) через speed секунд
		setTimeout(function(perspective){

			if(perspective.parentNode)
				perspective.parentNode.removeChild(perspective);

		}, speed*1000, perspective);

	}, +config.time*1000, id, main, perspective, config.speed);

	// 10. Вернуть id элемента perspective
	return id;

}


//---------------//
// > popupCenter //
//---------------//
// - Открыть указанный URL в новом всплывающем окне указанных размеров по центру
function popupCenter(url, title, widgh, height) {

	// 1. Принять ширину и высоту нового окна
	var newWindow = {};
	newWindow.width = widgh ? widgh : 800;
	newWindow.height = height ? height : 600;

	// 2. Получить ширину и высоту экрана
	var screenMetrics = {};
	screenMetrics.width = screen.width;
	screenMetrics.height = screen.height;

	// 3. Вычислить координаты ЛВ угла нового окна
	// - Чтобы его центр совпал с центром экрана
	newWindow.left = (screenMetrics.width - newWindow.width)/2;
	newWindow.top = (screenMetrics.height - newWindow.height)/2;

	// 4. Создать новое окно
	var newWindowInstance = window.open(url, title, 'scrollbars=yes, width=' + newWindow.width + ', height=' + newWindow.height + ', top=' + newWindow.top + ', left=' + newWindow.left);

	// 5. Если создать новое окно удалось, перевести фокус на новое окно
	if(newWindowInstance)
		newWindowInstance.focus();

	// 6. Вернуть newWindowInstance
	return newWindowInstance;

}


/* getXhr //
//--------//
// - Кроссбраузерно создаёт XHR-объект (в т.ч. для IE6).

	Аргументы:
		- Нет

	Возвращает:
		- В случае успеха ссылку на созданный xhr-объект
		- В случае неудачи null

	Примечания:
		- Свойство XMLHttpRequest есть во всех современных браузерах, и в IE7+
		- В IE5-IE6 вместо него есть св-во ActiveXObject.

-------------------------------------*/
function getXHR() {
  if (window.XMLHttpRequest) {
    // Chrome, Firefox, IE7+, Opera, Safari
    return new XMLHttpRequest();
  }
  // IE6
  try {
    // The latest stable version. It has the best security, performance,
    // reliability, and W3C conformance. Ships with Vista, and available
    // with other OS's via downloads and updates.
    return new ActiveXObject('MSXML2.XMLHTTP.6.0');
  } catch (e) {
    try {
      // The fallback.
      return new ActiveXObject('MSXML2.XMLHTTP.3.0');
    } catch (e) {
      alert('This browser is not AJAX enabled.');
      return null;
    }
  }
}


/* ajax //
//------//
// - Функция для отправки асинхронного AJAX-запроса.

	Аргументы:
		- config			| конфигурационный объект

	Возвращает:
		- Ничего

	Конфигурационный объект

		{
			callback: [ссылка на функцию],			|   | функция-обработчик события readystatechange, которая будет ловить ответ (status: 200)
			params: [объект],										|   | объект с параметрами для передачи в callback
			error_callback: [ссылка на функцию],|   | функция-обработчик события readystatechange, которая будет ловить ошибку (status не 200 - ошибка!)
			timeout: [секунд, обработчик],			|   | через сколько секунд будет таймаут + обработчик
			method: [строка-метод запроса],			|   | метод запроса
			url: [строка url запроса]						|   | url запроса
			headers: [объект с заголовками],  	|   | объект с заголовками, которые надо передать запросу
			requestBody: [строка-тело запроса], |   | тело запроса
		}

	Конфигурационный объект "по умолчанию"

		{
			method: "get",
			headers: {"Content-Type": "application/x-www-form-urlencoded"},
		}

	Примечения:

		# Событие readystatechange поддерживается IE7+.
			- Так что эта функция работает для IE7+.

		# При отправке файла надо в headers передавать false
			- Иначе будет отправлен заголовок с content-type.
			- И данные файла будут испорчены, и не передадутся.


	Примеры использования:

		1. Отправить GET-запрос на указанный URL
		   - Content-Type == "application/x-www-form-urlencoded"

				ajax({
					url: 'http://google.com?ivan=1&lena=2'
				});

		2. Отправить POST-запрос на указанный URL
			- Content-Type == "application/json"
			- В теле запроса передать параметр 'delete' со значением == id

				ajax({
					method: 'post',
					headers: {"Content-Type": "application/json"},
					requestBody: makeJSON([["delete", id]]),
					callback: function(event) {

						// Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами.
						// Также, кроссбраузерно получить target-элемент

							//Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
							event = fixEvent(event);

							//Кроссбраузерно получить target-элемент
							target = 	event && event.target ||
															event.srcElement;

						// Проверить, если xhr.readyState != 4, завершить работу функции-обработчика.
						if(this.readyState != 4) return;

						// Проверить, успехом или неудачей закончился AJAX-запрос:
						if(this.status == 200) {
							console.log("AJAX-запрос завершён успешно");


						}
						else console.log("AJAX-запрос завершён неудачно");

					}
				});

-------------------------------------*/
function ajax(config) {

	// 1. Если config не передан, задать конф. объект по умолчанию
	if(!config) config ={};

		if(!config.method) config.method = 'get';
		if(!config.headers && config.headers !== false) config.headers = {"Content-Type": "application/x-www-form-urlencoded"};
		if(!config.url) config.url = window.location.href;
		if(!config.params) config.params = {};

	// 2. Кроссбраузерно создать новый xhr-объект
	var xhr = getXHR();

	// 3. Открыть xhr-объект
	xhr.open(config.method, config.url, true);

	// 4. Прикрепить к запросу заголовки

		// 4.1. Если config.headers не пуст, то:
		if(config.headers) {
			for(var key in config.headers) {

				// Будем перебирать только собственные свойства объекта config.headers
				if(!config.headers.hasOwnProperty(key)) continue;

				// Прикрепить заголовок
				xhr.setRequestHeader(key, config.headers[key]);

			}
		}

	// 5. Установить таймаут и его обработчик
	if(config.timeout && config.timeout[0] && config.timeout[1]) {

		var ajaxTimeout = function() {
			 xhr.abort();
			 config.timeout[1].bind(this)();
		};

		var xmlHttpTimeout = setTimeout(ajaxTimeout, +config.timeout[0]*1000);

	}

	// 6. Если config.callback не пуст
	if(config.callback) {

		// 6.0. Добавить в params значнеие xmlHttpTimeout, если не пустое
		if(xmlHttpTimeout) config.params.xmlHttpTimeout = xmlHttpTimeout;

		// 6.1. Кроссбраузерно назначить объекту xhr обработчик config.callback
		//      события onreadystatechange.
		addEvent(xhr, 'readystatechange', function(event, params) {

			// Получить ID обработчика setTimeout, который надо отменить
			var idOfSettimeout = params.xmlHttpTimeout;

			// Подготовка
			event = fixEvent(event);
			var target = 	event && event.target ||
										event.srcElement;
			if(this.readyState != 4) return;

			// Если OK
			if(this.status == 200) {

				// Отменить таймаут
				clearTimeout(idOfSettimeout);

				// Выполнить функцию callback
				config.callback(this, this.status, event, target, params);

			}

			// Если какая-то ошибка
			else {

				// Отменить таймаут
				clearTimeout(idOfSettimeout);

				// Выполнить функцию error_callback
				config.error_callback(this, this.status, event, target);

			}

		}, config.params);

	}

	// 7. Отправить AJAX-запрос

		// 7.1. Если тело запроса config.requestBody передано, то отправить с ним:;
		if(config.requestBody) xhr.send(config.requestBody);

		// 7.2. В противном случае, отправить без него
		else xhr.send();

}


/* makeJSON //
//----------//
// - Создать json-строку из переданного массива пар значений.

	Аргументы:
		- pairs			| 2d массив пар, из которых надо сделать json-строку

	Возвращает:
		- Готовую json-строку

	Как это работает?
		- Передаём функции массив подобного вида.
		- Причем var1, var2 - это переменные, содержащие значения.

				[ [var1, var2], [var3,var4], ... ]

		- А назад получаем такую json-строку.
		- Она состоит из значений переменных из массива:

				{
					"[значение var1]": "[значение var2]",
					"[значение var3]": "[значение var4]",
					...
				}

	Примечания
		- Эта функцию решает проблему "как сделать json-строку из значений переменных".
		- Проблема в том, что индексы объекта автоматом преобразуются в строку.
		- И если нам надо, чтобы эти индексы брались из переменных, просто подставить
			переменные не получится.

-------------------------------------*/
function makeJSON(pairs) {

	// 1. Если pairs отсутствует или пуст, завершить работу.
	if(!pairs || pairs.length==0) {
		console.log('Не корректное значение pairs');
		return;
	}

	// 2. Сконструировать объект из пар значений из paris
	var data = {};
	for(var i=0; i<pairs.length; i++) {
		data[pairs[i][0]] = pairs[i][1];
	}

	// 3. Преобразовать объект data в JSON-строку и вернуть:
	return JSON.stringify(data);

}


//----------//
// > ajaxko //
//----------//
// - Функция для ajax-запросов в стиле ko к командам и контроллерам
function ajaxko(self, config) {

	// 1] Назначить конфигу значения по умолчанию

		// 1.1] Если объекта config нет, или config не объект, создать его
		if(!config || (test = {}).toString.call(config).slice(8,-1) != "Object")
			config = {};

		// 1.2] Назначить умолчательные значения для отсутствующих св-в

			// 1.2.1] self
			config.self = ajaxko;

			// 1.2.2] from
			if(!config.from || (test = {}).toString.call(config.from).slice(8,-1) != "String")
				config.from = "ajaxko";

			// 1.2.3] from_ex
			if(!config.from_ex || (test = {}).toString.call(config.from_ex).slice(8,-1) != "Array")
				config.from_ex = [];

			// 1.2.4] prejob
			if(!config.prejob || (test = {}).toString.call(config.prejob).slice(8,-1) != "Function")
				config.prejob = function(config, data, event){};

			// 1.2.5] command
			if(!config.command || (test = {}).toString.call(config.command).slice(8,-1) != "String")
				config.command = "";

			// 1.2.6] key
			if(!config.key || (test = {}).toString.call(config.key).slice(8,-1) != "String")
				config.key = "";

			// 1.2.7] data
			if(!config.data || (test = {}).toString.call(config.data).slice(8,-1) != "Object")
				config.data = {};

			// 1.2.8] callback
			if(!config.callback || (test = {}).toString.call(config.callback).slice(8,-1) != "Function")
				config.callback = function(){};

			// 1.2.9] ajax_method
			if(!config.ajax_method || (test = {}).toString.call(config.ajax_method).slice(8,-1) != "String")
				config.ajax_method = "post";

			// 1.2.10] ajax_headers
			if(!config.ajax_headers || (test = {}).toString.call(config.ajax_headers).slice(8,-1) != "Object")
				config.ajax_headers = {"Content-Type": "application/json", "X-CSRF-TOKEN": server.csrf_token};

			// 1.2.11] ajax_request_body
			if(!config.ajax_request_body)
				config.ajax_request_body = "";

			// 1.2.12] ajax_params
			if(!config.ajax_params || (test = {}).toString.call(config.ajax_params).slice(8,-1) != "Object")
				config.ajax_params = {};

			// 1.2.13] postjob
			if(!config.postjob || (test = {}).toString.call(config.postjob).slice(8,-1) != "Function")
				config.postjob = function(data, params){};

			// 1.2.14] ok_0
			if(!config.ok_0 || (test = {}).toString.call(config.ok_0).slice(8,-1) != "Function")
				config.ok_0 = function(data, params){};

			// 1.2.16] ok_1
			if(!config.ok_1 || (test = {}).toString.call(config.ok_1).slice(8,-1) != "Function")
				config.ok_1 = function(data, params){
					notify({msg: data.data + ': you are not authorized', time: 5, fontcolor: 'RGB(200,50,50)'});
					console.log(data.data + ': you are not authorized to perform that operation');
				};

			// 1.2.17] ok_2
			if(!config.ok_2 || (test = {}).toString.call(config.ok_2).slice(8,-1) != "Function")
				config.ok_2 = function(data, params){
					console.log('An error has occurred. Look for details in log.');
				};

			// 1.2.18] error
			if(!config.error || (test = {}).toString.call(config.error).slice(8,-1) != "Function")
				config.error = function(xhr, status, event, target){
					console.log(arguments[0].responseText);
				};

			// 1.2.19] timeout_secs
			if(!config.timeout_secs || (test = {}).toString.call(config.timeout_secs).slice(8,-1) != "Number")
				config.timeout_secs = 200;

			// 1.2.20] timeout
			if(!config.timeout || (test = {}).toString.call(config.timeout).slice(8,-1) != "Array")
				config.timeout = [config.timeout_secs, function(){
					console.log("Error: timeout "+config.timeout_secs+" seconds");
				}];

			// 1.2.21] url
			if(!config.url || (test = {}).toString.call(config.url).slice(8,-1) != "String")
				config.url = window.location.href;

			// 1.2.22] data & event
			var data = self;
			var event = self;

			// 1.2.23] timestamp
			if(!config.timestamp || (test = {}).toString.call(config.timestamp).slice(8,-1) != "Number")
				config.timestamp = "";

	    // 1.2.24] dont_touch_ajax_counter
			if(!config.dont_touch_ajax_counter)
				config.dont_touch_ajax_counter = false;

	// 2] Если и command, и key пусты, завершить
	if(!config.command && !config.key) {
		console.log("В ajaxko и command, и key пусты, завершаю...");
		return;
	}


	// 3] Завершить, если функция вызвана не действием пользователя
	// - И не определёнными программами.
	// - А программно, прочими программами.
	// if(event)
	// 	 if(!event.originalEvent && config.from_ex.indexOf(config.from) == -1)
	// 		 return;


	// 4] Применить "механизм отложенного сохранения для текстовых полей"
	//if(f.s0.txt_delay_save.use(config.self.bind('', config, data, event)))
	//	return;


	// 5] Выполнить config.prejob
	config.prejob(config, data, event);


	// 6] Подготовить объект в виде json-строки к отправке на сервер
	var o = {
		command: 		config.command,
		key:     		config.key,
		data:    		config.data
	};
	o.data.timestamp = self.m.s0.ajax_timers[o.command + '_' + o.key] = (config.timestamp ? config.timestamp : Date.now());
	var json = ko.toJSON(o);


	// 7] Заблокировать закрытие документа, сделав пометку о наличии не сохранённых данных
	self.f.s0.txt_delay_save.block();


	// 8] Изменить на +1 счётчик ожидающих ответов ajax-запросов
	if(!config.dont_touch_ajax_counter)
		self.m.s0.ajax_counter(+self.m.s0.ajax_counter() + 1);


	// 9] Рассчитать объект с параметрами для ajax-запроса
	var params4ajax = {self: self, o: o, config: config};
	for(var key in config.ajax_params) {

		// 9.1] Если свойство не своё, пропускаем
		if(!config.ajax_params.hasOwnProperty(key)) continue;

		// 9.2] Добавим в obj свойство key
		params4ajax[key] = config.ajax_params[key];

	}

	// 10] Отправить объект на сервер ajax-запросом
	ajax({
		url: config.url,
		method: config.ajax_method,
		headers: config.ajax_headers,
		requestBody: config.ajax_request_body ? config.ajax_request_body : json,
		params: params4ajax,

		// Обработка OK-ответа с сервера
		callback: function(xhr, status, event, target, params) {

			// 10.1] Получить ответ сервера
			var data = JSON.parse(xhr.responseText);

			// 10.2] Выполнить postjob
			params.config.postjob(data, params);

			// 10.3] Изменить на -1 счётчик ожидающих ответов ajax-запросов
			if(!params.config.dont_touch_ajax_counter)
				self.m.s0.ajax_counter(+self.m.s0.ajax_counter() - 1);

			// 10.4] Если data.timestamp < self.m.s0.ajax_timers[o.command + '_' + o.key]
			if(data.timestamp < self.m.s0.ajax_timers[o.command + '_' + o.key]) return;

			// 10.5] Разблокировать закрытие документа, убрав пометку о наличии не сохранённых данных
			// - Но только, если m.s0.ajax_counter == 0
			if(self.m.s0.ajax_counter() == 0)
				self.f.s0.txt_delay_save.unblock();

			// 10.6] Если data.status == 0
			if(data.status == 0) {

				// 10.6.1] Выполнить params.config.ok_0
				params.config.ok_0(data, params);

				// 10.6.2] Выполнить callback
				if(params.config.callback) params.config.callback(data, params);

			}

			// 10.7] Если data.status == -1
			if(data.status == -1) {

				params.config.ok_1(data, params);

			}

			// 10.8] Если data.status == -2
			if(data.status == -2) {

				params.config.ok_2(data, params);

			}

		},

		// Обработка ответа сервера в случае ошибки
		error_callback: config.error,

		// Обработка ответа сервера в случае таймаута
		timeout: config.timeout

	});

};




//-------------//
// > getCookie //
//-------------//
// - Извлечь куку по имени из Main.cookie
function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}


//-------------//
// > setCookie //
//-------------//
// - Записать куку
function setCookie(name, value, options) {
  options = options || {};

  var expires = options.expires;

  if (typeof expires == "number" && expires) {
    var d = new Date();
    d.setTime(d.getTime() + expires * 1000);
    expires = options.expires = d;
  }
  if (expires && expires.toUTCString) {
    options.expires = expires.toUTCString();
  }

  value = encodeURIComponent(value);

  var updatedCookie = name + "=" + value;

  for (var propName in options) {
    updatedCookie += "; " + propName;
    var propValue = options[propName];
    if (propValue !== true) {
      updatedCookie += "=" + propValue;
    }
  }

  document.cookie = updatedCookie;
}


//----------------//
// > deleteCookie //
//----------------//
// - Удалить куку
function deleteCookie(name) {
  setCookie(name, "", {
    expires: -1
  })
}


/* customPlaceholder //
//-------------------//
// - Организует плейсхолдер для txt-эл.формы, у которых есть атрибут data-placeholder.

	Аргументы
		- ID

	Возвращает
		- Ничего

	Принцип работы

		Что делает?
			1) Если ID передан, ищет в документе элемент с этим ID. И если:
					 - это input type='text' или textarea
					 - Есть атрибут data-placeholder
				 То организует для него кастомный плейсхолдер.
			2) Если ID не передан, ищет в док-те все эл-ты:
			  	 - это input type='text' или textarea
			  	 - есть атрибут data-placeholder
				 И организует для них кастомный плейсхолдер.

		Как работает?

			1) Вставляет "серый" текст плейсхолдера в атрибут value элемента.
			2) Когда пользователь кликает по элементу:
				- Если value равно тексту плейсхолдера, value обнуляется.
				- "Серый" стиль у плейсхолдера убирается.
			3) Когда поле теряет фокус, если value пусто, то:
				- Если value пусто, то ему устанавливается текст плейсхолдера.
				- Также устанавливается "серый" стиль плейсхолдера

	Примечания
		- Атрибут 'value' св-во эл-та 'value' плохо синхронизируются.
		- При изменении значения атрибута, значение св-ва не меняется.
		- Зато при изменении значения св-ва, значение атрибута меняется.
		- Итог: здесь надо работать со свойством, а не с атрибутом.

-------------------------------------*/
function customPlaceholder(ID) {

	// 1. Проверить:
	//		- Передан ли атрибут ID
	//		- Существует ли в док-те эл-т с таким ID
	//    - Является ли этот элемент input type='text' или textarea
	//    - Имеет атрибут data-placeholder
	var result = 0;
	if(ID) {
		var e = document.getElementById(ID);
		if(e) {
			if(e.getAttribute('data-placeholder')) {
				if( (e.tagName == 'INPUT' && e.getAttribute('type') == 'text') ||
						 e.tagName == 'TEXTAREA') {
					result = 1;
				}
			}
		}
	}
	console.log('ID = '+ID);
	console.log('result = '+result);
	//2. Сформировать массив элементов, которым надо добавить плейсхолдеры
	//   - Это должны быть элементы input с type == 'text' и textarea.
	//   - И у которых есть не пустой атрибут data-placeholder

		// Подготовить массив для результатов
		var elems = [];

		// Если result == 0, то найти и добавить в массив все эл-ты, отвечающие:
		//   - Это должны быть элементы input с type == 'text' и textarea.
		//   - И у которых есть не пустой атрибут data-placeholder
		if(!result) {

			// Получить все элементы input type=='text'
			var all_inputs_text = document.getElementsByTagName('input');
			for(var i=0; i<all_inputs_text.length; i++) {

				if( all_inputs_text[i].getAttribute('type') == 'text' &&
						all_inputs_text[i].getAttribute('data-placeholder')) {
					elems.push(all_inputs_text[i]);
				}

			}

			// Получить все элементы textarea
			var all_textareas = document.getElementsByTagName('textarea');
			for(var j=0; j<all_textareas; j++) {

				if(all_textareas[i].getAttribute('data-placeholder'))
					elems.push(all_textareas[j]);

			}

		}

		// Если result == 1, то добавить в elems только 1 элемент с id == ID
		if(result) elems.push(document.getElementById(ID));

	// 3. Пробежаться по всем элементам elems
	for(var k=0; k<elems.length; k++) {

		// 3.1. Установить атр.value всех elems значения из data-placeholder
		elems[k].setAttribute('value', elems[k].getAttribute('data-placeholder'));

		// 3.2. Сделать шрифт всех elems[k] серым (плейсхолдер должен быть серым)
		elems[k].style.color = '#aaa';

		// 3.3. Кроссбраузерно назначить функцию-обработчик события 'click' всем elems
		addEvent(elems[k], 'click', function(event) {

			// 3.3.1. Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами.
			// 		    Также, кроссбраузерно получить target-элемент

				//Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
				event = fixEvent(event);

				//Кроссбраузерно получить target-элемент
				var target = 	event && event.target ||
											event.srcElement;

			// 3.3.2. Кроссбраузерно остановить всплытие события
			event.stopPropagation ? event.stopPropagation() :
												(event.cancelBubble=true);

			// 3.3.3. Если:
			// 				- target.type == 'text' || target.type == 'textarea'
			//        - target.value == target.getAttribute('data-placeholder')
			//       Установить значение value, равным ''.
			if( (target.type == 'text' || target.type == 'textarea') &&
					(target.value == target.getAttribute('data-placeholder') ||
					target.value == target.getAttribute('data-placeholder')) ) {

				// Убрать плейсхолдер
				target.value = '';

				// Убрать "серый" стиль плейсхолдера
				target.style.color = '';

			}
		});


		// 3.3. Кроссбраузерно назначить функцию-обработчик события 'blur'
		addEvent(elems[k], 'blur', function(event){

			// 3.4.1. Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами.
			// 		    Также, кроссбраузерно получить target-элемент

				//Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
				event = fixEvent(event);

				//Кроссбраузерно получить target-элемент
				var target = 	event && event.target ||
											event.srcElement;

			// 3.4.2. Если target.value == '', сделать его равным getAttribute('data-placeholder')
			if(target.value == '') {

				// Установить плейсхолдер
				target.value = target.getAttribute('data-placeholder');

				// Установить "серый" стиль плейсхолдера
				target.style.color = '#aaa';

			}

		});
	}

}


/* setImmediate //
//--------------//
// - Позволяет поставить выполнение указанного кода в конец очереди.

	Аргументы
		- callback

	Возвращает
		- Ничего

	Принцип работы

		> Основное
			- Ставить выполнение ф-ии callback в конец очереди.
			- Т.Е. она выполнится после всего стоящего в очереди на данный момент кода.

		> Приём 'cross domain messaging':
			- Позволяет скрипту из одного документа передавать текстовые сообщения
				скрипту в другом документе, не взирая на ПОП.
			- Отправить сообщение можно методом Window.postMessage(). Он производит
				асинхронную отправку сообщения.
			- Получить сообщение можно обработчиком события onmessage.

	Примечания
		- Задержка выполнения отсутствует. Выполнится сразу, как подойдёт очередь.
		- Добавляется как метод window.
		- А если дело происходит в IE>=10, где такая ф-ия есть, не добавляется.
		- Работает во всех браузерах, кроме IE<=7


-------------------------------------*/

// Если это IE>=10, и ф-ия setImmediate есть, то ничего не добавлять.
// - В ином случае, добавить объекту window метод setImmediate:
if (!window.setImmediate) window.setImmediate = (function() {
	var head = { }, tail = head; // очередь вызовов, 1-связный список

	var ID = Math.random(); // уникальный идентификатор

	// Подготовка функции-перехватчика события message из другого документа
	function onmessage(e) {
		if(e.data != ID) return; // не наше сообщение
		head = head.next;
		var func = head.func;
		delete head.func;
		func();
	}

	// Кросдоменное назначение обработчика событий onmessage
	if(window.addEventListener) { // IE9+, другие браузеры
		window.addEventListener('message', onmessage, false);
	} else { // IE8
		window.attachEvent( 'onmessage', onmessage );
	}

	// > Если это не IE<=7, то поставить func в конец текущей очереди
	// > Если это IE<=7, то вызвать для func обычный setTimeout.
	return window.postMessage ? function(func) {
		tail = tail.next = { func: func };
		window.postMessage(ID, "*");
	} :
	function(func) { // IE<8
		setTimeout(func, 0);
	};
}());


/* check_ie8 //
//-----------//
// - Проверить браузер на IE<=8.

	Аргументы
		- Нет

	Возвращает
		- True, если браузер, в котором выполнена ф-ия: IE <= 8
		- False в противном случае.

	Принцип работы
		- Смотрит комбинацию св-в Main, которая встречается только в IE<=8

-------------------------------------*/
function check_ie8() {

	// Проверка на IE8 и ниже
	if (document.all && !document.addEventListener) {
			return true;
	}

	// Браузер - не IE <= 8. Вернуть false.
	return false;

}


/* check_ie9 //
//-----------//
// - Проверить браузер на IE<=9.

	Аргументы
		- Нет

	Возвращает
		- True, если браузер, в котором выполнена ф-ия: IE <= 9
		- False в противном случае.

	Принцип работы
		- Смотрит комбинацию св-в Main, которая встречается только в IE<=9

-------------------------------------*/
function check_ie9() {

	// Проверка на IE9 и ниже
	if(document.all && !window.atob) {
			return true;
	}

	// Браузер - не IE <= 9. Вернуть false.
	return false;

}


/* get_object_type //
//-----------------//
// - Получить строку с типом объекта.

	Аргументы
		- Obj				| объект, чей тип нужно получить

	Возвращает
		- Строку с типом переданного объекта

-------------------------------------*/
function get_object_type(obj) {

	return {}.toString.call(obj).slice(8,-1);

}


/* insertAfter //
//-------------//
// - Вставить узел x в DOM, как дочерний элемент e, после элемента y.

	Аргументы
		- x				| объект, который надо вставить в DOM
		- y				| объект, после которого надо вставить в DOM объект x

	Возвращает
		- Ссылку на вставленный объект

-------------------------------------*/
function insertAfter(x,y) {
	return y.parentNode.insertBefore(x, y.nextSibling);
}


/* isImageExists //
//---------------//
// - Проверяет, существует ли картинка по указанному URL.

	Аргументы
		- Obj				| объект, чей тип нужно получить

	Возвращает
		- Строку с типом переданного объекта

	Пример использования

		var url = 'http://lk.grumart.ru/resources/images/userphotos/ManvelovGerman.png';
		isImageExists(url, function(exists) {

			console.log(exists);

		});

-------------------------------------*/
function isImageExists(url, callback) {

	// 1. Если нет URL, то вернуть false
	if(!url) return false;

	// 2. Если есть URL, запросить с него картинку

		// Подготовить объект-картинку
		var img = new Image();

		// Подготовить обработчики
		img.onload = function() { callback(true); };
		img.onerror = function() { callback(false); };

	  // Запросить картинку
		img.src = url;

	// 3. Вернуть true
	return true;

}


/* validateEmail //
//---------------//
// - Валидация адреса email.

	Аргументы
		- email				| строка, которую надо валидировать, как адрес email

	Возвращает
		- true в случае успешной валидации, иначе false

	Пример использования

		if(!validateEmail('ivan@gmail.com')) {

			// ...

		}

-------------------------------------*/
function validateEmail(email) {
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}


/* validateRusLetters //
//--------------------//
// - Валидация того, что строка состоит только из русских букв любого регистра, минимум 1-й.

	Аргументы
		- str				| строка, которую надо валидировать

	Возвращает
		- true в случае успешной валидации, иначе false

	Пример использования

		if(!validateRusLetters('Иван')) {

			// ...

		}

-------------------------------------*/
function validateRusLetters(str) {
	var re = /^[а-яА-ЯёЁ]+$/i;
	return re.test(str);
}


/* validateEngLetters //
//--------------------//
// - Валидация того, что строка состоит только из английских букв любого регистра, минимум 1-й.

	Аргументы
		- str				| строка, которую надо валидировать

	Возвращает
		- true в случае успешной валидации, иначе false

	Пример использования

		if(!validateEngLetters('Иван')) {

			// ...

		}

-------------------------------------*/
function validateEngLetters(str) {
	var re = /^[a-zA-Z]+$/i;
	return re.test(str);
}


/* validateRusEngLetters //
//-----------------------//
// - Только русские или английские буквы.

	Аргументы
		- str				| строка, которую надо валидировать

	Возвращает
		- true в случае успешной валидации, иначе false

	Пример использования

		if(!validateRusEngLetters('Иван')) {

			// ...

		}

-------------------------------------*/
function validateRusEngLetters(str) {
	var re = /^[a-zA-Zа-яА-ЯёЁ]+$/i;
	return re.test(str);
}


/* validatePassword //
//-----------------------//
// - Валидация пароля: не менее 8 символов.

	Аргументы
		- str				| строка, которую надо валидировать

	Возвращает
		- true в случае успешной валидации, иначе false

	Пример использования

		if(!validatePassword('Иван')) {

			// ...

		}

-------------------------------------*/
function validatePassword(str) {
	var re = /.{8,}/i;
	return re.test(str);
}


/* clickmenu //
//-----------//
// - Открывает меню с указанным функционалам, помещая его ЛВ угол в точку с указанными докум.коорд. относ.body.

	Аргументы
		- config		| конфигурационный объект

	Возвращает
		- id корневого элемента (панели) созданного меню

	Конфигурационный объект

		{
		 	coords,		| *	| {x: '', y: ''} докум.коорд. относ.Main в px, которые получит ЛВ угол меню
			content,	|   | содержание меню
			styles,		|   | альтернативные стили
			targets		|   | массив ссылок на эл-ты, при клике на которые контекстное меню должно закрываться
		}

	Содержание content (пример)

		{
			'Создать': function(){},
			'Изменить': function() {},
			'Удалить': function() {}
		}

	Содержание styles (что в него можно передать)

		{
			'bg': '#fefefe',									| цвет фона меню
			'border': '1px solid black',			| рамка меню
			'fontsize': '16px'								| размер шрифта меню
		}

	Особенности поведения
		- Меню закрывается при клике ЛК мыши по пункту меню.
		- Меню закрывается пли клике ЛК мыши в любом месте вне меню.
		- При закрытии меню должны уничтожаться и все обработчики событий меню.

	Пример использования

			var menuid = clickmenu({
				coords: {x: x, y: y},
				content: {
					'Создать': {
						func: function(params){ console.log(params.text) },
						params: {text: 1}
					},
					'Удалить': {
						func: function(params){ console.log(params.text) },
						params: {text: 2}
					}
				}
			});


-------------------------------------*/
function clickmenu(config) {

	// 1. Если config не передан, задать конф. объект по умолчанию
	if(!config) config = {};
	if(!config.coords) return 0;
	if(!config.content) config.content = {
		'Тест': {
			func: function(){ console.log('Тест контекстного меню') },
			params: {}
		}
	};
	if(!config.styles) config.styles = {
		'bg': '#fefefe',
		'border': '1px solid #eee',
		'fontsize': '14px',
		'boxshadow': '2px 2px 7px 0px rgba(50, 50, 50, 0.3)',
		'hlbg':	'#eee'
	};
	if(!config.targets) config.targets = [];

	// 2. Удалить все предыдущие 50 clickmenu
	for(var i=0; i<50; i++){
		var id = 'clickmenu_'+i;
		var e = document.getElementById(id);
		if(e) e.parentNode.removeChild(e);
	}

	// 2. Сгенерировать HTML-структуру меню

		// 2.1. Создать панель меню
		var menu = document.createElement('div');

		// 2.2. Создать в menu элемент ul - список пунктов меню

			// Создать
			var menuitems = document.createElement('ul');

			// Добавить menuitems в menu
			menu.appendChild(menuitems);

		// 2.3. Добавить в menutiems эл-ты li - пункты меню
		// - В соответствии с данными из config

			// Подготовим массив, в который будем складывать ссылки на эл-ты li
			// - А также "контент" для соотв.item: func и params
			var items = [];

			// Пробежимся по всем собственным свойствам config.content
			for(var key in config.content) {

				// Если это не собственное св-во, пропускаем
				if(!config.content.hasOwnProperty(key)) continue;

				// Создать элемент меню li
				var item = document.createElement('li');

				// Добавить элементу item текст key
				item.innerHTML = key;

				// Добавить item в menuitems
				menuitems.appendChild(item);

				// Добавим item в items
				items.push({
					item: item,
					content: {
						func: config.content[key].func,
						params: config.content[key].params
					}
				});

			}

	// 4. Назначить элементу menu id
	// - Он должен быть уникален в данном документе
	// - Он должен быть назначен по шаблону: 'clickmenu_' + [номер]
	var num = 0;
	var id = '';
	for(var i=0; i<1000; i){
		id = 'clickmenu_'+num;
		if(document.getElementById(id)) { num++; continue; }
		break;
	}
	menu.id = id;

	// 5. Назначим id всем элементам в items
	// - Они должны быть уникальны в данном документе
	// - Они должны быть назначены по шаблону: [id меню] + '_' + [индекс в items]
	for(var i=0; i<items.length; i++) {

		items[i].item.id = id + '_' + i;

	}

	// 6. Задать элементам меню css-стили

		// 6.1. Задаём стили menu
		menu.style.cssText = (function () {/*

			position: absolute;
			margin: 0; padding: 0;
			padding: 5px 0;
			width: 200px;
			z-index: 200000000000000000;
			cursor: default;

		*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];
		menu.style.top = config.coords.y + 'px';
		menu.style.left = config.coords.x + 'px';
		menu.style.backgroundColor = config.styles.bg;
		menu.style.border = config.styles.border;
		menu.style.fontSize = config.styles.fontsize;
		menu.style.boxShadow = config.styles.boxshadow;


		// 6.2. Задаём стили элементу menuitems
		menuitems.style.cssText = (function () {/*

			margin: 0; padding: 0;

		*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

		// 6.3. Задаём стили элементам items
		for(var i=0; i<items.length; i++) {

			items[i].item.style.cssText = (function () {/*

			display: block;
			margin: 0; padding: 0;
			padding: 0 15px;
			list-style-type: none;
			height: 25px;
			line-height: 25px;
			text-align: left;

		*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

		}

	// 7. Сделать элементам item подсветку при наведении (как hover в css)
	// - Цвет подсветки должен быть равен config.styles.hlbg
	for(var i=0; i<items.length; i++) {

		// 7.1. Подсвечивать элемент item при пересечении курсором границы внутрь
		addEvent(items[i].item, 'mouseover', function(event, params, handler){

			params.item.style.backgroundColor = params.color;

		}, {color: config.styles.hlbg, item: items[i].item});

		// 7.2. Убирать подсветк у item при пересечении курсором границы во вне
		addEvent(items[i].item, 'mouseout', function(event, params, handler){

			params.item.style.backgroundColor = '';

		}, {item: items[i].item});

	}

	// 8. Подготовить функцию, которая закрывает (удаляет) menu
	var removemenu = function(event, params, handler){

		// 1. Кроссбраузерно:
		// 	- Получить объект-событие с уже примененными IE FIX-ами
		// 	- Остановить всплытие события
		// 	- Отменить действия браузера "по умолчанию"

			// Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
			event = fixEvent(event);

			// Кроссбраузероно остановить всплытие события.
			event.stopPropagation ? event.stopPropagation() :
															(event.cancelBubble=true);


		// 2. Удалить menu (если есть)
		if(menu.parentNode) menu.parentNode.removeChild(menu);

		// 3. Удалить обработчик handler из Main.body
		removeEvent(document.body, 'click', handler);

	};

	// 9. Применить функцию removemenu в следующих случаях:
	// - 1) Щелчёк ПК мыши в любой части menu
	// - 2) Щелчёк ЛК мыши по любому элементу меню
	// - 3) Щелчёк ЛК мыши по любому месту вне меню
	// - 4) Щелчёк ПК мыши по любому месту вне меню
	// - 5) Щелчёк ЛК мыши по любому из элементов в targets

		// 1) Щелчёк ПК мыши в любой части menu
		addEvent(menu, 'contextmenu', removemenu, {menu: menu});

		// 2) Щелчёк ЛК мыши по любому элементу меню
		for(var i=0; i<items.length; i++) {
			addEvent(items[i].item, 'click', removemenu, {menu: menu});
		}

		// 3) Щелчёк ЛК мыши по любому месту вне меню
		addEvent(document.body, 'click', removemenu, {menu: menu});

		// 4) Щелчёк ПК мыши по любому месту вне меню
		addEvent(document.body, 'contextmenu', removemenu, {menu: menu});

		// 5) Щелчёк ЛК мыши по любому из элементов в targets
		for(var i=0; i<config.targets.length; i++) {
			addEvent(config.targets[i], 'click', removemenu, {menu: menu});
		}

	// 10. Сделать так, чтобы событие click не всплывало выше menu
	addEvent(menu, 'click', function(event, params, handler){

			// Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
			event = fixEvent(event);

			// Кроссбраузероно остановить всплытие события.
			event.stopPropagation ? event.stopPropagation() :
															(event.cancelBubble=true);

	}, {});

	// 11. Подготовим функционал элементов меню
	// - Каждому элементу меню назначим обработчик события 'click'
	// - В обработчике должна выполняться соотв. функция func из content
	// - В функцию должен передаваться соотв. объект с параметрами params
	for(var i=0; i<items.length; i++) {

		addEvent(items[i].item, 'click', function(event, params, handler){

			// 1. Остановим всплытие события

				// Кроссбраузерно получить объект-событие с уже примененными IE FIX-ами
				event = fixEvent(event);

				// Кроссбраузероно остановить всплытие события.
				event.stopPropagation ? event.stopPropagation() :
																(event.cancelBubble=true);

			// 2. Выполним item.func, передав ему объект с параметрами item.params
			params.item.content.func(params.item.content.params);

		}, {item: items[i], content: config.content});

	}

	// N. Добавить созданную структуру в Main.body
	document.body.appendChild(menu);

	// M. Вернуть id элемента menu
	return id;

}


/* urlRusLat //
//-----------//
// - Функция для транслитерации РУС -> ENG.

	Аргументы
		- str		| конфигурационный объект

	Возвращает
		- транслитерированную строку

-------------------------------------*/
function urlRusLat(str) {
	str = str.toLowerCase(); // все в нижний регистр
		var cyr2latChars = new Array(
				['а', 'a'], ['б', 'b'], ['в', 'v'], ['г', 'g'],
				['д', 'd'],  ['е', 'e'], ['ё', 'yo'], ['ж', 'zh'], ['з', 'z'],
				['и', 'i'], ['й', 'y'], ['к', 'k'], ['л', 'l'],
				['м', 'm'],  ['н', 'n'], ['о', 'o'], ['п', 'p'],  ['р', 'r'],
				['с', 's'], ['т', 't'], ['у', 'u'], ['ф', 'f'],
				['х', 'h'],  ['ц', 'c'], ['ч', 'ch'],['ш', 'sh'], ['щ', 'shch'],
				['ъ', ''],  ['ы', 'y'], ['ь', ''],  ['э', 'e'], ['ю', 'yu'], ['я', 'ya'],

				['А', 'A'], ['Б', 'B'],  ['В', 'V'], ['Г', 'G'],
				['Д', 'D'], ['Е', 'E'], ['Ё', 'YO'],  ['Ж', 'ZH'], ['З', 'Z'],
				['И', 'I'], ['Й', 'Y'],  ['К', 'K'], ['Л', 'L'],
				['М', 'M'], ['Н', 'N'], ['О', 'O'],  ['П', 'P'],  ['Р', 'R'],
				['С', 'S'], ['Т', 'T'],  ['У', 'U'], ['Ф', 'F'],
				['Х', 'H'], ['Ц', 'C'], ['Ч', 'CH'], ['Ш', 'SH'], ['Щ', 'SHCH'],
				['Ъ', ''],  ['Ы', 'Y'],
				['Ь', ''],
				['Э', 'E'],
				['Ю', 'YU'],
				['Я', 'YA'],

				['a', 'a'], ['b', 'b'], ['c', 'c'], ['d', 'd'], ['e', 'e'],
				['f', 'f'], ['g', 'g'], ['h', 'h'], ['i', 'i'], ['j', 'j'],
				['k', 'k'], ['l', 'l'], ['m', 'm'], ['n', 'n'], ['o', 'o'],
				['p', 'p'], ['q', 'q'], ['r', 'r'], ['s', 's'], ['t', 't'],
				['u', 'u'], ['v', 'v'], ['w', 'w'], ['x', 'x'], ['y', 'y'],
				['z', 'z'],

				['A', 'A'], ['B', 'B'], ['C', 'C'], ['D', 'D'],['E', 'E'],
				['F', 'F'],['G', 'G'],['H', 'H'],['I', 'I'],['J', 'J'],['K', 'K'],
				['L', 'L'], ['M', 'M'], ['N', 'N'], ['O', 'O'],['P', 'P'],
				['Q', 'Q'],['R', 'R'],['S', 'S'],['T', 'T'],['U', 'U'],['V', 'V'],
				['W', 'W'], ['X', 'X'], ['Y', 'Y'], ['Z', 'Z'],

				[' ', '_'],['0', '0'],['1', '1'],['2', '2'],['3', '3'],
				['4', '4'],['5', '5'],['6', '6'],['7', '7'],['8', '8'],['9', '9'],
				['-', '-']

    );

    var newStr = new String();

    for (var i = 0; i < str.length; i++) {

        ch = str.charAt(i);
        var newCh = '';

        for (var j = 0; j < cyr2latChars.length; j++) {
            if (ch == cyr2latChars[j][0]) {
                newCh = cyr2latChars[j][1];

            }
        }
        // Если найдено совпадение, то добавляется соответствие, если нет - пустая строка
        newStr += newCh;

    }
    // Удаляем повторяющие знаки - Именно на них заменяются пробелы.
    // Так же удаляем символы перевода строки, но это наверное уже лишнее
    return newStr.replace(/[_]{2,}/gim, '_').replace(/\n/gim, '');
}


/* tooltip //
//---------//
// - [Срабатывает при старте] Показывает подсказку для эл-в с польз.атрибутом data-tooltip, при наведении курсора на эл-т.

	Аргументы
		-

	Формат конфига
	{
		side: 		'',		| 	| с какой стороны показывать подсказку, 'auto' - выбрать автоматически, также возможны значения: 'left' / 'right' / 'top / 'bottom'
		width: 		'',		| 	| ширина окошка с подсказкой в px, если параметр пуст или отсутствует, то определяется по контенту
		html:			''		| 	| содержимое окошка с подсказкой в формате html
	}

	Пример использования

		 <div data-tooltip='{"side": "bottom", "width": "400", "html": "Некий HTML<br>2 строка"}'></div>

-------------------------------------*/
(function tooltip() {

	// А. Назначить функцию-обработчик собятия mouseover DOM-элементу Main.documentElement
	addEvent(document.body, 'mouseover', function(event, params) {

		// 1. Кроссбраузерно получить событие, и ссылку на target-элемент
		event = event || window.event;
		var target = 	event && event.target || event.srcElement;

		// 2. Проверить, содержит ли target польз. атрибут data-tooltip с непустым значением
		// - Если нет, завершить
		if(!target.getAttribute('data-tooltip')) return;

		// 3. Получить и проверить конфигурационный объект

			// 3.1. Получить
			var config = JSON.parse(target.getAttribute('data-tooltip'));

			// 3.2. Проверить side
			if(!config.side || (config.side!='left' && config.side!='right' && config.side!='top' && config.side!='bottom') ) config.side = 'bottom';

			// 3.3. Проверить width
			if(!config.width) config.width = '';

			// 3.4. Проверить html
			if(!config.html) config.html = 'Текст подсказки в формате HTML';

		// 4. Создать DOM-объект-подсказку, и добавить его в body
		// - Наделить его свойства значениями в соответствии с конфигом

			// 4.1. Создать DIV-элемент, который и будет служить подсказкой
			var div = document.createElement('div');

			// 4.2. Применить к div стандартные CSS-свойства
			div.style.cssText = (function () {/*

				position: absolute;
				padding: 5px 10px;
				border-radius: 5px;
				background-color: #444;
				font-size: 12px;
				color: #ddd;

				-webkit-box-shadow: 1px 1px 3px 0px rgba(0, 0, 0, 0.5);
				-moz-box-shadow:    1px 1px 3px 0px rgba(0, 0, 0, 0.5);
				box-shadow:         1px 1px 3px 0px rgba(0, 0, 0, 0.5);

			*/}).toString().match(/[^]*\/\*([^]*)\*\/\}$/)[1];

			// 4.3. Применить к div некоторые переданные в конфиге данные
			// - А также назначить ID

				// id
				div.id = 'tooltip2542354';

				// width
				if(config.width) div.style.width = config.width + 'px';

				// html
				div.innerHTML = config.html;

			// 4.4. Добавить div в body
			document.body.appendChild(div);

		// 5. Расположить div относительно target заданным образом

			// 5.1. Получить объект с внешними документными координатами и размерами div
			var div_metrics = getBoundingDocRect(div);

			// 5.2. Получить объект с внешними документными координатами и размерами target
			var target_metrics = getBoundingDocRect(target);

			// 5.3. Если config.side == 'left'
		 	// - Разместить подсказку слева посередине от target
			if(config.side == 'left') {

				// Если в окне есть вертикальная прокрутка
				if(hasYScrollbar()) {
					div.style.top = target_metrics.top + (target_metrics.height/2 - div_metrics.height/2) + 'px';
					div.style.left = target_metrics.left - div_metrics.width - 5 + 'px';
				}

				// Если в окне нет вертикальной прокрутки
				else {
					div.style.top = target_metrics.top + (target_metrics.height/2 - div_metrics.height/2) + 'px';
					div.style.left = target_metrics.left - div_metrics.width + 8 - 5 + 'px';
				}

			}

			// 5.4. Если config.side == 'right'
		 	// - Разместить подсказку справа посередине от target
			if(config.side == 'right') {

				// Если в окне есть вертикальная прокрутка
				if(hasYScrollbar()) {
					div.style.top = target_metrics.top + (target_metrics.height/2 - div_metrics.height/2) + 'px';
					div.style.left = target_metrics.left + target_metrics.width + 5 + 'px';
				}

				// Если в окне нет вертикальной прокрутки
				else {
					div.style.top = target_metrics.top + (target_metrics.height/2 - div_metrics.height/2) + 'px';
					div.style.left = target_metrics.left + target_metrics.width + 8 + 5 + 'px';
				}

			}

			// 5.5. Если config.side == 'top'
			// - Разместить подсказку сверху от target
			if(config.side == 'top') {

				// Если в окне есть вертикальная прокрутка
				if(hasYScrollbar()) {
					div.style.top = target_metrics.top - div_metrics.height - 5 + 'px';
					div.style.left = target_metrics.left + (target_metrics.width/2 - div_metrics.width/2) + 'px';
				}

				// Если в окне нет вертикальной прокрутки
				else {
					div.style.top = target_metrics.top - div_metrics.height - 5 + 'px';
					div.style.left = target_metrics.left + (target_metrics.width/2 - div_metrics.width/2) + 8 + 'px';
				}

			}

			if(config.side == 'bottom') {

				// Если в окне есть вертикальная прокрутка
				if(hasYScrollbar()) {
					div.style.top = target_metrics.top + target_metrics.height + 5 + 'px';
					div.style.left = target_metrics.left + (target_metrics.width/2 - div_metrics.width/2) + 'px';
				}

				// Если в окне нет вертикальной прокрутки
				else {
					div.style.top = target_metrics.top + target_metrics.height + 5 + 'px';
					div.style.left = target_metrics.left + (target_metrics.width/2 - div_metrics.width/2) + 8 + 'px';
				}

			}


	});

	// Б. Назначить функцию-обработчик собятия mouseout DOM-элементу Main.documentElement
	addEvent(document.body, 'mouseout', function(event, params) {

		// 1. Кроссбраузерно получить событие, и ссылку на target-элемент
		event = event || window.event;
		var target = 	event && event.target || event.srcElement;

		// 2. Удалить из DOM элемент div c ID='tooltip2542354'.
		var div = document.getElementById('tooltip2542354');
		if(div) div.parentNode.removeChild(div);

	});


})();


// hasYScrollbar //
//---------------//
// - Присутствует ли вертикальный скроллбар в окне браузера
function hasYScrollbar() {

  // The Modern solution
  //if (typeof window.innerWidth === 'number')
    //return window.innerWidth > Main.documentElement.clientWidth;

  // rootElem for quirksmode
  var rootElem = document.documentElement || document.body;

  // Check overflow style property on body for fauxscrollbars
  var overflowStyle;

  if (typeof rootElem.currentStyle !== 'undefined')
    overflowStyle = rootElem.currentStyle.overflow;

  overflowStyle = overflowStyle || window.getComputedStyle(rootElem, '').overflow;

    // Also need to check the Y axis overflow
  var overflowYStyle;

  if (typeof rootElem.currentStyle !== 'undefined')
    overflowYStyle = rootElem.currentStyle.overflowY;

  overflowYStyle = overflowYStyle || window.getComputedStyle(rootElem, '').overflowY;

  var contentOverflows = rootElem.scrollHeight > rootElem.clientHeight;
  var overflowShown    = /^(visible|auto)$/.test(overflowStyle) || /^(visible|auto)$/.test(overflowYStyle);
  var alwaysShowScroll = overflowStyle === 'scroll' || overflowYStyle === 'scroll';

  return (contentOverflows && overflowShown) || (alwaysShowScroll);

}


// getInpCursorPos //
//-----------------//
// - Получить позицию курсора в текстовом input в символах.
function getInpCursorPos(oField) {

  // Initialize
  var iCaretPos = 0;

  // IE Support
  if (document.selection) {

    // Set focus on the element
    oField.focus ();

    // To get cursor position, get empty selection range
    var oSel = document.selection.createRange ();

    // Move selection start to 0 position
    oSel.moveStart ('character', -oField.value.length);

    // The caret position is selection length
    iCaretPos = oSel.text.length;
  }

  // Firefox support
  else if (oField.selectionStart || oField.selectionStart == '0')
    iCaretPos = oField.selectionStart;

  // Return results
  return (iCaretPos);
}


// setInpCursorPos //
//-----------------//
// - Установить позицию курсора в текстовом input в символах.
function setInpCursorPos(input, pos, _this){

	if (input.setSelectionRange) {
		input.focus();
		input.setSelectionRange(pos, pos);
	}
	else if (input.createTextRange) {
		var range = input.createTextRange();
		range.collapse(true);
		range.moveEnd('character', pos);
		range.moveStart('character', pos);
		range.select();
	}

}


//-----------//
// > getChar //
//-----------//
// - Кроссбраузерно получить код символа из события keypress
function getChar(event) {
	if (event.which == null) {  // IE
		if (event.keyCode < 32) return null; // спец. символ
		return String.fromCharCode(event.keyCode)
	}

	if (event.which!=0 || event.charCode!=0) { // все кроме IE
		if (event.which < 32) return null; // спец. символ
		return String.fromCharCode(event.which); // остальные
	}

	return null; // спец. символ
}


//---------------//
// > cubicbezier //
//---------------//
// - Изменение значение по заданной кривой
function cubicbezier(x1, y1, x2, y2, epsilon){

	var curveX = function(t){
		var v = 1 - t;
		return 3 * v * v * t * x1 + 3 * v * t * t * x2 + t * t * t;
	};

	var curveY = function(t){
		var v = 1 - t;
		return 3 * v * v * t * y1 + 3 * v * t * t * y2 + t * t * t;
	};

	var derivativeCurveX = function(t){
		var v = 1 - t;
		return 3 * (2 * (t - 1) * t + v * v) * x1 + 3 * (- t * t * t + 2 * v * t) * x2;
	};

	return function(t){

		var x = t, t0, t1, t2, x2, d2, i;

		// First try a few iterations of Newton's method -- normally very fast.
		for (t2 = x, i = 0; i < 8; i++){
			x2 = curveX(t2) - x;
			if (Math.abs(x2) < epsilon) return curveY(t2);
			d2 = derivativeCurveX(t2);
			if (Math.abs(d2) < 1e-6) break;
			t2 = t2 - x2 / d2;
		}

		t0 = 0, t1 = 1, t2 = x;

		if (t2 < t0) return curveY(t0);
		if (t2 > t1) return curveY(t1);

		// Fallback to the bisection method for reliability.
		while (t0 < t1){
			x2 = curveX(t2);
			if (Math.abs(x2 - x) < epsilon) return curveY(t2);
			if (x > x2) t0 = t2;
			else t1 = t2;
			t2 = (t1 - t0) * .5 + t0;
		}

		// Failure
		return curveY(t2);

	};

}


//-------------------//
// > smoothscrollyTo //
//-------------------//
// - Плавно изменить прокрутку окна по координате Y к значению y
function smoothscrollyTo(y, dur, callback) {

	// 1] Подготовка
	var duration = dur/10 || 30; 											// длительность анимации в миллисекундах.
	var epsilon = (1000 / 60 / duration*10) / 4;		// epsilon determines the precision of the solved values
	var easeInOutCubic = cubicbezier(0.645, 0.045, 0.355, 1, epsilon);

	// 2] Подготовить переменную с текущим значением по времени (м.б. от 0 до 1)
	var tCurrent = 0;

	// 3] Получить текущее значение прокрутки по оси Y
	var scrollYstart = window.pageYOffset;

	// 4] Определить направление прокрутки: 0-вверх, 1-вниз.
	var direction = (y - scrollYstart) < 0 ? 0 : 1;

	// 5] Переменная для сохранения предыдущего yCurrent
	var yCurrentPrev = window.pageYOffset;

	// 6] Осуществление прокрутки
	// - Выполнять эту функцию каждые 2 мс
	var id = setTimeout(function run() {

		// 6.1] Отменить предыдущий setTimeout
		clearTimeout(id);

		// 6.2] Рассчитать положение на кривой
		tCurrent = tCurrent + 1/duration;

		// 6.3] Рассчитать позицию Y, куда надо прокрутить на этой итерации
		var yCurrent = scrollYstart + (+y - +scrollYstart)*easeInOutCubic(tCurrent);

		// 6.4] Осуществить прокрутку
		// - Если yCurrent > yCurrentPrev и direction == 1, или...
		// - Если yCurrent < yCurrentPrev и direction == 0, или...
		if((yCurrent > yCurrentPrev && direction == 1) || (yCurrent < yCurrentPrev && direction == 0)) {

			// 6.4.1] Осуществить скролл
			window.scrollTo(window.scrollX, yCurrent);

			// 6.4.2] Записать yCurrentPrev
			yCurrentPrev = yCurrent;

		}

		// 6.5] Подготовить следующую итерацию
		// - Если tCurrent < 1
		if(tCurrent < 1)
			id = setTimeout(run, 1/duration*1000);

		// 6.6] В конце исполнить callback
		else {
			if(callback) callback();
		}

	}, 1/duration*1000);

}


//-----------//
// > hereDoc //
//-----------//
// - Для создания многострочных строковых литералов
// - Пример:
//
// 		var str = hereDoc(function() {/*!
// 			<div style="display: none;" class="tabs" data-bind="if: (m.s1.item().cat.breadcrumbs()[0].alias() == 'pizza'), visible: (m.s1.item().cat.breadcrumbs()[0].alias() == 'pizza')">
// 				<string>Тесто</string>
// 				<!-- ko foreach: m.s1.item().dough.variants -->
// 					<a href="#" data-bind="text: name" data-bind="css: {active: $component.m.s1.item().dough.choosen() == $data}, click: function(){}></a>
// 				<!-- /ko -->
// 			</div>
// 		*/});
// 		console.log(str);
//
//
function hereDoc(f) {
  return f.toString().
      replace(/^[^\/]+\/\*!?/, '').
      replace(/\*\/[^\/]+$/, '');
}


