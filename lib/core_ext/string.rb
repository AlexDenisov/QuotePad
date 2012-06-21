class String
  def capybara_path
    "#{capybara_name}_path"
  end
  def capybara_url
    "#{capybara_name}_url"
  end
  def capybara_name
    self.gsub(' ', '_').downcase
  end
end

