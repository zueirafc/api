source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5'
gem 'rails-api'

gem 'enumerate_it'
gem 'acl9'
gem 'pg'
gem 'responders'
gem 'passenger'
gem 'active_model_serializers'
gem 'rack-cors'

# image upload
gem 'carrierwave', '0.10.0'
gem 'carrierwave-base64'
gem 'mini_magick'
gem 'fog'

# authentication
gem 'devise_token_auth', '0.1.37.beta4'
gem 'omniauth-facebook'

# searches
gem 'twitter'
gem 'instagram'
gem 'koala', '~> 2.0'
gem 'feedjira'

gem 'clockwork'

group :test, :development do
  gem 'pry-rails'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-migrate'
  gem 'guard-livereload'
  gem 'guard-rubocop'
  gem 'guard-zeus'
  gem 'zeus'
  gem 'thor'

  gem 'dotenv'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'forgery'
  gem 'fakeweb', require: false
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  gem 'rails_12factor'
end
