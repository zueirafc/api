FactoryGirl.define do
  factory :user do
    username { Forgery('lorem_ipsum').words(2) }
    email { Forgery('lorem_ipsum').words(2) }
    name { Forgery('lorem_ipsum').words(2) }
    password { Forgery('lorem_ipsum').words(2) }
    image { Forgery('lorem_ipsum').words(2) }

    association :club, factory: :club
  end

  factory :invalid_user do
    username nil
    email nil
    name nil
    password nil
    image nil

    club nil
  end
end
