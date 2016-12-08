var urlMsg = 'http://localhost:8080/webmail/app/rest/messages/';

var initMsg = function(s, h){
	h.get(urlMsg).then(function(resp){
		s.messages = resp.data;
		s.m = {};
	});
};

var addMail = function(s, h, r, senId, rec){	
	h.post(urlMsg+"sendMail", s.msg).then(function(){
		initMsg(s, h);		
		console.log('Mail sent');
	});	
};

var getSent = function(h, s, r){
	if(r.isSomeoneIn == true){
		var user = r.loggedIn;
		var id = user.id;
		h.get(urlMsg+id+"/sent").then(function(resp){
			s.sentmessages = resp.data;
		});
	} else {
		console.log('No one is logged in');
	}


}

//var getAvenger = function(id, s, h, r){
//	cancelUpdForm(r);
//	//cancelAddForm();
//	h.get(url_av+id).then(function(resp){
//		s.av = resp.data;
//		r.showavenger=true;
//	});
//};