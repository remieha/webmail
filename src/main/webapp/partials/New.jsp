<div class="col-md-1"></div>
<div class="col-md-10">
<div id="formWriteEmail">
	<form class="form-horizontal">
		<h3 class="blue form-signin-heading">Write your message...</h3>

		<div class="form-group">
			<label for="recipient">Sender (later : logged-in user is sender) :</label>
				<select size="1" name="sender" id="sender">
					<option ng-repeat="u in users" value="{{u.mail}}" ng-model="msg.sender">{{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}})</option>
				</select> 
		</div>
		
		<div class="form-group">
			<label for="recipient">Send to :</label>
				<select size="1" name="recipient" id="recipient">
					<option ng-repeat="u in users" value="{{u.mail}}">{{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}})</option>
				</select> 
		</div>
		<div class="form-group">
			<label for="mailSubject">Send to :</label>
				<input type="text" id="mailSubject" name="mailSubject" class="form-control"autofocus ng-model="msg.subject">
		</div>

		<div class="form-group">
			<span id="mailEdit" name="mailEdit" richtext model="value" class="textedit show form-control" ng-model="msg.text"></span>
		</div>
		
		<div class="form-group">
			<button class="btn btn-primary" type="button" id="sendMailBtn" ng-click="sendMail()">Send</button>
			<button class="btn btn-primary" type="reset" id="resetMailBody">Clear all</button>
			<button class="btn btn-primary" type="button" id="cancelMail" ng-click="cancelMail()">Cancel</button>
		</div>	

	</form>
</div>
</div>
<div class="col-md-1"></div>