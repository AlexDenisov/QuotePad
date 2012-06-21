And /^I fill in (.+?) with "(.+?)"$/ do | text_field, text |
  fill_in text_field.capybara_name, :with => text
end

And /^I click on (.+?)$/ do | clickable_element |
  click_on clickable_element
end

And /^I should see errors$/ do
  puts page.body
  page.should have_selector 'error'
end
