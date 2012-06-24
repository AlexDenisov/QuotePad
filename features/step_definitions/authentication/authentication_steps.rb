Given /^Unauthorized (.+?)$/ do | model_name |
  FactoryGirl.create model_name.downcase
end

Given /^Authorized (.+?)$/ do | model_name |
  model = FactoryGirl.create model_name.downcase
  step %{I visit the Sign In page}
  step %{I fill in #{model_name} Email with #{model_name}.email}
  step %{I fill in #{model_name} Password with #{model_name}.password}
  step %{I click on "Sign in"}
end

