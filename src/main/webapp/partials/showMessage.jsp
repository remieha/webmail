<div class="col-sm-3"></div>
<div class="col-sm-6">
<div class="panel panel-default">
	<div class="panel-heading">
		<h4><b>{{showmsg.subject}}</b></h4>
		<button class="btn btn-primary btn-xs pull-right" type="button" ng-click="reply(showmsg.sender.id)">Reply</button>
		<h5><b>From : </b><i>{{showmsg.sender.firstName}} {{showmsg.sender.lastName | uppercase}} ({{showmsg.sender.mail}})</i></h5>
		<h6>{{showmsg.date | date: "MM/dd/yyyy' at 'HH:mm:ss"}}</h6>
	</div>
	<div class="panel-body">
		<table>
			<thead>
				<tr>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr><b>To :</b></tr>
				<tr ng-repeat="r in showmsg.recipients">
					<td>
						<i>&nbsp;{{r.firstName}} {{r.lastName | uppercase}} ({{r.mail}})</i>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td ng-bind-html="showmsg.text"></td></tr>
			</tbody>
		
		</table>
	</div>
</div>
</div>
<div class="col-sm-3"></div>		    