var urlMsg = 'http://localhost:8080/webmail/app/rest/messages/';

var initMsg = function(s, h){
	h.get(urlMsg).then(function(resp){
		s.messages = resp.data;
	});
};

var addMail = function(s, h){
	h.post(urlMsg, s.msg).then(function(){
		initMsg(s, h);		
		console.log('Mail sent');
	});
};