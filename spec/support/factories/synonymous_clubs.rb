FactoryGirl.define do
  factory :synonymous_club do
    name { "#{Forgery('lorem_ipsum').words(1).downcase}" }

    association :club, factory: :club
  end

  factory :invalid_synonymous_club, parent: :synonymous_club do
    name nil

    club nil
  end
end
