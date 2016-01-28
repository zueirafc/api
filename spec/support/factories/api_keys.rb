FactoryGirl.define do
  factory :api_key do
    access_token { SecureRandom.hex(12) }
  end
end
