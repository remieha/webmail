var urlUser = 'http://localhost:8080/webmail/app/rest/users/';

var initUser = function(s, h){
	h.get(urlUser).then(function(resp){
		s.users = resp.data;
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
			getSent(h, s, r);
			//console.log(r.loggedIn);
			w.location.href = '#Sent';
		}
	});
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