FactoryGirl.define do
  factory :relationship do
    association :follower, factory: :user
    association :followed, factory: :user
  end

  factory :invalid_relationship do
    follower nil
    followed nil
  end
end
