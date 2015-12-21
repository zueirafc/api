FactoryGirl.define do
  factory :tag do
    name { "#{Forgery('lorem_ipsum').words(1).downcase}" }

    association :club, factory: :club
  end

  factory :invalid_tag, parent: :tag do
    name nil

    club nil
  end
end
