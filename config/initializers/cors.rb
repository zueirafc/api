Rails.application.config.middleware.insert_before 0, "Rack::Cors" do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

# module YourApp
#   class Application < Rails::Application
#     config.middleware.use Rack::Cors do
#       allow do
#         origins '*'
#         resource '*',
#           :headers => :any,
#           :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
#           :methods => [:get, :post, :options, :delete, :put]
#       end
#     end
#   end
# end
