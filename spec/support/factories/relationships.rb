FactoryGirl.define do
  factory :relationship do
    follower { build(:user) }
    followed { build(:user) }
  end

  factory :invalid_relationship, parent: :relationship do
    follower nil
    followed nil
  end
end
