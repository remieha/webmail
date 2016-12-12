<!-- <div class="col-sm-2"></div>
<div class="col-sm-8"> -->
<h3>Displaying the users list <span class="badge" ng-bind="users.length"></span> :</h3>
Filter by : <input type="text" ng-model="filterType">
<table class="table table-hover">
	<thead>
		<tr>
			<th>ID <span class="glyphicon glyphicon-sort-by-order" type="button" ng-click="clickOrder ='id'"></span></th>
			<th>Image</th>
			<th>First Name <span class="glyphicon glyphicon-sort-by-alphabet" type="button" ng-click="clickOrder ='firstName'"></span></th>
			<th>Last Name <span class="glyphicon glyphicon-sort-by-alphabet" type="button" ng-click="clickOrder ='lastName'"></span></th>
			<th>Email Address <span class="glyphicon glyphicon-sort-by-alphabet" type="button" ng-click="clickOrder ='mail'"></span></th>
			<th></th>
		</tr>
	</thead>
	<tbody>

		<tr ng-repeat="u in users | orderBy: clickOrder | filter : filterType">
			<td>{{u.id}}</td>
			<td><img src="{{u.photoBase64}}" width="50px" height="50px" /></td>
			<td>{{u.firstName}}</td>
			<td>{{u.lastName | uppercase}}</td>
			<td>{{u.mail}}</td>
			<td>
				<button class="btn btn-warning btn-xs" type="button" ng-click="replyMail(u.id)"><span class="glyphicon glyphicon-pencil"></span> Write mail</button>
				<button class="btn btn-warning btn-xs" type="button" ng-click=""><span class="glyphicon glyphicon-comment"></span> Write chat</button>			
			</td>
		</tr>

	</tbody>
</table>
<!-- </div>
<div class="col-sm-2"></div> -->
