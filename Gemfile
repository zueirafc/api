source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'rails-api'

gem 'acl9'
gem 'pg'
gem 'responders'
gem 'passenger'
gem 'active_model_serializers', '0.10.0.rc3'
gem 'rack-cors'

gem 'carrierwave'
gem 'cloudinary'
gem 'carrierwave-base64'

# authentication
gem 'devise_token_auth'
# gem 'omniauth-facebook'
# gem 'omniauth-google-oauth2'

group :test, :development do
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-migrate'
  gem 'guard-livereload'
  gem 'guard-rubocop'
  gem 'guard-zeus'
  gem 'zeus'
  gem 'thor'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'forgery'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  gem 'rails_12factor'
end
