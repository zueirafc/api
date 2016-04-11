FactoryGirl.define do
  factory :synonymous_club do
    name { Forgery('lorem_ipsum').words(1).downcase.to_s }

    club { build(:club) }
  end

  factory :invalid_synonymous_club, parent: :synonymous_club do
    name nil

    club nil
  end
end
