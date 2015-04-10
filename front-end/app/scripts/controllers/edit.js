'use strict';

angular.module('frontEndApp')
	.controller('EditCtrl', ['$scope', 'Products', '$location', '$routeParams', function ($scope, Products, $location, $routeParams){

		var userId = $routeParams.id;

		var productId = $routeParams.productId;

		$scope.product = Products.get({id: userId, productId: productId});

		$scope.update = function(){
			Products.update({id: userId, productId: $scope.product.id }, $scope.product);
			$location.path('/users/' + userId + "/products");
		};
	}]);