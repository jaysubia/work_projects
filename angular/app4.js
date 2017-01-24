var app = angular.module('app4', []);

app.controller("FormController", function(){
	this.submitForm = function(){
		console.log("From submitted...")
	};
});
