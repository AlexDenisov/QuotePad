When /^I visit the (.+?) page$/ do | page_name |
  visit send(page_name.capybara_path)
end

Then /^I should be redirected to (.+?) page$/ do | page_name |
  page.driver.request.env['HTTP_REFERER'].should_not be_nil
  page.driver.request.env['HTTP_REFERER'].should_not == page.current_url
  step %{I should be on the #{page_name} page}
end

Then /^I should be on the (.+?) page$/ do |page_name|
  page.current_path.should == send(page_name.capybara_path)
  page.status_code.should == 200
end

