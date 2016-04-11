FactoryGirl.define do
  factory :target do
    micropost { build(:micropost) }

    trait :with_club do
      targetable { build(:club) }
    end
  end

  factory :invalid_target, parent: :target do
    micropost nil
    targetable nil
  end
end
