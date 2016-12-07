<h3>Your have <span class="badge" ng-bind="messages.length"></span> mails in your inbox :</h3>
Filter by : <input type="text" ng-model="filterType">
<table class="table table-hover">
	<thead>
		<tr>
			<th>From<span class="glyphicon glyphicon-sort-by-alphabet" type="button" ng-click="clickOrder ='sender'"></span></th>
			<th>Date<span class="glyphicon glyphicon-sort-by-order" type="button" ng-click="clickOrder ='date'"></span></th>
			<th>Subject</th>
			<th>Body</th>
			<th></th>
		</tr>
	</thead>
	<tbody>

		<tr ng-repeat="m in messages | orderBy: clickOrder | filter : filterType">
			<td>{{m.sender.lastName | uppercase}} {{m.sender.firstName}}</td>
			<td>{{m.date | date: "MM/dd/yyyy' at 'HH:mm:ss"}}</td>
			<td>{{m.subject}}</td>
			<td>{{m.text}}</td>
			<td>
				<button class="btn btn-primary btn-xs" type="button" ng-click=""><span class="glyphicon glyphicon-eye-open"></span> Open</button>
				<button class="btn btn-danger btn-xs glyphicon glyphicon-remove" type="button" ng-click=""></button>			
			</td>
		</tr>

	</tbody>
</table>