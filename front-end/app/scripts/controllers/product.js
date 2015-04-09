'use strict';

angular.module('frontEndApp')
  .controller('ProductsCtrl', ['$scope','Products', '$routeParams', 'auth', function ($scope, Products, $routeParams, auth) {
  	
  	var userId = $routeParams.id;
  	$scope.products = Products.query({id: userId});
  	
  }]);
