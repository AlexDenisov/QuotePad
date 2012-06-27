Then /^I should see (\d+) Users$/ do | count |
  all('div.user').count == count
end

Then /^I click "(.*?)" under (.+?) "(.*?)"$/ do |clickable_element, first_last, css_selector|
  selector = all(css_selector).send(first_last.downcase)
  selector.click_on clickable_element
end

