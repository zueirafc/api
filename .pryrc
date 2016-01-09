require 'factory_girl'

puts 'Loading factories  (FactoryGirl 4.5.0)'
Dir[::File.expand_path('../spec/support/factories/*.rb', __FILE__)].each do |f|
  require f
end

include FactoryGirl::Syntax::Methods
