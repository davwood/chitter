Given /^One\s+user with first name "([^\"]*)", last name "([^\"]*)", with username "([^\"]*)" and email "([^\"]*)" and password "([^\"]*)"$/ do |first_name,last_name,username,email, password|
 	sign_up(first_name,last_name,email,username,password,password)	
end

Given /^I am an authenticated user$/ do
  name = 'exmample'
  email = 'example@example.com'
  password = 'secret!'
end
# Then /^The heading should be \"([^\"]*)\"$/ do |heading|
# 	find(:xpath, './/h1[1]').text.should match(heading)
# end