<div class="row">
	<div>
		<h3 class="blue"> <p>Welcome to your Webmail application!</p>
		<p>Today's date : <span my-current-time="format='MM/dd/yyyy - HH:mm:ss'"></span></p></h3>
	</div>
	<div class="col-md-4"></div>
	<div class="col-md-4">
	

		<form class="form-signin">
			<h4 class="blue form-signin-heading">Registered user : Please sign in</h4>
			<div class="inner-addon form-group" id="divCheck">
				<label for="inputEmail" class="sr-only">Email address</label> 
					<input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required autofocus ng-model="user.mail"><!-- <i id="emailValid"></i> -->
			</div>
			<div class="form-group">
			<label for="inputPassword" class="sr-only">Password</label> 
				<input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required ng-model="user.password">
			</div>
			<div class="form-group">
			<button class="btn btn-lg btn-primary btn-block" type="button" name="submitBtn" id="submitBtn" ng-click="login(user.mail, user.password)">Sign	in</button>
			</div>
		</form>
		<h4 class="blue" ng-show="!isSomeoneIn"><a href="#Register">New user : Please register</a></h4>
		<h4 class="blue" ng-show="isSomeoneIn" ng-click="logout()"><a href="#Home">Log out</a></h4>
		

	</div>
	<div class="col-md-4"></div>
</div>
<!-- 
<script>
var email = document.getElementById('inputEmail');
var submit = document.getElementById('submitBtn');
var divcheck = document.getElementById('divCheck');

email.onchange = function(){
	if(email.checkValidity() && email.value.trim()!=''){
		divcheck.className = "has-success inner-addon form-group";
	} else {
		divcheck.className = "has-error inner-addon form-group";
	}
			
}
</script> -->
