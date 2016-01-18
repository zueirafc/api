Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  config.action_mailer.default_url_options = { host: 'localhost' }

  config.app_generators.scaffold_controller :responders_controller

  config.generators do |g|
    g.factory_girl dir: 'spec/support/factories'

    g.test_framework :rspec,
                     view_specs: false,
                     request_specs: false,
                     routing_specs: false
  end
end
