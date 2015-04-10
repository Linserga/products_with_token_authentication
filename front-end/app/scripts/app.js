'use strict';

angular.module('frontEndApp', ['ngCookies', 'ngMessages', 'ngResource','ngRoute'])
  
  .factory('authInterceptor', ['$q', '$location', function($q, $location){
    return {
      request: function (config){
        config.headers = config.headers || {};
        if(localStorage.auth_token){
          config.headers.token = localStorage.auth_token;
        }
        return config;
      },
      responseError: function (response){
        if(response.status === 401){
          $location.path('/login');
        }
        return $q.reject(response)        
      }
    };
  }])

  .config(function ($httpProvider){
    $httpProvider.interceptors.push('authInterceptor');
  })

  .config(function ($routeProvider) {
    $routeProvider
      .when('/login', {
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl'
      })
      .when('/users/:id/products', {
        templateUrl: 'views/product.html',
        controller: 'ProductsCtrl'
      })
      .when('/users/:id/products/:productId/edit', {
        templateUrl: 'views/edit.html',
        controller: 'EditCtrl'
      })
      .when('/users/:id/products/new', {
        templateUrl: 'views/new.html',
        controller: 'CreateCtrl'
      })
      .otherwise({
        redirectTo: '/login'
      });
  });
