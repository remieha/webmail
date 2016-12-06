var app = angular.module("mailApp", ["ngRoute"]);

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

var ctrl = app.controller("appCtrl", function($scope, $http, $rootScope) {
	$scope.date = new Date($.now());
//	$rootScope.showavenger = false;
//	$rootScope.showagent = false;
//	$rootScope.affavupd=false;
//	$rootScope.affagupd=false;
//	
//	// Appeler la liste des avengers
//	init_av($scope, $http);
//	
//	// Appeler la liste des agents
//	init_ag($scope, $http);
//	
//	// Supprimer un avenger
//	$scope.delFunc_av = function(id){
//		remove_av(id, $http, $scope);
//	}
//	
//	// Supprimer un agent
//	$scope.delFunc_ag = function(id){
//		remove_ag(id, $http, $scope);
//	}
//	
//	// Show one avenger card
//	$scope.show_av = function(id){
//		getAvenger(id, $scope, $http, $rootScope);
//	}
//	
//	// Hide the card
//	$scope.hideCard = function(){
//		$rootScope.showavenger = false;
//	}
//	
//	// Show one agent card
//	$scope.show_ag = function(id){
//		getAgent(id, $scope, $http, $rootScope);		
//	}
//	
//	// Hide the card
//	$scope.hideAgCard = function(){
//		$rootScope.showagent = false;
//	}
//	
	// Add new user
	$scope.addUser = function(){
		addUser($scope, $http);
	}
	
//	// Add an avenger
//	$scope.addForm_av = function(){
//		add_av($scope, $http, $rootScope);	
//	}
//	
//	// Add an agent
//	$scope.addForm_ag = function(){
//		add_ag($scope, $http);
//	}
//	
//	// Update an avenger
//		// Open Form
//	$scope.show_form_av = function(id){
//		$rootScope.affForm = false;
//		editAvenger(id, $scope, $http, $rootScope);
//	}   // Validate
//	$scope.updForm_av = function(id){
//		upd_av(id, $scope, $http);
//	}   // Cancel form
//	$scope.cancelForm = function(){
//		$rootScope.affavupd=false;
//	}
//	
//	// Update an agent
//		// Open Form
//	$scope.show_form_ag = function(id){
//		editAgent(id, $scope, $http, $rootScope);
//	} 	// Validate
//	$scope.updForm_ag = function(id){
//		upd_ag(id, $scope, $http);
//	}   // Cancel form
//	$scope.cancelFormAg = function(){
//		$rootScope.affagupd=false;
//	}
//	
//	// Add avenger photo
//	$scope.uploadPhotoAv = function(){
//		addAvPhoto($scope, $http);
//	}
	
});




