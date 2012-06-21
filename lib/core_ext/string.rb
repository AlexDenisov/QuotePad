class String
  def capybara_path
    "#{uri_string}_path"
  end
  def capybara_url
    "#{uri_string}_url"
  end
  def uri_string
    self.gsub(' ', '_').downcase
  end
end

