FactoryGirl.define do
  factory :troller do
    association :micropost, factory: :micropost

    trait :with_club do
      association :trollerable, factory: :club
    end
  end

  factory :invalid_troller, parent: :troller do
    micropost nil
    trollerable nil
  end
end
