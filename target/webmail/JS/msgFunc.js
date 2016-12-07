var urlMsg = 'http://localhost:8080/webmail/app/rest/messages/';

var initMsg = function(s, h){
	h.get(urlMsg).then(function(resp){
		s.messages = resp.data;
		s.m = {};
	});
};

var addMail = function(s, h, id){
	console.log('msg id, subject, body, sender ID = '+s.msg.id+" "+s.msg.subject+" "+s.msg.text+" "+s.msg.sender);
	h.post(urlMsg+id, s.msg).then(function(){
		initMsg(s, h);		
		console.log('Mail sent');
	});
};

//var getAvenger = function(id, s, h, r){
//	cancelUpdForm(r);
//	//cancelAddForm();
//	h.get(url_av+id).then(function(resp){
//		s.av = resp.data;
//		r.showavenger=true;
//	});
//};