Then /^I should see (\d+) Users$/ do | count |
  all('div.user').count == count
end

