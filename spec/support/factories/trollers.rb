FactoryGirl.define do
  factory :troller do
    micropost { build(:micropost) }

    trait :with_club do
      trollerable { build(:club) }
    end
  end

  factory :invalid_troller, parent: :troller do
    micropost nil
    trollerable nil
  end
end
