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

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:each, type: :controller) do
    @api ||= ApiKey.create!
    credentials = ActionController::HttpAuthentication::Token
                  .encode_credentials(@api.access_token)

    request.headers["HTTP_AUTHORIZATION"] = credentials
  end

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  config.include FactoryGirl::Syntax::Methods

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
end
