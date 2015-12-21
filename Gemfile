source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'rails-api'

gem 'acl9'
gem 'pg'
gem 'responders'
gem 'passenger'
gem 'active_model_serializers'

group :test, :development do
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
