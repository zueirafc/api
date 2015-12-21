FactoryGirl.define do
  factory :user do
    username { Forgery('lorem_ipsum').words(2) }
    email { Forgery('lorem_ipsum').words(2) }
    name { Forgery('lorem_ipsum').words(2) }
    password { Forgery('lorem_ipsum').words(2) }
    image { Forgery('lorem_ipsum').words(2) }

    association :club, factory: :club
  end
end
