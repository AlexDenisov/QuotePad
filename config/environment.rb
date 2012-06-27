# Load the rails application
require File.expand_path('../application', __FILE__)

APP_CONFIG = YAML.load_file("#{Rails.root}/config/quotepad.yml")

# Initialize the rails application
QuotePad::Application.initialize!


