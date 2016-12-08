<div class="col-md-1"></div>
<div class="col-md-10">
<div id="formWriteEmail">
	<form class="form-horizontal">
		<h3 class="blue form-signin-heading">Write your message...</h3>

 		<div class="form-group">
			<label for="sender">Sender (later : logged-in user is sender) :</label>
				<input type="text" name="sender" id="sender" class="form-control" ng-model="msg.sender.id">
<!-- 				<select size="1" name="sender" id="sender">
					<option ng-repeat="u in users" ng-model="msg.sender" value="{{u.id}}">{{u.id}} {{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}})</option>
				</select>  -->
		</div>
		
<!-- 		<div class="form-group">
			<label for="recipient">Send to : </label><br>
				<div class="checkbox form-group">		
  					<span ng-repeat="u in users" ng-model="msg.recipients">
  						<input name="recipient" id="recipient"  type="checkbox" value={{u.id}} >
  							{{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}}) <br>
  					</span>
  				</div>	
		</div> -->
		
		<div class="form-group">
			<label for="recipient">Send to : </label>
		    <div add-input>
        		<button>Click to Add</button>
    		</div>
		</div>
		
		<div class="form-group">
			<label for="mailSubject">Subject :</label>
				<input type="text" id="mailSubject" name="mailSubject" class="form-control"autofocus ng-model="msg.subject">
		</div>

		<div class="form-group">
			<span id="mailEdit" name="mailEdit" richtext model="msg.text" class="textedit show form-control"></span>
		</div>
		
		<div class="form-group">
			<button class="btn btn-primary" type="button" id="sendMailBtn" ng-click="sendMail(msg.sender.id, msg.recipients)">Send</button>
			<button class="btn btn-primary" type="reset" id="resetMailBody">Clear all</button>
			<button class="btn btn-primary" type="button" id="cancelMail" ng-click="cancelMail()">Cancel</button>
		</div>	

	</form>
</div>
</div>
<div class="col-md-1"></div>