FactoryGirl.define do
  factory :tagged do
    association :micropost, factory: :micropost
    association :synonymous_club, factory: :synonymous_club
  end

  factory :invalid_tagged, parent: :tagged do
    micropost nil
    synonymous_club nil
  end
end
