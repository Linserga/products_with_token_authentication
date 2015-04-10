'use strict';

angular.module('frontEndApp')
	.factory('Products', ['$resource', function ($resource){
		return $resource('api/users/:id/products/:productId', {id: '@id', productId: '@productId' }, { 'update': { method: 'PATCH'}});
	}]);