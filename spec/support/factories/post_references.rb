FactoryGirl.define do
  factory :post_reference do
    association :micropost, factory: :micropost
    association :user, factory: :user
  end

  factory :invalid_post_reference, parent: :post_reference do
    micropost nil
    user nil
  end
end
