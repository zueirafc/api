ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'

SimpleCov.configure do
  coverage_dir File.join('.', 'tmp', 'code_analysis', 'coverage')
  minimum_coverage 90
  add_group 'Services', 'app/services'
  add_group 'Serializers', 'app/serializers'
end

SimpleCov.start 'rails' do
  add_filter '/test/'
  add_filter '/lib/'
end

require 'rails/all'
require 'rspec/rails'
require 'factory_girl'
require 'forgery'
require 'shoulda/matchers'
require 'database_cleaner'
require 'fakeweb'
require 'spec_helper'

# for faster rspec start, run: SKIP_MIGRATION=1 rspec
if ENV['SKIP_MIGRATION']
  puts 'MIGRATION SKIPPED!'
else
  ActiveRecord::Migration.maintain_test_schema!
end

FactoryGirl.definition_file_paths = %w(spec/support/factories)
FactoryGirl.reload

require File.expand_path('../../config/environment', __FILE__)

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
  end
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  # config.include ControllerHelpers, type: :controller

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.before(:each, type: :controller) do
    @user ||= create :user
    sign_in @user
    request.headers.merge!(@user.create_new_auth_token)

    # request.headers['HTTP_AUTHORIZATION'] = credentials
  end
end
