ENV['RAILS_ENV'] ||= 'test'

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'

  SimpleCov.configure do
    coverage_dir File.join('.', 'tmp', 'code_analysis', 'coverage')
  end

  SimpleCov.start 'rails'
end

require 'rails/all'
require 'rspec/rails'
require 'factory_girl'
require 'forgery'
require 'shoulda/matchers'
require 'database_cleaner'
require 'spec_helper'

require File.expand_path('../../config/environment', __FILE__)

# for faster rspec start, run: SKIP_MIGRATION=1 rspec
if ENV['SKIP_MIGRATION']
  puts 'MIGRATION SKIPPED!'
else
  ActiveRecord::Migration.maintain_test_schema!
end

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

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  config.include FactoryGirl::Syntax::Methods

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
end
