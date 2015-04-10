'use strict';

angular.module('frontEndApp')
  .controller('ProductsCtrl', ['$scope','Products', '$routeParams', 'auth', '$location', function ($scope, Products, $routeParams, auth, $location) {
  	
  	var userId = $routeParams.id;
  	$scope.products = Products.query({id: userId});

  	$scope.create = function(){
  		$location.path('/users/' + userId + '/products/new');
  	};

  	$scope.delete = function(product){ 		

  		for(var i = 0; i < $scope.products.length; i++){
  			if($scope.products[i].id === product.id){
  				$scope.products.splice(i, 1);
  				break;
  			}
  		}
  		Products.delete({id: userId, productId: product.id});
  	};

  	$scope.edit = function(product){
  		$location.path('/users/' + userId + '/products/' + product.id + '/edit');
  	};
  	
  }]);
