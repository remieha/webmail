<div class="col-md-1"></div>
<div class="col-md-10">
<div id="formWriteEmail">
	<form class="form-horizontal">
		<h3 class="blue form-signin-heading">Write your message...</h3>

<!-- 		<div class="form-group">
			<label for="sender">Sender (later : logged-in user is sender) :</label>
				<select size="1" name="sender" id="sender">
					<option ng-repeat="u in users" ng-model="msg.sender.id" value="{{u.id}}">{{u.id}} {{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}})</option>
				</select> 
		</div> -->
		
		<div class="form-group">
			<label for="recipient">Send to :</label>
				<select size="1" name="recipient" id="recipient">
					<option type="checkbox" ng-repeat="u in users" value="{{u.id}}" ng-model="msg.recipients">{{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}})</option>
				</select> 
		</div>
		<div class="form-group">
			<label for="mailSubject">Subject :</label>
				<input type="text" id="mailSubject" name="mailSubject" class="form-control"autofocus ng-model="msg.subject">
		</div>

		<div class="form-group">
		<!-- <input ng-model="msg.text"> -->
			<span id="mailEdit" name="mailEdit" richtext model="msg.text" class="textedit show form-control"></span>
		</div>
		
		<div class="form-group">
			<button class="btn btn-primary" type="button" id="sendMailBtn" ng-click="sendMail(u.id)">Send</button>
			<button class="btn btn-primary" type="reset" id="resetMailBody">Clear all</button>
			<button class="btn btn-primary" type="button" id="cancelMail" ng-click="cancelMail()">Cancel</button>
		</div>	

	</form>
</div>
</div>
<div class="col-md-1"></div>