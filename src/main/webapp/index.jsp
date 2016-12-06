<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Welcome to Webmail</title>

<meta charset="ISO-8859-1">
<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="icon" href="icon.ico">
<link rel = "stylesheet" type = "text/css" href = "css/Style.css" />
<link rel="icon" href="envelope.ico">
</head>

<!-- <body ng-app="avgrApp" ng-controller="appCtrl"> -->

<body ng-app="mailApp" ng-controller="appCtrl">
	<div class="jumbotron"></div>
	<div class="container">
		<div class="row">
						<div>
				<nav class="navbar navbar-default">
					<div class="container-fluid">
					    <div class="navbar-header">
						      <a class="navbar-brand" href="#Home"><span class="glyphicon glyphicon-home"></span> Home</a>
    					</div>
						<ul class="nav navbar-nav">
							<li><a href="#New"><span class="glyphicon glyphicon-plus"></span> New Message</a></li>
							<li><a href="#Inbox"><span class="glyphicon glyphicon-inbox"></span> Inbox</a></li>
							<li><a href="#Sent"><span class="glyphicon glyphicon-share-alt"></span> Sent</a></li>
						</ul>
					</div>
				</nav>

				<div ng-view></div>

			</div>
		</div>
	
	</div>

 	<script src="appCtrl.js"></script>
	<script src="userFunc.js"></script>
 	<script src="msgFunc.js"></script>

</body>
</html>