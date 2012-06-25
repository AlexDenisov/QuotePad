And /^I fill in (.+?) with (\w+).(\w+)$/ do | text_field, model_name, property_name | 
  model = FactoryGirl.build model_name.downcase
  text = model.send property_name
  step %{I fill in #{text_field} with "#{text}"}
end

And /^I fill in (.+?) with "(.*?)"$/ do | text_field, text |
  fill_in text_field.capybara_name, :with => text
end

And /^I click on "(.+?)"$/ do | clickable_element |
  click_on clickable_element
end

Then /^I should not have "(.+?)" on the page$/ do | css |
  page.should_not have_selector(css)
end

Then /^I should have "(.+?)" on the page$/ do | css |
  page.should have_selector(css)
end

Then /^I should see "(.+?)"$/ do | html |
  page.should have_content(html)
end

When /^I select (.+?) (.+?)$/ do | option, from |
  select(option, :from => from.capybara_name)
end

