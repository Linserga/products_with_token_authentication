'use strict'; 

angular.module('frontEndApp').directive('navbar', function(){
	return {
		restirct: 'E',
		templateUrl: 'views/partials/nav.html',
		controller: 'NavCtrl'
	};
});