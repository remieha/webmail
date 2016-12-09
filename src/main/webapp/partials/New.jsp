<div class="col-md-1"></div>
<div class="col-md-10">
<div id="formWriteEmail">
	<form class="form-horizontal">
		<h3 class="blue form-signin-heading">Write your message...</h3>

 		<div class="form-group" ng-init="msg.sender.id=loggedIn.id"></div>
 		
 	    <div class="multiselect form-group">
        	<div class="selectBox" ng-click="showCheckboxes()">
            	<select>
                	<option>Send to</option>            		
                	
            	</select>    	
            	<div class="overSelect"></div>
        	</div>
       		<div id="checkboxes">
  					<span ng-repeat="u in users">
  						<input name="recipient" id="recipient"  type="checkbox" ng-model="users[$index].checked" ng-checked="users[$index].checked">
  							{{u.firstName}} {{u.lastName | uppercase}} ({{u.mail}}) 
  							<span class="btn btn-primary btn-xs pull-right" ng-show="u==users[users.length-1]" ng-click="hideCheckboxes()">OK</span>
  							<br>
  					</span>
        	</div>
    	</div>		
		<div class="form-group">
			<label for="mailSubject">Subject :</label>
				<input type="text" id="mailSubject" name="mailSubject" class="form-control" ng-model="msg.subject">
		</div>

		<div class="form-group">
			<span id="mailEdit" name="mailEdit" richtext model="msg.text" class="textedit show form-control"></span>
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