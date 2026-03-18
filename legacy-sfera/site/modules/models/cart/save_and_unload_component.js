
self.save_and_unload_component = function(config){

	var element = $(config.class_target);
	var inner = $(config.class_target + ' ' + config.class_inside_target);

	ko.cleanNode(element[0]);

	inner.html('');

};
