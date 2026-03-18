<script>
	var searchModel = {
		constructor: function() {
			var self = this;

			self.cur_cat_guid = ko.observable('');
			self.cur_cat_name = ko.observable('Везде');

			self.set_cur_cat = function(guid, name) {
				self.cur_cat_guid(guid);
				self.cur_cat_name(name);
			};

			self.set_def_cat = function() {
				self.cur_cat_guid('');
				self.cur_cat_name('Везде');
			}

			return self;
		}
	};

	var model_search = Object.create(searchModel).constructor();

	$(document).ready(function() {
		if($('#search-input')[0]) ko.applyBindings(model_search, $('#search-input')[0]);
		if($('#search-modal')[0]) ko.applyBindings(model_search, $('#search-modal')[0]);

		var strGETCat = window.location.search.replace( '?', '').split('&')[0].split('=')[1];

		if (strGETCat !== undefined && strGETCat !== '') {
			model_search.cur_cat_guid(strGETCat);
			let curEl = $(`.search-modal [data-guid="${strGETCat}"]`)[0];
			model_search.cur_cat_name($(curEl).data('name'));
		}
	});
	
</script>