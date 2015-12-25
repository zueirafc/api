Devise.setup do |config|
  config.secret_key = 'f1783f4875d87567bb0587749efa76293b35effff111ba4ce38e871b45ec76009587eeaa1f61e26f74f4831662cdea458ea98367fc4c34b23df09033f8638b16'
  config.authentication_keys = [:email, :username]
end
