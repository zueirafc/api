FactoryGirl.define do
  factory :micropost do
    text { Forgery('lorem_ipsum').text }

    association :user, factory: :user
  end

  factory :invalid_micropost do
    text nil

    user nil
  end
end
