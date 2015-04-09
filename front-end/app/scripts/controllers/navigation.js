'use strict';

angular.module('frontEndApp').controller('NavCtrl', ['$scope', 'auth', '$location', function ($scope, auth, $location){

	$scope.isLoggedIn = auth.isLoggedIn;

	$scope.logout = function(){
		auth.logout()
			.success(function(){
				localStorage.removeItem('auth_token');
				$location.path('/login');
			})
			.error();
	};
}]);