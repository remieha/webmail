<div ng-show="isSomeoneIn">
<h3>Your have <span class="badge" ng-bind="inmessages.length"></span> mails in your inbox :</h3>
Filter by : <input type="text" ng-model="filterType">
<table class="table table-hover">
	<thead>
		<tr>
			<th>From<span class="glyphicon glyphicon-sort-by-alphabet" type="button" ng-click="clickOrder ='sender'"></span></th>
			<th>Date<span class="glyphicon glyphicon-sort-by-order" type="button" ng-click="clickOrder ='date'"></span></th>
			<th>Subject</th>
			<th>To</th>
			<th></th>
		</tr>
	</thead>
	<tbody>

		<tr ng-repeat="m in inmessages | orderBy: clickOrder | filter : filterType">
			<td>{{m.sender.lastName | uppercase}} {{m.sender.firstName}}</td>
			<td>{{m.date | date: "MM/dd/yyyy' at 'HH:mm:ss"}}</td>
			<td>{{m.subject}}</td>
			<td><span ng-repeat="r in m.recipients">{{r.lastName | uppercase}} {{r.firstName}}<br></span></td>
			<td>
				<button class="btn btn-primary btn-xs" type="button" ng-click="openMsg(m.id)"><span class="glyphicon glyphicon-eye-open"></span> Open</button>
				<button class="btn btn-danger btn-xs" type="button" ng-click="deleteMsg(m.id)"><span class="glyphicon glyphicon-remove"></span> Delete</button>			
			</td>
		</tr>

	</tbody>
</table>
</div>