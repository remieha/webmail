var urlUser = 'http://localhost:8080/webmail/app/rest/users/';

var addUser = function(s, h){
	h.post(urlUser, s.u).then(function(){
		//init_ag(s, h);		
		console.log('User added');
	});
};