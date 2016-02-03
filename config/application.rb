require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'

Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller

    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.active_record.raise_in_transactional_callbacks = true
    config.api_only = false
    config.exceptions_app = routes

    I18n.config.enforce_available_locales = false

    Dir.glob(Rails.root.join('config/locales/**/*/')).each do |dir|
      paths['config/locales'] << dir
    end
  end
end
