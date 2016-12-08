<h3>Your have <span class="badge" ng-bind="sentmessages.length"></span> sent mails :</h3>
Filter by : <input type="text" ng-model="filterType">
<table class="table table-hover">
	<thead>
		<tr>
			<th>To</th>
			<th>Date<span class="glyphicon glyphicon-sort-by-order" type="button" ng-click="clickOrder ='date'"></span></th>
			<th>Subject</th>
			<th>Body</th>
			<th></th>
		</tr>
	</thead>
	<tbody>

		<tr ng-repeat="m in sentmessages | orderBy: clickOrder | filter : filterType">
			<td><span ng-repeat="r in m.recipients">{{r.mail}}<br></span></td>
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