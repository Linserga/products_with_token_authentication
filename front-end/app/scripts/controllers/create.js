'use strict';

angular.module('frontEndApp')
	.controller('CreateCtrl', ['$scope', 'Products', '$location', '$routeParams', function ($scope, Products, $location, $routeParams){

		var userId = $routeParams.id;
		
		$scope.product = new Products({id: userId});

		$scope.addProduct = function(){
			if($scope.productForm.$valid){
				$scope.product.$save();
				$location.path('users/' + userId + '/products');
			}			
		};
	}]);