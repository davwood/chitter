Feature: In order to use chitter as a maker

	Scenario: I want to sign up to the service
		Given I am on the home page 
		When I follow "sign-up"
		And fill in the following:
			| email					| davtest@makersacademy.com |
			| username				| davotest					|
			| first_name			| dave 						|
			| last_name				| test						|
			| password				| s3cret					|	
			| password_confirmation	| s3cret					|
		And I press "Sign up"
		Then I should see "Welcome"






	


	




