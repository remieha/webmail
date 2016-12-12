var urlUser = 'http://localhost:8080/webmail/app/rest/users/';

var initUser = function(s, h){
	h.get(urlUser).then(function(resp){
		s.users = resp.data;
	});
};

var getUser = function(s, h, id){
	h.get(urlUser+id).then(function(resp){
		s.replyto = resp.data;
	});
};

var addForm = function(s, h){
	h.post(urlUser, s.user).then(function(){
		initUser(s, h);		
		console.log('User added');
	});
};

var checkVal = function(s, h){
	var emailExists = false;
	if(s.email.checkValidity() && email.value.trim()!='' && emailExists==false){
		console.log('email is valid');
	} else {
		console.log('email is invalid, try another value');
	}
};

var	authenticate = function(s, h, r, w, m, p){
	h.post(urlUser+'login', s.user).then(function(resp){
		if(resp.data == ""){
			r.isSomeoneIn = false;
			alert("Error in authentication, try again!");
		} else {
			r.loggedIn = resp.data;
			r.isSomeoneIn = true;
			console.log(r.loggedIn.firstName+' is logged in');
			getSent(h, s, r);
			getInbox(h, s, r);
			w.location.href = '#Inbox';
		}
	});
};

var logout = function(s, h, r){
	r.loggedIn = {};
	r.isSomeoneIn = false;
	s.user = {};
	s.msg = {};
	s.msg.recipients = [];
	s.inputCounter = 0;
	s.sender = {};
	s.recipients = {};
	s.inmessages = {};
	s.sentmessages = {};
	s.filterType = [];
	s.recipientReplyId = {};
};


var addPhoto = function(s, h){
	console.log('upload clicked');
	var formData = new FormData();
	formData.append('file', document.getElementById('file').files[0]);

	var req = {
			method: 'POST',
			url: urlUser+'uploadPhoto',
			headers: {'Content-Type': undefined},
			data: formData			
	};
//
//	h(req).then(function(resp){
//		s.user=resp.data;
//		//console.log(resp.data);
//	});
};