var urlMsg = 'http://localhost:8080/webmail/app/rest/messages/';

var initMsg = function(s, h){
	h.get(urlMsg).then(function(resp){
		s.messages = resp.data;
		s.m = {};
	});
};

var addMail = function(s, h, r){	
	h.post(urlMsg+"sendMail", s.msg).then(function(){
		getSent(h, s, r);
		s.msg = {};
		console.log('Mail sent');
	});	
};

var getInbox = function(h, s, r){
	if(r.isSomeoneIn == true){
		var user = r.loggedIn;
		var id = user.id;
		h.get(urlMsg+id+"/inbox").then(function(resp){
			s.inmessages = resp.data;
		});
	} else {
		//console.log('No one is logged in');
	}
}

var getSent = function(h, s, r){
	if(r.isSomeoneIn == true){
		var user = r.loggedIn;
		var id = user.id;
		h.get(urlMsg+id+"/sent").then(function(resp){
			s.sentmessages = resp.data;
			//console.log(user.firstName+' is logged in');
		});
	} else {
		//console.log('No one is logged in');
	}
}

var viewMsg = function(h, s, id){
	h.get(urlMsg+id).then(function(resp){
		s.showmsg = resp.data;
	});
}

var removeMsg = function(h, s, r, id){
	h.delete(urlMsg+id).then(function(resp){
		getSent(h, s, r);
		getInbox(h, s, r);
	});
}

var filterRecipients = function(list) {
	var filtered = [];
	list.forEach(function(item){
		if(item.checked) {
			filtered.push(item);
		}
	});
	return filtered;
}



