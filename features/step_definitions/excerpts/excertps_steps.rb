Then /^I should see (\d+) (.+?) link under "(.+?)"$/ do |count, link_name, css_selector|
  selectors = all(css_selector)
  selectors.count.should_not be(0)
  links_count = 0
  selectors.each do | selector |
    begin
      selector.find_link(link_name)
      links_count = links_count + 1
    rescue Capybara::ElementNotFound => ex
    end
    links_count.should be(count.to_i)
  end
end

Then /^I should see rating (\-?\d+)$/ do |rating|
  page.find('span.rating').text.to_i == rating.to_i
end

And /^I wait (\d+) seconds?$/ do |sec|
  sleep(sec.to_i)
end

