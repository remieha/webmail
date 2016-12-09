<div class="col-md-3"></div>
<div class="col-md-6">
	<div id="formCreateUser">
		<form class="form-horizontal">
			<h3 class="blue form-signin-heading">Registration form</h3>

		<div class="form-group">
			<label for="inputFName" class="sr-only">First Name</label>
				<input type="text" id="inputFName" name="firstName" class="form-control" placeholder="First Name" required autofocus ng-model="user.firstName">
		</div>
		<div class="form-group">
			<label for="inputLName" class="sr-only">Last Name</label>
				<input type="text" id="inputLName" name="lastName" class="form-control" placeholder="Last Name" required ng-model="user.lastName">
		</div>
		<div class="form-group">
			<label for="inputRegisterEmail" class="sr-only">Email address</label>
				<input type="email" id="inputRegisterEmail" name="inputRegisterEmail" name="mail" class="form-control" placeholder="Email address" required ng-model="user.mail">
		</div>
		<div class="form-group">
			<label for="inputRegisterPassword" class="sr-only">Password</label>
				<input type="password" id="inputRegisterPassword" name="password" class="form-control"	placeholder="Password" required ng-model="user.password">
		</div>
		<div class="form-group">
			<label class="btn btn-primary" for="file">
				<input type="file" style="display: none;" onchange="$('#upload-file-info').html($(this).val());"
					ng-model="user.photo" ng-click="uploadPhoto()" id="file" name="file">
					Upload Photo
					<span class='label label-primary' id="upload-file-info"></span>
			</label>
		</div>
		<div class="form-group">
			<button class="btn btn-primary" type="button" id="addUserBtn" ng-click="addUser()">Register user</button>
			<button class="btn btn-primary" type="reset" id="resetFormCreateUser">Reset form</button>
			<button class="btn btn-primary" type="button" id="cancelCreateUser" ng-click="cancelRegistration()">Cancel registration</button>
		</div>			
		</form>
	</div>
</div>
<div class="col-md-3"></div>

	