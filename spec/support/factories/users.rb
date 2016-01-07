FactoryGirl.define do
  factory :user do
    username { Forgery('internet').user_name }
    email { Forgery('internet').email_address }
    name { Forgery('name').full_name }
    password { 'my password is much bigger!' }
    image { Forgery('lorem_ipsum').words(2) }
    provider { Forgery('lorem_ipsum').words(2) }
    uid { Forgery('basic').password }

    association :club, factory: :club
  end

  factory :invalid_user, parent: :user do
    username nil
    email nil
    name nil
    password nil
    image nil

    club nil
  end
end
