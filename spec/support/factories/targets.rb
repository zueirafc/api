FactoryGirl.define do
  factory :target do
    association :micropost, factory: :micropost

    trait :with_club do
      association :targetable, factory: :club
    end
  end

  factory :invalid_target, parent: :target do
    micropost nil
    targetable nil
  end
end
