FactoryGirl.define do
  factory :relationship do
    association :follower, factory: :user
    association :followed, factory: :user
  end

  factory :invalid_relationship, parent: :relationship do
    follower nil
    followed nil
  end
end
