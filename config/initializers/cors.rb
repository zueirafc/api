module Api
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Link'],
          methods: [:get, :post, :options, :delete, :put]
      end
    end
  end
end
