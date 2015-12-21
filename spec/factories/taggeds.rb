FactoryGirl.define do
  factory :tagged do
    association :micropost, factory: :micropost
    association :tag, factory: :tag
  end

  factory :invalid_tagged, parent: :tagged do
    micropost nil
    tag nil
  end
end
