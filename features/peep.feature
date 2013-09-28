Feature: I want to let people know what I am doing

	Scenario: I will post a message to chitter
		Given One user with first name "Dave", last name "Test", with username "davetest" and email "test@test.com" and password "s3cret"
		When I fill in "message" with "New peep!"
		And press "Peep it"
		Then I should see "Welcome"

	# Scenario: I will not be able to post a message if not logged in
	#  	Given I am not logged in
	#  	When I post a message
	#  	Then 
