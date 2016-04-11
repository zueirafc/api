FactoryGirl.define do
  factory :post_reference do
    association :micropost, factory: :micropost

    trait :with_user do
      referenceable { build(:user) }
    end

    trait :with_user do
      referenceable { build(:synonymous_club) }
    end
  end

  factory :invalid_post_reference, parent: :post_reference do
    micropost nil
    referenceable nil
  end
end
