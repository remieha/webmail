<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Welcome to Webmail</title>

<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="assets/jquery-te-1.4.0.css">
<script type="text/javascript" src="assets/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="assets/jquery-te-1.4.0.min.js" charset="utf-8"></script>
<script src="assets/angular.min.js"></script>
<script src="assets/angular-sanitize.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link rel="icon" href="icon.ico">
<link rel = "stylesheet" type = "text/css" href = "css/Style.css" />
<link rel="icon" href="envelope.ico">
</head>

<body ng-app="mailApp" ng-controller="appCtrl">
	<div class="jumbotron">
		<h1 ng-show="isSomeoneIn">Connected to {{loggedIn.firstName}}'s webmail</h1>
		<h1 ng-show="!isSomeoneIn">Welcome to the webmail application</h1>
	</div>
	<div class="container">
		<div class="row">
<%-- 					    <c:choose>
    						<c:when test="${loggedIn == null}">
       							<h1>No one is logged in</h1>
    						</c:when>
    						<c:otherwise>
       							<h1>{{loggedIn.firstName}} is logged in</h1>
    						</c:otherwise>
						</c:choose> --%>
			<div>
				<nav class="navbar navbar-default">
					<div class="container-fluid">
					    <div class="navbar-header">   	
						      <a class="navbar-brand" href="#Home"><span class="glyphicon glyphicon-home"></span> Home</a>
    					</div>
						<ul class="nav navbar-nav" ng-show="isSomeoneIn">
							<li><a href="#New"><span class="glyphicon glyphicon-pencil"></span> New Message</a></li>
							<li><a href="#Inbox"><span class="glyphicon glyphicon-inbox"></span> Inbox</a></li>
							<li><a href="#Sent"><span class="glyphicon glyphicon-share-alt"></span> Sent</a></li>
							<li><a href="#UserProfile"><span class="glyphicon glyphicon-user"></span> Your Profile</a></li>
							<li><a href="#UsersList"><span class="glyphicon glyphicon-list-alt"></span> Users List</a></li>
						</ul>
					</div>
				</nav>

				<div ng-view></div>

			</div>
		</div>
	
	</div>

 	<script src="JS/appCtrl.js"></script>
	<script src="JS/userFunc.js"></script>
 	<script src="JS/msgFunc.js"></script>
 	<script src="directives/rich-editor.js"></script>

</body>
</html>