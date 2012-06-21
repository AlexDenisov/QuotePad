source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'jquery-rails'

group :production do 

end

group :development do
end

group :test do 
  gem 'cucumber-rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'guard-cucumber'
end

group :development, :test do 
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
