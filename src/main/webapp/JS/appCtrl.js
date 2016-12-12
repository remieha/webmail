var app = angular.module("mailApp", ['ngRoute', 'ngSanitize']);

app.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "partials/Home.jsp"
    })
    .when("/Home", {
        templateUrl : "partials/Home.jsp"
    })
    .when("/New", {
        templateUrl : "partials/New.jsp"
    })
    .when("/Inbox", {
        templateUrl : "partials/Inbox.jsp"
    })
    .when("/Sent", {
    	templateUrl : "partials/Sent.jsp"
    })
    .when("/Register", {
    	templateUrl : "partials/Register.jsp"
    })
    .when("/UsersList", {
    	templateUrl : "partials/UsersList.jsp"
    })
    .when("/UserProfile", {
    	templateUrl : "partials/UserProfile.jsp"
    })
    .when("/showMessage", {
    	templateUrl : "partials/showMessage.jsp"
    })
    .otherwise({
    	templateUrl : "partials/Home.jsp"
    });
});

app.directive('myCurrentTime', ['$interval', 'dateFilter',
    function($interval, dateFilter) {
    // return the directive link function. (compile function not needed)
    return function(scope, element, attrs) {
      var format,  // date format
          stopTime; // so that we can cancel the time updates

      // used to update the UI
      function updateTime() {
        element.text(dateFilter(new Date(), format));
      }

      // watch the expression, and update the UI on change.
      scope.$watch(attrs.myCurrentTime, function(value) {
        format = value;
        updateTime();
      });

      stopTime = $interval(updateTime, 1000);

      // listen on DOM destroy (removal) event, and cancel the next UI update
      // to prevent updating time after the DOM element was removed.
      element.on('$destroy', function() {
        $interval.cancel(stopTime);
      });
    }
}]);

////Temporary way to add recipients. 
//app.directive('addInput', ['$compile', function ($compile) {
//	return {
//		restrict: 'A',
//        link: function (scope, element, attrs) {
//            element.find('button').bind('click', function () {
//                var input = angular.element('<div><input type="text" ng-model="msg.recipients[' + scope.inputCounter + '].id" ng-bind="recipientIfReply"></div>');
//                var compile = $compile(input)(scope);
//                element.append(input);
//                scope.inputCounter++;
//            });
//        }
//    }
//}]);

var ctrl = app.controller("appCtrl", function($scope, $http, $rootScope, $window) {
	$scope.user = {};
	$rootScope.loggedIn = {};
	$scope.msg = {};
	$scope.date = new Date($.now());
	$scope.msg.recipients = [];
	$scope.inputCounter = 0;
	$scope.sender = {};
	$scope.recipients = {};
	$rootScope.isSomeoneIn = false;
	$scope.filterType = [];
	$scope.recipientReplyId = {};
	// add new initializations in logout()
		
	initUser($scope, $http);
	initMsg($scope, $http);

	getSent($http, $scope, $rootScope);
	getInbox($http, $scope, $rootScope);
	
	// Login
	$scope.login = function(mail, pass){
		authenticate($scope, $http, $rootScope, $window, mail, pass);
	}
	
	// Logout
	$scope.logout = function(){
		logout($scope, $http, $rootScope);
	}
	
	// Add new user
	$scope.addUser = function(){
		addForm($scope, $http);
		$window.location.href = '#Home';
	}
	$scope.cancelRegistration = function(){
		$window.location.href = '#Home';
	}
	$scope.uploadPhoto = function(){
		addPhoto($scope, $http);
		//console.log('upload clicked');
	}	
	
	//Check email validity for new user
	$scope.validEmail = function(){
		console.log('write here checking email validity function...');
		var email = $("#inputRegisterEmail");
		var emailExists = false;
		if(email.val().trim()!='' && emailExists==false){
			//console.log('email is valid');
		} else {
			//console.log('email is invalid, try another value');
		}
		//checkVal($scope, $http);
	}
	
	// Writing mail
	$scope.sendMail = function(){
		$scope.msg.recipients = filterRecipients($scope.users);
		addMail($scope, $http, $rootScope);
		$scope.recipientReplyId = {};
		$window.location.href = '#Sent';
	}
	$scope.cancelMail = function(){
		$window.location.href = '#Inbox';
	}

	$scope.openMsg = function(id){
		viewMsg($http, $scope, id);
		$window.location.href = '#showMessage';
	}
	$scope.deleteMsg = function(id){
		removeMsg($http, $scope, $rootScope, id);
	}
	
	$scope.replyMail = function(id){
		$scope.recipientReplyId = id;
		$window.location.href = '#New';
		console.log('reply clicked');
	}
	
	var expanded = false;
    $scope.showCheckboxes = function() {
        var checkboxes = document.getElementById("checkboxes");
        if (!expanded) {
            checkboxes.style.display = "block";
            expanded = true;
        } else {
            checkboxes.style.display = "none";
            expanded = false;
        }
    }
    $scope.hideCheckboxes = function() {
        var checkboxes = document.getElementById("checkboxes");
        checkboxes.style.display = "none";
    }
	
});




