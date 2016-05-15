module Api
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :post, :delete, :put, :head],
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Link']
      end
    end
  end
end
