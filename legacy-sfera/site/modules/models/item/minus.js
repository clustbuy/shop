
self.minus = function(data, event){
	if(self.item().amount() == 1) return;
	self.item().amount(self.item().amount() - 1);
};
