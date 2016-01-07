FactoryGirl.define do
  factory :post_reference do
    association :micropost, factory: :micropost

    trait :with_user do
      association :referenceable, factory: :user
    end

    trait :with_user do
      association :referenceable, factory: :synonymous_club
    end
  end

  factory :invalid_post_reference, parent: :post_reference do
    micropost nil
    referenceable nil
  end
end
